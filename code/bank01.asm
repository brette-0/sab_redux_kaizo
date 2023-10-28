             
             
             
             
             
             
             
             
             
             
             
             include code\mmc3.asm
             
MessageBoxData_Low:
             .db <MessageBoxData
MessageBoxData_High:
             .db >MessageBoxData
MessageBoxData:
             .db $25, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $26, $2a
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $2b, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $2c
             .db $28, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $29
             .db $ff
ASCII2CHR:
             .db $24, $5b, $80, $5d, $5e, $5f, $81, $82, $60, $61, $83, $62, $2d, $63, $2e, $84, $00, $01, $02, $03, $04, $05
             .db $06, $07, $08, $09, $3a, $3b, $64, $66, $65, $5a, $5c, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13
             .db $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $80, $81, $82, $6d, $6f
             .db $84, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f, $50, $51, $52, $53
             .db $54, $55, $56, $57, $58, $59, $7b, $7c, $7d
             
             .db $6e, $69, $6a, $6b, $6c, $67, $68 ;button emojis
             
TestText: .db "Hello! Welcome to this game.", $fc, "In this game you can go", $fc ,"backwards and grab shells!", $ff ;01
ID01:    .db "If you pause, you can save", $fc, "your game. Just select quit", $fc, "and save and then you can", $fc, "continue playing later.", $ff ;02
VeryLongText: .db "If you hold ", UP, " when releasing a", $fc, "shell, you will throw it", $fc, "upwards and if you hold ", DOWN, " you will release the shell gently", $fc, "on the floor." ,$ff ;03
Jigas: .db "Welcome to the beach! Come", $fc, "here and relax a bit.", $ff ;04
ID05: .db "You can swim in water in this hack! Use ", UP , " + ", Abutton, " to exit the", $fc, "water.", $ff ;05
Structured: .db "In this video I will be", $fc, "explaining exactly what I do", $fc, "to collect Watch for Rolling", $fc, "Rocks in 0.5xA presses.", $fd, "But first, we need to clear", $fc, "something up.", $ff ;06
Firefox: .db "You will never reach the", $fc, "princess! Bwahahaha", $fc, "                       -Bowser", $ff ;07
Kaizo: .db "Welcome to World 9, also", $fc, "called Kaizo World. First, you", $fc, "will need to master shell", $fc, "jumps.", $ff ;08
Lava: .db "The power of the star is not", $fc,"good enough to protect you", $fc,"from firebars while in lava.", $ff ;09
             
Temple: .db "What Wizardry lead you here?", $fc, "Nothing but the power of a", $fc, "Genie could bring you here", $ff; 0A 
MoltenCave: .db "I would keep a shell handy", $fc, "To traverse these pilars", $ff; 0B 
MC_Q: .db "What is the name of the", $fc, "Great Demon King Bowser?", $ff; 0C 
MC_A: .db "Barry", $ff; 0D 
MC_B: .db "Brette", $ff; 0E 
MC_C: .db "Bruce", $ff;0F

Space: .db "How are you even breathing?", $ff; 10

Textbox_Low:
             .dl TestText, ID01, VeryLongText, Jigas, ID05, Structured, Firefox, Kaizo, Lava, Temple, MoltenCave, MC_Q, MC_A, MC_B, MC_C, Space
Textbox_High:
             .dh TestText, ID01, VeryLongText, Jigas, ID05, Structured, Firefox, Kaizo, Lava, Temple, MoltenCave, MC_Q, MC_A, MC_B, MC_C, Space
             
-:  rts
SetupTextbox:
             lda MessageBoxData_Low
             sta $fd
             lda MessageBoxData_High
             sta $fe
             
             lda PPU_STATUS    
             lda Mirror_PPU_CTRL_REG1
             and #%11101011            ;only increment by 1
             sta PPU_CTRL_REG1         ;write contents of A to PPU register 1
             sta Mirror_PPU_CTRL_REG1  ;and its mirror
             
             lda #$2c
             sta PPU_ADDRESS
             lda #$00
             sta PPU_CTRL_REG2
             sta PPU_ADDRESS
             ldy #$00
-:    lda ($fd),y
             cmp #$ff
             beq +
             sta PPU_DATA
             lda $fd
             clc
             adc #$01
             sta $fd
             lda $fe
             adc #$00
             sta $fe
             jmp -
+:    lda #%00011110
             sta Mirror_PPU_CTRL_REG2
             lda #$20                  ;sets vram address to $3f00
             sta PPU_ADDRESS
             lda #$a0
             sta PPU_ADDRESS
             lda #$00
tay                ;set y to 0 :)
-:    dey
             sta $6400,y
             bne -
             rts
-:  jmp ScrollTextBox
             
             
DisplayTextbox:
++:    lda #$81
             sta StartedTextBox
             sta GamePauseStatus
             lda IncrementedTxtHAdd
             bne +
             ldy TextboxID
             lda Textbox_Low-1,y
             sta $fd
             lda Textbox_High-1,y
             sta $fe
+:    
             lda ScrollText
             bne -
             ldy CurrentChar
             lda ($fd),y
             cmp #$ff
             beq NeedsWaitForInputAndEnd
             cmp #$fe
             beq NeedsContinueChar
             cmp #$fd
             beq NeedsWaitAndScrollNoDec
             cmp #$fc
             beq NewLineChar
             lda CurrentChar
             clc
             adc #$01
             sta CurrentChar
             bcc    +
             inc $fe
             inc IncrementedTxtHAdd
+:    pha
             ldx VRAM_Buffer1_Offset
             lda #$2c
             sta VRAM_Buffer1,x
             lda CurrentChar
             clc
             adc #$20
             clc
             adc SomeOffset
             cmp #$20
             bcc NeedsNewLine
             cmp #$9e
             beq NeedsWaitAndScroll
             cmp #$9f
             bcs NeedsNewLine
             ldy #$06
-:    cmp TableOfCompares,y
             beq NeedsNewLine
             dey
             bpl -
             sta VRAM_Buffer1+1,x
             lda #$01
             sta VRAM_Buffer1+2,x
             pla
             tay
             dey
             cpy #$fe
             bne +
             iny
             lda ($fd),y
             dey
             .db $2c
+:    lda ($fd),y
             bne +
             lda #$20
+:    sec
             sbc #$20                    ;substract lowest ascii char for smaller table
             stx tempE
             tax
             lda ASCII2CHR,x
             ldx tempE
             sta VRAM_Buffer1+3,x
             lda #$00
             sta VRAM_Buffer1+4,x
             txa
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
             rts
NeedsWaitForInputAndEnd: jmp WaitForInputAndEnd
NeedsContinueChar: jmp ContinueChar
NeedsNewLine: jmp NewLine
NeedsWaitAndScrollNoDec: jmp WaitAndScrollNoDec
NeedsWaitAndScroll:    jmp WaitAndScroll
NewLineChar:
             lda CurrentChar
             clc
             adc #$20
             clc
             adc SomeOffset
             cmp #$80
             bcs WaitAndScrollNoDec
-:
             lda CurrentChar
             clc
             adc #$20
             clc
             adc SomeOffset
             and #$1f
             beq +
             inc SomeOffset
             jmp -
             
+:    dec SomeOffset
             inc CurrentChar
             rts
             
             
WaitAndScrollNoDec:
             lda ScrollText
             bne ScrollTextBox
             jsr ContinueChar
             lda tempG
             sec 
             sbc tempF
             beq +
             bmi +
             inc ScrollText
             inc CurrentChar
+:    dec CurrentChar
             rts
WaitAndScroll:
             pla
             lda ScrollText
             bne ScrollTextBox
             jsr ContinueChar
             lda tempG
             sec 
             sbc tempF
             beq +
             bmi +
             inc ScrollText
             dec CurrentChar
+:    dec CurrentChar
             rts
ScrollTextBox:    
             lda TextBoxYScroll
             and #%11111000
             beq +++
             lsr
             lsr
             lsr
             tay
             lda TextBoxYClearTable,y
             sta tempC
             ldx VRAM_Buffer1_Offset
             lda #$2c
             sta VRAM_Buffer1,x
             lda #$20
             clc 
             adc tempC
             sta VRAM_Buffer1+1,x
             lda #$20
             sta VRAM_Buffer1+2,x
             ldy #$1f
-:    
             lda ScrollLineTable,y
             sta VRAM_Buffer1+3,x
             inx
             dey
             bpl -
             lda #$00
             sta VRAM_Buffer1+4,x
             txa
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
+++:
             lda TextBoxYScroll
             clc
             adc #$02
             sta TextBoxYScroll
             cmp #$24
             bcc ++
             lda #$00
             sta TextBoxYScroll
             sta ScrollText
             lda SomeOffset
             clc
             adc #$83
             sta SomeOffset
-:    lda CurrentChar
             clc
             adc #$20
             clc
             adc SomeOffset
             cmp #$21
             beq ++
             inc SomeOffset
             jmp -
++:    lda CurrentChar
             clc
             adc #$20
             clc
             adc SomeOffset
             tay
             lda ($fd),y
             cmp #$24
             beq +
             dec SomeOffset
+:    
++:     
+:        
             rts
TextBoxYClearTable:
             .db $00, $00, $20, $40, $60, $80, $a0
ScrollLineTable:
             .db $2c, $24, $24, $24, $24, $24, $24, $24
             .db $24, $24, $24, $24, $24, $24, $24, $24
             .db $24, $24, $24, $24, $24, $24, $24, $24
             .db $24, $24, $24, $24, $24, $24, $24, $2b
NewLine:
             pla
             tay
             dey
             inc SomeOffset
             lda ($fd),y
             cmp #$24
             beq +
             dec CurrentChar
             rts
WaitForInputAndEnd:
             lda A_B_Buttons
             sta PreviousA_B_Buttons
             lsr
             sta tempF
             lda SavedJoypadBits         
             and #%11000000
             sta A_B_Buttons
             lsr
             sta tempG
             sec 
             sbc tempF
             beq +
             bmi +
             ldy #$00
             sty TextboxID
             sty CurrentChar
             sty IncrementedTxtHAdd
             sty SomeOffset
             sty TimesScrolled
             sty StartedTextBox
             ldy #$06
             sty OldTextboxID
             lda #$80
             sta GamePauseStatus
             lda A_B_Buttons
             sta PreviousA_B_Buttons        ;set so no jumping after closing
             lda #$00
tay                ;set y to 0 :)
-:    dey
             sta $6400,y
             bne -
             inc ClearRemainings
+:    rts
ContinueThingy:
             .db $2f, $24
TableOfCompares:
             .db $20, $40, $60, $80, $3f, $5f, $7f
