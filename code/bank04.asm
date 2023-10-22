             .db "LEVEL ROUTINE"
             include code\loadArea.asm
             
BrickQBlockMetatiles1:
             .db $c1, $c0, $5f, $60 ;used by question blocks
             
             ;these two sets are functionally identical, but look different
             .db $55, $56, $57, $58, $59, $6f, $29        ;, $70, $6f, $c4, $72 ;used by ground level types
             .db $5a, $5b, $5c, $5d, $5e, $6f, $29 ;, $71, $6f, $c4, $72 ;used by other level types
             if $ == -
             error Check "LEVEL_DATA" in code/settings.asm
             endif
             
MetatileGraphics_Low:
             .db <Palette0_MTiles, <Palette1_MTiles, <Palette2_MTiles, <Palette3_MTiles
             
MetatileGraphics_High:
             .db >Palette0_MTiles, >Palette1_MTiles, >Palette2_MTiles, >Palette3_MTiles
             
Palette0_MTiles:
             .db $30, $32, $31, $33 ;blank 00
             ;.db $a5, $a7, $a6, $a8 ;blank coin sprite
             ;.db $24, $24, $24, $24 ;blank
             .db $27, $27, $27, $27 ;black metatile 01
             .db $30, $32, $31, $35 ;bush left 02
             .db $36, $25, $37, $25 ;bush middle 03
             .db $30, $38, $31, $33 ;bush right 04
             .db $30, $6b, $6b, $26 ;mountain left 05
             .db $26, $26, $34, $26 ;mountain left bottom/middle center 06
             .db $30, $6c, $31, $6d ;mountain middle top 07
             .db $6e, $26, $31, $6e ;mountain right 08
             .db $34, $26, $26, $26 ;mountain right bottom 09
             .db $26, $26, $26, $26 ;mountain middle bottom 0a
             .db $30, $c0, $31, $c0 ;bridge guardrail 0b
             .db $30, $7f, $7f, $33 ;chain 0c
             .db $b8, $ba, $b9, $43 ;tall tree top, top half 0d
             .db $b8, $ec, $b9, $ed ;short tree top 0e
             .db $ba, $ec, $43, $ed ;tall tree top, bottom half 0f
             .db $60, $64, $61, $65 ;warp pipe end left, points up 10
             .db $62, $66, $63, $67 ;warp pipe end right, points up 11
             .db $60, $64, $61, $65 ;decoration pipe end left, points up 12
             .db $62, $66, $63, $67 ;decoration pipe end right, points up 13
             .db $68, $68, $69, $69 ;pipe shaft left 14
             .db $26, $26, $6a, $6a ;pipe shaft right 15
             .db $4b, $4c, $4d, $4e ;tree ledge left edge 16
             .db $4d, $4e, $4d, $4e ;tree ledge middle 17
             .db $4d, $4e, $50, $51 ;tree ledge right edge 18
             .db $d0, $b4, $2c, $2d ;mushroom left edge 19
             .db $d1, $b5, $d2, $b6 ;mushroom middle 1a
             .db $d3, $b7, $d4, $a5 ;mushroom right edge 1b
             .db $86, $8a, $87, $8b ;sideways pipe end top 1c
             .db $88, $8c, $88, $8c ;sideways pipe shaft top 1d
             .db $89, $8d, $69, $69 ;sideways pipe joint top 1e
             .db $8e, $91, $8f, $92 ;sideways pipe end bottom 1f
             .db $26, $93, $26, $93 ;sideways pipe shaft bottom 20
             .db $90, $94, $69, $69 ;sideways pipe joint bottom 21
             .db $a4, $48, $49, $4a ;seaplant 22
             .db $30, $32, $31, $33 ;blank, used on bricks or blocks that are hit 23
             .db $30, $2f, $31, $3d ;flagpole ball 24
             .db $a2, $a2, $a3, $a3 ;flagpole shaft 25
             .db $ee, $f0, $ef, $f1 ;vine 26
             .db $fd, $45, $fe, $47 ;breakable brick w/ line 27
             .db $fa, $45, $fb, $47 ;breakable brick 28
             .db $30, $32, $31, $33 ;hidden block (1 coin) 29
             .db $30, $32, $31, $33 ;hidden block (1-up) 2a
             .db $30, $32, $31, $33 ;hidden block (power-up) 2b
             .db $4f, $e5, $9f, $e6 ;decoration pipe end left, points down 2c
             .db $9a, $e7, $bb, $e8 ;decoration pipe end right, points down 2d
             .db $4f, $e5, $9f, $e6 ;warp pipe end left, points down 2e
             .db $9a, $e7, $bb, $e8 ;warp pipe end right, points down 2f
             .db $30, $32, $31, $33 ;hidden block (star) 30
             .db $fa, $45, $fb, $47 ;brick (power-up) 31
             .db $fa, $45, $fb, $47 ;brick (vine) 32
             .db $fa, $45, $fb, $47 ;brick (star) 33
             .db $fa, $45, $fb, $47 ;brick (coins) 34
             .db $fa, $45, $fb, $47 ;brick (1-up) 35
             .db $86, $8a, $87, $8b ;sideways pipe end top 36
             .db $8e, $91, $8f, $92 ;sideways pipe end bottom 37
             .db $26, $26, $26, $26 ;hidden block (1 coin) 38
             .db $26, $26, $26, $26 ;hidden block (1-up) 39
             .db $26, $26, $26, $26 ;hidden block (power-up) 3a
             .db $26, $26, $26, $26 ;hidden block (star) 3b
             .db $fa, $45, $fb, $47 ;brick (coin) 3c
             .db $24, $24, $6a, $6a ;pipe shaft right 3d
             .db $24, $93, $24, $93 ;sideways pipe shaft bottom 3e
             
Palette1_MTiles:
             .db $a2, $a2, $a3, $a3 ;vertical rope 40
             .db $99, $32, $99, $33 ;horizontal rope 41
             .db $30, $a2, $3e, $3f ;left pulley 42
             .db $5b, $5c, $31, $a3 ;right pulley 43
             .db $30, $32, $31, $33 ;blank used for balance rope 44
             .db $9d, $ff, $9e, $ff ;castle top 45
             .db $ff, $ff, $27, $27 ;castle window left 46
             .db $ff, $ff, $ff, $ff ;castle brick wall 47
             .db $27, $27, $ff, $ff ;castle window right 48
             .db $a9, $ff, $aa, $ff ;castle top w/ brick 49
             .db $9b, $27, $9c, $27 ;entrance top 4a
             .db $27, $27, $27, $27 ;entrance bottom 4b
             .db $52, $52, $52, $52 ;green ledge stump 4c
             .db $80, $a0, $81, $a1 ;fence 4d
             .db $be, $be, $bf, $bf ;tree trunk 4e
             .db $a6, $ba, $a7, $43 ;mushroom stump top 4f
             .db $ba, $ba, $43, $43 ;mushroom stump bottom 50
             .db $fd, $45, $fe, $47 ;breakable brick w/ line 51  
             .db $fa, $45, $fb, $47 ;breakable brick 52
             .db $45, $47, $45, $47 ;breakable brick (not used) 53
             .db $f2, $f4, $f3, $f5 ;cracked rock terrain 54
             .db $fd, $45, $fe, $47 ;brick with line (power-up) 55
             .db $fd, $45, $fe, $47 ;brick with line (vine) 56
             .db $fd, $45, $fe, $47 ;brick with line (star) 57
             .db $fd, $45, $fe, $47 ;brick with line (coins) 58
             .db $fd, $45, $fe, $47 ;brick with line (1-up) 59
             .db $fa, $45, $fb, $47 ;brick (power-up) 5a
             .db $fa, $45, $fb, $47 ;brick (vine) 5b
             .db $fa, $45, $fb, $47 ;brick (star) 5c
             .db $fa, $45, $fb, $47 ;brick (coins) 5d
             .db $fa, $45, $fb, $47 ;brick (1-up) 5e
             .db $30, $32, $31, $33 ;hidden block (1 coin) 5f
             .db $30, $32, $31, $33 ;hidden block (1-up) 60
             .db $ab, $ac, $ad, $ae ;solid block (3-d block) 61
             .db $5d, $5e, $5d, $5e ;solid block (white wall) 62
             .db $c1, $32, $c1, $33 ;bridge 63
             .db $c6, $c8, $c7, $c9 ;bullet bill cannon barrel 64
             .db $ca, $cc, $cb, $cd ;bullet bill cannon top 65
             .db $2a, $2a, $40, $40 ;bullet bill cannon bottom 66
             .db $30, $32, $31, $33 ;blank used for jumpspring 67
             .db $30, $ff, $31, $ff ;half brick used for jumpspring 68
             .db $82, $83, $84, $85 ;solid block (water level, green rock) 69
             .db $30, $ff, $31, $ff ;half brick (???) 6a
             .db $86, $8a, $87, $8b ;water pipe top 6b
             .db $8e, $91, $8f, $92 ;water pipe bottom 6c
             .db $30, $2f, $31, $3d ;flag ball (residual object) 6d
             .db $bc, $bd, $bc, $bd ;yoquse 6e
             .db $30, $32, $31, $33 ;hidden block (power-up) 6f
             .db $ff, $ff, $ff, $ff ;castle stop 70
             .db $30, $6b, $6b, $26 ;slope 71
             .db $d5, $d7, $d6, $d8 ;p-block 72
             .db $30, $32, $31, $33 ;hidden block (star) 73
             .db $30, $32, $31, $33 ;anticheese bumpable block 74
             
Palette2_MTiles:
             .db $30, $32, $31, $35 ;cloud left 80
             .db $36, $25, $37, $25 ;cloud middle 81 
             .db $30, $38, $31, $33 ;cloud right 82 
             .db $30, $32, $39, $33 ;cloud bottom left 83
             .db $3a, $32, $3b, $33 ;cloud bottom middle 84
             .db $3c, $32, $31, $33 ;cloud bottom right 85
             .db $41, $26, $41, $26 ;water/lava top 86
             .db $26, $26, $26, $26 ;water/lava 87
             .db $b0, $b1, $b2, $b3 ;cloud level terrain 88
             .db $a8, $96, $a8, $96 ;bowser's bridge 89
             .db $c2, $c4, $c3, $c5 ;spikes 8a
             .db $76, $78, $77, $79 ;noteblock 8b
             .db $f6, $f8, $f7, $f9 ;p-switch 8c
             .db $e1, $e3, $e2, $e4 ;on off switch 8d
             .db $d9, $db, $da, $dc ;on off block 8e
             .db $dd, $df, $de, $e0 ;on off block (on) 8f
             .db $41, $26, $41, $26 ;water/lava top swimmable 90
             .db $26, $26, $26, $26 ;water/lava swimmable 91
             .db $27, $5e, $27, $5e ;door 92
			 .db $41, $26, $41, $26 ;water/lava top 93
			 .db $26, $26, $26, $26 ;water/lava 94
			 .db $30, $32, $31, $33 ;invisible wall 95
			 .db $b0, $b2, $b1, $b3 ;w8 rock ground 96
             .db $82, $b2, $83, $b3 ;w8 rock ground bottom 97
			 .db $48, $26, $48, $26 ;water/lava top block 98
			 .db $88, $32, $88, $33 ;no coll mario floor enemies 99
             
Palette3_MTiles:
             .db $53, $55, $54, $56 ;question block (coin) c0
             .db $53, $55, $54, $56 ;question block (power-up) c1
             .db $72, $74, $73, $75 ;coin c2
             .db $c2, $c4, $c3, $c5 ;underwater coin c3
             .db $57, $59, $58, $5a ;empty block c4
             .db $7b, $7d, $7c, $7e ;axe c5
             .db $53, $55, $54, $56 ;question block (star) c6
             .db $53, $55, $54, $56 ;question block (1up) c7
             
             
             
             .db $88, $8c, $88, $8c ;sideways pipe shaft top c8
             .db $89, $8d, $69, $69 ;sideways pipe joint top c9
             .db $24, $93, $24, $93 ;sideways pipe shaft bottom ca
             .db $90, $94, $69, $69 ;sideways pipe joint bottom cb
             .db $60, $64, $61, $65 ;decoration pipe end left, points up cc
             .db $62, $66, $63, $67 ;decoration pipe end right, points up cd
             .db $68, $68, $69, $69 ;pipe shaft left ce
             .db $24, $24, $6a, $6a ;pipe shaft right cf
             .db $4f, $e5, $9f, $e6 ;decoration pipe end left, points down d0
             .db $9a, $e7, $bb, $e8 ;decoration pipe end right, points down d1
             
             .db $70, $32, $31, $33 ;w3 star d2
             .db $30, $71, $31, $33 ;w3 star d3
             .db $30, $32, $71, $33 ;w3 star d4
             .db $70, $32, $31, $71 ;w3 star d5
             
             .db $5b, $97, $5c, $98 ;w4,7 sand d6
             .db $26, $26, $6a, $6a ;pipe shaft right d7
             .db $26, $93, $26, $93 ;sideways pipe shaft bottom d8
             
             .db $24, $cf, $e9, $42 ;w4 palmtree 1 d9
             .db $ea, $44, $eb, $46 ;w4 palmtree 2 da
             .db $ce, $49, $24, $4a ;w4 palmtree 3 db
             
             .db $86, $8a, $87, $8b ;sideways pipe end top dc
             .db $8e, $91, $8f, $92 ;sideways pipe end bottom dd
             
             .db $82, $84, $83, $85 ;w5 cloud block de
             .db $99, $a4, $b0, $b1 ;w5 cloud ledge left edge df
             .db $4d, $95, $4d, $96 ;w5 cloud ledge middle e0
             .db $4d, $97, $a8, $98 ;w5 cloud ledge right edge e1
             .db $b0, $b2, $b1, $b3 ;w6 snow ground e2
             .db $82, $b2, $83, $b3 ;w6 snow ground bottom e3
             .db $82, $b2, $83, $b3 ;w6 snow ground bottom (hurts) e4
             .db $82, $b2, $83, $b3 ;w6 snow ground bottom (no collision) e5
             
             .db $85, $82, $83, $84 ;w7 desert sea plant e6
             .db $a4, $be, $95, $bf ;w7 tree trunk top e7
             .db $ab, $ac, $ad, $ae ;w7 solid block (3-d block) pal0 e8
             .db $9d, $ff, $9e, $ff ;w7 castle top pal0 e9
             .db $ff, $ff, $27, $27 ;w7 castle window left pal0 ea
             .db $ff, $ff, $ff, $ff ;w7 castle brick wall pal0 eb
             .db $27, $27, $ff, $ff ;w7 castle window right pal0 ec
             .db $a9, $ff, $aa, $ff ;w7 castle top w/ brick pal0 ed
             .db $9b, $27, $9c, $27 ;w7 entrance top pal0 ee
             .db $27, $27, $27, $27 ;w7 entrance bottom pal0 ef
             .db $ff, $ff, $ff, $ff ;w7 castle stop pal0 f0
             .db $80, $a0, $81, $a1 ;w7 fence pal0 f1
			 .db $b0, $b1, $b2, $b3 ;w7 sandstone f2
             
AreaParserTaskHandler:
             lda #%10000111
             sta Old8000
             sta $8000
             lda LevelBank
             clc
             adc #FirstLevelBank
             
             sta $8001
             lda #$01
             sta DecodingLevel
             lda AreaParserTaskNum
             bne +
             lda ScrollLeftFlag
             bne SkipATRender
+:              lda DisableScreenFlag2
             bne +
             lda DisableScreenFlag
             beq +
-:              jsr AreaParserCoreS
             jsr IncrementColumnPosS
             lda stopload
             beq -
             ldy #$00
             sty AreaParserTaskNum
             sty DecodingLevel
             sty $14
             iny
             sty DisableScreenFlag2
+:              ldy AreaParserTaskNum     ;check number of tasks here
             bne DoAPTasks             ;if already set, go ahead
             ;ldy Player_X_Scroll
             ;bmi SkipATRender
             ldy #$08
             sty AreaParserTaskNum     ;otherwise, set eight by default
DoAPTasks:    dey
             tya
             jsr AreaParserTasks
             dec AreaParserTaskNum     ;if all tasks not complete do not
             bne SkipATRender          ;render attribute table yet
             lda tempXD
             bne SkipATRender
+:            jmp RenderAttributeTables
SkipATRender: rts
NoThing:
             ;dec AreaParserTaskNum
             ;lda AreaParserTaskNum
             ;rts
AreaParserTasks:
             jsr JumpEngine
             
             .dw IncrementColumnPos
             .dw RenderAreaGraphics
             .dw RenderAreaGraphics
             .dw AreaParserCore
             .dw IncrementColumnPos
             .dw RenderAreaGraphics
             .dw RenderAreaGraphics
             .dw AreaParserCore
             
             .dw IncrementColumnPosS
             .dw AreaParserCore
             
RenderAreaGraphics:
             lda ScrollLeftLock
             sec
             sbc #$01
             cmp $fa
             beq ExitDrawM1
NoSkipATRender:            
             lda $ff         ;store LSB of where we're at
             and #$01
             sta $05
             lda olddirscroll
             eor #$01
             sta temp9
             ldy VRAM_Buffer2_Offset      ;store vram buffer offset
             sty $00
             lda CurrentNTAddr_Low        ;get current name table address we're supposed to render
             sec
             sbc temp9
             cmp #$7f
             bne +
             pha
             lda olddirscroll
             bne ++
             lda CurrentNTAddr_High
             eor #%00000100
             sta VRAM_Buffer2,y
             pla
             clc
             adc #$20
             sta VRAM_Buffer2+1,y
             jmp +++
ExitDrawM1: lda olddirscroll
             beq NoSkipATRender
             lda $63cb
             cmp #$07
             bcc @bru
             lda #$00
             sta tempXD
             jmp NoSkipATRender
@bru:        inc tempXD
             jmp SkipATRender
++:            pla
+:          sta VRAM_Buffer2+1,y
             lda CurrentNTAddr_High
             sta VRAM_Buffer2,y
+++:        lda #$9a                     ;store length byte of 26 here with d7 set
             sta VRAM_Buffer2+2,y         ;to increment by 32 (in columns)
             lda #$00                     ;init attribute row
             sta $04
             tax
DrawMTLoop: stx $01                      ;store init value of 0 or incremented offset for buffer
             sty temp9
             lda $ff
             and #$0f
             sta tempC
             sta $63cb
             txa
             asl
             asl
             asl
             asl
             clc
             adc tempC
             sta $02
             tay
             lda ($f9),y                  ;get first metatile number, and mask out all but 2 MSB
             ;cmp #$10
             ;beq ++
             ;cmp #$12
             ;bne +
