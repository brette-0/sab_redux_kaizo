             
             include code\numbers.asm      
             
             
             
OperModeExecutionTree:
             lda DoFin
             beq +
             lda #$80
             sta GamePauseStatus
             lda #$00
             sta PauseModeFlag
             sta PauseSoundBuffer
             sta SetupPause
             sta PauseSoundQueue
             sta DoFin
             jmp TerminateGame
+:               
             lda OperMode     ;this is the heart of the entire program,
             if shufflelevels == 1
             cmp #$04
             bcc +
             lda #$01
             sta OperMode
+:
             endif
             jsr JumpEngine   ;most of what goes on starts here
             
             .dw TitleScreenMode
             .dw GameMode
             .dw VictoryMode
             .dw GameOverMode
             
             
             if SKIP_TITLE
StartGameNoTitle:
             jsr PrimaryGameSetup
             jsr ResetTitle
             jmp StartWorld1
             endif
             
TitleScreenMode:
             lda OperMode_Task
             jsr JumpEngine
             
             .dw InitializeGame
             .dw ScreenRoutines
             .dw MenuContinue
             .dw PrimaryGameSetup
             if SKIP_TITLE
             .dw StartGame
             else
             .dw GameMenuRoutine
             endif
             
ContinueWord:
             .db $0a, $22, $8b, $08, $24, $24, $24, $24, $24, $24, $24, $24, $00
WSelectBufferTemplate:
             .db $07, $20, $73, $04, $00, $28, $01, $00, $00
NullJoypadJMP:
             jmp NullJoypad
             
MenuContinue:
             lda FirstFrame
             beq +
             dec FirstFrame
             ldx #$00
-:              lda ContinueWord,x ;write template for world select in vram buffer
             sta VRAM_Buffer1-1,x        ;do this until all bytes are written
             inx
             cmp #$00
             bne -
+:              inc OperMode_Task
             rts
             
GameMenuRoutine:
             ldy #$00
             sty Averveamos
             lda SavedJoypad1Bits        ;check to see if either player pressed
             cmp #Start_Button
             bne ChkSelect     
StartGame:    lda OldSavedJoypadBits
             and #Start_Button
             bne +
             lda SavedJoypad1Bits
             jmp ChkContinue             ;if either start or A + start, execute here
+:              lda SavedJoypad1Bits
ChkSelect:    cmp #A_Button
             bne +
             lda SelectTimer             ;check select/B button timer
             bne NullJoypadJMP           ;if not expired, branch
             lda #$10                    ;otherwise reset select button timer
             sta SelectTimer
             lda HardModeFlag
             eor #$01
             sta HardModeFlag
             lda #$04
             sta VRAM_Buffer1-1
             lda #$20
             sta VRAM_Buffer1
             lda #$76
             sta VRAM_Buffer1+1
             lda #$01
             sta VRAM_Buffer1+2
             ldy HardModeFlag
             lda HardModeDisplay,y
             sta VRAM_Buffer1+3
             lda #$00
             sta VRAM_Buffer1+4
             jmp NullJoypad
+:              
             cmp #Select_Button+Start_Button+A_Button
             bne +
             ldy #$00
             tya
-:                        sta SavedScore,y
             iny
             bpl -
             ldy #$05
-:                        sta PlayerScoreDisplay,y
             dey
             bne -
             ldy #$03
-:                        sta PlayerCoinDisplay,y
             dey
             bne -
             inc FirstFrame
             inc DoFin
             inc DisableScreenFlag
             inc FirstBootFlag
             jmp UpdateShroom
+:            
             cmp #Select_Button          ;check to see if the select button was pressed
             beq SelectLogic             ;if so, branch reset demo timer
             cmp #Up_Dir
             beq SelectLogic
             cmp #Down_Dir
             beq SelectLogic
             ;ldx DemoTimer               ;otherwise check demo timer
             ;bne ChkWorldSel             ;if demo timer not expired, branch to check world selection
             ;sta SelectTimer             ;set controller bits here if running demo
             ;jsr DemoEngine              ;run through the demo actions
             ;bcs ResetTitle              ;if carry flag set, demo over, thus branch
             ;jmp Rundemo                 ;otherwise, run game engine for demo
ChkWorldSel:  ldx WorldSelectEnableFlag   ;check to see if world selection has been enabled
             beq NullJoypad
             cmp #B_Button               ;if so, check to see if the B button was pressed
             bne NullJoypad
             iny                         ;if so, increment Y and execute same code as select
SelectLogic:  ;lda DemoTimer               ;if select or B pressed, check demo timer one last time
             ;beq ResetTitle              ;if demo timer expired, branch to reset title screen mode
             ;lda #$18                    ;otherwise reset demo timer
             ;sta DemoTimer
             lda SelectTimer             ;check select/B button timer
             ora FirstBootFlag
             bne NullJoypad              ;if not expired, branch
             lda #$10                    ;otherwise reset select button timer
             sta SelectTimer
             cpy #$01                    ;was the B button pressed earlier?  if so, branch
             beq IncWorldSel             ;note this will not be run if world selection is disabled
             ;inc CurrentPlayer
             lda TitleScreenSelect           ;if no, must have been the select button, therefore
             eor #$01
             sta TitleScreenSelect
+:
             jsr DrawMushroomIcon
             jmp NullJoypad
IncWorldSel:  
             ldx LevelSelectNumber
             inx
             cpx #$04
             bcs +
             stx LevelSelectNumber
             lda WorldSelectNumber
             jsr GoContinue
             ldx #$00
             jmp UpdateShroom
+:              inc WorldSelectNumber       ;increment world select number
             lda WorldSelectNumber
             cmp #$09
             bcc +
             lda #$00
             sta WorldSelectNumber
+:              ldx #$00
             stx LevelSelectNumber
             jsr GoContinue
             ldx #$00
UpdateShroom: lda WSelectBufferTemplate,x ;write template for world select in vram buffer
             sta VRAM_Buffer1-1,x        ;do this until all bytes are written
             inx
             cpx #$09
             bmi UpdateShroom
             ldy WorldNumber             ;get world number from variable and increment for
             iny                         ;proper display, and put in blank byte before
             sty VRAM_Buffer1+3          ;null terminator
             ldy LevelNumber
             iny
             sty VRAM_Buffer1+5
             ldy HardModeFlag
             lda HardModeDisplay,y
             sta VRAM_Buffer1+6
NullJoypad:   lda SavedJoypad1Bits
             sta OldSavedJoypadBits
             lda #$00                    ;clear joypad bits for player 1
             sta SavedJoypad1Bits
RunDemo:      jsr GameCoreRoutine         ;run game engine
             lda GameEngineSubroutine    ;check to see if we're running lose life routine
             cmp #$06
             bne ExitMenu1                ;if not, do not do all the resetting below
ResetTitle:   lda #$00                    ;reset game modes, disable
             sta OperMode                ;sprite 0 check and disable
             sta OperMode_Task           ;screen output
             sta IRQDisable
             inc DisableScreenFlag
ExitMenu1:
             rts
             
SizeTable: .db $01, $00, $00
OldStatusTable:
             .db $00, $00, $01
             
ChkContinue:  lda #$00
             sta FirstBootFlag
             lda TitleScreenSelect
             beq StartWorld1
             
             lda ContinuePwrup
             sta PlayerStatus
             tay
             lda SizeTable,y
             sta PlayerSize
             lda OldStatusTable,y
             sta OldStatus
             
             lda ContinueCoinTally
             sta CoinTally
             
             lda WorldSelectEnableFlag
             bne StartWorld1
             
             lda ContinueLevel
             sta LevelNumber
             lda ContinueWorld           ;load previously saved world number for secret
             sta WorldNumber
             
             asl
             asl
             clc
             adc LevelNumber
             tax
             lda LevelSelectAreasOffsets,x
             sta AreaNumber
StartWorld1:  jsr LoadAreaPointer
             lda #$10
             sta StartTimer
             inc Hidden1UpFlag           ;set 1-up box flag for both players
             inc FetchNewGameTimerFlag   ;set fetch new game timer flag
             inc OperMode                ;set next game mode
             inc DisableScreenFlag
             lda #$00
             sta OperMode_Task           ;set game mode here, and clear demo timer
             sta DemoTimer
             lda TitleScreenSelect
             bne ExitMenu
             ldx #$17
             lda #$00
InitScores:   sta ScoreAndCoinDisplay,x   ;clear player scores and coin displays
             dex
             bpl InitScores
ExitMenu:     rts
             
             
GoContinue:   sta WorldNumber             ;start both players at the first area
             sta OffScr_WorldNumber      ;of the previously saved world number
             stx LevelNumber
             asl
             asl
             clc
             adc LevelNumber
             tax
             lda LevelSelectAreasOffsets,x
             
             sta AreaNumber              ;will make no difference
             sta OffScr_AreaNumber   
             rts
             if START_WORLD >0
StartWorldCustom:
             lda #START_WORLD-1
             sta WorldNumber
             lda #START_LEVEL-1
             sta LevelNumber
             
             lda WorldNumber
             ;sta OffScr_WorldNumber
             lda WorldNumber-OnscreenPlayerInfo
             jsr CopyToAllPlayers
             
             
             asl
             asl
             clc
             adc LevelNumber
             tax
             lda LevelSelectAreasOffsets,x
             sta AreaNumber
             ;sta OffScr_AreaNumber
             lda AreaNumber-OnscreenPlayerInfo
             jmp CopyToAllPlayers
             endif
             
MushroomIconData:
             .db $07, $22, $49, $83, $ce, $24, $24, $00
             
DrawMushroomIcon:
             ldy #$07                ;read eight bytes to be read by transfer routine
IconDataRead: lda MushroomIconData,y  ;note that the default position is set for a
             sta VRAM_Buffer1-1,y    ;1-player game
             dey
             bpl IconDataRead
             lda VRAM_Buffer1
             sta temp2
             lda TitleScreenSelect       ;check number of players
             beq ExitIcon            ;if set to 1-player game, we're done
             lda #$24                ;otherwise, load blank tile in 1-player position
             sta VRAM_Buffer1+3
             lda #$ce                ;then load shroom icon tile in 2-player position
             sta VRAM_Buffer1+5
ExitIcon:     rts
             
             
VictoryMode:
             jsr VictoryModeSubroutines  ;run victory mode subroutines
             lda OperMode_Task           ;get current task of victory mode
             beq AutoPlayer              ;if on bridge collapse, skip enemy processing
             ldx #$00
             stx ObjectOffset            ;otherwise reset enemy object offset 
             jsr EnemiesAndLoopsCore     ;and run enemy code
AutoPlayer: jsr RelativePlayerPosition  ;get player's relative coordinates
             jmp PlayerGfxHandler        ;draw the player, then leave
             
VictoryModeSubroutines:
             lda OperMode_Task
             jsr JumpEngine
             
             .dw BridgeCollapse
             .dw SetupVictoryMode
             .dw PlayerVictoryWalk
             .dw PrintVictoryMessages
             .dw EndCastleAward
             .dw PlayerEndWorld
             .dw WipeTheFuckingScreen
             .dw DisplayCredits
             .dw WriteCredits
             .dw Nothing
             .dw CheckForThing
             
Okso:
             ;.dw "CREDITS TO"-55
             ;.dw "TEST - TEST"-55
WipeTheFuckingScreen:
             jsr InitScreen
             inc test
             lda test
             cmp #$0f
             bne +
             inc OperMode_Task
+:       rts
SetupVictoryMode:
             ldx ScreenRight_PageLoc  ;get page location of right side of screen
             inx                      ;increment to next page
             stx DestinationPageLoc   ;store here
             lda #EndOfCastleMusic
             sta EventMusicQueue      ;play win castle music
             lda pspeed
             beq +
             dec pspeed
             lda #$15
             sta pspeeddelay
             ldy VRAM_Buffer1_Offset
             lda #$20
             sta VRAM_Buffer1,y
             lda #$49
             sta VRAM_Buffer1+1,y
             lda #$01
             sta VRAM_Buffer1+2,y
             ;lda #$19
             ;sta VRAM_Buffer1+3,y
             lda pspeed
             sta VRAM_Buffer1+3,y
             lda #$00
             sta VRAM_Buffer1+4,y
             tya
             add #$04
             sta VRAM_Buffer1_Offset
+:      jmp IncModeTask_B        ;jump to set next major task in victory mode
DisplayCredits:
             lda #$00
             sta DisableScreenFlag
             sta CurrentText
             sta OldWriting
             sta NameTableSelect
             inc OperMode_Task
             rts
WriteCredits:
             lda #$01
             sta ContinueWriting
             lda #$00
             sta OldWriting
             inc OperMode_Task
             inc dontchecklag
             rts
Nothing: 
             inc OperMode_Task
-:        rts
             FinalText = $07
             AnteFinalText = FinalText - $01
CheckForThing:
             lda CurrentText
             cmp #FinalText
             beq ++
             lda ContinueWriting
             bne -
             lda CurrentText
             cmp #AnteFinalText
             bcc +
             inc test
             lda test
             bne ++
             jmp +e
+:        inc test
             lda test
             cmp #$30
             bne ++
             lda #$00
             sta test
+e:        inc CurrentText
             lda #$01
             sta ContinueWriting
+:        rts ;exit, write routine is in another part and bank
             
++:        lda ContinueWriting
             ora test
             bne +
             jmp PressButtonB
+:        rts
             
PlayerVictoryWalk:
             ldy #$01                ;set value here to not walk player by default
             sty olddirscroll
             sty scrolldir
             dey
             sty VictoryWalkControl
             lda Player_PageLoc      ;get player's page location
             cmp DestinationPageLoc  ;compare with destination page location
             bne PerformWalk         ;if page locations don't match, branch
             lda Player_X_Position   ;otherwise get player's horizontal position
             cmp #$60                ;compare with preset horizontal position
             bcs DontWalk            ;if still on other page, branch ahead
PerformWalk: inc VictoryWalkControl  ;otherwise increment value and Y
             iny                     ;note Y will be used to walk the player
DontWalk:    tya                     ;put contents of Y in A and
             jsr AutoControlPlayer   ;use A to move player to the right or not
             lda ScreenLeft_PageLoc  ;check page location of left side of screen
             cmp DestinationPageLoc  ;against set value here
             beq ExitVWalk           ;branch if equal to change modes if necessary
             lda ScrollFractional
             clc                     ;do fixed point math on fractional part of scroll
             adc #$80        
             sta ScrollFractional    ;save fractional movement amount
             lda #$01                ;set 1 pixel per frame
             adc #$00                ;add carry from previous addition
             tay                     ;use as scroll amount
             jsr ScrollScreen        ;do sub to scroll the screen
             jsr UpdScrollVar        ;do another sub to update screen and scroll variables
             inc VictoryWalkControl  ;increment value to stay in this routine
ExitVWalk:   lda VictoryWalkControl  ;load value set here
             beq IncModeTask_A1       ;if zero, branch to change modes
             rts                     ;otherwise leave
IncModeTask_A1:
             inc OperMode_Task
             rts
             
PrintVictoryMessages:
             lda SecondaryMsgCounter   ;load secondary message counter
             bne IncMsgCounter         ;if set, branch to increment message counters
             lda PrimaryMsgCounter     ;otherwise load primary message counter
             beq ThankPlayer           ;if set to zero, branch to print first message
             ldy UnlockWorld9
             cpy #Unlock9Steps
             bcs +
             ldy WorldNumber           ;check world number
             cpy #FinalWorld
             bne MRetainerMsg          ;if not at world 8, skip to next part
             jmp ++
+:               ldy WorldNumber
             cpy #World9
             bne MRetainerMsg
++:            cmp #$03                  ;check primary message counter again
             bcc IncMsgCounter         ;if not at 3 yet (world 8 only), branch to increment
             sbc #$01                  ;otherwise subtract one
             jmp ThankPlayer           ;and skip to next part
MRetainerMsg:  cmp #$02                  ;check primary message counter
             bcc IncMsgCounter         ;if not at 2 yet (world 1-7 only), branch
ThankPlayer:   tay                       ;put primary message counter into Y
             bne SecondPartMsg         ;if counter nonzero, skip this part, do not print first message
             ldy CurrentPlayer         ;otherwise get player currently on the screen
             jmp EvalForMusic
SecondPartMsg: iny                       ;increment Y to do world 8's message
             lda UnlockWorld9
             cmp #Unlock9Steps
             bcs +++
             lda WorldNumber
             cmp #FinalWorld           ;check world number
             beq EvalForMusic          ;if at world 8, branch to next part
             jmp ++++
+++:           lda WorldNumber
             cmp #World9
             beq EvalForMusic
++++:          dey                       ;otherwise decrement Y for world 1-7's message
             cpy #$04                  ;if counter at 4 (world 1-7 only)
             bcs SetEndTimer           ;branch to set victory end timer
             cpy #$03                  ;if counter at 3 (world 1-7 only)
             bcs IncMsgCounter         ;branch to keep counting
