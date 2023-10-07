DrawTitleScreen:
            if SKIP_TITLE
                inc ScreenRoutineTask
                rts
            endif


            lda OperMode                 ;are we in title screen mode?
            beq +
            jmp IncModeTask_B            ;if not, exit
+
            lda #$64                     ;put address $0300 into
            sta $01                      ;the indirect at $00
            ldy #$00
            sty $00

            lda #<titleScreenData
            sta $02
            lda #>titleScreenData
            sta $03
OutputTScr:
            lda ($02),y
            sta ($00),y
			sta $04
            iny
            bne ChkHiByte
            inc $01
            inc $03
ChkHiByte:
            lda $04                                         ;check high byte?
            cmp #$ff							    			;at $0400?
            bne OutputTScr                                  ;if not, loop back and do another
            cpy #<(titleScreenDataEnd-titleScreenData)      ;check if offset points past end of data (This is #$3a normally).
            bcc OutputTScr                                  ;if not, loop back and do another
            lda #$05                                        ;set buffer transfer control to $0300,
            jmp SetVRAMAddr_B                               ;increment task and exit


titleScreenData:
;.incbin data\SMB Annoyance.nes, TitleScreenDataOffset + $8000 + $10, $13a      ; does not work
;.incbin data\SMB Annoyance.nes, $1ec0 + $8000 + $10, $13a                      ; does not work
;.incbin SMBAnnoyance.nes, $9ed0                                                ; works
;.incbin "SMB Annoyance.nes", $9ed0                                             ; works
;.incbin data\SMB Annoyance.nes, $9ed0                                          ; does not work
;.incbin SMBAnnoyance.nes, $1ec0 + $8000 + $10, $13a                            ; works
;.incbin SMBAnnoyance.nes, TitleScreenDataOffset + $8000 + $10, $13a            ; assembles, does not work
;.incbin "data\SMB Annoyance.nes", TitleScreenDataOffset + $8000 + $10, $13a    ; works
;.incbin "data/SMB Annoyance.nes", TitleScreenDataOffset + $8000 + $10, $13a    ; works
;.incbin data\SMB Annoyance.nes, $8000 + $10, $13a + TitleScreenDataOffset      ; does not work
;.incbin SMBAnnoyance.nes, $8000 + $10, $13a + TitleScreenDataOffset            ; does not work


.db $20, $87, $01, $44, $20, $88, $50, $48, $20, $98, $01, $49, $20, $a7, $c9, $46, $20, $a8, $0a, $d0, $d1, $d8, $d8, $de, $d1, $d0, $da, $de, $d1, $20, $b2, $46, $26, $20, $b8, $c9, $4a, $20, $c8, $0a, $d2, $d3, $db, $db, $db, $d9, $db, $dc, $db, $df, $20, $d2, $46, $26, $20, $e8, $0a, $d4, $d5, $d4, $d9, $db, $e2, $d4, $da, $db, $e3, $20, $f2, $46, $26, $21, $08, $0a, $d6, $d7, $d6, $d7, $e1, $26, $d6, $dd, $e1, $e1, $21, $12, $46, $26, $21, $28, $11, $d0, $d1, $d8, $26, $de, $da, $26, $de, $d1, $de, $d1, $d0, $d1, $d0, $d1, $26, $4a, $21, $48, $c2, $db, $21, $49, $10, $42, $db, $26, $db, $dd, $26, $db, $42, $db, $42, $db, $42, $db, $42, $26, $4a, $21, $69, $42, $db, $21, $6b, $c2, $26, $21, $6c, $0d, $de, $da, $26, $de, $df, $de, $df, $db, $db, $e4, $e5, $26, $4a, $21, $88, $11, $de, $43, $db, $26, $db, $dd, $26, $db, $e3, $db, $42, $db, $db, $e6, $e3, $26, $4a, $21, $a8, $11, $db, $42, $de, $da, $de, $da, $26, $de, $d9, $db, $db, $d4, $d9, $d4, $d9, $e7, $4a, $21, $c7, $12, $5f, $95, $95, $95, $cd, $95, $cd, $78, $95, $98, $95, $95, $97, $98, $97, $98, $95, $7a, $21, $e7, $06, $1b, $0e, $0d, $1e, $21, $2b, $21, $f2, $06, $cf, $24, $02, $00, $02, $01, $22, $11, $08, $0a, $15, $0e, $0f, $1e, $17, $14, $22, $22, $4b, $08, $17, $0e, $20, $24, $10, $0a, $16, $0e, $22, $8b, $09, $0c, $18, $1e, $17, $1d, $12, $17, $1e, $0e, $22, $ec, $04, $1d, $18, $19, $28, $22, $f6, $01, $00, $23, $c9, $56, $55, $23, $e2, $05, $95, $a5, $a5, $a5, $05, $23, $ea, $04, $99, $aa, $aa, $aa

