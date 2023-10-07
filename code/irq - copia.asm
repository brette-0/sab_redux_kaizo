IRQ:
	sei
	php
	pha
	lda $00
	pha
	txa
	pha
	tya
	pha
	
	lda #$01
	sta $e000
	lda IRQnum
	bne SecondIRQ
	lda SetupPause
	beq +
	
	lda Mirror_PPU_CTRL_REG1
	and #%11101110
	ora #%00000010
	sta Mirror_PPU_CTRL_REG1
	sta PPU_CTRL_REG1
	
	lda PPU_STATUS
	
	lda SetupPause
	cmp #$04
	bcc +
	
	lda #$00
	sta PPU_SCROLL_REG
	sta PPU_SCROLL_REG
	
	jmp Exitante
	
+:	
	lda Mirror_PPU_CTRL_REG1
	and #%11101100
	ora OldNameTableSelect	
	sta Mirror_PPU_CTRL_REG1
	sta PPU_CTRL_REG1
	
	lda OldTextboxID
	ora TextboxID
	beq +
	lda #$83
	sta $8000
	lda #$05
	sta $8001
	lda PPU_STATUS
+:
	
	lda OldHorizontalScroll
	sta PPU_SCROLL_REG
	
	lda #$00
Exitante:
	sta PPU_SCROLL_REG         
	
	lda StartedTextBox
	beq +
	lda #$96
    sta $c000
    sta $c001
	sta $e001
	
	inc IRQnum
	jmp EndIRQ
SecondIRQ:
	cmp #$02
	bcs ThirdIRQ
	ldx #24
-:
	dex
    bpl -
	nop
	nop
	lda #%00001010
	sta PPU_CTRL_REG2
	sta Mirror_PPU_CTRL_REG2
	
	lda #$82
	sta $8000
	lda #%10000100
	sta $8001
	
	lda #$83
	sta $8000
	lda #%10000011
	sta $8001
  
  
    lda Old8000 
	sta $8000
	
	lda #%00001100
	sta PPU_ADDRESS
	lda #$01
	sta PPU_SCROLL_REG
	lda #$00
	sta PPU_SCROLL_REG
	sta PPU_ADDRESS
	
	lda #$03
    sta $c000
    sta $c001
	sta $e001
	
	inc IRQnum
	lda IRQAckFlag
+:	sta IRQAckFlag
	jmp EndIRQ

ThirdIRQ:
	cmp #$03
	bcs FourthIRQ
	ldx #49
-:
	dex
    bpl -
	lda #%00001100
	sta PPU_ADDRESS
	lda TextBoxYScroll
	clc
	adc #$07
	sta PPU_SCROLL_REG
	lda #$00
	sta PPU_SCROLL_REG
	lda TextBoxYScroll
	clc
	adc #$07
	and #$f8
	asl
	asl
	sta PPU_ADDRESS
	
	lda #$1f
    sta $c000
    sta $c001
	sta $e001
	inc IRQnum
	jmp EndIRQ
	
FourthIRQ:
	ldx #53
-:
	dex
    bpl -
	lda #%00001100
	sta PPU_ADDRESS
	lda #$53
	sta PPU_SCROLL_REG
	lda #$00
	sta PPU_SCROLL_REG
	lda #$40
	sta PPU_ADDRESS
	lda #$00
	sta $e000
	sta IRQAckFlag
	sta IRQnum
EndIRQ:	
	pla
	tay
	pla
	tax
	pla
	sta $00
	pla
	plp
	cli
	rti
	
	