EvalForMusic:  cpy #$03                  ;if counter not yet at 3 (world 8 only), branch
             bne PrintMsg              ;to print message only (note world 1-7 will only
             lda #VictoryMusic         ;reach this code if counter = 0, and will always branch)
             sta EventMusicQueue       ;otherwise load victory music first (world 8 only)
PrintMsg:      tya                       ;put primary message counter in A
             clc                       ;add $0c or 12 to counter thus giving an appropriate value,
             adc #$0c                  ;($0c-$0d = first), ($0e = world 1-7's), ($0f-$12 = world 8's)
             sta VRAM_Buffer_AddrCtrl  ;write message counter to vram address controller
IncMsgCounter: lda SecondaryMsgCounter
             clc
             adc #$04                      ;add four to secondary message counter
             sta SecondaryMsgCounter
             lda PrimaryMsgCounter
             adc #$00                      ;add carry to primary message counter
             sta PrimaryMsgCounter
             cmp #$07                      ;check primary counter one more time
SetEndTimer:   bcc ExitMsgs                  ;if not reached value yet, branch to leave
             lda UnlockWorld9
             cmp #Unlock9Steps
             bcs +
             jmp ++
+:               ldy WorldNumber
             cpy #World9
             beq Salir
             ;lda WorldEndTimer
             ;cmp #$06
             ;bcs ExitMsgs
             ;ldy WorldNumber
             ;cpy #FinalWorld
             ;beq Salir
++:               ;jsr AwardGameTimerPoints
             ;beq ExitMsgs
Salir:           lda #$06
             sta WorldEndTimer             ;otherwise set world end timer
IncModeTask_A: inc OperMode_Task             ;move onto next task in mode
ExitMsgs:      rts                           ;leave
EndCastleAward:
             lda WorldEndTimer      ;if world end timer has not yet reached a certain point
             cmp #$06               ;then go ahead and skip all of this
             bcs ExEWA
             jmp AwardGameTimerPoints2
ExEWA:
             rts
PlayerEndWorld:                           ;branch to leave if not
             lda WorldEndTimer          ;check to see if world end timer expired
             bne EndExitOne
             ldy WorldNumber            ;check world number
             cpy #FinalWorld            ;if on world 8, player is done with game, 
             beq EndChkBButton          ;thus branch to read controller
Tumama:
             lda #$00
             sta AreaNumber             ;otherwise initialize area number used as offset
             sta LevelNumber            ;and level number control to start at area 1
             sta OperMode_Task          ;initialize secondary mode of operation
             inc WorldNumber            ;increment world number to move onto the next world
             jsr LoadAreaPointer        ;get area address offset for the next area
             inc FetchNewGameTimerFlag  ;set flag to load game timer from header
             inc DisableScreenFlag
             lda #GameModeValue
             sta OperMode               ;set mode of operation to game mode
EndExitOne:    rts                        ;and leave
EndChkBButton: lda #$01
             sta DisableScreenFlag
             inc OperMode_Task
             rts
PressButtonB:
             lda SavedJoypad1Bits
             ora SavedJoypad2Bits       ;check to see if B button was pressed on
             and #B_Button              ;either controller
             beq EndExitTwo             ;branch to leave if not
             sta WorldSelectEnableFlag
             lda #$ff                   ;remove onscreen player's lives
             sta NumberofLives
             lda #$00
             sta OldStatus
             inc DisableScreenFlag
             jmp TerminateGame          ;do sub to continue other player or end game
EndExitTwo:    rts                        ;leave
             
             
FloateyNumTileData:
             .db $ff, $ff ;dummy
             .db $f6, $fb ; "100"
             .db $f7, $fb ; "200"
             .db $f8, $fb ; "400"
             ;.db $f9, $fb ; "500"
             .db $fa, $fb ; "800"
             .db $f6, $50 ; "1000"
             .db $f7, $50 ; "2000"
             .db $f8, $50 ; "4000"
             ;.db $f9, $50 ; "5000"
             .db $fa, $50 ; "8000"
             .db $fd, $fe ; "1-UP"
             
ScoreUpdateData:
             .db $ff ;dummy
             .db $41, $42, $44, $48
             .db $31, $32, $34, $38, $00
             
FloateyNumbersRoutine:
             cmp #$09                     ;if less than $0b, branch
             bcc ChkNumTimer
             lda #$09                     ;otherwise set to $0b, thus keeping
             sta FloateyNum_Control,x     ;it in range
ChkNumTimer:  tay                          ;use as Y
             lda FloateyNum_Timer,x       ;check value here
             bne DecNumTimer              ;if nonzero, branch ahead
             sta FloateyNum_PageLoc,x
             sta FloateyNum_Control,x     ;initialize floatey number control and leave
             rts
DecNumTimer:  dec FloateyNum_Timer,x       ;decrement value here
             cmp #$2f                     ;if not reached a certain point, branch  
             bne ChkTallEnemy
             lda FloateyNum_Control,x
             tay
             cpy #$09                     ;check offset for $0b
             bne LoadNumTiles             ;branch ahead if not founs
             lda #Sfx_ExtraLife
             sta Square2SoundQueue        ;and play the 1-up sound
             lda NumberofLives
             cmp #$63
             beq LoadNumTiles
             lda dontinc
             beq ++
             lda #$00
             sta dontinc
             jmp LoadNumTiles
++:              tya
             pha
             inc NumberofLives            ;give player one extra life (1-up)
             ldy #$00
             sty $07fb
             lda NumberofLives            ;otherwise, check number of lives
             ;clc                          ;and increment by one for display   //uncommented as having 00 lifes is like having 1
             ;adc #$01
+:
             cmp #10                      ;more than 9 lives?
             bcc PutLives3
             sbc #10                      ;if so, subtract 10 and add one to the 10s digit
             ldy #$01                     ;instead of showing 100 lives, A0 will show, etc.
             sty $07fb
-:
             cmp #10
             bcc PutLives3
             sbc #10                      ;if so, subtract 10 and add to the digit
             inc $07fb                    ;next to the difference
             jmp -
             sty $07fc
PutLives3:    sta $07fc
             lda #$a5
             jsr PrintStatusBarNumbers
             ldy VRAM_Buffer1_Offset   
             lda VRAM_Buffer1-6,y      ;check highest digit of score
             ;bne +                        ;if zero, overwrite with space tile for zero suppression
             ;lda #$24
             ;sta VRAM_Buffer1-6,y
+:              tay
             pla
LoadNumTiles: lda ScoreUpdateData,y        ;load point value here
             lsr                          ;move high nybble to low
             lsr
             lsr
             lsr
             tax                          ;use as X offset, essentially the digit
             lda ScoreUpdateData,y        ;load again and this time
             and #%00001111               ;mask out the high nybble
             sta DigitModifier,x          ;store as amount to add to the digit
             jsr AddToScore
ChkTallEnemy: ldy Enemy_SprDataOffset,x    ;get OAM data offset for enemy object
             lda FloateyShit,x
             beq +
             dec FloateyShit,x
             jmp GetAltOffset
+:              
             lda Enemy_ID,x               ;get enemy object identifier
             cmp #Spiny
             beq FloateyPart              ;branch if spiny
             cmp #PiranhaPlant
             beq FloateyPart              ;branch if piranha plant
             cmp #HammerBro
             beq GetAltOffset             ;branch elsewhere if hammer bro
             cmp #GreyCheepCheep
             beq FloateyPart              ;branch if cheep-cheep of either color
             cmp #RedKoopaShell
             beq FloateyPart
             cmp #UDPiranhaPlant
             beq FloateyPart
             cmp #RUDPiranhaPlant
             beq FloateyPart
             cmp #RedPiranhaPlant
             beq FloateyPart
             cmp #RedCheepCheep
             bcs GetAltOffset             ;branch elsewhere if enemy object => $09
             lda Enemy_State,x
             cmp #$02                     ;if enemy state defeated or otherwise
             bcs FloateyPart              ;$02 or greater, branch beyond this part
GetAltOffset: ldx SprDataOffset_Ctrl       ;load some kind of control bit
             ldy Alt_SprDataOffset,x      ;get alternate OAM data offset
             ldx ObjectOffset             ;get enemy object offset again
FloateyPart:  lda FloateyNum_Y_Pos,x       ;get vertical coordinate for
             cmp #$18                     ;floatey number, if coordinate in the
             bcc SetupNumSpr              ;status bar, branch
             sbc #$01
             sta FloateyNum_Y_Pos,x       ;otherwise subtract one and store as new
SetupNumSpr:  lda FloateyNum_Y_Pos,x       ;get vertical coordinate
             sbc #$08                     ;subtract eight and dump into the
             sta Sprite_Data+4,y          ;and into first row sprites
             sta Sprite_Data,y            ;and do sub to dump into first and second sprites
             lda scrolldir
             beq ++
             lda FloateyNum_X_Pos,x       ;get horizontal coordinate
             sec
             sbc ScrollAmount
             sta FloateyNum_X_Pos,x
             sta Sprite_X_Position,y      ;store into X coordinate of left sprite
             lda FloateyNum_PageLoc,x
             sbc #$00
             sta FloateyNum_PageLoc,x
             beq +
             lda #$fd
             sta Sprite_Y_Position,y
             sta Sprite_Y_Position+4,y
             bne +
++:              lda ScrollAmount
             eor #$ff
             clc
             adc #$01
             sta tempB
             lda FloateyNum_X_Pos,x       ;get horizontal coordinate
             clc
             adc tempB
             sta FloateyNum_X_Pos,x
             sta Sprite_X_Position,y      ;store into X coordinate of left sprite
             lda FloateyNum_PageLoc,x
             adc #$00
             sta FloateyNum_PageLoc,x
             bne ++
             lda FloateyNum_X_Pos,x
             cmp #$f8
             bcc +
             lda #$fd
             sta Sprite_Y_Position+4,y
             bne +
             
++:              lda #$fd
             sta Sprite_Y_Position,y
             sta Sprite_Y_Position+4,y
             
+:              lda Sprite_X_Position,y      ;load X coordinate of left sprite
             clc
             adc #$08                     ;add eight pixels and store into X
             sta Sprite_X_Position+4,y    ;coordinate of right sprite
             lda #$02
             sta Sprite_Attributes,y      ;set palette control in attribute bytes
             sta Sprite_Attributes+4,y    ;of left and right sprites
             lda FloateyNum_Control,x
             asl                          ;multiply our floatey number control by 2
             tax                          ;and use as offset for look-up table
             lda FloateyNumTileData,x
             sta Sprite_Tilenumber,y      ;display first half of number of points
             lda FloateyNumTileData+1,x
             sta Sprite_Tilenumber+4,y    ;display the second half
             ldx ObjectOffset             ;get enemy object offset and leave
             rts
             
             
ScreenRoutines:
             lda ScreenRoutineTask        ;run one of the following subroutines
             jsr JumpEngine
             
             .dw InitScreen
             .dw SetupIntermediate
             .dw WriteTopStatusLine
             .dw WriteBottomStatusLine
             .dw DisplayTimeUp
             .dw ResetSpritesAndScreenTimer
             .dw DisplayIntermediate
             .dw AreaParserTaskControl
             .dw ResetSpritesAndScreenTimer
             .dw GetAreaPalette
             .dw GetBackgroundColor1
             .dw GetAlternatePalette1
             .dw DrawTitleScreen
             .dw ClearBuffersDrawIcon
             .dw WriteTopScore
             
GetBackgroundColor1:
             lda BackgroundColorCtrl
             sta BackgroundColorCtrlFP
             jmp GetBackgroundColor
InitScreen:
             jsr MoveSpritesOffscreen ;initialize all sprites including sprite #0
             jsr InitializeNameTables    ;and erase both name and attribute tables
             lda OperMode
             beq NextSubtask             ;if mode still 0, do not load
             ldx #$03                    ;into buffer pointer
             jmp SetVRAMAddr_A
             
             
SetupIntermediate:
             lda BackgroundColorCtrl  ;save current background color control
             pha                      ;and player status to stack
             lda PlayerStatus
             pha
             lda #$00                 ;set background color to black
             sta PlayerStatus         ;and player status to not fiery
             lda #$02                 ;this is the ONLY time background color control
             sta BackgroundColorCtrl  ;is set to less than 4
             jsr GetPlayerColors
             pla                      ;we only execute this routine for
             sta PlayerStatus         ;the intermediate lives display
             pla                      ;and once we're done, we return bg
             sta BackgroundColorCtrl  ;color ctrl and player status from stack
             jmp IncSubtask           ;then move onto the next task
             
             
AreaPalette:
             .db $01, $02, $03, $04
             
GetAreaPalette:
             ldy AreaType             ;select appropriate palette to load
             ldx AreaPalette,y        ;based on area type
SetVRAMAddr_A: stx VRAM_Buffer_AddrCtrl ;store offset into buffer control
NextSubtask:   jmp IncSubtask           ;move onto next task
             
             
BGColorCtrl_Addr:
             .db $00, $09, $0a, $04
             
BackgroundColors:
             .db $22, $22, $0f, $0f ;used by area type if bg color ctrl not set
             .db $0f, $22, $0f, $0f ;used by background color control if set
             .db $12, $12, $0f, $0f
             
             
PlayerColorsOffset:
             .db MarioColors-PlayerColors, LuigiColors-PlayerColors
             
PlayerColors:
MarioColors:
             .db $22, $16, $27, $18 ;Small
             .db $22, $16, $27, $18 ;Big
             .db $22, $37, $27, $16 ;Fiery
LuigiColors:
             .db $22, $30, $27, $19 ;Small
             .db $22, $30, $27, $19 ;Big
             .db $22, $30, $27, $16 ;Fiery
             
GetBackgroundColor:
             ldy BackgroundColorCtrl   ;check background color control
             beq NoBGColor             ;if not set, increment task and fetch palette
             lda BGColorCtrl_Addr-4,y  ;put appropriate palette into vram
             sta VRAM_Buffer_AddrCtrl  ;note that if set to 5-7, $0301 will not be read
NoBGColor: inc ScreenRoutineTask     ;increment to next subtask and plod on through
             
GetPlayerColors:
             ldx VRAM_Buffer1_Offset  ;get current buffer offset
             lda PlayerStatus
             asl
             asl
             sta $00
             ldy CurrentPlayer
             lda PlayerColorsOffset,y
             clc
             adc $00
             tay
StartClrGet:   lda #$03                 ;do four colors
             sta $00
ClrGetLoop:    lda PlayerColors,y       ;fetch player colors and store them
             sta VRAM_Buffer1+3,x     ;in the buffer
             iny
             inx
             dec $00
             bpl ClrGetLoop
             ldx VRAM_Buffer1_Offset  ;load original offset from before
             ldy BackgroundColorCtrl  ;if this value is four or greater, it will be set
             bne SetBGColor           ;therefore use it as offset to background color
             ldy AreaType
             bne +
             ldy #$08
             jmp SetBGColor
+:             
             ldy AreaType             ;otherwise use area type bits from area offset as offset
SetBGColor:    lda BackgroundColors,y   ;to background color instead
             sta VRAM_Buffer1+3,x
             lda #$3f                 ;set for sprite palette address
             sta VRAM_Buffer1,x       ;save to buffer
             lda #$10
             sta VRAM_Buffer1+1,x
             lda #$04                 ;write length byte to buffer
             sta VRAM_Buffer1+2,x
             lda #$00                 ;now the null terminator
             sta VRAM_Buffer1+7,x
             txa                      ;move the buffer pointer ahead 7 bytes
             clc                      ;in case we want to write anything else later
             adc #$07
SetVRAMOffset: sta VRAM_Buffer1_Offset  ;store as new vram buffer offset
             rts
             
             
GetAlternatePalette1:
             
			 lda WorldNumber
			 cmp #World7
			 beq ++
             lda AreaType
             cmp #$01
             bne +
++:          ldy WorldNumber          ;otherwise check world number
             lda WorldPaletteLUT,y
             sta WorldPalette
+:           lda #$00
             sta TheresPal3
             lda AreaStyle            ;check for mushroom level style
             cmp #$01
             bne NoAltPal
             lda #$0b                 ;if found, load appropriate palette
SetVRAMAddr_B: sta VRAM_Buffer_AddrCtrl
NoAltPal:      jmp IncSubtask           ;now onto the next task
             
             
WriteTopStatusLine:
             lda #$00                  ;select main status barrel
             jsr WriteGameText         ;output it
             jmp IncSubtask            ;onto the next task
             
             
WriteBottomStatusLine:
             lda OperMode
             beq +
             cmp #GameOverModeValue
             beq +
             jsr UpdateLives
             +      
             lda OperMode
             cmp #TitleScreenModeValue
             bne +
             ldy #$06
-:      lda ContinueScore,y
             sta PlayerScoreDisplay,y
             dey
             bpl -
             
             ldy #$03
-:      lda ContinueCoins,y
             sta PlayerCoinDisplay,y
             dey
             bpl -
+:
             jsr WriteScoreAndCoinTally        ;write player's score and coin tally to screen
             jsr putpspeeddisplay
             lda #$02
             jsr RealUpdateNumber
             ldx VRAM_Buffer1_Offset
             lda #$20                ;write address for world-area number on screen
             sta VRAM_Buffer1,x
             lda #$73
             sta VRAM_Buffer1+1,x
             lda #$04                ;write length for it
             sta VRAM_Buffer1+2,x
             lda WorldSelectEnableFlag
             bne +
             lda OperMode
             cmp #TitleScreenModeValue
             bne +
             ldy ContinueWorld
             iny
             bne ++
+:    ldy WorldNumber         ;first the world number
             iny
++:   tya
             sta VRAM_Buffer1+3,x
             lda #$28                ;next the dash
             sta VRAM_Buffer1+4,x
             lda WorldSelectEnableFlag
             bne +
             lda OperMode
             cmp #TitleScreenModeValue
             bne +
             ldy ContinueLevel
             iny
             bne ++
+:    ldy LevelNumber         ;next the level number
             iny                     ;increment for proper number display
             ++    tya
             sta VRAM_Buffer1+5,x    
             ldy HardModeFlag
             lda HardModeDisplay,y
             sta VRAM_Buffer1+6,x
             lda #$00                ;put null terminator on
             sta VRAM_Buffer1+7,x
             txa                     ;move the buffer offset up by 6 bytes
             clc
             adc #$07
             sta VRAM_Buffer1_Offset
             jmp IncSubtask
             
             
DisplayTimeUp:
             lda GameTimerExpiredFlag  ;if game timer not expired, increment task
             beq NoTimeUp              ;control 2 tasks forward, otherwise, stay here
             lda #$00
             sta GameTimerExpiredFlag  ;reset timer expiration flag
             lda #$02                  ;output time-up screen to buffer
             jmp OutputInter
NoTimeUp: inc ScreenRoutineTask     ;increment control task 2 tasks forward
             jmp IncSubtask
             
             
DisplayIntermediate:
             lda OperMode                 ;check primary mode of operation
             beq NoInter                  ;if in title screen mode, skip this
             cmp #GameOverModeValue       ;are we in game over mode?
             beq GameOverInter            ;if so, proceed to display game over screen
             if SKIP_INTERMEDIATE
             jmp NoInter
             endif
             lda AltEntranceControl       ;otherwise check for mode of alternate entry
             bne NoInter                  ;and branch if found
             lda DisableIntermediate      ;if this flag is set, skip intermediate lives display
             bne NoInter                  ;and jump to specific task, otherwise
PlayerInter:   jsr DrawPlayer_Intermediate  ;put player in appropriate place for
             lda #$01                     ;lives display, then output lives display to buffer
OutputInter:   jsr WriteGameText
             jsr ResetScreenTimer
             lda #$00
             sta DisableScreenFlag        ;reenable screen output
             sta NameTableSelect
             rts
GameOverInter: lda #$12                     ;set screen timer
             sta ScreenTimer
             lda #$03                     ;output game over screen to buffer
             jsr WriteGameText
             jmp IncModeTask_B
NoInter:       lda #$07                     ;set for specific task and leave
             sta ScreenRoutineTask
             rts
             
             
AreaParserTaskControl:
             lda waitforit
             bne +
             inc waitforit
             jsr AreaParserTaskHandler1 ;render column set of current area
+:           lda ScreenTimer
             bne OutputCol
             inc DisableScreenFlag
TaskLoop:  jsr AreaParserTaskHandler1 ;render column set of current area
             lda AreaParserTaskNum     ;check number of tasks
             bne TaskLoop              ;if tasks still not all done, do another one
             dec ColumnSets            ;do we need to render more column sets?
             bpl OutputCol
             dec waitforit
             inc ScreenRoutineTask     ;if not, move on to the next task
             inc ScreenRoutineTask     ;if not, move on to the next task
             jsr MoveSpritesOffscreen
OutputCol: lda #$06                  ;set vram buffer to output rendered column set
             sta VRAM_Buffer_AddrCtrl  ;on next NMI
             rts
             
             
ClearBuffersDrawIcon:
             lda OperMode
             bne IncModeTask_B          ;if not title screen mode, leave
             ldx #$00                   ;otherwise, clear buffer space
TScrClear:   sta VRAM_Buffer1-1,x
             sta VRAM_Buffer1-1+$100,x
             dex
             bne TScrClear
             jsr DrawMushroomIcon       ;draw player select icon
IncSubtask:  inc ScreenRoutineTask      ;move onto next task
             rts
             
             
WriteTopScore:
             if BATTERY
             jsr SaveBattery
             endif
             lda #$fa           ;run display routine to display top score on title
             jsr RealUpdateNumber
             lda TopMaxedOut
             beq IncModeTask_B
             ldx VRAM_Buffer1_Offset
             lda #$22
             sta VRAM_Buffer1,x
             lda #$f6
             sta VRAM_Buffer1+1,x
             lda #$01
             sta VRAM_Buffer1+2,x
             lda #$09
             sta VRAM_Buffer1+3,x      ;change the last 0 to a 9
             lda #$00
             sta VRAM_Buffer1+4,x
             txa
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
IncModeTask_B: inc OperMode_Task  ;move onto next mode
             rts
             
             
GameText:
TopStatusBarLine:
             ;.db $20, $43, $05, $16, $0a, $1b, $12, $18 ; "MARIO"
             .db $20, $43, $0e, "MARIO"-55, $24, $24, $24, $24, $24, $16, $29, $00, $04
             if CHEATS && CHEAT_REMOVE_TIMER
             .db $20, $52, $05, $20, $18, $1b, $15, $0d ; "WORLD"
             else
             .db $20, $52, $0b, $20, $18, $1b, $15, $0d ; "WORLD  TIME"
             .db $24, $24, $1d, $12, $16, $0e
             endif
             .db $20, $68, $05, $00, $00, $24, $2e, $29 ; score trailing digit and coin display
             .db $23, $c0, $7f, $aa ; attribute table data, clears name table 0 to palette 2
             .db $23, $c2, $01, $ea ; attribute table data, used for coin icon in status bar
             .db $ff ; end of data block
             
WorldLivesDisplay:
             .db $21, $cd, $07, $24, $24 ; cross with spaces used on
             .db $29, $24, $24, $24, $24 ; lives display
             .db $21, $4b, $0a, $20, $18 ; "WORLD  - " used on lives display
             .db $1b, $15, $0d, $24, $24, $28, $24, $24
             .db $22, $0c, $47, $24 ; possibly used to clear time up
             if LIVES_FIX !=1
             .db $23, $dc, $01, $ba ; attribute table data for crown if more than 9 lives
             endif
             .db $ff
             
TwoPlayerTimeUp:
             .db $21, $cd, $05, $16, $0a, $1b, $12, $18 ; "MARIO"
OnePlayerTimeUp:
             .db $22, $0c, $07, $1d, $12, $16, $0e, $24, $1e, $19 ; "TIME UP"
             .db $ff
             
             if GAME_OVER_MENU == 1
TwoPlayerGameOver:
             .db $21, $2d, $05, $16, $0a, $1b, $12, $18 ; "MARIO"
OnePlayerGameOver:
GameOver:
             .db $21, $6b, $09, $10, $0a, $16, $0e, $24 ;"GAME OVER"
             .db $18, $1f, $0e, $1b
             .db $21, $eb, $08, $0c, $18, $17, $1d, $12, $17, $1e, $0e ;"CONTINUE"
             .db $22, $0c, $47, $24
             .db $22, $4b, $03, "END"-55 ;"END"
             .db $ff
             else
TwoPlayerGameOver:
             .db $21, $cd, $05, $16, $0a, $1b, $12, $18 ; "MARIO"
OnePlayerGameOver:
             .db $22, $0b, $09, $10, $0a, $16, $0e, $24 ; "GAME OVER"
             .db $18, $1f, $0e, $1b
             .db $ff
             endif
             
WarpZoneWelcome:
             
             
WarpZoneNumbers:
             .db $04, $03, $02, $00         ; world 1-2
             .db $24, $05, $09, $00         ; warp zone responsible for minus world
             .db $08, $07, $06, $00         ; world 4-2
             .db $33, $05, $33, $00         ; world 4-2 to world 5
             
GameTextOffsets:
             .db TopStatusBarLine-GameText, TopStatusBarLine-GameText
             .db WorldLivesDisplay-GameText, WorldLivesDisplay-GameText
             .db OnePlayerTimeUp-GameText, OnePlayerTimeUp-GameText
             .db GameOver-GameText, GameOver-GameText
             .db WarpZoneWelcome-GameText, WarpZoneWelcome-GameText
PrintWarpZoneNumbers1:
             jmp PrintWarpZoneNumbers
WriteGameText:
             pha                      ;save text number to stack
             asl
             tay                      ;multiply by 2 and use as offset
             cpy #$04                 ;if set to do top status bar or world/lives display,
             bcc LdGameText           ;branch to use current offset as-is
             cpy #$08                 ;if set to do time-up or game over,
             bcc Chk2Players          ;branch to check players
             ldy #$08                 ;otherwise warp zone, therefore set offset
Chk2Players:   ;lda NumberOfPlayers     ;check for number of players
             ;bne LdGameText          ;if there are two, use current offset to also print name
             iny                      ;otherwise increment offset by one to not print name
LdGameText:    ldx GameTextOffsets,y    ;get offset to message we want to print
             ldy #$00
GameTextLoop:  lda GameText,x           ;load message data
             cmp #$ff                 ;check for terminator
             beq EndGameText          ;branch to end text if found
             sta VRAM_Buffer1,y       ;otherwise write data to buffer
             inx                      ;and increment increment
             iny
             bne GameTextLoop         ;do this for 256 bytes if no terminator found
EndGameText:   lda #$00                 ;put null terminator at end
             sta VRAM_Buffer1,y
             pla                      ;pull original text number from stack
             tax
             cmp #$04                 ;are we printing warp zone?
             bcs PrintWarpZoneNumbers1
             cmp #$02
             bcs ExitWPrint
             dex                      ;are we printing the world/lives display?
             bne CheckPlayerName      ;if not, branch to check player's name
             if LIVES_FIX == 1
             ldy #$00
             sty VRAM_Buffer1+7
             lda NumberofLives         ;otherwise, check number of lives
             ;clc                       ;and increment by one for display //$01 = $00 lifes
             ;adc #$01
             +
             cmp #10                   ;more than 9 lives?
             bcc PutLives
             sbc #10                   ;if so, subtract 10 and add one to the 10s digit
             ldy #$01                  ;instead of showing 100 lives, A0 will show, etc.
             sty VRAM_Buffer1+7
             -
             cmp #10
             bcc PutLives
             sbc #10                   ;if so, subtract 10 and add to the digit
             inc VRAM_Buffer1+7        ;next to the difference
             jmp -
             sty VRAM_Buffer1+7
             else
             cmp #10                  ;more than 9 lives?
             bcc PutLives
             sbc #10                  ;if so, subtract 10 and put a crown tile
             ldy #$9f                 ;next to the difference...strange things happen if
             sty VRAM_Buffer1+7       ;the number of lives exceeds 19
             endif
PutLives:      
             sta VRAM_Buffer1+8
             ldy WorldNumber          ;write world and level numbers (incremented for display)
             iny                      ;to the buffer in the spaces surrounding the dash
             sty VRAM_Buffer1+19
             ldy LevelNumber
             iny
             sty VRAM_Buffer1+21      ;we're done here
             ldx HardModeFlag
             ldy HardModeDisplay,x
             sty VRAM_Buffer1+22
             ldy #$00
             sty OnOffBits
             sty OnOffFlag
             sty PTimer
ExitWPrint:    rts
HardModeDisplay:
             .db $24, $6f
CheckPlayerName:
             ldy CurrentPlayer
             lda PlayerNamesOffset,y
             sta $01
             
             lda #<PlayerNames
             clc
             adc $01
             sta $00
             lda #>PlayerNames
             sta $01
             
             lda PlayerNamesCharLenght,y
             tay
NameLoop:    
             lda ($00),y            ; replace "MARIO" (Including for Mario)
             sta VRAM_Buffer1+3,y
             dey
             bpl NameLoop           ;do this until each letter is replaced
             ldx CurrentPlayer
             lda PlayerNamesCharLenght,x
             cmp #$04
             bcs +
             tay
             lda #$24
FillB:         iny
             sta VRAM_Buffer1+3,y
             cpy #$04
             bne FillB
+:            
             lda PlayerIData,x
             sta VRAM_Buffer1+13
ExitChkName: rts
             
PrintWarpZoneNumbers:
             sbc #$04               ;subtract 4 and then shift to the left
             asl                    ;twice to get proper warp zone number
             asl                    ;offset
             tax
             ldy #$00
WarpNumLoop: lda WarpZoneNumbers,x  ;print warp zone numbers into the
             sta VRAM_Buffer1+27,y  ;placeholders from earlier
             inx
             iny                    ;put a number in every fourth space
             iny
             iny
             iny
             cpy #$0c
             bcc WarpNumLoop
             lda #$2c               ;load new buffer pointer at end of message
             jmp SetVRAMOffset
PlayerIData:
             .db $16
             .db $15
             .db $0a
             .db $0d
             .db $13
             
PlayerNamesCharLenght:
             .db $04, $04, $02, $04, $04
             
ResetSpritesAndScreenTimer:
             lda ScreenTimer             ;check if screen timer has expired
             bne NoReset                 ;if not, branch to leave
             jsr MoveSpritesOffscreen ;otherwise reset sprites now
             
ResetScreenTimer:
             lda #$04                    ;reset timer again
             sta ScreenTimer
             inc ScreenRoutineTask       ;move onto next task
NoReset: rts
             
             
             
             
             
BlockGfxData:
             .db $fd, $fe, $45, $47 
             .db $fa, $fb, $45, $47 
             .db $57, $58, $59, $5a
             .db $30, $31, $32, $33
             .db $26, $26, $26, $26
             .db $72, $73, $74, $75
             .db $53, $54, $55, $56
-: rts
RemoveCoin_Axe:
             ;ldy #$e1                 ;set low byte so offset points to $0341
             lda #$03                 ;load offset for default blank metatile
             ldx AreaType             ;check area type
             bne WriteBlankMT         ;if not water type, use offset
             lda #$04                 ;otherwise load offset for blank metatile used in water
WriteBlankMT: jmp Hmm                    ;do a sub to write blank metatile to vram buffer
blank: .db $91, $00, $00, $00
             
IntermediatePlayerData:
             .db $58, $01, $00, $60, $ff, $04
             
DrawPlayer_Intermediate:
             ldx #$05                       ;store data into zero page memory
PIntLoop: lda IntermediatePlayerData,x   ;load data to display player as he always
             sta $02,x                      ;appears on world/lives display
             dex
             bpl PIntLoop                   ;do this until all data is loaded
             ldx #$b8                       ;load offset for small standing
             ldy #$04                       ;load sprite data offset
             jsr DrawPlayerLoop             ;draw player accordingly
             lda Sprite_Attributes+36       ;get empty sprite attributes
             ora #%01000000                 ;set horizontal flip bit for bottom-right sprite
             sta Sprite_Attributes+32       ;store and leave
             rts
             
ReplaceBlockMetatile2:
             sta temp6 
             lda WaterReplace
             beq ReplaceBlockMetatile
             lda AreaType
             bne +
             lda #$04
             jmp PutBlockMetatile
+:       rts
ReplaceBlockMetatile:     
             lda temp6
             jmp WriteBlockMetatile    ;write metatile to vram buffer to replace block object
VineYes:
             ldy #$03
             jmp UseBOffset
             
DestroyBlockMetatile:
             lda AreaType
             bne +
             lda #$04  
             jmp UseBOffset+1
+:     lda #$00       ;force blank metatile if branched/jumped to this point
             
WriteBlockMetatile:
             ldy #$03                ;load offset for blank metatile
             cmp #$00                ;check contents of A for blank metatile
             beq UseBOffset          ;branch if found (unconditional if branched from 8a6b)
             cmp #$87
             beq UseBOffset
             cmp #$23
             beq UseBOffset
             cmp #$74
             beq UseBOffset
             ldy #$00                ;load offset for brick metatile w/ line
             cmp #$26
             beq VineYes
             cmp #$58
             beq UseBOffset          ;use offset if metatile is brick with coins (w/ line)
             cmp #$51
             beq UseBOffset          ;use offset if metatile is breakable brick w/ line
             cmp #$27
             beq UseBOffset
             iny                     ;increment offset for brick metatile w/o line
             cmp #$5d
             beq UseBOffset          ;use offset if metatile is brick with coins (w/o line)
             cmp #$52
             beq UseBOffset          ;use offset if metatile is breakable brick w/o line
             cmp #$28
             beq UseBOffset
             cmp #$34
             beq UseBOffset
             ldy #$06
             cmp #$c2
             beq +
             cmp #$c4
             beq +
             and #%11110000
             cmp #$c0
             beq UseBOffset
+:             ldy #$05
             lda temp6
             cmp #$c2
             beq UseBOffset
             ldy #$02
UseBOffset:  tya                     ;put Y in A
Hmm:         ldy VRAM_Buffer1_Offset ;get vram buffer offset
             iny                     ;move onto next byte
             jsr PutBlockMetatile    ;get appropriate block data and write to vram buffer
MoveVOffset: dey                     ;decrement vram buffer offset
             tya                     ;add 10 bytes to it
             clc
             adc #10
             jmp SetVRAMOffset       ;branch to store as new vram buffer offset
             
PutBlockMetatile:
             stx $00               ;store control bit from SprDataOffset_Ctrl
             sty $01               ;store vram buffer offset for next byte
             asl
             asl                   ;multiply A by four and use as X
             tax
             ldy #$20              ;load high byte for name table 0
             lda $f8               ;get low byte of block buffer pointer
             and #$01
             cmp #$01
             bne SaveHAdder        ;if not, use current high byte
             ldy #$24              ;otherwise load high byte for name table 1
SaveHAdder: sty $03               ;save high byte here
             lda $f7
             and #$0f              ;mask out high nybble of block buffer pointer
             asl                   ;multiply by 2 to get appropriate name table low byte
             sta $04               ;and then store it here
             lda #$00
             sta $05               ;initialize temp high byte
             lda $02               ;get vertical high nybble offset used in block buffer routine
             clc
             adc #$20              ;add 32 pixels for the status bar
             asl
             rol $05               ;shift and rotate d7 onto d0 and d6 into carry
             asl
             rol $05               ;shift and rotate d6 onto d0 and d5 into carry
             adc $04               ;add low byte of name table and carry to vertical high nybble
             sta $04               ;and store here
             lda $05               ;get whatever was in d7 and d6 of vertical high nybble
             adc #$00              ;add carry
             clc
             adc $03               ;then add high byte of name table
             sta $05               ;store here
             ldy $01               ;get vram buffer offset to be used
RemBridge:  lda BlockGfxData,x    ;write top left and top right
             sta VRAM_Buffer1+2,y  ;tile numbers into first spot
             lda BlockGfxData+1,x
             sta VRAM_Buffer1+3,y
             lda BlockGfxData+2,x  ;write bottom left and bottom
             sta VRAM_Buffer1+7,y  ;right tiles numbers into
             lda BlockGfxData+3,x  ;second spot
             sta VRAM_Buffer1+8,y
             lda $04
             sta VRAM_Buffer1,y    ;write low byte of name table
             clc                   ;into first slot as read
             adc #$20              ;add 32 bytes to value
             sta VRAM_Buffer1+5,y  ;write low byte of name table
             lda $05               ;plus 32 bytes into second slot
             sta VRAM_Buffer1-1,y  ;write high byte of name
             sta VRAM_Buffer1+4,y  ;table address to both slots
             lda #$02
             sta VRAM_Buffer1+1,y  ;put length of 2 in
             sta VRAM_Buffer1+6,y  ;both slots
             lda #$00
             sta VRAM_Buffer1+9,y  ;put null terminator at end
             ldx $00               ;get offset control bit here
             rts                   ;and leave
             
WaterPaletteData:
             .db $3f, $00, $20
             .db $12, $15, $22, $25  
             .db $12, $3a, $1a, $0f
             .db $12, $30, $22, $0f
             .db $12, $27, $22, $0f
             .db $12, $16, $27, $18
             .db $12, $1a, $30, $27
             .db $12, $16, $30, $27
             .db $12, $0f, $30, $10
             .db $00
             
GroundPaletteData:
             .db $3f, $00, $20
             .db $22, $29, $1a, $0f
             .db $22, $36, $17, $0f
             .db $22, $30, $21, $0f
             .db $22, $27, $17, $0f
             .db $22, $16, $27, $18
             .db $22, $1a, $30, $27
             .db $22, $16, $30, $27
             .db $22, $0f, $36, $17
             .db $00
             
UndergroundPaletteData:
             .db $3f, $00, $20
             .db $0f, $29, $1a, $0c
             .db $0f, $3c, $1c, $0c
             .db $0f, $30, $21, $0c
             .db $0f, $27, $17, $0c
             .db $0f, $16, $27, $18
             .db $0f, $1a, $30, $27
             .db $0f, $16, $30, $27
             .db $0f, $0c, $3c, $1c
             .db $00
             
CastlePaletteData:
             .db $3f, $00, $20
             .db $0f, $30, $10, $2d
             .db $0f, $30, $10, $00
             .db $0f, $30, $16, $2d
             .db $0f, $27, $17, $2d
             .db $0f, $16, $27, $18
             .db $0f, $1a, $30, $27
             .db $0f, $16, $30, $27
             .db $0f, $00, $30, $10
             .db $00
             
DaySnowPaletteData:
             .db $3f, $00, $04
             .db $22, $30, $00, $10
             .db $00
             
NightSnowPaletteData:
             .db $3f, $00, $04
             .db $0f, $30, $00, $10
             .db $00
             
MushroomPaletteData:
             .db $3f, $00, $20
             .db $22, $29, $1a, $0f
             .db $22, $37, $27, $17
             .db $22, $30, $12, $0f
             .db $22, $27, $17, $0f
             .db $22, $16, $27, $18
             .db $22, $1a, $30, $27
             .db $22, $16, $30, $27
             .db $22, $17, $37, $27
             .db $00
             
BowserPaletteData:
             .db $3f, $14, $04
             .db $0f, $1a, $30, $27
             .db $00
             
             
MarioThanksMessage:
             .db $25, $48, $10
             .db $1d, $11, $0a, $17, $14, $31
             .db $22, $18, $1e, $31
             .db $16, $0a, $1b, $12, $18, $2b
             .db $00
             
LuigiThanksMessage:
             .db $25, $48, $10
             .db $1d, $11, $0a, $17, $14, $31
             .db $22, $18, $1e, $31
             .db $15, $1e, $12, $10, $12, $2b
             .db $00
             
MushroomRetainerSaved:
             .db $25, $c5, $16
             .db $0b, $1e, $1d, $30, $18, $1e, $1b, $30
             .db $19, $1b, $12, $17, $0c, $0e, $1c, $1c, $31
             .db $12, $1c, $30, $12, $17
             .db $26, $05, $0f
             .db $0a, $17, $18, $1d, $11, $0e, $1b, $30
             .db $0c, $0a, $1c, $1d, $15, $0e, $2b, $00
             
MushRoomRetainerGlitchWorld:
             .db "YOU GOT 1000 COINS SO"-55
             .db "YOU CAN NOW PLAY"-55
             .db "WORLD 9"-55, $2b, $00
             
PrincessSaved1:
             .db $25, $a9, $0e
             .db $19, $0e, $0a, $0c, $0e, $32, $12, $1c, $33
             .db $19, $0a, $1f, $0e, $0d
             .db $23, $d0, $58, $aa
             .db $00
             
PrincessSaved2:
             .db $25, $e7, $12
             .db $20, $12, $1d, $11, $33, $14, $12, $17, $10, $0d, $18, $16, $33
             .db $1c, $0a, $1f, $0e, $0d
             .db $00
             
WorldSelectMessage1:
             .db $26, $28, $10
             .db $11, $1e, $1b, $1b, $0a, $11, $33, $1d, $18, $33, "PLAYER"-55
             .db $00
             
WorldSelectMessage2:
             .db $26, $69, $0d
             .db $18, $1e, $1b, $33, $18, $17, $15, $22, $33, $11, $0e, $1b, $18
             .db $00
             
             
PSBN:
-:      inc bocata3
             rts
PrintStatusBarNumbers:
             sta $00            ;store player-specific offset
             jsr OutputNumbers  ;use first nybble to print the coin display
             lda $00            ;move high nybble to low
             tay
             lda MSBtoLSB,y
             
OutputNumbers:
             clc                      ;add 1 to low nybble
             adc #$01
             and #%00001111           ;mask out high nybble
             cmp #$07
             bcs ExitOutputN
             pha                      ;save incremented value to stack for now and
             asl                      ;shift to left and use as offset
             tay
             ldx VRAM_Buffer1_Offset  ;get current buffer pointer
             cpx #$20
             bcs +
             lda #$20                 ;put at top of screen by default
             cpy #$00                 ;are we writing top score on title screen?
             bne SetupNums
             lda #$22                 ;if so, put further down on the screen
SetupNums:   sta VRAM_Buffer1,x
             lda StatusBarData,y      ;write low vram address and length of thing
             sta VRAM_Buffer1+1,x     ;we're printing to the buffer
             lda StatusBarData+1,y
             sta VRAM_Buffer1+2,x
             sta $03                  ;save length byte in counter
             stx $02
             pla                      ;pull original incremented value from stack
             tax
             lda StatusBarOffset,x    ;load offset to value we want to write
             sec
             sbc StatusBarData+1,y    ;subtract from length byte we read before
             tay                      ;use value as offset to display digits
             ldx $02
DigitPLoop:  lda DisplayDigits,y      ;write digits to the buffer
             sta VRAM_Buffer1+3,x    
             inx
             iny
             dec $03                  ;do this until all the digits are written
             bne DigitPLoop
             lda #$00                 ;put null terminator at end
             sta VRAM_Buffer1+3,x
             inx                      ;increment buffer pointer by 3
             inx
             inx
             stx VRAM_Buffer1_Offset  ;store it in case we want to use it again
ExitOutputN: rts
+:             pla
             inc bocata3
             rts
             
DigitsMathRoutine:
             lda OperMode              ;check mode of operation
             cmp #TitleScreenModeValue
             beq EraseDMods            ;if in title screen mode, branch to lock score
             ldx #$05
AddModLoop: lda DigitModifier,x       ;load digit amount to increment
             clc
             adc DisplayDigits,y       ;add to current digit
             bmi BorrowOne             ;if result is a negative number, branch to subtract
             cmp #10
             bcs CarryOne              ;if digit greater than $09, branch to add
StoreNewD:  sta DisplayDigits,y       ;store as new score or game timer digit
             dey                       ;move onto next digits in score or game timer
             dex                       ;and digit amounts to increment
             bpl AddModLoop            ;loop back if we're not done yet
EraseDMods: lda #$00                  ;store zero here
             ldx #$06                  ;start with the last digit
EraseMLoop: sta DigitModifier-1,x     ;initialize the digit amounts to increment
             dex
             bpl EraseMLoop            ;do this until they're all reset, then leave
             rts
BorrowOne:  dec DigitModifier-1,x     ;decrement the previous digit, then put $09 in
             lda #$09                  ;the game timer digit we're currently on to "borrow
             bne StoreNewD             ;the one", then do an unconditional branch back
CarryOne:   cpy #$06
             bne +
             ldy #$01
             sty Averveamos
             sty TopMaxedOut
             ldy #$06
+:            sec                       ;subtract ten from our digit to make it a
             sbc #10                   ;proper BCD number, then increment the digit
             inc DigitModifier-1,x     ;preceding current digit to "carry the one" properly
             jmp StoreNewD             ;go back to just after we branched here
             
             
UpdateTopScore:
             
             
             
             
             
             
             rts
             
             
DefaultSprOffsets:
             .db $00, $30, $48, $60, $78, $90, $a8, $c0
             .db $d8, $e8, $24, $f8, $fc, $28, $2c
             
             
InitializeGame:
             ldy #$6f              ;clear all memory as in initialization procedure,
             jsr InitializeMemory  ;but this time, clear only as far as $076f
             ldy #$1f
ClrSndLoop:  sta SoundMemory,y     ;clear out memory used
             dey                   ;by the sound engines
             bpl ClrSndLoop
             if BATTERY
             jsr LoadBattery
             endif
             
             lda #$18              ;set demo timer
             sta DemoTimer
             jsr LoadAreaPointer
             lda #$00
             sta OldStatus
             
             
InitializeArea:
             jsr UpdateLives
             ldy VRAM_Buffer1_Offset
             ldy #$00
             sty GrabFlag
             sty GrabDown
             sty GrabUp
             sty LakituRespawning
             sty WarpZoneCheck
             sty EnemyDefeatPitch
             sty BowserKilled
             ;sty HurryUp
             sty DebugSwim
             sty HurryUp+1
             ldy #$4b                 ;clear all memory again, only as far as $074b
             jsr InitializeMemory     ;this is only necessary if branching from
             ldx #$0b
             lda #$00
-:               sta AreaObjectLength,x
             dex
             bpl -
             
             ldx #$21
             lda #$00
ClrTimersLoop: sta Timers,x             ;clear out memory between
             dex                      ;$0780 and $07a1
             bpl ClrTimersLoop
             lda HalfwayPage
             ldy AltEntranceControl   ;if AltEntranceControl not set, use halfway page, if any found
             beq StartPage
             lda EntrancePage         ;otherwise use saved entry page number here
StartPage:     sta ScreenLeft_PageLoc   ;set as value here
             sta EntrancePage
             sta BackloadingFlag      ;set flag here if halfway page or saved entry page number found
             lda #$00
             sta CurrentPageLoc       ;also set as current page
             lda ScreenLeft_X_Pos    ;get coordinate of screen's left boundary
             clc
             adc #$ff                ;add 255 pixels
             sta ScreenRight_X_Pos   ;store as coordinate of screen's right boundary
             lda ScreenLeft_PageLoc  ;get page number where left boundary is
             adc #$00                ;add carry from before
             sta ScreenRight_PageLoc ;store as page number where right boundary is
             ;lda EntrancePage
             ;bne +
             ldy #$20
             and #%00000001
             beq SetInitNTHigh
             ldy #$24
             jmp SetInitNTHigh
             
+:               ldy #$24                 ;if on odd numbered page, use $2480 as start of rendering
             and #%00000001           ;otherwise use $2080, this address used later as name table
             beq SetInitNTHigh        ;address for rendering of game area
             ldy #$20
SetInitNTHigh: sty CurrentNTAddr_High   ;store name table address
             ldy #$80
             ;ldx EntrancePage
             ;beq +
             ;ldy #$94
+:             sty CurrentNTAddr_Low
             asl                      ;store LSB of page number in high nybble
             asl                      ;of block buffer column position
             asl
             asl
             sta BlockBufferColumnPos
             
             ldx #$0b
             lda #$00
-:               dec AreaObjectLength,x
             dex
             bpl -
             
             lda #$0b                 ;set value for renderer to update 12 column sets
             sta ColumnSets           ;12 column sets = 24 metatile columns = 1 1/2 screens
             jsr GetAreaDataAddrs     ;get enemy and level addresses and load header
             lda PrimaryHardMode      ;check to see if primary hard mode has been activated
             bne SetSecHard           ;if so, activate the secondary no matter where we're at
             lda WorldNumber
             cmp #SecHardModeWorld    ;if less than 5, do not activate secondary
             bcc CheckHalfway
             bne SetSecHard           ;if not equal to, then world > 5, thus activate
             lda LevelNumber          ;otherwise, world 5, so check level number
             cmp #Level3              ;if 1 or 2, do not set secondary hard mode flag
             bcc CheckHalfway
SetSecHard:    inc SecondaryHardMode    ;set secondary hard mode flag for areas 5-3 and beyond
CheckHalfway:  lda HalfwayPage
             beq DoneInitArea
             lda HardModeFlag
             bne DoneInitArea
             lda #$02                 ;if halfway page set, overwrite start position from header
             sta PlayerEntranceCtrl
DoneInitArea:  lda #Silence             ;silence music
             sta AreaMusicQueue
             inc PseudoRandomBitReg
             lda PseudoRandomBitReg
             sta seed
             lda #PseudoRandomBitReg+1
             sta seed+1
             lda #$01                 ;disable screen output
             sta DisableScreenFlag
             sta DontDecPT
             sta scrolldir
             sta olddirscroll
             sta ParallaxOffset
             inc OperMode_Task        ;increment one of the modes
             lsr
             sta stopload
             sta DisableScreenFlag2
             sta CrouchingFlag2
             sta GlobalSaveOffset
             ldx #$05
-:               sta SavedOffset,x
             dex
             bpl -
             lda #$66
             sta $fc
             lda EntrancePage
             clc
             adc #$66
             sta $fa
             ;add #$01
             sta ScrollLeftLock
             ldy #$00
             sty ScrollLeftFlag
             sty $fb
             sty $ff
             sty dontscroll
             sty FlagpoleEnemyPage
             ldy #$75
             sty ScrollLockPageLoc
             ldy #$0f
             sty ScrollLockColumnPos
             rts
             lda EntrancePage
             beq +
             lda ScreenLeft_X_Pos
             sec
             sbc #$40
             sta ScreenLeft_X_Pos
             lda EntrancePage
             sec
             sbc #$01
             sta ScreenLeft_PageLoc
+:               rts
             ;rts
             
             
PrimaryGameSetup:
             lda SavedJoypad1Bits
             sta OldSavedJoypadBits
             lda #$01
             sta FetchNewGameTimerFlag   ;set flag to load game timer from header
             sta PlayerSize              ;set player's size to small
             if TEST_LUIGI
             sta CurrentPlayer
             endif
             
             if TEST_PLAYER > 0
             lda #TEST_PLAYER
             sta CurrentPlayer
             endif
             
             
             if CHEAT_START_FIERY
             lda #$00
             sta PlayerSize
             lda #$02
             sta PlayerStatus
             endif
             
             lda #$04
             sta NumberofLives           ;give each player five lives
             
             ;lda NumberofLives-OnscreenPlayerInfo
             
             ;sta OffScr_NumberofLives
             
SecondaryGameSetup:
             lda #$00
             sta DisableScreenFlag     ;enable screen output
             tay
ClearVRLoop: sta VRAM_Buffer1-1,y      ;clear buffer at $0300-$03ff
             iny
             bne ClearVRLoop
ClearVRLoo2: sta $0300,y                 ;clear buffer at $0300-$03ff
             iny
             bne ClearVRLoo2
             sta GameTimerExpiredFlag  ;clear game timer exp flag
             sta DisableIntermediate   ;clear skip lives display flag
             sta BackloadingFlag       ;clear value here
             lda #$ff
             sta BalPlatformAlignment  ;initialize balance platform assignment flag
             lda ScreenLeft_PageLoc    ;get left side page location
             and #$01                  ;mask out all but LSB of page location
             sta NameTableSelect         ;this is to set the proper PPU name table
             jsr GetAreaMusic          ;load proper music into queue
             lda #$38                  ;load sprite shuffle amounts to be used later
             sta SprShuffleAmt+2
             lda #$48
             sta SprShuffleAmt+1
             lda #$58
             sta SprShuffleAmt
             ldx #$0e                  ;load default OAM offsets into $06e4-$06f2
ShufAmtLoop: lda DefaultSprOffsets,x
             sta SprDataOffset,x
             dex                       ;do this until they're all set
             bpl ShufAmtLoop
             inc IRQDisable
             inc OperMode_Task         ;increment to next task
             jsr SetupTextbox1
             lda WorldNumber
             cmp #$04
             bne +
             lda AreaNumber
             cmp #$03
             bne +
             lda #$01
             sta BackgroundColorCtrl
             
+:               
             
             jmp GetPlayerColors       ;get player colors
             
MusicSelectData:
             .db WaterMusic, GroundMusic, UndergroundMusic, CastleMusic
             .db CloudMusic, PipeIntroMusic, PSwitchMusic
             
GetAreaMusic:
             lda OperMode           ;if in title screen mode, leave
             beq ExitGetM
             lda AltEntranceControl ;check for specific alternate mode of entry
             cmp #$02               ;if found, branch without checking starting position
             beq ChkAreaType        ;from area object data header
             ldy #$05               ;select music for pipe intro scene by default
             lda PlayerEntranceCtrl ;check value from level header for certain values
             cmp #$06
             beq StoreMusic         ;load music for pipe intro scene if header
             cmp #$07               ;start position either value $06 or $07
             beq StoreMusic
ChkAreaType: ldy #$06
             lda PTimer
             cmp #$02
             bcc +
             lda AreaMusicBuffer
             beq StoreMusic
             rts
+:             ldy AreaType           ;load area type as offset for music bit
             lda CloudTypeOverride
             beq StoreMusic         ;check for cloud type override
             ldy #$04               ;select music for cloud type level if found
StoreMusic:  lda MusicSelectData,y  ;otherwise select appropriate music for level type
             ldy PTimer
             dey
             dey
             bmi +
             lda #$5f
+:           sta AreaMusicQueue     ;store in queue and leave
ExitGetM:    rts
             
             
             
             
WorldNumberOffsetY:
             .db Wo1-YposLevelOffset
             .db Wo2-YposLevelOffset
             .db Wo3-YposLevelOffset
             .db Wo4-YposLevelOffset
             .db Wo5-YposLevelOffset
             .db Wo6-YposLevelOffset
             .db Wo7-YposLevelOffset
             .db Wo8-YposLevelOffset
             .db Wo9-YposLevelOffset
YposLevelOffset:
Wo1: .db $b0, $b0, $00, $b0, $50
Wo2: .db $b0, $b0, $00, $b0, $50
Wo3: .db $b0, $b0, $b0, $50
Wo4: .db $b0, $a0, $b0, $50
Wo5: .db $b0, $90, $b0, $50
Wo6: .db $b0, $60, $a0, $60
Wo7: .db $b0, $b0, $00, $50, $50
Wo8: .db $b0, $b0, $b0, $50
Wo9: .db $b0, $b0, $00, $b0, $50
             
Entrance_GameTimerSetup:
             lda ScreenLeft_PageLoc
             ;ldy EntrancePage
             ;beq +
             ;lda ScreenLeft_PageLoc      ;set current page for area objects
             ;clc
             ;adc #$01
+:          sta Player_PageLoc          ;as page location for player
             ldy AreaType
             lda ForceThing,y            ;store value here
             sta VerticalForceDown       ;for fractional movement downwards if necessary
             lda #$01                    ;set high byte of player position and
             sta PlayerFacingDir         ;set facing direction so that player faces right
             sta Player_Y_HighPos
             lsr                    ;set player state to on the ground by default
             sta Player_State
             dec Player_CollisionBits    ;initialize player's collision bits
             tay                    ;initialize halfway page
             sty HalfwayPage      
             lda AreaType                ;check area type
             bne ChkStPos                ;if water type, set swimming flag, otherwise do not set
             iny
ChkStPos: sty SwimmingFlag
             ldx PlayerEntranceCtrl      ;get starting position loaded from header
             ldy AltEntranceControl      ;check alternate mode of entry flag for 0 or 1
             beq SetStPos
             cpy #$01
             beq SetStPos
             ldx AltYPosOffset-2,y       ;if not 0 or 1, override $0710 with new offset in X
SetStPos: lda PlayerStarting_X_Pos,y  ;load appropriate horizontal position
             sta Player_X_Position       ;and vertical positions for the player, using
             ;lda EntrancePage
             jmp +
             lda ScreenLeft_X_Pos
             clc
             adc #$ff
             sta ScreenRight_X_Pos
             ;lda ScreenRight_PageLoc
             ;adc #$00
             ;sta ScreenRight_PageLoc
             lda #$c0
             sta HorizontalScroll
             sta OldHorizontalScroll
             lda ScreenLeft_PageLoc
             and #$01
             sta NameTableSelect
+:
             lda PlayerBGPriorityData,x
             sta Player_SprAttrib        ;set player sprite attributes using offset in X
             ;lda PlayerStarting_Y_Pos,x  ;AltEntranceControl as offset for horizontal and either $0710
             lda AltEntranceControl
             cmp #$02
             bcc +
             lda PlayerStarting_Y_Pos,x 
             bne ++
+:          lda WorldNumber
             tax
             lda WorldNumberOffsetY,x
             clc
             adc AreaNumber
             tax
             lda YposLevelOffset,x
++:             
             sta Player_Y_Position       ;or value that overwrote $0710 as offset for vertical
             
             jsr GetPlayerColors         ;get appropriate player palette
             ldy GameTimerSetting        ;get timer control value from header
             beq ChkOverR                ;if set to zero, branch (do not use dummy byte for this)
             lda FetchNewGameTimerFlag   ;do we need to set the game timer? if not, use 
             beq ChkOverR                ;old game timer setting
             lda GameTimerData,y         ;if game timer is set and game timer flag is also set,
             sta GameTimerDisplay        ;use value of game timer control for first digit of game timer
             lda #$00
             sta HurryUp
             sta pspeed
             sta pspeeddelay
             sta DisableScreenFlag
             lda #$01
             sta GameTimerDisplay+2      ;set last digit of game timer to 1
             lda GameTimerSec,y
             sta GameTimerDisplay+1      ;set second digit of game timer
             lda #$00
             sta FetchNewGameTimerFlag   ;clear flag for game timer reset
             sta wea32
             sta StarInvincibleTimer     ;clear star mario timer
ChkOverR: ldy JoypadOverride          ;if controller bits not set, branch to skip this part
             beq ChkSwimE
             lda #$03                    ;set player state to climbing
             sta Player_State
             ldx #$00                    ;set offset for first slot, for block object
             jsr InitBlock_XY_Pos
             lda #$f0                    ;set vertical coordinate for block object
             sta Block_Y_Position
             ldx #$05                    ;set offset in X for last enemy object buffer slot
             ldy #$00                    ;set offset in Y for object coordinates used earlier
             jsr Setup_Vine1             ;do a sub to grow vine
ChkSwimE: 
SetPESub: lda #$07                    ;set to run player entrance subroutine
             sta GameEngineSubroutine    ;on the next frame of game engine
             lda #$05
             sta FballCooldown
             sta EntranceCoolDown
putpspeeddisplay:
             lda #$20
             sta VRAM_Buffer1,y
             lda #$49
             sta VRAM_Buffer1+1,y
             lda #$01
             sta VRAM_Buffer1+2,y
             ;lda #$28
             ;sta VRAM_Buffer1+3,y
             lda pspeed
             sta VRAM_Buffer1+3,y
             lda #$00
             sta VRAM_Buffer1+4,y
             tya
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
             rts
             
FirstSprXPos:
             .db $04, $00, $04, $00
             
FirstSprYPos:
             .db $00, $04, $00, $04
             
SecondSprXPos:
             .db $00, $08, $00, $08
             
SecondSprYPos:
             .db $08, $00, $08, $00
             
FirstSprTilenum:
             .db $80, $82, $81, $83
             
SecondSprTilenum:
             .db $81, $83, $80, $82
             
HammerSprAttrib:
             .db $03, $03, $c3, $c3
             
JumpingCoinTiles:
             .db $60, $61, $62, $63
             
             
PlayerLoseLife:
             inc DisableScreenFlag    ;disable screen and sprite 0 check
             lda #$00
             sta IRQDisable
             lda #Silence             ;silence music
             sta EventMusicQueue
             if CHEATS && INFINITE_LIVES
             jmp StillInGame
             endif
             dec NumberofLives        ;take one life from player
             lda NumberofLives
             cmp #$ff
             bne StillInGame          ;if player still has lives, branch
             lda #$00
             sta OperMode_Task        ;initialize mode task,
             lda #GameOverModeValue   ;switch to game over mode
             sta OperMode             ;and leave
             rts
StillInGame: 
             lda #$00                 ;beginning of the level
             sta HalfwayPage          ;store as halfway page for player
             ;jsr TransposePlayers     ;switch players around if 2-player game
             jmp ContinueGame         ;continue the game
             
             
GameOverMode:
             lda OperMode_Task
             jsr JumpEngine
             
             .dw SetupGameOver
             .dw ScreenRoutines
             .dw RunGameOver
             
             
SetupGameOver:
             lda #$00                  ;reset screen routine task control for title screen, game,
             sta ScreenRoutineTask     ;and game over modes
             sta IRQDisable  ;disable sprite 0 check
             if GAME_OVER_MENU == 1
             sta ContinueMenuSelect ;set continue as default choice
             endif
             lda #GameOverMusic
             sta EventMusicQueue       ;put game over music in secondary queue
             inc DisableScreenFlag     ;disable screen output
             inc OperMode_Task         ;set secondary mode to 1
             
             rts
             
             
RunGameOver:
             lda #$00              ;reenable screen
             sta DisableScreenFlag
             if GAME_OVER_MENU == 1
             ;lda WorldNumber       ;if on world 8, branch on to end the game
             ;cmp #FinalWorld
             ;beq W8End
             jsr GameOverMenu1      ;otherwise run game over menu
             lda $02
             beq +
             jmp ContinueGame
+:           rts
W8End: lda ScreenTimer
             bne ExRGO
             else
             lda SavedJoypad1Bits  ;check controller for start pressed
             and #Start_Button
             bne TerminateGame
             lda ScreenTimer       ;if not pressed, wait for
             bne GameIsOn          ;screen timer to expire
             endif
             
TerminateGame:
             lda #Silence          ;silence music
             sta EventMusicQueue
             lda WorldNumber       ;otherwise put world number of current
             sta ContinueWorld     ;player into secret continue function variable
             lda #$00
             sta OperMode_Task     ;reset all modes to title screen and
             sta ScreenTimer       ;leave
             sta HardModeFlag
             sta OperMode
             sta dontchecklag
             sta lagframedetect
             if GAME_OVER_MENU == 1
ExRGO:
             endif
             rts
             
ContinueGame:
             jsr LoadAreaPointer       ;update level pointer with
             lda #$01                  ;actual world and area numbers, then
             sta PlayerSize            ;reset player's size, status, and
             inc FetchNewGameTimerFlag ;set game timer flag to reload
             lda #$00                  ;game timer from header
             sta TimerControl          ;also set flag for timers to count again
             sta PlayerStatus
             sta GameEngineSubroutine  ;reset task for game core
             sta OperMode_Task         ;set modes and leave
             lda #$01                  ;if in game over mode, switch back to
             sta TimerWa
             sta OperMode              ;game mode, because game is still on
             sta ScreenRoutineTask
GameIsOn:  rts
             
             
TransposePlayers:
             ;sec
             ;lda NumberOfPlayers       ;if only a 1 player game, leave
             ;beq ExTrans
             ;clear carry flag to get game going
ExTrans:   ;rts
             
             
             
             
LevelDataStart:
             if IMPORT_LEVELS == 1
             .incbin LEVEL_FILE, OriginalLevelDataStart - $8000 + $10, $1226 ; 0x1cc4, 0x1226
             
             WorldAddrOffsets = LevelDataStart
             AreaAddrOffsets = WorldAddrOffsets + $08
             EnemyAddrHOffsets = AreaAddrOffsets + $24
             EnemyDataAddrLow = EnemyAddrHOffsets + $04
             EnemyDataAddrHigh = EnemyDataAddrLow + $22
             AreaDataHOffsets = EnemyDataAddrHigh + $22
             AreaDataAddrLow = AreaDataHOffsets + $04
             AreaDataAddrHigh = AreaDataAddrLow + $22
             else
             ;include tools\output.txt
             ;include code\levelData.asm
             ;include code\levelData_great.asm
             -   
             endif
             rts
             
GameMode:
             lda #$00
             sta bocata
             sta bocata3
             lda OperMode_Task
             jsr JumpEngine
             
             .dw InitializeArea
             .dw ScreenRoutines
             .dw SecondaryGameSetup
             .dw GameCoreRoutine
             
             
GameCoreRoutine:
             ;lda CurrentPlayer
             ;and #%00000001
             ;tax
             
             ;ldx CurrentPlayer          ;get which player is on the screen
             ;lda SavedJoypadBits;,x      ;use appropriate player's controller bits
             ;sta SavedJoypadBits        ;as the master controller bits
             jsr GameRoutines           ;execute one of many possible subs
             lda OperMode_Task          ;check major task of operating mode
             cmp #$03                   ;if we are supposed to be here,
             bcs GameEngine             ;branch to the game engine itself
             rts
             
GameEngine:
             lda PlayerStatus           ;check player's status
             cmp #$02
             bne +                         ;if not fiery, branch
             jsr ProcFireball_Bubble    ;process fireballs and air bubbles
+:            ldx #$00
             
             
-:              stx ObjectOffset           ;put incremented offset in X as enemy object offset
             jsr EnemiesAndLoopsCore    ;process enemy objects
             lda FloateyNum_Control,x   ;load control for floatey number
             beq +
             jsr FloateyNumbersRoutine  ;process floatey numbers
+:            inx                         ;
             cpx #$06                   ;do these two subroutines until the whole buffer is done
             bne -
             ;set offsets for player-specific variables
             lda #$00
             tax ;save offscreen bits offset to stack for now
             pha
             jsr GetXOffscreenBits  ;do subroutine here
             tay
             lda MSBtoLSB,y
             sta $00                ;store here
             jsr GetYOffscreenBits
             tay
             lda LSBtoMSB,y
             ora $00                     ;mask together with previously saved low nybble
             sta $00                     ;store both here
             pla                         ;get offscreen bits offset from stack
             tay
             lda $00                     ;get value here and store elsewhere
             sta SprObject_OffscrBits,y
             ;ldx ObjectOffset
             ldx #$00      ;set offsets for relative cooordinates
             ldy #$00      ;routine to correspond to player object
             lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset 
             jsr PlayerGfxHandler       ;draw the player
             jsr BlockObjMT_Updater     ;replace block objects with metatiles if necessary
             
             ldx #$01
             stx ObjectOffset           ;set offset for second
             jsr BlockObjectsCore       ;process second block object
             dex
             stx ObjectOffset           ;set offset for first
             jsr BlockObjectsCore       ;process first block object
             jsr MiscObjectsCore        ;process misc objects (hammer, jumping coins)
             jsr ProcessCannons         ;process bullet bill cannons
             
             ;lda FramesMissed
             ; beq +
             ; dec FramesMissed
+:               
             ;lda AreaType
             ;bne +
             ;jsr ProcessWhirlpools      ;process whirlpools
+:            lda WarpZoneCheck
             beq +
             lda ScrollLockPageLoc
             cmp $fa
             bne + 
             lda $ff
             and #$0f
             cmp ScrollLockColumnPos
             bne +
             inc WarpZoneControl
             jsr DoWarpZone
+:              ldx $7fcc
-:              lda Enemy_ID,x
             cmp #FlagpoleFlagObject   ;if flagpole flag not found,
             beq +             ;branch to leave
             inx
             cpx #$06
             bcc -
             jmp ++
+:               jsr FlagpoleRoutine        ;process the flagpole
++:              
             if !(CHEATS && CHEAT_REMOVE_TIMER)
             jsr RunGameTimer           ;count down the game timer
             endif
             lda Player_Y_HighPos
             cmp #$02                   ;if player is below the screen, don't bother with the music
             bpl NoChgMus
             
             lda PTimer
             cmp #$01
             bne +
             jsr GetAreaMusic           ;to re-attain appropriate level music
+:            lda $7fb8
             beq +
             jsr idk
+:              lda StarInvincibleTimer    ;if star mario invincibility timer at zero,
             bne ++              ;skip this part
             ldx WaitForReset
             beq ClrPlrPal
             ldx #$00
             stx EnemyDefeatPitch
             stx WaitForReset
             jmp ClrPlrPal
++:              cmp #$01
             bne +
             sta WaitForReset
+:            cmp #$04
             bne NoChgMus               ;if not yet at a certain point, continue
             lda IntervalTimerControl   ;if interval timer not yet expired,
             bne NoChgMus               ;branch ahead, don't bother with the music
             jsr GetAreaMusic           ;to re-attain appropriate level music
NoChgMus:     ldy StarInvincibleTimer    ;get invincibility timer
             lda FrameCounter           ;get frame counter
             cpy #$04                   ;if timer still above certain point,
             bcs CycleTwo               ;branch to cycle player's palette quickly
             lsr                        ;otherwise, divide by 8 to cycle every eighth frame
             lsr
CycleTwo:     lsr                        ;if branched here, divide by 2 to cycle every other frame
jsr CyclePlayerPalette     ;do sub to cycle the palette (note: shares fire flower code)
             jmp SaveAB                 ;then skip this sub to finish up the game engine
ClrPlrPal:    jsr ResetPalStar           ;do sub to clear player's palette bits in attributes
SaveAB:       lda A_B_Buttons            ;save current A and B button
             sta PreviousA_B_Buttons    ;into temp variable to be used on next frame
             lda #$00
             sta Left_Right_Buttons     ;nullify left and right buttons temp variable
UpdScrollVar: lda VRAM_Buffer_AddrCtrl
             cmp #$06                   ;if vram address controller set to 6 (one of two $0341s)
             beq ExitEng                ;then branch to leave
             lda AreaParserTaskNum      ;otherwise check number of tasks
             bne RunParser
             lda Player_X_Scroll
             bmi ++
             lda ScrollThirtyTwo        ;get horizontal scroll in 0-31 or $00-$20 range
             cmp #$20                   ;check to see if exceeded $21
             bmi ExitEng                ;branch to leave if not
             lda ScrollThirtyTwo
             sbc #$20                   ;otherwise subtract $20 to set appropriately
             sta ScrollThirtyTwo        ;and store
             jmp +
++:              lda ScrollThirtyTwo
             bpl ExitEng
             lda ScrollThirtyTwo
             clc
             adc #$20
             sta ScrollThirtyTwo
+:            lda #$00                   ;reset vram buffer offset used in conjunction with
             sta VRAM_Buffer2_Offset    ;level graphics buffer at $0341-$035f
RunParser:    jmp AreaParserTaskHandler1  ;update the name table with more level graphics
ExitEng:      rts                        ;and after all that, we're finally done!
             
             
             
ScrollHandler:
             lda Player_X_Scroll       ;load value saved here
             clc
             adc Platform_X_Scroll     ;add value used by left/right platforms
             adc SideCollisionAdder
             sta Player_X_Scroll       ;save as new value here to impose force on scroll
             bne +
             sta ScrollAmount
+:            lda ScrollLock            ;check scroll lock flag
             ora dontscroll
             bne InitScrlAmt1           ;skip a bunch of code here if set
             ldy #$00
             lda AutoScrollFlag
             beq +
             lda GameEngineSubroutine
             cmp #$05
             beq +
             cmp #$08
             bne ++
             ldy #$01
             sty Player_X_Scroll
             lda Player_Pos_ForScroll
             beq +++
             dey
             cmp #$ff
             bne +
             ldx #$00
             jmp KillPlayer
InitScrlAmt1: jmp InitScrlAmt
++:            rts
+++:         ldy ScrollAmount
+:            sty AutoScrollFlag2
             lda AutoScrollFlag
             bne ++
             lda Player_Pos_ForScroll
             cmp #$6d                  ;check player's horizontal screen position
             bcc +                     ;if less than 80 pixels to the right, branch
             cmp #$78
             bcs ++
             jmp InitScrlAmt1
             lda SideCollisionTimer    ;if timer related to player's side collision
             bne InitScrlAmt1           ;not expired, branch
+:          ldy Player_X_Scroll       ;get value and decrement by one
             dey                       ;if value originally set to zero or otherwise
             bpl InitScrlAmt1
             lda #$00
             sta scrolldir
             jmp +++
++:            ldy Player_X_Scroll
             dey
             bmi InitScrlAmt1
             lda #$01
             sta scrolldir
             lda ScreenLeft_PageLoc
             clc
             adc #$67
             cmp ScrollLockPageLoc
             bcc +++
             beq ++
             bcs +
++:            lda ScreenLeft_X_Pos
             lsr
             lsr
             lsr
             lsr
             and #$0f
             cmp ScrollLockColumnPos
             bcc +++
             lda OperMode
             cmp #$02
             beq InitScrlAmt1
             lda HorizontalScroll
             and #$f0
             sta HorizontalScroll
             sta OldHorizontalScroll
             sta ScreenLeft_X_Pos
             lda ScrollLockPageLoc
             sec
             sbc #$67
             sta ScreenLeft_PageLoc
             lda ScreenLeft_X_Pos
             clc
             adc #$ff
             sta ScreenRight_X_Pos
             lda ScreenLeft_PageLoc
             adc #$00
             sta ScreenRight_PageLoc
             lda #$00
             sta ScrollAmount
+:            jmp InitScrlAmt1
+++:        ldy #$00
             lda ScreenEdge_PageLoc
             ora ScreenRight_PageLoc
             bne +
             lda ScreenRight_X_Pos
             and ScreenLeft_X_Pos
             bne +
             lda Player_X_Scroll
             bcs +
             iny
+:            sty ScrollLeftFlag
             lda ScreenLeft_PageLoc
             clc
             adc #$66
             cmp ScrollLeftLock
             bcs ++
+:            inc ScrollLeftFlag
             lda #$00
             sta HorizontalScroll
             sta ScrollAmount
             lda ScrollLeftLock
             and #$01
             sta NameTableSelect
+:          ldy Player_X_Scroll       ;get value and decrement by one
             dey                       ;if value originally set to zero or otherwise
             bpl ++                    ;negative for left movement, branch
             jmp InitScrlAmt
oooooooooooooo: jmp llorica
ohnoeswillyrex1: jmp ohnoeswillyrex
++:         lda #$00
             sta WasLocked
             iny
             cpy #$02                  ;if value $01, branch and do not decrement
             bcc ChkNearMid
             dey                       ;otherwise decrement by one
ChkNearMid: 
             ldy Player_X_Scroll       ;otherwise get original value undecremented
             
ScrollScreen:
             ;lda IRQAckFlag
             ;bne ScrollScreen
             lda OperMode_Task
             cmp #$02
             beq ohnoeswillyrex1
             lda Player_X_Scroll
             beq oooooooooooooo
             bpl ohnoeswillyrex1
             tya
             sta ScrollAmount          ;save value here
             clc
             adc ScrollThirtyTwo       ;add to value already set here
             sta ScrollThirtyTwo       ;save as new value here
             tya
             clc
             adc ScreenLeft_X_Pos      ;add to left side coordinate
             sta ScreenLeft_X_Pos      ;save as new left side coordinate
             sta HorizontalScroll      ;save here also
             lda ScreenLeft_PageLoc
             sbc #$00                  ;add carry to page location for left
             sta ScreenLeft_PageLoc    ;side of the screen
             and #$01                  ;get LSB of page location
             sta NameTableSelect                  ;save as temp variable for PPU register 1 mirror
             lda ScreenLeft_PageLoc
             clc
             adc #$66
             cmp ScrollLeftLock
             bcs +++
             lda #$00
             sta HorizontalScroll
             sta ScrollAmount
             sta ScreenLeft_X_Pos
             lda ScrollLeftLock
             sec
             sbc #$66
             sta ScreenLeft_PageLoc
             sta ScreenRight_PageLoc
             lda #$ff
             sta ScreenRight_X_Pos
             inc ScrollLeftFlag
             lda ScrollLeftLock
             and #$01
             sta NameTableSelect
+++:          lda ParallaxOffset
             beq +++
             lda ScrollAmount
             beq ++++
             dec ParallaxOffset
             jmp ++++
+++:          ldy #$17
             sty ParallaxOffset
++++:         ;ldy FramesMissed
             ;beq ++
             ;lda ParallaxOffset
             ;beq ++
             ;lda ScrollAmount
             ;beq ++
             ;dec ParallaxOffset
++:
             jmp ++    
ohnoeswillyrex:              
+:              tya
             sta ScrollAmount          ;save value here
             clc
             adc ScrollThirtyTwo       ;add to value already set here
             sta ScrollThirtyTwo       ;save as new value here
             tya
             clc
             adc ScreenLeft_X_Pos      ;add to left side coordinate
             sta ScreenLeft_X_Pos      ;save as new left side coordinate
             inc ParallaxOffset
             ;ldy FramesMissed
             ;beq +
             ;inc ParallaxOffset
+:           sta HorizontalScroll      ;save here also
             lda ScreenLeft_PageLoc
             adc #$00                  ;add carry to page location for left
             sta ScreenLeft_PageLoc    ;side of the screen
             and #$01                  ;get LSB of page location
             sta NameTableSelect                  ;save as temp variable for PPU register 1 mirror
llorica:
++:              lda ScrollAmount
             beq ++
             bpl +
             lda #$00
             sec
             sbc ScrollAmount
+:              sta temp9
             lda ScrollThirtyTwoOG
             clc
             adc temp9
             sta ScrollThirtyTwoOG
++:              lda ScreenLeft_X_Pos    ;get coordinate of screen's left boundary
             clc
             adc #$ff                ;add 255 pixels
             sta ScreenRight_X_Pos   ;store as coordinate of screen's right boundary
             lda ScreenLeft_PageLoc  ;get page number where left boundary is
             adc #$00                ;add carry from before
             sta ScreenRight_PageLoc ;store as page number where right boundary is
             jmp ChkPOffscr            ;skip this part
InitScrlAmt:  lda #$00
             sta ScrollAmount          ;initialize value here
ChkPOffscr:   ldx #$00                  ;set X for player offset
             jsr GetXOffscreenBits     ;get horizontal offscreen bits for player
             sta $00                   ;save them here
             ldy #$00                  ;load default offset (left side)
             asl                       ;if d7 of offscreen bits are set,
             bcs KeepOnscr             ;branch with default offset
             iny                         ;otherwise use different offset (right side)
             lda $00
             and #%00100000              ;check offscreen bits for d5 set
             beq InitPlatScrl            ;if not set, branch ahead of this part
KeepOnscr:    lda ScreenEdge_X_Pos,y      ;get left or right side coordinate based on offset
             sec
             sbc X_SubtracterData,y      ;subtract amount based on offset
             sta Player_X_Position       ;store as player position to prevent movement further
             lda ScreenEdge_PageLoc,y    ;get left or right page location based on offset
             sbc #$00                    ;subtract borrow
             sta Player_PageLoc          ;save as player's page location
             lda Left_Right_Buttons      ;check saved controller bits
             cmp OffscrJoypadBitsData,y  ;against bits based on offset
             beq InitPlatScrl            ;if not equal, branch
             lda #$00
             sta Player_X_Speed          ;otherwise nullify horizontal speed of player
InitPlatScrl: lda #$00                    ;nullify platform force imposed on scroll
             sta Platform_X_Scroll
             rts
             
X_SubtracterData:
             .db $00, $10
             
OffscrJoypadBitsData:
             .db $01, $02
             
             
             
GameRoutines:
             lda GameEngineSubroutine  ;run routine based on number (a few of these routines are   
             jsr JumpEngine            ;merely placeholders as conditions for other routines)
             
             .dw Entrance_GameTimerSetup     ;00
             .dw Vine_AutoClimb            ;01
             .dw SideExitPipeEntry            ;02
             .dw VerticalPipeEntry            ;03
             .dw FlagpoleSlide                ;04
             .dw PlayerEndLevel            ;05
             .dw PlayerLoseLife            ;06
             .dw PlayerEntrance            ;07
             .dw PlayerCtrlRoutine            ;08
             .dw PlayerChangeSize            ;09
             .dw PlayerInjuryBlink            ;0a
             .dw PlayerDeath                ;0b
             .dw PlayerFireFlower            ;0c
             .dw UpsideDownPipeEntry        ;0d
             ;.dw DoorEntry                ;0e
             
PlayerEntrance:
             lda AltEntranceControl    ;check for mode of alternate entry
             cmp #$02
             beq EntrMode2             ;if found, branch to enter from pipe or with vine
             lda #$00       
             ldy Player_Y_Position     ;if vertical position above a certain
             cpy #$30                  ;point, nullify controller bits and continue
             bcc AutoControlPlayer1     ;with player movement code, do not return
             lda PlayerEntranceCtrl    ;check player entry bits from header
             cmp #$06
             beq ChkBehPipe            ;if set to 6 or 7, execute pipe intro code
             cmp #$07                  ;otherwise branch to normal entry
             bne PlayerRdy
ChkBehPipe: lda Player_SprAttrib      ;check for sprite attributes
             bne IntroEntr             ;branch if found
             lda #$01
AutoControlPlayer1:
             inc peo
             ldy peo
             iny
             bne +
             sty peo
             lda #$08
             sta GameEngineSubroutine
+:          jmp AutoControlPlayer     ;force player to walk to the right
IntroEntr:  jsr EnterSidePipe         ;execute sub to move player to the right
             dec ChangeAreaTimer       ;decrement timer for change of area
             bne ExitEntr              ;branch to exit if not yet expired
             inc DisableIntermediate   ;set flag to skip world and lives display
             jmp NextArea              ;jump to increment to next area and set modes
EntrMode2:  lda JoypadOverride        ;if controller override bits set here,
             bne VineEntr              ;branch to enter with vine
             lda #$ff                  ;otherwise, set value here then execute sub
             jsr MovePlayerYAxis       ;to move player upwards (note $ff = -1)
             lda Player_Y_Position     ;check to see if player is at a specific coordinate
             cmp #$91                  ;if player risen to a certain point (this requires pipes
             bcc PlayerRdy             ;to be at specific height to look/function right) branch
             rts                       ;to the last part, otherwise leave