ContinueChar:
             lda A_B_Buttons
             sta PreviousA_B_Buttons
             lsr
             sta tempF
             lda SavedJoypadBits         
             and #%11000000
             sta A_B_Buttons
             lsr
             sta tempG
             sec 
             sbc tempF
             beq +
             bmi +
             inc CurrentChar
++:    ldx VRAM_Buffer1_Offset
             lda #$2c
             sta VRAM_Buffer1,x
             lda #$9e
             sta VRAM_Buffer1+1,x
             lda #$01
             sta VRAM_Buffer1+2,x
             lda #$24
             sta VRAM_Buffer1+3,x
             lda #$00
             sta VRAM_Buffer1+4,x
             txa
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
             rts
+:    
             ldx VRAM_Buffer1_Offset
             lda #$2c
             sta VRAM_Buffer1,x
             lda #$9e
             sta VRAM_Buffer1+1,x
             lda #$01
             sta VRAM_Buffer1+2,x
             lda FrameCounter
             and #%00010000
             lsr
             lsr
             lsr
             lsr
             tay
             lda ContinueThingy,y
             sta VRAM_Buffer1+3,x
             lda #$00
             sta VRAM_Buffer1+4,x
             txa
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
             rts
             
             
             
CustomText_AddrTable_Low:
             .db <CustomText0, <Livestext, <WellOk, <MessageCrash1, <EndOfDemo
CustomText_AddrTable_High:
             .db >CustomText0, >Livestext, >WellOk, >MessageCrash1, >EndOfDemo
             
CustomText0: 
             .db $22, $23, "YOU COLLECTED 1000 COINS", $af, "            ENJOY WORLD 9", $2b, $00
Livestext:
             .db $20, $4d, $16, $29, $00
WellOk:
             .db $22, $2c, "WELL OK", $00
MessageCrash1:
             .db $22, $02, "THIS GAME ONLY RUNS IN FCEUX", $af,"   MESEN OR BIZHAWK NESHAWK CORE", $00
EndOfDemo:
             .db $22, $22, "THIS IS THE END OF THE DEMO         THANKS FOR PLAYING", $00
ExitHere:
             rts
             
             rts
CustomCode:
skipCustomOperModeTask:
             lda OperMode_Task
             cmp #$01
             bne xd
             lda ScreenRoutineTask                  ; load ScreenRoutineTask
             cmp $6011                              ; compare it to our stored ScreenRoutineTask
             sta $6011                              ; store ScreenRoutineTask
             beq xd       ; branch if they're the same
             
             
             lda WorldNumber
             bne xd
             lda LevelNumber
             cmp #$03
             bne xd
             ;lda FinishedDemo
             ;cmp #$ff
             ;beq xd
             ;inc FinishedDemo
             ;lda FinishedDemo
             ;cmp #$04
             ;bcs xd
             ;lda #$04
             ;jmp LoadCustomText
             ; here we run code when ScreenRoutineTask modes are initially set
             ; Display a message on intermediate screen
             if DEMO_FEATURES == 1
             cmp #$07                               ; check ScreenRoutineTask for DisplayIntermediate
             bne xd                                 ; branch if not
             
             lda #$00                               ; load message
             ;jmp LoadCustomText
             endif
xd:
             rts
OnOffCb:
             .db %00000111, %00001111, %10000111, %11001111 ;Off, On, pswitchOff, pswitchoOn
OnOffCbW:
             .db %00010111, %00011111, %01110111, %01111111 ;Off, On, pswitchOff, pswitchoOn (water area)
OnOffCHR:
             ldx OnOffBits
            ;lda AreaType
            ;bne +
            ;inx
            ;inx
            ;inx
            ;inx
+:        lda OnOffCb,x    ;load CHR bank depending if block is on or pswitch is triggered
             tay
             lda #$85
             sta Old8000
             sta $8000
             tya
             sta $8001
             rts
TitleScreenCHR:
             lda #$01    
             sta ChangeBankRDelay
             lda StartTimer
             beq Est                    ;if loading level, decrement
             dec StartTimer
Est:    lda #$82
             sta Old8000
             sta $8000
             lda #%00000100
             sta $8001
             lda #%10001100
             jsr setRightCHR
             lda #$84
             sta Old8000
             sta $8000
             lda #%10001110
             sta $8001
             lda #$85
             sta Old8000
             sta $8000
             lda #%10001111
             sta $8001
EE:        rts
Force:
             .db $70, $0a
             
             
             
             
             ;the start
             
             
jmpik:
             ldx #$05
-:        clc
             lda Enemy_Flag,x
             beq +
             dex
             bcc -
             sec
+:        rts
emin: jmp emkn
vaina: .db $ff, $01
             
             
ClearRemainings2:
             lda TextBoxYScroll1
             tay
             lda TextBoxYClearTable,y
             sta tempC
             ldx VRAM_Buffer1_Offset
             lda #$2c
             sta VRAM_Buffer1,x
             lda #$20
             clc 
             adc tempC
             sta VRAM_Buffer1+1,x
             lda #$20
             sta VRAM_Buffer1+2,x
             ldy #$1f
-:    
             lda ScrollLineTable,y
             sta VRAM_Buffer1+3,x
             inx
             dey
             bpl -
             lda #$00
             sta VRAM_Buffer1+4,x
             txa
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
+++:
             inc TextBoxYScroll1
             lda TextBoxYScroll1
             cmp #$08
             bne +
             ldy #$00
             sty ClearRemainings
             sty TextBoxYScroll1
             jmp ClearVRAM
+:    rts
             
ClearVRAM:
             lda #$00
             tay
-:  dey
             sta $6400,y
             bne -
-:    rts
             
WACHRTable:
    .db %00001100, %00011100, %00000100, %00000100

WorldCHRTable:
             .db %00000100, %00000100, %00000100, %00000100, %00001100, %00010100, %00011100, %00100100, %00101100, %00011100
WorldPalHigh:
             .db >World4Pal, >World6Pal, >World7Pal, >World8Pal, >WALevel1Pal, >WALeve2Pal, >WALevel3
             
WorldPalLow:
             .db <World4Pal, <World6Pal, <World7Pal, <World8Pal, <WALevel1Pal, <WALeve2Pal, <WALevel3
             
World4Pal:
             .db $22, $29, $1a, $0f
             .db $22, $37, $27, $17
             .db $22, $30, $12, $0f
             .db $22, $27, $17, $0f
             .db $22, $16, $27, $18
             .db $22, $1a, $30, $27
             .db $22, $16, $30, $27
             .db $22, $17, $37, $27
World6Pal:
             .db $22, $20, $32, $0f
             .db $22, $20, $32, $0f
             .db $22, $30, $21, $0f
             .db $22, $27, $17, $0f
             .db $22, $16, $27, $18
             .db $22, $1a, $30, $27
             .db $22, $16, $30, $27
             .db $22, $0f, $20, $32
World7Pal:
             .db $22, $27, $17, $07
             .db $22, $37, $27, $17
             .db $22, $30, $12, $07
             .db $22, $27, $17, $07
             .db $22, $16, $27, $18
             .db $22, $1a, $30, $27
             .db $22, $16, $30, $27
             .db $22, $07, $27, $17
World8Pal:
             .db $0f, $26, $16, $0f
             .db $0f, $36, $17, $0f
             .db $0f, $30, $16, $07
             .db $0f, $27, $17, $0f
             .db $0f, $16, $27, $18
             .db $0f, $1a, $30, $27
             .db $0f, $16, $30, $27
             .db $0f, $0f, $36, $17

WALevel1Pal:
             .db $0f, $11, $22, $0f
             .db $22, $26, $08, $0f
             .db $22, $30, $21, $0f
             .db $22, $3e, $20, $04
             .db $22, $16, $27, $18
             .db $22, $1a, $30, $27
             .db $22, $16, $30, $27
             .db $22, $0f, $36, $17

WALeve2Pal:
             .db $0f, $27, $16, $06
             .db $0f, $36, $17, $0f
             .db $0f, $30, $16, $07
             .db $0f, $27, $17, $0f
             .db $0f, $16, $27, $18
             .db $0f, $1a, $30, $27
             .db $0f, $16, $30, $27
             .db $0f, $0f, $36, $17

WALevel3:
             .db $12, $15, $0e, $25  
             .db $12, $3a, $1a, $0f
             .db $12, $30, $0e, $0f
             .db $12, $27, $0e, $0f
             .db $12, $16, $27, $18
             .db $12, $1a, $30, $27
             .db $12, $16, $30, $27
             .db $12, $0f, $30, $10

; $0e, $xx, $0e, $xx
; $xx, $xx, $xx, $xx
; $xx, $xx, $0e, $xx
; $xx, $xx, $0e, $xx


             
World9LevelPalettes:
            .db $05, $06, $07, $00 
             
ChangeBankRunner:        
             
             lda PCooldown
             beq +
             
             dec PCooldown
+:        


             lda #$00
             sta BowserGotHit
             
             lda WorldPalette
             beq goclearVRAM
             lda WorldNumber
             cmp #$09           ; = World A
             bne +
             ldy LevelNumber
             lda World9LevelPalettes, y 
             sta WorldPalette 
+:
             ldy WorldPalette
             dey
             lda WorldPalLow,y
             sta $00
             lda WorldPalHigh,y
             sta $01
             ldx VRAM_Buffer1_Offset
             lda #$3f
             sta VRAM_Buffer1,x
             inx
             lda #$00
             sta VRAM_Buffer1,x
             inx
             lda #$20
             sta VRAM_Buffer1,x
             ldy #$ff
--:            inx
             iny
             lda ($00),y
             sta VRAM_Buffer1,x
			 lda WorldNumber
			 cmp #World7
			 bne ++
			 lda AreaType
			 cmp #$03
			 bne ++
			 lda VRAM_Buffer1,x
			 cmp #$12
			 bne ++
			 lda #$16
			 sta VRAM_Buffer1,x
++           lda VRAM_Buffer1,x
			 cpy #$08
             bcc ++
             cpy #$0c
             bcs ++
             sta OldPal3-8,y
             inc TheresPal3
++:            cpy #$1f
             bne --
             inx
			 
             lda #$00
             sta VRAM_Buffer1,x
             stx VRAM_Buffer1_Offset
             sta WorldPalette
goclearVRAM:
             lda clearVRAM
             beq +
             lda #$00
             sta clearVRAM
             jsr ClearVRAM
             
+:        lda ClearRemainings
             beq +
             lda AreaParserTaskNum
             bne +
             jsr ClearRemainings2
