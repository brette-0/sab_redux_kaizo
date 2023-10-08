             sei                          ;pretty standard 6502 type init here
             cld
             if DPCM
             ldx #$00
             stx $4010
             endif
Start:         
             lda #%00001000               ;init PPU control register 1 
             sta PPU_CTRL_REG1
             ldx #$ff                     ;reset stack pointer
             txs
VBlank1:     lda PPU_STATUS               ;wait two frames
             bpl VBlank1
VBlank2:     lda PPU_STATUS
             bpl VBlank2
             ldy #ColdBootOffset          ;load default cold boot pointer
             ldx #$05                     ;this is where we check for a warm boot
WBootCheck:  lda TopScoreDisplay,x        ;check each score digit in the top score
             cmp #10                      ;to see if we have a valid digit
             bcs ColdBoot                 ;if not, give up and proceed with cold boot
             dex                      
             bpl WBootCheck
             lda WarmBootValidation       ;second checkpoint, check to see if 
             cmp #$a5                     ;another location has a specific value
             bne ColdBoot   
             ldy #WarmBootOffset          ;if passed both, load warm boot pointer
ColdBoot:    jsr InitializeMemory         ;clear memory using pointer in Y
             sta SND_DELTA_REG+1          ;reset delta counter load register
             sta OperMode                 ;reset primary mode of operation
             lda #$a5                     ;set warm boot flag
             sta WarmBootValidation     
             sta PseudoRandomBitReg       ;set seed for pseudorandom register
             lda #%00001111
             sta SND_MASTERCTRL_REG       ;enable all sound channels except dmc
             lda #%00000110
             sta PPU_CTRL_REG2            ;turn off clipping for OAM and background
             jsr MoveSpritesOffscreen
             jsr InitializeNameTables     ;initialize both name tables
             inc DisableScreenFlag        ;set flag to disable screen output
             lda #$40                     ;disable frame counter to make irq work
             sta $4017 
             cli      
             lda Mirror_PPU_CTRL_REG1
             ora #%10000000               ;enable NMIs
             jsr WritePPUReg1
             ;jmp EndlessLoop
             ;jsr _FamitoneInit
EndlessLoop: 
             ;lda $00                         ;idk if this does something but literally is in smb2j
             jmp EndlessLoop              ;endless loop, need I say more? -yes