VineEntr:   lda VineHeight
             cmp #$60                  ;check vine height
             bne ExitEntr              ;if vine not yet reached maximum height, branch to leave
             lda Player_Y_Position     ;get player's vertical coordinate
             cmp #$99                  ;check player's vertical coordinate against preset value
             ldy #$00                  ;load default values to be written to 
             lda #$01                  ;this value moves player to the right off the vine
             bcc OffVine               ;if vertical coordinate < preset value, use defaults
             lda #$03
             sta Player_State          ;otherwise set player state to climbing
             iny                       ;increment value in Y
             lda #$08                  ;set block in block buffer to cover hole, then 
             sta Block_Buffer_1+$b4    ;use same value to force player to climb
OffVine:    sty DisableCollisionDet   ;set collision detection disable flag
             jsr AutoControlPlayer     ;use contents of A to move player up or right, execute sub
             lda Player_X_Position
             cmp #$48                  ;check player's horizontal position
             bcc ExitEntr              ;if not far enough to the right, branch to leave
PlayerRdy:  lda #$08                  ;set routine to be executed by game engine next frame
             sta GameEngineSubroutine
             lda #$01                  ;set to face player to the right
             sta PlayerFacingDir
             lsr                       ;init A
             sta AltEntranceControl    ;init mode of entry
             sta DisableCollisionDet   ;init collision detection disable flag
             sta JoypadOverride        ;nullify controller override bits
             lda #$05
             sta FballCooldown
             sta EntranceCoolDown
             lda #$00
             sta DontDecPT
             sta peo
ExitEntr:   rts                       ;leave!
             
             
AutoControlPlayer:
             sta SavedJoypadBits         ;override controller bits with contents of A if executing here
PlayerCtrlRoutine:
             lda GameEngineSubroutine    ;check task here
             cmp #$0b                    ;if certain value is set, branch to skip controller bit loading
             beq SizeChk
             lda SwimmingFlag
             beq SaveJoyp
             lda Player_Y_HighPos
             beq SaveJoyp
             tay
             dey                         ;if not in vertical area between
             bne DisJoyp                 ;status bar and bottom, branch    
             lda Player_Y_Position
             cmp #$ff                    ;if nearing the bottom of the screen or
             bcc SaveJoyp                ;not in the vertical area between status bar or bottom,
DisJoyp:    lda #$00                    ;disable controller bits
             sta SavedJoypadBits
SaveJoyp:   lda SavedJoypadBits         ;otherwise store A and B buttons in $0a
             and #%11000000
             sta A_B_Buttons
             lda SavedJoypadBits         ;store left and right buttons in $0c
             and #%00000011
             sta Left_Right_Buttons
             lda Up_Down_Buttons
             sta PreviousUp_Down_Buttons
             lda SavedJoypadBits         ;store up and down buttons in $0b
             and #%00001100
             sta Up_Down_Buttons
             and #%00000100              ;check for pressing down
             beq SizeChk                 ;if not, branch
             lda Player_State            ;check player's state
             bne SizeChk                 ;if not on the ground, branch
             ldy Left_Right_Buttons      ;check left and right
             beq SizeChk                 ;if neither pressed, branch
             lda #$00
             sta Left_Right_Buttons      ;if pressing down while on the ground,
             sta Up_Down_Buttons         ;nullify directional bits
SizeChk:    jsr PlayerMovementSubs      ;run movement subroutines
             ldy #$01                    ;is player small?
             lda PlayerSize
             beq +
             lda CrouchingFlag2
             beq ChkMoveDir
             ldy #$10
             jmp ChkMoveDir
+:          ldy #$00                    ;check for if crouching
             lda CrouchingFlag
             beq ChkMoveDir              ;if not, branch ahead
             ldy #$02                    ;if big and crouching, load y with 2
ChkMoveDir: sty Player_BoundBoxCtrl     ;set contents of Y as player's bounding box size control
             lda #$01                    ;set moving direction to right by default
             ldy Player_X_Speed          ;check player's horizontal speed
             beq PlayerSubs              ;if not moving at all horizontally, skip this part
             bpl SetMoveDir              ;if moving to the right, use default moving direction
             asl                         ;otherwise change to move to the left
SetMoveDir: sta Player_MovingDir        ;set moving direction
PlayerSubs: jsr ScrollHandler           ;move the screen if necessary
             ldx #$00                 ;set offsets for player-specific variables
             ldy #$00                 ;and get offscreen information about player
             tya                         ;save offscreen bits offset to stack for now
             pha
             jsr GetXOffscreenBits  ;do subroutine here
             tay
             lda MSBtoLSB,y
             sta $00                ;store here
             jsr GetYOffscreenBits
             tay
             lda LSBtoMSB,y
             ora $00                     ;mask together with previously saved low nybble
             sta $00                     ;store both here
             pla                         ;get offscreen bits offset from stack
             tay
             lda $00                     ;get value here and store elsewhere
             sta SprObject_OffscrBits,y
             ldx ObjectOffset
             jsr RelativePlayerPosition  ;get coordinates relative to the screen
             ldx #$00                    ;set offset for player object
             jsr BoundingBoxCore         ;get player's bounding box coordinates
             jsr PlayerBGCollision       ;do collision detection and process
             ldy SwimmingFlag
             bne +
             sty OldSwim
             ldy #$70
             sty VerticalForceDown
+:          
             lda Player_Y_Position
             cmp #$40                    ;check to see if player is higher than 64th pixel
             bcc PlayerHole              ;if so, branch ahead
             lda GameEngineSubroutine
             cmp #$05                    ;if running end-of-level routine, branch ahead
             beq PlayerHole
             cmp #$07                    ;if running player entrance routine, branch ahead
             beq PlayerHole
             cmp #$04                    ;if running routines $00-$03, branch ahead
             bcc PlayerHole
             cmp #$0d
             beq PlayerHole
             lda Player_SprAttrib
             and #%11011111              ;otherwise nullify player's
             sta Player_SprAttrib        ;background priority flag
PlayerHole: lda Player_Y_HighPos        ;check player's vertical high byte
             cmp #$02                    ;for below the screen
             bmi ExitCtrl                ;branch to leave if not that far down
             ldy GrabFlag
             beq +
             pha
             ldx GrabID
             jsr EraseEnemyObject
             pla
+:          ldy #$00
             sty GrabFlag
             sty DebugSwim
             sty OldStatus
             sty OnOffBits
             sty PTimer
             sty LakituRespawning
             iny
             sty DisableScreenFlag2
             sty ScrollLock              ;set scroll lock
             sty DisableIntermediate
             ldy #$04
             sty $07                     ;set value here
             ldx #$00                    ;use X as flag, and clear for cloud level
             ldy GameTimerExpiredFlag    ;check game timer expiration flag
             bne HoleDie                 ;if set, branch
             ldy CloudTypeOverride       ;check for cloud type override
             bne ChkHoleX                ;skip to last part if found
HoleDie:    inx                         ;set flag in X for player death
             ldy GameEngineSubroutine
             cpy #$0b                    ;check for some other routine running
             beq ChkHoleX                ;if so, branch ahead
             ldy #$ff
             sty TimerControl
             ldy DeathMusicLoaded        ;check value here
             bne HoleBottom              ;if already set, branch to next part
             iny
             sty EventMusicQueue         ;otherwise play death music
             sty DeathMusicLoaded        ;and set value here
HoleBottom: ldy #$06
             sty $07                     ;change value here
ChkHoleX:   cmp $07                     ;compare vertical high byte with value set here
             bmi ExitCtrl                ;if less, branch to leave
             dex                         ;otherwise decrement flag in X
             bmi CloudExit               ;if flag was clear, branch to set modes and other values
             ldy EndTimer                ;check to see if music is still playing
             bne ExitCtrl                ;branch to leave if so
             lda #$06                    ;otherwise set to run lose life routine
             sta GameEngineSubroutine    ;on next frame
ExitCtrl:   rts                         ;leave
             
CloudExit:
             lda #$00
             sta JoypadOverride      ;clear controller override bits if any are set
             jsr SetEntr             ;do sub to set secondary mode
             inc AltEntranceControl  ;set mode of entry to 3
             rts
             
             
Vine_AutoClimb:
             lda Player_Y_HighPos   ;check to see whether player reached position
             bne AutoClimb          ;above the status bar yet and if so, set modes
             lda Player_Y_Position
             cmp #$e4
             bcc SetEntr
AutoClimb: lda #%00001000         ;set controller bits override to up
             sta JoypadOverride
             ldy #$03               ;set player state to climbing
             sty Player_State
             jmp AutoControlPlayer
SetEntr:   lda #$02               ;set starting position to override
             sta AltEntranceControl
             jmp ChgAreaMode        ;set modes
             
             
VerticalPipeEntry:
             lda #$00
             sta GrabFlag
             sta GrabDown
             sta GrabUp
             sta LakituRespawning
             lda #$01             ;set 1 as movement amount
             jsr MovePlayerYAxis  ;do sub to move player downwards
             jsr ScrollHandler    ;do sub to scroll screen with saved force if necessary
             ldy #$00             ;load default mode of entry
             lda WarpZoneControl  ;check warp zone control variable/flag
             bne ChgAreaPipe      ;if set, branch to use mode 0
             iny
             lda AreaType         ;check for castle level type
             cmp #$03
             bne ChgAreaPipe      ;if not castle type level, use mode 1
             iny
             jmp ChgAreaPipe      ;otherwise use mode 2
             
MovePlayerYAxis:
             clc
             adc Player_Y_Position ;add contents of A to player position
             sta Player_Y_Position
             rts
             
UpsideDownPipeEntry:
             lda #$00
             sta DebugSwim
             sta GrabFlag
             sta GrabDown
             sta GrabUp
             sta LakituRespawning
             jsr MovePlayerYAxisUp ;do sub to move player downwards
             jsr ScrollHandler    ;do sub to scroll screen with saved force if necessary
             ldy #$00             ;load default mode of entry
             lda WarpZoneControl  ;check warp zone control variable/flag
             bne ChgAreaPipe      ;if set, branch to use mode 0
             iny
             lda AreaType         ;check for castle level type
             cmp #$03
             bne ChgAreaPipe      ;if not castle type level, use mode 1
             iny
             jmp ChgAreaPipe      ;otherwise use mode 2
DoorEntry:
             lda #$00
             sta DebugSwim
             sta GrabFlag
             sta LakituRespawning
             ldy #$00             ;load default mode of entry
             lda WarpZoneControl  ;check warp zone control variable/flag
             bne ChgAreaPipe      ;if set, branch to use mode 0
             iny
             lda AreaType         ;check for castle level type
             cmp #$03
             bne ChgAreaPipe      ;if not castle type level, use mode 1
             iny
             jmp ChgAreaPipe      ;otherwise use mode 2
MovePlayerYAxisUp:
             lda Player_Y_Position ;add contents of A to player position
             sec
             sbc #$01
             sta Player_Y_Position
             rts
             
             
SideExitPipeEntry:
             jsr EnterSidePipe         ;execute sub to move player to the right
             ldy #$02
