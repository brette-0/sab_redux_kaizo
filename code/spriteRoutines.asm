;-------------------------------------------------------------------------------------
;$00 - used for preset value

SpriteShuffler:
               ;ldy AreaType               ;load level type, likely residual code
               ;lda #$28                    ;load preset value which will put it at
               ;sta $00                     ;sprite #10
               ldx #$0e                    ;start at the end of OAM data offsets
ShuffleLoop:   lda SprDataOffset,x         ;check for offset value against
               cmp #$28                     ;the preset value
               bcc NextSprOffset           ;if less, skip this part
               ldy SprShuffleAmtOffset     ;get current offset to preset value we want to add
               clc
               adc SprShuffleAmt,y         ;get shuffle amount, add to current sprite offset
               bcc StrSprOffset            ;if not exceeded $ff, skip second add
               clc
               adc #$28                     ;otherwise add preset value $28 to offset
StrSprOffset:  sta SprDataOffset,x         ;store new offset here or old one if branched to here
NextSprOffset: dex                         ;move backwards to next one
               bpl ShuffleLoop
               ldx SprShuffleAmtOffset     ;load offset
               inx
               cpx #$03                    ;check if offset + 1 goes to 3
               bne SetAmtOffset            ;if offset + 1 not 3, store
               ldx #$00                    ;otherwise, init to 0
SetAmtOffset:  stx SprShuffleAmtOffset
               ldx #$08                    ;load offsets for values and storage
               ldy #$02
SetMiscOffset: lda SprDataOffset+5,y       ;load one of three OAM data offsets
               sta Misc_SprDataOffset-2,x  ;store first one unmodified, but
               clc                         ;add eight to the second and eight
               adc #$08                    ;more to the third one
               sta Misc_SprDataOffset-1,x  ;note that due to the way X is set up,
               clc                         ;this code loads into the misc sprite offsets
               adc #$08
               sta Misc_SprDataOffset,x        
               dex
               dex
               dex
               dey
               bpl SetMiscOffset           ;do this until all misc spr offsets are loaded
               rts

;-------------------------------------------------------------------------------------