++:            ;pha
             ;lda AreaParserTaskNum        ;get current task number for level processing and
             ;eor olddirscroll
             ;and #%00000001  
             ;jmp ++
             ;jsr FindEmptyEnemySlot   ;check for an empty moving data buffer space
             ;  bcs ++             ;if not found, too many enemies, thus skip
             ;  lda $fa
             ;  sub #$66
             ;; tay
             ;lda $ff
             ;and #$0f
             ;asl
             ;asl
             ;asl
             ;asl
             ;clc
             ;adc #$08                 ;add eight to put the piranha plant in the center
             ;sta Enemy_X_Position,x   ;store as enemy's horizontal coordinate
             ;tya
             ;adc #$00
             ;sta Enemy_PageLoc,x      ;store as enemy's page coordinate
             ;lda #$01
             ;sta Enemy_Y_HighPos,x
             ;sta Enemy_Flag,x         ;activate enemy flag
             ;lda $02                      ;get piranha plant's vertical coordinate and store here
             ;and #$f0
             ;clc
             ;adc #$20
             ;sta Enemy_Y_Position,x
             ;lda #PiranhaPlant
             ;sta Enemy_ID,x
             ;jsr InitPiranhaPlant1
             ;ldy $02
++:            ;pla
+:            pha
             pha
             and #%11000000
             ;sta $03                      ;store attribute table bits here
asl                          ;note that metatile format is:
             rol                          ;%xx000000 - attribute table bits, 
             rol                          ;%00xxxxxx - metatile number
             tay                          ;rotate bits to d1-d0 and use as offset here
             lda MetatileGraphics_Low,y   ;get address to graphics table from here
             sta $06
             lda MetatileGraphics_High,y
             sta $07
             sty temp9
             pla
             tay
             lda PaletteMTtable,y
             lsr
             ror
             ror
             sta $03
             
             txa
             tay
             pla                             ;get metatile number again
             asl                          ;multiply by 4 and use as tile offset
             asl
             sta $02
             ldy temp9
             lda AreaParserTaskNum        ;get current task number for level processing and
             eor olddirscroll
             and #%00000001               ;mask out all but LSB, then invert LSB, multiply by 2
             ;eor #%00000001               ;to get the correct column position in the metatile,
             asl                          ;then add to the tile offset so we can draw either side
             adc $02                      ;of the metatiles
             tay
             ldx $00                      ;use vram buffer offset from before as X
             lda ($06),y
             sta VRAM_Buffer2+3,x         ;get first tile number (top left or top right) and store
             iny
             lda ($06),y                  ;now get the second (bottom left or bottom right) and store
             sta VRAM_Buffer2+4,x
             ldy $04                      ;get current attribute row
             lda $05                      ;get LSB of current column where we're at, and
             bne RightCheck               ;branch if set (clear = left attrib, set = right)
             lda $01                      ;get current row we're rendering
             lsr                          ;branch if LSB set (clear = top left, set = bottom left)
             bcs LLeft
             rol $03                      ;rotate attribute bits 3 to the left
             rol $03                      ;thus in d1-d0, for upper left square
             rol $03
             jmp SetAttrib
RightCheck: lda $01                      ;get LSB of current row we're rendering
             lsr                          ;branch if set (clear = top right, set = bottom right)
             bcs NextMTRow
             lsr $03                      ;shift attribute bits 4 to the right
             lsr $03                      ;thus in d3-d2, for upper right square
             lsr $03
             lsr $03
             jmp SetAttrib
DrawMTLoop1: jmp DrawMTLoop
LLeft:      lsr $03                      ;shift attribute bits 2 to the right
             lsr $03                      ;thus in d5-d4 for lower left square
NextMTRow:  inc $04                      ;move onto next attribute row  
SetAttrib:  lda AttributeBuffer,y        ;get previously saved bits from before
             ora $03                      ;if any, and put new bits, if any, onto
             sta AttributeBuffer,y        ;the old, and store
             inc $00                      ;increment vram buffer offset by 2
             inc $00
             ldx $01                      ;get current gfx buffer row, and check for
             inx                          ;the bottom of the screen
             cpx #$0d
             bcc DrawMTLoop1               ;if not there yet, loop back
             ldy $00                      ;get current vram buffer offset, increment by 3
             iny                          ;(for name table address and length bytes)
             iny
             iny
             lda #$00
             sta VRAM_Buffer2,y           ;put null terminator at end of data for name table
             sty VRAM_Buffer2_Offset      ;store new buffer offset
             lda olddirscroll
             bne +
             dec CurrentNTAddr_Low
             lda CurrentNTAddr_Low
             bmi ExitDrawM
++:            lda #$9f
             sta CurrentNTAddr_Low
             jmp ++
+:          inc CurrentNTAddr_Low        ;increment name table address low
             lda CurrentNTAddr_Low        ;check current low byte
             and #%00011111               ;if no wraparound, just skip this part
             bne ExitDrawM
             lda #$80                     ;if wraparound occurs, make sure low byte stays
             sta CurrentNTAddr_Low        ;just under the status bar
++:         lda CurrentNTAddr_High       ;and then invert d2 of the name table address high
             eor #%00000100               ;to move onto the next appropriate name table
             sta CurrentNTAddr_High
ExitDrawM:  jmp SetVRAMCtrl              ;jump to set buffer to $0341 and leave
             
             
RenderAttributeTables:
             lda CurrentNTAddr_Low    ;get low byte of next name table address
             and #%00011111           ;to be written to, mask out all but 5 LSB,
             ldy olddirscroll
             bne +
             clc
             adc #$04
+:           sec                      ;subtract four 
             sbc #$04
             and #%00011111           ;mask out bits again and store
             sta $01
             lda CurrentNTAddr_High   ;get high byte and branch if borrow not set
             bcs SetATHigh
             eor #%00000100           ;otherwise invert d2
SetATHigh:   and #%00000100           ;mask out all other bits
             ora #$23                 ;add $2300 to the high byte and store
             sta $00
             lda $01                  ;get low byte - 4, divide by 4, add offset for
             lsr                      ;attribute table and store
             lsr
             adc #$c0                 ;we should now have the appropriate block of
             sta $01                  ;attribute table in our temp address
             ldx #$00
             ldy VRAM_Buffer2_Offset  ;get buffer offset
AttribLoop:  lda $00
             sta VRAM_Buffer2,y       ;store high byte of attribute table address
             lda $01
             clc                      ;get low byte, add 8 because we want to start
             adc #$08                 ;below the status bar, and store
             sta VRAM_Buffer2+1,y
             sta $01                  ;also store in temp again
             lda AttributeBuffer,x    ;fetch current attribute table byte and store
             sta VRAM_Buffer2+3,y     ;in the buffer
             lda #$01
             sta VRAM_Buffer2+2,y     ;store length of 1 in buffer
             lsr
             sta AttributeBuffer,x    ;clear current byte in attribute buffer
             iny                      ;increment buffer offset by 4 bytes
             iny
             iny
             iny
             inx                      ;increment attribute offset and check to see
             cpx #$07                 ;if we're at the end yet
             bcc AttribLoop
             sta VRAM_Buffer2,y       ;put null terminator at the end
             sty VRAM_Buffer2_Offset  ;store offset in case we want to do any more
SetVRAMCtrl: lda #$06
             sta VRAM_Buffer_AddrCtrl ;set buffer to $0341 and leave
-:           rts
             
             
             lda $fc
             bne +
             sta $fb
             lda #$66
             sta $fc
+:            
             lda $fc
             cmp #$76
             beq ++
             inc $fb
             lda $fb
             cmp #$10
             bcc +
             lda #$00
             sta $fb
             inc $fc
             
+: 
++:    
IncrementColumnPosS:       
             inc CurrentColumnPos     ;increment column where we're at
             lda CurrentColumnPos
             and #%00001111           ;mask out higher nybble
             bne +
             sta CurrentColumnPos     ;if no bits left set, wrap back to zero (0-f)
             inc CurrentPageLoc       ;and increment page number where we're at
+:           inc BlockBufferColumnPos ;increment column offset where we're at
-:         rts
IncrementColumnPos:
             lda scrolldir
             beq DecrementColumnPos
             lda #$00
             sta temp9
             lda olddirscroll
             bne +
             inc $fa
             inc $fa
             lda $ff
             and #$0f
             cmp #$0f
             bne oke1
             inc $fa
oke1:       lda tempXD
             bne ++
             dec $ff
             lda #$01
             sta temp9
             jmp +
++:           inc $ff
+:           lda #$01
             sta olddirscroll
             lda tempXD
             bne -
             ;inc CurrentColumnPos
             ;lda temp9
             ;bne +
             lda iwantdie
             bne +
             lda $ff
             and #$0f
             cmp #$0f
             bne +
             inc $fa
+:           inc $ff
             lda iwantdie
             beq +
             dec iwantdie
+:           lda #$00
             sta temp9
             rts
             
DecrementColumnPos:
             ;inc ColumnSets
             ;dec CurrentNTAddr_Low
             lda olddirscroll
             beq +
             dec $fa
             dec $fa
             lda $ff
             and #$0f
             ;cmp #$00
             bne oke
             dec $fa
             inc iwantdie
oke:       lda tempXD
             bne eadoek
             inc $ff
             
             jmp +
eadoek:    dec $ff
+:           sta temp9
             lda #$00
             sta olddirscroll
             lda tempXD
             bne ++
             lda $ff
             and #$0f
             ;cmp #$00
             bne +
aeujh:       lda iwantdie
             bne +
             dec $fa
+:           dec $ff     ;increment column where we're at
             lda iwantdie
             beq +
             dec iwantdie
+:           lda #$00
             sta temp9
             inc BlockBufferColumnPos
++:        rts
             
             
BSceneDataOffsets:
             
BackSceneryData:
             
BackSceneryMetatiles:
             
FSceneDataOffsets:
             
ForeSceneryData:
             
TerrainMetatiles:
             
TerrainRenderBits:
-:    lda #$01
             sta stopload
             lsr
             sta tempA
             rts
AreaParserCore:
             lda AreaParserTaskNum
             cmp #$08
             bne +
             inc tempXD
             jsr IncrementColumnPos
             dec tempXD
+:      rts
AreaParserCoreS:
             lda $fc
             cmp #$76
             beq -
             lda BackloadingFlag       ;check to see if we are starting right of start
             beq RenderSceneryTerrain  ;if not, go ahead and render background, foreground and terrain
             jsr ProcessAreaData       ;otherwise skip ahead and load level data
             
RenderSceneryTerrain:
             jmp ProcessAreaData
BlockBuffLowBounds:
             ;.db $10, $51, $88, $c0
             
RdyDecode1:
             rts
LevelBanks:
             lda $fc
             sec
             sbc #$66
             sta tempA
             ldy AreaDataOffset
             lda (AreaData),y
             cmp #$ff
             beq RdyDecode1
             
             
             
             
             
             rts
             
ProcessAreaData:
             jsr DecodeAreaData
             
             inc AreaDataOffset
             inc AreaDataOffset
             
             lda AreaDataOffset
             bpl ++
             sec
             sbc #$40
             sta AreaDataOffset
             
             lda #$3f
             adc AreaData
             sta AreaData
             bcc +
             inc AreaDataHigh
+:            
             ldy #$c0
             ldx #$0d
-:    
             tya
             clc
             adc AreaObjOffsetBuffer,x
             sta AreaObjOffsetBuffer,x
             dex
             bpl -
             
++:          
EndAParse:  rts
ProcessAreaData2:
             ;jmp ProcessAreaData 
BehindAreaIncrement:                ;do things to get correct offset
             ldy AreaDataOffset
             lda (AreaData),y
             and #%00001111
             cmp #$0f
             bne +++
             iny
             lda (AreaData),y
             and #%01110000
             lsr
             lsr
             lsr
             lsr
             cmp #$07
             beq ++
             cmp #$06
             beq +
             cmp #$05
             beq +
+++:      rts
++:          inc AreaDataOffset
             inc AreaDataOffset
             lda #$00              ;reset page select
             sta AreaObjectPageSel
             rts
+:        inc AreaDataOffset
             lda #$00              ;reset page select
             sta AreaObjectPageSel
             rts
D4Bytes:
             ;inc AreaDataOffset
D3Bytes:
             ;inc AreaDataOffset
IncAreaObjOffset:
             inc AreaDataOffset
             inc AreaDataOffset
             lda #$00              ;reset page select
             sta AreaObjectPageSel
XD:      rts
             
             --        inc stopload
             rts
             
StarTable:
             .db $d2, $d3, $d4, $d5
DecodeAreaData:          
             
             
             ldy AreaDataOffset
             lda (AreaData),y
             cmp #$fd
             bne +
             ldy #$00
             -          lda #$00
             sta ($fb),y
             dex
             lda $fb
             clc
             adc #$01
             sta $fb
             cmp #$d0
             bcc ++
             lda $fc
             clc
             adc #$01
             sta $fc
             cmp #$76
             bcs --
             lda #$00
             sta $fb
++:          jmp -
             
             
             
+:          tax
             iny
             lda (AreaData),y
             sta $03
             
             ldy #$00
             -          lda $03
             bne +
             lda BackgroundColorCtrl
             beq +
             sty $01
             stx $02
             jsr RNG_call
             and #%00111111
             cmp #$04
             bcs ++
             tay 
             lda StarTable,y
             .db $2c
++:          lda #$00
             ldx $02
             ldy $01
+:          
             sta ($fb),y
             dex
             lda $fb
             clc
             adc #$01
             sta $fb
             cmp #$d0
             bcc +
             lda $fc
             clc
             adc #$01
             sta $fc
             cmp #$76
             bcs --
             lda #$00
             sta $fb
+:          cpx #$ff
             bne -
             
             
             
             
             
             
             
             rts
             
             jsr JumpEngine             ;run the object!
             
             
             
             
StopFrenzy:
             lda #$00
             sta LakituRespawning
             jmp AreaFrenzy
AlterAreaAttributes:
             ldy AreaObjOffsetBuffer,x ;load offset for level object data saved in buffer
             iny                       ;load second byte
             lda (AreaData),y
             pha                       ;save in stack for now
             and #%01000000
             bne Alter2                ;branch if d6 is set
             pla
             pha                       ;pull and push offset to copy to A
             and #%00001111            ;mask out high nybble and store as
             sta TerrainControl        ;new terrain height type bits
             pla
             and #%00110000            ;pull and mask out all but d5 and d4
             lsr                       ;move bits to lower nybble and store
             lsr                       ;as new background scenery bits
             lsr
             lsr
             sta BackgroundScenery     ;then leave
             rts
Alter2:  pla
             and #%00000111            ;mask out all but 3 LSB
             cmp #$04                  ;if four or greater, set color control bits
             bcc SetFore               ;and nullify foreground scenery bits
             sta BackgroundColorCtrl
             lda #$00
SetFore: sta ForegroundScenery     ;otherwise set new foreground scenery bits
             rts
             
             
ScrollLockObject_Warp:
             lda ScrollLockPageLoc
             cmp #$ff
             bne +
             lda CurrentPageLoc
             clc
             adc #$66
             cmp $fa
             bcc +
             clc
             sta ScrollLockPageLoc
             lda CurrentColumnPos
             clc
             adc #$02
             sta ScrollLockColumnPos
             lda #$01
             sta WarpZoneCheck
             rts
             
ScrollLockObject:
             lda ScrollLockPageLoc
             cmp #$75
             bne +
             lda CurrentPageLoc
             clc
             adc #$66
             cmp $fa
             bcc +
             sta ScrollLockPageLoc
             lda CurrentColumnPos
             clc
             adc #$01
             sta ScrollLockColumnPos
+:      rts
             
             
FrenzyIDData:
             .db FlyCheepCheepFrenzy, BBill_CCheep_Frenzy, Stop_Frenzy
             
AreaFrenzy:  ldx $00               ;use area object identifier bit as offset
             lda FrenzyIDData-8,x  ;note that it starts at 8, thus weird address here
             ldy #$05
FreCompLoop: dey                   ;check regular slots of enemy object buffer
             bmi ExitAFrenzy       ;if all slots checked and enemy object not found, branch to store
             cmp Enemy_ID,y        ;check for enemy object in buffer versus frenzy object
             bne FreCompLoop
             lda #$00              ;if enemy object already present, nullify queue and leave
ExitAFrenzy: sta EnemyFrenzyQueue  ;store enemy into frenzy queue
             rts
             
             
AreaStyleObject:
             lda AreaStyle        ;load level object style and jump to the right sub
             jsr JumpEngine 
             .dw TreeLedge        ;also used for cloud type levels
             .dw MushroomLedge
             .dw BulletBillCannon
             
TreeLedge:
             jsr GetLrgObjAttrib     ;get row and length of green ledge
             lda AreaObjectLength,x  ;check length counter for expiration
             beq EndTreeL   
             bpl MidTreeL
             tya
             sta AreaObjectLength,x  ;store lower nybble into buffer flag as length of ledge
             lda CurrentPageLoc
             ora CurrentColumnPos    ;are we at the start of the level?
             beq MidTreeL
             lda #$16                ;render start of tree ledge
             jmp NoUnder
MidTreeL: ldx $07
             lda #$17                ;render middle of tree ledge
             sta MetatileBuffer,x    ;note that this is also used if ledge position is
             lda #$4c                ;at the start of level for continuous effect
             jmp AllUnder            ;now render the part underneath
EndTreeL: lda #$18                ;render end of tree ledge
             jmp NoUnder
             
MushroomLedge:
             jsr ChkLrgObjLength        ;get shroom dimensions
             sty $06                    ;store length here for now
             bcc EndMushL
             lda AreaObjectLength,x     ;divide length by 2 and store elsewhere
             lsr
             sta MushroomLedgeHalfLen,x
             lda #$19                   ;render start of mushroom
             jmp NoUnder
EndMushL: lda #$1b                   ;if at the end, render end of mushroom
             ldy AreaObjectLength,x
             beq NoUnder
             lda MushroomLedgeHalfLen,x ;get divided length and store where length
             sta $06                    ;was stored originally
             ldx $07
             lda #$1a
             sta MetatileBuffer,x       ;render middle of mushroom
             cpy $06                    ;are we smack dab in the center?
             bne MushLExit              ;if not, branch to leave
             inx
             lda #$4f
             sta MetatileBuffer,x       ;render stem top of mushroom underneath the middle
             lda #$50
AllUnder: inx
             ldy #$0f                   ;set $0f to render all way down
             jmp RenderUnderPart        ;now render the stem of mushroom
NoUnder:  ldx $07                    ;load row of ledge
             ldy #$00                   ;set 0 for no bottom on this part
             jmp RenderUnderPart
             
             
