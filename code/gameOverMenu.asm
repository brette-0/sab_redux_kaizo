GameOverCursorData:
  ;.db $5b, $02, $48
  .db $eb, $02, $48

GameOverCursorY:
  .db $77, $8f;, $a7, $bf, $d7

GameOverMenu:
        lda #$00
		sta $02
		ldy VRAM_Buffer1_Offset
		lda #$20
		sta VRAM_Buffer1,y
		lda #$4f
		sta VRAM_Buffer1+1,y
		lda #$02
		sta VRAM_Buffer1+2,y
		lda #$28
		sta VRAM_Buffer1+3,y
		lda #$28
		sta VRAM_Buffer1+4,y
		lda #$00
		sta VRAM_Buffer1+5,y
		tya
		clc
		adc #$04
		sta VRAM_Buffer1_Offset
		lda SavedJoypadBits
			and #A_Button
			bne ContinueOrRetry
			lda SavedJoypadBits          ;if player pressed the start button
            and #Start_Button            ;then either continue or start over
            bne ContinueOrRetry
            lda SavedJoypadBits
            and #Up_Dir                  ;if player pressed the select button
            bne +                        ;then branch to select "continue" or "retry"
			lda SavedJoypadBits
			and #Down_Dir
			beq ChgSel
+:          lda PreviousUp_Down_Buttons
			and #Down_Dir
			bne ChgSel
			lda PreviousUp_Down_Buttons
			and #Up_Dir
			bne ChgSel
			
            lda ContinueMenuSelect
            eor #$01                     ;and toggle between the two choices
            
;            inc ContinueMenuSelect
;            lda ContinueMenuSelect
;            and #$03
            
            sta ContinueMenuSelect
ChgSel:     ldy #$02
ChgSelLoop: lda GameOverCursorData,y     ;set up cursor sprite tile, attribute
            sta Sprite_Data+1,y          ;and X position in sprite OAM data
            dey
            bpl ChgSelLoop
            ldy ContinueMenuSelect
            lda GameOverCursorY,y        ;set Y position based on the selection
            sta Sprite_Data
			lda SavedJoypadBits
			sta PreviousUp_Down_Buttons
            rts

ContinueOrRetry:
  lda ContinueMenuSelect       ;if player selected "continue"
  beq Continue                 ;then branch to continue
  ;lda #$00
  ;sta CompletedWorlds          ;otherwise init completed worlds flags
  inc DoFin
  inc DisableScreenFlag
  rts

Continue:
        ldy #$04
        sty NumberofLives           ;give five lives
        sta CoinTally    
		lda WorldNumber
		asl
	    asl
	    clc
	    adc LevelNumber
	    tax
	    lda LevelSelectAreasOffsets1,x
	    sta AreaNumber       ;put at x-1 of the current world
		lda #$00
        ldy #$0b
ISCont: sta ScoreAndCoinDisplay,y   ;reset score
        dey
        bpl ISCont
        inc Hidden1UpFlag           ;allow 1-up to be found again
		inc DisableScreenFlag
        inc $02
		rts
		
LevelSelectAreasOffsets1:
	  .db $00, $02, $03, $04
	  .db $00, $02, $03, $04
	  .db $00, $01, $02, $03
	  .db $00, $02, $03, $04
	  .db $00, $01, $02, $03
	  .db $00, $01, $02, $03
	  .db $00, $02, $03, $04
	  .db $00, $01, $02, $03