ChgAreaPipe: dec ChangeAreaTimer       ;decrement timer for change of area
             bne ExitCAPipe
             sty AltEntranceControl    ;when timer expires set mode of alternate entry
ChgAreaMode: inc DisableScreenFlag     ;set flag to disable screen output
             lda #$00
             sta OperMode_Task         ;set secondary mode of operation
             sta IRQDisable            ;disable sprite 0 check
ExitCAPipe:  rts                       ;leave
             
EnterSidePipe:
             lda #$08               ;set player's horizontal speed
             sta Player_X_Speed
             ldy #$01               ;set controller right button by default
             lda Player_X_Position  ;mask out higher nybble of player's
             and #%00001111         ;horizontal position
             bne RightPipe
             sta Player_X_Speed     ;if lower nybble = 0, set as horizontal speed
             tay                    ;and nullify controller bit override here
RightPipe: tya                    ;use contents of Y to
             jmp AutoControlPlayer  ;execute player control routine with ctrl bits nulled
             
             
PlayerChangeSize:
             lda TimerControl    ;check master timer control
             cmp #$f8            ;for specific moment in time
             bne EndChgSize      ;branch if before or after that point
             jmp InitChangeSize  ;otherwise run code to get growing/shrinking going
EndChgSize:  cmp #$c4            ;check again for another specific moment
             bne ExitChgSize     ;and branch to leave if before or after that point
             jmp DonePlayerTask  ;otherwise do sub to init timer control and set routine
ExitChgSize: rts                 ;and then leave
             
             
PlayerInjuryBlink:
             lda TimerControl       ;check master timer control
             cmp #$f0               ;for specific moment in time
             bcs ChangeSiz           ;branch if before that point
             cmp #$c8               ;check again for another specific point
             beq DonePlayerTask     ;branch if at that point, and not before or after
             jmp PlayerCtrlRoutine  ;otherwise run player control routine
ChangeSiz: bne ExitBoth
InitChangeSize:
             ldy PlayerChangeSizeFlag  ;if growing/shrinking flag already set
             bne ExitBoth              ;then branch to leave
             sty PlayerAnimCtrl        ;otherwise initialize player's animation frame control
             inc PlayerChangeSizeFlag
             lda HardModeFlag
             bne +
             lda OldStatus
             cmp #$02
             beq ExitBoth
+:          lda PlayerSize
             eor #$01
             sta PlayerSize
ExitBoth: rts                       ;leave
             
PlayerDeath:
             lda TimerControl       ;check master timer control
             cmp #$f0               ;for specific moment in time
             bcs ExitDeath          ;branch to leave if before that point
             lda #$01
             sta DisableIntermediate
             lda #$00
             sta OnOffBits
             sta PTimer
             jmp PlayerCtrlRoutine  ;otherwise run player control routine
             
DonePlayerTask:
             lda #$00
             sta TimerControl          ;initialize master timer control to continue timers
             lda #$08
             sta GameEngineSubroutine  ;set player control routine to run next frame
             rts                       ;leave
             
PlayerFireFlower: 
             lda TimerControl       ;check master timer control
             cmp #$c0               ;for specific moment in time
             beq ResetPalFireFlower ;branch if at moment, not before or after
             lda FrameCounter       ;get frame counter
             lsr
             lsr                    ;divide by four to change every four frames
             
CyclePlayerPalette:
             and #$03              ;mask out all but d1-d0 (previously d3-d2)
             sta $00               ;store result here to use as palette bits
             lda Player_SprAttrib  ;get player attributes
             and #%11111100        ;save any other bits but palette bits
             ora $00               ;add palette bits
             sta Player_SprAttrib  ;store as new player attributes
             rts                   ;and leave
             
ResetPalFireFlower:
             jsr DonePlayerTask    ;do sub to init timer control and run player control routine
             
ResetPalStar:
             lda Player_SprAttrib  ;get player attributes
             and #%11111100        ;mask out palette bits to force palette 0
             sta Player_SprAttrib  ;store as new player attributes
             
ExitDeath:
             rts          ;leave from death routine
             
             
FlagpoleSlide:
             ldx $7fcc
             lda Enemy_ID,x           ;check special use enemy slot
             cmp #FlagpoleFlagObject  ;for flagpole flag object
             bne NoFPObj              ;if not found, branch to something residual
             lda #$04
             sta $7fba
             sta $7fb9
             lda FlagpoleSoundQueue   ;load flagpole sound
             sta Square1SoundQueue    ;into square 1's sfx queue
             ;sta OldSquare1SoundBuffer
             lda #$00
             sta FlagpoleSoundQueue   ;init flagpole sound queue
             ldy Player_Y_Position
             cpy #$9e                 ;check to see if player has slid down
             bcs SlidePlayer          ;far enough, and if so, branch with no controller bits set
             lda #$00
             sta OldSquare1SoundBuffer
             lda #$04                 ;otherwise force player to climb down (to slide)
SlidePlayer: jmp AutoControlPlayer    ;jump to player control routine
NoFPObj:     inc GameEngineSubroutine ;increment to next routine (this may
             rts                      ;be residual code)
             
             
Hidden1UpCoinAmts:
             .db $15, $23, $16, $1b, $17, $18, $23, $63
             
PlayerEndLevel:
             lda #$00
             sta GrabFlag
             sta StarInvincibleTimer
             sta PTimer
             lda #$01                  ;force player to walk to the right
             jsr AutoControlPlayer
             lda Player_State     ;check player's vertical position
             bne ChkStop               ;if player is not yet off the flagpole, skip this part
             lda ScrollLock            ;if scroll lock not set, branch ahead to next part
             beq ChkStop               ;because we only need to do this part once
             lda #EndOfLevelMusic
             sta EventMusicQueue       ;load win level music in event music queue
             lda #$00
             sta ScrollLock            ;turn off scroll lock to skip this part later
ChkStop:  lda Player_CollisionBits  ;get player collision bits
             lsr                       ;check for d0 set
             bcs RdyNextA              ;if d0 set, skip to next part
             lda StarFlagTaskControl   ;if star flag task control already set,
             bne InCastle              ;go ahead with the rest of the code
             inc StarFlagTaskControl   ;otherwise set task control now (this gets ball rolling!)
InCastle: lda #%00100000            ;set player's background priority bit to
             sta Player_SprAttrib      ;give illusion of being inside the castle
             inc dontscroll
RdyNextA: jsr RunStarFlagObj
             lda StarFlagTaskControl
             cmp #$05                  ;if star flag task control not yet set
             bne ExitNA                ;beyond last valid task number, branch to leave
             inc LevelNumber           ;increment level number used for game logic
             lda LevelNumber
             cmp #$03                  ;check to see if we have yet reached level -4
             bne NextArea              ;and skip this last part here if not
             ;inc Hidden1UpFlag         ;otherwise set hidden 1-up box control flag
NextArea: inc Hidden1UpFlag
             inc AreaNumber            ;increment area number used for address loader
             jsr LoadAreaPointer       ;get new level pointer
             inc FetchNewGameTimerFlag ;set flag to load new game timer
             jsr ChgAreaMode           ;do sub to set secondary mode, disable screen and sprite 0
             sta HalfwayPage           ;reset halfway page to 0 (beginning)
             lda #Silence
             sta EventMusicQueue       ;silence music and leave
ExitNA:   rts
             
Testi:
             lda #$00
             sta CrouchingFlag
             ldy GrabFlag
             bne SetCrouch
             lda Player_State
             bne ProcMove
             lda Up_Down_Buttons
             and #%00000100
             sta CrouchingFlag2
             jmp ProcMove
PlayerMovementSubs:
             lda #$00                  ;set A to init crouch flag by default
             ldy PlayerSize            ;is player small?
             bne Testi                 ;if so, branch
             ldy GrabFlag
             bne SetCrouch
             lda Player_State          ;check state of player
             bne ProcMove              ;if not on the ground, branch
             lda Up_Down_Buttons       ;load controller bits for up and down
             and #%00000100            ;single out bit for down button
SetCrouch: sta CrouchingFlag         ;store value in crouch flag
             sta CrouchingFlag2
ProcMove:  jsr PlayerPhysicsSub      ;run sub related to jumping and swimming
             lda PlayerChangeSizeFlag  ;if growing/shrinking flag set,
             bne NoMoveSub             ;branch to leave
             lda Player_State
             cmp #$03                  ;get player state
             beq MoveSubs              ;if climbing, branch ahead, leave timer unset
             ldy #$18
             sty ClimbSideTimer        ;otherwise reset timer now
MoveSubs:  jsr JumpEngine
             
             .dw OnGroundStateSub
             .dw JumpSwimSub
             .dw FallingSub
             .dw ClimbingSub
             
NoMoveSub: rts
             
             
OnGroundStateSub:
             jsr GetPlayerAnimSpeed     ;do a sub to set animation frame timing
             lda Left_Right_Buttons
             beq GndMove                ;if left/right controller bits not set, skip instruction
             sta PlayerFacingDir        ;otherwise set new facing direction
GndMove: jsr ImposeFriction         ;do a sub to impose friction on player's walk/run
             jsr MovePlayerHorizontally ;do another sub to move player horizontally
             pha
             jsr GrabShelltest
             pla
             sta Player_X_Scroll        ;set returned value as player's movement speed for scroll
             rts
             
             
FallingSub:
             lda VerticalForceDown
             sta VerticalForce      ;dump vertical movement force for falling into main one
             jmp LRAir              ;movement force, then skip ahead to process left/right movement
             
ChkWhat:
             lda WaterCooldown
             bne +
             lda A_B_Buttons
             and #A_Button
             beq +
             and PreviousA_B_Buttons
             bne +
             lda Up_Down_Buttons
             and #Down_Dir
             beq +++
             lda #$ff
             sta Player_Y_Speed
+++:    lda Up_Down_Buttons
             and #Up_Dir
             beq +
             lda #$fd
             sta Player_Y_Speed
+:        jmp ExitMS
JumpSwimSub:
             ldy Player_Y_Speed         ;if player's vertical speed zero
             bpl DumpFall               ;or moving downwards, branch to falling
             lda A_B_Buttons
             and #A_Button              ;check to see if A button is being pressed
             and PreviousA_B_Buttons    ;and was pressed in previous frame
             bne ProcSwim               ;if so, branch elsewhere
             lda SwimmingFlag
             beq +
             lda #$00
             sta CrouchingFlag
             sta CrouchingFlag2
+:          lda JumpOrigin_Y_Position  ;get vertical position player jumped from
             sec
             sbc Player_Y_Position      ;subtract current from original vertical coordinate
             cmp DiffToHaltJump         ;compare to value set here to see if player is in mid-jump
             bcc ProcSwim               ;or just starting to jump, if just starting, skip ahead
DumpFall: lda VerticalForceDown      ;otherwise dump falling into main fractional
             sta VerticalForce
ProcSwim: lda SwimmingFlag           ;if swimming flag not set,
             beq LRAir                  ;branch ahead to last part
             lda Up_Down_Buttons
             bne ChkWhat
ExitMS:   jsr GetPlayerAnimSpeed     ;do a sub to get animation frame timing
LRWater:  lda Left_Right_Buttons     ;check left/right controller bits (check for swimming)
             beq LRAir                  ;if not pressing any, skip
             sta PlayerFacingDir        ;otherwise set facing direction accordingly
LRAir:    lda Left_Right_Buttons     ;check left/right controller bits (check for jumping/falling)
             beq JSMove                 ;if not pressing any, skip
             jsr ImposeFriction         ;otherwise process horizontal movement
JSMove:   jsr MovePlayerHorizontally ;do a sub to move player horizontally
             sta Player_X_Scroll        ;set player's speed here, to be used for scroll later
             lda GameEngineSubroutine
             cmp #$0b                   ;check for specific routine selected
             bne ExitMov1               ;branch if not set to run
             lda #$28
             sta VerticalForce          ;otherwise set fractional
ExitMov1: lda GrabFlag
             beq +
             jsr MovePlayerVertically   ;jump to move player vertically, then grab shell and leave
             jmp GrabShelltest
+:        jmp MovePlayerVertically   ;jump to move player vertically, then leave
             
ClimbAdderLow:
             .db $0e, $04, $fc, $f2
ClimbAdderHigh:
             .db $00, $00, $ff, $ff
             
ClimbingSub:
             lda Player_YMF_Dummy
             clc                      ;add movement force to dummy variable
             adc Player_Y_MoveForce   ;save with carry
             sta Player_YMF_Dummy
             ldy #$00                 ;set default adder here
             lda Player_Y_Speed       ;get player's vertical speed
             bpl MoveOnVine           ;if not moving upwards, branch
             dey                      ;otherwise set adder to $ff
MoveOnVine:  sty $00                  ;store adder here
             adc Player_Y_Position    ;add carry to player's vertical position
             sta Player_Y_Position    ;and store to move player up or down
             lda Player_Y_HighPos
             adc $00                  ;add carry to player's page location
             sta Player_Y_HighPos     ;and store
             lda Left_Right_Buttons        
             and #%00000011
             cmp #$03                  ;prevent l+r
             bne +
             lda #$00
             sta Left_Right_Buttons
+:           lda Left_Right_Buttons   ;compare left/right controller bits
             and Player_CollisionBits ;to collision flag
             beq InitCSTimer          ;if not set, skip to end
             ldy ClimbSideTimer       ;otherwise check timer 
             bne ExitCSub             ;if timer not expired, branch to leave
             ldy #$18
             sty ClimbSideTimer       ;otherwise set timer now
             ldx #$00                 ;set default offset here
             ldy PlayerFacingDir      ;get facing direction
             lsr                      ;move right button controller bit to carry
             bcs ClimbFD              ;if controller right pressed, branch ahead
             inx                      ;otherwise increment offset by 2 bytes
             inx
ClimbFD:     dey                      ;check to see if facing right
             beq CSetFDir             ;if so, branch, do not increment
             inx                      ;otherwise increment by 1 byte
CSetFDir:    lda Player_X_Position
             clc                      ;add or subtract from player's horizontal position
             adc ClimbAdderLow,x      ;using value here as adder and X as offset
             sta Player_X_Position
             lda Player_PageLoc       ;add or subtract carry or borrow using value here
             adc ClimbAdderHigh,x     ;from the player's page location
             sta Player_PageLoc
             lda Left_Right_Buttons   ;get left/right controller bits again
             eor #%00000011           ;invert them and store them while player
             sta PlayerFacingDir      ;is on vine to face player in opposite direction
ExitCSub:    rts                      ;then leave
InitCSTimer: sta ClimbSideTimer       ;initialize timer here
             rts
             
             
Luigi_JumpMForceData:
             .db $18, $18, $18, $22, $22, $0d, $04
Luigi_FallMForceData:
             .db $42, $42, $3e, $5d, $5d, $0a, $09
Luigi_FrictionData:
             .db $b4, $68, $50
             ;.db $b4, $68, $a0
             
Enemy_PSwitch:
             lda GrabFlag
             beq +
             cpx GrabID
             bne +
             rts
+:          lda PTimer
             bne +++++
             lda OnOffBits
             and #%00000001
             eor #%00000010
             sta OnOffBits
+++++:      lda #$5f
             sta AreaMusicQueue     ;store in queue and leave
             lda #$60
             sta PTimer
             lda #$00
             sta Enemy_Y_Speed,x         ;initialize vertical speed and fractional
             jmp ErACM
             
JumpMForceData:
             .db $20, $20, $1e, $28, $28, $0d, $04
             
FallMForceData:
             .db $70, $70, $60, $90, $90, $0a, $09
             
PlayerYSpdData:
             .db $fc, $fc, $fc, $fb, $fb, $fe, $ff
             
InitMForceData:
             .db $00, $00, $00, $00, $00, $80, $00
             
MaxLeftXSpdData:
             .db $d8, $e8, $f0, $c8, $e8, $d0, $c1
             
MaxRightXSpdData:
             .db $28, $18, $10, $38, $10, $30, $3f
             .db $0c ;used for pipe intros
             
FrictionData:
             .db $e4, $98, $d0
             
Climb_Y_SpeedData:
             .db $00, $ff, $01
             
Climb_Y_MForceData:
             .db $00, $20, $ff
             
PlayerPhysicsSub:
             lda Player_State          ;check player state
             cmp #$03
             bne CheckForJumping       ;if not climbing, branch
             ldy #$00
             lda Up_Down_Buttons       ;get controller bits for up/down
             and Player_CollisionBits  ;check against player's collision detection bits
             beq ProcClimb             ;if not pressing up or down, branch
             iny
             and #%00001000            ;check for pressing up
             bne ProcClimb
             iny
ProcClimb: ldx Climb_Y_MForceData,y  ;load value here
             stx Player_Y_MoveForce    ;store as vertical movement force
             lda #$08                  ;load default animation timing
             ldx Climb_Y_SpeedData,y   ;load some other value here
             stx Player_Y_Speed        ;store as vertical speed
             bmi SetCAnim              ;if climbing down, use default animation timing value
             lsr                       ;otherwise divide timer setting by 2
SetCAnim:  sta PlayerAnimTimerSet    ;store animation timer setting and leave
             
             lda SavedJoypad1Bits
             and #A_Button
             beq +
             lda PreviousA_B_Buttons
             and #A_Button
             bne +
             sta PlayerOnVine
             lda #$05
             sta VineGrabCooldown
             jmp InitJS
+:         rts
             
CheckForJumping:
             lda #$00
             sta PlayerOnVine
             lda DontJump
             bne NoJump
             lda JumpspringAnimCtrl    ;if jumpspring animating, 
             bne NoJump                ;skip ahead to something else
             lda A_B_Buttons           ;check for A button press
             and #A_Button
             beq NoJump                ;if not, branch to something else
             and PreviousA_B_Buttons   ;if button not pressed in previous frame, branch
             beq ProcJumping
NoJump: lda #$00
             sta DontJump
             jmp X_Physics             ;otherwise, jump to something else
ProcJumping:
             lda PCooldown
             bne InitJS
             lda Player_State           ;check player state
             beq InitJS                 ;if on the ground, branch
             lda SwimmingFlag           ;if swimming flag not set, jump to do something else
             beq NoJump                 ;to prevent midair jumping, otherwise continue
             lda WaterCooldown
             bne NoJump
             lda JumpSwimTimer          ;if jump/swim timer nonzero, branch
             bne InitJS
             lda Player_Y_Speed         ;check player's vertical speed
             bpl InitJS                 ;if player's vertical speed motionless or down, branch
             jmp X_Physics              ;if timer at zero and player still rising, do not swim
InitJS:    lda #$20                   ;set jump/swim timer
             sta JumpSwimTimer
             ldy #$00                   ;initialize vertical force and dummy variable
             sty Player_YMF_Dummy
             sty Player_Y_MoveForce
             lda Player_Y_HighPos       ;get vertical high and low bytes of jump origin
             sta JumpOrigin_Y_HighPos   ;and store them next to each other here
             lda Player_Y_Position
             sta JumpOrigin_Y_Position
             lda #$01                   ;set player state to jumping/swimming
             sta Player_State
             lda Player_XSpeedAbsolute  ;check value related to walking/running speed
             cmp #$09
             bcc ChkWtr                 ;branch if below certain values, increment Y
             iny                        ;for each amount equal or exceeded
             cmp #$10
             bcc ChkWtr
             iny
             cmp #$19
             bcc ChkWtr
             iny
             cmp #$1c
             bcc ChkWtr                 ;note that for jumping, range is 0-4 for Y
             iny
ChkWtr:    lda #$01                   ;set value here (apparently always set to 1)
             sta DiffToHaltJump
             lda SwimmingFlag           ;if swimming flag disabled, branch
             beq GetYPhy
             ldy #$05                   ;otherwise set Y to 5, range is 5-6
             lda Whirlpool_Flag         ;if whirlpool flag not set, branch
             beq GetYPhy
             iny                        ;otherwise increment to 6
GetYPhy:   
             if LUIGI_PHYSICS == 1
             lda CurrentPlayer          ;check which player is on the screen
             beq +
             lda Luigi_JumpMForceData,y       ;store appropriate jump/swim
             sta VerticalForce          ;data here
             lda Luigi_FallMForceData,y
             sta VerticalForceDown
             jmp ++
             +
             lda JumpMForceData,y       ;store appropriate jump/swim
             sta VerticalForce          ;data here
             lda FallMForceData,y
             sta VerticalForceDown
             ++
             else
             lda JumpMForceData,y       ;store appropriate jump/swim
             sta VerticalForce          ;data here
             lda FallMForceData,y
             sta VerticalForceDown
             endif       
             lda InitMForceData,y
             sta Player_Y_MoveForce
             lda PlayerYSpdData,y
             sta Player_Y_Speed
             lda SuppressJumpNoise
             bne JumpSubEnd
             lda SwimmingFlag           ;if swimming flag disabled, branch
             beq PJumpSnd
             lda #Sfx_EnemyStomp        ;load swim/goomba stomp sound into
             sta Square1SoundQueue      ;square 1's sfx queue
             jmp X_Physics              ;from swimming above water level
PJumpSnd:  lda #Sfx_BigJump           ;load big mario's jump sound by default
             ldy PlayerSize             ;is mario big?
             beq SJumpSnd
             lda #Sfx_SmallJump         ;if not, load small mario's jump sound
SJumpSnd:  sta Square1SoundQueue      ;store appropriate jump sound in square 1 sfx queue
JumpSubEnd:
             lda #$00
             sta SuppressJumpNoise
             rts
GetXPhy1:
             jmp GetXPhy
aercono:
             lda pspeeddelay
             bne +
             jmp joe
+:        dec pspeeddelay
             inc dontdecrementagain
             jmp vaercono
X_Physics: ldy #$00
             sty $00                    ;init value here
             lda GameEngineSubroutine
             cmp #$08                    ;if not set to run player control routine
             bne +                         ;on next frame, branch to leave
             lda pspeed
             beq +
             lda SwimmingFlag
             bne ++
             lda Player_State
             bne +++
             lda Player_X_Speed
             cmp #$18
             bcc ++
             cmp #$e8
             bcs ++
             lda A_B_Buttons
             and #B_Button
             beq ++        
             ;lda Left_Right_Buttons
             ;and #Left_Dir
             ;bne ++
+++:
             lda pspeed
             cmp #$07
             bcs +
             lda Player_State
             bne ++
             jmp +
++:           jmp aercono
joe:
             lda #$05
             sta pspeeddelay
             lda Player_X_Speed
             cmp #$18
             bcc ++
             cmp #$e8
             bcs ++
             lda pspeed
             cmp #$07
             bcc ++
             lda PreviousA_B_Buttons
             and #B_Button
             bne vaercono
++:           lda #$15
             sta pspeeddelay
             inc oldpspeed
             dec pspeed
vaercono:
+:        
             ;lda SwimmingFlag
             ;beq ProcPRun
+:         lda Player_State
             beq ProcPRun
             
             lda Player_XSpeedAbsolute  ;check something that seems to be related
             cmp #$19                   ;to mario's speed
             bcs GetXPhy1               ;if =>$19 branch here
             ldx SwimmingFlag
             beq ProcPRun
             bcc ChkRFast               ;if not branch elsewhere
ProcPRun:  iny                        ;if mario on the ground, increment Y
             lda DebugSwim
             bne +
             lda SwimmingFlag
             bne ChkRFast
+:         dey                        ;decrement Y by default for non-water type area
             lda Left_Right_Buttons     ;get left/right controller bits
             cmp Player_MovingDir       ;check against moving direction
             bne ChkRFast               ;if controller bits <> moving direction, skip this part
             lda ClimbingSlope
             beq +
             dey
             jmp GetXPhy2
+:         lda A_B_Buttons            ;check for b button pressed
             and #B_Button
             bne SetRTmr                ;if pressed, skip ahead to set timer
             lda RunningTimer           ;check for running timer set
             bne GetXPhy                ;if set, branch
ChkRFast:  iny                        ;if running timer not set or level type is water, 
             inc $00                    ;increment Y again and temp variable in memory
             lda RunningSpeed
             bne FastXSp                ;if running speed set here, branch
             lda Player_XSpeedAbsolute
             cmp #$21                   ;otherwise check player's walking/running speed
             bcc GetXPhy                ;if less than a certain amount, branch ahead
FastXSp:   inc $00                    ;if running speed set or speed => $21 increment $00
             jmp GetXPhy                ;and jump ahead
SetRTmr:   ;lda PreviousA_B_Buttons
             ;and #B_Button
             ;beq +
             lda GameEngineSubroutine
             cmp #$08
             bne +++
             lda Player_State
             bne +++
             lda Player_X_Speed
             cmp #$18
             bcc +++
             cmp #$e8
             bcs +++
             lda pspeeddelay
             bne ++
             lda pspeed
             cmp #$07
             bcs +
             inc oldpspeed
             ldx #$0f
             stx pspeeddelay
             inc pspeed
+:           
             jmp +++
++:           lda dontdecrementagain
             bne +
             dec pspeeddelay
             jmp +++
+:           lda #$00
             sta dontdecrementagain
+++:
             lda #$0a                   ;if b button pressed, set running timer
             sta RunningTimer
             
GetXPhy:   
             lda MaxLeftXSpdData,y      ;get maximum speed to the left
             sta MaximumLeftSpeed
             lda GameEngineSubroutine   ;check for specific routine running
             cmp #$07                   ;(player entrance)
             bne GetXPhy2               ;if not running, skip and use old value of Y
             ldy #$04                   ;otherwise set Y to 3
GetXPhy2:  
             
             lda StarInvincibleTimer
             beq +
             lda SwimmingFlag
             bne +
             lda A_B_Buttons
             and #B_Button
             beq +
             lda Player_State
             beq ++
             lda Player_X_Speed
             cmp #$18
             bcc +
             cmp #$f8
             bcs +
++:           ldy #$05  
             lda pspeed
             cmp #$07
             bcc ++++
             lda framesfour
             bne ++
             lda SettingsBits+1
             bne ++
             lda pspeedsound
             eor #$01
             sta pspeedsound
             lda #$01
             sta tickid
             lda GameEngineSubroutine
             cmp #$08                    ;if not set to run player control routine
             bne ++
             lda Square2SoundBuffer
             beq +++
             cmp #Sfx_TimerTick
             bne ++
+++:       lda #Sfx_TimerTick
             sta Square2SoundQueue
++:           
             ldy #$06
++++:       jmp setstoopid
+:           lda pspeed
             cmp #$07
             bcc +
             lda framesfour
             ora SettingsBits+1
             ora DeathMusicLoaded
             bne ++
             lda pspeedsound
             eor #$01
             sta pspeedsound
             lda #$01
             sta tickid
             lda GameEngineSubroutine
             cmp #$08                    ;if not set to run player control routine
             bne ++
             lda Square2SoundBuffer
             beq +++
             cmp #Sfx_TimerTick
             bne ++
+++:       lda #Sfx_TimerTick
             sta Square2SoundQueue
++:           ldy #$03
setstoopid:
             lda MaxLeftXSpdData,y
             sta MaximumLeftSpeed
+:           lda MaxRightXSpdData,y     ;get maximum speed to the right
             sta MaximumRightSpeed
             ldy $00                    ;get other value in memory
             
             if LUIGI_PHYSICS == 1
             lda OperMode
             cmp #$02
             beq +
             lda CurrentPlayer          ;check which player is on the screen
             beq +
             lda Luigi_FrictionData,y         ;get value using value in memory as offset
             jmp ++
             +
             lda FrictionData,y         ;get value using value in memory as offset
             ++
             else
             lda FrictionData,y         ;get value using value in memory as offset
             endif
             sta FrictionAdderLow
             lda #$00
             sta FrictionAdderHigh      ;init something here
             lda PlayerFacingDir
             cmp Player_MovingDir       ;check facing direction against moving direction
             beq ExitPhy                ;if the same, branch to leave
             asl FrictionAdderLow       ;otherwise shift d7 of friction adder low into carry
             rol FrictionAdderHigh      ;then rotate carry onto d0 of friction adder high
ExitPhy:   rts                        ;and then leave
             
             
PlayerAnimTmrData:
             .db $02, $04, $07
             
GetPlayerAnimSpeed:
             ldy #$00                   ;initialize offset in Y
             lda Player_XSpeedAbsolute  ;check player's walking/running speed
             cmp #$1c                   ;against preset amount
             bcs SetRunSpd              ;if greater than a certain amount, branch ahead
             iny                        ;otherwise increment Y
             cmp #$0e                   ;compare against lower amount
             bcs ChkSkid                ;if greater than this but not greater than first, skip increment
             iny                        ;otherwise increment Y again
ChkSkid:    lda SavedJoypadBits        ;get controller bits
             and #%01111111             ;mask out A button
             beq SetAnimSpd             ;if no other buttons pressed, branch ahead of all this
             and #$03                   ;mask out all others except left and right
             cmp Player_MovingDir       ;check against moving direction
             bne ProcSkid               ;if left/right controller bits <> moving direction, branch
             lda #$00                   ;otherwise set zero value here
SetRunSpd:  sta RunningSpeed           ;store zero or running speed here
             jmp SetAnimSpd
ProcSkid:   lda Player_XSpeedAbsolute  ;check player's walking/running speed
             cmp #$0b                   ;against one last amount
             bcs SetAnimSpd             ;if greater than this amount, branch
             lda PlayerFacingDir
             sta Player_MovingDir       ;otherwise use facing direction to set moving direction
             lda #$00
             sta Player_X_Speed         ;nullify player's horizontal speed
             sta Player_X_MoveForce     ;and dummy variable for player
SetAnimSpd: lda PlayerAnimTmrData,y    ;get animation timer setting using Y as offset
             sta PlayerAnimTimerSet
             rts
             
             
ImposeFriction:
             ldy Player_State
             beq ++
             ldy Player_CollisionBits
             cpy #$ff
             bne +
++:           and Player_CollisionBits  ;perform AND between left/right controller bits and collision flag
             ;cmp #$00                  ;then compare to zero (this instruction is redundant)
             bne JoypFrict             ;if any bits set, branch to next part
             lda Player_X_Speed
             beq SetAbsSpd             ;if player has no horizontal speed, branch ahead to last part
             bpl RghtFrict             ;if player moving to the right, branch to slow
             bmi LeftFrict             ;otherwise logic dictates player moving left, branch to slow
JoypFrict: lsr                       ;put right controller bit into carry
             bcc RghtFrict             ;if left button pressed, carry = 0, thus branch
LeftFrict: lda Player_X_MoveForce    ;load value set here
             clc
             adc FrictionAdderLow      ;add to it another value set here
             sta Player_X_MoveForce    ;store here
             lda Player_X_Speed
             adc FrictionAdderHigh     ;add value plus carry to horizontal speed
             sta Player_X_Speed        ;set as new horizontal speed
             cmp MaximumRightSpeed     ;compare against maximum value for right movement
             bmi XSpdSign              ;if horizontal speed greater negatively, branch
             lda MaximumRightSpeed     ;otherwise set preset value as horizontal speed
             sta Player_X_Speed        ;thus slowing the player's left movement down
             jmp SetAbsSpd             ;skip to the end
RghtFrict: lda Player_X_MoveForce    ;load value set here
             sec
             sbc FrictionAdderLow      ;subtract from it another value set here
             sta Player_X_MoveForce    ;store here
             lda Player_X_Speed
             sbc FrictionAdderHigh     ;subtract value plus borrow from horizontal speed
             sta Player_X_Speed        ;set as new horizontal speed
             cmp MaximumLeftSpeed      ;compare against maximum value for left movement
             bpl XSpdSign              ;if horizontal speed greater positively, branch
             lda MaximumLeftSpeed      ;otherwise set preset value as horizontal speed
             sta Player_X_Speed        ;thus slowing the player's right movement down
XSpdSign:  cmp #$00                  ;if player not moving or moving to the right,
             bpl SetAbsSpd             ;branch and leave horizontal speed value unmodified
             eor #$ff
             clc                       ;otherwise get two's compliment to get absolute
             adc #$01                  ;unsigned walking/running speed
SetAbsSpd: sta Player_XSpeedAbsolute ;store walking/running speed here and leave
NoFBall3:
+:         rts
             
ProcFireball_Bubble:
             lda A_B_Buttons
             and #B_Button              ;check for b button pressed
             beq ProcFireballs          ;branch if not pressed
             and PreviousA_B_Buttons
             bne ProcFireballs          ;if button pressed in previous frame, branch
             lda FballCooldown
             bne NoFBall3
             lda FireballCounter        ;load fireball counter
             and #%00000001             ;get LSB and use as offset for buffer
             tax
             lda Fireball_State,x       ;load fireball state
             bne ProcFireballs          ;if not inactive, branch
             ldy Player_Y_HighPos       ;if player too high or too low, branch
             dey
             bne ProcFireballs
             lda CrouchingFlag          ;if player crouching, branch
             bne ProcFireballs
             lda Player_State           ;if player's state = climbing, branch
             cmp #$03
             beq ProcFireballs
             lda #Sfx_Fireball          ;play fireball sound effect
             sta Square1SoundQueue
             lda #$02                   ;load state
             sta Fireball_State,x
             ldy PlayerAnimTimerSet     ;copy animation frame timer setting
             sty FireballThrowingTimer  ;into fireball throwing timer
             dey
             sty PlayerAnimTimer        ;decrement and store in player's animation timer
             inc FireballCounter        ;increment fireball counter
             
ProcFireballs:
             ldx #$00
             jsr FireballObjCore  ;process first fireball object
             ldx #$01
             jmp FireballObjCore  ;process second fireball object
             ;then leave
             
FireballExplosion:
             jsr RelativeFireballPosition
DrawExplosion_Fireball:
             ldy Alt_SprDataOffset,x  ;get OAM data offset of alternate sort for fireball's explosion
             lda Fireball_State,x     ;load fireball state
             inc Fireball_State,x     ;increment state for next frame
             lsr                      ;divide by 2
             and #%00000111           ;mask out all but d3-d1
             cmp #$03                 ;check to see if time to kill fireball
             bcs KillFireBall         ;branch if so, otherwise continue to draw explosion
             
DrawExplosion_Fireworks:
             tax                         ;use whatever's in A for offset
             lda ExplosionTiles,x        ;get tile number using offset
             iny                         ;increment Y (contains sprite data offset)
             sta Sprite_Data+12,y          ;into second row sprites
             sta Sprite_Data+8,y
             sta Sprite_Data+4,y           ;and into first row sprites
             sta Sprite_Data,y             ;and dump into tile number part of sprite data
             dey                         ;decrement Y so we have the proper offset again
             ldx ObjectOffset            ;return enemy object buffer offset to X
             lda Fireball_Rel_YPos       ;get relative vertical coordinate
             sec                         ;subtract four pixels vertically
             sbc #$04                    ;for first and third sprites
             sta Sprite_Y_Position,y
             sta Sprite_Y_Position+8,y
             clc                         ;add eight pixels vertically
             adc #$08                    ;for second and fourth sprites
             sta Sprite_Y_Position+4,y
             sta Sprite_Y_Position+12,y
             lda Fireball_Rel_XPos       ;get relative horizontal coordinate
             sec                         ;subtract four pixels horizontally
             sbc #$04                    ;for first and second sprites
             sta Sprite_X_Position,y
             sta Sprite_X_Position+4,y
             clc                         ;add eight pixels horizontally
             adc #$08                    ;for third and fourth sprites
             sta Sprite_X_Position+8,y
             sta Sprite_X_Position+12,y
             lda #$02                    ;set palette attributes for all sprites, but
             sta Sprite_Attributes,y     ;set no flip at all for first sprite
             lda #$82
             sta Sprite_Attributes+4,y   ;set vertical flip for second sprite
             lda #$42
             sta Sprite_Attributes+8,y   ;set horizontal flip for third sprite
             lda #$c2
             sta Sprite_Attributes+12,y  ;set both flips for fourth sprite
             rts                         ;we are done
             
KillFireBall:
             lda #$00                    ;clear fireball state to kill it
             sta Fireball_State,x
NoFBall2: 
             rts
FireballXSpdData:
             .db $40, $c0
FireballObjCore:
             stx ObjectOffset             ;store offset as current object
             lda Fireball_State,x         ;check for d7 = 1
             bmi FireballExplosion        ;if so, branch to get relative coordinates and draw explosion
             ldy Fireball_State,x         ;if fireball inactive, branch to leave
             beq NoFBall2
             dey                          ;if fireball state set to 1, skip this part and just run it
             beq RunFB
             lda Player_X_Position        ;get player's horizontal position
             adc #$04                     ;add four pixels and store as fireball's horizontal position
             sta Fireball_X_Position,x
             lda Player_PageLoc           ;get player's page location
             adc #$00                     ;add carry and store as fireball's page location
             sta Fireball_PageLoc,x
             lda Player_Y_Position        ;get player's vertical position and store
             sta Fireball_Y_Position,x
             lda #$01                     ;set high byte of vertical position
             sta Fireball_Y_HighPos,x
             ldy PlayerFacingDir          ;get player's facing direction
             dey                          ;decrement to use as offset here
             lda FireballXSpdData,y       ;set horizontal speed of fireball accordingly
             sta Fireball_X_Speed,x
             lda #$04                     ;set vertical speed of fireball
             sta Fireball_Y_Speed,x
             lda #$07
             sta Fireball_BoundBoxCtrl,x  ;set bounding box size control for fireball
             dec Fireball_State,x         ;decrement state to 1 to skip this part from now on