PulleyRopeMetatiles:
             .db $42, $41, $43
             
PulleyRopeObject:
             jsr ChkLrgObjLength       ;get length of pulley/rope object
             ldy #$00                  ;initialize metatile offset
             bcs RenderPul             ;if starting, render left pulley
             iny
             lda AreaObjectLength,x    ;if not at the end, render rope
             bne RenderPul
             iny                       ;otherwise render right pulley
RenderPul: lda PulleyRopeMetatiles,y
             sta MetatileBuffer        ;render at the top of the screen
MushLExit: rts                       ;and leave
             
             
CastleMetatiles:
             .db $00, $45, $45, $45, $00
             .db $00, $48, $47, $46, $00
             .db $45, $49, $49, $49, $45
             .db $47, $47, $4a, $47, $47
             .db $47, $47, $4b, $47, $47
             .db $49, $49, $49, $49, $49
             .db $47, $4a, $47, $4a, $47
             .db $47, $4b, $47, $4b, $47
             .db $47, $47, $47, $47, $47
             .db $4a, $47, $4a, $47, $4a
             .db $4b, $47, $4b, $47, $4b
             
CastleObject:
             jsr GetLrgObjAttrib      ;save lower nybble as starting row
             sty $07                  ;if starting row is above $0a, game will crash!!! ok bummer
             cpy #0b
             bcs +
             ldy #$0a
             sty $07
+:          ldy #$04
             jsr ChkLrgObjFixedLength ;load length of castle if not already loaded
             txa                  
             pha                      ;save obj buffer offset to stack
             ldy AreaObjectLength,x   ;use current length as offset for castle data
             ldx $07                  ;begin at starting row
             lda #$0b
             sta $06                  ;load upper limit of number of rows to print
CRendLoop:  lda CastleMetatiles,y    ;load current byte using offset
             sta MetatileBuffer,x
             inx                      ;store in buffer and increment buffer offset
             lda $06
             beq ChkCFloor            ;have we reached upper limit yet?
             iny                      ;if not, increment column-wise
             iny                      ;to byte in next row
             iny
             iny
             iny
             dec $06                  ;move closer to upper limit
ChkCFloor:  cpx #$0b                 ;have we reached the row just before floor?
             bne CRendLoop            ;if not, go back and do another row
             pla
             tax                      ;get obj buffer offset from before
             lda CurrentPageLoc
             beq ExitCastle           ;if we're at page 0, we do not need to do anything else
             lda AreaObjectLength,x   ;check length
             cmp #$01                 ;if length almost about to expire, put brick at floor
             beq PlayerStop
             ldy $07                  ;check starting row for tall castle ($00)
             bne NotTall
             cmp #$03                 ;if found, then check to see if we're at the second column
             beq PlayerStop
NotTall:    cmp #$02                 ;if not tall castle, check to see if we're at the third column
             bne ExitCastle           ;if we aren't and the castle is tall, don't create flag yet
             rts
PlayerStop: ldy #$70                 ;put brick at floor to stop player at end of level
             sty MetatileBuffer+10    ;this is only done if we're on the second column
ExitCastle: rts
             
             
WaterPipe:
             jsr GetLrgObjAttrib     ;get row and lower nybble
             ldy AreaObjectLength,x  ;get length (residual code, water pipe is 1 col thick)
             ldx $07                 ;get row
             lda #$6b
             sta MetatileBuffer,x    ;draw something here and below it
             lda #$6c
             sta MetatileBuffer+1,x
             rts
             
             
IntroPipe:
             ldy #$03                 ;check if length set, if not set, set it
             jsr ChkLrgObjFixedLength
             ldy #$0a                 ;set fixed value and render the sideways part
             jsr RenderSidewaysPipe
             bcs NoBlankP             ;if carry flag set, not time to draw vertical pipe part
             ldx #$06                 ;blank everything above the vertical pipe part
VPipeSectLoop: lda #$00                 ;all the way to the top of the screen
             sta MetatileBuffer,x     ;because otherwise it will look like exit pipe
             dex
             bpl VPipeSectLoop
             lda VerticalPipeData,y   ;draw the end of the vertical pipe part
             sta MetatileBuffer+7
NoBlankP:      rts
             
SidePipeShaftData:
             .db $15, $14  ;used to control whether or not vertical pipe shaft
             .db $00, $00  ;is drawn, and if so, controls the metatile number
SidePipeTopPart:
             .db $15, $1e  ;top part of sideways part of pipe
             .db $1d, $1c
SidePipeBottomPart: 
             .db $15, $21  ;bottom part of sideways part of pipe
             .db $20, $1f
SidePipeBottomPartW:
             .db $15, $21  ;bottom part of sideways part of pipe
             .db $3e, $1f
             
ExitPipe:
             ldy #$03                 ;check if length set, if not set, set it
             jsr ChkLrgObjFixedLength
             jsr GetLrgObjAttrib      ;get vertical length, then plow on through RenderSidewaysPipe
             
RenderSidewaysPipe:
             dey                       ;decrement twice to make room for shaft at bottom
             dey                       ;and store here for now as vertical length
             sty $05
             ldy AreaObjectLength,x    ;get length left over and store here
             sty $06
             ldx $05                   ;get vertical length plus one, use as buffer offset
             inx
             lda SidePipeShaftData,y   ;check for value $00 based on horizontal offset
             ;cmp #$00
             beq DrawSidePart          ;if found, do not draw the vertical pipe shaft
             ldx #$00
             ldy $05                   ;init buffer offset and get vertical length
             jsr RenderUnderPart       ;and render vertical shaft using tile number in A
             clc                       ;clear carry flag to be used by IntroPipe
DrawSidePart: ldy $06                   ;render side pipe part at the bottom
             lda SidePipeTopPart,y
             sta MetatileBuffer,x      ;note that the pipe parts are stored
             lda AreaType
             bne +
             lda SidePipeBottomPartW,y
             sta MetatileBuffer+1,x
             rts
+:            lda SidePipeBottomPart,y  ;backwards horizontally
             sta MetatileBuffer+1,x
             rts
             
VerticalPipeData:
             .db $11, $10 ;used by pipes that lead somewhere
             .db $15, $14
             .db $13, $12 ;used by decoration pipes
             .db $15, $14
             .db $2d, $2c ;used by upside-down pipes
             .db $2f, $2e ;used by upside-down pipes (enterable)
             
VerticalPipeDataUW:
             .db $11, $10 ;used by pipes that lead somewhere
             .db $3d, $14
             .db $13, $12 ;used by decoration pipes
             .db $3d, $14
             .db $2d, $2c ;used by upside-down pipes
             .db $2f, $2e ;used by upside-down pipes (enterable)
VerticalPipe:
             pha
             lda AreaType
             beq VerticalPipeUW
             pla
             jsr GetPipeHeight
             lda $00                  ;check to see if value was nullified earlier
             beq WarpPipe             ;(if d3, the usage control bit of second byte, was set)
             iny
             iny
             iny
             iny                      ;add four if usage control bit was not set
WarpPipe: tya                      ;save value in stack
             pha
             if Enablew1l1PiranhaPlants !=1
             lda AreaNumber
             ora WorldNumber          ;if at world 1-1, do not add piranha plant ever
             beq DrawPipe
             endif
             ;lda AreaType
             ;beq DrawPipe
             
             lda DisableScreenFlag2
             beq DrawPipe
             ldy AreaObjectLength,x   ;if on second column of pipe, branch
             beq DrawPipe             ;(because we only need to do this once)
             jsr FindEmptyEnemySlot   ;check for an empty moving data buffer space
             bcs DrawPipe             ;if not found, too many enemies, thus skip
             jsr GetAreaObjXPosition  ;get horizontal pixel coordinate
             clc
             adc #$08                 ;add eight to put the piranha plant in the center
             sta Enemy_X_Position,x   ;store as enemy's horizontal coordinate
             lda CurrentPageLoc       ;add carry to current page number
             adc #$00
             sta Enemy_PageLoc,x      ;store as enemy's page coordinate
             lda #$01
             sta Enemy_Y_HighPos,x
             sta Enemy_Flag,x         ;activate enemy flag
             jsr GetAreaObjYPosition  ;get piranha plant's vertical coordinate and store here
             sta Enemy_Y_Position,x
             lda #PiranhaPlant        ;write piranha plant's value into buffer
             sta Enemy_ID,x
             jsr InitPiranhaPlant1
DrawPipe: pla                      ;get value saved earlier and use as Y
             tay
             ldx $07                  ;get buffer offset
             lda VerticalPipeData,y   ;draw the appropriate pipe with the Y we loaded earlier
             sta MetatileBuffer,x     ;render the top of the pipe
             inx
             lda VerticalPipeData+2,y ;render the rest of the pipe
             ldy $06                  ;subtract one from length and render the part underneath
             dey
             jmp RenderUnderPart
             
VerticalPipeUW:
             pla
             jsr GetPipeHeight
             lda $00                  ;check to see if value was nullified earlier
             beq WarpPip1             ;(if d3, the usage control bit of second byte, was set)
             iny
             iny
             iny
             iny                      ;add four if usage control bit was not set
WarpPip1: tya                      ;save value in stack
             pha
             if Enablew1l1PiranhaPlants !=1
             lda AreaNumber
             ora WorldNumber          ;if at world 1-1, do not add piranha plant ever
             beq DrawPip1
             endif
             ;lda AreaType
             ;beq DrawPipe
             lda DisableScreenFlag2
             beq DrawPip1
             ldy AreaObjectLength,x   ;if on second column of pipe, branch
             beq DrawPip1             ;(because we only need to do this once)
             jsr FindEmptyEnemySlot   ;check for an empty moving data buffer space
             bcs DrawPip1             ;if not found, too many enemies, thus skip
             jsr GetAreaObjXPosition  ;get horizontal pixel coordinate
             clc
             adc #$08                 ;add eight to put the piranha plant in the center
             sta Enemy_X_Position,x   ;store as enemy's horizontal coordinate
             lda CurrentPageLoc       ;add carry to current page number
             adc #$00
             sta Enemy_PageLoc,x      ;store as enemy's page coordinate
             lda #$01
             sta Enemy_Y_HighPos,x
             sta Enemy_Flag,x         ;activate enemy flag
             jsr GetAreaObjYPosition  ;get piranha plant's vertical coordinate and store here
             sta Enemy_Y_Position,x
             lda #PiranhaPlant        ;write piranha plant's value into buffer
             sta Enemy_ID,x
             jsr InitPiranhaPlant1
DrawPip1: pla                      ;get value saved earlier and use as Y
             tay
             ldx $07                  ;get buffer offset
             lda VerticalPipeDataUW,y   ;draw the appropriate pipe with the Y we loaded earlier
             sta MetatileBuffer,x     ;render the top of the pipe
             inx
             lda VerticalPipeDataUW+2,y ;render the rest of the pipe
             ldy $06                  ;subtract one from length and render the part underneath
             dey
             jmp RenderUnderPart
             
GetPipeHeight:
             ldy #$01       ;check for length loaded, if not, load
             jsr ChkLrgObjFixedLength ;pipe length of 2 (horizontal)
             jsr GetLrgObjAttrib
             tya            ;get saved lower nybble as height
             and #$0f       ;save only the three lower bits as
             sta $06        ;vertical length, then load Y with
             ldy AreaObjectLength,x    ;length left over
             rts
             
UpsideDownWarpPipe:
             lda AreaType
             beq UpsideDownWarpPipeUW
             lda #$01
             sta tempB
             jmp +
UpsideDownPipe:
             lda AreaType
             beq UpsideDownPipeUW
             lda #$00
             sta tempB
+:     txa
             pha
             lda ExtendedLength,x
             pha
             jsr GetPipeHeight           ;get pipe height from object byte
             pla
             sta $07                      ;save buffer offset temporarily
             pla
             tax
             tya
             pha                          ;save pipe height temporarily
             if Enablew1l1PiranhaPlants
             else
             lda AreaNumber
             ora WorldNumber          ;if at world 1-1, do not add piranha plant ever
             beq NoUDP
             endif
             ;lda AreaType
             ;beq NoUDP
NoUDP: pla
             tay                          ;return tile offset
             pha
             ldx $07
             lda VerticalPipeData+2,y
             ldy $06                      ;render the pipe shaft
             dey
             jsr RenderUnderPart
             pla
             tay
             lda tempB
             bne +
             lda VerticalPipeData+8,y     ;and render the pipe end
             sta MetatileBuffer,x
             rts
+:       lda VerticalPipeData+10,y     ;and render the pipe end
             sta MetatileBuffer,x
             rts
UpsideDownWarpPipeUW:
             lda #$01
             sta tempB
             jmp +
UpsideDownPipeUW:
             lda #$00
             sta tempB
+:     txa
             pha
             lda ExtendedLength,x
             pha
             jsr GetPipeHeight           ;get pipe height from object byte
             pla
             sta $07                      ;save buffer offset temporarily
             pla
             tax
             tya
             pha                          ;save pipe height temporarily
             if Enablew1l1PiranhaPlants
             else
             lda AreaNumber
             ora WorldNumber          ;if at world 1-1, do not add piranha plant ever
             beq NoUD1
             endif
             ;lda AreaType
             ;beq NoUDP
             ldy AreaObjectLength,x       ;if on second column of pipe, skip this
             beq NoUD1
             jsr FindEmptyEnemySlot       ;otherwise try to insert upside-down
             bcs NoUD1                    ;piranha plant, if no empty slots, skip this
             jsr SetupPiranhaPlant        ;set up upside-down piranha plant
             lda $06
             asl
             asl                          ;multiply height of pipe by 16
             asl                          ;and add enemy Y position previously set up
             asl                          ;then subtract 10 pixels, save as new Y position
             clc
             adc Enemy_Y_Position,x
             sec
             sbc #$0a
             sta Enemy_Y_Position,x
             sta PiranhaPlantUpYPos,x     ;set as "down" position
             clc                          ;add 24 pixels, save as "up" position
             adc #$18                     ;note up and down here are reversed
             sta PiranhaPlantDownYPos,x     
             inc PiranhaPlant_MoveFlag,x  ;set movement flag
NoUD1: pla
             tay                          ;return tile offset
             pha
             ldx $07
             lda VerticalPipeDataUW+2,y
             ldy $06                      ;render the pipe shaft
             dey
             jsr RenderUnderPart
             pla
             tay
             lda tempB
             bne +
             lda VerticalPipeDataUW+8,y     ;and render the pipe end
             sta MetatileBuffer,x
             rts
+:       lda VerticalPipeDataUW+10,y     ;and render the pipe end
             sta MetatileBuffer,x
             rts
FindEmptyEnemySlot:
             ldx #$00          ;start at first enemy slot
EmptyChkLoop: clc               ;clear carry flag by default
             lda Enemy_Flag,x  ;check enemy buffer for nonzero
             beq ExitEmptyChk  ;if zero, leave
             inx
             cpx #$05          ;if nonzero, check next value
             bne EmptyChkLoop
ExitEmptyChk: rts               ;if all values nonzero, carry flag is set
             
             SetupPiranhaPlant
             lda #UDPiranhaPlant
             sta Enemy_ID,x
             jsr GetAreaObjXPosition  ;get horizontal pixel coordinate
             clc
             adc #$08                 ;add eight to put the piranha plant in the center
             sta Enemy_X_Position,x   ;store as enemy's horizontal coordinate
             lda CurrentPageLoc       ;add carry to current page number
             adc #$00
             sta Enemy_PageLoc,x      ;store as enemy's page coordinate
             lda #$01
             sta Enemy_Y_HighPos,x
             sta Enemy_Flag,x         ;activate enemy flag
             jsr GetAreaObjYPosition  ;get piranha plant's vertical coordinate and store here
             sta Enemy_Y_Position,x
             jmp InitUDPiranhaPlant1
Hole_Water:
             jsr ChkLrgObjLength   ;get low nybble and save as length
             lda #$90
             sta MetatileBuffer+10
             ldx #$0b
             ldy #$01              ;now render the water underneath
             lda #$91
             jmp RenderUnderPart
             
             
QuestionBlockRow_High:
             lda #$03    ;start on the fourth row
             .db $2c     ;BIT instruction opcode
             
QuestionBlockRow_Low:
             lda #$07             ;start on the eighth row
             pha                  ;save whatever row to the stack for now
             jsr ChkLrgObjLength  ;get low nybble and save as length
             pla
             tax                  ;render question boxes with coins
             lda #$c0
             sta MetatileBuffer,x
             rts
             
Bridge_High:
             lda #$06  ;start on the seventh row from top of screen
             .db $2c   ;BIT instruction opcode
             
Bridge_Middle:
             lda #$07  ;start on the eighth row
             .db $2c   ;BIT instruction opcode
             
Bridge_Low:
             lda #$09             ;start on the tenth row
             pha                  ;save whatever row to the stack for now
+:    jsr ChkLrgObjLength  ;get low nybble and save as length
             pla
             tax                  ;render bridge railing
             lda #$0b
             sta MetatileBuffer,x
             inx
             ldy #$00             ;now render the bridge itself
             lda #$63
             jmp RenderUnderPart
             
             
             ;     jmp RenderUnderPart
             
             
FlagpoleObject:
             lda #$24                 ;render flagpole ball on top
             sta MetatileBuffer
             ldx #$01                 ;now render the flagpole shaft
             ldy #$08
             lda #$25
             jsr RenderUnderPart
             lda #$61                 ;render solid block at the bottom
             sta MetatileBuffer+10
             lda CurrentPageLoc
             add #$66
             sta FlagpoleEnemyPage
             lda CurrentColumnPos
             sta FlagpoleEnemyCol
             rts
             
             
EndlessRope:
             ldx #$00       ;render rope from the top to the bottom of screen
             ldy #$0f
             jmp DrawRope
             
BalancePlatRope:
             txa                 ;save object buffer offset for now
             pha
             ldx #$01            ;blank out all from second row to the bottom
             ldy #$0f            ;with blank used for balance platform rope
             lda #$44
             jsr RenderUnderPart
             pla                 ;get back object buffer offset
             tax
             jsr GetLrgObjAttrib ;get vertical length from lower nybble
             ldx #$01
DrawRope: lda #$40            ;render the actual rope
             jmp RenderUnderPart
             
RowOfCoins:
             ldy AreaType            ;get area type
             lda #$c2                   ;load appropriate coin metatile
             jmp GetRow
             
             
C_ObjectRow:
             .db $06, $07, $08
             
C_ObjectMetatile:
             .db $c5, $0c, $89
             
CastleBridgeObj:
             ldy #$0c                  ;load length of 13 columns
             jsr ChkLrgObjFixedLength
             jmp ChainObj
             