+:        
             
             lda TextboxID
             beq +
             jsr ColorRotation
             jsr DisplayTextbox
             
+:        
             lda FrameCounter
             and #$01
             bne +
             lda EndTimer
             beq +
             dec EndTimer
+:
             lda OldTextboxID
             beq +
             dec OldTextboxID
+:        
             lda #$84
             sta Old8000
             sta $8000
             
             lda WorldNumber
			 cmp #World7
			 beq +
             lda AreaType
             beq ++
             cmp #$03
             bne +
++           ldx #%01000110
             bne ++             
+:           ldy WorldNumber
             cpy #$09   ; = World A 
             bne +
             ldy LevelNumber 
             lda WACHRTable, y 
             jmp WACHRskip
+:           lda WorldCHRTable,y
WACHRskip:   tax
             inx
             inx
++:          stx $8001
             
             
             lda GamePauseStatus       ;if in pause mode, do not bother with sprites at all
             lsr
             bcs WebosJoder
             lda OperMode                          ;check mode of operation
             cmp #TitleScreenModeValue
             beq EnemyLoadingRoutine            ;if in title screen mode, branch to lock score
             lda PlayerCoinDisplay-2                             ;fifth digit of coin
             ora PlayerCoinDisplay-1
             beq +
             lda #$09
             sta PlayerCoinDisplay
             sta PlayerCoinDisplay+1
             sta PlayerCoinDisplay+2
             sta PlayerCoinDisplay+3
             lda #$01
             sta PlayerCoinDisplay-2
+:        lda Averveamos
             beq EnemyLoadingRoutine
             lda #$09
             sta PlayerScoreDisplay
             sta PlayerScoreDisplay+1
             sta PlayerScoreDisplay+2
             sta PlayerScoreDisplay+3
             sta PlayerScoreDisplay+4
             sta PlayerScoreDisplay+5
             bne EnemyLoadingRoutine ;unconditional
WebosJoder: rts
-: jmp emkn
--:
ExitThere: jmp ExitTher
EnemyLoadingRoutine:        
             ldx scrolldir
             bne +
             lda ScreenLeft_X_Pos    ;get horizontal coordinate for left side of screen
             sec
             sbc #$1f
             and #$f0
             sta tempD                 ;store result here
             lda ScreenLeft_PageLoc
             sbc #$00
             sta tempE                 ;store result here
             jmp ++
             
+:          lda ScreenRight_X_Pos    ;get horizontal coordinate for left side of screen
             clc
             adc #$1f
             and #$f0
             sta tempD                 ;store result here
             lda ScreenRight_PageLoc
             adc #$00
             sta tempE                 ;store result here
++:          
             tax
             lda EnemyOffsetPage,x
             tay
LoopEL:      sty tempC
             lda Saved_isDefeated,y
             bne -                        ;if defeated don't load anymore
             lda Saved_PageLoc,y
             cmp tempE
             bne -
             lda Saved_X_Position,y
             and #$f0
             cmp tempD
             bne -
             
+:
+++:    
             lda Saved_ID,y
             beq --
             cmp #Sign+1               ;sign ID + 1
             beq ++++
             cmp #PowerUpObject+1    ;power up ID + 1
             bne ++
++++:        
             lda Enemy_Flag+5
             bne +++
             ldx #$05
+++:    lda Saved_ID,y
             jmp +
++:        
             ldx #$04
-:        lda Enemy_Flag,x
             beq +
             lda SavedOffset,x
             cmp tempC
             beq --
             dex
             bpl -
             jmp --
+:        lda Saved_ID,y
             sec
             sbc #$01
             sta Enemy_ID,x
             pha
             lda #$01
             sta Enemy_Y_HighPos,x
             lda Saved_X_Position,y
             sta Enemy_X_Position,x
             lda Saved_Y_Position,y
             sta Enemy_Y_Position,x
             lda Saved_PageLoc,y
             sta Enemy_PageLoc,x
             pla
             cmp #PiranhaPlant
             beq +
             cmp #RedPiranhaPlant
             beq +
             cmp #UDPiranhaPlant
             beq +
             cmp #RUDPiranhaPlant
             bne +++
+:        lda ExtraShit,y
             sta PiranhaPlantUpYPos,x
             lda ExtraShit2,y
             sta PiranhaPlantDownYPos,x
             lda ExtraShit3,y
             sta PiranhaPlant_MoveFlag,x
             lda ExtraShit4,y
             sta PiranhaPlant_Y_Speed,x
             ldy HardModeFlag
             lda PPhitbox1,y
             bne ++++
_LoopEL:     
             jmp LoopEL
+++:    tay
             lda Hitboxes,y
++++:    sta Enemy_BoundBoxCtrl,x
             ldy tempC
             lda Enemy_ID,x
             cmp #Sign
             beq ++
             cmp #PowerUpObject
             bne +
++:        lda ExtraShit,y
             sta $7fce,x
             lda #$00
             .db $2c
+:        lda #$00
             sta Enemy_State,x
             lda #$01
             sta Saved_isDefeated,y
             sta Enemy_Flag,x
             ldy tempC
             tya
             sta SavedOffset,x
             jsr InitEnemyRoutines1
emkn:
++:        ldy tempC
             dey                        ;check for next saved enemy
             bmi ExitTher
             tya
             ldx tempE
             dex
             cmp EnemyOffsetPage,x
             beq ExitTher
             bcs _LoopEL
+:    
ExitTher:
             lda SetupPause
             beq +
             jsr PauseMenu
+:        
             lda PlatformTimer
             beq +
             dec PlatformTimer
             ;jmp ++
             
             lda scrolldir
             bne +
+:        ;dec GlobalSaveOffset
             jmp ++
+++:    ;inc GlobalSaveOffset
++:        lda $fa
             sta OldPageLoc
             
             
             lda Player_MovingDir
             bne +
             inc Player_MovingDir
+:        lda framesfour
             bne +
             lda #$03
             sta framesfour
             jmp PSpeedHud
NoPlease2: jmp NoPlease
+:        dec framesfour
             
PSpeedHud:        
             lda oldpspeed
             beq +
             lda #$00
             sta oldpspeed
             ldy VRAM_Buffer1_Offset
             lda #$20
             sta VRAM_Buffer1,y
             lda #$49
             sta VRAM_Buffer1+1,y
             lda #$01
             sta VRAM_Buffer1+2,y
             lda pspeed
             sta VRAM_Buffer1+3,y
             lda #$00
             sta VRAM_Buffer1+4,y
             tya
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
             
+:        lda ContinueWriting
             beq NoPlease2
             ;lda WorldNumber
             ;asl
             ;asl
             ;add LevelNumber
             ;tay
             ldy CurrentText
             
             lda OldWriting
             bne ++
             tya
             pha
             ;ldy LevelNumber
             
             lda #$00
             sta $fd
             lda Text_AddrTable_High,y
             sta $fe
             lda Text_AddrTable_Low,y
             sta $7fc5
             
             ldy $7fc5
             lda ($fd),y
             sta $7fc3
             iny
             lda ($fd),y
             sta $7fc4
             iny
             sty $7fc5
             bne +
             inc $fe
+:        pla
             tay
             jmp +
             
++:        lda $fe
             bne +
             
             lda Text_AddrTable_High,y
             sta $fe
             lda Text_AddrTable_Low,y
             sta $7fc5
             
+:        ldx $7fc0
             ldy VRAM_Buffer1_Offset
             lda $7fc3
             sta VRAM_Buffer1,y
             lda $7fc4
             sta VRAM_Buffer1+1,y
             lda #$01
             sta VRAM_Buffer1+2,y
             stx $00
             sty $01
             ldy $00
             ldx $01
             ldy $7fc5
             lda ($fd),y
             cmp #$ff
             bne ++
             lda #$00
             sta ContinueWriting
             sta OldWriting
             lda #$24
++:        cmp #$f6
             bne +
             lda #$28
             jmp WriteDat
+:        cmp #$f7
             bne +
             lda #$af
             jmp WriteDat
+:        cmp #$e9
             bne +
             lda #$24
WriteDat:
+:        sta VRAM_Buffer1+3,x
             stx $00
             sty $01
             ldy $00
             ldx $01
             lda #$00
             sta VRAM_Buffer1+4,y
             tya
             clc
             adc #$04
             sta VRAM_Buffer1_Offset
             lda $7fc5
             clc
             adc #$01
             sta $7fc5
             lda $fe
             adc #$00
             sta $fe
             lda $7fc4
             clc
             adc #$01
             sta $7fc4
             lda $7fc3
             adc #$00
             sta $7fc3
             ;lda $7f03
             cmp #$24
             bcc +
             lda #$20
             sta $7fc3
+:        lda $7fc3
             cmp #$23
             beq +
             cmp #$27
             bne ++
+:        lda $7fc4
             cmp #$c0
             bcc ++
             lda #$00
             sta $7fc4
             inc $7fc3
++:        
NoPlease:
             lda ContinueWriting
             sta OldWriting
             lda #$00
             sta bocata
             sta bocata2
             lda bocata3
             beq +
             lda VRAM_Buffer1_Offset
             cmp #$20
             bcs +
             dec bocata3
++:        lda #$02
             jsr bocataprint
             ;ldy VRAM_Buffer1_Offset   
             ;lda VRAM_Buffer1-6,y      ;check highest digit of score
             ;bne +++                      ;if zero, overwrite with space tile for zero suppression
             ;lda #$24
             ;sta VRAM_Buffer1-6,y
             ;jmp ++
+++:
             lda Averveamos
             beq +
             ldx VRAM_Buffer1_Offset
             lda #$20
             sta VRAM_Buffer1,x
             lda #$68
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
             
+:        ;jmp +
             ;lda IntervalTimerControl
             ;bne +
             ;
             ;lda FrameCaunter+2
             ;add #$01
             ;sta FrameCaunter+2
             ;lda FrameCaunter+1
             ;adc #$00
             ;sta FrameCaunter+1
             ;lda FrameCaunter
             ;adc #$00
             ;sta FrameCaunter
             ;
             ;ldx VRAM_Buffer1_Offset
             ;lda #$20
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda #$00
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda #$06
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda FrameCaunter
             ;and #$f0
             ;lsr
             ;lsr
             ;lsr
             ;lsr
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda FrameCaunter
             ;and #$0f
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda FrameCaunter+1
             ;and #$f0
             ;lsr
             ;lsr
             ;lsr
             ;lsr
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda FrameCaunter+1
             ;and #$0f
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda FrameCaunter+2
             ;and #$f0
             ;lsr
             ;lsr
             ;lsr
             ;lsr
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda FrameCaunter+2
             ;and #$0f
             ;sta VRAM_Buffer1,x
             ;inx
             ;lda #$00
             ;sta VRAM_Buffer1,x
             ;stx VRAM_Buffer1_Offset
