--:			   
			   lda temp1
			   pha
			   lda temp2
			   pha
			   lda temp3
			   pha
			   lda temp4
			   pha
			   lda temp5
			   pha
			   lda temp6
			   pha
			   lda temp7
			   pha
			   lda $00
			   pha
			   lda $01
			   pha
			   lda $02
			   pha
			   lda $07
			   pha
			   lda tempA
			   pha
			  
			   
			   ;lda #$01
			   ;sta FramesMissed		;enable this to compensate the missed frame in the next frame logic (don't)
			   
			   lda #$00 
			   sta JOYPAD_PORT			 ;read joypads so emulators doesn't mark this as lag frame hehe
			   
			   lda JOYPAD_PORT
			   
			   lda #$02                  ;perform spr-ram DMA access on $0200-$02ff
               sta SPR_DMA
			   
			   
			   lda Mirror_PPU_CTRL_REG1  ;never disable NMI
               and #%11111110            ;save all other bits
			   ldy DecodingLevel
			   beq +
			   and #%11111100
+:             sta Mirror_PPU_CTRL_REG1
               sta PPU_CTRL_REG1         ;(essentially $2000) but save other bits
			   
			   lda #$00
			   sta PPU_SCROLL_REG
			   sta PPU_SCROLL_REG
			   
			   lda #$01					 ;set irq registers
			   sta $e000
			   lda #$1f
			   sta $c000
			   sta $c001
			   lda #$01
			   sta $e000
			   sta $e001
			   inc IRQAckFlag
			   
			   lda Old8000
			   pha
			   
			   jsr handleSound
			   jsr MakeParallax
			   
			   pla
			   sta $8000
			   
			   pla
			   sta tempA
			   pla
			   sta $07
			   pla
			   sta $02
			   pla 
			   sta $01
			   pla
			   sta $00
			   pla 
			   sta temp7
			   pla
			   sta temp6
			   pla
			   sta temp5
			   pla
			   sta temp4
			   pla
			   sta temp3
			   pla
			   sta temp2
			   pla 
			   sta temp1
			   
			   
			   pla
			   tay
			   pla
			   tax
			   pla
			   rti
-: jmp --

NonMaskableInterrupt:
			   pha
			   txa
			   pha
			   tya
			   pha
			   
			   
			   lda HorizontalScroll
			   sta OldHorizontalScroll
			   lda VerticalScroll
			   sta OldVerticalScroll
			   lda NameTableSelect
			   sta OldNameTableSelect
			   
			   lda dontchecklag
			   bne +
			   lda lagframedetect
			   bne -
				
+:		        
			   pla
			   pla
			   pla
			   
			   lda TextboxID
			   beq +
			        jsr MakeParallax			;do sub to check if parallax level type and set if so if the textbox is not displaying
+:             
			   lda #$01
			   sta lagframedetect
               lda Mirror_PPU_CTRL_REG1
			   and #%11111110
			   sta PPU_CTRL_REG1         ;(essentially $2000) but save other bits
			   lda Mirror_PPU_CTRL_REG2  ;disable OAM and background display by default
               and #%11100110
			   ldy DisableScreenFlag     ;get screen disable flag
               bne ScreenOff             ;if set, used bits as-is
               lda Mirror_PPU_CTRL_REG2  ;otherwise reenable bits and save them
               ora #%00011110
ScreenOff:     sta Mirror_PPU_CTRL_REG2  ;save bits for later but not in register at the moment
               and #%11100111            ;disable screen for now
               sta PPU_CTRL_REG2
               ldx PPU_STATUS            ;reset flip-flop and reset scroll registers to zero
               lda #$00
               sta PPU_SCROLL_REG        ;store contents of A into scroll registers
               sta PPU_SCROLL_REG        ;and end whatever subroutine led us here
               sta PPU_SPR_ADDR          ;reset spr-ram address register
               lda #$02                  ;perform spr-ram DMA access on $0200-$02ff
               sta SPR_DMA
			   ldx VRAM_Buffer_AddrCtrl  ;load control for pointer to buffer contents
               lda VRAM_AddrTable_Low,x  ;set indirect at $00 to pointer
               sta $00
               lda VRAM_AddrTable_High,x
               sta $01
               jsr UpdateScreen          ;update screen with buffer contents
               ldy #$00
               ldx VRAM_Buffer_AddrCtrl  ;check for usage of $0341
               cpx #$06
               bne InitBuffer
               iny                       ;get offset based on usage
InitBuffer:    ldx VRAM_Buffer_Offset,y
               lda #$00                  ;clear buffer header at last location
               sta VRAM_Buffer1_Offset,x        
               sta VRAM_Buffer1,x
               sta VRAM_Buffer_AddrCtrl  ;reinit address control to $0301
               lda Mirror_PPU_CTRL_REG2  ;copy mirror of $2001 to register
               sta PPU_CTRL_REG2
			   lda IRQDisable
			   beq +
				   lda #$1f
				   sta $c000
				   sta $c001
				   sta $e001
				   inc IRQAckFlag			 
+:			   cli
			   if SOUND
					jsr handleSound
               endif
			   jsr ReadJoypads           ;read joypads
               jsr PauseRoutine          ;handle pause
               
			   ldx #$05                 ;start with mario's score

TopScoreCheck:
               ldy #$05                 ;start with the lowest digit
               sec           
GetScoreDiff:  lda PlayerScoreDisplay,x ;subtract each player digit from each high score digit
               sbc TopScoreDisplay,y    ;from lowest to highest, if any top score digit exceeds
               dex                      ;any player digit, borrow will be set until a subsequent
               dey                      ;subtraction clears it (player digit is higher than top)
               bpl GetScoreDiff      
               bcc NoTopSc              ;check to see if borrow is still set, if so, no new high score
               inx                      ;increment X and Y once to the start of the score
               iny
CopyScore:     lda PlayerScoreDisplay,x ;store player's score digits into high score memory area
               sta TopScoreDisplay,y
               inx
               iny
               cpy #$06                 ;do this until we have stored them all
               bcc CopyScore
NoTopSc:      
			   lda SetupPause
			   beq +
				   jsr RunPauseMenu
+:             lda GamePauseStatus       ;check for pause status
               lsr
               bcs NoDecTimers
               lda TimerControl          ;if master timer control not set, decrement
               beq DecTimers             ;all frame and interval timers
               dec TimerControl
               bne NoDecTimers
DecTimers:     ldx #$14                  ;load end offset for end of frame timers
               dec IntervalTimerControl  ;decrement interval timer control,
               bpl DecTimersLoop         ;if not expired, only frame timers will decrement
               lda #$14
               sta IntervalTimerControl  ;if control for interval timers expired,
               ldx #$23                  ;interval timers will decrement along with frame timers
DecTimersLoop: lda Timers,x              ;check current timer
               beq SkipExpTimer          ;if current timer expired, branch to skip,
               dec Timers,x              ;otherwise decrement the current timer
SkipExpTimer:  ;ldy FramesMissed
			   ;beq +
			   ;lda Timers,x
			   ;beq +
			   ;dec Timers,x
+:			   dex                       ;move onto next timer
               bpl DecTimersLoop         ;do this until all timers are dealt with
NoDecTimers:   inc FrameCounter          ;increment frame counter
PauseSkip:     jsr RNG
			   jsr RunStuff				 ;run the bankswitch thingy and the code of the bank 01
			   lda TextboxID
			   bne +
					jsr MakeParallax			 ;do sub to check if parallax level type and set if so 
+:             lda GamePauseStatus       ;if in pause mode, do not bother with sprites at all
               lsr
               bcs SkipMainOper
			   lda IRQDisable  		 	 ;check for flag here
               beq SkipThisThing
               jsr MoveSpritesOffscreen
			   jsr SpriteShuffler
SkipThisThing: 
			   ;lda FinishedDemo
			   ;cmp #$07
			   ;bcs SkipMainOper
			   jsr OperModeExecutionTree ;otherwise do one of many, many possible subroutines
			  
+	  
SkipMainOper:  lda #$00
			   sta lagframedetect
			   lda PPU_STATUS
			   ;lda Mirror_PPU_CTRL_REG1
               ;ora #%10000000            ;reactivate NMIs
			   ;sta Mirror_PPU_CTRL_REG1
               ;sta PPU_CTRL_REG1
			   rti                       ;we are done until the next frame!

;-------------------------------------------------------------------------------------

	