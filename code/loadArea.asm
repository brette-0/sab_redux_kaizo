             
             
WorldNumberOffset:
             .db W1-BankLevelOffset
             .db W2-BankLevelOffset
             .db W3-BankLevelOffset
             .db W4-BankLevelOffset
             .db W5-BankLevelOffset
             .db W6-BankLevelOffset
             .db W7-BankLevelOffset
             .db W8-BankLevelOffset
             .db W9-BankLevelOffset
BankLevelOffset:
W1:	.db $00, $00, $00, $00, $00
W2: .db $00, $00, $01, $01, $01
W3: .db $01, $01, $02, $02
W4: .db $02, $02, $02, $03
W5:	.db $03, $03, $03, $03
W6: .db $04, $04, $04, $04
W7:	.db $04, $05, $05, $05, $05
W8: .db $05, $06, $06, $06
W9: .db $06, $00, $06, $07, $07
             
LoadAreaPointerR:
             lda WorldNumber
             tax
             lda WorldNumberOffset,x
             clc
             adc AreaNumber
             tax
             lda BankLevelOffset,x
             sta LevelBank
             lda #%10000111
             sta Old8000
             sta $8000
             lda LevelBank
             asl
             clc
             adc #FirstLevelBank ;replace for adc to enable
             sta $8001
             jsr FindAreaPointer  ;find it and store it here
             sta AreaPointer
GetAreaType: if ExLVLID == 1
             and #%11000000       ;mask out all but d6 and d5
             asl
             rol
             rol
             else
             and #%01100000       ;mask out all but d6 and d5
             asl
             rol
             rol
             rol                             ;make %0xx00000 into %000000xx
             endif
             sta AreaType         ;save 2 MSB as area type
             rts
             
FindAreaPointer:
             lda WorldNumber        ;load offset from world variable
             ;and #%00000111
             tay
             lda WorldAddrOffsets,y
             clc                    ;add area number used to find data
             adc AreaNumber
             tay
             lda AreaAddrOffsets,y  ;from there we have our area pointer
             rts
             
             
GetAreaDataAddrsR:
             lda #%10000111
             sta Old8000
             sta $8000
             lda AreaPointer
             cmp #$45
             bne +
             lda #$00
             sta LevelBank
+:            lda LevelBank
             clc
             adc #FirstLevelBank
             sta $8001
             lda AreaPointer          ;use 2 MSB for Y
             jsr GetAreaType
             tay
             lda AreaPointer          ;mask out all but 5 LSB
             and #%00111111
             sta AreaAddrsLOffset     ;save as low offset
             lda EnemyAddrHOffsets,y  ;load base value with 2 altered MSB,
             clc                      ;then add base value to 5 LSB, result
             adc AreaAddrsLOffset     ;becomes offset for level data
             tay
             lda EnemyDataAddrLow,y   ;use offset to load pointer
             sta EnemyDataLow
             lda EnemyDataAddrHigh,y
             sta EnemyDataHigh
             
             if IMPORT_LEVELS == 1
             ; fix the pointers to match original file
             sec
             lda EnemyDataLow
             sbc #<LevelDataOffset
             sta EnemyDataLow
             lda EnemyDataHigh
             sbc #>LevelDataOffset
             sta EnemyDataHigh
             endif
             
             ldy AreaType             ;use area type as offset
             lda AreaDataHOffsets,y   ;do the same thing but with different base value
             clc
             adc AreaAddrsLOffset
             tay
             lda AreaDataAddrLow,y    ;use this offset to load another pointer
             sta AreaDataLow
             lda AreaDataAddrHigh,y
             sta AreaDataHigh
             
             if IMPORT_LEVELS == 1
             ; fix the pointers to match original file
             sec
             lda AreaDataLow
             sbc #<LevelDataOffset
             sta AreaDataLow
             lda AreaDataHigh
             sbc #>LevelDataOffset
             sta AreaDataHigh
             endif
             
             ldy #$00                 ;load first byte of header
             lda (AreaData),y     
             pha                      ;save it to the stack for now
             and #%00000111           ;save 3 LSB for foreground scenery or bg color control
             cmp #$04
             bcc StoreFore
             sta BackgroundColorCtrl  ;if 4 or greater, save value here as bg color control
             lda #$00
StoreFore:  sta ForegroundScenery    ;if less, save value here as foreground scenery
             pla                      ;pull byte from stack and push it back
             pha
             and #%00111000           ;save player entrance control bits
             lsr                      ;shift bits over to LSBs
             lsr
             lsr
             sta PlayerEntranceCtrl   ;save value here as player entrance control
             pla                      ;pull byte again but do not push it back
             and #%11000000           ;save 2 MSB for game timer setting
             clc
             rol                      ;rotate bits over to LSBs
             rol
             rol
             sta GameTimerSetting     ;save value here as game timer setting
             iny
             lda (AreaData),y         ;load second byte of header
             pha                      ;save to stack
             and #%00001111           ;mask out all but lower nybble
             sta TerrainControl
             pla                      ;pull and push byte to copy it to A
             pha
             and #%00110000           ;save 2 MSB for background scenery type
             lsr
             lsr                      ;shift bits to LSBs
             lsr
             lsr
             sta BackgroundScenery    ;save as background scenery
             pla           
             and #%11000000
             clc
             rol                      ;rotate bits over to LSBs
             rol
             rol
             cmp #%00000011           ;if set to 3, store here
             bne StoreStyle           ;and nullify other value
             sta CloudTypeOverride    ;otherwise store value in other place
             lda #$00
StoreStyle: sta AreaStyle
             lda AreaDataLow          ;increment area data address by 2 bytes
             clc
             adc #$02
             sta AreaDataLow
             lda AreaDataHigh
             adc #$00
             sta AreaDataHigh
             rts