++:
+:        ;lda EvenFrame
             ;eor #$01
             ;sta EvenFrame
             ;ldx $07eb                    ;load first digit of coin counter
             ;dex
             ;bne ++
             ;inc UnlockWorld9            ;unlock world 9
++:
             lda TimerWa
             beq ++
             dec TimerWa
             jmp CldPlt
++:        
             
             
             lda OperMode                   ;get primary mode of operation
             beq ++                         ;branch to set title screen CHR
             cmp #GameOverModeValue      ;are we in game over mode?
             beq CldPlt                  ;if so, proceed change platform sprite to the coin heaven one
             lda StartTimer                ;check timer to change CHR
             beq +                        ;branch if zero
++:        jmp TitleScreenCHR
+:        lda CloudTypeOverride        
             beq NrmlPl                      ;if cloud level override flag not set, use normal platform CHR
CldPlt:    
             ldy #$81
             sty Old8000
             sty $8000
             ldy #%00010010                ;set cloud platform sprite
             sty $8001
             jmp FireballCooldown        ;skip to FireballCooldown
NrmlPl:    ldy #$81                    
             sty Old8000
             sty $8000
             ldy #%00001010                ;set normal platform sprite
             sty $8001
             
FireballCooldown:
             lda FballCooldown            ;if fireball cooldown set, don't decrement
             beq +++++
             dec FballCooldown
             lda EntranceCoolDown
             beq +++++
             dec EntranceCoolDown
+++++:  lda WaterCooldown
             beq +
             dec WaterCooldown
+:        lda GrabFlag                ;check grabflag
             beq +++                        ;branch if not
             lda #$80                    
             sta Old8000
             sta $8000
             lda #%00001000
             sta $8001                    ;set grabbing sprite
             jmp ++++
             
Chavo:  rts
             
+++:    lda CrouchingFlag2
             beq +
             lda PlayerSize
             beq ++
             lda #$80
             sta Old8000
             sta $8000
             lda #%00010000
             sta $8001
             jmp ++++
++:        lda #$00
             sta CrouchingFlag2
+:        lda #$80                    ;set normal sprite
             sta Old8000
             sta $8000
             lda #%00000001
             sta $8001
++++:    lda pspeed
             cmp #$07
             bne +
             lda Player_State
             bne ++
             lda Player_X_Speed
             beq +
++:        lda SwimmingFlag
             ora GrabFlag
             ora CrouchingFlag
             ora CrouchingFlag2
			 ora PlayerOnVine
             bne +
             lda #$80                    
             sta Old8000
             sta $8000
             lda #%0011000
             sta $8001                    ;set grabbing sprite
+:        
             lda TimerControl            
             bne Chavo                    ;do not animate if master timer set
             lda HurryUp                    
             beq ++                        ;branch if not under 60 seconds
             lda UnknownHurryUp            
             bne +
             inc UnknownHurryUp
             lda ChangeBankR
             cmp #$08                    ;check if last animation CHR bank
             bcc +                        ;if not, skip this
             lda #$09
             sta ChangeBankR                ;set first animation CHR bank and
+:        jmp HurryUpChg                ;jump to speed up animation
++:        
             ldx ChangeBankRDelay
             beq +
             dex
             stx ChangeBankRDelay
             beq +
             rts
             
+:        inc ChangeBankRDelay
             lda ChangeBankRDelay2
             beq +
             dec ChangeBankRDelay2
             rts
             
+:        lda #$05
             sta ChangeBankRDelay2
             
             ldy PTimer
             dey
             bne +
             jsr _GetAreaMusic
             lda #$06
             sta ChangeBankR
+:        lda PTimer                    ;check ptimer
             bne PSwitchBank                ;branch to set if set
             
             ;if ptimer is 0
             lda OnOffBits                
             and #%00000001                ;then save only bit 0
             sta OnOffBits
             sta OnOffFlag
             
             ldy AreaType                
             lda AreaAdder,y                ;load animation depending of the area type
             inc ChangeBankR                ;increment bank timer
             ldx ChangeBankR        
             cpx #$08
             beq BankR
             jmp Bank1
PSwitchBank:
             lda DontDecPT
             ora TimerControl
             bne +
             dec PTimer
+:        ldx AreaType
             lda AreaAdderP,x
             jsr setRightCHR
             lda #$04
             sta ChangeBankRDelay
Fuk:    ldx OnOffBits
             lda AreaType
             bne @e
             lda OnOffCbW,x
             jmp @i
@e:        lda OnOffCb,x    
@i:        
             tay
             lda #$85
             sta Old8000
             sta $8000
             tya
             sta $8001
             rts
Bank1:
             clc
             adc AnimAdder,x
             jmp setRightCHR
BankR:
             ldx #$00
             stx ChangeBankR        ;reset bank change
             jmp Bank1            
PSwitchBank1:
             jmp PSwitchBank
AnimAdder:
             .db %00000100, %00001100, %00010100, %00011100, %00100100, %00101100, %00110100, %00111100
AreaAdder:
             .db $40, $00, $00, $00
AreaAdderP:
             .db %11011100, %10000100, %10000100, %10000100
HurryUpChg:
             lda ChangeBankRDelay
             bne +
             ;lda PTimer
             ;bne PSwitchBank1
             ;lda #$01
             ;sta ChangeBankRDelay
             lda PTimer
             bne PSwitchBank1
             jmp ++
+:        dec ChangeBankRDelay
++:        lda PTimer
             beq ++
             ldx AreaType
             lda AreaAdderP,x
             ;add #%01000100
             jsr setRightCHR
             jmp Fuk
++:                            ;if ptimer not set
             lda OnOffBits                
             and #%00000001                ;save only bit 0
             sta OnOffBits
             lda ChangeBankRDelay2
             beq +
             dec ChangeBankRDelay2
             rts
+:        lda #$02
             sta ChangeBankRDelay2
             
             ldy AreaType
             lda AreaAdder,y
             inc ChangeBankR                ;increment bank timer
             ldx ChangeBankR        
             cpx #$08
             beq BankR
             jmp Bank1
bocataprint:
             sta $00            ;store player-specific offset
             jsr OutputNumbers1  ;use first nybble to print the coin display
             lda $00            ;move high nybble to low
             lsr                ;and print to score display
             lsr
             lsr
             lsr
             
OutputNumbers1:
             clc                      ;add 1 to low nybble
             adc #$01
             and #%00001111           ;mask out high nybble
             cmp #$07
             bcs ExitOutput1
             pha                      ;save incremented value to stack for now and
             asl                      ;shift to left and use as offset
             tay
             ldx VRAM_Buffer1_Offset  ;get current buffer pointer
             cpx #$20
             bcs +
             lda #$20                 ;put at top of screen by default
             cpy #$00                 ;are we writing top score on title screen?
             bne SetupNums1
             lda #$22                 ;if so, put further down on the screen
SetupNums1:  sta VRAM_Buffer1,x
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
DigitPLoop1: lda DisplayDigits,y      ;write digits to the buffer
             sta VRAM_Buffer1+3,x    
             inx
             iny
             dec $03                  ;do this until all the digits are written
             bne DigitPLoop1
             lda #$00                 ;put null terminator at end
             sta VRAM_Buffer1+3,x
             inx                      ;increment buffer pointer by 3
             inx
             inx
             stx VRAM_Buffer1_Offset  ;store it in case we want to use it again
ExitOutput1: rts
+:             pla
             inc bocata3
             rts
             
Text_AddrTable_Low:
             .db <MuchoTexto, <PocoTexto, <Studs, <lucas, <hellfire, <shemon, <brette, <obviouslyme, <ElPepe
Text_AddrTable_High:
             .db >MuchoTexto, >PocoTexto, >Studs, >lucas, >hellfire, >shemon, >brette, >obviouslyme, >ElPepe
             
MuchoTexto:
             .db $20, $43, "THANKS FOR PLAYING MY HACK"-55, $ff
PocoTexto:
             .db $20, $C8, "SPECIAL THANKS TO"-55, $ff
Studs:
             .db $21, $24, "STUDSX - TECHNICAL HELP"-55, $ff
lucas:
             .db $21, $65, "LUCAS - TITLE SCREEN"-55, $ff
hellfire:
             .db $21, $a2, "HELLFIRE - ARTWORK"-55, $ff
shemon:
             .db $21, $e4, "SHEMON - ARTWORK"-55, $ff
brette:
             .db $22, $24, "BRETTE - MYSTERIOUS WORLD"-55, $ff
obviouslyme:
             .db $22, $86, "HACK MADE BY ALEFUNKY"-55, $ff
ElPepe:
             .db $23, $6e, "PRESS BUTTON B..."-55, $ff
             
PauseMenu:
             lda SetupPause
             jsr JumpEngine
             
             .dw Noth
             .dw DisplayPauseMenu
             .dw Some
             .dw SetPauseBG
             .dw DrawMenuCursorj
             .dw Clear6400
             .dw DisplayMenuText
             .dw UnPauses
UnPauses:
             lda #$00
             sta SetupPause
             rts
Clear6400:
             jsr ClearVRAM
             inc SetupPause
             rts
DrawMenuCursorj:
             inc SetupPause
             jmp DrawMenuCursor
Some:
             jsr PSoundSetting
             inc SetupPause
             rts
SetPauseBG:
             lda SettingSelec
             cmp #$02
             bne +
             lda #$03
+:       sta OldSettingSelec
             lda #$02
             sta SettingSelec
             inc SetupPause
             jmp MusicSetting
Noth:  rts
             
DisplayPauseMenu:
             lda GamePauseStatus
             tay
             iny                    ;set pause sfx queue for next pause mode
             sty PauseSoundQueue
             lda #$81
             sta GamePauseStatus
             inc SetupPause
             ldx VRAM_Buffer1_Offset
             ldy #$00
-:      lda RestartText,y
             sta VRAM_Buffer1,x
             iny
             inx
             cpy #$10
             bcc -
             stx VRAM_Buffer1_Offset
             ldy #$00
-:      lda QTTSText,y
             sta VRAM_Buffer1,x
             iny
             inx
             cpy #$11
             bcc -
             stx VRAM_Buffer1_Offset
             rts