AxeObj:
             lda #$08                  ;load bowser's palette into sprite portion of palette
             sta VRAM_Buffer_AddrCtrl
             
ChainObj:
             ldy $00                   ;get value loaded earlier from decoder
             ldx C_ObjectRow-2,y       ;get appropriate row and metatile for object
             lda C_ObjectMetatile-2,y
             jmp ColObj
             
EmptyBlock:
             jsr GetLrgObjAttrib  ;get row location
             ldx $07
             lda #$c4
ColObj: ldy #$00             ;column length of 1
             jmp RenderUnderPart
             
             
SolidBlockMetatiles:
             .db $69, $61, $61, $62
             
BrickMetatiles:
             .db $22, $51, $52, $28
             .db $88 ;used only by row of bricks object
             
CustomMTObject:
             lda ExtendedMetatile,x
             cmp #$36
             beq SidewayPipeRight
             cmp #$20
             beq SidewayPipeLeft
             pha
             jsr ChkLrgObjLength        ;get row number, load length
             ldy ExtendedHeight,x
             sty $06
             lda ExtendedLength,x
             tax
             pla
             cmp #$1d
             beq SidewayPipeShaft
             cmp #$90
             beq WaterXD
             jmp RenderUnderPart
SidewayPipeShaft:
             ldy #$00
             jsr RenderUnderPart
             iny
             ;lda AreaType
             ;bne +
             lda #$20
             jmp RenderUnderPart
WaterXD:
             lda #$90
             sta MetatileBuffer,x
             dey
             inx
             lda #$91
             jmp RenderUnderPart
SidewayPipeRight:
             jsr ChkLrgObjLength
             sty $06
             bcc +
             ldy #$00
             jmp ++
+:      ldy #$02
++:
             lda ExtendedLength,x
             tax
             lda AreaType
             bne +
             lda webos2,y
             sta MetatileBuffer,x
             lda webos2+1,y
             sta MetatileBuffer+1,x
             rts
+:    lda webos,y
             sta MetatileBuffer,x
             lda webos+1,y
             sta MetatileBuffer+1,x
             ;dec AreaObjectLength,x
             rts
webos:
             .db $36, $37
             .db $1d, $20
webos2:
             .db $36, $37
             .db $1d, $3e
SidewayPipeLeft:
             jsr ChkLrgObjLength
             sty $06
             beq +
             ldy #$02
             jmp ++
+:      ldy #$00
++:
             lda ExtendedLength,x
             tax
             lda AreaType
             bne +
             lda webos2,y
             sta MetatileBuffer,x
             lda webos2+1,y
             sta MetatileBuffer+1,x
             rts
+:      lda webos,y
             sta MetatileBuffer,x
             lda webos+1,y
             sta MetatileBuffer+1,x
             ;dec AreaObjectLength,x
             rts
RowOfBricks:
             ldy AreaType           ;load area type obtained from area offset pointer
             lda CloudTypeOverride  ;check for cloud type override
             beq DrawBricks
             ldy #$04               ;if cloud type, override area type
DrawBricks: lda BrickMetatiles,y   ;get appropriate metatile
             jmp GetRow             ;and go render it
             
RowOfSolidBlocks:
             ldy AreaType               ;load area type obtained from area offset pointer
             lda SolidBlockMetatiles,y  ;get metatile
GetRow:  pha                        ;store metatile here
             jsr ChkLrgObjLength        ;get row number, load length
DrawRow: ldx $07
             ldy #$00                   ;set vertical height of 1
             pla
             jmp RenderUnderPart        ;render object
             
ColumnOfBricks:
             ;ldy AreaType          ;load area type obtained from area offset
             ;lda BrickMetatiles,y  ;get metatile (no cloud override as for row)
             ;jmp GetRow2
             lda ExtendedMetatile,x
             pha
             txa
             pha
             jsr ChkLrgObjLength
             bcc +
             inc AreaDataOffset
             ldy AreaDataOffset
             pla
             tax
             pla
             dey
             lda (AreaData),y
             sta ExtendedMetatile,x      
             jmp GetRow
+:      pla
             pla
             jmp GetRow
             
ColumnOfSolidBlocks:
             ldy AreaType               ;load area type obtained from area offset
             lda SolidBlockMetatiles,y  ;get metatile
GetRow2: pha                        ;save metatile to stack for now
             jsr GetLrgObjAttrib        ;get length and row
             pla                        ;restore metatile
             ldx $07                    ;get starting row
             jmp RenderUnderPart        ;now render the column
             
             
BulletBillCannon:
             jsr GetLrgObjAttrib      ;get row and length of bullet bill cannon
             ldx $07                  ;start at first row
             lda #$64                 ;render bullet bill cannon
             sta MetatileBuffer,x
             inx
             dey                      ;done yet?
             bmi SetupCannon
             lda #$65                 ;if not, render middle part
             sta MetatileBuffer,x
             inx
             dey                      ;done yet?
             bmi SetupCannon
             lda #$66                 ;if not, render bottom until length expires
             jsr RenderUnderPart
SetupCannon: ldx Cannon_Offset        ;get offset for data used by cannons and whirlpools
             jsr GetAreaObjYPosition  ;get proper vertical coordinate for cannon
             sta Cannon_Y_Position,x  ;and store it here
             lda CurrentPageLoc
             sta Cannon_PageLoc,x     ;store page number for cannon here
             jsr GetAreaObjXPosition  ;get proper horizontal coordinate for cannon
             sta Cannon_X_Position,x  ;and store it here
             inx
             cpx #$05                 ;increment and check offset
             bcc StrCOffset           ;if not yet reached sixth cannon, branch to save offset
             ldx #$00                 ;otherwise initialize it
StrCOffset:  stx Cannon_Offset        ;save new offset and leave
             rts
             
             
StaircaseHeightData:
             .db $07, $07, $06, $05, $04, $03, $02, $01, $00
             
StaircaseRowData:
             .db $03, $03, $04, $05, $06, $07, $08, $09, $0a
             
StaircaseObject:
             jsr ChkLrgObjLength       ;check and load length
             bcc NextStair             ;if length already loaded, skip init part
             lda #$09                  ;start past the end for the bottom
             sta StaircaseControl      ;of the staircase
NextStair: dec StaircaseControl      ;move onto next step (or first if starting)
             ldy StaircaseControl
             ldx StaircaseRowData,y    ;get starting row and height to render
             lda StaircaseHeightData,y
             tay
             lda #$61                  ;now render solid block staircase
             jmp RenderUnderPart
             
             
Jumpspring:
             inc AreaDataOffset
             ldy AreaDataOffset
             dey
             lda (AreaData),y             ;load third byte and store here
             pha
             jsr GetLrgObjAttrib
             ldx $07
             pla
             sta MetatileBuffer,x
ExitJumpspring:
             rts
             
             
QuestionBlock:
             ldy $00    ;get value saved from area parser routine ;get value from level decoder routine
             lda AreaType
             cmp #$03
             bne +
             cpy #$02
             bne +
++:      ldy #$11
+:      jmp DrawQBlk        ;go to render it
             
HiddenCoin:
             lda #$5f
             ldy AreaType
             beq ++
             cpy #$03
             bne +
             lda #$29
             .db $2c
++:      lda #$38
+:      pha
             jmp DHB
             
HiddenMushRoom:
             lda #$6f
             ldy AreaType
             beq ++
             cpy #$03
             bne +
             lda #$2b
             .db $2c
++:      lda #$3a
+:      pha
             jmp DHB
             
Hidden1UpBlock:
             lda #$60
             ldy AreaType
             beq ++
             cpy #$03
             bne +
             lda #$2a
             .db $2c
++:      lda #$39
+:      pha
DHB:  jsr GetLrgObjAttrib
             jmp DrawRow
QuestionBlock1Up:
             lda #$c7
             jmp +
QuestionBlockStar:
             lda #$c6
             jmp +
HiddenStar:
             lda #$73
             ldy AreaType
             beq ++
             cpy #$03
             bne +
             lda #$30
             .db $2c
++:      lda #$3b
+:      pha
             jmp DHB
BrickWithCoins:
             lda #$00                 ;initialize multi-coin timer flag
             sta BrickCoinTimerFlag
             jmp BrickWithCoins2
BrickWithItem:
             ldy $00                     ;get value saved from area parser routine         ;save area object ID
             sty $07              
             lda #$00                    ;load default adder for bricks with lines
             ldy AreaType                ;check level type for ground level
             dey
             beq BWithL                  ;if ground type, do not start with 5
             lda #$07                    ;otherwise use adder for bricks without lines
BWithL:   clc                         ;add object ID to adder
             adc $07
             tay                         ;use as offset for metatile
DrawQBlk: lda BrickQBlockMetatiles1,y ;get appropriate metatile for brick (question block)
             pha                         ;if branched to here from question block routine)
             jsr GetLrgObjAttrib         ;get row from location byte
             jmp DrawRow                 ;now render the object
             
             ;ldy $00    ;get value saved from area parser routine
             ;tay        ;save to Y
Bricks:
BrickPowerUp: .db $55, $55, $5a, $31
BrickVine:      .db $56, $56, $5b, $32
BrickStar:      .db $57, $57, $5c, $33
BrickCoins:      .db $58, $58, $5d, $34
Brick1up:      .db $59, $59, $5e, $35
             
BrickWithVine:
             ldy #$04
             jmp +
BrickWithStar:
             ldy #$08
             jmp +
BrickWithCoins2:
             ldy #$0c
             jmp +
BrickWith1up:
             ldy #$10
             jmp +
BrickWithPowerUp:
             ldy #$00
+:            tya
             add AreaType
             tay
             lda Bricks,y
             pha
             jmp DHB
             
HoleMetatiles:
             .db $91, $00, $00, $00
             
Hole_Empty:
             jsr ChkLrgObjLength          ;get lower nybble and save as length
             bcc NoWhirlP                 ;skip this part if length already loaded
             lda SwimmingFlag             ;check for water type level
             beq NoWhirlP                 ;if not water type, skip this part
             lda AreaType
             bne NoWhirlP
             ldx Whirlpool_Offset         ;get offset for data used by cannons and whirlpools
             jsr GetAreaObjXPosition      ;get proper vertical coordinate of where we're at
             sec
             sbc #$10                     ;subtract 16 pixels
             sta Whirlpool_LeftExtent,x   ;store as left extent of whirlpool
             lda CurrentPageLoc           ;get page location of where we're at
             sbc #$00                     ;subtract borrow
             sta Whirlpool_PageLoc,x      ;save as page location of whirlpool
             iny
             iny                          ;increment length by 2
             tya
             asl                          ;multiply by 16 to get size of whirlpool
             asl                          ;note that whirlpool will always be
             asl                          ;two blocks bigger than actual size of hole
             asl                          ;and extend one block beyond each edge
             sta Whirlpool_Length,x       ;save size of whirlpool here
             inx
             cpx #$05                     ;increment and check offset
             bcc StrWOffset               ;if not yet reached fifth whirlpool, branch to save offset
             ldx #$00                     ;otherwise initialize it
StrWOffset: stx Whirlpool_Offset         ;save new offset here
NoWhirlP:   ldx AreaType                 ;get appropriate metatile, then
             lda HoleMetatiles,x          ;render the hole proper
             ldx #$08
             ldy #$0f                     ;start at ninth row and go to bottom, run RenderUnderPart
             
             
RenderUnderPart:
             sty AreaObjectHeight  ;store vertical length to render
             ldy MetatileBuffer,x  ;check current spot to see if there's something
             beq DrawThisRow       ;we need to keep, if nothing, go ahead
             cpy #$17
             beq WaitOneRow        ;if middle part (tree ledge), wait until next row
             cpy #$1a
             beq WaitOneRow        ;if middle part (mushroom ledge), wait until next row
             cpy #$c0
             beq DrawThisRow       ;if question block w/ coin, overwrite
             cpy #$c0
             bcs WaitOneRow        ;if any other metatile with palette 3, wait until next row
             cpy #$8a
             beq WaitOneRow
             cpy #$54
             bne DrawThisRow       ;if cracked rock terrain, overwrite
             cmp #$50
             beq WaitOneRow        ;if stem top of mushroom, wait until next row
             cmp #$4c
             beq WaitOneRow
DrawThisRow: sta MetatileBuffer,x  ;render contents of A from routine that called this
WaitOneRow:  inx
             cpx #$0d              ;stop rendering if we're at the bottom of the screen
             bcs ExitUPartR
             ldy AreaObjectHeight  ;decrement, and stop rendering if there is no more length
             dey
             bpl RenderUnderPart
ExitUPartR:  rts
             
             
ChkLrgObjLength:
             jsr GetLrgObjAttrib     ;get row location and size (length if branched to from here)
             
ChkLrgObjFixedLength:
             lda AreaObjectLength,x  ;check for set length counter
             clc                     ;clear carry flag for not just starting
             bpl LenSet              ;if counter not set, load it, otherwise leave alone
             tya                     ;save length into length counter
             sta AreaObjectLength,x
             sec                     ;set carry flag if just starting
LenSet: rts
             
             
GetLrgObjAttrib:
             ldy AreaObjOffsetBuffer,x ;get offset saved from area obj decoding routine
             lda (AreaData),y          ;get first byte of level object
             and #%00001111
             sta $07                   ;save row location
             iny
             lda (AreaData),y          ;get next byte, save lower nybble (length or height)
             and #%00001111            ;as Y, then leave
             tay
             rts
             
             
GetAreaObjXPosition:
             lda CurrentColumnPos    ;multiply current offset where we're at by 16
             asl                     ;to obtain horizontal pixel coordinate
             asl
             asl
             asl
             rts
             
             
GetAreaObjYPosition:
             lda $07  ;multiply value by 16
             asl
             asl      ;this will give us the proper vertical pixel coordinate
             asl
             asl
             clc
             adc #32  ;add 32 pixels for the status bar
             rts
             
             
             
             ;     lsr                      ;move high nybble to low
             ;     lsr
             ;     lsr
             ;     lsr
             ;     tay                      ;use nybble as pointer to high byte
             ;    lda BlockBufferAddr+2,y  ;of indirect here
             ;    sta $07
             ;    pla
             ;    and #%00001111           ;pull from stack, mask out high nybble
             ;    clc
             ;    adc BlockBufferAddr,y    ;add to low byte
             ;    sta $06                  ;store here and leave
             ;    rts
             
WarpZoneNumbers1:
             .db $04, $03, $02, $00         ; world 1-2
             .db $24, $05, $09, $00         ; warp zone responsible for minus world
             .db $08, $07, $06, $00         ; world 4-2
             .db $33, $05, $33, $00         ; world 4-2 to world 5
HandlePipeEntry:
             lda Up_Down_Buttons       ;check saved controller bits from earlier
             and #%00000100            ;for pressing down
             beq ExPipeE               ;if not pressing down, branch to leave
             lda $00
             cmp #$11                  ;check right foot metatile for warp pipe right metatile
             bne ExPipeE               ;branch to leave if not found
             lda $01
             cmp #$10                  ;check left foot metatile for warp pipe left metatile
             bne ExPipeE               ;branch to leave if not found
             lda #$30
             sta ChangeAreaTimer       ;set timer for change of area
             lda #$01
             sta DontDecPT
             lda #$03
             sta GameEngineSubroutine  ;set to run vertical pipe entry routine on next frame
             lda #Sfx_PipeDown_Injury
             sta Square1SoundQueue     ;load pipedown/injury sound
             lda #%00100000
             sta Player_SprAttrib      ;set background priority bit in player's attributes
             lda WarpZoneControl       ;check warp zone control
             beq ExPipeE               ;branch to leave if none found
             and #%00000011            ;mask out all but 2 LSB
             asl
             asl                       ;multiply by four
             tax                       ;save as offset to warp zone numbers (starts at left pipe)
             lda Player_X_Position     ;get player's horizontal position
             cmp #$60      
             bcc GetWNum               ;if player at left, not near middle, use offset and skip ahead
             inx                       ;otherwise increment for middle pipe
             cmp #$a0      
             bcc GetWNum               ;if player at middle, but not too far right, use offset and skip
             inx                       ;otherwise increment for last pipe
GetWNum: ldy WarpZoneNumbers1,x     ;get warp zone numbers
             if MINUS_WORLD_FIX == 1
             cpy #$24
             beq MinusWorld
             endif
             dey                       ;decrement for use as world number
             sty WorldNumber           ;store as world number and offset
             ldx WorldAddrOffsets,y    ;get offset to where this world's area offsets are
             lda AreaAddrOffsets,x     ;get area offset based on world offset
             sta AreaPointer           ;store area offset here to be used to change areas
             if MINUS_WORLD_FIX == 1
FinishPipeEntry:
             endif
             lda #Silence
             sta EventMusicQueue       ;silence music
             lda #$00
             sta EntrancePage          ;initialize starting page number
             sta AreaNumber            ;initialize area number used for area address offset
             sta LevelNumber           ;initialize level number used for world display
             sta AltEntranceControl    ;initialize mode of entry
             inc Hidden1UpFlag         ;set flag for hidden 1-up blocks
             inc FetchNewGameTimerFlag ;set flag to load new game timer
ExPipeE: rts
             
HandleUpPipeEntry:         
             lda Up_Down_Buttons
             and #Up_Dir
             beq ExPipeU
             lda tempC
             cmp #$2e                  ;check right foot metatile for warp pipe right metatile
             bne ExPipeU               ;branch to leave if not found
             lda tempD    
             cmp #$2f
             bne ExPipeU
             lda #$30
             sta ChangeAreaTimer       ;set timer for change of area
             lda #$01
             sta DontDecPT
             lda #$0d
             sta GameEngineSubroutine  ;set to run vertical pipe entry routine on next frame
             lda #Sfx_PipeDown_Injury
             sta Square1SoundQueue     ;load pipedown/injury sound
             lda #%00100000
             sta Player_SprAttrib      ;set background priority bit in player's attributes
ExPipeU: lda #$00
             sta tempC
             sta tempD
             rts     
             
ProcLoopCommand:
			
             ;jmp ChkEnemyFrenzy
             
ChkEnemyFrenzy:
             lda #%10000111
             sta Old8000
             sta $8000
             lda LevelBank
             clc
             adc #FirstLevelBank
             
             sta $8001
             lda EnemyFrenzyQueue  ;check for enemy object in frenzy queue
             beq ProcessEnemyData  ;if not, skip this part
             if shufflelevels == 1
             cmp #$36
             bcc +
             lda #$00
