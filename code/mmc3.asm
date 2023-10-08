MMC3Setup:
             lda #$80
             sta Old8000
             sta $8000
             lda #$00
             sta $8001
             sta $a000
             ;lda #$1f
             ;sta $c000
             ;lda #$00
             sta $c001
             sta $e000
             lda #%10000000
             sta $a001
             lda #$01                ;set on block by default
             sta OnOffBits
             sta OnOffCb
             ldx #$05
             ldy #$85
LoopMMC3Setup:
             sty Old8000
             sty $8000
             lda MMC3SetupTable,x
             sta $8001
             dey
             dex
             bpl LoopMMC3Setup
             lda #$60
             sta $01
             lda #$00
             sta $00
             ldx #$1e
             ldy #$00
-:         sta ($00),y
             iny
             bne -
             inc $01
             dex
             bpl -
             lda #$66
             sta $f8
             lda #$02
             sta SettingSelec
             lda SavedWord
             cmp #$69
             bne +
             lda SavedWord+1
             cmp #$42
             bne +
             lda SavedWord+2
             cmp #69
             bne +
             ;lda #$20
             ;sta $7f03
             ;lda #$80
             ;sta $ff
             rts
+:         ldx #$00     
-:         lda #$00
             sta SavedScore,x
             inx
             bne -
             lda #$69
             sta SavedWord
             lda #$42
             sta SavedWord+1
             lda #69
             sta SavedWord+2
             lda #$02
             sta FirstFrame
             inc FirstBootFlag
             rts
MMC3SetupTable:
             .db $00, $02, $04, $05, $06, $07
             
             
             
             
setCHR:
             ;lda #$00
             ;sta Old8000
             ;sta $8000
             ;lda CHR0
             ;sta $8001
             
             ;lda #$01
             ;sta Old8000
             ;lda CHR1
             ;sta $8001
             
             ;lda #$02
             ;sta Old8000
             ;sta $8000
             ;lda CHR2
             ;sta $8001
             
             lda #$83
             sta Old8000
             sta $8000
             lda CHR3
             sta LastCHR3
             sta $8001
             
             ;lda #$84
             ;;sta $8000
             ;lda CHR4
             ;sta $8001
             
             ldx OnOffBits
             lda AreaType
             bne +
             tax
             axs #-4
+:    lda OnOffCb,x    ;load depending of on block and pswitch flag
             tay
             lda #$85
             sta Old8000
             sta $8000
             tya
             sta $8001
             
             ;lda #$05
             ;sta Old8000
             ;sta $8000
             ;lda CHR5
             ;sta $8001
             rts
             
setLeftCHR:
             tax
             stx CHR0
             inx
             inx
             stx CHR1
             jmp setCHR
             
setRightCHR:
             tax
             stx CHR2
             inx
             stx CHR3
             inx
             stx CHR4
             inx
             stx CHR5
             jmp setCHR
             
setLeftCHRDirect:
             tax
             lda #$80
             sta Old8000
             sta $8000
             stx $8001
             
             lda #$81
             sta Old8000
             sta $8000
             inx
             inx
             stx $8001
             rts
             
             
setRightCHRDirect:
             tax
             lda #$82
             sta Old8000
             sta $8000
             stx $8001
             
             lda #$83
             sta Old8000
             sta $8000
             inx
             stx $8001
             
             lda #$84
             sta Old8000
             sta $8000
             inx
             stx $8001
             
             lda #$85
             sta Old8000
             sta $8000
             inx
             stx $8001
             rts