MusicMutetxt: .db $28, $a3, $0b, "MUSIC"-55, $24, $28, $24, "ON"-55, $24, $00
MusicMuteON:  .db $28, $a3, $0b, "MUSIC"-55, $24, $28, $24, "OFF"-55, $00
PSoundtxt: .db $28, $e3, $13, "P"-55, $24, "SPEED"-55, $24, "SOUND"-55, $24, $28, $24, "ON"-55, $24, $00
PSoundON:  .db $28, $e3, $13, "P"-55, $24, "SPEED"-55, $24, "SOUND"-55, $24, $28, $24, "OFF"-55, $00
RestartText:  .db $29, $23, $0d, "RESTART"-55, $24, "LEVEL"-55, $00
QTTSText:        .db $29, $63, $0e, "QUIT"-55, $24, "AND"-55, $24, "SAVE"-55, $24, $00
DisplayMenuText:
             ;$28a2
             lda A_B_Buttons
             sta PreviousA_B_Buttons
             lda SavedJoypadBits         ;otherwise store A and B buttons in $0a
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
             
             lda A_B_Buttons
             and #A_Button
             beq +
             and PreviousA_B_Buttons
             bne +
             ldx SettingSelec
             dex
             dex
             lda SettingsBits,x
             eor #$01
             sta SettingsBits,x
             jmp WhenTheSus
+:      lda Up_Down_Buttons
             and #Up_Dir
             beq +
             and PreviousUp_Down_Buttons
             bne +
             lda SettingSelec
             cmp #$02
             beq PauseMenuExit
             
             lda SettingSelec
             sta OldSettingSelec
             dec SettingSelec
             jmp DrawMenuCursor
+:      lda Up_Down_Buttons
             and #Down_Dir
             beq PauseMenuExit
             and PreviousUp_Down_Buttons
             bne PauseMenuExit
             lda SettingSelec
             cmp #$05
             beq PauseMenuExit
             lda SettingSelec
             sta OldSettingSelec
             inc SettingSelec
             jmp DrawMenuCursor
WhenTheSus:
             ldx SettingSelec
             dex
             dex
             txa
             ;cmp #$05
             ;bcs ++
             jsr JumpEngine
             
             .dw MusicSetting
             .dw PSoundSetting
             .dw RestartSetting
             .dw QuitToTitleScreen
             
MusicSetting:
             lda SettingsBits
             bne +
             
             ldx VRAM_Buffer1_Offset
             ldy #$00
-:      lda MusicMutetxt,y
             sta VRAM_Buffer1,x
             iny
             inx
             cpy #$0f
             bcc -
             stx VRAM_Buffer1_Offset
++:      rts
+:      
             ldx VRAM_Buffer1_Offset
             ldy #$00
-:      lda MusicMuteON,y
             sta VRAM_Buffer1,x
             iny
             inx
             cpy #$0f
             bcc -
             stx VRAM_Buffer1_Offset
PauseMenuExit: rts      
PSoundSetting:
             lda SettingsBits+1
             bne +
             
             ldx VRAM_Buffer1_Offset
             ldy #$00
-:      lda PSoundtxt,y
             sta VRAM_Buffer1,x
             iny
             inx
             cpy #$17
             bcc -
             stx VRAM_Buffer1_Offset
             rts
+:      
             ldx VRAM_Buffer1_Offset
             ldy #$00
-:      lda PSoundON,y
             sta VRAM_Buffer1,x
             iny
             inx
             cpy #$17
             bcc -
             stx VRAM_Buffer1_Offset
             rts
RestartSetting:
             ;inc FetchNewGameTimerFlag ;set flag to load new game timer
             ;inc DisableScreenFlag     ;set flag to disable screen output
             lda #$00
             sta SetupPause
             sta PauseModeFlag
             sta PauseSoundQueue
             sta PauseSoundBuffer
             ora #$80
             sta GamePauseStatus
             lda #$02
             sta OldNameTableSelect
             ldy AreaType
             cpy #$01
             bne +
             lda BackgroundColorCtrlFP
+:     sta BackgroundColorCtrl
             
             lda WorldNumber
             cmp #$04
             bne +
             lda AreaNumber
             cmp #$03
             bne +
             lda #$01
             sta BackgroundColorCtrl
             
+:               
             
             jsr GetPlayerColors2
             jmp KillPlayer
             
QuitToTitleScreen:
             inc DoFin
             inc DisableScreenFlag
             lda #$00
             sta GamePauseStatus
             sta OldHorizontalScroll
             sta HurryUp
             sta UnknownHurryUp
             lda #$02
             sta OldNameTableSelect
             lda WorldNumber
             sta ContinueWorld
             lda LevelNumber
             sta ContinueLevel
             jmp SaveGame
             
DrawMenuCursor:
             ldx VRAM_Buffer1_Offset
             lda SettingSelec
             and #%11111100
             lsr
             lsr
             clc
             adc #$28
             sta VRAM_Buffer1,x
             lda SettingSelec
             ror
             ror
             ror
             clc
             adc #$21
             sta VRAM_Buffer1+1,x
             lda #$01
             sta VRAM_Buffer1+2,x
             lda #$2e
             sta VRAM_Buffer1+3,x
             ;lda #$00
             ;sta VRAM_Buffer1+4,x
             txa
             clc
             adc #$04
             tax
             lda OldSettingSelec
             and #%11111100
             lsr
             lsr
             clc
             adc #$28
             sta VRAM_Buffer1,x
             lda OldSettingSelec
             ror
             ror
             ror
             clc
             adc #$21
             sta VRAM_Buffer1+1,x
             lda #$01
             sta VRAM_Buffer1+2,x
             lda #$24
             sta VRAM_Buffer1+3,x
             lda #$00
             sta VRAM_Buffer1+4,x
             txa
             clc
             adc #$05
             sta VRAM_Buffer1_Offset
             rts
             
DoFlagpoleEnemy:
             jsr jmpidk2
             bcs +
             stx $7fcc
             lda FlagpoleEnemyCol    ;multiply current offset where we're at by 16
             asl                     ;to obtain horizontal pixel coordinate
             asl
             asl
             asl
             sec                      ;get pixel coordinate of where the flagpole is,
             sbc #$08                 ;subtract eight pixels and use as horizontal
             sta $7fba
             ;sta Enemy_X_Position,x   ;coordinate for the flag
             lda FlagpoleEnemyPage
             sbc #$66                 ;subtract borrow from page location and use as
             sta $7fb9
             sta Enemy_PageLoc,x      ;page location for the flag
             lda $7fba
             sta Enemy_X_Position,x
             lda #$30
             sta Enemy_Y_Position,x   ;set vertical coordinate for flag
			 lda WorldNumber
			 cmp #World8
			 bne +
			 lda #$a0
			 .db $2c
+:           lda #$b0
             sta FlagpoleFNum_Y_Pos   ;set initial vertical coordinate for flagpole's floatey number
             lda #FlagpoleFlagObject
             sta Enemy_ID,x           ;set flag identifier, note that identifier and coordinates
             lda #$01
             sta FlagpoleOnScreen
             inc Enemy_Flag,x         ;use last space in enemy object buffer
             rts
             
jmpidk2:
             ldx #$04
             clc
             lda Enemy_Flag,x
             beq +
             jsr QUe2
             bcc +
+:        rts
QUe2:    
             ldx #$00
-:        clc
             lda Enemy_Flag,x
             beq +
             inx
             cpx #$04
             bne -
+:        rts
             
PlayerColorsOffset1:
             .db MarioColors1-PlayerColors1, LuigiColors1-PlayerColors1
             
PlayerColors1:
MarioColors1:
             .db $22, $16, $27, $18 ;Small
             .db $22, $16, $27, $18 ;Big
             .db $22, $37, $27, $16 ;Fiery
LuigiColors1:
             .db $22, $30, $27, $19 ;Small
             .db $22, $30, $27, $19 ;Big
             .db $22, $30, $27, $16 ;Fiery
             
BackgroundColors1:
             .db $22, $22, $0f, $0f ;used by area type if bg color ctrl not set
             .db $0f, $22, $0f, $0f ;used by background color control if set
             .db $12, $12, $0f, $07
             
GetPlayerColors2: 
             ldx VRAM_Buffer1_Offset  ;get current buffer offset
             lda PlayerStatus
             asl
             asl
             sta $00
             ldy CurrentPlayer
             lda PlayerColorsOffset1,y
             clc
             adc $00
             tay
StartClrGet1:  lda #$03                 ;do four colors
             sta $00
ClrGetLoop1:   lda PlayerColors1,y       ;fetch player colors and store them
             sta VRAM_Buffer1+3,x     ;in the buffer
             iny
             inx
             dec $00
             bpl ClrGetLoop1
             ldx VRAM_Buffer1_Offset  ;load original offset from before
             ldy BackgroundColorCtrl  ;if this value is four or greater, it will be set
             bne SetBGColor1         ;therefore use it as offset to background color
             ldy AreaType
             bne +
             ldy #$08
             jmp SetBGColor1
+:             
             ldy AreaType             ;otherwise use area type bits from area offset as offset
SetBGColor1:   lda BackgroundColors1,y   ;to background color instead
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
             sta VRAM_Buffer1_Offset  ;store as new vram buffer offset
             rts
             
             
             
             
Hitboxes:
             .db $03, $03, $03, $03,  $03, $09, $09, $09,  $09, $09, $09, $09,  $00, $03, $03, $03
             .db $03, $03, $09, $03,  $03, $03, $03, $03,  $00, $09, $00, $00,  $00, $00, $00, $00
             .db $00, $00, $00, $00,  $00, $00, $00, $00,  $00, $00, $00, $00,  $00, $00, $09, $00
             .db $00, $00, $00, $00,  $00, $00, $00
             
PPhitbox1: .db $09, $03
             
MoveAllSpritesOffscreen1:
             ;ldy #$00                ;this routine moves all sprites off the screen
             ;.byte $2c                 ;BIT instruction opcode
             
MoveSpritesOffscreen1:
             ldy #$00                ;this routine moves all but sprite 0
             lda #$f8                ;off the screen
SprInitLoop:  ;sta Sprite_Y_Position,y ;write 248 into OAM data's Y coordinate
             I=0
             REPT 64
             sta $0200 + I
             I = I + 4
             ENDR
             rts
             
BlankPalette:
             .db $3f, $08, $04, $ff, $ff, $ff, $ff, $00
             
Palette2Data:
             .db $12, $30, $22, $0f
             .db $22, $30, $21, $0f
             .db $0f, $30, $21, $0c
             .db $0f, $30, $16, $00
             
ColorRotation:
             ldx VRAM_Buffer1_Offset  ;check vram buffer offset
             cpx #$31
             bcs ExitColorRot         ;if offset over 48 bytes, branch to leave
             ldy #$00                      ;otherwise use frame counter's 3 LSB as offset here