+:
             endif
             sta Enemy_ID,x        ;store as enemy object identifier here
             lda #$01
             sta Enemy_Flag,x      ;activate enemy object flag
             lda #$00
             sta Enemy_State,x     ;initialize state and frenzy queue
             sta EnemyFrenzyQueue
             jmp InitEnemyObject   ;and then jump to deal with this enemy
             
ProcessEnemyData:
             ldy scrolldir
             beq +
             ldy StarFlagTaskControl
             bne +
             ldy EnemyDataOffset      ;get offset of enemy object data
             if ExLVLID == 1
             lda #$00
             sta Tortilla
             endif
             lda (EnemyData),y        ;load first byte
             cmp #$ff                 ;check for EOD terminator
             bne CheckEndofBuffer
+:      jmp CheckFrenzyBuffer    ;if found, jump to check frenzy buffer, otherwise
             
CheckEndofBuffer:
             if ExLVLID == 1
             inc Tortilla
             endif
             and #%00001111           ;check for special row $0e
             cmp #$0e
             beq CheckRightBounds     ;if found, branch, otherwise
             if ExLVLID == 1
             dec Tortilla
             endif
             cpx #$05                 ;check for end of buffer
             bcc CheckRightBounds     ;if not at end of buffer, branch
             iny                      ;get identifier back and use as offset for jump engine
             lda (EnemyData),y        ;check for specific value here
             and #%01111111           ;not sure what this was intended for, exactly
             cmp #$2e                 ;this part is quite possibly residual code
             beq CheckRightBounds     ;but it has the effect of keeping enemies out of
             cmp #$30
             beq CheckRightBounds
             rts                      ;the sixth slot
CheckRightBounds:
             lda ScreenRight_X_Pos    ;add 48 to pixel coordinate of right boundary
             clc
             adc #$30
             and #%11110000           ;store high nybble
             sta $07
             lda ScreenRight_PageLoc  ;add carry to page location of right boundary
             adc #$00
             sta $06                  ;store page location + carry
             ldy EnemyDataOffset
             iny
             if ExLVLID == 1
             lda Tortilla
             beq +
             dec Tortilla
             iny
             iny
             lda (EnemyData),y
             dey
             dey
             jmp ++
+:          lda (EnemyData),y        ;if MSB of enemy object is clear, branch to check for row $0f
++:
             else 
             lda (EnemyData),y        ;if MSB of enemy object is clear, branch to check for row $0f
             endif
             bpl CheckPageCtrlRow
             lda EnemyObjectPageSel   ;if page select already set, do not set again
             bne CheckPageCtrlRow
             inc EnemyObjectPageSel   ;otherwise, if MSB is set, set page select 
             inc EnemyObjectPageLoc   ;and increment page control
             
CheckPageCtrlRow:
             dey
             lda (EnemyData),y        ;reread first byte
             and #$0f
             cmp #$0f                 ;check for special row $0f
             bne PositionEnemyObj     ;if not found, branch to position enemy object
             ;lda EnemyObjectPageSel   ;if page select set,
             ;bne PositionEnemyObj     ;branch without reading second byte
             iny
             lda (EnemyData),y        ;otherwise, get second byte, mask out 2 MSB
             and #%01111111
             sta EnemyObjectPageLoc   ;store as page control for enemy object data
             lda EnemyDataOffset
             clc
             adc #$02
             sta EnemyDataOffset
             lda EnemyDataHigh
             adc #$00
             sta EnemyDataHigh
             inc EnemyObjectPageSel   ;set page select for enemy object data and 
             jmp ProcLoopCommand      ;jump back to process loop commands again
CheckThreeBytes2: jmp CheckThreeBytes
ParseRow0e1:      jmp ParseRow0e
PositionEnemyObj:
             lda EnemyObjectPageLoc   ;store page control as page location
             sta Enemy_PageLoc,x      ;for enemy object
             lda (EnemyData),y        ;get first byte of enemy object
             and #%11110000
             sta Enemy_X_Position,x   ;store column position
             lda Enemy_PageLoc,x      ;without subtracting, then subtract borrow
             cmp EntrancePage
             beq +++
             lda Enemy_X_Position,x
             cmp ScreenRight_X_Pos    ;check column position against right boundary
             lda Enemy_PageLoc,x      ;without subtracting, then subtract borrow
             sbc ScreenRight_PageLoc  ;from page location
             bcs CheckRightExtBounds  ;if enemy object beyond or at boundary, branch
             lda (EnemyData),y
             and #%00001111           ;check for special row $0e
             cmp #$0e                 ;if found, jump elsewhere
             beq ParseRow0e1
             iny
             lda (EnemyData),y
             and #%01111111
             cmp #PowerUpObject
             beq ++
             cmp #Sign
             bne +
++:        inc EnemyDataOffset
             ;lda Enemy_PageLoc,x
             ;cmp ScreenRight_PageLoc
             ;bne CheckRightExtBounds
             rts
+:      jmp CheckThreeBytes      ;if not found, unconditional jump
             
CheckRightExtBounds:
             lda $07                  ;check right boundary + 48 against
             cmp Enemy_X_Position,x   ;column position without subtracting,
             lda $06                  ;then subtract borrow from page control temp
             sbc Enemy_PageLoc,x      ;plus carry
             bcc CheckFrenzyBuffer    ;if enemy object beyond extended boundary, branch
+++:
-:      lda #$01                 ;store value in vertical high byte
             sta Enemy_Y_HighPos,x
             lda (EnemyData),y        ;get first byte again
             asl                      ;multiply by four to get the vertical
             asl                      ;coordinate
             asl
             asl
             sta Enemy_Y_Position,x
             cmp #$e0                 ;do one last check for special row $0e
             beq ParseRow0e           ;(necessary if branched to $c1cb)
             iny
             ;lda (EnemyData),y        ;get second byte of object
             ;and #%01000000           ;check to see if hard mode bit is set
             ;beq CheckForEnemyGroup   ;if not, branch to check for group enemy objects
             ;lda SecondaryHardMode    ;if set, check to see if secondary hard mode flag
             ;beq Inc2B2                ;is on, and if not, branch to skip this object completely
             
CheckForEnemyGroup:
             lda (EnemyData),y      ;get second byte and mask out 2 MSB
             and #%01111111
             cmp #$37               ;check for value below $37
             bcc BuzzyBeetleMutate
             cmp #$3f               ;if $37 or greater, check for value
             bcc DoGroup            ;below $3f, branch if below $3f
             
BuzzyBeetleMutate:
             cmp #Goomba          ;if below $37, check for goomba
             bne StrID            ;value ($3f or more always fails)
             ldy PrimaryHardMode  ;check if primary hard mode flag is set
             beq StrID            ;and if so, change goomba to buzzy beetle
             lda #BuzzyBeetle
StrID:  sta Enemy_ID,x       ;store enemy object number into buffer
             lda #$01
             sta Enemy_Flag,x     ;set flag for enemy in buffer
             jsr InitEnemyObject
             lda DontRepeat
             bne Inc2B3
             lda Enemy_Flag,x     ;check to see if flag is set
             bne Inc2B            ;if not, leave, otherwise branch
             rts
Inc2B3: dec DontRepeat
Inc2B2: jmp Inc2B
CheckFrenzyBuffer:
             lda EnemyFrenzyBuffer    ;if enemy object stored in frenzy buffer
             bne StrFre               ;then branch ahead to store in enemy object buffer
             lda VineFlagOffset       ;otherwise check vine flag offset
             cmp #$01
             bne ExEPar+1        ;if other value <> 1, leave
             lda #VineObject          ;otherwise put vine in enemy identifier
StrFre: pha
             lda Enemy_ID,x
             cmp #FlagpoleFlagObject
             beq ExEPar
             pla
             sta Enemy_ID,x           ;store contents of frenzy buffer into enemy identifier value
             
InitEnemyObject:
             lda #$00                 ;initialize enemy state
             sta Enemy_State,x
             jmp CheckpointEnemyID    ;jump ahead to run jump engine and subroutines
ExEPar: pla
             rts                      ;then leave
             
DoGroup:
             jmp HandleGroupEnemies   ;handle enemy group objects
             
ParseRow0e:
             iny                      ;increment Y to load third byte of object
             iny
             lda WorldNumber
             and #%00000111
             sta temp9
             lda (EnemyData),y
             
             if WORLD9_PIPE_FIX
             cmp #World9              ;skip world number check if >= world 9
             bcs W9Skip
             endif
             
             lsr                      ;move 3 MSB to the bottom, effectively
             lsr                      ;making %xxx00000 into %00000xxx
             lsr
             lsr
             lsr
             cmp temp9                ;is it the same world number as we're on?
             bne NotUse               ;if not, do not use (this allows multiple uses
W9Skip: dey                      ;of the same area, like the underground bonus areas)
             lda (EnemyData),y        ;otherwise, get second byte and use as offset
             sta AreaPointer          ;to addresses for level and enemy object data
             iny
             lda (EnemyData),y        ;get third byte again, and this time mask out
             and #%00011111           ;the 3 MSB from before, save as page number to be
             sta EntrancePage         ;used upon entry to area, if area is entered
NotUse: jmp Inc3B
             
CheckThreeBytes:
             ldy EnemyDataOffset      ;load current offset for enemy object data
             lda (EnemyData),y        ;get first byte
             and #%00001111           ;check for special row $0e
             cmp #$0e
             bne Inc2B
Inc3B:  clc
             lda EnemyDataOffset
             if ExLVLID == 1
             add #$04
             else
             add #$03
             endif
             sta EnemyDataOffset
             jmp +
Inc2B:  clc
             lda EnemyDataOffset
             tay
             clc
             adc #$02
             sta EnemyDataOffset
+:        lda EnemyDataHigh
             adc #$00
             sta EnemyDataHigh
             lda #$00                 ;init page select for enemy objects
             sta EnemyObjectPageSel
             ldx ObjectOffset         ;reload current offset in enemy buffers
             rts                      ;and leave
CheckpointEnemyID:
             lda Enemy_ID,x
             cmp #Sign
             bne +
             ldy EnemyDataOffset
             iny
             iny
             lda (EnemyData),y
             sta $7fce,x
             inc EnemyDataOffset
             lda Enemy_ID,x
             jmp InitEnemyRoutines2
+:        cmp #PowerUpObject
             bne ++
             ldy EnemyDataOffset
             iny
             iny
             lda (EnemyData),y
             sta $7fce,x
             inc EnemyDataOffset
             lda Enemy_ID,x
             jmp InitEnemyRoutines2
++:        cmp #RedKoopaShell
             beq +
             cmp #UDPiranhaPlant
             beq +++
             cmp #RUDPiranhaPlant
             bne ++
+++:    lda Enemy_Y_Position,x
             clc
             adc #$09                     ;add eight pixels to what will eventually be the
             sta Enemy_Y_Position,x       ;enemy object's vertical coordinate ($00-$14 only)
             jsr InitUDPiranhaPlant
             jmp DoSaveEnemyIntoSex
++:
             cmp #RedPiranhaPlant
             bne ++
             lda Enemy_Y_Position,x
             clc
             adc #$08                     ;add eight pixels to what will eventually be the
             sta Enemy_Y_Position,x       ;enemy object's vertical coordinate ($00-$14 only)
             jsr InitPiranhaPlant
             jmp DoSaveEnemyIntoSex
++:     cmp #$15                     ;check enemy object identifier for $15 or greater
             bcs InitEnemyRoutines2        ;and branch straight to the jump engine if found
+:      tay                          ;save identifier in Y register for now
             lda Enemy_Y_Position,x
             adc #$08                     ;add eight pixels to what will eventually be the
             sta Enemy_Y_Position,x       ;enemy object's vertical coordinate ($00-$14 only)
             lda #$01
             sta EnemyOffscrBitsMasked,x  ;set offscreen masked bit
             tya
             ;jmp InitEnemyRoutines
InitEnemyRoutines2:
             ldy StarFlagTaskControl
             bne InitEnemyRoutines
             ldy Enemy_ID,x
             cpy #Fireworks
             beq InitEnemyRoutines
             cpy #BBill_CCheep_Frenzy
             beq InitEnemyRoutines
             cpy #FlyCheepCheepFrenzy
             beq InitEnemyRoutines
             cpy #BulletBill_FrenzyVar
             beq InitEnemyRoutines
             cpy #BowserFlame
             beq InitEnemyRoutines
             cpy #VineObject
             beq InitEnemyRoutines
             cpy #PltRem
             beq InitEnemyRoutines
             ;cpy #Spiny
             ;beq InitEnemyRoutines
             cpy #Lakitu
             beq InitEnemyRoutines
             cpy #Stop_Frenzy
             beq InitEnemyRoutines
             ;cpy #GreyCheepCheep
             ;beq InitEnemyRoutines
             ;cpy #RedCheepCheep
             ;beq InitEnemyRoutines
             cpy #BulletBill_CannonVar
             beq InitEnemyRoutines
             pha
             ldy Enemy_PageLoc,x
             lda GlobalSaveOffset
             clc
             adc #$01
             sta EnemyOffsetPage,y
             inc GlobalSaveOffset
             
             ldy GlobalSaveOffset
             tya
             sta SavedOffset,x
             lda Enemy_X_Position,x
             sta Saved_X_Position,y
             lda Enemy_Y_Position,x
             sta Saved_Y_Position,y
             lda Enemy_PageLoc,x
             sta Saved_PageLoc,y
             lda Enemy_ID,x
             cmp #Sign
             beq ++
             cmp #PowerUpObject
             bne +    
++:        lda $7fce,x
             sta ExtraShit,y
             lda Enemy_ID,x
+:        clc
             adc #$01
             sta Saved_ID,y
             cmp #$43
             beq + 
             lda #$01
             sta Saved_isDefeated,y
+:        sty tempB
             pla                          ;get identifier back and use as offset for jump engine
             
InitEnemyRoutines:
             cmp #LastEnemyID+1
             bcc +
             jmp NoInitCode 
+:            jsr JumpEngine
             
             
             .dw InitNormalEnemy  ;00 for objects $00-$0f
             .dw InitNormalEnemy  ;01
             .dw InitRedKoopa     ;02
             .dw InitRedKoopa     ;03
             .dw InitKoopaShell   ;04
             .dw InitHammerBro    ;05
             .dw InitGoomba       ;06
             .dw InitBloober      ;07
             .dw InitBulletBill   ;08
             .dw InitFastGoomba   ;09
             .dw InitCheepCheep   ;0a
             .dw InitCheepCheep   ;0b
             .dw InitPodoboo      ;0c
             .dw InitPiranhaPlant ;0d
             .dw InitJumpGPTroopa ;0e
             .dw InitRedPTroopa   ;0f
             
             .dw InitHorizFlySwimEnemy  ;10 for objects $10-$1f
             .dw InitLakitu                ;11
             .dw InitNormalEnemy           ;12 spiny
             .dw InitJumpGPTroopa          ;13
             .dw InitEnemyFrenzy           ;14 flying cheep-cheeps zone
             .dw InitEnemyFrenzy           ;15 bowser's fire
             .dw InitEnemyFrenzy           ;16 fireworks (unstable)
             .dw InitEnemyFrenzy           ;17 bullet bills / underwater cheep-cheeps
             .dw EndFrenzy                    ;18 enf frenzy
             .dw InitKoopaShell            ;19    
             .dw NoInitCode                ;1a null sprite
             .dw InitShortFirebar          ;1b
             .dw InitShortFirebar          ;1c
             .dw InitShortFirebar          ;1d
             .dw InitShortFirebar          ;1e
             .dw InitLongFirebar           ;1f
             
             .dw NoInitCode             ;20 for objects $20-$2f
             .dw NoInitCode             ;21 those 3 are long firebars (malfunctions)
             .dw NoInitCode             ;22
             .dw InitUDPiranhaPlant    ;23 
             .dw InitBalPlatform       ;24
             .dw InitVertPlatform      ;25
             .dw LargeLiftUp           ;26
             .dw LargeLiftDown         ;27
             .dw InitHoriPlatform      ;28
             .dw InitDropPlatform      ;29
             .dw InitHoriPlatform      ;2a
             .dw PlatLiftUp            ;2b
             .dw PlatLiftDown          ;2c
             .dw InitBowser            ;2d
             .dw InitPowerUp           ;2e
             .dw Setup_Vine            ;2f
             
             .dw InitFlag           ;30 for objects $30-$36, flagpole flag object
             .dw NoInitCode      ;31 star flag object
             .dw NoInitCode      ;32 jumpspring object
             .dw NoInitCode      ;33 bullet bill cannon var
             .dw NoInitCode      ;34 warp zone
             .dw InitRetainerObj ;35
             .dw NoInitCode      ;36
             .dw NoInitCode      ;37
             .dw NoInitCode      ;38
             .dw NoInitCode      ;39
             .dw NoInitCode      ;3a
             .dw NoInitCode      ;3b
             .dw NoInitCode      ;3c
             .dw NoInitCode      ;3d
             .dw NoInitCode      ;3e
             .dw NoInitCode      ;3f
             .dw InitSign          ;40
             .dw InitScrollLock1 ;41
             .dw InitCannon      ;42
             .dw InitPlatformRem ;43
             
             .dw EndOfEnemyInitCode    ;expandablen't (crash entity)
InitScrollLock1:
             jmp InitScrollLock
InitPlatformRem:
             
             lda #$00
             sta Enemy_Flag,x
             ldy #$04
-:        ;sta Enemy_Flag,y
             ;dey
             ;    bpl -
             
             lda Enemy_ID,y
             cmp #$2a
             beq +
             dey
             bpl -
+:        lda #$00
             sta Enemy_Flag,y
             inc DontRepeat
             rts
InitCannon:
             ldy tempB
             lda #$02
             sta Saved_isDefeated,y
             tya
             sta Cannon_Creator,x
             ldy Cannon_Offset
             iny
             lda Enemy_X_Position,x
             sta Cannon_X_Position,y
             lda Enemy_Y_Position,x
             clc
             adc #$10
             sta Cannon_Y_Position,y
             lda Enemy_PageLoc,x
             sta Cannon_PageLoc,y
             lda #$00
             sta Enemy_Flag,x
             cpy #$05
             bcc +
             tay
+:        sty Cannon_Offset
             inc DontRepeat
             rts
             ;$37-$3e are gruped goombas and koopas
             ;$3f crashes so is a potentially free slot
InitSign:
             lda $7fce,x
             sta Enemy_State,x
             lda #$01
             sta Enemy_Flag,x          ;set buffer flag
             lda #$03
             sta Enemy_BoundBoxCtrl,x  ;set bounding box size control for sign object 
             lda Enemy_Y_Position,x
             clc 
             adc #$07
             sta Enemy_Y_Position,x
NoInitCode:    
             rts