RunFB:   txa                          ;add 7 to offset to use
             clc                          ;as fireball offset for next routines
             adc #$07
             tax
             lda #$50                     ;set downward movement force here
             sta $00
             lda #$03                     ;set maximum speed here
             sta $02
             lda #$00
             jsr ImposeGravity            ;do sub here to impose gravity on fireball and move vertically
             jsr MoveObjectHorizontally   ;do another sub to move it horizontally
             ldx ObjectOffset             ;return fireball offset to X
             ldy #$00                     ;set for fireball offsets
             txa                          ;move offset to A
             clc
             adc ObjOffsetData,y          ;add amount of bytes to offset depending on setting in Y
             tax  
             ldy #$02
             lda SprObject_Y_Position,x   ;load vertical coordinate low
             sta SprObject_Rel_YPos,y     ;store here
             lda SprObject_X_Position,x   ;load horizontal coordinate
             sec                          ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y     ;store result here
             ldx ObjectOffset  
             ldy #$00                       ;set for fireball offsets
             txa                           ;move offset to A
             clc
             adc ObjOffsetData,y            ;add amount of bytes to offset depending on setting in Y
             tax    
             ldy #$02                     ;set other offset for fireball's offscreen bits
             tya                          ;save offscreen bits offset to stack for now
             pha
             jsr GetXOffscreenBits        ;do subroutine here
             tay
             lda MSBtoLSB,y
             sta $00                         ;store here
             jsr GetYOffscreenBits
             tay
             lda LSBtoMSB,y
             ora $00                      ;mask together with previously saved low nybble
             sta $00                      ;store both here
             pla                          ;get offscreen bits offset from stack
             tay
             lda $00                      ;get value here and store elsewhere
             sta SprObject_OffscrBits,y
             ldx ObjectOffset
             txa                          ;add seven bytes to offset
             clc                           ;to use in routines as offset for fireball
             adc #$07
             tax
             ldy #$02                      ;set offset for relative coordinates
             stx $00                      ;save offset here
             lda SprObject_Rel_YPos,y     ;store object coordinates relative to screen
             sta $02                      ;vertically and horizontally, respectively
             lda SprObject_Rel_XPos,y
             sta $01
             txa                          ;multiply offset by four and save to stack
             asl
             asl
             pha
             tay                          ;use as offset for Y, X is left alone
             lda SprObj_BoundBoxCtrl,x    ;load value here to be used as offset for X
             asl                          ;multiply that by four and use as X
             asl
             tax
             lda $01                      ;add the first number in the bounding box data to the
             clc                          ;relative horizontal coordinate using enemy object offset
             adc BoundBoxCtrlData,x       ;and store somewhere using same offset * 4
             sta BoundingBox_UL_Corner,y  ;store here
             lda $01
             clc
             adc BoundBoxCtrlData+2,x     ;add the third number in the bounding box data to the
             sta BoundingBox_LR_Corner,y  ;relative horizontal coordinate and store
             inx                          ;increment both offsets
             iny
             lda $02                      ;add the second number to the relative vertical coordinate
             clc                          ;using incremented offset and store using the other
             adc BoundBoxCtrlData,x       ;incremented offset
             sta BoundingBox_UL_Corner,y
             lda $02
             clc
             adc BoundBoxCtrlData+2,x     ;add the fourth number to the relative vertical coordinate
             sta BoundingBox_LR_Corner,y  ;and store
             pla                          ;get original offset loaded into $00 * y from stack
             tay                          ;use as Y
             ldx $00                      ;get original offset and use as X again
             jsr CheckRightScreenBBox     ;jump to handle any offscreen coordinates
             jsr FireballBGCollision      ;do fireball to background collision detection
             lda FBall_OffscreenBits      ;get fireball offscreen bits
             and #%11001100               ;mask out certain bits
             bne EraseFB                  ;if any bits still set, branch to kill fireball
             jsr FireballEnemyCollision   ;do fireball to enemy collision detection and deal with collisions
             ldy FBall_SprDataOffset,x  ;get fireball's sprite data offset
             lda Fireball_Rel_YPos      ;get relative vertical coordinate
             sta Sprite_Y_Position,y    ;store as sprite Y coordinate
             lda Fireball_Rel_XPos      ;get relative horizontal coordinate
             sta Sprite_X_Position,y    ;store as sprite X coordinate, then do shared code
             lda FrameCounter         ;get frame counter
             lsr                      ;divide by four
             lsr
             pha                      ;save result to stack
             and #$01                 ;mask out all but last bit
             eor #$64                 ;set either tile $64 or $65 as fireball tile
             sta Sprite_Tilenumber,y  ;thus tile changes every four frames
             pla                      ;get from stack
             lsr                      ;divide by four again
             lsr
             lda #$02                 ;load value $02 to set palette in attrib byte
             bcc FireA                ;if last bit shifted out was not set, skip this
             ora #%11000000           ;otherwise flip both ways every eight frames
FireA:   sta Sprite_Attributes,y  ;store attribute byte and leave
             rts
EraseFB: lda #$00                     ;erase fireball state
             sta Fireball_State,x
NoFBall: rts 
             
             
RunGameTimer:
             lda OperMode               ;get primary mode of operation
             beq NoFBall               ;branch to leave if in title screen mode
             lda GameEngineSubroutine
             cmp #$08                   ;if routine number less than eight running,
             bcc ExGTimer1               ;branch to leave
             cmp #$0b                   ;if running death routine,
             beq ExGTimer1               ;branch to leave
             lda Player_Y_HighPos
             cmp #$02                   ;if player below the screen,
             bpl ExGTimer1               ;branch to leave regardless of level type
             lda GameTimerCtrlTimer     ;if game timer control not yet expired,
             bne ExGTimer               ;branch to leave
             lda GameTimerDisplay
             ora GameTimerDisplay+1     ;otherwise check game timer digits
             ora GameTimerDisplay+2
             beq TimeUpOn               ;if game timer digits at 000, branch to time-up code
             lda GameTimerDisplay       ;otherwise check first digit
             bne +                      ;branch to reset game timer control
             lda GameTimerDisplay+2     ;if timer not at 60, branch to reset game timer control
             bne +
             lda GameTimerDisplay+1     ;otherwise check second and third digits
             cmp #$06
             bne +                       ;branch to reset game timer control
             lda #TimeRunningOutMusic
             sta EventMusicQueue        ;otherwise load time running out music
+:           lda GameTimerDisplay
             bne ResGTCtrl
             ldy HardModeFlag
             lda GameTimerDisplay+2
             cmp timerthings,y
             bne ResGTCtrl
             lda GameTimerDisplay+1
             cmp #$05
             bne ResGTCtrl
             lda #$01
             sta HurryUp
ResGTCtrl: ldy HardModeFlag
             lda yeah,y                   ;reset game timer control
             sta GameTimerCtrlTimer
             lda timerupthing
             eor #%01100000
             sta timerupthing
             ldy #$23                   ;set offset for last digit
             lda #$ff                   ;set value to decrement game timer digit
             sta DigitModifier+5
             jsr DigitsMathRoutine      ;do sub to decrement game timer slowly
             lda #$02
             jsr WriteScoreAndCoinTally ;write player's score and coin tally to screen
             lda #$a4                   ;set status nybbles to update game timer display
             jsr PrintStatusBarNumbers  ;do sub to update the display
             ;ldy VRAM_Buffer1_Offset   
             ;lda VRAM_Buffer1-3,y      ;check highest digit of score
             ;bne ExGTimer1                ;if zero, overwrite with space tile for zero suppression
             ;lda #$24
             ;sta VRAM_Buffer1-3,y
ExGTimer1: rts
TimeUpOn:  ldy debug
             bne ExGTimer
             sta PlayerStatus           ;init player status (note A will always be zero here)
             jsr ForceInjury            ;do sub to kill the player (note player is small here)
             inc GameTimerExpiredFlag   ;set game timer expiration flag
ExGTimer:  rts                        ;leave
             
timerthings: .db $07, $05
yeah:
             .db $3b, $20
WarpZoneObject:
             lda ScrollLock         ;check for scroll lock flag
             beq ExGTimer           ;branch if not set to leave
             lda Player_Y_Position  ;check to see if player's vertical coordinate has
             and Player_Y_HighPos   ;same bits set as in vertical high byte (why?)
             bne ExGTimer           ;if so, branch to leave
             lda CurrentPageLoc
             add #$66
             sta ScrollLockPageLoc
             lda CurrentColumnPos
             sta ScrollLockColumnPos
             ldy #$00
             sty ScrollLock         ;otherwise nullify scroll lock flag
             iny
             sty WarpZoneCheck      ;increment warp zone flag to make warp pipes for warp zone
             jmp EraseEnemyObject   ;kill this object
             
             
FlagpoleScoreMods:
             .db $05, $02, $08, $04, $01
             
FlagpoleScoreDigits:
             .db $03, $03, $04, $04, $04
             
FlagpoleRoutine:
             stx ObjectOffset
             lda GameEngineSubroutine
             cmp #$04                  ;if flagpole slide routine not running,
             bne SkipScore             ;branch to near the end of code
             lda Player_State
             cmp #$03                  ;if player state not climbing,
             bne SkipScore             ;branch to near the end of code
             lda Enemy_Y_Position,x    ;check flagpole flag's vertical coordinate
             cmp #$aa                  ;if flagpole flag down to a certain point,
             bcs GiveFPScr             ;branch to end the level
             lda Player_Y_Position     ;check player's vertical coordinate
             cmp #$a2                  ;if player down to a certain point,
             bcs GiveFPScr             ;branch to end the level
             lda Enemy_YMF_Dummy,x
             adc #$ff                  ;add movement amount to dummy variable
             sta Enemy_YMF_Dummy,x     ;save dummy variable
             lda Enemy_Y_Position,x    ;get flag's vertical coordinate
             adc #$01                  ;add 1 plus carry to move flag, and
             sta Enemy_Y_Position,x    ;store vertical coordinate
             lda FlagpoleFNum_YMFDummy
             sec                       ;subtract movement amount from dummy variable
             sbc #$ff
             sta FlagpoleFNum_YMFDummy ;save dummy variable
             lda FlagpoleFNum_Y_Pos
             sbc #$01                  ;subtract one plus borrow to move floatey number,
             sta FlagpoleFNum_Y_Pos    ;and store vertical coordinate here
SkipScore: jmp FPGfx                 ;jump to skip ahead and draw flag and floatey number
GiveFPScr: ldy FlagpoleScore         ;get score offset from earlier (when player touched flagpole)
NoEL4F:    lda FlagpoleScoreMods,y   ;get amount to award player points
             ldx FlagpoleScoreDigits,y ;get digit with which to award points
             sta DigitModifier,x       ;store in digit modifier
             cmp #$05
             bne NoSc4F
             lda #Sfx_ExtraLife
             sta Square2SoundQueue        ;and play the 1-up sound
             lda NumberofLives
             cmp #$63
             beq NoSc4F
             inc NumberofLives
             jsr UpdateLives
NoSc4F:    jsr AddToScore            ;do sub to award player points depending on height of collision
NoScore:   lda #$05
             sta GameEngineSubroutine  ;set to run end-of-level subroutine on next frame
FPGfx:     jsr GetEnemyOffscreenBits ;get offscreen information
             jsr RelativeEnemyPosition ;get relative coordinates
             jmp FlagpoleGfxHandler    ;draw flagpole flag and floatey number
ExitFlagP: rts
             
             
             
Setup_Vine1:
             lda #VineObject          ;load identifier for vine object
             sta Enemy_ID,x           ;store in buffer
             lda #$01
             sta Enemy_Flag,x         ;set flag for enemy object buffer
             lda Block_PageLoc,y
             sta Enemy_PageLoc,x      ;copy page location from previous object
             lda Block_X_Position,y
             sta Enemy_X_Position,x   ;copy horizontal coordinate from previous object
             lda Block_Y_Position,y
             sta Enemy_Y_Position,x   ;copy vertical coordinate from previous object
             ldy VineFlagOffset       ;load vine flag/offset to next available vine slot
             bne NextVO               ;if set at all, don't bother to store vertical
             sta VineStart_Y_Position ;otherwise store vertical coordinate here
NextVO: txa                      ;store object offset to next available vine slot
             sta VineObjOffset,y      ;using vine flag as offset
             inc VineFlagOffset       ;increment vine flag offset
             lda #Sfx_GrowVine
             sta Square2SoundQueue    ;load vine grow sound
             rts
             
VineHeightData:
             .db $30, $60
             
VineObjectHandler:
             cpx $7fcd      ;check enemy offset for special use slot
             bne ExitVH                ;if not in last slot, branch to leave
             ldy VineFlagOffset
             dey                       ;decrement vine flag in Y, use as offset
             lda VineHeight
             cmp VineHeightData,y      ;if vine has reached certain height,
             beq RunVSubs              ;branch ahead to skip this part
             lda FrameCounter          ;get frame counter
             lsr                       ;shift d1 into carry
             lsr
             bcc RunVSubs              ;if d1 not set (2 frames every 4) skip this part
             lda Enemy_Y_Position,x
             sbc #$01                  ;subtract vertical position of vine
             sta Enemy_Y_Position,x    ;one pixel every frame it's time
             inc VineHeight            ;increment vine height
RunVSubs:  lda VineHeight            ;if vine still very small,
             cmp #$08                  ;branch to leave
             bcc ExitVH
             jsr RelativeEnemyPosition ;get relative coordinates of vine,
             jsr GetEnemyOffscreenBits ;and any offscreen bits
             ldy #$00                  ;initialize offset used in draw vine sub
VDrawLoop: jsr DrawVine              ;draw vine
             iny                       ;increment offset
             cpy VineFlagOffset        ;if offset in Y and offset here
             bne VDrawLoop             ;do not yet match, loop back to draw more vine
             lda Enemy_OffscreenBits
             and #%00001100            ;mask offscreen bits
             beq WrCMTile              ;if none of the saved offscreen bits set, skip ahead
             dey                       ;otherwise decrement Y to get proper offset again
KillVine:  ldx VineObjOffset,y       ;get enemy object offset for this vine object
             jsr EraseEnemyObject      ;kill this vine object
             dey                       ;decrement Y
             bpl KillVine              ;if any vine objects left, loop back to kill it
             sta VineFlagOffset        ;initialize vine flag/offset
             sta VineHeight            ;initialize vine height
WrCMTile:  lda VineHeight            ;check vine height
             cmp #$20                  ;if vine small (less than 32 pixels tall)
             bcc ExitVH                ;then branch ahead to leave
             ldx $7fcd
             inx
             lda #$01                  ;set A to obtain horizontal in $04, but we don't care
             ldy #$1b                  ;set Y to offset to get block at ($04, $10) of coordinates
             jsr BBChk_E  ;do a sub to get block buffer address set, return contents
             ldy $02
             cpy #$d0                  ;if vertical high nybble offset beyond extent of
             bcs ExitVH                ;current block buffer, branch to leave, do not write
             lda ($f7),y               ;otherwise check contents of block buffer at 
             bne ExitVH                ;current offset, if not empty, branch to leave
             lda #$26
             sta ($f7),y               ;otherwise, write climbing metatile to block buffer
ExitVH:    ldx ObjectOffset          ;get enemy object offset and leave
             rts
             
             
CannonBitmasks:
             .db %00001111, %00000111
             
ProcessCannons:
             ;lda AreaType                ;get area type
             ;beq ExCannon                ;if water type area, branch to leave
             ;lda SwimmingFlag
             ;bne ExCannon
             ldx #$02
ThreeSChk: stx ObjectOffset            ;start at third enemy slot
             lda Enemy_Flag,x            ;check enemy buffer flag
             bne Chk_BB                  ;if set, branch to check enemy
             lda PseudoRandomBitReg+1,x  ;otherwise get part of LSFR
             ldy SecondaryHardMode       ;get secondary hard mode flag, use as offset
             and CannonBitmasks,y        ;mask out bits of LSFR as decided by flag
             cmp #$06                    ;check to see if lower nybble is above certain value
             bcs Chk_BB                  ;if so, branch to check enemy
             tay                         ;transfer masked contents of LSFR to Y as pseudorandom offset
             sty tempB
             lda Cannon_PageLoc,y        ;get page location
             beq Chk_BB                  ;if not set or on page 0, branch to check enemy
             lda Cannon_Timer,y          ;get cannon timer
             beq FireCannon              ;if expired, branch to fire cannon
             sbc #$00                    ;otherwise subtract borrow (note carry will always be clear here)
             sta Cannon_Timer,y          ;to count timer down
             jmp Chk_BB                  ;then jump ahead to check enemy
             
FireCannon:
             lda TimerControl           ;if master timer control set,
             bne Chk_BB                 ;branch to check enemy
             lda Cannon_PageLoc
             lda #$0e                   ;otherwise we start creating one
             sta Cannon_Timer,y         ;first, reset cannon timer
             lda Cannon_PageLoc,y       ;get page location of cannon
             sta Enemy_PageLoc,x        ;save as page location of bullet bill
             lda Cannon_X_Position,y    ;get horizontal coordinate of cannon
             sta Enemy_X_Position,x     ;save as horizontal coordinate of bullet bill
             lda Cannon_Y_Position,y    ;get vertical coordinate of cannon
             sec
             sbc #$08                   ;subtract eight pixels (because enemies are 24 pixels tall)
             sta Enemy_Y_Position,x     ;save as vertical coordinate of bullet bill
             
             lda #$01
             sta Enemy_Y_HighPos,x      ;set vertical high byte of bullet bill
             sta Enemy_Flag,x           ;set buffer flag
             lsr                        ;shift right once to init A
             sta Enemy_State,x          ;then initialize enemy's state
             lda #$09
             sta Enemy_BoundBoxCtrl,x   ;set bounding box size control for bullet bill
             lda #BulletBill_CannonVar
             sta Enemy_ID,x             ;load identifier for bullet bill (cannon variant)
             jsr OffscreenBoundsCheck
             lda Enemy_Flag,x
             bne +
             ldy tempB
             lda Cannon_Creator,y
             tay
             lda #$00
             sta Saved_isDefeated,y
+:        jmp Next3Slt               ;move onto next slot
Chk_BB:   lda Enemy_ID,x             ;check enemy identifier for bullet bill (cannon variant)
             cmp #BulletBill_CannonVar
             bne Next3Slt               ;if not found, branch to get next slot
             jsr OffscreenBoundsCheck   ;otherwise, check to see if it went offscreen
             lda Enemy_Flag,x           ;check enemy buffer flag
             beq Next3Slt               ;if not set, branch to get next slot
             jsr GetEnemyOffscreenBits  ;otherwise, get offscreen information
             jsr BulletBillHandler      ;then do sub to handle bullet bill
Next3Slt: dex                        ;move onto next slot
             bpl ThreeSChk1              ;do this until first three slots are checked
ExCannon: rts                        ;then leave
             
ThreeSChk1: jmp ThreeSChk
MoveBulletBill:
             lda Enemy_State,x          ;check bullet bill's enemy object state for d5 set
             and #%00100000
             beq NotDefB                ;if not set, continue with movement code
             jmp MoveJ_EnemyVertically  ;otherwise jump to move defeated bullet bill downwards
NotDefB: lda #$e8                   ;set bullet bill's horizontal speed
sta Enemy_X_Speed,x        ;and move it accordingly (note: this bullet bill
             jmp MoveEnemyHorizontally  ;object occurs in frenzy object $17, not from cannons)
             
MoveJumpingEnemy:
             jsr MoveJ_EnemyVertically  ;do a sub to impose gravity on green paratroopa
             jmp MoveEnemyHorizontally  ;jump to move enemy horizontally
             
BulletBillXSpdData:
             .db $18, $e8
             
BulletBillHandler:
             lda TimerControl          ;if master timer control set,
             bne RunBBSubs             ;branch to run subroutines except movement sub
             lda Enemy_State,x
             bne ChkDSte               ;if bullet bill's state set, branch to check defeated state
             lda Enemy_OffscreenBits   ;otherwise load offscreen bits
             and #%00001100            ;mask out bits
             cmp #%00001100            ;check to see if all bits are set
             beq KillBB                ;if so, branch to kill this object
             ldy #$01                  ;set to move right by default
             jsr PlayerEnemyDiff       ;get horizontal difference between player and bullet bill
             bmi SetupBB               ;if enemy to the left of player, branch
             iny                       ;otherwise increment to move left
SetupBB:   sty Enemy_MovingDir,x     ;set bullet bill's moving direction
             dey                       ;decrement to use as offset
             lda BulletBillXSpdData,y  ;get horizontal speed based on moving direction
             sta Enemy_X_Speed,x       ;and store it
             lda $00                   ;get horizontal difference
             adc #$28                  ;add 40 pixels
             cmp #$50                  ;if less than a certain amount, player is too close
             bcc KillBB                ;to cannon either on left or right side, thus branch
             lda #$01
             sta Enemy_State,x         ;otherwise set bullet bill's state
             lda #$0a
             sta EnemyFrameTimer,x     ;set enemy frame timer
             lda #Sfx_Blast
             sta Square2SoundQueue     ;play fireworks/gunfire sound
ChkDSte:   lda Enemy_State,x         ;check enemy state for d5 set
             and #%00100000
             beq BBFly                 ;if not set, skip to move horizontally
             jsr MoveD_EnemyVertically ;otherwise do sub to move bullet bill vertically
BBFly:     inx                         ;increment offset for enemy offset
             jsr MoveObjectHorizontally  ;position object horizontally according to
             ldx ObjectOffset            ;counters, return with saved value in A,
RunBBSubs: jsr GetEnemyOffscreenBits ;get offscreen information
             jsr RelativeEnemyPosition ;get relative coordinates
             jsr GetEnemyBoundBox      ;get bounding box coordinates
             jsr PlayerEnemyCollision  ;handle player to enemy collisions
             ;jsr EnemiesCollision
             jmp EnemyGfxHandler       ;draw the bullet bill and leave
KillBB:    jmp EraseEnemyObject      ;kill bullet bill and leave
             
HammerEnemyOfsData:
             .db $04, $04, $04, $05, $05, $05
             .db $06, $06, $06
             
HammerXSpdData:
             .db $10, $f0
             
SpawnHammerObj:
             ldy #$08
-:          lda Misc_State,y         ;if any values loaded in
             beq +             ;$2a-$32 where offset is then leave with carry clear
             dey
             bpl -
             clc
             rts
+:        ;ldx HammerEnemyOfsData,y ;get offset of enemy slot to check using Y as offset
             ;lda Enemy_Flag,x         ;check enemy buffer flag at offset
             ;bne NoHammer             ;if buffer flag set, branch to leave with carry clear
             ldx ObjectOffset         ;get original enemy object offset
             txa
             sta HammerEnemyOffset,y  ;save here
             lda #$90
             sta Misc_State,y         ;save hammer's state here
             lda #$0c
             sta Misc_BoundBoxCtrl,y  ;set something else entirely, here
             sec                      ;return with carry set
             rts
NoHammer: ldx ObjectOffset         ;get original enemy object offset
             clc                      ;return with carry clear
             rts
             
             
ProcHammerObj:
             lda TimerControl           ;if master timer control set
             bne RunHSubs               ;skip all of this code and go to last subs at the end
             lda Misc_State,x           ;otherwise get hammer's state
             and #%01111111             ;mask out d7
             ldy HammerEnemyOffset,x    ;get enemy object offset that spawned this hammer
             cmp #$02                   ;check hammer's state
             beq SetHSpd                ;if currently at 2, branch
             bcs SetHPos                ;if greater than 2, branch elsewhere
             txa
             clc                        ;add 13 bytes to use
             adc #$0d                   ;proper misc object
             tax                        ;return offset to X
             lda #$10
             sta $00                    ;set downward movement force
             ;lda #$0f
             ;sta $01                    ;set upward movement force (not used)
             lda #$04
             sta $02                    ;set maximum vertical speed
             lda #$00                   ;set A to impose gravity on hammer
             jsr ImposeGravity          ;do sub to impose gravity on hammer and move vertically
             jsr MoveObjectHorizontally ;do sub to move it horizontally
             ldx ObjectOffset           ;get original misc object offset
             jmp RunAllH                ;branch to essential subroutines
SetHSpd:  lda #$fe
             sta Misc_Y_Speed,x         ;set hammer's vertical speed
             lda Enemy_State,y          ;get enemy object state
             and #%11110111             ;mask out d3
             sta Enemy_State,y          ;store new state
             ldx Enemy_MovingDir,y      ;get enemy's moving direction
             dex                        ;decrement to use as offset
             lda HammerXSpdData,x       ;get proper speed to use based on moving direction
             ldx ObjectOffset           ;reobtain hammer's buffer offset
             sta Misc_X_Speed,x         ;set hammer's horizontal speed
SetHPos:  dec Misc_State,x           ;decrement hammer's state
             lda Enemy_X_Position,y     ;get enemy's horizontal position
             clc
             adc #$02                   ;set position 2 pixels to the right
             sta Misc_X_Position,x      ;store as hammer's horizontal position
             lda Enemy_PageLoc,y        ;get enemy's page location
             adc #$00                   ;add carry
             sta Misc_PageLoc,x         ;store as hammer's page location
             lda Enemy_Y_Position,y     ;get enemy's vertical position
             sec
             sbc #$0a                   ;move position 10 pixels upward
             sta Misc_Y_Position,x      ;store as hammer's vertical position
             lda #$01
             sta Misc_Y_HighPos,x       ;set hammer's vertical high byte
             bne RunHSubs               ;unconditional branch to skip first routine
RunAllH:  jsr PlayerHammerCollision  ;handle collisions
RunHSubs: ldy #$02                 ;set for misc object offsets
             txa
             clc
             adc ObjOffsetData,y  ;add amount of bytes to offset depending on setting in Y
             tax                  ;put back in X and leave
             ldy #$06                 ;set other offset for misc object's offscreen bits
             tya                         ;save offscreen bits offset to stack for now
             pha
             jsr RunOffscrBitsSubs
             tay
             lda LSBtoMSB,y
             ora $00                     ;mask together with previously saved low nybble
             sta $00                     ;store both here
             pla                         ;get offscreen bits offset from stack
             tay
             lda $00                     ;get value here and store elsewhere
             sta SprObject_OffscrBits,y
             ldx ObjectOffset
             ldy #$02                ;set for misc object offsets
             txa
             clc
             adc ObjOffsetData,y  ;add amount of bytes to offset depending on setting in Y
             tax      
             ldy #$06
             jsr RelWOfs             ;get the coordinates
             txa                       ;add nine bytes to offset
             clc                       ;to use in routines as offset for misc object
             adc #$09
             tax
             ldy #06                  ;set offset for relative coordinates
             jsr BoundingBoxCore       ;get bounding box coordinates
             jsr CheckRightScreenBBox  ;jump to handle any offscreen coordinates
             jmp DrawHammer             ;draw the hammer
             
             
CoinBlock:
             jsr FindEmptyMiscSlot   ;set offset for empty or last misc object buffer slot
             lda Block_PageLoc,x     ;get page location of block object
             sta Misc_PageLoc,y      ;store as page location of misc object
             lda Block_X_Position,x  ;get horizontal coordinate of block object
             ora #$05                ;add 5 pixels
             sta Misc_X_Position,y   ;store as horizontal coordinate of misc object
             lda Block_Y_Position,x  ;get vertical coordinate of block object
             sbc #$10                ;subtract 16 pixels
             sta Misc_Y_Position,y   ;store as vertical coordinate of misc object
             jmp JCoinC              ;jump to rest of code as applies to this misc object
             
SetupJumpCoin:
             jsr FindEmptyMiscSlot  ;set offset for empty or last misc object buffer slot
             lda Block_PageLoc2,x   ;get page location saved earlier
             sta Misc_PageLoc,y     ;and save as page location for misc object
             lda $f7                ;get low byte of block buffer offset
             asl
             asl                    ;multiply by 16 to use lower nybble
             asl
             asl
             ora #$05               ;add five pixels
             sta Misc_X_Position,y  ;save as horizontal coordinate for misc object
             lda $02                ;get vertical high nybble offset from earlier
             adc #$20               ;add 32 pixels for the status bar
             sta Misc_Y_Position,y  ;store as vertical coordinate
JCoinC: lda #$fb
             sta Misc_Y_Speed,y     ;set vertical speed
             inc CoinTallyFor1Ups   ;increment coin tally used to activate 1-up block flag
             lda #$01
             sta Misc_Y_HighPos,y   ;set vertical high byte
             sta Misc_State,y       ;set state for misc object
             sta Square2SoundQueue  ;load coin grab sound
             stx ObjectOffset       ;store current control bit as misc object offset 
             jmp GiveOneCoin        ;update coin tally on the screen and coin amount variable
             
FindEmptyMiscSlot:
             ldy #$08                ;start at end of misc objects buffer
FMiscLoop: lda Misc_State,y        ;get misc object state
             beq UseMiscS            ;branch if none found to use current offset
             dey                     ;decrement offset
             cpy #$05                ;do this for three slots
             bne FMiscLoop           ;do this until all slots are checked
             ldy #$08                ;if no empty slots found, use last slot
UseMiscS:  sty JumpCoinMiscOffset  ;store offset of misc object buffer here (residual)
             rts
             
             
MiscObjectsCore:
             ldx #$08          ;set at end of misc object buffer
MiscLoop: 
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jsr ProcJumpCoin
             jmp +
++:       jsr ProcHammerObj ;otherwise go to process hammer,
+:        dex               ;decrement misc object offset
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jsr ProcJumpCoin
             jmp +
++:       jsr ProcHammerObj ;otherwise go to process hammer,
+:        dex               ;decrement misc object offset
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jsr ProcJumpCoin
             jmp +
++:       jsr ProcHammerObj ;otherwise go to process hammer,
+:        dex               ;decrement misc object offset
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jsr ProcJumpCoin
             jmp +
++:       jsr ProcHammerObj ;otherwise go to process hammer,
+:        dex               ;decrement misc object offset
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jsr ProcJumpCoin
             jmp +
++:       jsr ProcHammerObj ;otherwise go to process hammer,
+:        dex               ;decrement misc object offset
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jsr ProcJumpCoin
             jmp +
++:       jsr ProcHammerObj ;otherwise go to process hammer,
+:        dex               ;decrement misc object offset
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jsr ProcJumpCoin
             jmp +
++:       jsr ProcHammerObj ;otherwise go to process hammer,
+:        dex               ;decrement misc object offset
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jsr ProcJumpCoin
             jmp +
++:       jsr ProcHammerObj ;otherwise go to process hammer,
+:        dex               ;decrement misc object offset
             stx ObjectOffset  ;store misc object offset here
             lda Misc_State,x  ;check misc object state
             beq +  ;branch to check next slot
             bmi ++            ;if d7 not set, jumping coin, thus skip to rest of code here
             jmp ProcJumpCoin
++:       jmp ProcHammerObj ;otherwise go to process hammer,
+:           rts
             
             
             
ProcJumpCoin:
             ldy Misc_State,x          ;check misc object state
             dey                       ;decrement to see if it's set to 1
             beq JCoinRun              ;if so, branch to handle jumping coin
             inc Misc_State,x          ;otherwise increment state to either start off or as timer
             lda Misc_X_Position,x     ;get horizontal coordinate for misc object
             clc                       ;whether its jumping coin (state 0 only) or floatey number
             adc ScrollAmount          ;add current scroll speed
             sta Misc_X_Position,x     ;store as new horizontal coordinate
             lda Misc_PageLoc,x        ;get page location
             adc #$00                  ;add carry
             sta Misc_PageLoc,x        ;store as new page location
             lda Misc_State,x
             cmp #$30                  ;check state of object for preset value
             bne RunJCSubs             ;if not yet reached, branch to subroutines
             lda #$00
             sta Misc_State,x          ;otherwise nullify object state
             rts
JCoinRun:  txa             
             clc                       ;add 13 bytes to offset for next subroutine
             adc #$0d
             tax
             lda #$50                  ;set downward movement amount
             sta $00
             lda #$06                  ;set maximum vertical speed
             sta $02
             lsr                       ;divide by 2 and set
             sta $01                   ;as upward movement amount (apparently residual)
             lda #$00                  ;set A to impose gravity on jumping coin
             jsr ImposeGravity         ;do sub to move coin vertically and impose gravity on it
             ldx ObjectOffset          ;get original misc object offset
             lda Misc_Y_Speed,x        ;check vertical speed
             cmp #$05
             bne RunJCSubs             ;if not moving downward fast enough, keep state as-is
             inc Misc_State,x          ;otherwise increment state to change to floatey number
RunJCSubs: ldy #$02                ;set for misc object offsets
             txa                  ;move offset to A
             clc
             adc ObjOffsetData,y  ;add amount of bytes to offset depending on setting in Y
             tax                  ;put back in X and leave
             ldy #$06
             lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset            ;return original offset
             ldy #$02                 ;set for misc object offsets
             txa                  ;move offset to A
             clc
             adc ObjOffsetData,y  ;add amount of bytes to offset depending on setting in Y
             tax                  ;put back in X and leave
             ldy #$06                 ;set other offset for misc object's offscreen bits
             jsr GetOffScreenBitsSet  ;and get offscreen information about misc object
             ;jsr GetMiscBoundBox       ;get bounding box coordinates (why?)
             jmp JCoinGfxHandler       ;draw the coin or floatey number
             
             
JCoinGfxHandler:
             ldy Misc_SprDataOffset,x    ;get coin/floatey number's OAM data offset
             lda Misc_State,x            ;get state of misc object
             cmp #$02                    ;if 2 or greater, 
             beq DrawFloateyNumber_Coin  ;branch to draw floatey number
             bcs ExJCGfx
             lda Misc_Y_Position,x       ;store vertical coordinate as
             sta Sprite_Y_Position,y     ;Y coordinate for first sprite
             clc
             adc #$08                    ;add eight pixels
             sta Sprite_Y_Position+4,y   ;store as Y coordinate for second sprite
             lda Misc_Rel_XPos           ;get relative horizontal coordinate
             sta Sprite_X_Position,y
             sta Sprite_X_Position+4,y   ;store as X coordinate for first and second sprites
             lda FrameCounter            ;get frame counter
             lsr                         ;divide by 2 to alter every other frame
             and #%00000011              ;mask out d2-d1
             tax                         ;use as graphical offset
             lda JumpingCoinTiles,x      ;load tile number
             iny                         ;increment OAM data offset to write tile numbers
             sta Sprite_Data+4,y            ;and into first row sprites
             sta Sprite_Data,y              ;and do sub to dump into first and second sprites
             dey                         ;decrement to get old offset
             lda #$02
             sta Sprite_Attributes,y     ;set attribute byte in first sprite
             lda #$82
             sta Sprite_Attributes+4,y   ;set attribute byte with vertical flip in second sprite
             lda Misc_OffscreenBits
             and #%11111100              ;check offscreen bits
             beq ExJCGfx               ;if all bits clear, leave object alone
             lda #$f8
             sta Sprite_Data+4,y       ;and into first row sprites
             sta Sprite_Data,y
ExJCGfx: ldx ObjectOffset            ;get misc object offset
             rts        
             
DrawFloateyNumber_Coin:
             txa
             sec
             sbc #$05
             tay
             lda #$01
             sta FloateyNum_Control,y ;set number of points control for floatey numbers
             lda #$20
             sta FloateyNum_Timer,y   ;set timer for floatey numbers
             lda Misc_OffscreenBits
             and #%11111100              ;check offscreen bits
             beq +                       ;if all bits clear, leave object alone
             lda #$00
             sta FloateyNum_Y_Pos,y
             beq ++
+:          lda Misc_Y_Position,x
             sta FloateyNum_Y_Pos,y   ;set vertical coordinate
++:          lda Misc_Rel_XPos
             sec
             sbc #$03
             sta FloateyNum_X_Pos,y   ;set horizontal coordinate and leave
             tya
             tax
             lda #$20
             sta FloateyShit,x
             ldx ObjectOffset 
             rts
CoinTallyOffsets:
             .db $17, $1d, $17
             
ScoreOffsets:
             .db $0b, $11, $0b
             