GetBlankPal:  lda BlankPalette,y       ;get blank palette for palette 3
             sta VRAM_Buffer1,x       ;store it in the vram buffer
             inx                      ;increment offsets
             iny
             cpy #$08
             bcc GetBlankPal          ;do this until all bytes are copied
             ldx VRAM_Buffer1_Offset  ;get current vram buffer offset
             lda #$03
             sta $00                  ;set counter here
             ldy #$00
             lda TheresPal3
             bne GetAreaPal
             lda AreaType             ;get area type
             asl                      ;multiply by 4 to get proper offset
             asl
             tay                      ;save as offset here
GetAreaPal:   lda TheresPal3
             bne +
             lda Palette2Data,y
             jmp ++
+:              lda OldPal3,y              ;fetch palette to be written based on area type
++:           sta VRAM_Buffer1+3,x     ;store it to overwrite blank palette in vram buffer
             iny
             inx
             dec $00                  ;decrement counter
             bpl GetAreaPal           ;do this until the palette is all copied
             lda VRAM_Buffer1_Offset
             clc                      ;add seven bytes to vram buffer offset
             adc #$07
             sta VRAM_Buffer1_Offset
ExitColorRot: rts                      ;leave
             
             
EnemyGraphicsTable:
             .db $fc, $fc, $aa, $ab, $ac, $ad  ;buzzy beetle frame 1
             .db $fc, $fc, $ae, $af, $b0, $b1  ;             frame 2
             .db $fc, $a5, $a6, $a7, $a8, $a9  ;koopa troopa frame 1
             .db $fc, $a0, $a1, $a2, $a3, $a4  ;             frame 2
             .db $69, $a5, $6a, $a7, $a8, $a9  ;koopa paratroopa frame 1
             .db $6b, $a0, $6c, $a2, $a3, $a4  ;                 frame 2
             .db $fc, $fc, $96, $97, $98, $99  ;spiny frame 1
             .db $fc, $fc, $9a, $9b, $9c, $9d  ;      frame 2
             .db $fc, $fc, $8f, $8e, $8e, $8f  ;spiny's egg frame 1
             .db $fc, $fc, $95, $94, $94, $95  ;            frame 2
             .db $fc, $fc, $dc, $dc, $df, $df  ;bloober frame 1
             .db $dc, $dc, $dd, $dd, $de, $de  ;        frame 2
             .db $fc, $fc, $b2, $b3, $b4, $b5  ;cheep-cheep frame 1
             .db $fc, $fc, $b6, $b3, $b7, $b5  ;            frame 2
             .db $fc, $fc, $70, $71, $72, $73  ;goomba
             .db $fc, $fc, $6e, $6e, $6f, $6f  ;koopa shell frame 1 (upside-down)
             .db $fc, $fc, $6d, $6d, $6f, $6f  ;            frame 2
             .db $fc, $fc, $6f, $6f, $6e, $6e  ;koopa shell frame 1 (rightsideup)
             .db $fc, $fc, $6f, $6f, $6d, $6d  ;            frame 2
             .db $fc, $fc, $f4, $f4, $f5, $f5  ;buzzy beetle shell frame 1 (rightsideup)
             .db $fc, $fc, $f4, $f4, $f5, $f5  ;                   frame 2
             .db $fc, $fc, $f5, $f5, $f4, $f4  ;buzzy beetle shell frame 1 (upside-down)
             .db $fc, $fc, $f5, $f5, $f4, $f4  ;                   frame 2
             .db $fc, $fc, $fc, $fc, $ef, $ef  ;defeated goomba
             .db $b9, $b8, $bb, $ba, $bc, $bc  ;lakitu frame 1
             .db $fc, $fc, $bd, $bd, $bc, $bc  ;       frame 2
             .db $7a, $7b, $da, $db, $d8, $d8  ;princess
             .db $cd, $cd, $ce, $ce, $cf, $cf  ;mushroom retainer
             .db $7d, $7c, $d1, $8c, $d3, $d2  ;hammer bro frame 1
             .db $7d, $7c, $89, $88, $8b, $8a  ;           frame 2
             .db $d5, $d4, $e3, $e2, $d3, $d2  ;           frame 3
             .db $d5, $d4, $e3, $e2, $8b, $8a  ;           frame 4
             .db $e5, $e5, $e6, $e6, $ee, $ee  ;piranha plant frame 1
             .db $ec, $ec, $ed, $ed, $ee, $ee  ;              frame 2
             .db $fc, $fc, $d0, $d0, $d7, $d7  ;podoboo
             .db $bf, $be, $c1, $c0, $c2, $fc  ;bowser front frame 1
             .db $c4, $c3, $c6, $c5, $c8, $c7  ;bowser rear frame 1
             .db $bf, $be, $ca, $c9, $c2, $fc  ;       front frame 2
             .db $c4, $c3, $c6, $c5, $cc, $cb  ;       rear frame 2
             .db $fc, $fc, $e8, $e7, $ea, $e9  ;bullet bill
             .db $fc, $fc, $f0, $f1, $f2, $f3
             ;.db $f2, $f2, $f3, $f3, $f2, $f2  ;jumpspring frame 1
             ;.db $f1, $f1, $f1, $f1, $fc, $fc  ;           frame 2
             ;.db $f0, $f0, $fc, $fc, $fc, $fc  ;           frame 3
             
EnemyGfxTableOffsets:
             .db $0c, $0c, $00, $0c, $0c, $a8, $54, $3c
             .db $ea, $54, $48, $48, $cc, $c0, $18, $18 ;0f
             .db $18, $90, $24, $18, $48, $9c, $d2, $d8
             .db $f0, $0c, $f6, $fc, $00, $00, $00, $00 ;1f
             .db $c0, $c0, $c0
             
EnemyAttributeData:
             .db $01, $02, $03, $02, $01, $01, $03, $03
             .db $03, $02, $01, $02, $02, $21, $01, $02 ;0f
             .db $01, $01, $02, $03, $02, $02, $01, $01
             .db $02, $02, $02, $02, $02, $00, $00, $00 ;1f
             .db $22, $21, $22
             
EnemyAnimTimingBMask:
             .db $08, $18
             
JumpspringFrameOffsets:
             .db $18, $1a, $1b, $1a, $18
SignPalettes:
             .db $01, $03, $03, $03
EnemyGfxHandler1:
             lda Enemy_Y_Position,x      ;get enemy object vertical position
             sta $02
             lda Enemy_Rel_XPos          ;get enemy object horizontal position
             sta $05                     ;relative to screen
             ldy Enemy_SprDataOffset,x
             sty temp1                   ;get sprite data offset
             lda #$00
             sta VerticalFlipFlag        ;initialize vertical flip flag by default
             lda Enemy_MovingDir,x
             sta $03                     ;get enemy object moving direction
             lda Enemy_SprAttrib,x
             sta $04                     ;get enemy object sprite attributes
             lda Enemy_ID,x
             cmp #Sign
             bne +
             lda #$08
             sta temp4
             ldy AreaType
             lda SignPalettes,y
             sta $04
             ldx #$f0
             jmp DrawEnemyObject
+:      
             cmp #RedPiranhaPlant
             beq +
             cmp #PiranhaPlant           ;is enemy object piranha plant?
             bne CheckForRetainerObj     ;if not, branch
+:    ldy PiranhaPlant_Y_Speed,x
             bmi CheckForRetainerObj     ;if piranha plant moving upwards, branch
             ldy EnemyFrameTimer,x
             beq CheckForRetainerObj     ;if timer for movement expired, branch
             rts                         ;if all conditions fail, leave
             
CheckForRetainerObj:
             lda Enemy_State,x           ;store enemy state
             sta temp3
             and #%00011111              ;nullify all but 5 LSB and use as Y
             tay
             lda Enemy_ID,x              ;check for mushroom retainer/princess object
             cmp #RetainerObject
             bne CheckForBulletBillCV    ;if not found, branch
             ldy #$00                    ;if found, nullify saved state in Y
             lda #$01                    ;set value that will not be used
             sta $03
             lda #$15                    ;set value $15 as code for mushroom retainer/princess object
             
CheckForBulletBillCV:
             cmp #BulletBill_CannonVar   ;otherwise check for bullet bill object
             bne CheckForPodoboo      ;if not found, branch again
             dec $02                     ;decrement saved vertical position
             lda #$03
             ldy EnemyFrameTimer,x       ;get timer for enemy object
             beq SBBAt                   ;if expired, do not set priority bit
             ora #%00100000              ;otherwise do so
SBBAt: sta $04                     ;set new sprite attributes
             ldy #$00                    ;nullify saved enemy state both in Y and in
             sty temp3                   ;memory location here
             lda #$08                    ;set specific value to unconditionally branch once
             
             
CheckForPodoboo:
             sta temp4               ;store saved enemy object value here
             sty temp2               ;and Y here (enemy state -2 MSB if not changed)
             ldx ObjectOffset        ;get enemy object offset
             cmp #$0c                ;check for podoboo object
             bne CheckBowserGfxFlag  ;branch if not found
             lda Enemy_Y_Speed,x     ;if moving upwards, branch
             bmi CheckBowserGfxFlag
             inc VerticalFlipFlag    ;otherwise, set flag for vertical flip
             
CheckBowserGfxFlag:
             lda BowserGfxFlag   ;if not drawing bowser at all, skip to something else
             beq CheckForGoomba
             ldy #$16            ;if set to 1, draw bowser's front
             cmp #$01
             beq SBwsrGfxOfs
             iny                 ;otherwise draw bowser's rear
SBwsrGfxOfs: sty temp4
             
CheckForGoomba:
             ldy temp4             ;check value for goomba object
             cpy #Goomba
             beq +
             cpy #Sign
             beq +
             cpy #FastGoomba
             bne CheckBowserFront  ;branch if not found
+:        lda Enemy_State,x
             cmp #$02              ;check for defeated state
             bcc GmbaAnim          ;if not defeated, go ahead and animate
             ldx #$04              ;if defeated, write new value here
             stx temp2
GmbaAnim: and #%00100000        ;check for d5 set in enemy object state 
             ora TimerControl      ;or timer disable flag set
             bne CheckBowserFront  ;if either condition true, do not animate goomba
             lda FrameCounter
             and #%00001000        ;check for every eighth frame
             bne CheckBowserFront
             lda $03
             eor #%00000011        ;invert bits to flip horizontally every eight frames
             sta $03               ;leave alone otherwise
             
CheckBowserFront:
             lda temp4
             cmp #PiranhaPlant
             beq ++
             cmp #UDPiranhaPlant
             bne +