InitScrollLock:
             lda Enemy_PageLoc,x
			 cmp EntrancePage
			 bcc +
			 lda ScrollLockPageLoc
             cmp #$75				; $75 is default
             bne +
             lda Enemy_PageLoc,x
             clc
             adc #$66
             sta ScrollLockPageLoc
             lda Enemy_X_Position,x
             lsr
             lsr
             lsr
             lsr
             clc
             adc #$01
             sta ScrollLockColumnPos
             sec
             sbc #$03
             sta ScrollLockColumnPos
             lda ScrollLockPageLoc
             sbc #$00
             sta ScrollLockPageLoc
             lda ScrollLockColumnPos
             and #$0f
             sta ScrollLockColumnPos
+:      lda #$02
             sta Enemy_Y_HighPos,x
             lda #$00
             sta Enemy_X_Speed,x
             rts
             
InitFlag:
             stx $7fcc
             lda Enemy_X_Position,x
             
             lsr
             lsr
             lsr
             lsr
             
             sta FlagpoleEnemyCol
             sta $7fba
             ;sta Enemy_X_Position,x   ;coordinate for the flag
             lda Enemy_PageLoc,x
             sta $7fb9      ;page location for the flag
             clc
             adc #$66                 ;subtract borrow from page location and use as
             
             sta FlagpoleEnemyPage
             lda #$30
             sta Enemy_Y_Position,x   ;set vertical coordinate for flag
             lda WorldNumber
			 cmp #World8
			 bne +
			 lda #$a0
			 .db $2c
+:           lda #$b0
             sta FlagpoleFNum_Y_Pos   ;set initial vertical coordinate for flagpole's floatey number
             lda #$01
             sta FlagpoleOnScreen
             lda Enemy_X_Position,x
             sec
             sbc #$08
             sta Enemy_X_Position,x
             inc Enemy_Flag,x         ;use last space in enemy object buffer
             rts
DoSaveEnemyIntoSex:
             pha
             ldy Enemy_PageLoc,x
             lda GlobalSaveOffset
             clc
             adc #$01
             sta EnemyOffsetPage,y
             inc GlobalSaveOffset
             ldy GlobalSaveOffset
             tya
             sta SavedOffset,x
             lda PiranhaPlantUpYPos,x
             sta ExtraShit,y
             lda PiranhaPlantDownYPos,x
             sta ExtraShit2,y
             lda PiranhaPlant_MoveFlag,x
             sta ExtraShit3,y
             lda PiranhaPlant_Y_Speed,x
             sta ExtraShit4,y
             lda Enemy_X_Position,x
             sta Saved_X_Position,y
             lda Enemy_Y_Position,x
             and #$f0
             sta Saved_Y_Position,y
             lda Enemy_PageLoc,x
             sta Saved_PageLoc,y
             lda Enemy_ID,x
             clc
             adc #$01
             sta Saved_ID,y
             lda #$01
             sta Saved_isDefeated,y
             pla                          ;get identifier back and use as offset for jump engine
             rts
             
InitGoomba:
             jsr InitNormalEnemy  ;set appropriate horizontal speed
             jmp SmallBBox        ;set $09 as bounding box control, set other values
             
InitPowerUp:
             lda #$80
             sta Enemy_State,x         ;set power-up object's state
             lda #$01
             sta Enemy_Flag,x          ;set buffer flag
             lda #$03
             sta Enemy_BoundBoxCtrl,x  ;set bounding box size control for power-up object
			 lda Enemy_Y_Position,x
			 and #$f0
			 ora #$08
			 sta Enemy_Y_Position,x
             rts
InitFastGoomba:
             lda #$01
             sta Enemy_State,x
             jsr InitNormalEnemy
             jmp SmallBBox
             
InitKoopaShell:
             jsr InitNormalEnemy   ;load appropriate horizontal speed
             lda #$04
             sta Enemy_State,x
             lda #$ff
             sta EnemyIntervalTimer,x
             rts
             
InitPodoboo:
             lda #$02                  ;set enemy position to below
             sta Enemy_Y_HighPos,x     ;the bottom of the screen
             sta Enemy_Y_Position,x
             lsr
             sta EnemyIntervalTimer,x  ;set timer for enemy
             lsr
             sta Enemy_State,x         ;initialize enemy state, then jump to use
             jmp SmallBBox             ;$09 as bounding box size and set other things
             
             
InitRetainerObj:
             lda #$b8                ;set fixed vertical position for
             sta Enemy_Y_Position,x  ;princess/mushroom retainer object
             rts
             
             
NormalXSpdData:
             .db $f1, $f8, $eb, $f1
             
InitNormalEnemy:
             ldy #$03              ;load offset of 1 by default
             lda HardModeFlag     ;check for primary hard mode flag set
             bne +
             ldy #01
+:         lda Enemy_ID,x
             cmp #FastGoomba
             bne GetESpd
             dey
GetESpd: lda NormalXSpdData,y  ;get appropriate horizontal speed
SetESpd: ldy scrolldir
             bne +
             eor #$ff
             clc
             adc #$01
+:         sta Enemy_X_Speed,x   ;store as speed for enemy object
             lda Enemy_ID,x
             cmp #BuzzyBeetle
             beq +
             cmp #Spiny
             beq ++
             jmp TallBBox          ;branch to set bounding box control and other data
+:          jmp SemiSmallBBox
++:         jmp SmallBBox
             
             
InitRedKoopa:
             jsr InitNormalEnemy   ;load appropriate horizontal speed
             lda #$01              ;set enemy state for red koopa troopa $03
             sta Enemy_State,x
             rts
             
             
HBroWalkingTimerData:
             .db $80, $50
             
InitHammerBro:
             lda #$00                    ;init horizontal speed and timer used by hammer bro
             sta HammerThrowingTimer,x   ;apparently to time hammer throwing
             sta Enemy_X_Speed,x
             lda HardModeFlag
             bne NoHB
             ldy SecondaryHardMode       ;get secondary hard mode flag
             lda HBroWalkingTimerData,y
             sta EnemyIntervalTimer,x    ;set value as delay for hammer bro to walk left
NoHB: lda #$09                    ;set specific value for bounding box size control
             jmp TallBBox
             
             
InitHorizFlySwimEnemy:
             lda #$00        ;initialize horizontal speed
             jmp SetESpd
             
             
InitBloober:
             lda #$00               ;initialize horizontal speed
             sta BlooperMoveSpeed,x
SmallBBox: lda #$09               ;set specific bounding box size control
             bne SetBBox            ;unconditional branch
SemiSmallBBox:
             lda #$0e
             bne SetBBox
             
             
InitRedPTroopa:
             ldy #$30                    ;load central position adder for 48 pixels down
             lda Enemy_Y_Position,x      ;set vertical coordinate into location to
             sta RedPTroopaOrigXPos,x    ;be used as original vertical coordinate
             bpl GetCent                 ;if vertical coordinate < $80
             ldy #$e0                    ;if => $80, load position adder for 32 pixels up
GetCent:  tya                         ;send central position adder to A
             adc Enemy_Y_Position,x      ;add to current vertical coordinate
             sta RedPTroopaCenterYPos,x  ;store as central vertical coordinate
TallBBox: lda #$03                    ;set specific bounding box size control
SetBBox:  sta Enemy_BoundBoxCtrl,x    ;set bounding box control here
             lda #$02
             ;ldy Enemy_ID,x
             ;cpy #RedCheepCheep
             ;beq +
             ;cpy #GreyCheepCheep
             ;beq +
             ldy scrolldir
             bne +
             lda #$01
+:          sta Enemy_MovingDir,x
InitVStf: lda #$00                    ;initialize vertical speed
             sta Enemy_Y_Speed,x         ;and movement force
             sta Enemy_Y_MoveForce,x
             rts
             
             
InitBulletBill:
             lda #$02                  ;set moving direction for left
             sta Enemy_MovingDir,x
             lda #$09                  ;set bounding box control for $09
             sta Enemy_BoundBoxCtrl,x
             rts
             
             
InitCheepCheep:
             jsr SmallBBox              ;set vertical bounding box, speed, init others
             lda PseudoRandomBitReg,x   ;check one portion of LSFR
             and #%00010000             ;get d4 from it
             sta CheepCheepMoveMFlag,x  ;save as movement flag of some sort
             lda Enemy_Y_Position,x
             sta CheepCheepOrigYPos,x   ;save original vertical coordinate here
             rts
             
             
InitLakitu:
             lda EnemyFrenzyBuffer      ;check to see if an enemy is already in
             bne KillLakitu             ;the frenzy buffer, and branch to kill lakitu if so
             
SetupLakitu:
             lda #$00                   ;erase counter for lakitu's reappearance
             sta LakituReappearTimer
             sta LakituRespawning,x
             jmp InitHorizFlySwimEnemy  ;set $03 as bounding box, set other attributes
             ;jmp TallBBox2              ;set $03 as bounding box again (not necessary) and leave
             
KillLakitu:
             jmp EraseEnemyObject
             
             
PRDiffAdjustData:
             .db $26, $2c, $32, $38
             .db $20, $22, $24, $26
             .db $13, $14, $15, $16
             
LakituSpinyTimer:
             .db $80, $40
             
LakituAndSpinyHandler:
             ldx ObjectOffset
             lda FrenzyEnemyTimer    ;if timer here not expired, leave
             bne ExLSHand
             cpx #$05               ;if we are on the special use slot, leave
             bcs ExLSHand
             ldy HardModeFlag
             lda LakituSpinyTimer,y
             sta FrenzyEnemyTimer
             ldy #$04                ;start with the last enemy slot
ChkLak:   lda Enemy_ID,y          ;check all enemy slots to see
             cmp #Lakitu             ;if lakitu is on one of them
             beq CreateSpiny         ;if so, branch out of this loop
             dey                     ;otherwise check another slot
             bpl ChkLak              ;loop until all slots are checked
             lda LakituRespawning
             bne +
             jmp InitNormalEnemy 
+:        inc LakituReappearTimer ;increment reappearance timer
             lda LakituReappearTimer
             cmp #$07                ;check to see if we're up to a certain value yet
             bcc ExLSHand            ;if not, leave
             ldx #$05                ;start with the last enemy slot again
ChkNoEn:  lda Enemy_Flag,x        ;check enemy buffer flag for non-active enemy slot
             beq CreateL             ;branch out of loop if found
             dex                     ;otherwise check next slot
             bpl ChkNoEn             ;branch until all slots are checked
             bmi RetEOfs             ;if no empty slots were found, branch to leave
CreateL:  lda #$00                ;initialize enemy state
             sta Enemy_State,x
             lda #Lakitu             ;create lakitu enemy object
             sta Enemy_ID,x
             jsr SetupLakitu         ;do a sub to set up lakitu
             lda #$20
             jsr PutAtRightExtent    ;finish setting up lakitu
RetEOfs:  ldx ObjectOffset        ;get enemy object buffer offset again and leave
ExLSHand: rts
             
             
CreateSpiny:
             lda Player_Y_Position      ;if player above a certain point, branch to leave
             cmp #$2c
             bcc ExLSHand
             lda Enemy_State,y          ;if lakitu is not in normal state, branch to leave
             bne ExLSHand
             lda Enemy_PageLoc,y        ;store horizontal coordinates (high and low) of lakitu
             sta Enemy_PageLoc,x        ;into the coordinates of the spiny we're going to create
             lda Enemy_X_Position,y
             sta Enemy_X_Position,x
             lda #$01                   ;put spiny within vertical screen unit
             sta Enemy_Y_HighPos,x
             lda Enemy_Y_Position,y     ;put spiny eight pixels above where lakitu is
             sec
             sbc #$08
             sta Enemy_Y_Position,x
             lda PseudoRandomBitReg,x   ;get 2 LSB of LSFR and save to Y
             and #%00000011
             tay
             ldx #$02
DifLoop:  lda PRDiffAdjustData,y     ;get three values and save them
             sta $01,x                  ;to $01-$03
             iny
             iny                        ;increment Y four bytes for each value
             iny
             iny
             dex                        ;decrement X for each one
             bpl DifLoop                ;loop until all three are written
             ldx ObjectOffset           ;get enemy object buffer offset
             jsr PlayerLakituDiff       ;move enemy, change direction, get value - difference
             ldy Player_X_Speed         ;check player's horizontal speed
             cpy #$08
             bcs SetSpSpd               ;if moving faster than a certain amount, branch elsewhere
             tay                        ;otherwise save value in A to Y for now
             lda PseudoRandomBitReg+1,x
             and #%00000011             ;get one of the LSFR parts and save the 2 LSB
             beq UsePosv                ;branch if neither bits are set
             tya
             eor #%11111111             ;otherwise get two's compliment of Y
             tay
             iny
UsePosv:  tya                        ;put value from A in Y back to A (they will be lost anyway)
SetSpSpd: 
             if SPINYFIX !=1
             jsr SmallBBox        ;set bounding box control, init attributes, lose contents of A
             endif
             ldy #$02
             cmp #$00
             bpl +
             lda #$f8
             .db $2c
+:        lda #$08
             sta Enemy_X_Speed,x        ;set horizontal speed to zero because previous contents
             ;cmp #$00                   ;of A were lost...branch here will never be taken for
             bmi SpinyRte               ;the same reason
             dey
             if SPINYFIX ==1
             jsr SmallBBox        ;set bounding box control, init attributes
             endif
             ldy #$01
SpinyRte: sty Enemy_MovingDir,x      ;set moving direction to the right
             lda #$fd
             sta Enemy_Y_Speed,x        ;set vertical speed to move upwards
             lda #Goomba
             sta Enemy_ID,x
             lda #$01
             sta Enemy_Flag,x           ;enable enemy object by setting flag
             ;lda #$05
             lda #$00
             sta Enemy_State,x          ;put spiny in egg state and leave
ChpChpEx: rts
             
             
FirebarSpinSpdData:
             .db $28, $38, $28, $38, $28
             
FirebarSpinDirData:
             .db $00, $00, $10, $10, $10
             
InitLongFirebar:
             jsr DuplicateEnemyObj       ;create enemy object for long firebar
             
InitShortFirebar:
             lda #$00                    ;initialize low byte of spin state
             sta FirebarSpinState_Low,x
             lda Enemy_ID,x              ;subtract $1b from enemy identifier
             sec                         ;to get proper offset for firebar data
             sbc #$1b
             tay
             lda FirebarSpinSpdData,y    ;get spinning speed of firebar
             sta FirebarSpinSpeed,x
             lda FirebarSpinDirData,y    ;get spinning direction of firebar
             sta FirebarSpinDirection,x
             lda Enemy_Y_Position,x
             clc                         ;add four pixels to vertical coordinate
             adc #$04
             sta Enemy_Y_Position,x
             lda Enemy_X_Position,x
             clc                         ;add four pixels to horizontal coordinate
             adc #$04
             sta Enemy_X_Position,x
             lda Enemy_PageLoc,x
             adc #$00                    ;add carry to page location
             sta Enemy_PageLoc,x
             rts
             ;jmp TallBBox2               ;set bounding box control (not used) and leave
             
             
FlyCCXPositionData:
             .db $80, $30, $40, $80
             .db $30, $50, $50, $70
             .db $20, $40, $80, $a0
             .db $70, $40, $90, $68
             
FlyCCXSpeedData:
             .db $0e, $05, $06, $0e
             .db $1c, $20, $10, $0c
             .db $1e, $22, $18, $14
             
FlyCCTimerData:
             .db $10, $60, $20, $48
             
ChpChpEx2: rts
             
InitFlyingCheepCheep:
             lda FrenzyEnemyTimer       ;if timer here not expired yet, branch to leave
             bne ChpChpEx2
             jsr SmallBBox              ;jump to set bounding box size $09 and init other values
             lda PseudoRandomBitReg+1,x
             and #%00000011             ;set pseudorandom offset here
             tay
             lda FlyCCTimerData,y       ;load timer with pseudorandom offset
             lsr
             lsr
             sta FrenzyEnemyTimer
             ldy #$03                   ;load Y with default value
             lda SecondaryHardMode
             beq MaxCC                  ;if secondary hard mode flag not set, do not increment Y
             iny                        ;otherwise, increment Y to allow as many as four onscreen
MaxCC:   sty $00                    ;store whatever pseudorandom bits are in Y
             cpx $00                    ;compare enemy object buffer offset with Y
             bcs ChpChpEx2              ;if X => Y, branch to leave
             lda PseudoRandomBitReg,x
             and #%00000011             ;get last two bits of LSFR, first part
             sta $00                    ;and store in two places
             sta $01
             lda #$fb                   ;set vertical speed for cheep-cheep
             sta Enemy_Y_Speed,x
             lda #$00                   ;load default value
             ldy Player_X_Speed         ;check player's horizontal speed
             beq GSeed                  ;if player not moving left or right, skip this part
             lda #$04
             cpy #$19                   ;if moving to the right but not very quickly,
             bcc GSeed                  ;do not change A
             asl                        ;otherwise, multiply A by 2
GSeed:   pha                        ;save to stack
             clc
             adc $00                    ;add to last two bits of LSFR we saved earlier
             sta $00                    ;save it there
             lda PseudoRandomBitReg+1,x
             and #%00000011             ;if neither of the last two bits of second LSFR set,
             beq RSeed                  ;skip this part and save contents of $00
             lda PseudoRandomBitReg+2,x
             and #%00001111             ;otherwise overwrite with lower nybble of
             sta $00                    ;third LSFR part
RSeed:   pla                        ;get value from stack we saved earlier
             clc
             adc $01                    ;add to last two bits of LSFR we saved in other place
             tay                        ;use as pseudorandom offset here
             lda FlyCCXSpeedData,y      ;get horizontal speed using pseudorandom offset
             sta Enemy_X_Speed,x
             lda #$01                   ;set to move towards the right
             sta Enemy_MovingDir,x
             lda Player_X_Speed         ;if player moving left or right, branch ahead of this part
             bne D2XPos1
             ldy $00                    ;get first LSFR or third LSFR lower nybble
             tya                        ;and check for d1 set
             and #%00000010
             beq D2XPos1                ;if d1 not set, branch
             lda Enemy_X_Speed,x
             eor #$ff                   ;if d1 set, change horizontal speed
             clc                        ;into two's compliment, thus moving in the opposite
             adc #$01                   ;direction
             sta Enemy_X_Speed,x
             inc Enemy_MovingDir,x      ;increment to move towards the left
D2XPos1: tya                        ;get first LSFR or third LSFR lower nybble again
             and #%00000010
             beq D2XPos2                ;check for d1 set again, branch again if not set
             lda Player_X_Position      ;get player's horizontal position
             clc
             adc FlyCCXPositionData,y   ;if d1 set, add value obtained from pseudorandom offset
             sta Enemy_X_Position,x     ;and save as enemy's horizontal position
             lda Player_PageLoc         ;get player's page location
             adc #$00                   ;add carry and jump past this part
             jmp FinCCSt