StatusBarNybbles:
             .db $02, $13, $02, $45
             
GiveOneCoin:
             lda #$01               ;set digit modifier to add 1 coin
             sta DigitModifier+5    ;to the current player's coin tally
             ldy #$17
             jsr DigitsMathRoutine  ;update the coin tally
             inc CoinTally          ;increment onscreen player's coin amount
             lda CoinTally
             cmp #$64               ;does player have 100 coins yet?
             bne CoinPoints         ;if not, skip all of this
             lda #$00
             sta CoinTally          ;otherwise, reinitialize coin amount
             lda #Sfx_ExtraLife
             sta Square2SoundQueue        ;and play the 1-up sound
             lda NumberofLives
             cmp #$63
             beq CoinPoints
             inc NumberofLives      ;give the player an extra life
             ldx ObjectOffset
             lda #$09
             sta FloateyNum_Control,x ;set number of points control for floatey numbers
             sta dontinc
             lda #$30
             sta FloateyNum_Timer,x   ;set timer for floatey numbers
             lda Player_Y_Position
             sta FloateyNum_Y_Pos,x   ;set vertical coordinate
             lda Player_Rel_XPos
             sta FloateyNum_X_Pos,x   ;set horizontal coordinate and leave
             jsr UpdateLives
             lda #$02
             jmp RealUpdateNumber
             
CoinPoints:
             lda #$01               ;set digit modifier to award
             sta DigitModifier+4    ;200 points to the player
             ldx ObjectOffset
AddToScore:        
             ldy #$0b
             jsr DigitsMathRoutine  ;update the score internally with value in digit modifier
WriteScoreAndCoinTally:
             lda #$02
             ;inc bocata3
             ;ldx ObjectOffset
             ;rts
UpdateNumber:
             jsr PSBN                  ;print status bar numbers based on nybbles, whatever they be
             jmp +
             ;jmp NoZSup
RealUpdateNumber:
             jsr PrintStatusBarNumbers
+:        ldy VRAM_Buffer1_Offset   
             ;lda VRAM_Buffer1-6,y      ;check highest digit of score
             ;bne NoZSup                ;if zero, overwrite with space tile for zero suppression
             ;lda #$24
             ;sta VRAM_Buffer1-6,y
NoZSup: ldx ObjectOffset          ;get enemy object buffer offset
             rts
             
SetupPowerUp:
             txa
             tay
             ldx #$05
-:           lda Enemy_Flag,x
             beq +
             dex
             bpl -
             rts
+:           lda #PowerUpObject        ;load power-up identifier into
             sta Enemy_ID,x            ;special use slot of enemy object buffer
             lda Block_PageLoc,y       ;store page location of block object
             sta Enemy_PageLoc,x       ;as page location of power-up object
             lda Block_X_Position,y    ;store horizontal coordinate of block object
             sta Enemy_X_Position,x    ;as horizontal coordinate of power-up object
             lda #$01
             sta Enemy_Y_HighPos,x     ;set vertical high byte of power-up object
             lda Block_Y_Position,y    ;get vertical coordinate of block object
             sec
             sbc #$08                  ;subtract 8 pixels
             sta Enemy_Y_Position,x    ;and use as vertical coordinate of power-up object
PwrUpJmp:  lda #$01                  ;this is a residual jump point in enemy object jump table
             sta Enemy_State,x         ;set power-up object's state
             sta Enemy_Flag,x          ;set buffer flag
             lda #$03
             sta Enemy_BoundBoxCtrl,x  ;set bounding box size control for power-up object
             lda PowerUpType
             cmp #$02                  ;check currently loaded power-up type
             bcs StrType               ;if star or 1-up, branch ahead
             lda PlayerStatus          ;otherwise check player's current status
             cmp #$02
             bcc StrType               ;if player not fiery, use status as power-up type
             lsr                       ;otherwise shift right to force fire flower type
StrType:   sta $7fce,x                  ;store type here
PutBehind: lda #%00100000
             sta Enemy_SprAttrib,x     ;set background priority bit
             lda #Sfx_GrowPowerUp
             sta Square2SoundQueue     ;load power-up reveal sound and leave
ExitPUp:   rts
idk:
             ldx $7fb8
             beq ExitPUp
             dex
             jmp EraseEnemyObject
             
PowerUpObjHandler:
             lda Enemy_State,x          ;check power-up object's state
             beq ExitPUp                ;if not set, branch to leave
             bpl GrowThePowerUp         ;if not set, branch ahead to skip this part
             lda TimerControl           ;if master timer control set,
             bne RunPUSubs              ;branch ahead to enemy object routines
             lda $7fce,x                ;check power-up type
             beq ShroomM                ;if normal mushroom, branch ahead to move it
             cmp #$03
             beq ShroomM                ;if 1-up mushroom, branch ahead to move it
             cmp #$02
             bne RunPUSubs              ;if not star, branch elsewhere to skip movement
             jsr MoveJumpingEnemy       ;otherwise impose gravity on star power-up and make it jump
             ldx ObjectOffset
             jsr EnemyJump              ;note that green paratroopa shares the same code here 
             ldx ObjectOffset
             jmp RunPUSubs              ;then jump to other power-up subroutines
ShroomM: jsr MoveNormalEnemy        ;do sub to make mushrooms move
             ldx ObjectOffset
             jsr EnemyToBGCollisionDet  ;deal with collisions
ldx ObjectOffset            ;bug fix: pswitch modifies the x register
             jmp RunPUSubs              ;run the other subroutines
             
GrowThePowerUp:
             lda FrameCounter           ;get frame counter
             and #$03                   ;mask out all but 2 LSB
             bne ChkPUSte               ;if any bits set here, branch
             dec Enemy_Y_Position,x     ;otherwise decrement vertical coordinate slowly
             lda Enemy_State,x          ;load power-up object state
             inc Enemy_State,x          ;increment state for next frame (to make power-up rise)
             cmp #$11                   ;if power-up object state not yet past 16th pixel,
             bcc ChkPUSte               ;branch ahead to last part here
             lda #$00
             ldy $7fce,x
             cpy #$02
             bne +
             lda #$fd
+:         sta Enemy_Y_Speed,x        ;make the paratroopa jump again
             lda #$10
             sta Enemy_X_Speed,x        ;otherwise set horizontal speed
             lda #%10000000
             sta Enemy_State,x          ;and then set d7 in power-up object's state
             asl                        ;shift once to init A
             sta Enemy_SprAttrib,x      ;initialize background priority bit set here
             rol                        ;rotate A to set right moving direction
             sta Enemy_MovingDir,x      ;set moving direction
ChkPUSte:  lda Enemy_State,x          ;check power-up object's state
             cmp #$06                   ;for if power-up has risen enough
             bcc ExitPUp2               ;if not, don't even bother running these routines
RunPUSubs: jsr RelativeEnemyPosition  ;get coordinates relative to screen
             jsr GetEnemyOffscreenBits  ;get offscreen bits
             jsr GetEnemyBoundBox       ;get bounding box coordinates
             jsr DrawPowerUp            ;draw the power-up object
             jsr PlayerEnemyCollision   ;check for collision with player
             jmp OffscreenBoundsCheck   ;check to see if it went offscreen
ExitPUp2:  rts
             
             
             
BlockYPosAdderData:
             .db $04, $12
             
PlayerHeadCollision:
             pha                      ;store metatile number to stack
             cmp #$74
             bne +
             ldx SprDataOffset_Ctrl
             lda #$11
             bne DBlockSte
+:         lda #$11                 ;load unbreakable block object state by default
             ldx SprDataOffset_Ctrl   ;load offset control bit here
             ldy PlayerSize           ;check player's size
             bne DBlockSte            ;if small, branch
             lda #$12                 ;otherwise load breakable block object state
DBlockSte: sta Block_State,x        ;store into block object buffer
             jsr DestroyBlockMetatile ;store blank metatile in vram buffer to write to name table
             ldx SprDataOffset_Ctrl   ;load offset control bit
             lda $02                  ;get vertical high nybble offset used in block buffer routine
             sta Block_Orig_YPos,x    ;set as vertical coordinate for block object
             tay
             lda $f7                  ;get low byte of block buffer address used in same routine
             sta Block_BBuf_Low,x     ;save as offset here to be used later
             lda $f8
             sta Block_BBuf_High,x
             stx tempB
             lda ($f7),y              ;get contents of block buffer at old address at $06, $07
             sta tempC
             ldy AreaType
             bne +
             tax
             lda MetatileThingy,x
             ldx tempB
+:         jsr BlockBumpedChk       ;do a sub to check which block player bumped head on
             sta $00                  ;store metatile here
             
             php
             cmp #$74
             beq ChkBrick
             ldy PlayerSize           ;check player's size
             bne ChkBrick             ;if small, use metatile itself as contents of A
             ldy AreaType
lda blank,y               ;otherwise init A (note: big = 0)
ChkBrick:  plp
             bcc PutMTileB            ;if no match was found in previous sub, skip ahead
             ldy #$11                 ;otherwise load unbreakable state into block object buffer
             sty Block_State,x        ;note this applies to both player sizes
             lda #$c4                 ;load empty block metatile into A for now
             ldy $00                  ;get metatile from before
             cpy #$58                 ;is it brick with coins (with line)?
             beq StartBTmr            ;if so, branch
             cpy #$34
             beq StartBTmr
             cpy #$74
             beq PutOldMT
             cpy #$5d                 ;is it brick with coins (without line)?
             bne PutMTileB            ;if not, branch ahead to store empty block metatile
StartBTmr: lda BrickCoinTimerFlag   ;check brick coin timer flag
             bne ContBTmr             ;if set, timer expired or counting down, thus branch
             lda #$0a
             sta BrickCoinTimer       ;if not set, set brick coin timer
             inc BrickCoinTimerFlag   ;and set flag linked to it
ContBTmr:  dec BrickCoinTimer
             lda BrickCoinTimer       ;check brick coin timer
             bne PutOldMT             ;if not yet expired, branch to use current metatile
             sta BrickCoinTimerFlag
             ldy #$c4                 ;otherwise use empty block metatile
PutOldMT:  tya                      ;put metatile into A
PutMTileB: sta Block_Metatile,x     ;store whatever metatile be appropriate here
             jsr InitBlock_XY_Pos     ;get block object horizontal coordinates saved
             ldy $02                  ;get vertical high nybble offset
             lda ($f7),y
             sta OrigMetatile,x
             lda #$00
             sta Cbolla,x
             lda #$23
             sta ($f7),y              ;write blank metatile $23 to block buffer
             lda #$07
             sta BlockBounceTimer     ;set block bounce timer
             pla                      ;pull original metatile from stack
             sta $05                  ;and save here
             ldy #$00                 ;set default offset
             lda CrouchingFlag        ;is player crouching?
             bne SmallBP              ;if so, branch to increment offset
             lda PlayerSize           ;is player big?
             beq BigBP                ;if so, branch to use default offset
SmallBP:   iny                      ;increment for small or big and crouching
             jmp BumpChkRt
BigBP:     lda SwimmingFlag
             ora OldSwim
             beq BumpChkRt
             lda Player_Y_Position    ;get player's vertical coordinate
             and #$f0
             sta Block_Y_Position,x   ;save as vertical coordinate for block object
             jmp JumpBack
BumpChkRt: 
             lda Player_Y_Position    ;get player's vertical coordinate
             clc
             adc BlockYPosAdderData,y ;add value determined by size
             and #$f0                 ;mask out low nybble to get 16-pixel correspondence
             sta Block_Y_Position,x   ;save as vertical coordinate for block object
JumpBack:  ldy Block_State,x        ;get block object state
             cpy #$11
             beq Unbreak              ;if set to value loaded for unbreakable, branch
             jsr BrickShatter         ;execute code for breakable brick
             lda #$01
             sta Player_Y_Speed     ;set vertical speed for player
             jmp InvOBit
Unbreak:   jsr BumpBlock            ;execute code for unbreakable brick or question block
InvOBit:   lda SprDataOffset_Ctrl
             eor #$01
             sta SprDataOffset_Ctrl                  
             rts                        ;leave!
UnderWaterBumpChk:
             lda Player_Y_Position    ;get player's vertical coordinate
             and #$f0
             sta Block_Y_Position,x   ;save as vertical coordinate for block object
             jmp JumpBack
             
             
             
BumpBlock:
             lda $05
             pha
             ldy PTimer
             bne +
             jsr CheckTopOfBlock     ;check to see if there's a coin directly above this block
+:         lda #Sfx_Bump
             sta Square1SoundQueue   ;play bump sound
             lda #$00
             sta Block_X_Speed,x     ;initialize horizontal speed for block object
             sta Block_Y_MoveForce,x ;init fractional movement force
             sta Player_Y_Speed      ;init player's vertical speed
             lda #$fe
             sta Block_Y_Speed,x     ;set vertical speed for block object
             pla                     ;get original metatile from stack
             jsr BlockBumpedChk      ;do a sub to check which block player bumped head on
             bcc ExitBlockChk        ;if no match was found, branch to leave
             tya                     ;move block number to A
             cmp #$16                ;if block number was within 0-8 range,
             bcc BlockCode           ;branch to use current number
             sbc #$09                ;otherwise subtract 5 for second set to get proper number
BlockCode: jsr JumpEngine          ;run appropriate subroutine depending on block number
             
             .dw MushFlowerBlock
             .dw CoinBlock
             .dw CoinBlock
             .dw ExtraLifeMushBlock
             
             .dw StarBlock
             .dw StarBlock
             .dw ExtraLifeMushBlock
             .dw StarBlock
             
             .dw MushFlowerBlock
             .dw VineBlock
             .dw StarBlock
             .dw CoinBlock
             .dw ExtraLifeMushBlock
             
             .dw MushFlowerBlock
             .dw VineBlock
             .dw StarBlock
             .dw CoinBlock
             .dw ExtraLifeMushBlock
             
             .dw MushFlowerBlock
             .dw CoinBlock
             .dw ExtraLifeMushBlock
             .dw MushFlowerBlock
             
             
             ;.dw HammerMushBlock
             ;.dw HammerMushBlock
             ;.dw HammerMushBlock
             ;.dw MushFlowerBlock
             
             
MushFlowerBlock:
             lda #$00       ;load mushroom/fire flower into power-up type
             .db $2c        ;BIT instruction opcode
             
StarBlock:
             lda #$02       ;load star into power-up type
             .db $2c        ;BIT instruction opcoded
             
ExtraLifeMushBlock:
             lda #$03         ;load 1-up mushroom into power-up type
             sta PowerUpType  ;store correct power-up type
             lda #$00
             jmp SetupPowerUp
             
VineBlock:
             jsr jmpidk
             bcs ExitBlockChk
             stx $7fcd
             ldy SprDataOffset_Ctrl  ;get control bit
             jmp Setup_Vine1          ;set up vine object
             
ExitBlockChk:
             rts                     ;leave
             
BrickQBlockMetatiles:
             .db $c1, $c0, $5f, $60, $73, $c6, $c7, $30, $31, $32, $33, $34, $35 ;used by question blocks
             
             ;these two sets are functionally identical, but look different
             .db $55, $56, $57, $58, $59, $6f, $29, $2a, $2b ;, $70, $6f, $c4, $72 ;used by ground level types
             .db $5a, $5b, $5c, $5d, $5e, $6f, $29, $2a, $2b ;, $71, $6f, $c4, $72 ;used by other level types
             
             
             ;.db $c1, $c2, $c0, $5e, $5f, $60, $61 ;used by question blocks
             
             ;.db $52, $53, $54, $55, $56, $57 ;used by ground level bricks
             ;.db $58, $59, $5a, $5b, $5c, $5d ;used by other level bricks
             
BlockBumpedChk:
             ldy #$1e                    ;start at end of metatile data
BumpChkLoop: cmp BrickQBlockMetatiles,y  ;check to see if current metatile matches
             beq MatchBump               ;metatile found in block buffer, branch if so
             dey                         ;otherwise move onto next metatile
             bpl BumpChkLoop             ;do this until all metatiles are checked
             clc                         ;if none match, return with carry clear
MatchBump:   rts                         ;note carry is set if found match
             
             
BrickShatter:
             jsr CheckTopOfBlock    ;check to see if there's a coin directly above this block
             lda #Sfx_BrickShatter
             sta Block_RepFlag,x    ;set flag for block object to immediately replace metatile
             sta WaterReplace
             sta NoiseSoundQueue    ;load brick shatter sound
             lda Block_X_Position,x     ;set horizontal coordinate of block object
             sta Block_Orig_XPos,x      ;as original horizontal coordinate here
             lda #$f0
             sta Block_X_Speed,x        ;set horizontal speed for brick chunk objects
             sta Block_X_Speed+2,x
             lda #$fa
             sta Block_Y_Speed,x        ;set vertical speed for one
             lda #$fc
             sta Block_Y_Speed+2,x      ;set lower vertical speed for the other
             lda #$00
             sta Block_Y_MoveForce,x    ;init fractional movement force for both
             sta Block_Y_MoveForce+2,x
             lda Block_PageLoc,x
             sta Block_PageLoc+2,x      ;copy page location
             lda Block_X_Position,x
             sta Block_X_Position+2,x   ;copy horizontal coordinate
             lda Block_Y_Position,x
             clc                        ;add 8 pixels to vertical coordinate
             adc #$08                   ;and save as vertical coordinate for one of them
             sta Block_Y_Position+2,x
             lda #$01
             sta DigitModifier+5    ;set digit modifier to give player 50 points
             jsr AddToScore         ;do sub to update the score
             ldx SprDataOffset_Ctrl ;load control bit and leave
             rts
             
             
CheckTopOfBlock:
             ldx SprDataOffset_Ctrl  ;load control bit
             ldy $02                 ;get vertical high nybble offset used in block buffer
             beq TopEx               ;branch to leave if set to zero, because we're at the top
             tya                     ;otherwise set to A
             sec
             sbc #$10                ;subtract $10 to move up one row in the block buffer
             sta $02                 ;store as new vertical high nybble offset
             tay 
             lda ($f7),y             ;get contents of block buffer in same column, one row up
             ldx PTimer
             bne TopEx
             cmp #$c2                ;is it a coin? (not underwater)
             bne TopEx               ;if not, branch to leave
             ldx AreaType
             lda blank,x
             sta ($f7),y             ;otherwise put blank metatile where coin was
             ldx SprDataOffset_Ctrl
             jsr RemoveCoin_Axe      ;write blank metatile to vram buffer
             ldx SprDataOffset_Ctrl  ;get control bit
             jmp SetupJumpCoin       ;create jumping coin object and update coin variable
             
TopEx: ldx SprDataOffset_Ctrl
             rts
UpdSte2:
             sta Block_State,x          ;store contents of A in block object state
             rts
BouncingBlockHandler1:
             jmp BouncingBlockHandler
BlockObjectsCore:
             lda Block_State,x           ;get state of block object
             beq UpdSte2                  ;if not set, branch to leave
             and #$0f                    ;mask out high nybble
             pha                         ;push to stack
             tay                         ;put in Y for now
             txa
             clc
             adc #$09                    ;add 9 bytes to offset (note two block objects are created
             tax                         ;when using brick chunks, but only one offset for both)
             dey                         ;decrement Y to check for solid block state
             beq BouncingBlockHandler1    ;branch if found, otherwise continue for brick chunks
             ldy #$01       ;set offset for maximum speed
             lda #$50       ;set movement amount here
             sta $00
             lda MaxSpdBlockData,y    ;get maximum speed
             sta $02            ;set maximum speed here
             lda #$00           ;set value to move downwards
             jsr ImposeGravity  ;jump to the code that actually moves it
             jsr MoveObjectHorizontally  ;do another sub to move horizontally
             txa
             clc                         ;move onto next block object
             adc #$02
             tax
             ldy #$01       ;set offset for maximum speed
             lda #$50       ;set movement amount here
             sta $00
             lda MaxSpdBlockData,y    ;get maximum speed
             sta $02            ;set maximum speed here
             lda #$00           ;set value to move downwards
             jsr ImposeGravity  ;jump to the code that actually moves it
             jsr MoveObjectHorizontally  ;do another sub to move horizontally
             ldx ObjectOffset            ;get block object offset used for both
             jmp sacrificaopapu
sacrificaopapu2:
             pha
sacrificaopapu:
             lda #$09                     ;get coordinates of one block object
             ldy #$04                     ;relative to the screen
             stx $00                     ;store value to add to A here
             clc
             adc $00                     ;add A to value stored
             tax                         ;use as enemy offset
             lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset            ;reload old object offset and leave
             inx                          ;adjust offset for other block object if any
             inx
             lda #$09
             iny                          ;adjust other and get coordinates for other one
             stx $00                     ;store value to add to A here
             clc
             adc $00                     ;add A to value stored
             tax                         ;use as enemy offset
             lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset            ;reload old object offset and leave
             lda #$09
             ldy #$04
             stx $00
             clc           ;add contents of X to A to get
             adc $00       ;appropriate offset, then give back to X
             tax
             tya                         ;save offscreen bits offset to stack for now
             pha
             jsr GetXOffscreenBits  ;do subroutine here
             tay
             lda MSBtoLSB,y
             sta $00                ;store here
             jsr GetYOffscreenBits
             tay
             lda LSBtoMSB,y
             ora $00                     ;mask together with previously saved low nybble
             sta $00                     ;store both here
             pla                         ;get offscreen bits offset from stack
             tay
             lda $00                     ;get value here and store elsewhere
             sta SprObject_OffscrBits,y
             ldx ObjectOffset
             lda #$02                   ;set palette bits here
             sta $00
             lda #$75                   ;set tile number for ball (something residual, likely)
             ldy GameEngineSubroutine
             cpy #$05                   ;if end-of-level routine running,
             beq DChunks                ;use palette and tile number assigned
             lda #$03                   ;otherwise set different palette bits
             sta $00
             lda #$84                   ;and set tile number for brick chunks
DChunks: ldy Block_SprDataOffset,x  ;get OAM data offset
             iny                        ;increment to start with tile bytes in OAM
             sta Sprite_Data+12,y          ;into second row sprites
             sta Sprite_Data+8,y
             sta Sprite_Data+4,y           ;and into first row sprites
             sta Sprite_Data,y             ;and dump into tile number part of sprite data
             lda FrameCounter           ;get frame counter
             asl
             asl
             asl
             asl
             and #$c0                   ;get what was originally d3-d2 of low nybble
             ora $00                    ;add palette bits
             iny                        ;increment offset for attribute bytes
             sta Sprite_Data+12,y          ;into second row sprites
             sta Sprite_Data+8,y
             sta Sprite_Data+4,y           ;and into first row sprites
             sta Sprite_Data,y             ;and dump into tile number part of sprite data
             dey
             dey                        ;decrement offset to Y coordinate
             lda Block_Rel_YPos         ;get first block object's relative vertical coordinate
             sta Sprite_Data+4,y           ;and into first row sprites
             sta Sprite_Data,y             ;and dump into tile number part of sprite data
             lda Block_Rel_XPos         ;get first block object's relative horizontal coordinate
             sta Sprite_X_Position,y    ;save into X coordinate of first sprite
             lda Block_Orig_XPos,x      ;get original horizontal coordinate
             sec
             sbc ScreenLeft_X_Pos       ;subtract coordinate of left side from original coordinate
             sta $00                    ;store result as relative horizontal coordinate of original
             sec
             sbc Block_Rel_XPos         ;get difference of relative positions of original - current
             adc $00                    ;add original relative position to result
             adc #$06                   ;plus 6 pixels to position second brick chunk correctly
             sta Sprite_X_Position+4,y  ;save into X coordinate of second sprite
             lda Block_Rel_YPos+1       ;get second block object's relative vertical coordinate
             sta Sprite_Y_Position+8,y
             sta Sprite_Y_Position+12,y ;dump into Y coordinates of third and fourth sprites
             lda Block_Rel_XPos+1       ;get second block object's relative horizontal coordinate
             sta Sprite_X_Position+8,y  ;save into X coordinate of third sprite
             lda $00                    ;use original relative horizontal position
             sec
             sbc Block_Rel_XPos+1       ;get difference of relative positions of original - current
             adc $00                    ;add original relative position to result
             adc #$06                   ;plus 6 pixels to position fourth brick chunk correctly
             sta Sprite_X_Position+12,y ;save into X coordinate of fourth sprite
             lda Block_OffscreenBits    ;get offscreen bits for block object
             and #%00001000                ;check to see if d3 in offscreen bits are set
             beq +                    ;if not set, branch, otherwise move sprites offscreen
             lda #$f8                   ;move offscreen two OAMs
             sta Sprite_Y_Position,y    ;on the left side (or two rows of enemy on either side
             sta Sprite_Y_Position+8,y  ;if branched here from enemy graphics handler)
+:       lda Block_OffscreenBits    ;get offscreen bits again
             asl                        ;shift d7 into carry
             bcc ChnkOfs                ;if d7 not set, branch to last part
             lda #$f8
             sta Sprite_Data+4,y            ;and into first row sprites
             sta Sprite_Data,y              ;and do sub to dump into first and second sprites
ChnkOfs: lda $00                    ;if relative position on left side of screen,
             bpl ExBCDr                 ;go ahead and leave
             lda Sprite_X_Position,y    ;otherwise compare left-side X coordinate
             cmp Sprite_X_Position+4,y  ;to right-side X coordinate
             bcc ExBCDr                 ;branch to leave if less
             lda #$f8                   ;otherwise move right half of sprites offscreen
             sta Sprite_Y_Position+4,y
             sta Sprite_Y_Position+12,y
ExBCDr:  pla                         ;get lower nybble of saved state
             ldy Block_Y_HighPos,x       ;check vertical high byte of block object
             bne +
             sta Block_State,x          ;store contents of A in block object state
             rts
+:       pha                         ;otherwise save state back into stack
             lda #$f0
             cmp Block_Y_Position+2,x    ;check to see if bottom block object went
             bcs ChkTop                  ;to the bottom of the screen, and branch if not
             sta Block_Y_Position+2,x    ;otherwise set offscreen coordinate
ChkTop:  lda Block_Y_Position,x      ;get top block object's vertical coordinate
             cmp #$f0                    ;see if it went to the bottom of the screen
             pla                         ;pull block object state from stack
             bcs +
             sta Block_State,x          ;store contents of A in block object state
             rts
+:       jmp KillBlock
BouncingBlockHandler:
             ldy #$01       ;set offset for maximum speed
             lda #$50       ;set movement amount here
             sta $00
             lda MaxSpdBlockData,y    ;get maximum speed
             sta $02            ;set maximum speed here
             lda #$00           ;set value to move downwards
             jsr ImposeGravity  ;jump to the code that actually moves it
             ldx ObjectOffset           ;get block object offset
             lda #$09                     ;get coordinates of one block object
             ldy #$04                     ;relative to the screen
             stx $00                     ;store value to add to A here
             clc
             adc $00                     ;add A to value stored
             tax                         ;use as enemy offset
             lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset            ;reload old object offset and leave
             inx                          ;adjust offset for other block object if any
             inx
             lda #$09
             iny                          ;adjust other and get coordinates for other one
             stx $00                     ;store value to add to A here
             clc
             adc $00                     ;add A to value stored
             tax                         ;use as enemy offset
             lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset            ;reload old object offset and leave
             lda #$09
             ldy #$04
             stx $00
             clc           ;add contents of X to A to get
             adc $00       ;appropriate offset, then give back to X
             tax
             tya                         ;save offscreen bits offset to stack for now
             pha
             jsr GetXOffscreenBits  ;do subroutine here
             tay
             lda MSBtoLSB,y
             sta $00                ;store here
             jsr GetYOffscreenBits
             tay
             lda LSBtoMSB,y
             ora $00                     ;mask together with previously saved low nybble
             sta $00                     ;store both here
             pla                         ;get offscreen bits offset from stack
             tay
             lda $00                     ;get value here and store elsewhere
             sta SprObject_OffscrBits,y
             ldx ObjectOffset
             jsr DrawBlock              ;draw the block
             lda Block_Y_Position,x     ;get vertical coordinate
             and #$0f                   ;mask out high nybble
             cmp #$05                   ;check to see if low nybble wrapped around
             pla                        ;pull state from stack
             bcs UpdSte                 ;if still above amount, not time to kill block yet, thus branch
             lda #$01
             sta Block_RepFlag,x        ;otherwise set flag to replace metatile
KillBlock: lda #$00                   ;if branched here, nullify object state
UpdSte:    sta Block_State,x          ;store contents of A in block object state
             rts
             
             
BlockObjMT_Updater:
             ldx #$01                  ;set offset to start with second block object
UpdateLoop: stx ObjectOffset          ;set offset here
             lda VRAM_Buffer1_Offset   ;if vram buffer already being used here,
             cmp #$20
             bcs NextBUpd              ;branch to move onto next block object
             lda Block_RepFlag,x       ;if flag for block object already clear,
             beq NextBUpd              ;branch to move onto next block object
             lda Block_BBuf_Low,x      ;get low byte of block buffer
             sta $f7                   ;store into block buffer address
             lda Block_BBuf_High,x
             sta $f8                   ;set high byte of block buffer address
             lda Block_Orig_YPos,x     ;get original vertical coordinate of block object
             sta $02                   ;store here and use as offset to block buffer
             tay
             lda Block_Metatile,x      ;get metatile to be written
             sta ($f7),y               ;write it to the block buffer
             jsr ReplaceBlockMetatile2 ;do sub to replace metatile where block object is
             ;ldy temp8
             lda #$00
             sta BlockUsed,x
             sta WaterReplace
             sta Block_RepFlag,x       ;clear block object flag
NextBUpd:   dex                       ;decrement block object offset
             stx ObjectOffset          ;set offset here
             lda VRAM_Buffer1_Offset   ;if vram buffer already being used here,
             cmp #$20
             bcs +
             lda Block_RepFlag,x       ;if flag for block object already clear,
             beq +                     ;branch to move onto next block object
             lda Block_BBuf_Low,x      ;get low byte of block buffer
             sta $f7                   ;store into block buffer address
             lda Block_BBuf_High,x
             sta $f8                   ;set high byte of block buffer address
             lda Block_Orig_YPos,x     ;get original vertical coordinate of block object
             sta $02                   ;store here and use as offset to block buffer
             tay
             lda Block_Metatile,x      ;get metatile to be written
             sta ($f7),y               ;write it to the block buffer
             jsr ReplaceBlockMetatile2 ;do sub to replace metatile where block object is
             ;ldy temp8
             lda #$00
             sta BlockUsed,x
             sta WaterReplace
             sta Block_RepFlag,x       ;clear block object flag
+:          rts                       ;then leave
             
             
             
MovePlatformDown:
             lda #$00    ;save value to stack (if branching here, execute next
             .db $2c     ;part as BIT instruction)
             
MovePlatformUp:
             lda #$01        ;save value to stack
             pha
             ldy Enemy_ID,x  ;get enemy object identifier
             inx             ;increment offset for enemy object
             lda #$05        ;load default value here
             bne SetDplSpd   ;this code, thus unconditional branch here
SetDplSpd: sta $00         ;save downward movement amount here
             lda #$0a        ;save upward movement amount here
             sta $01
             lda #$03        ;save maximum vertical speed here
             sta $02
             pla             ;get value from stack
             tay             ;use as Y, then move onto code shared by red koopa
             
RedPTroopaGrav:
             jsr ImposeGravity  ;do a sub to move object gradually
             ldx ObjectOffset   ;get enemy object offset and leave
             rts
             
             
MoveDropPlatform:
             ldy #$7f      ;set movement amount for drop platform
             bne SetMdMax  ;skip ahead of other value set here
             
MoveEnemySlowVert:
             ldy #$0f         ;set movement amount for bowser/other objects
SetMdMax: lda #$02         ;set maximum speed in A
             bne SetXMoveAmt  ;unconditional branch
             
             
MoveJ_EnemyVertically:
             ldy #$1c                ;set movement amount for podoboo/other objects
SetHiMax:    lda #$03                ;set maximum speed in A
SetXMoveAmt: sty $00                 ;set movement amount here
             inx                     ;increment X for enemy offset
             sta $02                 ;set maximum speed here
             lda #$00                ;set value to move downwards
             jsr ImposeGravity       ;jump to the code that actually moves it
             ldx ObjectOffset        ;get enemy object buffer offset and leave
HE:             rts
             
             
             
MoveRedPTroopaDown:
             ldy #$00            ;set Y to move downwards
             beq MoveRedPTroopa  ;skip to movement routine
             
MoveRedPTroopaUp:
             ldy #$01            ;set Y to move upwards
             
MoveRedPTroopa:
             inx                 ;increment X for enemy offset
             lda #$03
             sta $00             ;set downward movement amount here
             lda #$06
             sta $01             ;set upward movement amount here
             lda #$02
             sta $02             ;set maximum speed here
             tya                 ;set movement direction in A, and
             bpl RedPTroopaGrav  ;jump to move this thing
             
             
             
             
             
MoveD_EnemyVertically:
             ldy #$3d           ;set quick movement amount downwards
             lda Enemy_State,x  ;then check enemy state
             cmp #$05           ;if not set to unique state for spiny's egg, go ahead
             bne ContVMove      ;and use, otherwise set different movement amount, continue on
             
MoveFallingPlatform:
             ldy #$20       ;set movement amount