++:             lda HardModeFlag
             beq +
             lda #$22
             sta $04
             jmp ++
+:           lda EnemyAttributeData,y    ;load sprite attribute using enemy object
             ora $04                     ;as offset, and add to bits already loaded
             sta $04
++:             lda EnemyGfxTableOffsets,y  ;load value based on enemy object as offset
             tax                         ;save as X
             ldy temp2                   ;get previously saved value
             lda BowserGfxFlag
             beq CheckForSpiny           ;if not drawing bowser object at all, skip all of this
             cmp #$01
             bne CheckBowserRear         ;if not drawing front part, branch to draw the rear part
             lda BowserBodyControls      ;check bowser's body control bits
             bpl ChkFrontSte             ;branch if d7 not set (control's bowser's mouth)      
             ldx #$de                    ;otherwise load offset for second frame
ChkFrontSte: lda temp3                   ;check saved enemy state
             and #%00100000              ;if bowser not defeated, do not set flag
             beq DrawBowser
             
FlipBowserOver:
             stx VerticalFlipFlag  ;set vertical flip flag to nonzero
             
DrawBowser:
             jmp DrawEnemyObject   ;draw bowser's graphics now
             
CheckBowserRear:
             lda BowserBodyControls  ;check bowser's body control bits
             and #$01
             beq ChkRearSte          ;branch if d0 not set (control's bowser's feet)
             ldx #$e4                ;otherwise load offset for second frame
ChkRearSte: lda temp3               ;check saved enemy state
             and #%00100000          ;if bowser not defeated, do not set flag
             beq DrawBowser
             lda $02                 ;subtract 16 pixels from
             sec                     ;saved vertical coordinate
             sbc #$10
             sta $02
             jmp FlipBowserOver      ;jump to set vertical flip flag
             
CheckForSpiny:
             cpx #$24               ;check if value loaded is for spiny
             bne CheckForLakitu     ;if not found, branch
             cpy #$05               ;if enemy state set to $05, do this,
             bne NotEgg             ;otherwise branch
             ldx #$30               ;set to spiny egg offset
             lda #$02
             sta $03                ;set enemy direction to reverse sprites horizontally
             lda #$05
             sta temp2              ;set enemy state
NotEgg: jmp CheckForHammerBro  ;skip a big chunk of this if we found spiny but not in egg
             
CheckForLakitu:
             cpx #$90                  ;check value for lakitu's offset loaded
             bne CheckUpsideDownShell  ;branch if not loaded
             lda temp3
             and #%00100000            ;check for d5 set in enemy state
             bne NoLAFr                ;branch if set
             lda FrenzyEnemyTimer
             cmp #$10                  ;check timer to see if we've reached a certain range
             bcs NoLAFr                ;branch if not
             ldx #$96                  ;if d6 not set and timer in range, load alt frame for lakitu
NoLAFr: jmp CheckDefeatedState    ;skip this next part if we found lakitu but alt frame not needed
             
CheckUpsideDownShell:
             lda temp4                  ;check for enemy object => $04
             sty tempC
             ldy temp3
             cpy #$02
             bne +
             ldy tempC
             cmp #BuzzyBeetle
             beq ++
             cmp #RedKoopaShell
             beq ++
             cmp #KoopaShell
             beq ++
             cmp #GreenKoopa
             beq ++
             cmp #RedKoopa
             beq ++
             cmp #DemotedRPTroopa
             beq ++
+:    ldy tempC
             cmp #$05
             bcs CheckRightSideUpShell  ;branch if true
             cpy #$02
             bcc CheckRightSideUpShell  ;branch if enemy state < $02
+:    ldx #$5a                   ;set for upside-down koopa shell by default
             ldy temp4
             cpy #BuzzyBeetle           ;check for buzzy beetle object
             bne CheckRightSideUpShell
             ldx #$7e  
             inc $02                    ;increment vertical position by one pixel
             
CheckRightSideUpShell:
             lda temp2              ;check for value set here
             cmp #$04               ;if enemy state < $02, do not change to shell, if
             bne CheckForHammerBro  ;enemy state => $02 but not = $04, leave shell upside-down
++:      ldx #$72               ;set right-side up buzzy beetle shell by default
             inc $02                ;increment saved vertical position by one pixel
             ldy temp4
             cpy #BuzzyBeetle       ;check for buzzy beetle object
             beq CheckForDefdGoomba ;branch if found
             ldx #$66               ;change to right-side up koopa shell if not found
             inc $02                ;and increment saved vertical position again
             
CheckForDefdGoomba:
             cpy #Goomba            ;check for goomba object (necessary if previously
             beq +                   ;failed buzzy beetle object test)
             cpy #FastGoomba
             bne CheckForHammerBro
+:    ldx #$54               ;load for regular goomba
             lda temp3              ;note that this only gets performed if enemy state => $02
             and #%00100000         ;check saved enemy state for d5 set
             bne CheckForHammerBro  ;branch if set
             ldx #$8a               ;load offset for defeated goomba
             dec $02                ;set different value and decrement saved vertical position
             
CheckForHammerBro:
             ldy ObjectOffset
             lda temp4                ;check for hammer bro object
             cmp #HammerBro
             bne CheckForBloober      ;branch if not found
             lda temp3
             beq CheckToAnimateEnemy  ;branch if not in normal enemy state
             and #%00001000
             beq CheckDefeatedState   ;if d3 not set, branch further away
             ldx #$b4                 ;otherwise load offset for different frame
             bne CheckToAnimateEnemy  ;unconditional branch
             
CheckForBloober:
             cpx #$48                 ;check for cheep-cheep offset loaded
             beq CheckToAnimateEnemy  ;branch if found
             lda EnemyIntervalTimer,y
             cmp #$05
             bcs CheckDefeatedState   ;branch if some timer is above a certain point
             cpx #$3c                 ;check for bloober offset loaded
             bne CheckToAnimateEnemy  ;branch if not found this time
             cmp #$01
             beq CheckDefeatedState   ;branch if timer is set to certain point
             inc $02                  ;increment saved vertical coordinate three pixels
             inc $02
             inc $02
             jmp CheckAnimationStop   ;and do something else
             
CheckToAnimateEnemy:
             lda temp4                ;check for specific enemy objects
             cmp #KoopaShell
             beq CheckDefeatedState
             cmp #RedKoopaShell
             beq CheckDefeatedState
             cmp #Goomba
             beq CheckDefeatedState   ;branch if goomba
             cmp #FastGoomba
             beq CheckDefeatedState
             cmp #$08
             beq CheckDefeatedState   ;branch if bullet bill (note both variants use $08 here)
             cmp #Podoboo
             beq CheckDefeatedState   ;branch if podoboo
             cmp #UDPiranhaPlant
             beq +
             cmp #RUDPiranhaPlant
             beq +
             cmp #RedPiranhaPlant
             beq +
             cmp #$18                 ;branch if => $18
             bcs CheckDefeatedState
+:    ldy #$00    
             cmp #$15                 ;check for mushroom retainer/princess object
             bne CheckForSecondFrame  ;which uses different code here, branch if not found
             ;iny                      ;residual instruction
             lda WorldNumber          ;are we on world 8?
             cmp #FinalWorld
             bcs CheckDefeatedState   ;if so, leave the offset alone (use princess)
             ldx #$a2                 ;otherwise, set for mushroom retainer object instead
             lda #$03                 ;set alternate state here
             sta temp2
             bne CheckDefeatedState   ;unconditional branch
             
CheckForSecondFrame:
             lda FrameCounter            ;load frame counter
             and EnemyAnimTimingBMask  ;mask it (partly residual, one byte not ever used)
             bne CheckDefeatedState      ;branch if timing is off
             
CheckAnimationStop:
             lda temp3               ;check saved enemy state
             and #%10100000          ;for d7 or d5, or check for timers stopped
             ora TimerControl
             bne CheckDefeatedState  ;if either condition true, branch
             lda temp4
             cmp #FastGoomba
             beq CheckDefeatedState
             txa
             clc
             adc #$06                ;add $06 to current enemy offset
             tax                     ;to animate various enemy objects
             
CheckDefeatedState:
             lda temp4
             cmp #UDPiranhaPlant
             beq +
             cmp #RUDPiranhaPlant
             beq +
             lda temp3             ;check saved enemy state
             and #%00100000        ;for d5 set
             beq DrawEnemyObject   ;branch if not set
             lda temp4
             cmp #$05              ;check for saved enemy object => $04
             bcc DrawEnemyObject   ;branch if less
             cmp #RedKoopaShell
             beq DrawEnemyObject
+:    ldy #$01
             sty VerticalFlipFlag  ;set vertical flip flag
             dey
             sty temp2             ;init saved value here
             
DrawEnemyObject:
             ldy temp1                  ;load sprite data offset
             jsr DrawEnemyObjRow        ;draw six tiles of data
             jsr DrawEnemyObjRow        ;into sprite data
             jsr DrawEnemyObjRow
             ldx ObjectOffset           ;get enemy object offset
             ldy Enemy_SprDataOffset,x  ;get sprite data offset
             lda temp4
             cmp #$08                   ;get saved enemy object and check
             bne CheckForVerticalFlip   ;for bullet bill, branch if not found
             
SkipToOffScrChk:
             jmp SprObjectOffscrChk     ;jump if found
             
CheckForVerticalFlip:
             lda VerticalFlipFlag       ;check if vertical flip flag is set here
             beq CheckForESymmetry      ;branch if not
             ldx ObjectOffset           ;get enemy object offset
             ldy Enemy_SprDataOffset,x  ;get sprite data offset
             lda Sprite_Attributes,y    ;get attributes of first sprite we dealt with
             ora #%10000000             ;set bit for vertical flip
             iny
             iny                        ;increment two bytes so that we store the vertical flip
             sta Sprite_Data+20,y      ;dump A contents
             sta Sprite_Data+16,y      ;into third row sprites
             sta Sprite_Data+12,y      ;into second row sprites
             sta Sprite_Data+8,y
             sta Sprite_Data+4,y       ;and into first row sprites
             sta Sprite_Data,y             ;in attribute bytes of enemy obj sprite data
             dey
             dey                        ;now go back to the Y coordinate offset
             tya
             tax                        ;give offset to X
             lda temp4
             cmp #HammerBro             ;check saved enemy object for hammer bro
             beq FlipEnemyVertically
             cmp #Lakitu                ;check saved enemy object for lakitu
             beq FlipEnemyVertically    ;branch for hammer bro or lakitu
             cmp #UDPiranhaPlant
             beq FlipEnemyVertically
             cmp #RedKoopaShell
             beq +
             cmp #RedPiranhaPlant
             beq +
             cmp #$15
             bcs FlipEnemyVertically    ;also branch if enemy object => $15