D2XPos2: lda Player_X_Position      ;get player's horizontal position
             sec
             sbc FlyCCXPositionData,y   ;if d1 not set, subtract value obtained from pseudorandom
             sta Enemy_X_Position,x     ;offset and save as enemy's horizontal position
             lda Player_PageLoc         ;get player's page location
             sbc #$00                   ;subtract borrow
FinCCSt: sta Enemy_PageLoc,x        ;save as enemy's page location
             lda #$01
             sta Enemy_Flag,x           ;set enemy's buffer flag
             sta Enemy_Y_HighPos,x      ;set enemy's high vertical byte
             lda #$f8
             sta Enemy_Y_Position,x     ;put enemy below the screen, and we are done
             rts
             
BowserPoints:
             .db $05, $05, $05, $05, $07, $0a, $10, $20
InitBowser:
             lda BowserKilled
             beq +
             lda #$00
             sta Enemy_Flag,x
             sta Enemy_ID,x
             inc DontRepeat
             rts
+:      jsr DuplicateEnemyObj     ;jump to create another bowser object
             stx BowserFront_Offset    ;save offset of first here
             lda #$00
             sta BowserKilled
             sta BowserBodyControls    ;initialize bowser's body controls
             sta BridgeCollapseOffset  ;and bridge collapse offset
             lda Enemy_X_Position,x
             sta BowserOrigXPos        ;store original horizontal position here
             lda #$df
             sta BowserFireBreathTimer ;store something here
             sta Enemy_MovingDir,x     ;and in moving direction
             ldy WorldNumber
             lda BowserPoints,y
             sta BowserHitPoints
             stx temp7
             ldx VRAM_Buffer1_Offset
             lda #$22
             sta VRAM_Buffer1,x
             lda #$c0
             sta VRAM_Buffer1+1,x
             lda #$05
             sta VRAM_Buffer1+2,x
             lda #$11
             sta VRAM_Buffer1+3,x
             lda #$19
             sta VRAM_Buffer1+4,x
             lda #$28
             sta VRAM_Buffer1+5,x
             lda #$00
             sta VRAM_Buffer1+6,x
             lda BowserHitPoints             ;otherwise, check number of pts
             tay
             +
             cmp #10                   ;more than 9 pts?
             bcc ++
             sbc #10                   ;if so, subtract 10 and add one to the 10s digit
             tay
             lda #$01                  ;instead of showing 100 pts, A0 will show, etc.
             sta VRAM_Buffer1+6,x
             tya
             -
             cmp #10
             bcc ++
             sbc #10
             inc VRAM_Buffer1+6,x
             jmp -
             tay
             sta VRAM_Buffer1+6,x
             tya
++:          
             sta VRAM_Buffer1+7,x
             lda #$00
             sta VRAM_Buffer1+8,x
             txa
             add #$08
             sta VRAM_Buffer1_Offset
             ldx temp7
             lda #$20
             sta BowserFeetCounter     ;set bowser's feet timer and in enemy timer
             sta EnemyFrameTimer,x
             sta BowserMovementSpeed   ;set default movement speed here
             rts
             
Setup_Vine:
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
             bne NextVO1               ;if set at all, don't bother to store vertical
             sta VineStart_Y_Position ;otherwise store vertical coordinate here
NextVO1: txa                      ;store object offset to next available vine slot
             sta VineObjOffset,y      ;using vine flag as offset
             inc VineFlagOffset       ;increment vine flag offset
             lda #Sfx_GrowVine
             sta Square2SoundQueue    ;load vine grow sound
             rts
DuplicateEnemyObj:
             ldy #$ff                ;start at beginning of enemy slots
FSLoop: cpy #$05
             beq FlmEx
             iny                     ;increment one slot
             lda Enemy_Flag,y        ;check enemy buffer flag for empty slot
             bne FSLoop              ;if set, branch and keep checking
             sty DuplicateObj_Offset ;otherwise set offset here
             txa                     ;transfer original enemy buffer offset
             ora #%10000000          ;store with d7 set as flag in new enemy
             sta Enemy_Flag,y        ;slot as well as enemy offset
             lda Enemy_PageLoc,x
             sta Enemy_PageLoc,y     ;copy page location and horizontal coordinates
             lda Enemy_X_Position,x  ;from original enemy to new enemy
             sta Enemy_X_Position,y
             lda #$01
             sta Enemy_Flag,x        ;set flag as normal for original enemy
             sta Enemy_Y_HighPos,y   ;set high vertical byte for new enemy
             lda Enemy_Y_Position,x
             sta Enemy_Y_Position,y  ;copy vertical coordinate from original to new
FlmEx:  rts                     ;and then leave
             
             
FlameYPosData:
             .db $90, $80, $70, $90
             
FlameYMFAdderData:
             .db $ff, $01
FW:
             sec
             sbc #$20
             jmp SetFrT
InitBowserFlame:
             lda FrenzyEnemyTimer        ;if timer not expired yet, branch to leave
             bne FlmEx
             sta Enemy_Y_MoveForce,x     ;reset something here
             lda NoiseSoundQueue
             ora #Sfx_BowserFlame        ;load bowser's flame sound into queue
             sta NoiseSoundQueue
             ldy BowserFront_Offset      ;get bowser's buffer offset
             lda Enemy_ID,y              ;check for bowser
             cmp #Bowser
             beq SpawnFromMouth          ;branch if found
             jsr SetFlameTimer           ;get timer data based on flame counter
             clc
             adc #$20                    ;add 32 frames by default
             ldy WorldNumber
             cmp #FinalWorld
             beq FW
			 cmp #World9
			 beq FW
             ldy SecondaryHardMode
             beq SetFrT                  ;if secondary mode flag not set, use as timer setting
             sec
             sbc #$10                    ;otherwise subtract 16 frames for secondary hard mode
SetFrT: sta FrenzyEnemyTimer        ;set timer accordingly
             lda PseudoRandomBitReg,x
             and #%00000011              ;get 2 LSB from first part of LSFR
             sta BowserFlamePRandomOfs,x ;set here
             tay                         ;use as offset
             lda FlameYPosData,y         ;load vertical position based on pseudorandom offset
             
PutAtRightExtent:
             sta Enemy_Y_Position,x    ;set vertical position
             lda ScreenRight_X_Pos
             clc
             adc #$20                  ;place enemy 32 pixels beyond right side of screen
             sta Enemy_X_Position,x
             lda ScreenRight_PageLoc
             adc #$00                  ;add carry
             sta Enemy_PageLoc,x
             jmp FinishFlame           ;skip this part to finish setting values
             
SpawnFromMouth:
             lda Enemy_X_Position,y    ;get bowser's horizontal position
             sec
             sbc #$0e                  ;subtract 14 pixels
             sta Enemy_X_Position,x    ;save as flame's horizontal position
             lda Enemy_PageLoc,y
             sta Enemy_PageLoc,x       ;copy page location from bowser to flame
             lda Enemy_Y_Position,y
             clc                       ;add 8 pixels to bowser's vertical position
             adc #$08
             sta Enemy_Y_Position,x    ;save as flame's vertical position
             lda PseudoRandomBitReg,x
             and #%00000011            ;get 2 LSB from first part of LSFR
             sta Enemy_YMF_Dummy,x     ;save here
             tay                       ;use as offset
             lda FlameYPosData,y       ;get value here using bits as offset
             ldy #$00                  ;load default offset
             cmp Enemy_Y_Position,x    ;compare value to flame's current vertical position
             bcc SetMF                 ;if less, do not increment offset
             iny                       ;otherwise increment now
SetMF: lda FlameYMFAdderData,y   ;get value here and save
             sta Enemy_Y_MoveForce,x   ;to vertical movement force
             lda #$00
             sta EnemyFrenzyBuffer     ;clear enemy frenzy buffer
             
FinishFlame:
             lda #$0d                 ;set $08 for bounding box control
             sta Enemy_BoundBoxCtrl,x
             lda #$01                 ;set high byte of vertical and
             sta Enemy_Y_HighPos,x    ;enemy buffer flag
             sta Enemy_Flag,x
             lsr
             sta Enemy_X_MoveForce,x  ;initialize horizontal movement force, and
             sta Enemy_State,x        ;enemy state
             rts
             
             
FireworksXPosData:
             .db $00, $30, $60, $60, $00, $20
             
FireworksYPosData:
             .db $60, $40, $70, $40, $60, $30
             
ExitFWk: rts
InitFireworks:
             lda FrenzyEnemyTimer         ;if timer not expired yet, branch to leave
             bne ExitFWk
             lda #$20                     ;otherwise reset timer
             sta FrenzyEnemyTimer
             dec FireworksCounter         ;decrement for each explosion
             ldy #$06                     ;start at last slot
StarFChk: dey
             ;lda Enemy_ID,y               ;check for presence of star flag object
             ;cmp #StarFlagObject          ;if there isn't a star flag object,
             ;bne StarFChk                 ;routine goes into infinite loop = crash (fixed)
             lda Enemy_X_Position,y
             sec                          ;get horizontal coordinate of star flag object, then
             sbc #$30                     ;subtract 48 pixels from it and save to
             pha                          ;the stack
             lda Enemy_PageLoc,y
             sbc #$00                     ;subtract the carry from the page location
             sta $00                      ;of the star flag object
             lda FireworksCounter         ;get fireworks counter
             clc
             adc Enemy_State,y            ;add state of star flag object (possibly not necessary)
             tay                          ;use as offset
             pla                          ;get saved horizontal coordinate of star flag - 48 pixels
             clc
             adc FireworksXPosData,y      ;add number based on offset of fireworks counter
             sta Enemy_X_Position,x       ;store as the fireworks object horizontal coordinate
             lda $00
             adc #$00                     ;add carry and store as page location for
             sta Enemy_PageLoc,x          ;the fireworks object
             lda FireworksYPosData,y      ;get vertical position using same offset
             sta Enemy_Y_Position,x       ;and store as vertical coordinate for fireworks object
             lda #$01
             sta Enemy_Y_HighPos,x        ;store in vertical high byte
             sta Enemy_Flag,x             ;and activate enemy buffer flag
             lsr
             sta ExplosionGfxCounter,x    ;initialize explosion counter
             lda #$08
             sta ExplosionTimerCounter,x  ;set explosion timing counter
             rts
             
             
Bitmasks:
             .db %00000001, %00000010, %00000100, %00001000, %00010000, %00100000, %01000000, %10000000
             
Enemy17YPosData:
             .db $40, $30, $90, $50, $20, $60, $a0, $70
             
SwimCC_IDData:
             .db $0a, $0b
             
BulletBillCheepCheep:
             lda FrenzyEnemyTimer      ;if timer not expired yet, branch to leave
             bne ExF17
             lda AreaType              ;are we in a water-type level?
             bne DoBulletBills         ;if not, branch elsewhere
             cpx #$03                  ;are we past third enemy slot?
             bcs ExF17                 ;if so, branch to leave
             ldy #$00                  ;load default offset
             lda PseudoRandomBitReg,x
             cmp #$aa                  ;check first part of LSFR against preset value
             bcc ChkW2                 ;if less than preset, do not increment offset
             iny                       ;otherwise increment
ChkW2:   lda WorldNumber           ;check world number
             cmp #World2
             beq Get17ID               ;if we're on world 2, do not increment offset
             iny                       ;otherwise increment
Get17ID: tya
             and #%00000001            ;mask out all but last bit of offset
             tay
             lda SwimCC_IDData,y       ;load identifier for cheep-cheeps
Set17ID: sta Enemy_ID,x            ;store whatever's in A as enemy identifier
             lda BitMFilter
             cmp #$ff                  ;if not all bits set, skip init part and compare bits
             bne GetRBit
             lda #$00                  ;initialize vertical position filter
             sta BitMFilter
GetRBit: lda PseudoRandomBitReg,x  ;get first part of LSFR
             and #%00000111            ;mask out all but 3 LSB
ChkRBit: tay                       ;use as offset
             lda Bitmasks,y            ;load bitmask
             bit BitMFilter            ;perform AND on filter without changing it
             beq AddFBit
             iny                       ;increment offset
             tya
             and #%00000111            ;mask out all but 3 LSB thus keeping it 0-7
             jmp ChkRBit               ;do another check
AddFBit: ora BitMFilter            ;add bit to already set bits in filter
             sta BitMFilter            ;and store
             lda Enemy17YPosData,y     ;load vertical position using offset
             jsr PutAtRightExtent      ;set vertical position and other values
             sta Enemy_YMF_Dummy,x     ;initialize dummy variable
             lda #$20                  ;set timer
             sta FrenzyEnemyTimer
             jmp CheckpointEnemyID     ;process our new enemy object
             
DoBulletBills:
             ldy #$ff                   ;start at beginning of enemy slots
BB_SLoop: iny                        ;move onto the next slot
             cpy #$05                   ;branch to play sound if we've done all slots
             bcs FireBulletBill
             lda Enemy_Flag,y           ;if enemy buffer flag not set,
             beq BB_SLoop               ;loop back and check another slot
             lda Enemy_ID,y
             cmp #BulletBill_FrenzyVar  ;check enemy identifier for
             bne BB_SLoop               ;bullet bill object (frenzy variant)
ExF17:    rts                        ;if found, leave
             
FireBulletBill:
             lda Square2SoundQueue
             ora #Sfx_Blast            ;play fireworks/gunfire sound
             sta Square2SoundQueue
             lda #BulletBill_FrenzyVar ;load identifier for bullet bill object
             bne Set17ID               ;unconditional branch
             
             
HandleGroupEnemies:
             ldy #$00                  ;load value for green koopa troopa
             sec
             sbc #$37                  ;subtract $37 from second byte read
             pha                       ;save result in stack for now
             cmp #$04                  ;was byte in $3b-$3e range?
             bcs SnglID                ;if so, branch
             pha                       ;save another copy to stack
             ldy #Goomba               ;load value for goomba enemy
             lda PrimaryHardMode       ;if primary hard mode flag not set,
             beq PullID                ;branch, otherwise change to value
             ldy #BuzzyBeetle          ;for buzzy beetle
PullID: pla                       ;get second copy from stack
SnglID: sty $01                   ;save enemy id here
             ldy #$b0                  ;load default y coordinate
             and #$02                  ;check to see if d1 was set
             beq SetYGp                ;if so, move y coordinate up,
             ldy #$70                  ;otherwise branch and use default
SetYGp: sty $00                   ;save y coordinate here
             lda ScreenRight_PageLoc   ;get page number of right edge of screen
             sta $02                   ;save here
             lda ScreenRight_X_Pos     ;get pixel coordinate of right edge
             sta $03                   ;save here
             ldy #$02                  ;load two enemies by default
             pla                       ;get first copy from stack
             lsr                       ;check to see if d0 was set
             bcc CntGrp                ;if not, use default value
             iny                       ;otherwise increment to three enemies
CntGrp: sty NumberofGroupEnemies  ;save number of enemies here
GrLoop: ldx #$ff                  ;start at beginning of enemy buffers
GSltLp: inx                       ;increment and branch if past
             cpx #$05                  ;end of buffers
             bcs NextED
             lda Enemy_Flag,x          ;check to see if enemy is already
             bne GSltLp                ;stored in buffer, and branch if so
             lda $01
             sta Enemy_ID,x            ;store enemy object identifier
             lda $02
             sta Enemy_PageLoc,x       ;store page location for enemy object
             lda $03
             sta Enemy_X_Position,x    ;store x coordinate for enemy object
             clc
             adc #$18                  ;add 24 pixels for next enemy
             sta $03
             lda $02                   ;add carry to page location for
             adc #$00                  ;next enemy
             sta $02
             lda $00                   ;store y coordinate for enemy object
             sta Enemy_Y_Position,x
             lda #$01                  ;activate flag for buffer, and
             sta Enemy_Y_HighPos,x     ;put enemy within the screen vertically
             sta Enemy_Flag,x
             ;get identifier back and use as offset for jump engine
             jsr CheckpointEnemyID     ;process each enemy object separately
             dec NumberofGroupEnemies  ;do this until we run out of enemy objects
             bne GrLoop
NextED: jmp Inc2B                 ;jump to increment data offset and leave
             
PPhitbox: .db $09, $03
InitPiranhaPlant:
             lda Enemy_X_Position,x
             add #$08
             sta Enemy_X_Position,x
             lda Enemy_Y_Position,x
             add #$08
             sta Enemy_Y_Position,x
InitPiranhaPlant1:
             lda #$01                    ;set initial speed
             sta PiranhaPlant_Y_Speed,x
             lsr
             sta Enemy_State,x            ;initialize enemy state and what would normally
             sta PiranhaPlant_MoveFlag,x  ;be used as vertical speed, but not in this case
             lda Enemy_Y_Position,x
             sta PiranhaPlantDownYPos,x   ;save original vertical coordinate here
             sec
             sbc #$19
             sta PiranhaPlantUpYPos,x     ;save original vertical coordinate - 24 pixels here
             ldy HardModeFlag
             lda PPhitbox,y
             jmp SetBBox2                 ;set specific value for bounding box control
             
InitUDPiranhaPlant:
             lda Enemy_X_Position,x
             add #$08
             sta Enemy_X_Position,x
             lda Enemy_Y_Position,x
             add #$06
             sta Enemy_Y_Position,x
InitUDPiranhaPlant1:
             lda #$01                    ;set initial speed
             sta PiranhaPlant_Y_Speed,x
             lsr
             sta Enemy_State,x            ;initialize enemy state and what would normally
             sta PiranhaPlant_MoveFlag,x  ;be used as vertical speed, but not in this case
             lda Enemy_Y_Position,x
             sta PiranhaPlantDownYPos,x   ;save original vertical coordinate here
             sec
             sbc #$19
             sta PiranhaPlantUpYPos,x     ;save original vertical coordinate - 24 pixels here
             lda #$0f
             jmp SetBBox2                 ;set specific value for bounding box control
             
InitEnemyFrenzy:
             lda Enemy_ID,x        ;load enemy identifier
             sta EnemyFrenzyBuffer ;save in enemy frenzy buffer
             sec
             sbc #$12              ;subtract 12 and use as offset for jump engine
             if shufflelevels == 1
             cmp #$06
             bcc +
             lda #$01
+:
             endif
             jsr JumpEngine
             
             .dw InitNormalEnemy
             .dw NoFrenzyCode
             .dw InitFlyingCheepCheep
             .dw InitBowserFlame
             .dw InitFireworks
             .dw BulletBillCheepCheep
             
             