ContVMove: jmp SetHiMax   ;jump to skip the rest of this
MoveObjectHorizontally1:
             lda SprObject_X_Speed,x     ;get currently saved value (horizontal
             tay
             lda LSBtoMSB,y
             sta $01                     ;store result here
             lda SprObject_X_Speed,x     ;get saved value again
             tay
             lda MSBtoLSB,y
             cmp #$08                    ;if < 8, branch, do not change
             bcc SaveXSp1
             ora #%11110000              ;otherwise alter high nybble
SaveXSp1: sta $00                     ;save result here
             ldy #$00                    ;load default Y value here
             cmp #$00                    ;if result positive, leave Y alone
             bpl UseAdde1
             dey                         ;otherwise decrement Y
UseAdde1: sty $02                     ;save Y here
             lda SprObject_X_MoveForce,x ;get whatever number's here
             clc
             adc $01                     ;add low nybble moved to high
             sta SprObject_X_MoveForce,x ;store result here
             lda #$00                    ;init A
             rol                         ;rotate carry into d0
             pha                         ;push onto stack
             ror                         ;rotate d0 back onto carry
             lda SprObject_X_Position,x
             adc $00                     ;add carry plus saved value (high nybble moved to low
             ;ldy FramesMissed
             ; beq +
             ; adc $00
+:       
             
             sta SprObject_X_Position,x  ;plus $f0 if necessary) to object's horizontal position
             lda SprObject_PageLoc,x
             adc $02                     ;add carry plus other saved value to the
             sta SprObject_PageLoc,x     ;object's page location and save
             pla
             clc                         ;pull old carry from stack and add
             adc $00                     ;to high nybble moved to low
ExXMove1: ldx ObjectOffset
+:          rts                         ;and leave
MovePlayerHorizontally:
             lda JumpspringAnimCtrl  ;if jumpspring currently animating,
             bne ExXMove             ;branch to leave
             tax                     ;otherwise set zero for offset to use player's stuff
             
MoveObjectHorizontally:
             lda SprObject_X_Speed,x     ;get currently saved value (horizontal
             tay
             lda LSBtoMSB,y
             sta $01                     ;store result here
             lda SprObject_X_Speed,x     ;get saved value again
             tay
             lda MSBtoLSB,y
             cmp #$08                    ;if < 8, branch, do not change
             bcc SaveXSpd
             ora #%11110000              ;otherwise alter high nybble
SaveXSpd: sta $00                     ;save result here
             ;ldy FramesMissed
             ;beq +
             ;clc
             ;adc $00
             ;sta $00
+:        
             ldy #$00                    ;load default Y value here
             cmp #$00                    ;if result positive, leave Y alone
             bpl UseAdder
             dey                         ;otherwise decrement Y
UseAdder: sty $02                     ;save Y here
             lda SprObject_X_MoveForce,x ;get whatever number's here
             clc
             adc $01                     ;add low nybble moved to high
             sta SprObject_X_MoveForce,x ;store result here
             lda #$00                    ;init A
             rol                         ;rotate carry into d0
             pha                         ;push onto stack
             ror                         ;rotate d0 back onto carry
             lda SprObject_X_Position,x
             adc $00                     ;add carry plus saved value (high nybble moved to low
             sta SprObject_X_Position,x  ;plus $f0 if necessary) to object's horizontal position
             lda SprObject_PageLoc,x
             adc $02                     ;add carry plus other saved value to the
             sta SprObject_PageLoc,x     ;object's page location and save
             pla
             clc
             ;ldy FramesMissed
             ;beq +
+:        adc $00                     ;to high nybble moved to low
ExXMove:  rts                         ;and leave
             
             
Jumpspring_Y_PosData:
             ;    .db $08, $10, $08, $00
             
JumpspringHandler:
             ;      jsr GetEnemyOffscreenBits   ;get offscreen information
             ;     lda TimerControl            ;check master timer control
             ;   bne DrawJSpr                ;branch to last section if set
             ;  lda JumpspringAnimCtrl      ;check jumpspring frame control
             ;; ;   beq DrawJSpr                ;branch to last section if not set
             ; tay
             ;   dey                         ;subtract one from frame control,
             ;tya                         ;the only way a poor nmos 6502 can
             ; and #%00000010              ;mask out all but d1, original value still in Y
             ;bne DownJSpr                ;if set, branch to move player up
             ;inc Player_Y_Position
             ;  inc Player_Y_Position       ;move player's vertical position down two pixels
             ;  jmp PosJSpr                 ;skip to next part
DownJSpr:;  dec Player_Y_Position       ;move player's vertical position up two pixels
             ;  dec Player_Y_Position
PosJSpr: ;  lda Jumpspring_FixedYPos,x  ;get permanent vertical position
             ;  clc
             ;  adc Jumpspring_Y_PosData,y  ;add value using frame control as offset
             ;  sta Enemy_Y_Position,x      ;store as new vertical position
             ;  cpy #$01                    ;check frame control offset (second frame is $00)
             ;  bcc BounceJS                ;if offset not yet at third frame ($01), skip to next part
             ;  lda A_B_Buttons
             ;  and #A_Button               ;check saved controller bits for A button press
             ;  beq BounceJS                ;skip to next part if A not pressed
             ;  and PreviousA_B_Buttons     ;check for A button pressed in previous frame
             ;  bne BounceJS                ;skip to next part if so
             ;  lda #$f4
             ;  sta JumpspringForce         ;otherwise write new jumpspring force here
BounceJS:;  cpy #$03                    ;check frame control offset again
             ;  bne DrawJSpr                ;skip to last part if not yet at fifth frame ($03)
             ;  lda JumpspringForce
             ;  sta Player_Y_Speed          ;store jumpspring force as player's new vertical speed
             ;  if JUMPSPRING_FIX == 1
;      lda #$40                ;PAL bugfix: Define vertical acceleration on springs (was undefined on NTSC)
             ;      sta VerticalForce
             ;  endif
             ;  lda #$00
             ;  sta JumpspringAnimCtrl      ;initialize jumpspring frame control
DrawJSpr:;  jsr RelativeEnemyPosition   ;get jumpspring's relative coordinates
             ;  jsr EnemyGfxHandler         ;draw jumpspring
             ;  jsr OffscreenBoundsCheck    ;check to see if we need to kill it
             ;  lda JumpspringAnimCtrl      ;if frame control at zero, don't bother
             ;  beq ExJSpring               ;trying to animate it, just leave
             ;  lda JumpspringTimer
             ;  bne ExJSpring               ;if jumpspring timer not expired yet, leave
             ;  lda #$04
             ;  sta JumpspringTimer         ;otherwise initialize jumpspring timer
             ;  inc JumpspringAnimCtrl      ;increment frame control to animate jumpspring
             
             
ImposeGravity:
             pha                          ;push value to stack
             lda SprObject_YMF_Dummy,x
             clc                          ;add value in movement force to contents of dummy variable
             adc SprObject_Y_MoveForce,x
             sta SprObject_YMF_Dummy,x
             ldy #$00                     ;set Y to zero by default
             lda SprObject_Y_Speed,x      ;get current vertical speed
             bpl AlterYP                  ;if currently moving downwards, do not decrement Y
             dey                          ;otherwise decrement Y
AlterYP: sty $07                      ;store Y here
             adc SprObject_Y_Position,x   ;add vertical position to vertical speed plus carry
             ;ldy FramesMissed
             ;  beq +
             ;  adc SprObject_Y_Speed,x
+:       
             
             sta SprObject_Y_Position,x   ;store as new vertical position
             lda SprObject_Y_HighPos,x
             adc $07                      ;add carry plus contents of $07 to vertical high byte
             sta SprObject_Y_HighPos,x    ;store as new vertical high byte
             lda SprObject_Y_MoveForce,x
             clc
             adc $00                      ;add downward movement amount to contents of $0433
             sta SprObject_Y_MoveForce,x
             lda SprObject_Y_Speed,x      ;add carry to vertical speed and store
             adc #$00
             sta SprObject_Y_Speed,x 
             cmp $02                      ;compare to maximum speed
             bmi ChkUpM                   ;if less than preset value, skip this part
             lda SprObject_Y_MoveForce,x
             bpl ChkUpM
             lda $02
             sta SprObject_Y_Speed,x      ;keep vertical speed within maximum value
             lda #$00
             sta SprObject_Y_MoveForce,x  ;clear fractional
ChkUpM:  pla                          ;get value from stack
             beq ExVMove                  ;if set to zero, branch to leave
             lda $02
             eor #%11111111               ;otherwise get two's compliment of maximum speed
             tay
             iny
             sty $07                      ;store two's compliment here
             lda SprObject_Y_MoveForce,x
             sec                          ;subtract upward movement amount from contents
             sbc $01                      ;of movement force, note that $01 is twice as large as $00,
             sta SprObject_Y_MoveForce,x  ;thus it effectively undoes add we did earlier
             lda SprObject_Y_Speed,x
             sbc #$00                     ;subtract borrow from vertical speed and store
             sta SprObject_Y_Speed,x
             cmp $07                      ;compare vertical speed to two's compliment
             bpl ExVMove                  ;if less negatively than preset maximum, skip this part
             lda SprObject_Y_MoveForce,x
             bmi ExVMove                  ;and if so, branch to leave
             lda $07
             sta SprObject_Y_Speed,x      ;keep vertical speed within maximum value
             lda #$ff
             sta SprObject_Y_MoveForce,x  ;clear fractional
ExVMove: rts                          ;leave!
             
MaxSpdBlockData:
             .db $06, $08
             
ImposeGravityBlock:
             ldy #$01       ;set offset for maximum speed
             lda #$50       ;set movement amount here
             sta $00
             lda MaxSpdBlockData,y    ;get maximum speed
             
ImposeGravitySprObj:
             sta $02            ;set maximum speed here
             lda #$00           ;set value to move downwards
             jmp ImposeGravity  ;jump to the code that actually moves it
             
             
             
             if DPCM
             ; DPCM data must be at $C000 or later, aligned to 64 byte boundry
             .align 64
             ;include code\sound\shmup_dpcm.asm
sample0:
             ;incbin code\sound\vyu.dmc
             incbin code\sound\tim2.dmc
sample0_end:
             endif
             
             if DPCM && TIM_GRUNT
             include code\tim.asm
             endif
             
UpdateLives:
             ldy #$00
             sty $07fb
             lda NumberofLives         ;otherwise, check number of lives
             ;iny
             ;tya
             +
             cmp #10                   ;more than 9 lives?
             bcc PutLives2
             sbc #10                   ;if so, subtract 10 and add one to the 10s digit
             ldy #$01                  ;instead of showing 100 lives, A0 will show, etc.
             sty $07fb
             -
             cmp #10
             bcc PutLives2
             sbc #10                   ;if so, subtract 10 and add to the digit
             inc $07fb                 ;next to the difference
             jmp -
PutLives2: 
             sta $07fc
             lda #$05
             jmp PrintStatusBarNumbers
             
RunOffscrBitsSubs:
             jsr GetXOffscreenBits  ;do subroutine here
             tay
             lda MSBtoLSB,y
             sta $00                ;store here
             jmp GetYOffscreenBits
RelativePlayerPosition:
             ldx #$00      ;set offsets for relative cooordinates
             ldy #$00      ;routine to correspond to player object
             lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset 
             rts
             
RelativeFireballPosition:
             ldy #$00                    ;set for fireball offsets
             txa                  ;move offset to A
             clc
             adc ObjOffsetData,y  ;add amount of bytes to offset depending on setting in Y
             tax                  ;put back in X and leave
             ldy #$02
RelWOfs: lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset            ;return original offset
             rts                 ;leave
             ;leave
SetOffscrBitsOffset:
             stx $00
             clc           ;add contents of X to A to get
             adc $00       ;appropriate offset, then give back to X
             tax
GetOffScreenBitsSet:
             tya                         ;save offscreen bits offset to stack for now
             pha
             jsr GetXOffscreenBits  ;do subroutine here
             tay
             lda MSBtoLSB,y
             sta $00                ;store here
             jsr GetYOffscreenBits
             tay
             lda LSBtoMSB,y
             ora $00                     ;mask together with previously saved low nybble
             sta $00                     ;store both here
             pla                         ;get offscreen bits offset from stack
             tay
             lda $00                     ;get value here and store elsewhere
             sta SprObject_OffscrBits,y
             ldx ObjectOffset
             rts
             
ObjOffsetData:
             .db $07, $16, $0d
             
PlayerGfxTblOffsets:
             .db $20, $28, $c8, $18, $00, $40, $50, $58
             .db $80, $88, $b8, $78, $60, $a0, $b0, $b8
             
PowerUpGfxTable:
             .db $76, $77, $78, $79 ;regular mushroom
             .db $d6, $d6, $d9, $d9 ;fire flower
             .db $8d, $8d, $e4, $e4 ;star
             .db $76, $77, $78, $79 ;1-up mushroom
             ;.db $d6, $d6, $d9, $d9 ;hammer suit
             
PowerUpAttributes:
             .db $02, $01, $02, $01, $03
             
             
             
Player_DifferenceUD:
             .db $21, $00
MoveUpsideDownPiranhaP:
             lda Enemy_State,x           ;check enemy state
             bne ExMoveUDPP              ;if set at all, branch to leave
             lda EnemyFrameTimer,x       ;check enemy's timer here
             bne ExMoveUDPP              ;branch to end if not yet expired
             lda PiranhaPlant_MoveFlag,x ;check movement flag
             bne SetupToMoveUDPPlant     ;if moving, skip to part ahead
             lda PiranhaPlant_Y_Speed,x  ;if currently rising, branch 
             bpl ReverseUPlantSpeed      ;to move enemy upwards out of pipe
             lda Enemy_X_Position,x      ;get distance between enemy object's
             sec                         ;horizontal coordinate and the player's
             sbc Player_X_Position       ;horizontal coordinate
             sta $00                     ;and store here
             lda Enemy_PageLoc,x
             sbc Player_PageLoc          ;subtract borrow, then leave
             bpl ChkPlayerNearPipe1      ;piranha plant, and branch if enemy to right of player
             lda $00                     ;otherwise get saved horizontal difference
             eor #$ff
             clc                         ;and change to two's compliment
             adc #$01
             sta $00                     ;save as new horizontal difference
             
ChkPlayerNearPipe1:
             lda Enemy_ID,x
             cmp #RUDPiranhaPlant
             bne +
             ldy #$01
             jmp ++
+:    ldy HardModeFlag
++:      lda $00                     ;get saved horizontal difference
             cmp Player_DifferenceUD,y
             bcc ExMoveUDPP               ;if player within a certain distance, branch to leave
             
ReverseUPlantSpeed:
             lda PiranhaPlant_Y_Speed,x  ;get vertical speed
             eor #$ff
             clc                         ;change to two's compliment
             adc #$01
             sta PiranhaPlant_Y_Speed,x  ;save as new vertical speed
             inc PiranhaPlant_MoveFlag,x ;increment to set movement flag
             
SetupToMoveUDPPlant:
             lda PiranhaPlantUpYPos,x    ;get original vertical coordinate (lowest point)
             ldy PiranhaPlant_Y_Speed,x  ;get vertical speed
             bmi RiseFallUDPiranhaPlant    ;branch if moving downwards
             lda PiranhaPlantDownYPos,x  ;otherwise get other vertical coordinate (highest point)
             
RiseFallUDPiranhaPlant:
             sta $00                     ;save vertical coordinate here
             lda HardModeFlag
             bne +
             lda Enemy_ID,x
             cmp #RUDPiranhaPlant
             beq +
             lda FrameCounter            ;get frame counter
             lsr
             bcc ExMoveUDPP               ;branch to leave if d0 set (execute code every other frame)
+:     lda TimerControl            ;get master timer control
             bne ExMoveUDPP              ;branch to leave if set (likely not necessary)
             lda Enemy_Y_Position,x      ;get current vertical coordinate
             clc
             adc PiranhaPlant_Y_Speed,x  ;add vertical speed to move up or down
             sta Enemy_Y_Position,x      ;save as new vertical coordinate
             cmp $00                     ;compare against low or high coordinate
             bne ExMoveUDPP              ;branch to leave if not yet reached
             lda #$00
             sta PiranhaPlant_MoveFlag,x ;otherwise clear movement flag
             lda #$40
             sta EnemyFrameTimer,x       ;set timer to delay piranha plant movement
ExMoveUDPP:
             rts
             
             
PlayerNamesOffset:
             .db MarioName-PlayerNames,LuigiName-PlayerNames
             
PlayerNames:
MarioName:
             .db "MARIO"-55
LuigiName:
             .db "LUIGI"-55
             if GAME_OVER_MENU == 1
             endif
             
XOffscreenBitsData:
             .db $7f, $3f, $1f, $0f, $07, $03, $01, $00
             .db $80, $c0, $e0, $f0, $f8, $fc, $fe, $ff
             
DefaultXOnscreenOfs:
             .db $07, $0f, $07
             
GetXOffscreenBits:
             stx $04                     ;save position in buffer to here
             ldy #$01                    ;start with right side of screen
XOfsLoop: lda ScreenEdge_X_Pos,y      ;get pixel coordinate of edge
             sec                         ;get difference between pixel coordinate of edge
             sbc SprObject_X_Position,x  ;and pixel coordinate of object position
             sta $07                     ;store here
             lda ScreenEdge_PageLoc,y    ;get page location of edge
             sbc SprObject_PageLoc,x     ;subtract from page location of object position
             ldx DefaultXOnscreenOfs,y   ;load offset value here
             cmp #$00      
             bmi XLdBData                ;if beyond right edge or in front of left edge, branch
             ldx DefaultXOnscreenOfs+1,y ;if not, load alternate offset value here
             cmp #$01      
             bpl XLdBData                ;if one page or more to the left of either edge, branch
             lda #$38                    ;if no branching, load value here and store
             sta $06
             lda #$08                    ;load some other value and execute subroutine
             sta $05       ;store current value in A here
             lda $07       ;get pixel difference
             cmp $06       ;compare to preset value
             bcs ExDivPD   ;if pixel difference >= preset value, branch
             lsr           ;divide by eight
             lsr
             lsr
             and #$07      ;mask out all but 3 LSB
             cpy #$01      ;right side of the screen or top?
             bcs SetOscrO  ;if so, branch, use difference / 8 as offset
             adc $05       ;if not, add value to difference / 8
SetOscrO: tax           ;use as offset
ExDivPD:  
XLdBData: lda XOffscreenBitsData,x    ;get bits here
             ldx $04                     ;reobtain position in buffer
             cmp #$00                    ;if bits not zero, branch to leave
             bne ExXOfsBS
             dey                         ;otherwise, do left side of screen now
             bpl XOfsLoop                ;branch if not already done with left side
ExXOfsBS: rts
YOffscreenBitsData:
             .db $00, $08, $0c, $0e
             .db $0f, $07, $03, $01
             .db $00
             
DefaultYOnscreenOfs:
             .db $04, $00, $04
             
HighPosUnitData:
             .db $ff, $00
             
GetYOffscreenBits:
             stx $04                      ;save position in buffer to here
             ldy #$01                     ;start with top of screen
YOfsLoop: lda HighPosUnitData,y        ;load coordinate for edge of vertical unit
             sec
             sbc SprObject_Y_Position,x   ;subtract from vertical coordinate of object
             sta $07                      ;store here
             lda #$01                     ;subtract one from vertical high byte of object
             sbc SprObject_Y_HighPos,x
             ldx DefaultYOnscreenOfs,y    ;load offset value here
             cmp #$00
             bmi YLdBData                 ;if under top of the screen or beyond bottom, branch
             ldx DefaultYOnscreenOfs+1,y  ;if not, load alternate offset value here
             cmp #$01
             bpl YLdBData                 ;if one vertical unit or more above the screen, branch
             lda #$20                     ;if no branching, load value here and store
             sta $06
             lda #$04                     ;load some other value and execute subroutine
             sta $05       ;store current value in A here
             lda $07       ;get pixel difference
             cmp $06       ;compare to preset value
             bcs ExDivPD1   ;if pixel difference >= preset value, branch
             lsr           ;divide by eight
             lsr
             lsr
             and #$07      ;mask out all but 3 LSB
             cpy #$01      ;right side of the screen or top?
             bcs SetOscrO1  ;if so, branch, use difference / 8 as offset
             adc $05       ;if not, add value to difference / 8
SetOscrO1: tax           ;use as offset
ExDivPD1:  
YLdBData: lda YOffscreenBitsData,x     ;get offscreen data bits using offset
             ldx $04                      ;reobtain position in buffer
             cmp #$00
             bne ExYOfsBS                 ;if bits not zero, branch to leave
             dey                          ;otherwise, do bottom of the screen now
             bpl YOfsLoop
ExYOfsBS: rts
             
             
RelativeEnemyPosition:
             lda #$01                     ;get coordinates of enemy object 
             ldy #$01                     ;relative to the screen
             stx $00                     ;store value to add to A here
             clc
             adc $00                     ;add A to value stored
             tax                         ;use as enemy offset
             lda SprObject_Y_Position,x  ;load vertical coordinate low
             sta SprObject_Rel_YPos,y    ;store here
             lda SprObject_X_Position,x  ;load horizontal coordinate
             sec                         ;subtract left edge coordinate
             sbc ScreenLeft_X_Pos
             sta SprObject_Rel_XPos,y    ;store result here
             ldx ObjectOffset            ;reload old object offset and leave
             rts
             
             
ShrinkPlayer:
             tya                          ;add ten bytes to frame control as offset
             clc
             adc #$0a                     ;this thing apparently uses two of the swimming frames
             tax                          ;to draw the player shrinking
             ldy #$09                     ;load offset for small player swimming
             lda ChangeSizeOffsetAdder,x  ;get what would normally be offset adder
             bne ShrPlF                   ;and branch to use offset if nonzero
             ldy #$01                     ;otherwise load offset for big player swimming
ShrPlF: lda PlayerGfxTblOffsets,y    ;get offset to graphics table based on offset loaded
             rts                          ;and leave
             
             
ChkForPlayerAttrib:
             ldy Player_SprDataOffset    ;get sprite data offset
             lda GameEngineSubroutine
             cmp #$0b                    ;if executing specific game engine routine,
             beq KilledAtt               ;branch to change third and fourth row OAM attributes
             lda PlayerGfxOffset         ;get graphics table offset
             cmp #$50
             beq C_S_IGAtt               ;if crouch offset, either standing offset,
             cmp #$b8                    ;or intermediate growing offset,
             beq C_S_IGAtt               ;go ahead and execute code to change 
             cmp #$c0                    ;fourth row OAM attributes only
             beq C_S_IGAtt
             cmp #$c8
             bne ExPlyrAt                ;if none of these, branch to leave
KilledAtt: lda Sprite_Attributes+16,y
             and #%00111111              ;mask out horizontal and vertical flip bits
             sta Sprite_Attributes+16,y  ;for third row sprites and save
             lda Sprite_Attributes+20,y
             and #%00111111  
             ora #%01000000              ;set horizontal flip bit for second
             sta Sprite_Attributes+20,y  ;sprite in the third row
C_S_IGAtt: lda Sprite_Attributes+24,y
             and #%00111111              ;mask out horizontal and vertical flip bits
             sta Sprite_Attributes+24,y  ;for fourth row sprites and save
             lda Sprite_Attributes+28,y
             and #%00111111
             ora #%01000000              ;set horizontal flip bit for second
             sta Sprite_Attributes+28,y  ;sprite in the fourth row
ExPlyrAt:  rts                         ;leave
ShrinkPlayer2:
             jmp ShrinkPlayer
             
HandleChangeSize:
             ldy PlayerAnimCtrl           ;get animation frame control
             lda FrameCounter
             and #%00000011               ;get frame counter and execute this code every
             bne GorSLog                  ;fourth frame, otherwise branch ahead
             iny                          ;increment frame control
             cpy #$0a                     ;check for preset upper extent
             bcc CSzNext                  ;if not there yet, skip ahead to use
             ldy #$00                     ;otherwise initialize both grow/shrink flag
             sty PlayerChangeSizeFlag     ;and animation frame control
CSzNext: sty PlayerAnimCtrl           ;store proper frame control
GorSLog: lda OldStatus
             cmp #$02
             bne +
             lda PlayerGfxOffset
             rts
+:         lda PlayerSize               ;get player's size
             bne ShrinkPlayer2             ;if player small, skip ahead to next part
             lda ChangeSizeOffsetAdder,y  ;get offset adder based on frame control as offset
             ldy #$0f                     ;load offset for player growing
             
GetOffsetFromAnimCtrl:
             asl                        ;multiply animation frame control
             asl                        ;by eight to get proper amount
             asl                        ;to add to our offset
             adc PlayerGfxTblOffsets,y  ;add to offset to graphics table
             rts                        ;and return with result in A
ProcessPlayerAction:
             lda Player_State      ;get player's state
             cmp #$03
             beq ActionClimbing    ;if climbing, branch here
             cmp #$02
             beq ActionFalling     ;if falling, branch here
             cmp #$01
             bne ProcOnGroundActs  ;if not jumping, branch here
             lda SwimmingFlag
             bne ActionSwimming    ;if swimming flag set, branch elsewhere
             ldy #$06              ;load offset for crouching
             lda CrouchingFlag     ;get crouching flag
             bne NonAnimatedActs   ;if set, branch to get offset for graphics table
             ldy #$00              ;otherwise load offset for jumping
             jmp NonAnimatedActs   ;go to get offset to graphics table
             
             if SKID_SFX
ProcOnGroundActs:
             ldy #$06                   ;load offset for crouching
             lda CrouchingFlag          ;get crouching flag
             bne NonAnimatedActs        ;if set, branch to get offset for graphics table
             ldy #$02                   ;load offset for standing
             lda Player_X_Speed         ;check player's horizontal speed
             ora Left_Right_Buttons     ;and left/right controller bits
             ora AutoScrollFlag2
             beq NonAnimatedActs        ;if no speed or buttons pressed, use standing offset
             lda Player_XSpeedAbsolute  ;load walking/running speed
             cmp #$09
             bcc ActionWalkRun          ;if less than a certain amount, branch, too slow to skid
             lda Player_MovingDir       ;otherwise check to see if moving direction
             and PlayerFacingDir        ;and facing direction are the same
             bne ActionWalkRun          ;if moving direction = facing direction, branch, don't skid
             lda GameEngineSubroutine
             cmp #$0d
             beq +
             cmp #$09                   ;if running the change size, fire flower, injure
             bcs NoSkidS                ;or death game engine subroutines, skip this
+:          lda #$80                   ;otherwise play skid sound
             sta NoiseSoundQueue
NoSkidS: iny                        ;increment to skid offset ($03)
             else
ProcOnGroundActs:
             ldy #$06                   ;load offset for crouching
             lda CrouchingFlag          ;get crouching flag
             bne NonAnimatedActs        ;if set, branch to get offset for graphics table
             ldy #$02                   ;load offset for standing
             lda Player_X_Speed         ;check player's horizontal speed
             ora Left_Right_Buttons     ;and left/right controller bits
             ora AutoScrollFlag2
             beq NonAnimatedActs        ;if no speed or buttons pressed, use standing offset
             lda Player_XSpeedAbsolute  ;load walking/running speed
             cmp #$09
             bcc ActionWalkRun          ;if less than a certain amount, branch, too slow to skid
             lda Player_MovingDir       ;otherwise check to see if moving direction
             and PlayerFacingDir        ;and facing direction are the same
             bne ActionWalkRun          ;if moving direction = facing direction, branch, don't skid
             iny                        ;otherwise increment to skid offset ($03)
             endif
             
NonAnimatedActs:
             jsr GetGfxOffsetAdder      ;do a sub here to get offset adder for graphics table
             lda #$00
             sta PlayerAnimCtrl         ;initialize animation frame control
             lda PlayerGfxTblOffsets,y  ;load offset to graphics table using size as offset
             rts
             
ActionFalling:
             ldy #$04                  ;load offset for walking/running
             jsr GetGfxOffsetAdder     ;get offset to graphics table
             jmp GetCurrentAnimOffset  ;execute instructions for falling state
             
ActionWalkRun:
             ldy #$04               ;load offset for walking/running
             jsr GetGfxOffsetAdder  ;get offset to graphics table
             jmp FourFrameExtent    ;execute instructions for normal state
             
ActionClimbing:
             ldy #$05               ;load offset for climbing
             lda Player_Y_Speed     ;check player's vertical speed
             beq NonAnimatedActs    ;if no speed, branch, use offset as-is
             jsr GetGfxOffsetAdder  ;otherwise get offset for graphics table
             jmp ThreeFrameExtent   ;then skip ahead to more code
             
ActionSwimming:
             ldy #$01               ;load offset for swimming
             jsr GetGfxOffsetAdder
             lda JumpSwimTimer      ;check jump/swim timer
             ora PlayerAnimCtrl     ;and animation frame control
             bne FourFrameExtent    ;if any one of these set, branch ahead
             lda A_B_Buttons
             bmi FourFrameExtent    ;branch to same place if A button pressed
             
GetCurrentAnimOffset:
             lda PlayerAnimCtrl         ;get animation frame control
             jmp GetOffsetFromAnimCtrl  ;jump to get proper offset to graphics table
             
FourFrameExtent:
             lda #$03              ;load upper extent for frame control
             jmp AnimationControl  ;jump to get offset and animate player object
             
ThreeFrameExtent:
             lda #$02              ;load upper extent for frame control for climbing
             
AnimationControl:
             sta $00                   ;store upper extent here
             jsr GetCurrentAnimOffset  ;get proper offset to graphics table
             pha                       ;save offset to stack
             lda PlayerAnimTimer       ;load animation frame timer
             bne ExAnimC               ;branch if not expired
             lda PlayerAnimTimerSet    ;get animation frame timer amount
             sta PlayerAnimTimer       ;and set timer accordingly
             lda PlayerAnimCtrl
             clc                       ;add one to animation frame control
             adc #$01
             cmp $00                   ;compare to upper extent
             bcc SetAnimC              ;if frame control + 1 < upper extent, use as next
             lda #$00                  ;otherwise initialize frame control
SetAnimC: sta PlayerAnimCtrl        ;store as new animation frame control
ExAnimC:  pla                       ;get offset to graphics table from stack and leave
             rts
             
GetGfxOffsetAdder:
             lda PlayerSize  ;get player's size
             beq SzOfs       ;if player big, use current offset as-is
             tya             ;for big player
             clc             ;otherwise add eight bytes to offset
             adc #$08        ;for small player
             tay
SzOfs:  rts             ;go back
GetEnemyOffscreenBits:
             lda #$01                 ;set A to add 1 byte in order to get enemy offset
             tay
             jmp SetOffscrBitsOffset
             
ChkLandedEnemyState:
             lda Enemy_State,x         ;if enemy in normal state, branch back to jump here
             bne +
             jmp SChkA
+:         cmp #$05                  ;if in state used by spiny's egg
             bne +
             jmp ProcEnemyDirection    ;then branch elsewhere
+:         cmp #$03                  ;if already in state used by koopas and buzzy beetles
             bcs ExSteChk              ;or in higher numbered state, branch to leave
             ;lda Enemy_State,x         ;load enemy state again (why?)
             cmp #$02                  ;if not in $02 state (used by koopas and buzzy beetles)
             beq +
             jmp ProcEnemyDirection    ;then branch elsewhere
+:           lda #$10                  ;load default timer here
             ldy Enemy_ID,x            ;check enemy identifier for spiny
             cpy #Spiny
             bne SetForStn             ;branch if not found
             lda #$00                  ;set timer for $00 if spiny
SetForStn: sta EnemyIntervalTimer,x  ;set timer here
             lda #$04                  ;set state here, apparently used to render
             sta Enemy_State,x         ;upside-down koopas and buzzy beetles
             lda #$00                    ;initialize vertical speed
             sta Enemy_Y_Speed,x         ;and movement force
             sta EnemyOnSlope,x
             cpx GrabID
             bne +
             sta GrabDown
             sta GrabUp
+:         sta Enemy_Y_MoveForce,x            ;do something here to vertical speed and something else
             lda Enemy_Y_Position,x
             and #%11110000          ;save high nybble of vertical coordinate, and
             ora #%00001000          ;set d3, then store, probably used to set enemy object
             sta Enemy_Y_Position,x  ;neatly on whatever it's landing on
ExSteChk:  rts                       ;then leave
             include code\titleScreen.asm
             include code\pause.asm
             include code\spriteRoutines.asm
             
             
LandEnemyInitState2: jmp LandEnemyInitState
PutOnSlope:    
Chorizo:
             lda SprObject_Y_Position,x
             and #%11110000
             sec
             sbc tempA
             clc
             adc #$02
             sta SprObject_Y_Position,x
             ;jmp GoBack
Adio:    jmp ChkForRedKoopa
JmpToBreakblock: 
             lda #$00
             sta Enemy_Y_Speed,x
             jmp BreakBlock
JmpGetBlockCoin: 
             pla
             jmp GetBlockCoin
DoSide2: 
             lda Enemy_Y_Speed,x
             bpl Adio
             lda Enemy_Y_Position,x
             cmp #$1f
             bcc Adio
             cmp #$d6
             bcs Adio
             lda Enemy_Y_HighPos,x
             beq Adio
             cmp #$02
             beq Adio
             jsr ChkAboveEnemy
             beq Adio
             cmp #$91
             beq Adio
             ldy PTimer
             beq NoPe2
             cmp #$51
             beq Adio
             pha
             cmp #$52
             beq JmpGetBlockCoin
             pla
             cmp #$28
             beq +
             cmp #$27
             beq +
             cmp #$91
             beq +
             cmp #$c2
             beq JmpToBreakblock
             cmp #$72
             beq Boi2
NoPe2:  ldy PTimer
             bne NoPe3
             cmp #$72
             beq +
             pha
             cmp #$c2       ;regular coin?
             beq JmpGetBlockCoin
             pla
NoPe3:  cmp #$26       ;blank metatile used for vines?
             beq +
             pha
             cpx GrabID
             bne +++
             ldy GrabUp
             beq ++++
+++:    lda Enemy_State,x
             bpl ++
++++:    
++: 
             pla    
             cmp #$c2       ;regular coin?
             beq +
             cmp #$c5
             beq +
             cmp #$63
             beq +
             cmp #$88
             beq +
             cmp #$60
             beq +
             cmp #$25
             beq +
             cmp #$70
             beq +
             cmp #$91
             beq +
             ldy OnOffFlag
             beq Oetu2
             cmp #$8f
             beq +
             jmp Webos
Oetu2:     cmp #$8e
             beq +
Boi2:    jmp Webos
+:       jmp ChkForRedKoopa
Webos:  pha
             cmp #$5f       ;hidden coin block?
             beq +
             cmp #$71
             beq +
             cmp #$74
             beq +
             cmp #$30
             beq +
             cmp #$6f
             bne ++
+:        pla
             cpx GrabID
             bne jod
             pha
             lda GrabUp
             beq +
             jmp ++
+++:    pla
jod:    pha
             lda Enemy_State,x
             bpl +
             lda Enemy_ID,x
             cmp #PowerUpObject
             bne ++
+:        pla
             jmp ChkForRedKoopa
++:        pla
             pha
             lda #$02
             sta Enemy_Y_Speed,x
             sta Enemy_Y_MoveForce,x
             cpx GrabID
             bne +
             lda GrabUp
             beq +
             pla
             jmp Webos2
+:        lda Enemy_State,x
             bpl +
             lda Enemy_ID,x
             cmp #PowerUpObject
             beq +
             pla
             inc GrabUp
             jmp Webos2
+:        pla
             jmp ChkForRedKoopa
SolidMTileUpperExt:
             .db $10, $61, $88, $c4
PlayerKilled2:
             jmp PlayerKilled
DoChangeSize2:
             jmp DoChangeSize
FindPlayerAction2:
             jmp FindPlayerAction
PlayerGfxHandler:
             lda InjuryTimer             ;if player's injured invincibility timer
             beq CntPl                   ;not set, skip checkpoint and continue code
             lda FrameCounter
             and #%00000010                    ;otherwise check frame counter and branch
             bne ExPGH                   ;to leave on every other frame (when d0 is set)
CntPl:  lda GameEngineSubroutine    ;if executing specific game engine routine,
             cmp #$0b                    ;branch ahead to some other part
             beq PlayerKilled2
             lda PlayerChangeSizeFlag    ;if grow/shrink flag set
             bne DoChangeSize2            ;then branch to some other code
             ldy SwimmingFlag            ;if swimming flag set, branch to
             beq FindPlayerAction2        ;different part, do not return
             lda Player_State
             ;cmp #$00                    ;if player status normal,
             beq FindPlayerAction2        ;branch and do not return
             jsr FindPlayerAction        ;otherwise jump and return
             lda FrameCounter
             and #%00000100              ;check frame counter for d2 set (8 frames every
             bne ExPGH                   ;eighth frame), and branch if set to leave
             tax                         ;initialize X to zero
             ldy Player_SprDataOffset    ;get player sprite data offset
             lda PlayerFacingDir         ;get player's facing direction
             lsr
             bcs SwimKT                  ;if player facing to the right, use current offset
             iny
             iny                         ;otherwise move to next OAM data
             iny
             iny
SwimKT: lda PlayerSize              ;check player's size
             beq BigKTS                  ;if big, use first tile
             lda Sprite_Tilenumber+24,y  ;check tile number of seventh/eighth sprite
             cmp SwimTileRepOffset       ;against tile number in player graphics table
             beq ExPGH                   ;if spr7/spr8 tile number = value, branch to leave
             inx                         ;otherwise increment X for second tile
BigKTS: lda SwimKickTileNum,x       ;overwrite tile number in sprite 7/8
             sta Sprite_Tilenumber+24,y  ;to animate player's feet when swimming
ExPGH:  rts                         ;then leave
             
DrawOneSprite:
             lda $00
             sta Sprite_Tilenumber,y
             lda $02
             sta Sprite_Y_Position,y
             lda $05
             sta Sprite_X_Position,y
             lda $04
             sta Sprite_Attributes,y
             tya                        ;add eight to the offset in Y to
             clc                        ;move to the next two sprites
             adc #$04
             tay
             rts
             
RenderPlayerSub:
             sta $07                      ;store number of rows of sprites to draw
             lda Player_Rel_XPos
             sta Player_Pos_ForScroll     ;store player's relative horizontal position
             sta $05                      ;store it here also
             lda Player_Rel_YPos
             sta $02                      ;store player's vertical position
             lda PlayerFacingDir
             sta $03                      ;store player's facing direction
             lda Player_SprAttrib
             sta $04                      ;store player's sprite attributes
             ldx PlayerGfxOffset          ;load graphics table offset
             ldy Player_SprDataOffset     ;get player's sprite data offset
             
DrawPlayerLoop:
             lda PlayerGraphicsTable,x    ;load player's left side
             sta $00
             lda PlayerGraphicsTable+1,x  ;now load right side
             jsr DrawOneSpriteRow
             dec $07                      ;decrement rows of sprites to draw
             bne DrawPlayerLoop           ;do this until all rows are drawn
             
             
             
             
             
             
             rts
             
PlayerKilled:
             ldy #$0e                      ;load offset for player killed
             lda PlayerGfxTblOffsets,y     ;get offset to graphics table
             
PlayerGfxProcessing:
             sta PlayerGfxOffset           ;store offset to graphics table here
             lda #$04
             jsr RenderPlayerSub           ;draw player based on offset loaded
             jsr ChkForPlayerAttrib        ;set horizontal flip bits as necessary
             lda FireballThrowingTimer
             beq PlayerOffscreenChk        ;if fireball throw timer not set, skip to the end
             ldy #$00                      ;set value to initialize by default
             lda PlayerAnimTimer           ;get animation frame timer
             cmp FireballThrowingTimer     ;compare to fireball throw timer
             sty FireballThrowingTimer     ;initialize fireball throw timer
             bcs PlayerOffscreenChk        ;if animation frame timer => fireball throw timer skip to end
             sta FireballThrowingTimer     ;otherwise store animation timer into fireball throw timer
             ldy #$07                      ;load offset for throwing
             lda PlayerGfxTblOffsets,y     ;get offset to graphics table
             sta PlayerGfxOffset           ;store it for use later
             ldy #$04                      ;set to update four sprite rows by default
             lda Player_X_Speed
             ora Left_Right_Buttons        ;check for horizontal speed or left/right button press
             beq SUpdR                     ;if no speed or button press, branch using set value in Y
             dey                           ;otherwise set to update only three sprite rows
SUpdR: tya                           ;save in A for use
             jsr RenderPlayerSub           ;in sub, draw player object again
             
PlayerOffscreenChk:
             lda Player_OffscreenBits      ;get player's offscreen bits
             lsr
             lsr                           ;move vertical bits to low nybble
             lsr
             lsr
             sta $00                       ;store here
             ldx #$03                      ;check all four rows of player sprites
             lda Player_SprDataOffset      ;get player's sprite data offset
             clc
             adc #$18                      ;add 24 bytes to start at bottom row
             tay                           ;set as offset here
PROfsLoop: lda #$f8                      ;load offscreen Y coordinate just in case
             lsr $00                       ;shift bit into carry
             bcc NPROffscr                 ;if bit not set, skip, do not move sprites
             sta Sprite_Data+4,y            ;and into first row sprites
             sta Sprite_Data,y              ;and do sub to dump into first and second sprites
NPROffscr: tya
             sec                           ;subtract eight bytes to do
             sbc #$08                      ;next row up
             tay
             dex                           ;decrement row counter
             bpl PROfsLoop                 ;do this until all sprite rows are checked
             rts                           ;then we are done!
             
             ;-------------------------------------------------------------------------------------
             
PlayerCollisionCore:
             ldx #$00     ;initialize X to use player's bounding box for comparison
             
SprObjectCollisionCore:
             sty $06      ;save contents of Y here
             lda #$01
             sta $07      ;save value 1 here as counter, compare horizontal coordinates first
             
CollisionCoreLoop:
             lda BoundingBox_UL_Corner,y  ;compare left/top coordinates
             cmp BoundingBox_UL_Corner,x  ;of first and second objects' bounding boxes
             bcs FirstBoxGreater          ;if first left/top => second, branch
             cmp BoundingBox_LR_Corner,x  ;otherwise compare to right/bottom of second
             bcc SecondBoxVerticalChk     ;if first left/top < second right/bottom, branch elsewhere
             beq CollisionFound           ;if somehow equal, collision, thus branch
             lda BoundingBox_LR_Corner,y  ;if somehow greater, check to see if bottom of
             cmp BoundingBox_UL_Corner,y  ;first object's bounding box is greater than its top
             bcc CollisionFound           ;if somehow less, vertical wrap collision, thus branch
             cmp BoundingBox_UL_Corner,x  ;otherwise compare bottom of first bounding box to the top
             bcs CollisionFound           ;of second box, and if equal or greater, collision, thus branch
             ldy $06                      ;otherwise return with carry clear and Y = $0006
             rts                          ;note horizontal wrapping never occurs
             
SecondBoxVerticalChk:
             lda BoundingBox_LR_Corner,x  ;check to see if the vertical bottom of the box
             cmp BoundingBox_UL_Corner,x  ;is greater than the vertical top
             bcc CollisionFound           ;if somehow less, vertical wrap collision, thus branch
             lda BoundingBox_LR_Corner,y  ;otherwise compare horizontal right or vertical bottom
             cmp BoundingBox_UL_Corner,x  ;of first box with horizontal left or vertical top of second box
             bcs CollisionFound           ;if equal or greater, collision, thus branch
             ldy $06                      ;otherwise return with carry clear and Y = $0006
             rts
             
FirstBoxGreater:
             cmp BoundingBox_UL_Corner,x  ;compare first and second box horizontal left/vertical top again
             beq CollisionFound           ;if first coordinate = second, collision, thus branch
             cmp BoundingBox_LR_Corner,x  ;if not, compare with second object right or bottom edge
             bcc CollisionFound           ;if left/top of first less than or equal to right/bottom of second
             beq CollisionFound           ;then collision, thus branch
             cmp BoundingBox_LR_Corner,y  ;otherwise check to see if top of first box is greater than bottom
             bcc NoCollisionFound         ;if less than or equal, no collision, branch to end
             beq NoCollisionFound
             lda BoundingBox_LR_Corner,y  ;otherwise compare bottom of first to top of second
             cmp BoundingBox_UL_Corner,x  ;if bottom of first is greater than top of second, vertical wrap
             bcs CollisionFound           ;collision, and branch, otherwise, proceed onwards here
             
NoCollisionFound:
             clc          ;clear carry, then load value set earlier, then leave
             ldy $06      ;like previous ones, if horizontal coordinates do not collide, we do
             rts          ;not bother checking vertical ones, because what's the point?
             
CollisionFound:
             inx                    ;increment offsets on both objects to check
             iny                    ;the vertical coordinates
             dec $07                ;decrement counter to reflect this
             bpl CollisionCoreLoop  ;if counter not expired, branch to loop
             sec                    ;otherwise we already did both sets, therefore collision, so set carry
             ldy $06                ;load original value set here earlier, then leave
             rts
             
             
BoundBoxCtrlData:
             .db $02, $08, $0e, $20 ;00
             .db $03, $14, $0d, $20 ;01
             .db $02, $14, $0e, $20 ;02
             .db $02, $09, $0e, $15 ;03
             .db $00, $00, $18, $06 ;04
             .db $00, $00, $20, $0d ;05
             .db $00, $00, $30, $0d ;06
             .db $00, $00, $08, $08 ;07
             .db $06, $04, $0a, $08 ;08
             if BOUNDBOX_FIX != 1
.db $03, $0c, $0d, $16 ;PAL diff: some enemies (Piranha, Bullet Bill, Goomba, Spiny, Blooper, Cheep Cheep) has larger hitbox
             else
             .db $03, $0e, $0d, $16 ;09
             endif
             
             .db $00, $02, $10, $15 ;0a
             .db $04, $04, $0c, $1c ;0b
             .db $04, $06, $0c, $0c ;0c
             .db $04, $02, $14, $08 ;0d
             .db $02, $0c, $0e, $14 ;0e
             .db $02, $09, $0e, $16 ;0f
             .db $03, $17, $0d, $20 ;10
             
GetFireballBoundBox:
             txa         ;add seven bytes to offset
             clc         ;to use in routines as offset for fireball
             adc #$07
             tax
             ldy #$02    ;set offset for relative coordinates
             bne FBallB  ;unconditional branch
             
GetMiscBoundBox:
             txa                       ;add nine bytes to offset
             clc                       ;to use in routines as offset for misc object
             adc #$09
             tax
             ldy #$06                  ;set offset for relative coordinates
FBallB: jsr BoundingBoxCore       ;get bounding box coordinates
             jmp CheckRightScreenBBox  ;jump to handle any offscreen coordinates
             
GetEnemyBoundBox:
             ldy #$48                 ;store bitmask here for now
             sty $00
             ldy #$44                 ;store another bitmask here for now and jump
             jmp GetMaskedOffScrBits
             
SmallPlatformBoundBox:
             ldy #$08                 ;store bitmask here for now
             sty $00
             ldy #$04                 ;store another bitmask here for now
             
GetMaskedOffScrBits:
             lda Enemy_X_Position,x      ;get enemy object position relative
             sec                         ;to the left side of the screen
             sbc ScreenLeft_X_Pos
             sta $01                     ;store here
             lda Enemy_PageLoc,x         ;subtract borrow from current page location
             sbc ScreenLeft_PageLoc      ;of left side
             bmi CMBits                  ;if enemy object is beyond left edge, branch
             ora $01
             beq CMBits                  ;if precisely at the left edge, branch
             ldy $00                     ;if to the right of left edge, use value in $00 for A
CMBits: tya                         ;otherwise use contents of Y
             and Enemy_OffscreenBits     ;preserve bitwise whatever's in here
             sta EnemyOffscrBitsMasked,x ;save masked offscreen bits here
             bne MoveBoundBoxOffscreen   ;if anything set here, branch
             jmp SetupEOffsetFBBox       ;otherwise, do something else
             
LargePlatformBoundBox:
             inx                        ;increment X to get the proper offset
             jsr GetXOffscreenBits      ;then jump directly to the sub for horizontal offscreen bits
             dex                        ;decrement to return to original offset
             cmp #$fe                   ;if completely offscreen, branch to put entire bounding
             bcs MoveBoundBoxOffscreen  ;box offscreen, otherwise start getting coordinates
             
SetupEOffsetFBBox:
             inx
             ldy #$01                    ;load 1 as offset here, same reason
             stx $00                     ;save offset here
             lda SprObject_Rel_YPos,y    ;store object coordinates relative to screen
             sta $02                     ;vertically and horizontally, respectively
             lda SprObject_Rel_XPos,y
             sta $01
             txa                         ;multiply offset by four and save to stack
             asl
             asl
             pha
             tay                         ;use as offset for Y, X is left alone
             lda SprObj_BoundBoxCtrl,x   ;load value here to be used as offset for X
             asl                         ;multiply that by four and use as X
             asl
             tax
             lda $01                     ;add the first number in the bounding box data to the
             clc                         ;relative horizontal coordinate using enemy object offset
             adc BoundBoxCtrlData,x      ;and store somewhere using same offset * 4
             sta BoundingBox_UL_Corner,y ;store here
             lda $01
             clc
             adc BoundBoxCtrlData+2,x    ;add the third number in the bounding box data to the
             sta BoundingBox_LR_Corner,y ;relative horizontal coordinate and store
             inx                         ;increment both offsets
             iny
             lda $02                     ;add the second number to the relative vertical coordinate
             clc                         ;using incremented offset and store using the other
             adc BoundBoxCtrlData,x      ;incremented offset
             sta BoundingBox_UL_Corner,y
             lda $02
             clc
             adc BoundBoxCtrlData+2,x    ;add the fourth number to the relative vertical coordinate
             sta BoundingBox_LR_Corner,y ;and store
             pla                         ;get original offset loaded into $00 * y from stack
             tay                         ;use as Y
             ldx $00                     ;get original offset and use as X again
             jmp CheckRightScreenBBox   ;jump to handle offscreen coordinates of bounding box
             
MoveBoundBoxOffscreen:
             txa                            ;multiply offset by 4
             asl
             asl
             tay                            ;use as offset here
             lda #$ff
             sta EnemyBoundingBoxCoord,y    ;load value into four locations here and leave
             sta EnemyBoundingBoxCoord+1,y
             sta EnemyBoundingBoxCoord+2,y
             sta EnemyBoundingBoxCoord+3,y
             rts
             
BoundingBoxCore:
             stx $00                     ;save offset here
             lda SprObject_Rel_YPos,y    ;store object coordinates relative to screen
             sta $02                     ;vertically and horizontally, respectively
             lda SprObject_Rel_XPos,y
             sta $01
             txa                         ;multiply offset by four and save to stack
             asl
             asl
             pha
             tay                         ;use as offset for Y, X is left alone
             lda SprObj_BoundBoxCtrl,x   ;load value here to be used as offset for X
             asl                         ;multiply that by four and use as X
             asl
             tax
             lda $01                     ;add the first number in the bounding box data to the
             clc                         ;relative horizontal coordinate using enemy object offset
             adc BoundBoxCtrlData,x      ;and store somewhere using same offset * 4
             sta BoundingBox_UL_Corner,y ;store here
             lda $01
             clc
             adc BoundBoxCtrlData+2,x    ;add the third number in the bounding box data to the
             sta BoundingBox_LR_Corner,y ;relative horizontal coordinate and store
             inx                         ;increment both offsets
             iny
             lda $02                     ;add the second number to the relative vertical coordinate
             clc                         ;using incremented offset and store using the other
             adc BoundBoxCtrlData,x      ;incremented offset
             sta BoundingBox_UL_Corner,y
             lda $02
             clc
             adc BoundBoxCtrlData+2,x    ;add the fourth number to the relative vertical coordinate
             sta BoundingBox_LR_Corner,y ;and store
             pla                         ;get original offset loaded into $00 * y from stack
             tay                         ;use as Y
             ldx $00                     ;get original offset and use as X again
             rts
             
CheckRightScreenBBox:
             lda ScreenLeft_X_Pos       ;add 128 pixels to left side of screen
             clc                        ;and store as horizontal coordinate of middle
             adc #$80
             sta $02
             lda ScreenLeft_PageLoc     ;add carry to page location of left side of screen
             adc #$00                   ;and store as page location of middle
             sta $01
             lda SprObject_X_Position,x ;get horizontal coordinate
             cmp $02                    ;compare against middle horizontal coordinate
             lda SprObject_PageLoc,x    ;get page location
             sbc $01                    ;subtract from middle page location
             bcc CheckLeftScreenBBox    ;if object is on the left side of the screen, branch
             lda BoundingBox_DR_XPos,y  ;check right-side edge of bounding box for offscreen
             bmi NoOfs                  ;coordinates, branch if still on the screen
             lda #$ff                   ;load offscreen value here to use on one or both horizontal sides
             ldx BoundingBox_UL_XPos,y  ;check left-side edge of bounding box for offscreen
             bmi SORte                  ;coordinates, and branch if still on the screen
             sta BoundingBox_UL_XPos,y  ;store offscreen value for left side
SORte: sta BoundingBox_DR_XPos,y  ;store offscreen value for right side
NoOfs: ldx ObjectOffset           ;get object offset and leave
             rts
             
CheckLeftScreenBBox:
             lda BoundingBox_UL_XPos,y  ;check left-side edge of bounding box for offscreen
             bpl NoOfs2                 ;coordinates, and branch if still on the screen
             cmp #$a0                   ;check to see if left-side edge is in the middle of the
             bcc NoOfs2                 ;screen or really offscreen, and branch if still on
             lda #$00
             ldx BoundingBox_DR_XPos,y  ;check right-side edge of bounding box for offscreen
             bpl SOLft                  ;coordinates, branch if still onscreen
             sta BoundingBox_DR_XPos,y  ;store offscreen value for right side
SOLft:  sta BoundingBox_UL_XPos,y  ;store offscreen value for left side
NoOfs2: ldx ObjectOffset           ;get object offset and leave
             rts
             
             
_InitializeMemory:
             ldx #$07          ;set initial high byte to $0700-$07ff
             lda #$00          ;set initial low byte to start of page (at $00 of page)
             sta $06
InitPageLoop: stx $07
InitByteLoop: cpx #$01          ;check to see if we're on the stack ($0100-$01ff)
             bne InitByte      ;if not, go ahead anyway
             cpy #$60          ;otherwise, check to see if we're at $0160-$01ff
             bcs SkipByte      ;if so, skip write
InitByte:     sta ($06),y       ;otherwise, initialize byte with current low byte in Y
SkipByte:     dey
             cpy #$ff          ;do this until all bytes in page have been erased
             bne InitByteLoop
             dex               ;go onto the next page
             bpl InitPageLoop  ;do this until all pages of memory have been erased
             
             rts 
             ; set default chr banks
             
             rts
             
             
SwimKickTileNum:
             .db $31, $46
             
             
LakituDiffAdj:
             .db $15, $30, $40
             
HammerThrowTmrData:
             .db $30, $10
             
XSpeedAdderData:
             .db $00, $fa, $00, $05
             
RevivedXSpeed:
             .db $08, $f8, $0e, $f1
             
SwimSpeed: 
             .db $03, $fd, $03
             
PlayerGraphicsTable:
             .db $00, $01, $02, $03, $04, $05, $06, $07 ;walking frame 1
             .db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ;        frame 2
             .db $10, $11, $12, $13, $14, $15, $16, $17 ;        frame 3
             .db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ;skidding
             .db $20, $21, $22, $23, $24, $25, $26, $27 ;jumping
             .db $08, $09, $28, $29, $2a, $2b, $2c, $2d ;swimming frame 1
             .db $08, $09, $0a, $0b, $0c, $30, $2c, $2d ;         frame 2
             .db $08, $09, $0a, $0b, $2e, $2f, $2c, $2d ;         frame 3
             .db $08, $09, $28, $29, $2a, $2b, $5c, $5d ;climbing frame 1
             .db $08, $09, $0a, $0b, $0c, $0d, $5e, $5f ;         frame 2
             .db $fc, $fc, $08, $09, $58, $59, $5a, $5a ;crouching
             .db $08, $09, $28, $29, $2a, $2b, $0e, $0f ;fireball throwing
             
             .db $fc, $fc, $fc, $fc, $32, $33, $34, $35 ;walking frame 1
             .db $fc, $fc, $fc, $fc, $36, $37, $38, $39 ;        frame 2
             .db $fc, $fc, $fc, $fc, $3a, $37, $3b, $3c ;        frame 3
             .db $fc, $fc, $fc, $fc, $3d, $3e, $3f, $40 ;skidding
             .db $fc, $fc, $fc, $fc, $32, $41, $42, $43 ;jumping
             .db $fc, $fc, $fc, $fc, $32, $33, $44, $45 ;swimming frame 1
             .db $fc, $fc, $fc, $fc, $32, $33, $44, $47 ;         frame 2
             .db $fc, $fc, $fc, $fc, $32, $33, $48, $49 ;         frame 3
             .db $fc, $fc, $fc, $fc, $32, $33, $90, $91 ;climbing frame 1
             .db $fc, $fc, $fc, $fc, $3a, $37, $92, $93 ;         frame 2
             .db $fc, $fc, $fc, $fc, $9e, $9e, $9f, $9f ;killed
             
             .db $fc, $fc, $fc, $fc, $3a, $37, $5b, $4f ;small player standing
             .db $fc, $fc, $00, $01, $4c, $4d, $4e, $4e ;intermediate grow frame
             .db $00, $01, $4c, $4d, $75, $4a, $4b, $4b ;big player standing
             .db $fc, $fc, $fc, $fc, $3a, $37, $5b, $4f ;crouching
FindPlayerAction:
             jsr ProcessPlayerAction       ;find proper offset to graphics table by player's actions
             jmp PlayerGfxProcessing       ;draw player, then process for fireball throwing
DoChangeSize:
             jsr HandleChangeSize          ;find proper offset to graphics table for grow/shrink
             jmp PlayerGfxProcessing       ;draw player, then process for fireball throwing
             
             
MetatileThingy:    ;this table specifies the metatile id that each metatile acts like, for example, a metatile which acts like metatile id $54, acts like the ground, thus solid
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             .db $10, $11, $54, $54, $54, $54, $88, $88, $88, $88, $88, $88, $1c, $54, $54, $1f
             .db $54, $54, $54, $23, $25, $25, $26, $52, $52, $5f, $60, $6f, $54, $54, $2e, $2f
             .db $30, $31, $32, $33, $34, $35, $54, $54, $5f, $60, $6f, $30, $c0, $54, $54, $00
             
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             .db $00, $52, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f
             .db $60, $54, $54, $63, $54, $54, $54, $67, $67, $54, $6a, $6b, $6c, $6d, $6e, $6f
             .db $70, $71, $72, $73, $74, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             
             .db $00, $00, $00, $00, $00, $00, $86, $87, $88, $88, $8a, $8b, $8c, $8d, $8e, $8f
             .db $91, $91, $54, $00, $00, $54, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             
             .db $c0, $c1, $c2, $c3, $54, $c5, $c6, $c7, $54, $54, $54, $54, $54, $54, $54, $54
             .db $54, $54, $00, $00, $00, $00, $54, $54, $54, $00, $00, $00, $54, $54, $54, $88
             .db $88, $88, $54, $54, $8a, $00, $54, $00, $54, $00, $00, $00, $00, $00, $00, $00    
             .db $70, $00, $54
DoWarpZone:
             lda #$00
             sta WarpZoneCheck
             ldx #$04            ;load value of 4 for game text routine as default
             lda WorldNumber     ;warp zone (4-3-2), then check world number
             beq WarpNum
             inx                 ;if world number > 1, increment for next warp zone (5)
             inx
             inx
             ldy AreaType        ;check area type
             dey
             bne WarpNum         ;if ground area type, increment for last warp zone emanems
             dex
             dex
             inx                 ;(8-7-6) and move on
WarpNum: txa
             sta WarpZoneControl ;store number here to be used by warp zone routine
             jsr WriteGameText   ;print text and warp zone numbers
             lda #PiranhaPlant
             jmp KillEnemies     ;load identifier for piranha plants and do sub
             
             
KillEnemies:
             sta $00           ;store identifier here
             lda #$00
             ldx #$04          ;check for identifier in enemy object buffer
KillELoop: ldy Enemy_ID,x
             cpy $00           ;if not found, branch
             bne NoKillE
             sta Enemy_Flag,x  ;if found, deactivate enemy object flag
NoKillE:   dex               ;do this until all slots are checked
             bpl KillELoop
             rts
             
             if BATTERY
             include code\save.asm
             endif
             
FirebarPosLookupTbl:
             .db $00, $01, $03, $04, $05, $06, $07, $07, $08
             .db $00, $03, $06, $09, $0b, $0d, $0e, $0f, $10
             .db $00, $04, $09, $0d, $10, $13, $16, $17, $18
             .db $00, $06, $0c, $12, $16, $1a, $1d, $1f, $20
             .db $00, $07, $0f, $16, $1c, $21, $25, $27, $28
             .db $00, $09, $12, $1b, $21, $27, $2c, $2f, $30
             .db $00, $0b, $15, $1f, $27, $2e, $33, $37, $38
             .db $00, $0c, $18, $24, $2d, $35, $3b, $3e, $40
             .db $00, $0e, $1b, $28, $32, $3b, $42, $46, $48
             .db $00, $0f, $1f, $2d, $38, $42, $4a, $4e, $50
             .db $00, $11, $22, $31, $3e, $49, $51, $56, $58
             
FirebarMirrorData:
             .db $01, $03, $02, $00
             
FirebarTblOffsets:
             .db $00, $09, $12, $1b, $24, $2d
             .db $36, $3f, $48, $51, $5a, $63
             
FirebarYPos:
             .db $0c, $18
             
             
BlockBufferAdderData:
             .db $00, $07, $0e
             
BlockBuffer_X_Adder:
             .db $08, $03, $0c, $02, $02, $0d, $0d, $08 ;00-07
             .db $03, $0c, $02, $02, $0d, $0d, $08, $03 ;08-0f
             .db $0c, $02, $02, $0d, $0d, $08, $00, $10 ;10-17
             .db $04, $14, $04, $04, $03, $0c, $03, $0c ;18-1f
             .db $08, $08, $08, $0c, $08, $08, $08
             
BlockBuffer_Y_Adder:
             .db $04, $20, $20, $08, $18, $08, $18, $02
             .db $20, $20, $08, $18, $08, $18, $12, $20
             .db $20, $18, $18, $18, $18, $18, $14, $14
             .db $06, $06, $08, $10, $12, $12, $04, $04
             .db $09, $09, $20, $1f, $17, $12, $17
             
BlockBuffer_Y_Adder3:
             .db $e4, $00, $00, $e8, $f8, $e8, $f8, $e2
             .db $00, $00, $08, $f8, $e8, $f8, $f2, $00
             .db $00, $f8, $f8, $f8, $f8, $f8, $f4, $f4
             .db $e6, $e6, $e8, $f0, $f2, $f2, $e4, $e4
             .db $e9, $e9, $00, $ef, $e7, $e2, $f7
             
jmpidk:
             ldx #$05
             clc
             lda Enemy_Flag,x
             beq +
             jsr QUe
             bcc +
+++:    ldy tempC
             lda OrigMetatile,y
             sta Block_Metatile,y
             sta Cbolla,y
             sec
             rts
+:        clc
             rts
QUe:    
             ldx #$00
-:        clc
             lda Enemy_Flag,x
             beq +
             inx
             cpx #$05
             bne -
+:        rts
             
             
ImpedePlayerMove:
             lda GameEngineSubroutine
             cmp #$0a
             beq EXPM
             lda #$00                  ;initialize value here
             ldy Player_X_Speed        ;get player's horizontal speed
             ldx $00                   ;check value set earlier for
             dex                       ;left side collision
             bne RImpd                 ;if right side collision, skip this part
             inx                       ;return value to X
             cpy #$00                  ;if player moving to the left,
             bmi +                     ;branch to invert bit and leave
             ldy #$00 
+:           lda #$ff                  ;otherwise load A with value to be used later
             jmp NXSpd                 ;and jump to affect movement
RImpd:       ldx #$02                  ;return $02 to X
             cpy #$01                  ;if player moving to the right
             bpl +
             ldy #$00
+:           lda #$01                  ;otherwise load A with value to be used here
NXSpd:       sty $01
             ldy #$10
             sty SideCollisionTimer    ;set timer of some sort
             ldy $01
             sty Player_X_Speed        ;nullify player's horizontal speed
             ldy #$00
             cmp #$00                  ;if value set in A not set to $ff,
             bpl PlatF                 ;branch ahead, do not decrement Y
             dey                       ;otherwise decrement Y now
PlatF:       sty $00                   ;store Y as high bits of horizontal adder
             sta SideCollisionAdder
             clc
             adc Player_X_Position     ;add contents of A to player's horizontal
             sta Player_X_Position     ;position to move player left or right
             lda Player_PageLoc
             adc $00                   ;add high bits and carry to
             sta Player_PageLoc        ;page location if necessary
             lda Player_State
             bne ExIPM
             lda #$00
             sta Player_X_Speed
             
ExIPM:       txa                       ;invert contents of X
             eor #$ff
             and Player_CollisionBits  ;mask out bit that was set here
             sta Player_CollisionBits  ;store to clear bit
             cmp #$fd
             bne EXPM
             inc DontJump
EXPM:        rts
             
             
SixSpriteStacker:
             ldx #$06           ;do six sprites
StkLp: sta Sprite_Data,y  ;store X or Y coordinate into OAM data
             clc
             adc #$08           ;add eight pixels
             iny
             iny                ;move offset four bytes forward
             iny
             iny
             dex                ;do another sprite
             bne StkLp          ;do this until all sprites are done
             ldy $02            ;get saved OAM data offset and leave
             rts
             
             if CHEEPCHEEP_FIX == 1
MoveFlyingCheepCheep:             ;PAL diff: reworked movement function for Cheep Cheeps
             ldy #$20
             lda Enemy_State,x          ;check cheep-cheep's enemy state
             and #%00100000             ;for d5 set
             bne FlyCC
             inx                         ;increment offset for enemy offset
             jsr MoveObjectHorizontally  ;position object horizontally according to
             ldx ObjectOffset            ;counters, return with saved value in A,
             ldy #$17
             
FlyCC: lda #$05
             jmp SetXMoveAmt
             else
MoveFlyingCheepCheep:
             lda Enemy_State,x          ;check cheep-cheep's enemy state
             and #%00100000             ;for d5 set
             beq FlyCC                  ;branch to continue code if not set
             lda #$00
             sta Enemy_SprAttrib,x      ;otherwise clear sprite attributes
             jmp MoveJ_EnemyVertically  ;and jump to move defeated cheep-cheep downwards
FlyCC:  inx                         ;increment offset for enemy offset                       ;increment offset for enemy offset
             jsr MoveObjectHorizontally  ;position object horizontally according to
             ;ldx ObjectOffset            ;counters, return with saved value in A,
             ldx ObjectOffset            ;counters, return with saved value in A,
             ldy #$0d                   ;set vertical movement amount
             lda #$05                   ;set maximum speed
             jsr SetXMoveAmt            ;branch to impose gravity on flying cheep-cheep
             lda Enemy_Y_MoveForce,x
             lsr                        ;get vertical movement force and
             lsr                        ;move high nybble to low
             lsr
             lsr
             tay                        ;save as offset (note this tends to go into reach of code)
             lda Enemy_Y_Position,x     ;get vertical position
             sec                        ;subtract pseudorandom value based on offset from position
             sbc PRandomSubtracter,y
             bpl AddCCF                  ;if result within top half of screen, skip this part
             eor #$ff
             clc                        ;otherwise get two's compliment
             adc #$01
AddCCF: cmp #$08                   ;if result or two's compliment greater than eight,
             bcs BPGet                  ;skip to the end without changing movement force
             lda Enemy_Y_MoveForce,x
             clc
             adc #$10                   ;otherwise add to it
             sta Enemy_Y_MoveForce,x
             lsr                        ;move high nybble to low again
             lsr
             lsr
             lsr
             tay
BPGet:  lda FlyCCBPriority,y       ;load bg priority data and store (this is very likely
             sta Enemy_SprAttrib,x      ;broken or residual code, value is overwritten before
             rts                        ;drawing it next frame), then leave
             endif
             
BlockBufferAdderData1:
             .db $00, $07, $0e
             
BlockBuffer_X_Adder1:
             .db $08, $03, $0c, $02, $02, $0d, $0d, $08 ;00-07
             .db $03, $0c, $02, $02, $0d, $0d, $08, $03 ;08-0f
             .db $0c, $02, $02, $0d, $0d, $08, $00, $10 ;10-17
             .db $04, $14, $04, $04, $03, $0c, $03, $0c ;18-1f
             .db $08, $08, $08, $08, $08, $08
             
BlockBuffer_Y_Adder1:
             .db $04, $20, $20, $08, $18, $08, $18, $02
             .db $20, $20, $08, $18, $08, $18, $12, $20
             .db $20, $18, $18, $18, $18, $18, $14, $14
             .db $06, $06, $08, $10, $12, $12, $04, $04
             .db $09, $09, $20, $1f, $17, $14
             
BlockBuffer_Y_Adder2:
             .db $e4, $00, $00, $e8, $f8, $e8, $f8, $e2
             .db $00, $00, $08, $f8, $e8, $f8, $f2, $00
             .db $00, $f8, $f8, $f8, $f8, $f8, $f4, $f4
             .db $e6, $e6, $e8, $f0, $f2, $f2, $e4, $e4
             .db $e9, $e9, $00, $ff, $f7, $f4
             
BlockBufferAddr1:
             .db <Block_Buffer_1, <Block_Buffer_2
             .db >Block_Buffer_1, >Block_Buffer_2
             
BlockBufferColli_Feet:
             ;inc PlayerFoot
             iny            ;if branched here, increment to next set of adders
             
BlockBufferColli_Head:
             lda #$00       ;set flag to return vertical coordinate
             .db $2c        ;BIT instruction opcode
             
BlockBufferColli_Side:
             lda #$01       ;set flag to return horizontal coordinate
             ;ldx #$00       ;set offset for player object
             
BlockBufferCollision:
             pha                         ;save contents of A to stack
             sty $04                     ;save contents of Y here
             lda BlockBuffer_X_Adder1,y   ;add horizontal coordinate
             clc                         ;of object to value obtained using Y as offset
             adc SprObject_X_Position
             sta $05                     ;store here
             lda SprObject_PageLoc    ;of indirect here
             adc #$66
             sta $f8
             sta Player_X_Column
             ;lda SprObject_PageLoc       ;get LSB, mask out all other bits
             ;lsr                         ;move to carry
             ldy $05
             lda MSBtoLSB,y
             sta $f7                     ;store here and leave
             ldy $04                     ;get old contents of Y
             
             ;jsr TheLagMaker               ;if need to lag the game to an unplayable level, uncomment this
             
             lda SprObject_Y_Position  ;get vertical coordinate of object
             clc
             adc BlockBuffer_Y_Adder2,y   ;add it to value obtained using Y as offset
             and #%11110000              ;mask out low nybble
             sta $02                     ;store result here
             tay                         ;use as offset for block buffer
             lda ($f7),y                 ;check current content of block buffer
             sta $03                     ;and store here
             ldy $04                     ;get old contents of Y again
             pla                         ;pull A from stack
             bne RetXC                   ;if A = 1, branch
             lda SprObject_Y_Position  ;if A = 0, load vertical coordinate
             and #%00001111              ;and mask out high nybble
             sta $04                     ;store masked out result here
             ldx $03                     ;get saved content of block buffer
             lda MetatileThingy,x
             rts                         ;and leave, again...
RetXC: lda SprObject_X_Position  ;otherwise load horizontal coordinate
             and #%00001111              ;and mask out high nybble
             sta $04                     ;store masked out result here
             ldx $03                     ;get saved content of block buffer
             lda MetatileThingy,x
             rts                         ;and leave
             
KillPlant:
             ldy SavedOffset,x
             lda #$02
             sta Saved_isDefeated,y
             lda StarInvincibleTimer
             beq +
             inc StarChainCounter
             lda Enemy_State,x
             and #%00011111            ;mask out 2 MSB of enemy object's state
             ora #%00100000            ;set d5 to defeat enemy and save as new state
             sta Enemy_State,x
             lda #Sfx_EnemySmack      ;play smack enemy sound
             ora tempA
             sta Square1SoundQueue
             lda EnemyDefeatPitch     ;get chain counter for shell
             cmp #$0b
             beq ++
             inc EnemyDefeatPitch
++:
             lda StarChainCounter
             jmp SetupFloateyNumber
+:    lda Enemy_State,x
             and #%00011111            ;mask out 2 MSB of enemy object's state
             ora #%00100000            ;set d5 to defeat enemy and save as new state
             sta Enemy_State,x
             lda #Sfx_EnemySmack      ;play smack enemy sound
             ora tempA
             sta Square1SoundQueue
             lda #$00
             sta Enemy_Flag,x
             lda #$02
             jmp SetupFloateyNumber
             
MSBtoLSB:
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             .db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
             .db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
             .db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
             
             .db $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
             .db $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
             .db $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
             .db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
             
             .db $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
             .db $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09
             .db $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a, $0a
             .db $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b, $0b
             
             .db $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c
             .db $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d, $0d
             .db $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e, $0e
             .db $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
             
LSBtoMSB:
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             .db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90, $a0, $b0, $c0, $d0, $e0, $f0
             
             
BridgeCollapseData:
             .db $1a ;axe
             .db $98, $96, $94, $92, $90, $8e, $8c ;bridge
             .db $8a, $88, $86, $84, $82, $80
             
DrawPowerUp:
             lda Enemy_SprAttrib,x  ;get power-up's sprite data offset
             sta $7fb5
             stx $7fb6
             ldy Enemy_SprDataOffset,x
             sty $7fb4
             lda Enemy_Rel_YPos         ;get relative vertical coordinate
             clc
             adc #$08                   ;add eight pixels
             sta $02                    ;store result here
             lda Enemy_Rel_XPos         ;get relative horizontal coordinate
             sta $05                    ;store here
             lda $7fce,x
             tax
             ;ldx PowerUpType            ;get power-up type
             lda PowerUpAttributes,x    ;get attribute data for power-up type
             ora $7fb5                  ;add background priority bit if set
             sta $04                    ;store attributes here
             txa
             pha                        ;save power-up type to the stack
             asl
             asl                        ;multiply by four to get proper offset
             tax                        ;use as X
             lda #$01
             sta $07                    ;set counter here to draw two rows of sprite object
             lda $7fb8
             beq +
             cpx #$14
             beq PUpDrawLoop
             cpx #$24
             beq PUpDrawLoop
+:      sta $03                    ;init d1 of flip control
PUpDrawLoop:
             lda PowerUpGfxTable,x      ;load left tile of power-up object
             sta $00
             lda PowerUpGfxTable+1,x    ;load right tile
             jsr DrawOneSpriteRow       ;branch to draw one row of our power-up object
             dec $07                    ;decrement counter
             bpl PUpDrawLoop            ;branch until two rows are drawn
             ldy $7fb4                     ;get sprite data offset again
             pla                        ;pull saved power-up type from the stack
             beq PUpOfs                 ;if regular mushroom, branch, do not change colors or flip
             cmp #$03
             beq PUpOfs                 ;if 1-up mushroom, branch, do not change colors or flip
             sta $00                    ;store power-up type here now
             lda FrameCounter           ;get frame counter
             lsr                        ;divide by 2 to change colors every two frames
             and #%00000011             ;mask out all but d1 and d0 (previously d2 and d1)
             ora $7fb5                     ;add background priority bit if any set
             sta Sprite_Attributes,y    ;set as new palette bits for top left and
             sta Sprite_Attributes+4,y  ;top right sprites for fire flower and star
             ldx $00
             dex                        ;check power-up type for fire flower
             beq FlipPUpRightSide       ;if found, skip this part
             sta Sprite_Attributes+8,y  ;otherwise set new palette bits  for bottom left
             sta Sprite_Attributes+12,y ;and bottom right sprites as well for star only
             
FlipPUpRightSide:
             lda Sprite_Attributes+4,y
             ora #%01000000             ;set horizontal flip bit for top right sprite
             sta Sprite_Attributes+4,y
             lda Sprite_Attributes+12,y
             ora #%01000000             ;set horizontal flip bit for bottom right sprite
             sta Sprite_Attributes+12,y ;note these are only done for fire flower and star power-ups
PUpOfs: jmp SprObjectOffscrChk     ;jump to check to see if power-up is offscreen at all, then leave
             
             
             
