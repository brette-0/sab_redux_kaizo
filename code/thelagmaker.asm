
;-----------------------------------------------------------------------------------------------;
;																								;
;	Just call TheLagMaker routine with the accumulator set to 0 if you want to enable the		;
;			wipe memory function. Will crash on mappers that uses bankswitching regs.			;
;																								;
;-----------------------------------------------------------------------------------------------;

TheLagMaker:
		cmp #$00
		beq WipeAllMemoryBecauseYES
		jmp LagMachine
WipeAllMemoryBecauseYES:	
		lda #$00
		lda #$00
		sta $fe
		sta $ff
		ldy #$ff
		iny
-:		lda $fe
		cmp #$00
		bne +
		cmp #$fe
		beq ++
		cmp #$ff
		bne +
++:		jmp +++
+:		sta ($ff),y
+++:    lda #$00
		lda $fe
		clc
		adc #$01
		sta $fe
		lda $ff
		adc #$00
		sta $ff
		lda $fe
		bne -
		lda $ff
		bne -
LagMachine:		
		jsr DoNothing
	    jsr DoNothing
	    jsr DoNothing
	    jsr DoNothing				;LAG TO DEATH!!!!! :fire::fire:
	    jsr DoNothing
	    jsr DoNothing
DoNothing:
		jsr DoNothing2
		jsr DoNothing2
		jsr DoNothing2
		jsr DoNothing2
		jsr DoNothing2
		jsr DoNothing2
		jsr DoNothing2
		jsr DoNothing2
DoNothing2:
		jsr DoNothing3
		jsr DoNothing3
		jsr DoNothing3
		jsr DoNothing3
DoNothing3:		
		pha
		pla
		pha
		pha
		pla
		pla
		pla
		pha
		pha
		pla
		lda $7fbf
		pha
		ldy #$ff
		tya
		tax
		txa
		tay
-:		inc $7fbf
		dex
		bne -
		dey 
		bne -
		lda $7fbf
		clc
		sec
		sbc #$02
		clc
		adc #$01
		sta $7fbf
		lda $7fbf
		cmp #$00
		bne -
		ldy #$ff
		tya
		tax
		txa
		tay
-:		lda $7fbf
		clc
		sec
		sbc #$02
		clc
		adc #$01
		sta $7fbf
		lda $7fbf
		dex
		bne -
		dey 
		bne -
		lda $7fbf
		clc
		sec
		sbc #$02
		clc
		adc #$01
		sta $7fbf
		lda $7fbf
		cmp #$00
		bne -
		lda $7fbf
		sec
		clc
		adc #$02
		sec
		sbc #$01
		sta $7fbf
		lda $7fbf
		cmp #$00
		bne -
		pla
		sta $7fbf
		jmp +
+:		rts
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		rts