NoFrenzyCode:
             rts
             
             
EndFrenzy:
             ldy #$04               ;start at last slot
LakituChk: lda Enemy_ID,y         ;check enemy identifiers
             cmp #Lakitu            ;for lakitu
             bne NextFSlot
             lda #$01               ;if found, set state
             sta Enemy_State,y
NextFSlot: dey                    ;move onto the next slot
             bpl LakituChk          ;do this until all slots are checked
             lda #$00
             sta EnemyFrenzyBuffer  ;empty enemy frenzy buffer
             sta Enemy_Flag,x       ;disable enemy buffer flag for this object
             rts
             
             
InitJumpGPTroopa:
             lda #$02                  ;set for movement to the left
             sta Enemy_MovingDir,x
             lda #$f8                  ;set horizontal speed
             sta Enemy_X_Speed,x
TallBBox2: lda #$03                  ;set specific value for bounding box control
SetBBox2:  sta Enemy_BoundBoxCtrl,x  ;set bounding box control then leave
             rts
             
             
InitBalPlatform:
             dec Enemy_Y_Position,x    ;raise vertical position by two pixels
             dec Enemy_Y_Position,x
             ldy SecondaryHardMode     ;if secondary hard mode flag not set,
             bne AlignP                ;branch ahead
             ldy #$02                  ;otherwise set value here
             jsr PosPlatform           ;do a sub to add or subtract pixels
AlignP: ldy #$ff                  ;set default value here for now
             lda BalPlatformAlignment  ;get current balance platform alignment
             sta Enemy_State,x         ;set platform alignment to object state here
             bpl SetBPA                ;if old alignment $ff, put $ff as alignment for negative
             txa                       ;if old contents already $ff, put
             tay                       ;object offset as alignment to make next positive
SetBPA: sty BalPlatformAlignment  ;store whatever value's in Y here
             lda #$00
             sta Enemy_MovingDir,x     ;init moving direction
             tay                       ;init Y
             jsr PosPlatform           ;do a sub to add 8 pixels, then run shared code here
             
             
InitDropPlatform:
             lda #$ff
             sta PlatformCollisionFlag,x  ;set some value here
             jmp CommonPlatCode           ;then jump ahead to execute more code
             
             
InitHoriPlatform:
             lda #$00
             sta XMoveSecondaryCounter,x  ;init one of the moving counters
			 lda Enemy_Y_Position,x
			 and #$f0
			 sec
			 sbc #$01
			 sta Enemy_Y_Position,x
             jmp CommonPlatCode           ;jump ahead to execute more code
             
             
InitVertPlatform:
             ldy #$40                    ;set default value here
             lda Enemy_Y_Position,x      ;check vertical position
             bpl SetYO                   ;if above a certain point, skip this part
             eor #$ff
             clc                         ;otherwise get two's compliment
             adc #$01
             ldy #$c0                    ;get alternate value to add to vertical position
SetYO: sta YPlatformTopYPos,x      ;save as top vertical position
             tya
             clc                         ;load value from earlier, add number of pixels 
             adc Enemy_Y_Position,x      ;to vertical position
             sta YPlatformCenterYPos,x   ;save result as central vertical position
             
             
CommonPlatCode: 
             lda #$00                    ;initialize vertical speed
             sta Enemy_Y_Speed,x         ;and movement force
             sta Enemy_Y_MoveForce,x
SPBBox: lda #$05                  ;set default bounding box size control
             ldy AreaType
             cpy #$03                  ;check for castle-type level
             beq CasPBB                ;use default value if found
             ldy SecondaryHardMode     ;otherwise check for secondary hard mode flag
             bne CasPBB                ;if set, use default value
             lda #$06                  ;use alternate value if not castle or secondary not set
CasPBB: sta Enemy_BoundBoxCtrl,x  ;set bounding box size control here and leave
             rts
             
             
LargeLiftUp:
             jsr PlatLiftUp       ;execute code for platforms going up
             jmp LargeLiftBBox    ;overwrite bounding box for large platforms
             
LargeLiftDown:
             jsr PlatLiftDown     ;execute code for platforms going down
             
LargeLiftBBox:
             jmp SPBBox           ;jump to overwrite bounding box size control
             
             
PlatLiftUp:
             lda #$10                 ;set movement amount here
             sta Enemy_Y_MoveForce,x
             lda #$ff                 ;set moving speed for platforms going up
             sta Enemy_Y_Speed,x
             jmp CommonSmallLift      ;skip ahead to part we should be executing
             
             
PlatLiftDown:
             lda #$f0                 ;set movement amount here
             sta Enemy_Y_MoveForce,x
             lda #$00                 ;set moving speed for platforms going down
             sta Enemy_Y_Speed,x
             
             
CommonSmallLift:
             ldy #$01
             jsr PosPlatform           ;do a sub to add 12 pixels due to preset value  
             lda #$04
             sta Enemy_BoundBoxCtrl,x  ;set bounding box control for small platforms
             rts
             
             
PlatPosDataLow:
             .db $08,$0c,$f8
             
PlatPosDataHigh:
             .db $00,$00,$ff
             
PosPlatform:
             lda Enemy_X_Position,x  ;get horizontal coordinate
             clc
             adc PlatPosDataLow,y    ;add or subtract pixels depending on offset
             sta Enemy_X_Position,x  ;store as new horizontal coordinate
             lda Enemy_PageLoc,x
             adc PlatPosDataHigh,y   ;add or subtract page location depending on offset
             sta Enemy_PageLoc,x     ;store as new page location
             rts                     ;and go back
             
             
EndOfEnemyInitCode:
             rts
GameText1:
TopStatusBarLine1:
             ;.db $20, $43, $05, $16, $0a, $1b, $12, $18 ; "MARIO"
             .db $20, $43, $0e, "MARIO"-55, $24, $24, $24, $24, $24, $16, $29, $00, $05
             if CHEATS && CHEAT_REMOVE_TIMER
             .db $20, $52, $05, $20, $18, $1b, $15, $0d ; "WORLD"
             else
             .db $20, $52, $0b, $20, $18, $1b, $15, $0d ; "WORLD  TIME"
             .db $24, $24, $1d, $12, $16, $0e
             endif
             .db $20, $68, $05, $00, $24, $24, $2e, $29 ; score trailing digit and coin display
             .db $23, $c0, $7f, $aa ; attribute table data, clears name table 0 to palette 2
             .db $23, $c2, $01, $ea ; attribute table data, used for coin icon in status bar
             .db $ff ; end of data block
             
WorldLivesDisplay1:
             .db $21, $cd, $07, $24, $24 ; cross with spaces used on
             .db $29, $24, $24, $24, $24 ; lives display
             .db $21, $4b, $09, $20, $18 ; "WORLD  - " used on lives display
             .db $1b, $15, $0d, $24, $24, $28, $24
             .db $22, $0c, $47, $24 ; possibly used to clear time up
             if LIVES_FIX !=1
             .db $23, $dc, $01, $ba ; attribute table data for crown if more than 9 lives
             endif
             .db $ff
             
             ; .db $21, $cd, $05, $16, $0a, $1b, $12, $18 ; "MARIO"
OnePlayerTimeUp1:
             .db $22, $0c, $07, $1d, $12, $16, $0e, $24, $1e, $19 ; "TIME UP"
             .db $ff
             
             if GAME_OVER_MENU == 1
TwoPlayerGameOver1:
             .db $21, $2d, $05, $16, $0a, $1b, $12, $18 ; "MARIO"
OnePlayerGameOver1:
GameOver1:
             .db $21, $6b, $09, $10, $0a, $16, $0e, $24 ;"GAME OVER"
             .db $18, $1f, $0e, $1b
             .db $21, $eb, $08, $0c, $18, $17, $1d, $12, $17, $1e, $0e ;"CONTINUE"
             .db $22, $0c, $47, $24
             .db $22, $4b, $03, "END"-55 ;"END"
             .db $ff
             else
TwoPlayerGameOver1:
             .db $21, $cd, $05, $16, $0a, $1b, $12, $18 ; "MARIO"
OnePlayerGameOver1:
             .db $22, $0b, $09, $10, $0a, $16, $0e, $24 ; "GAME OVER"
             .db $18, $1f, $0e, $1b
             .db $ff
             endif
             
WarpZoneWelcome1:
             .db $25, $84, $15, $20, $0e, $15, $0c, $18, $16 ; "WELCOME TO WARP ZONE!"
             .db $0e, $31, $1d, $18, $30, $20, $0a, $1b, $19
             .db $31, $23, $18, $17, $0e, $2b
             .db $26, $25, $01, $24         ; placeholder for left pipe
             .db $26, $2d, $01, $24         ; placeholder for middle pipe
             .db $26, $35, $01, $24         ; placeholder for right pipe
             .db $27, $d9, $46, $aa         ; attribute data
             .db $27, $e1, $45, $aa
             .db $ff
             
             
GameTextOffsets1:
             .db TopStatusBarLine1-GameText1, TopStatusBarLine1-GameText1
             .db WorldLivesDisplay1-GameText1, WorldLivesDisplay1-GameText1
             .db OnePlayerTimeUp1-GameText1, OnePlayerTimeUp1-GameText1
             .db GameOver1-GameText1, GameOver1-GameText1
             .db WarpZoneWelcome1-GameText1, WarpZoneWelcome1-GameText1
             
WriteGameText1:
             pha                      ;save text number to stack
             asl
             tay                      ;multiply by 2 and use as offset
             cpy #$04                 ;if set to do top status bar or world/lives display,
             bcc LdGameText1           ;branch to use current offset as-is
             cpy #$08                 ;if set to do time-up or game over,
             bcc Chk2Players1         ;branch to check players
             ldy #$08                 ;otherwise warp zone, therefore set offset
Chk2Players1:  ;lda NumberOfPlayers     ;check for number of players
             ;bne LdGameText          ;if there are two, use current offset to also print name
             iny                      ;otherwise increment offset by one to not print name
LdGameText1:   ldx GameTextOffsets1,y    ;get offset to message we want to print
             ldy #$00
GameTextLoop1: lda GameText1,x           ;load message data
             cmp #$ff                 ;check for terminator
             beq EndGameText1          ;branch to end text if found
             sta VRAM_Buffer1,y       ;otherwise write data to buffer
             inx                      ;and increment increment
             iny
             bne GameTextLoop1         ;do this for 256 bytes if no terminator found
EndGameText1:  lda #$00                 ;put null terminator at end
             sta VRAM_Buffer1,y
             pla                      ;pull original text number from stack
             tax
             cmp #$04                 ;are we printing warp zone?
             sbc #$04               ;subtract 4 and then shift to the left
             asl                    ;twice to get proper warp zone number
             asl                    ;offset
             tax
             ldy #$00
WarpNumLoop1:  lda WarpZoneNumbers1,x  ;print warp zone numbers into the
             sta VRAM_Buffer1+27,y  ;placeholders from earlier
             inx
             iny                    ;put a number in every fourth space
             iny
             iny
             iny
             cpy #$0c
             bcc WarpNumLoop1
             lda #$2c               ;load new buffer pointer at end of message
             sta VRAM_Buffer1_Offset
             rts
             
PaletteMTtable:
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             .db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
             
             .db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01    
             .db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
             .db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
             .db $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
             
             .db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02    
             .db $02, $02, $00, $02, $02, $00, $01, $01, $02, $00, $02, $02, $02, $02, $02, $02
             .db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
             .db $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $02
             
             .db $03, $03, $03, $03, $03, $03, $03, $03, $01, $01, $01, $01, $01, $01, $01, $01    
             .db $01, $01, $03, $03, $03, $03, $01, $01, $01, $00, $00, $00, $01, $01, $02, $02
             .db $02, $02, $01, $01, $01, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00
             .db $00, $00, $00, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
             
             
             
             
             
WorldAddrOffsets:
             .db World1Areas-AreaAddrOffsets, World2Areas-AreaAddrOffsets
             .db World3Areas-AreaAddrOffsets, World4Areas-AreaAddrOffsets
             .db World5Areas-AreaAddrOffsets, World6Areas-AreaAddrOffsets
             .db World7Areas-AreaAddrOffsets, World8Areas-AreaAddrOffsets
             .db World9Areas-AreaAddrOffsets ;world 9
             .db WorldAAreas-AreaAddrOffsets
             
AreaAddrOffsets:
World1Areas: .db $45, $49, $80, $46, $c0 ; Why is it $c0 and not $40?  Does it matter?
World2Areas: .db $48, $49, $01, $47, $c2
World3Areas: .db $44, $55, $40, $c3
World4Areas: .db $42, $56, $4c, $c1
World5Areas: .db $4a, $51, $57, $c6
World6Areas: .db $4e, $43, $4d, $c7
World7Areas: .db $53, $5b, $82, $58, $c4
World8Areas: .db $50, $52, $41, $c5
World9Areas: .db $59, $5c, $5a, $c8
WorldAAreas: .db $5d
             
             
             
             
             
             
EnemyAddrHOffsets:
             .db EnemyDataAddrLow_WaterStart - EnemyDataAddrLow          ; Water
             .db EnemyDataAddrLow_GroundStart - EnemyDataAddrLow         ; Ground
             .db EnemyDataAddrLow_UndergroundStart - EnemyDataAddrLow    ; Underground
             .db EnemyDataAddrLow_CastleStart - EnemyDataAddrLow         ; castle
             
EnemyDataAddrLow:
             ; Castle
EnemyDataAddrLow_CastleStart:
             .db <E_CastleArea1, <E_CastleArea2, <E_CastleArea3, <E_CastleArea4, <E_CastleArea5, <E_CastleArea6, <E54, <E64
             ; Ground
EnemyDataAddrLow_GroundStart:
             .db <E_GroundArea1, <E_GroundArea2, <E_GroundArea3, <E_GroundArea4, <E_GroundArea5, <E_GroundArea6
             .db <E_GroundArea7, <E_GroundArea8, <E_GroundArea9, <E_GroundArea10, <E_GroundArea11, <E_GroundArea12
             .db <E_GroundArea13, <E_GroundArea14, <E_GroundArea15, <E_GroundArea16, <E_GroundArea17, <E_GroundArea18
             .db <E_GroundArea19, <E_GroundArea20, <E_GroundArea21, <E_GroundArea22, <E42, <E53, <E73, <E91, <E93, <EntryW7E
			 .db <E92, <EA1
             ; UnderGround
EnemyDataAddrLow_UndergroundStart:
             .db <E_UndergroundArea1, <E_UndergroundArea2, <E_UndergroundArea3
             ; Water
EnemyDataAddrLow_WaterStart:
             .db <E_WaterArea1, <E_WaterArea2, <E_WaterArea3
             
EnemyDataAddrHigh:
             ; Castle
             .db >E_CastleArea1, >E_CastleArea2, >E_CastleArea3, >E_CastleArea4, >E_CastleArea5, >E_CastleArea6, >E54, >E64
             ; Ground
             .db >E_GroundArea1, >E_GroundArea2, >E_GroundArea3, >E_GroundArea4, >E_GroundArea5, >E_GroundArea6
             .db >E_GroundArea7, >E_GroundArea8, >E_GroundArea9, >E_GroundArea10, >E_GroundArea11, >E_GroundArea12
             .db >E_GroundArea13, >E_GroundArea14, >E_GroundArea15, >E_GroundArea16, >E_GroundArea17, >E_GroundArea18
             .db >E_GroundArea19, >E_GroundArea20, >E_GroundArea21, >E_GroundArea22, >E42, >E53, >E73, >E91, >E93, >EntryW7E
			 .db >E92, >EA1
             ; Underground
             .db >E_UndergroundArea1, >E_UndergroundArea2, >E_UndergroundArea3
             ; Water
             .db >E_WaterArea1, >E_WaterArea2, >E_WaterArea3
             
AreaDataHOffsets:
             .db AreaDataAddrLow_WaterStart - AreaDataAddrLow            ; Water
             .db AreaDataAddrLow_GroundStart - AreaDataAddrLow           ; Ground
             .db AreaDataAddrLow_UndergroundStart - AreaDataAddrLow      ; Underground
             .db AreaDataAddrLow_CastleStart - AreaDataAddrLow           ; castle
             
AreaDataAddrLow:
             ; Water
AreaDataAddrLow_WaterStart:
             .db <L_WaterArea1, <L_WaterArea2, <L_WaterArea3
             ; Ground
AreaDataAddrLow_GroundStart:
             .db <L_GroundArea1, <L_GroundArea2, <L_GroundArea3, <L_GroundArea4, <L_GroundArea5, <L_GroundArea6
             .db <L_GroundArea7, <L_GroundArea8, <L_GroundArea9, <L_GroundArea10, <L_GroundArea11, <L_GroundArea12
             .db <L_GroundArea13, <L_GroundArea14, <L_GroundArea15, <L_GroundArea16, <L_GroundArea17, <L_GroundArea18
             .db <L_GroundArea19, <L_GroundArea20, <L_GroundArea21, <L_GroundArea22, <L42, <L53, <L73, <L91, <L93, <EntryW7
			 .db <L92, <LA1
             ; Underground
AreaDataAddrLow_UndergroundStart:
             .db <L_UndergroundArea1, <L_UndergroundArea2, <L_UndergroundArea3
             ; Castle
AreaDataAddrLow_CastleStart:
             .db <L_CastleArea1, <L_CastleArea2, <L_CastleArea3, <L_CastleArea4, <L_CastleArea5, <L_CastleArea6, <L54, <L64
             
AreaDataAddrHigh:
             ; Water
             .db >L_WaterArea1, >L_WaterArea2, >L_WaterArea3
             ; Ground
             .db >L_GroundArea1, >L_GroundArea2, >L_GroundArea3, >L_GroundArea4, >L_GroundArea5, >L_GroundArea6
             .db >L_GroundArea7, >L_GroundArea8, >L_GroundArea9, >L_GroundArea10, >L_GroundArea11, >L_GroundArea12
             .db >L_GroundArea13, >L_GroundArea14, >L_GroundArea15, >L_GroundArea16, >L_GroundArea17, >L_GroundArea18
             .db >L_GroundArea19, >L_GroundArea20, >L_GroundArea21, >L_GroundArea22, >L42, >L53, >L73, >L91, >L93, >EntryW7E
			 .db >L92, >LA1
             ; Underground
             .db >L_UndergroundArea1, >L_UndergroundArea2, >L_UndergroundArea3
             ; Castle
             .db >L_CastleArea1, >L_CastleArea2, >L_CastleArea3, >L_CastleArea4, >L_CastleArea5, >L_CastleArea6, >L54, >L64
             
             
             
             
             pad $a000