;.db $20, $a6, $54, $26, $20, $c6, $54, $26, $20, $e6, $54, $26, $21, $06, $54, $26
;.db $20, $85, $01, $44, $20, $86, $54, $48, $20, $9a, $01, $49, $20, $a5, $c9, $46
;.db $20, $ba, $c9, $4a, $20, $a6, $0a, $d0, $d1, $d8, $d8, $de, $d1, $d0, $da, $de
;.db $d1, $20, $c6, $0a, $d2, $d3, $db, $db, $db, $d9, $db, $dc, $db, $df, $20, $e6
;.db $0a, $d4, $d5, $d4, $d9, $db, $e2, $d4, $da, $db, $e0, $21, $06, $0a, $d6, $d7
;.db $d6, $d7, $e1, $26, $d6, $dd, $e1, $e1, $21, $26, $14, $d0, $e8, $d1, $d0, $d1
;.db $de, $d1, $d8, $d0, $d1, $26, $de, $d1, $de, $d1, $d0, $d1, $d0, $d1, $26, $21
;.db $46, $14, $db, $42, $42, $db, $42, $db, $42, $db, $db, $42, $26, $db, $42, $db
;.db $42, $db, $42, $db, $42, $26, $21, $66, $46, $db, $21, $6c, $0e, $df, $db, $db
;.db $db, $26, $db, $df, $db, $df, $db, $db, $e4, $e5, $26, $21, $86, $14, $db, $db
;.db $db, $de, $43, $db, $e0, $db, $db, $db, $26, $db, $e3, $db, $e0, $db, $db, $e6
;.db $e3, $26, $21, $a6, $14, $db, $db, $db, $db, $42, $db, $db, $db, $d4, $d9, $26
;.db $db, $d9, $db, $db, $d4, $d9, $d4, $d9, $e7, $21, $c5, $16, $5f, $95, $95, $95
;.db $95, $95, $95, $95, $95, $97, $98, $78, $95, $96, $95, $95, $97, $98, $97, $98
;.db $95, $7a;, $21, $ed, $0e, $cf, $01, $09, $08, $05, $24, $17, $12, $17, $1d, $0e, $17, $0d, $18, 
.db $22, $4b, $0d, "NEW"-55, $24, "GAME"-55, $24, $24
.db $24, $24, $24, $22, $8b, $0d, "CONTINUE"-55, $24, $24
.db $24, $24, $24 ;$22, $ec, $04, $1d, $18, $19, $28, $22, $f6, $01, $00, $23, $c9
;.db $56, $55, $23, $e2, $04, $99, $aa, $aa, $aa, $23, $ea, $04, $99, $aa, $aa, $aa
;.db $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
;.db $21, $ed, $0e, $cf, $02, $00, $02, $01, $24, "ALEFUNKY"-55
.db $00, $ff
;.db $22, $0a
;.db titleMessageEnd-titleMessageStart
;titleMessageStart:
;.db "SCANLINE-TEST"-$37
;titleMessageEnd:
titleScreenDataEnd:


