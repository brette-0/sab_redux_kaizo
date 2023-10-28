PauseRoutine:
             lda OperMode           ;are we in victory mode?
             cmp #VictoryModeValue  ;if so, go ahead
             beq ChkPauseTimer
             cmp #GameModeValue     ;are we in game mode?
             bne ExitPause1          ;if not, leave
             lda OperMode_Task      ;if we are in game mode, are we running game engine?
             cmp #$03
             bne ExitPause1          ;if not, leave
             lda TextboxID
             bne ExitPause1
             lda GamePauseStatus
             and #$01
             beq ChkPauseTimer
             
             lda SetupPause
             bne ChkPauseTimer
             
             sta GamePauseStatus
ChkPauseTimer: 
             ;lda debug              ;check if debug mode is enabled          
             ;beq +                  ;skip the debug routine if not
             jsr DebugModeRoutine    
+:               
             lda GamePauseTimer     ;check if pause timer is still counting down
             beq ChkStart
             dec GamePauseTimer     ;if so, decrement and leave
ExitPause1:
             rts
ChkStart:      lda SavedJoypad1Bits   ;check to see if start is pressed
             and #Start_Button      ;on controller 1
             beq ClrPauseTimer
             lda OldSavedJoypadBits
             and #Start_Button
             bne ClrPauseTimer
             lda GameEngineSubroutine
             cmp #$08
             bne ExitPause
             lda OperMode
             cmp #$02
             beq ExitPause
             lda GamePauseStatus
             bne +
             ldy #$03               ;set pause timer
             sty GamePauseTimer
             dey
             sty BackgroundColorCtrl  ;is set to less than 4
             dey
             sty SetupPause
             dey
             sty PauseSoundBuffer
             jsr GetPlayerColors
             jsr MoveSpritesOffscreen
             jmp RunPauseMenu
UnPause:
+:             
             lda #$00
             sta OldHorizontalScroll
             sta PauseSoundBuffer
             sta SetupPause
             
			 ldy AreaPointer
			 cpy #$03
			 beq ++
             ldy AreaType
             dey
             bne +
             lda BackgroundColorCtrlFP
+:               sta BackgroundColorCtrl
             ;lda Mirror_PPU_CTRL_REG2
             ;eor #%01100000
             ;sta Mirror_PPU_CTRL_REG2
             ;sta PPU_CTRL_REG2
             
 ++:           
             lda WorldNumber
             cmp #$04
             bne +
             lda AreaNumber
             cmp #$03
             bne +
             lda #$01
             sta BackgroundColorCtrl
             
+:               
             
             
             
             jsr GetPlayerColors
             lda #$02
             sta OldNameTableSelect
             lda #$03               ;set pause timer
             sta GamePauseTimer
             lda GamePauseStatus
             tay
             iny                    ;set pause sfx queue for next pause mode
             sty PauseSoundQueue
             eor #%00000001         ;invert d0 and set d7
             ora #%10000000
             bne SetPause           ;unconditional branch
ClrPauseTimer: lda GamePauseStatus    ;clear timer flag if timer is at zero and start button
             and #%01111111         ;is not pressed
SetPause:      sta GamePauseStatus
ExitPause:     rts
DebugModeRoutine:
             
             lda SavedJoypad1Bits    ;check to see if SELECT is pressed
             and #Select_Button      ;on controller 1
             beq Ex                    ;if not don't bother checking more
             
             lda OldSavedJoypadBits
             and #Select_Button
             bne Ex
             
             lda Up_Down_Buttons        ;check to see if UP is pressed
             and #Up_Dir                ;on controller 1
             bne SetSwim
             
             lda Up_Down_Buttons        ;check to see if DOWN is pressed
             and #Down_Dir            ;on controller 1
             bne SetRunOutMusic
             
             lda A_B_Buttons         ;check to see if B is pressed
             and #B_Button           ;on controller 1
             bne ChangePower
             
             lda A_B_Buttons         ;check to see if A is pressed
             and #A_Button           ;on controller 1
             bne Inour
             ;lda #$01
             ;sta    TextboxID
             ;rts
             
             ldx    GrabID
             sta Enemy_Flag,x
             ldy SavedOffset,x
             lda #$00
             sta Saved_isDefeated,y
             
             ;lda GameEngineSubroutine
             ;cmp #$08
             ;bne Ex
             lda GamePauseStatus
             and #$01
             bne Ex
             
             lda GameTimerSetting    ;check if timer setting is 0 to detect pipe intro
             bne Soweback
             dec LevelNumber         ;decrement LevelNumber so we end up on the same level for next area
             