+:    txa
             clc
             adc #$08                   ;if not selected objects or => $15, set
             tax                        ;offset in X for next row
             
FlipEnemyVertically:
             lda Sprite_Tilenumber,x     ;load first or second row tiles
             pha                         ;and save tiles to the stack
             lda Sprite_Tilenumber+4,x
             pha
             lda Sprite_Tilenumber+16,y  ;exchange third row tiles
             sta Sprite_Tilenumber,x     ;with first or second row tiles
             lda Sprite_Tilenumber+20,y
             sta Sprite_Tilenumber+4,x
             pla                         ;pull first or second row tiles from stack
             sta Sprite_Tilenumber+20,y  ;and save in third row
             pla
             sta Sprite_Tilenumber+16,y
             
CheckForESymmetry:
             lda BowserGfxFlag           ;are we drawing bowser at all?
             bne SkipToOffScrChk         ;branch if so
             lda temp4     
             ldx temp2                   ;get alternate enemy state
             cmp #$05                    ;check for hammer bro object
             bne ContES
             jmp SprObjectOffscrChk      ;jump if found
CheckToMirrorLakitu1: jmp CheckToMirrorLakitu
ContES: cmp #Bloober                ;check for bloober object
             beq MirrorEnemyGfx
             cmp #PiranhaPlant           ;check for piranha plant object
             beq MirrorEnemyGfx
             cmp #UDPiranhaPlant
             beq MirrorEnemyGfx
             cmp #RUDPiranhaPlant
             beq MirrorEnemyGfx
             cmp #RedPiranhaPlant
             beq MirrorEnemyGfx
             cmp #Podoboo                ;check for podoboo object
             beq MirrorEnemyGfx          ;branch if either of three are found
             cmp #Spiny                  ;check for spiny object
             bne ESRtnr                  ;branch closer if not found
             cpx #$05                    ;check spiny's state
             bne CheckToMirrorLakitu1     ;branch if not an egg, otherwise
ESRtnr: cmp #$15                    ;check for princess/mushroom retainer object
             bne SpnySC
             lda #$42                    ;set horizontal flip on bottom right sprite
             sta Sprite_Attributes+20,y  ;note that palette bits were already set earlier
SpnySC: cpx #$02                    ;if alternate enemy state set to 1 or 0, branch
             bcc CheckToMirrorLakitu
             
MirrorEnemyGfx:
             lda BowserGfxFlag           ;if enemy object is bowser, skip all of this
             bne CheckToMirrorLakitu
             lda Sprite_Attributes,y     ;load attribute bits of first sprite
             and #%10100011
             sta Sprite_Attributes,y     ;save vertical flip, priority, and palette bits
             sta Sprite_Attributes+8,y   ;in left sprite column of enemy object OAM data
             sta Sprite_Attributes+16,y
             ora #%01000000              ;set horizontal flip
             cpx #$05                    ;check for state used by spiny's egg
             bne EggExc                  ;if alternate state not set to $05, branch
             ora #%10000000              ;otherwise set vertical flip
EggExc: sta Sprite_Attributes+4,y   ;set bits of right sprite column
             sta Sprite_Attributes+12,y  ;of enemy object sprite data
             sta Sprite_Attributes+20,y
             lda temp4
             cmp #BuzzyBeetle
             beq ++
             cmp #RedKoopa
             beq ++
             cmp #KoopaShell
             beq ++
             cmp #RedKoopaShell
             beq ++
             cmp #DemotedRPTroopa
             beq ++
             cmp #GreenKoopa
             bne +
++:        txa
             ldx temp3
             cpx #$02
             beq ++
             tax
+:      cpx #$04                    ;check alternate enemy state
             bne CheckToMirrorLakitu     ;branch if not $04
++:     tax
             lda Sprite_Attributes+8,y   ;get second row left sprite attributes
             ora #%10000000
             sta Sprite_Attributes+8,y   ;store bits with vertical flip in
             sta Sprite_Attributes+16,y  ;second and third row left sprites
             ora #%01000000
             sta Sprite_Attributes+12,y  ;store with horizontal and vertical flip in
             sta Sprite_Attributes+20,y  ;second and third row right sprites
             
CheckToMirrorLakitu:
             lda temp4
             cmp #RedPiranhaPlant
             beq +
             cmp #PiranhaPlant            ;check if enemy ID is piranha plant
             bne exitPiranha
+:        stx temp9                    ;store current X in here
             sty temp8
             ldx ObjectOffset
             lda PiranhaPlantDownYPos,x    ;get the piranha's root Y position
             pha
             ldy Enemy_Y_Position,x
             ;    iny
             tya
             cmp PiranhaPlantDownYPos,x
             bcs +
             pla
             sec
             sbc #$01
             .db $2c, $03
+:        pla
             ldy temp8
             sec
             sbc Enemy_Y_Position,x        ;subtract the current piranha position from it
             and #%11111000                ;and to check every 8 difference
             clc
             ror
             ror
             ror                            ;rotate xxxxx000 -> 000xxxxx
             tax
             lda PiranhaTable,x            ;load from this table, 0->this sprite is inside the pipe, 1->this sprite is outside of pipe
             sta tempB                    ;store it into a temporary address
             ror tempB                    ;rotate to the right, bit 0 becomes carry
             bcc +                        ;if carry is clear, piranha is inside the pipe (this can be optimized to branch to the end of the code)
             lda Sprite_Attributes,y        ;otherwise get the sprite attribute
             and #%11011111        
             sta Sprite_Attributes,y        
             lda Sprite_Attributes+4,y    ;do it with the sprite next to it aswell
             and #%11011111
             sta Sprite_Attributes+4,y
+:
             ror tempB                    ;same procedure as earlier
             bcc +
             lda Sprite_Attributes+8,y
             and #%11011111
             sta Sprite_Attributes+8,y
             lda Sprite_Attributes+12,y
             and #%11011111
             sta Sprite_Attributes+12,y
+:        
             ror tempB                    ;same procedure as earlier
             bcc +
             lda Sprite_Attributes+16,y
             and #%11011111
             sta Sprite_Attributes+16,y
             lda Sprite_Attributes+20,y
             and #%11011111
             sta Sprite_Attributes+20,y
+:
             ldx temp9
exitPiranha:
             cmp #UDPiranhaPlant
             beq +
             cmp #RUDPiranhaPlant
             bne exitPiranhaUD
+:        stx temp9                    ;store current X in here
             ldx ObjectOffset
             lda PiranhaPlantDownYPos,x    ;get the piranha's root Y position
             clc
             adc #$07
             sec
             sbc Enemy_Y_Position,x        ;subtract the current piranha position from it
             and #%11111000                ;and to check every 8 difference
             clc
             ror
             ror
             ror                            ;rotate xxxxx000 -> 000xxxxx
             tax
             lda UDPiranhaTable,x            ;load from this table, 0->this sprite is inside the pipe, 1->this sprite is outside of pipe
             sta tempB                    ;store it into a temporary address
             ror tempB                    ;rotate to the right, bit 0 becomes carry
             bcc +                        ;if carry is clear, piranha is inside the pipe (this can be optimized to branch to the end of the code)
             lda Sprite_Attributes+16,y
             and #%11011111
             sta Sprite_Attributes+16,y
             lda Sprite_Attributes+20,y
             and #%11011111
             sta Sprite_Attributes+20,y
+:
             ror tempB                    ;same procedure as earlier
             bcc +
             lda Sprite_Attributes+8,y
             and #%11011111
             sta Sprite_Attributes+8,y
             lda Sprite_Attributes+12,y
             and #%11011111
             sta Sprite_Attributes+12,y
+:        
             ror tempB                    ;same procedure as earlier
             bcc +
             lda Sprite_Attributes,y        ;otherwise get the sprite attribute
             and #%11011111        
             sta Sprite_Attributes,y        
             lda Sprite_Attributes+4,y    ;do it with the sprite next to it aswell
             and #%11011111
             sta Sprite_Attributes+4,y
+:
             ldx temp9
exitPiranhaUD:
             lda temp4                   ;check for lakitu enemy object
             cmp #Lakitu
             bne +    ;branch if not found
             lda VerticalFlipFlag
             bne NVFLak                  ;branch if vertical flip flag not set
             lda Sprite_Attributes+16,y  ;save vertical flip and palette bits
             and #%10000001              ;in third row left sprite
             sta Sprite_Attributes+16,y
             lda Sprite_Attributes+20,y  ;set horizontal flip and palette bits
             ora #%01000001              ;in third row right sprite
             sta Sprite_Attributes+20,y
             ldx FrenzyEnemyTimer        ;check timer
             cpx #$10
             bcs +      ;branch if timer has not reached a certain range
             sta Sprite_Attributes+12,y  ;otherwise set same for second row right sprite
             and #%10000001
             sta Sprite_Attributes+8,y   ;preserve vertical flip and palette bits for left sprite
             bcc +      ;unconditional branch
NVFLak: lda Sprite_Attributes,y     ;get first row left sprite attributes
             and #%10000001
             sta Sprite_Attributes,y     ;save vertical flip and palette bits
             lda Sprite_Attributes+4,y   ;get first row right sprite attributes
             ora #%01000001              ;set horizontal flip and palette bits
             sta Sprite_Attributes+4,y   ;note that vertical flip is left as-is
+:        jmp SprObjectOffscrChk
             ;lda temp4                   ;check for jumpspring object (any frame)
             ;cmp #$18
             ;bcc SprObjectOffscrChk      ;branch if not jumpspring object at all
             ;cmp #RedKoopaShell
             ;beq SprObjectOffscrChk
             ;cmp #RedPiranhaPlant
             ;beq SprObjectOffscrChk
             ;cmp #RUDPiranhaPlant
             ;beq SprObjectOffscrChk
             ;cmp #UDPiranhaPlant
             ;beq SprObjectOffscrChk
             ;lda #$82
             ;sta Sprite_Attributes+8,y   ;set vertical flip and palette bits of 
             ;sta Sprite_Attributes+16,y  ;second and third row left sprites
             ;ora #%01000000
             ;sta Sprite_Attributes+12,y  ;set, in addition to those, horizontal flip
             ;sta Sprite_Attributes+20,y  ;for second and third row right sprites
             
             
PiranhaTable:
             .db %00000000, %00000001, %00000011, %00000111
UDPiranhaTable:
             .db %00000111, %00000011, %00000001, %00000000, $00
             
             
             
             include code\gameOverMenu.asm