Soweback:
             lda #$01
             sta DisableIntermediate
             
             inc LevelNumber            ;increment level number
             jmp NextArea
SetRunOutMusic:
             ;lda #TimeRunningOutMusic
             ;sta EventMusicQueue     ;load time running out music
             ;inc HurryUp
             rts
Inour:
             lda WorldEndTimer       ;check to see if world end timer expired
             bne Ex                    ;this doesnt do anything (fix?) 
             lda Left_Right_Buttons
             and #Left_Dir
             beq +
             inc WorldNumber
+:      jmp Tumama
Ex:        rts
Swam:
             .db $70, $0a
SetSwim:
             
             lda #$fa
             sta Player_Y_Speed
             ;sta DebugSwim                ;also store here because collision routine sets swimming flag to zero every frame
             ;tay
             ;lda Swam,y
             ;sta VerticalForceDown
             rts
             
ChangePower:
             lda PlayerStatus        ;load player powerup status
             cmp #$02                ;if fiery, set to small
             beq FiretoSmall            
             
             inc PlayerStatus        ;otherwise increment
             lda PlayerStatus        ;load mario status
             sta OldStatus            ;store here to prevent size change animation when hit in fiery mario
             lda PlayerStatus        ;load again (to compare if zero)
             beq Ex                    ;branch if small
             lda #$00
             sta PlayerSize            ;set size to big
             jmp GetPlayerColors        ;jump to change colors
             
FiretoSmall:
             lda #$00
             sta PlayerStatus        ;set status to small
             sta OldStatus
             lda #$01                ;set size to small
             sta PlayerSize
             jmp GetPlayerColors        ;jump to change colors
             
GrabShelltest:
             ldx GrabID
             lda GrabFlag
             beq +
             lda Enemy_ID,x
             cmp #RedKoopaShell
             beq +
             cmp #$05
             bcc +
             lda Enemy_CollisionBits,x
             ora #$01
             sta Enemy_CollisionBits,x
             lda A_B_Buttons
             and #B_Button
             bne +
             sta GrabFlag
+:        lda GrabFlag            ;check if mario is holding anything
             beq Ex                    ;if not, branch to exit
             lda #$00
             sta GrabUp
             sta GrabDown
             jmp GSLoop                ;jump to grab routine
             
             if DPCM
SampleStart: ;sample start addresses LUT
             .db <(sample0 >> 6)
             
SampleLength: ;sample lengths LUT
             .db <((sample0_end - sample0) >> 4)
             endif
             
sndTest:
             
             
             
             
             
             
             
             
             
             
             
             
             if 0
             ldx #$00 ;load sample number into X
             ldy #$0F ;load pitch ($00-$0F) into Y
             ldy #$0c
             lda #$40 ;load starting level ($00-$7F) into a temp variable
             sta $7222
             
             lda #$0F
             sta $4015 ;DPCM disable
             sty $4010 ;Y = pitch
             lda $7222
             sta $4011 ;temp = starting sample level
             lda SampleStart,X
             sta $4012 ;X = sample number
             lda SampleLength,X
             sta $4013
             lda #$1F ;DPCM enable (plays sample)
             sta $4015
             
             
             ;- jmp -
             
             rts
             
             endif
             
