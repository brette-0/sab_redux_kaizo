;g1AME l1EVEl1S DAt1A

Worl1dAddrOffset1s:
      .db Worl1d1Areas-AreaAddrOffset1s, Worl1d2Areas-AreaAddrOffset1s
      .db Worl1d3Areas-AreaAddrOffset1s, Worl1d4Areas-AreaAddrOffset1s
      .db Worl1d5Areas-AreaAddrOffset1s, Worl1d6Areas-AreaAddrOffset1s
      .db Worl1d7Areas-AreaAddrOffset1s, Worl1d8Areas-AreaAddrOffset1s

AreaAddrOffset1s:
Worl1d1Areas: .db $20, $02, $60, $03, $07
Worl1d2Areas: .db $21, $22, $40, $23, $61
Worl1d3Areas: .db $24, $22, $04, $25, $62
Worl1d4Areas: .db $26, $27, $28, $63
Worl1d5Areas: .db $29, $2a, $2b, $64
Worl1d6Areas: .db $65, $66, $05, $66, $01, $67, $3a 
Worl1d7Areas: .db $2c, $30, $2e, $2f, $68
Worl1d8Areas: .db $31, $33, $69, $6a

pad $a100
EnemyAddrh1Offset1s:
      .db EnemyDat1aAddrl1ow_Wat1erSt1art1 - EnemyDat1aAddrl1ow          ; Wat1er
      .db EnemyDat1aAddrl1ow_g1roundSt1art1 - EnemyDat1aAddrl1ow         ; g1round
      .db EnemyDat1aAddrl1ow_Underg1roundSt1art1 - EnemyDat1aAddrl1ow    ; Underg1round
      .db EnemyDat1aAddrl1ow_Cast1l1eSt1art1 - EnemyDat1aAddrl1ow         ; cast1l1e

EnemyDat1aAddrl1ow:
      ; Wat1er
      EnemyDat1aAddrl1ow_Wat1erSt1art1:
      .db <E_Wat1erArea1, <E_Wat1erArea2, <E_Wat1erArea3, <E_Wat1erArea4, <E_Wat1erArea5, <E_Wat1erArea6
      .db <E_Wat1erArea7, <E_Wat1erArea8
      ; g1round
      EnemyDat1aAddrl1ow_g1roundSt1art1:
      .db <E_g1roundArea1, <E_g1roundArea2, <E_g1roundArea3, <E_g1roundArea4, <E_g1roundArea5, <E_g1roundArea6
      .db <E_g1roundArea7, <E_g1roundArea8, <E_g1roundArea9, <E_g1roundArea10, <E_g1roundArea11, <E_g1roundArea12
      .db <E_g1roundArea13, <E_g1roundArea14, <E_g1roundArea15, <E_g1roundArea16, <E_g1roundArea17, <E_g1roundArea18
      .db <E_g1roundArea19, <E_g1roundArea20, <E_g1roundArea21, <E_g1roundArea22, <E_g1roundArea23, <E_g1roundArea24
      .db <E_g1roundArea25, <E_g1roundArea26, <E_g1roundArea27
      ; Underg1round
      EnemyDat1aAddrl1ow_Underg1roundSt1art1:
      .db <E_Underg1roundArea1, <E_Underg1roundArea2, <E_Underg1roundArea3, <E_Underg1roundArea4, <E_Underg1roundArea5, <E_Underg1roundArea6
      ; Cast1l1e
      EnemyDat1aAddrl1ow_Cast1l1eSt1art1:
      .db <E_Cast1l1eArea1, <E_Cast1l1eArea2, <E_Cast1l1eArea3, <E_Cast1l1eArea4, <E_Cast1l1eArea5, <E_Cast1l1eArea6
      .db <E_Cast1l1eArea7, <E_Cast1l1eArea8, <E_Cast1l1eArea9, <E_Cast1l1eArea10, <E_Cast1l1eArea11
pad $a180
EnemyDat1aAddrh1ig1h1:
      ; Wat1er
      .db >E_Wat1erArea1, >E_Wat1erArea2, >E_Wat1erArea3, >E_Wat1erArea4, >E_Wat1erArea5, >E_Wat1erArea6
      .db >E_Wat1erArea7, >E_Wat1erArea8
      ; g1round
      .db >E_g1roundArea1, >E_g1roundArea2, >E_g1roundArea3, >E_g1roundArea4, >E_g1roundArea5, >E_g1roundArea6
      .db >E_g1roundArea7, >E_g1roundArea8, >E_g1roundArea9, >E_g1roundArea10, >E_g1roundArea11, >E_g1roundArea12
      .db >E_g1roundArea13, >E_g1roundArea14, >E_g1roundArea15, >E_g1roundArea16, >E_g1roundArea17, >E_g1roundArea18
      .db >E_g1roundArea19, >E_g1roundArea20, >E_g1roundArea21, >E_g1roundArea22, >E_g1roundArea23, >E_g1roundArea24
      .db >E_g1roundArea25, >E_g1roundArea26, >E_g1roundArea27
      ; Underg1round
      .db >E_Underg1roundArea1, >E_Underg1roundArea2, >E_Underg1roundArea3, >E_Underg1roundArea4, >E_Underg1roundArea5, >E_Underg1roundArea6
      ; Cast1l1e
      .db >E_Cast1l1eArea1, >E_Cast1l1eArea2, >E_Cast1l1eArea3, >E_Cast1l1eArea4, >E_Cast1l1eArea5, >E_Cast1l1eArea6
      .db >E_Cast1l1eArea7, >E_Cast1l1eArea8, >E_Cast1l1eArea9, >E_Cast1l1eArea10, >E_Cast1l1eArea11

pad $a200
AreaDat1ah1Offset1s:
      .db AreaDat1aAddrl1ow_Wat1erSt1art1 - AreaDat1aAddrl1ow          ; Wat1er
      .db AreaDat1aAddrl1ow_g1roundSt1art1 - AreaDat1aAddrl1ow         ; g1round
      .db AreaDat1aAddrl1ow_Underg1roundSt1art1 - AreaDat1aAddrl1ow    ; Underg1round
      .db AreaDat1aAddrl1ow_Cast1l1eSt1art1 - AreaDat1aAddrl1ow         ; cast1l1e

AreaDat1aAddrl1ow:
      ; Wat1er
      AreaDat1aAddrl1ow_Wat1erSt1art1:
      .db <l1_Wat1erArea1, <l1_Wat1erArea2, <l1_Wat1erArea3, <l1_Wat1erArea4, <l1_Wat1erArea5, <l1_Wat1erArea6
      .db <l1_Wat1erArea7, <l1_Wat1erArea8
      ; g1round
      AreaDat1aAddrl1ow_g1roundSt1art1:
      .db <l1_g1roundArea1, <l1_g1roundArea2, <l1_g1roundArea3, <l1_g1roundArea4, <l1_g1roundArea5, <l1_g1roundArea6
      .db <l1_g1roundArea7, <l1_g1roundArea8, <l1_g1roundArea9, <l1_g1roundArea10, <l1_g1roundArea11, <l1_g1roundArea12
      .db <l1_g1roundArea13, <l1_g1roundArea14, <l1_g1roundArea15, <l1_g1roundArea16, <l1_g1roundArea17, <l1_g1roundArea18
      .db <l1_g1roundArea19, <l1_g1roundArea20, <l1_g1roundArea21, <l1_g1roundArea22, <l1_g1roundArea23, <l1_g1roundArea24
      .db <l1_g1roundArea25, <l1_g1roundArea26, <l1_g1roundArea27
      ; Underg1round
      AreaDat1aAddrl1ow_Underg1roundSt1art1:
      .db <l1_Underg1roundArea1, <l1_Underg1roundArea2, <l1_Underg1roundArea3, <l1_Underg1roundArea4, <l1_Underg1roundArea5, <l1_Underg1roundArea6
      ; Cast1l1e
      AreaDat1aAddrl1ow_Cast1l1eSt1art1:
      .db <l1_Cast1l1eArea1, <l1_Cast1l1eArea2, <l1_Cast1l1eArea3, <l1_Cast1l1eArea4, <l1_Cast1l1eArea5, <l1_Cast1l1eArea6
      .db <l1_Cast1l1eArea7, <l1_Cast1l1eArea8, <l1_Cast1l1eArea9, <l1_Cast1l1eArea10, <l1_Cast1l1eArea11
pad $a280
AreaDat1aAddrh1ig1h1:
      ; Wat1er
      .db >l1_Wat1erArea1, >l1_Wat1erArea2, >l1_Wat1erArea3, >l1_Wat1erArea4, >l1_Wat1erArea5, >l1_Wat1erArea6
      .db >l1_Wat1erArea7, >l1_Wat1erArea8
      ; g1round
      .db >l1_g1roundArea1, >l1_g1roundArea2, >l1_g1roundArea3, >l1_g1roundArea4, >l1_g1roundArea5, >l1_g1roundArea6
      .db >l1_g1roundArea7, >l1_g1roundArea8, >l1_g1roundArea9, >l1_g1roundArea10, >l1_g1roundArea11, >l1_g1roundArea12
      .db >l1_g1roundArea13, >l1_g1roundArea14, >l1_g1roundArea15, >l1_g1roundArea16, >l1_g1roundArea17, >l1_g1roundArea18
      .db >l1_g1roundArea19, >l1_g1roundArea20, >l1_g1roundArea21, >l1_g1roundArea22, >l1_g1roundArea23, >l1_g1roundArea24
      .db >l1_g1roundArea25, >l1_g1roundArea26, >l1_g1roundArea27
      ; Underg1round
      .db >l1_Underg1roundArea1, >l1_Underg1roundArea2, >l1_Underg1roundArea3, >l1_Underg1roundArea4, >l1_Underg1roundArea5, >l1_Underg1roundArea6
      ; Cast1l1e
      .db >l1_Cast1l1eArea1, >l1_Cast1l1eArea2, >l1_Cast1l1eArea3, >l1_Cast1l1eArea4, >l1_Cast1l1eArea5, >l1_Cast1l1eArea6
      .db >l1_Cast1l1eArea7, >l1_Cast1l1eArea8, >l1_Cast1l1eArea9, >l1_Cast1l1eArea10, >l1_Cast1l1eArea11

E_Wat1erArea1:
      .db $3b, $87, $66, $27, $cc, $27, $3b, $87, $db, $07
      .db $ee, $aa, $8a, $ff

E_Wat1erArea2:
      .db $9a, $9b, $8b, $82, $4b, $b7, $33, $90, $64, $87
      .db $23, $87, $6a, $8a, $85, $2c, $8a, $2c, $e7, $0a
      .db $0f, $09, $95, $05, $d5, $05, $ff

E_Wat1erArea3:
      .db $6b, $86, $72, $11, $0f, $03, $eb, $02, $92, $91
      .db $0f, $06, $02, $11, $d4, $05, $ab, $8d, $6b, $b7
      .db $cb, $bc, $ff

E_Wat1erArea4:
      .db $6b, $b8, $d9, $08, $f5, $02, $bb, $87, $3b, $bb
      .db $a9, $05, $0b, $9f, $6b, $01, $ff

E_Wat1erArea5:
      .db $0f, $02, $57, $3d, $36, $87, $eb, $87, $64, $87
      .db $22, $87, $9b, $3b, $05, $a7, $0c, $27, $82, $26
      .db $89, $26, $a4, $87, $78, $9b, $c6, $07, $fb, $3c
      .db $bb, $bb, $39, $87, $ee, $32, $41, $ff

E_Wat1erArea6:
      .db $34, $86, $54, $06, $b8, $03, $f4, $07, $eb, $bb
      .db $bb, $80, $eb, $06, $2b, $8c, $f3, $1f, $0f, $06
      .db $6b, $38, $b7, $05, $e3, $05, $0f, $08, $a7, $3e
      .db $c6, $07, $cc, $0c, $2b, $83, $4b, $03, $b8, $07
      .db $ff

E_Wat1erArea7:
      .db $69, $87, $03, $a6, $64, $07, $87, $a6, $17, $87
      .db $ae, $65, $ae, $ff

E_Wat1erArea8:
      .db $ff

E_g1roundArea1:
      .db $6e, $81, $00, $ff

E_g1roundArea2:
      .db $3b, $81, $8b, $38, $27, $80, $67, $b9, $8b, $02
      .db $2b, $83, $37, $85, $73, $05, $0e, $c3, $20, $7b
      .db $37, $77, $07, $6b, $bb, $b7, $03, $0f, $09, $1b
      .db $38, $5a, $0f, $26, $8e, $96, $0e, $eb, $37, $a7
      .db $80, $ff

E_g1roundArea3:
      .db $ff

E_g1roundArea4:
      .db $57, $83, $52, $8f, $d7, $07, $76, $83, $7b, $80
      .db $b4, $07, $5b, $bc, $a8, $10, $74, $87, $f7, $03
      .db $62, $8b, $b2, $18, $e8, $02, $ff

E_g1roundArea5:
      .db $4b, $8e, $eb, $38, $7b, $86, $8b, $bc, $9e, $43
      .db $46, $1b, $80, $ab, $38, $56, $8f, $0b, $b7, $a7
      .db $03, $67, $85, $a3, $00, $9b, $86, $b9, $06, $47
      .db $87, $83, $03, $9e, $38, $40, $a6, $03, $bb, $3c
      .db $ab, $b7, $e6, $04, $b5, $82, $e3, $02, $ff

E_g1roundArea6:
      .db $c7, $8f, $c5, $a4, $fa, $0a, $17, $a4, $97, $0f
      .db $65, $a4, $b9, $24, $0a, $97, $b9, $02, $0f, $07
      .db $53, $03, $cb, $03, $a2, $8e, $bb, $02, $db, $02
      .db $b1, $8e, $ff

E_g1roundArea7:
      .db $17, $8e, $54, $0f, $2b, $82, $9b, $82, $27, $8e
      .db $cb, $38, $cb, $b7, $0b, $82, $5b, $02, $9e, $43
      .db $64, $23, $82, $8b, $02, $c8, $8f, $3e, $b5, $60
      .db $74, $06, $a4, $06, $1b, $8e, $7b, $bc, $d5, $07
      .db $a7, $82, $d4, $02, $ff

E_g1roundArea8:
      .db $96, $8f, $ac, $14, $c3, $86, $18, $87, $68, $82
      .db $d9, $0f, $3a, $82, $65, $07, $f9, $29, $26, $90
      .db $18, $83, $f6, $0f, $c5, $86, $ff

E_g1roundArea9:
      .db $0f, $02, $67, $01, $07, $8e, $d7, $be, $f8, $83
      .db $0f, $07, $77, $03, $c1, $11, $c7, $ba, $c8, $90
      .db $ff

E_g1roundArea10:
      .db $1b, $bc, $eb, $3c, $6b, $b8, $48, $85, $98, $00
      .db $1b, $8e, $eb, $3c, $6b, $b8, $7b, $80, $86, $03
      .db $a9, $9f, $b3, $85, $d7, $05, $e5, $8f, $ab, $b8
      .db $0f, $0d, $38, $10, $bb, $b8, $1b, $82, $4b, $02
      .db $0b, $bc, $8b, $38, $bb, $8e, $0f, $13, $89, $0e
      .db $1a, $9e, $88, $9f, $ff

E_g1roundArea11:
      .db $cb, $80, $95, $90, $07, $85, $5b, $b8, $8b, $02
      .db $0f, $06, $4b, $0e, $ab, $0e, $8b, $85, $b7, $05
      .db $1b, $bb, $2e, $00, $80, $76, $03, $d4, $03, $63
      .db $90, $07, $90, $8b, $37, $a7, $0e, $7b, $b7, $a7
      .db $0e, $ff

E_g1roundArea12:
      .db $fb, $bc, $0f, $03, $3b, $38, $c6, $07, $73, $85
      .db $77, $05, $0f, $07, $77, $05, $a3, $05, $18, $8e
      .db $9c, $1c, $fb, $3c, $0f, $0b, $03, $03, $ff

E_g1roundArea13:
      .db $3b, $bb, $57, $85, $9b, $05, $67, $b9, $ce, $2d
      .db $c0, $ff

E_g1roundArea14:
      .db $6b, $b7, $f7, $10, $0f, $03, $9b, $3c, $0f, $06
      .db $cb, $3b, $3d, $a7, $85, $0f, $4d, $a6, $6b, $b8
      .db $f3, $0f, $0f, $0b, $17, $05, $53, $05, $6a, $a9
      .db $76, $83, $e3, $03, $1b, $b8, $27, $8e, $63, $0e
      .db $ff

E_g1roundArea15:
      .db $5b, $b7, $fb, $0e, $0f, $03, $27, $05, $63, $05
      .db $db, $0e, $0f, $05, $a7, $0f, $6b, $82, $7b, $8e
      .db $ee, $45, $c0, $0f, $09, $ab, $3c, $1b, $b8, $17
      .db $85, $23, $05, $a9, $80, $c7, $00, $94, $83, $a2
      .db $8f, $7b, $b8, $db, $03, $fb, $03, $7b, $8e, $95
      .db $8f, $57, $bd, $fb, $b7, $ff

E_g1roundArea16:
      .db $14, $8f, $f4, $03, $24, $82, $28, $9c, $fa, $06
      .db $2e, $c5, $c2, $e3, $10, $73, $86, $d5, $1d, $cb
      .db $b7, $f5, $0e, $0f, $08, $d3, $06, $15, $a4, $7a
      .db $24, $68, $a4, $e3, $10, $e6, $24, $45, $83, $c8
      .db $03, $64, $8f, $27, $82, $63, $02, $ff

E_g1roundArea17:
      .db $ff

E_g1roundArea18:
      .db $cb, $b8, $e6, $80, $6e, $b8, $e0, $6b, $bc, $b6
      .db $02, $d6, $00, $64, $8f, $46, $8f, $db, $b8, $ee
      .db $c2, $e0, $fb, $38, $ff

E_g1roundArea19:
      .db $ff

E_g1roundArea20:
      .db $2b, $97, $e5, $06, $85, $87, $9a, $8e, $fa, $0f
      .db $56, $8a, $07, $8e, $19, $07, $c2, $07, $f2, $06
      .db $29, $97, $5b, $03, $b7, $0e, $23, $8e, $89, $03
      .db $2b, $83, $9d, $28, $2c, $87, $97, $07, $d3, $0e
      .db $e4, $86, $ff

E_g1roundArea21:
      .db $a3, $8e, $03, $8e, $f7, $10, $54, $8e, $a4, $0e
      .db $ff

E_g1roundArea22:
      .db $0e, $26, $6c, $0a, $aa, $ff

E_g1roundArea23:
      .db $15, $87, $cb, $38, $0f, $03, $0c, $1b, $57, $0e
      .db $6e, $44, $80, $ff

E_g1roundArea24:
      .db $ff

E_g1roundArea25:
      .db $0e, $24, $4b, $0e, $31, $e6, $0a, $aa, $ff

E_g1roundArea26:
      .db $ff

E_g1roundArea27:
      .db $73, $82, $47, $b9, $fa, $0c, $76, $a5, $47, $83
      .db $7a, $0c, $7a, $8c, $e6, $82, $16, $82, $fa, $0c
      .db $0f, $09, $18, $0e, $ff

E_Underg1roundArea1:
      .db $56, $ab, $47, $87, $8b, $00, $bb, $06, $38, $83
      .db $68, $03, $94, $87, $cb, $01, $97, $ba, $9b, $82
      .db $0f, $09, $0b, $3c, $89, $29, $08, $a9, $a7, $05
      .db $6e, $b2, $21, $ff

E_Underg1roundArea2:
      .db $0a, $8c, $78, $03, $a8, $03, $0f, $03, $59, $1c
      .db $b5, $1b, $0f, $05, $4c, $1e, $d6, $1b, $0f, $07
      .db $5b, $3c, $38, $83, $7b, $bc, $9a, $1c, $b7, $a9
      .db $15, $a9, $31, $4c, $ce, $37, $a1, $ff

E_Underg1roundArea3:
      .db $fb, $03, $0f, $02, $25, $0f, $fb, $3c, $4e, $c5
      .db $e6, $86, $0e, $d7, $8e, $fb, $83, $1b, $83, $3b
      .db $b7, $a7, $ba, $57, $9e, $f4, $1e, $14, $a6, $1b
      .db $26, $66, $85, $92, $05, $7b, $bc, $d2, $26, $d9
      .db $26, $6e, $b2, $e1, $ff

E_Underg1roundArea4:
      .db $de, $21, $2a, $0f, $04, $de, $26, $6a, $0f, $06
      .db $de, $24, $44, $0f, $08, $de, $61, $27, $ff

E_Underg1roundArea5:
      .db $ee, $e4, $90, $ff

E_Underg1roundArea6:
      .db $de, $2e, $ca, $0f, $02, $de, $2f, $c6, $0f, $06
      .db $de, $42, $e5, $ff

E_Cast1l1eArea1:
      .db $0f, $06, $03, $18, $0d, $98, $59, $ad, $ff

E_Cast1l1eArea2:
      .db $7a, $9d, $dc, $29, $e5, $1d, $8b, $8c, $07, $86
      .db $b7, $3d, $f7, $06, $99, $9d, $e4, $1b, $0e, $c3
      .db $28, $4b, $02, $7b, $0c, $84, $1b, $82, $15, $c4
      .db $07, $68, $83, $0f, $08, $78, $2d, $a6, $28, $9b
      .db $b5, $ff

E_Cast1l1eArea3:
      .db $09, $9d, $7b, $3c, $eb, $06, $0f, $03, $5b, $37
      .db $bc, $1d, $e1, $18, $15, $9d, $2c, $1b, $ec, $1d
      .db $f5, $1b, $12, $95, $9b, $0c, $e7, $02, $38, $8c
      .db $78, $10, $db, $0c, $0f, $08, $78, $2d, $a6, $28
      .db $9b, $b5, $ff

E_Cast1l1eArea4:
      .db $28, $9f, $ab, $37, $d8, $1f, $dc, $9b, $06, $9d
      .db $9c, $1b, $d7, $1d, $3b, $b7, $9d, $0c, $18, $83
      .db $22, $15, $ad, $0c, $c4, $1b, $f8, $02, $8b, $b7
      .db $cb, $0c, $2b, $8c, $3a, $9c, $78, $2d, $a6, $28
      .db $9b, $b5, $ff

E_Cast1l1eArea5:
      .db $0f, $03, $3e, $64, $81, $bb, $3c, $6d, $a8, $1e
      .db $e4, $87, $0f, $08, $0b, $0e, $4e, $64, $81, $47
      .db $07, $bb, $38, $66, $90, $a5, $0f, $be, $64, $8c
      .db $0f, $0c, $ce, $64, $81, $08, $ad, $4e, $b6, $80
      .db $0f, $11, $fb, $15, $3a, $9b, $78, $2d, $ab, $0c
      .db $9b, $b5, $ff

E_Cast1l1eArea6:
      .db $75, $87, $c7, $1f, $4b, $b7, $59, $83, $b8, $03
      .db $8b, $bc, $ae, $06, $a0, $3b, $82, $33, $85, $37
      .db $05, $c9, $1c, $a3, $8f, $bb, $3c, $65, $9f, $7b
      .db $38, $0b, $80, $2b, $00, $57, $b9, $f6, $10, $fb
      .db $b7, $67, $8e, $ea, $0e, $7b, $bb, $b7, $b9, $ff

E_Cast1l1eArea7:
      .db $ff

E_Cast1l1eArea8:
      .db $bb, $bc, $09, $9c, $8a, $1c, $6b, $8c, $89, $28
      .db $ab, $0c, $0a, $9c, $6a, $1d, $ca, $1b, $29, $95
      .db $8e, $39, $a1, $1b, $8c, $db, $38, $3a, $8c, $ba
      .db $0c, $2b, $9c, $07, $9c, $78, $ad, $a6, $28, $ff

E_Cast1l1eArea9:
      .db $18, $80, $48, $00, $99, $1f, $ca, $29, $76, $9b
      .db $b6, $1e, $f6, $1d, $0f, $04, $1b, $0c, $c5, $1d
      .db $45, $9d, $93, $15, $c5, $1d, $29, $87, $ab, $8c
      .db $0b, $8c, $6b, $0c, $f7, $1c, $a4, $9f, $78, $ad
      .db $a6, $28, $ff

E_Cast1l1eArea10:
      .db $88, $85, $0f, $03, $0c, $1d, $67, $1d, $cc, $1d
      .db $fb, $83, $c9, $9d, $49, $9d, $c9, $1d, $0f, $08
      .db $09, $07, $c7, $07, $0f, $0a, $14, $0f, $6e, $34
      .db $e0, $ff

E_Cast1l1eArea11:
      .db $35, $9d, $89, $1d, $49, $9b, $c9, $1b, $49, $9d
      .db $49, $9b, $b5, $1b, $29, $9b, $9c, $1d, $99, $9f
      .db $0f, $08, $4a, $1b, $78, $2d, $a6, $28, $ff

l1_Wat1erArea1:
      .db $41, $01, $b4, $34, $c8, $52, $f2, $51, $47, $d3
      .db $65, $49, $6c, $03, $9e, $07, $be, $01, $cc, $03
      .db $fe, $07, $0d, $c9, $1e, $01, $62, $35, $63, $53
      .db $6c, $01, $8a, $41, $ac, $01, $b3, $53, $e9, $51
      .db $26, $c3, $27, $33, $63, $43, $64, $33, $ba, $60
      .db $c9, $61, $ce, $0b, $e5, $09, $ee, $0f, $7d, $ca
      .db $7d, $47, $fd

l1_Wat1erArea2:
      .db $48, $a1, $0a, $60, $19, $61, $29, $71, $49, $61
      .db $5a, $30, $33, $f7, $98, $0a, $d6, $36, $ea, $10
      .db $05, $90, $30, $f5, $30, $29, $36, $21, $5e, $00
      .db $7e, $21, $b0, $77, $b8, $35, $17, $84, $26, $06
      .db $35, $04, $0c, $f4, $24, $12, $00, $e6, $70, $67
      .db $d8, $62, $e9, $61, $fa, $60, $9c, $80, $9f, $06
      .db $c7, $46, $3a, $e0, $49, $61, $59, $71, $79, $61
      .db $8a, $30, $dc, $74, $f4, $11, $f6, $10, $75, $a8
      .db $3f, $b8, $3d, $c1, $7f, $26, $fd

l1_Wat1erArea3:
      .db $50, $31, $0f, $26, $a9, $71, $f7, $73, $35, $f5
      .db $95, $65, $9e, $10, $b2, $71, $b4, $25, $24, $f2
      .db $27, $24, $47, $50, $79, $29, $87, $71, $e6, $72
      .db $6e, $b1, $79, $23, $85, $73, $17, $a5, $24, $43
      .db $35, $71, $fe, $30, $2e, $b1, $48, $24, $55, $72
      .db $b7, $24, $d3, $73, $2a, $c5, $c8, $23, $d4, $73
      .db $37, $f1, $39, $21, $7e, $00, $ab, $61, $bb, $61
      .db $de, $31, $85, $93, $8e, $10, $c7, $12, $f4, $14
      .db $fe, $31, $d8, $e2, $0d, $ca, $4f, $38, $4d, $c1
      .db $8f, $26, $6d, $c6, $fd

l1_Wat1erArea4:
      .db $97, $01, $0f, $26, $d3, $32, $e3, $67, $25, $e5
      .db $37, $31, $55, $65, $86, $64, $95, $31, $98, $31
      .db $b6, $64, $e5, $65, $f5, $30, $06, $e0, $17, $30
      .db $25, $65, $55, $65, $67, $60, $76, $60, $78, $60
      .db $85, $31, $89, $60, $9a, $30, $c2, $60, $d3, $30
      .db $e4, $66, $f3, $30, $02, $e0, $25, $63, $34, $31
      .db $39, $31, $55, $63, $84, $64, $99, $32, $c4, $64
      .db $02, $e5, $09, $60, $8b, $60, $e7, $63, $ed, $42
      .db $0d, $06, $3e, $42, $6f, $20, $ce, $47, $3d, $c7
      .db $fd

l1_Wat1erArea5:
      .db $49, $00, $0e, $01, $5e, $02, $ac, $04, $c1, $53
      .db $0c, $84, $21, $52, $4e, $04, $6d, $49, $ba, $60
      .db $c9, $61, $d8, $62, $de, $0b, $5e, $81, $98, $52
      .db $c7, $53, $1c, $85, $29, $43, $83, $34, $84, $61
      .db $8e, $00, $a0, $65, $c4, $61, $27, $c4, $2e, $01
      .db $53, $35, $88, $52, $b0, $63, $b7, $53, $f4, $56
      .db $17, $d3, $40, $64, $78, $52, $a0, $64, $c6, $54
      .db $25, $b0, $35, $61, $37, $30, $44, $60, $45, $61
      .db $56, $60, $9c, $0f, $e2, $41, $e3, $65, $f3, $65
      .db $53, $e5, $63, $65, $9c, $08, $d2, $41, $d3, $65
      .db $e3, $65, $22, $e8, $80, $67, $ba, $43, $f5, $55
      .db $0c, $84, $76, $30, $a0, $63, $fe, $03, $18, $d2
      .db $43, $49, $46, $54, $de, $01, $7c, $81, $8e, $01
      .db $aa, $60, $b9, $61, $c8, $62, $ce, $0b, $e4, $60
      .db $e5, $09, $ee, $0f, $0d, $ca, $7d, $46, $fd

l1_Wat1erArea6:
      .db $4f, $8f, $0e, $41, $1e, $00, $6c, $05, $c9, $73
      .db $14, $e0, $24, $61, $34, $62, $44, $63, $54, $63
      .db $64, $62, $74, $61, $84, $60, $b8, $60, $cc, $05
      .db $03, $c2, $28, $52, $54, $56, $6a, $43, $82, $34
      .db $b0, $61, $c3, $55, $dc, $02, $09, $f3, $2c, $01
      .db $3e, $0b, $67, $75, $7e, $03, $98, $12, $de, $05
      .db $fe, $01, $0c, $84, $4e, $02, $58, $74, $da, $60
      .db $e9, $61, $f1, $0a, $f8, $62, $fe, $02, $0c, $8b
      .db $35, $45, $c8, $74, $4e, $81, $83, $27, $87, $27
      .db $37, $f5, $55, $77, $7c, $02, $84, $40, $87, $40
      .db $9e, $02, $a1, $52, $01, $d3, $61, $51, $6a, $60
      .db $79, $61, $84, $41, $88, $62, $97, $63, $9e, $00
      .db $ac, $04, $0e, $80, $88, $12, $8e, $02, $91, $51
      .db $9c, $02, $d1, $52, $1f, $ca, $4e, $0f, $2d, $c6
      .db $fd

l1_Wat1erArea7:
      .db $04, $81, $00, $6c, $0e, $41, $39, $73, $dd, $48
      .db $e0, $64, $f5, $4c, $c0, $e4, $fc, $04, $45, $cf
      .db $69, $e2, $7c, $04, $88, $42, $c9, $62, $5d, $ca
      .db $70, $34, $81, $52, $af, $4a, $b1, $51, $4d, $c7
      .db $fd

l1_Wat1erArea8:
      .db $52, $31, $0f, $20, $6e, $46, $26, $81, $36, $01
      .db $46, $00, $aa, $22, $08, $f2, $27, $73, $45, $75
      .db $cb, $71, $eb, $71, $79, $f1, $98, $72, $d7, $23
      .db $17, $f3, $9a, $34, $a9, $33, $b8, $32, $77, $f3
      .db $03, $a1, $07, $21, $23, $01, $27, $00, $43, $77
      .db $73, $22, $77, $22, $04, $d6, $36, $54, $8f, $35
      .db $07, $a4, $34, $05, $44, $07, $6f, $38, $40, $e4
      .db $50, $66, $60, $68, $93, $77, $da, $60, $e8, $62
      .db $f5, $65, $08, $e2, $1a, $60, $7f, $38, $47, $e3
      .db $4d, $42, $bd, $47, $fd

l1_g1roundArea1:
      .db $50, $01, $00, $3e, $0e, $33, $9f, $34, $ae, $31
      .db $e6, $03, $68, $fa, $de, $2f, $6d, $c6, $fd

l1_g1roundArea2:
      .db $52, $71, $0f, $20, $6e, $40, $fc, $63, $fc, $74
      .db $33, $80, $d8, $62, $27, $e3, $37, $03, $67, $73
      .db $8c, $03, $ca, $44, $1f, $b3, $5c, $71, $bc, $03
      .db $26, $a0, $33, $07, $43, $22, $99, $71, $b7, $73
      .db $da, $45, $1c, $f7, $3c, $67, $b7, $63, $cc, $03
      .db $06, $fc, $48, $42, $ac, $02, $0a, $b1, $19, $31
      .db $28, $31, $a7, $73, $ca, $45, $e4, $22, $28, $f2
      .db $4c, $04, $cc, $73, $15, $f5, $3c, $04, $88, $72
      .db $df, $32, $07, $e3, $16, $64, $26, $26, $39, $71
      .db $78, $45, $96, $00, $f9, $0b, $0c, $85, $7f, $38
      .db $7d, $c1, $cf, $26, $fd

l1_g1roundArea3:
      .db $38, $31, $0f, $26, $ad, $40, $3d, $c7, $fd

l1_g1roundArea4:
      .db $90, $50, $0b, $1f, $0f, $26, $44, $c2, $47, $14
      .db $85, $0b, $ad, $48, $01, $c4, $02, $16, $a8, $16
      .db $d4, $00, $d7, $42, $36, $9c, $55, $43, $d3, $21
      .db $f3, $06, $1b, $99, $8a, $42, $eb, $17, $59, $8b
      .db $c5, $42, $c6, $16, $1c, $e1, $68, $41, $69, $73
      .db $b7, $14, $c6, $43, $23, $96, $b8, $14, $f6, $0b
      .db $72, $ea, $82, $6a, $92, $6a, $ed, $4a, $2e, $b1
      .db $3d, $41, $5e, $42, $8f, $20, $fd

l1_g1roundArea5:
      .db $52, $a1, $0f, $20, $6e, $40, $07, $e3, $77, $00
      .db $8c, $72, $0c, $82, $37, $73, $57, $07, $dc, $02
      .db $96, $fc, $e8, $72, $39, $f1, $d9, $0b, $ec, $07
      .db $63, $83, $67, $63, $78, $62, $89, $61, $9a, $30
      .db $ee, $01, $08, $f2, $47, $21, $67, $07, $7e, $21
      .db $97, $73, $37, $aa, $43, $24, $93, $00, $a3, $22
      .db $f9, $11, $2c, $80, $5c, $00, $6a, $10, $76, $42
      .db $b9, $73, $0c, $84, $27, $41, $77, $01, $83, $01
      .db $87, $20, $93, $05, $96, $21, $97, $07, $a3, $20
      .db $a7, $21, $b3, $01, $c7, $01, $68, $92, $c8, $62
      .db $d7, $63, $e6, $64, $f7, $63, $08, $e2, $6f, $38
      .db $7d, $c1, $bf, $26, $fd

l1_g1roundArea6:
      .db $90, $11, $0f, $26, $fe, $10, $28, $96, $47, $44
      .db $e9, $15, $18, $c2, $6b, $15, $82, $00, $89, $0b
      .db $dc, $15, $df, $11, $2f, $93, $a7, $16, $7c, $95
      .db $7f, $11, $cf, $15, $db, $15, $f2, $41, $f3, $12
      .db $f6, $03, $79, $94, $93, $12, $a1, $71, $13, $c1
      .db $14, $73, $18, $31, $67, $13, $76, $41, $ba, $12
      .db $d8, $0b, $33, $94, $bb, $12, $d5, $30, $13, $8b
      .db $15, $30, $1b, $1f, $47, $12, $72, $13, $81, $41
      .db $ed, $4a, $10, $c0, $12, $30, $72, $16, $a1, $43
      .db $5e, $81, $7d, $41, $9e, $42, $cf, $20, $fd

l1_g1roundArea7:
      .db $52, $b1, $0f, $20, $6e, $44, $07, $f3, $2c, $03
      .db $65, $75, $8c, $05, $ec, $63, $ec, $74, $23, $80
      .db $4c, $03, $97, $73, $b7, $07, $d3, $25, $ec, $02
      .db $29, $f3, $33, $08, $5c, $00, $7c, $72, $cc, $03
      .db $17, $f3, $69, $71, $f7, $11, $f9, $11, $0c, $84
      .db $87, $06, $d8, $11, $da, $10, $37, $a1, $47, $04
      .db $96, $7c, $b6, $07, $ea, $60, $fc, $54, $03, $a2
      .db $4a, $60, $d7, $13, $2c, $84, $9c, $03, $d7, $73
      .db $f7, $00, $07, $81, $34, $05, $44, $27, $4c, $09
      .db $73, $44, $39, $f1, $58, $72, $77, $73, $9c, $03
      .db $04, $a9, $53, $44, $91, $03, $18, $92, $7f, $35
      .db $d4, $66, $e3, $67, $f3, $67, $8d, $c1, $cf, $26
      .db $fd

l1_g1roundArea8:
      .db $96, $11, $0f, $26, $bf, $32, $ec, $00, $fe, $10
      .db $38, $93, $57, $41, $ca, $12, $d8, $40, $3c, $b4
      .db $66, $41, $b3, $12, $2b, $98, $58, $00, $67, $41
      .db $68, $21, $b7, $41, $b8, $72, $bb, $16, $48, $94
      .db $fa, $62, $0c, $c9, $66, $42, $96, $01, $a6, $01
      .db $aa, $62, $55, $93, $d8, $64, $ec, $3a, $55, $c3
      .db $98, $64, $0e, $91, $1d, $4a, $7f, $33, $b6, $64
      .db $c5, $65, $d4, $66, $e3, $67, $f3, $67, $8d, $c1
      .db $df, $26, $fd

l1_g1roundArea9:
      .db $97, $11, $0f, $26, $af, $33, $e7, $63, $fc, $2f
      .db $fc, $0f, $0d, $c8, $d3, $01, $e3, $00, $f7, $65
      .db $0c, $ae, $0c, $0e, $83, $43, $f7, $65, $0c, $ae
      .db $0c, $0e, $a3, $40, $b3, $40, $f7, $65, $fe, $10
      .db $48, $e4, $5c, $39, $a4, $43, $f8, $64, $58, $e4
      .db $6c, $38, $c4, $23, $d3, $42, $f8, $64, $47, $e5
      .db $5c, $22, $63, $06, $87, $65, $c5, $15, $f3, $42
      .db $67, $92, $f8, $64, $0c, $bc, $0d, $49, $53, $43
      .db $d8, $64, $2a, $e2, $3c, $47, $56, $43, $ba, $62
      .db $f8, $64, $0c, $b7, $88, $64, $b3, $40, $b5, $30
      .db $01, $92, $10, $40, $8a, $62, $9c, $47, $b6, $43
      .db $1a, $e2, $5d, $4a, $66, $13, $ce, $11, $ec, $00
      .db $0f, $b8, $c6, $07, $1d, $c1, $3e, $42, $6f, $20
      .db $fd

l1_g1roundArea10:
      .db $92, $a1, $0f, $20, $6e, $45, $38, $f2, $97, $22
      .db $06, $f4, $9c, $04, $38, $81, $48, $00, $88, $72
      .db $25, $a3, $65, $03, $78, $72, $86, $c2, $c9, $71
      .db $ec, $06, $76, $a3, $95, $41, $0c, $f3, $a7, $0a
      .db $18, $f2, $87, $28, $a3, $28, $13, $87, $17, $04
      .db $97, $63, $a6, $64, $bc, $06, $26, $e4, $37, $63
      .db $b7, $23, $bc, $64, $f7, $07, $2b, $f1, $9c, $05
      .db $58, $f2, $96, $06, $a6, $23, $c5, $41, $0c, $85
      .db $a9, $11, $ea, $10, $0c, $84, $0d, $11, $0f, $34
      .db $55, $42, $56, $32, $d7, $73, $0c, $84, $5c, $71
      .db $77, $00, $8c, $04, $d6, $74, $f7, $73, $18, $f2
      .db $aa, $41, $cc, $04, $18, $8a, $19, $61, $48, $72
      .db $e9, $71, $86, $8a, $27, $87, $37, $73, $7c, $00
      .db $88, $62, $9c, $02, $c5, $65, $dc, $01, $f4, $66
      .db $03, $e7, $8d, $41, $cf, $26, $fd

l1_g1roundArea11:
      .db $55, $a1, $0f, $26, $7c, $03, $0f, $b5, $89, $71
      .db $b7, $01, $c7, $22, $d6, $41, $16, $94, $2c, $59
      .db $81, $42, $cf, $33, $07, $a2, $4a, $60, $5c, $54
      .db $a7, $63, $04, $81, $34, $01, $37, $00, $64, $01
      .db $aa, $41, $cf, $33, $0c, $d3, $47, $63, $58, $62
      .db $69, $30, $6a, $31, $9a, $41, $bc, $03, $78, $92
      .db $f7, $11, $f9, $11, $43, $a8, $46, $42, $47, $28
      .db $28, $fa, $73, $41, $76, $74, $a7, $03, $d1, $41
      .db $d4, $76, $fc, $09, $97, $e3, $ac, $06, $18, $f2
      .db $39, $71, $77, $00, $8c, $72, $bc, $05, $7f, $b2
      .db $a7, $63, $bc, $02, $e3, $67, $f3, $67, $0c, $86
      .db $7d, $41, $bf, $26, $fd

l1_g1roundArea12:
      .db $95, $a1, $0f, $26, $a9, $11, $08, $92, $1c, $04
      .db $5e, $42, $fe, $45, $07, $a3, $47, $06, $4e, $42
      .db $4e, $c5, $5c, $05, $b8, $10, $b9, $11, $27, $a7
      .db $2c, $66, $93, $00, $d8, $62, $e8, $62, $fc, $05
      .db $4e, $c5, $56, $14, $81, $43, $83, $77, $a3, $77
      .db $e4, $16, $fe, $42, $48, $e2, $76, $07, $b8, $62
      .db $fe, $45, $53, $a7, $57, $27, $08, $f2, $2c, $06
      .db $9a, $0a, $ce, $42, $4e, $c5, $68, $12, $97, $12
      .db $9a, $10, $ae, $42, $1e, $c5, $1e, $10, $79, $63
      .db $b6, $66, $f3, $69, $03, $e9, $7e, $21, $8d, $41
      .db $ce, $42, $ff, $20, $fd

l1_g1roundArea13:
      .db $52, $61, $0f, $20, $6e, $45, $07, $84, $17, $21
      .db $68, $72, $97, $41, $c6, $74, $08, $f2, $57, $01
      .db $96, $01, $17, $a4, $40, $39, $67, $07, $8a, $43
      .db $cf, $4a, $6d, $c6, $fd

l1_g1roundArea14:
      .db $00, $d1, $39, $73, $bc, $03, $35, $c3, $36, $50
      .db $46, $50, $56, $50, $66, $50, $9a, $22, $a9, $20
      .db $29, $f1, $76, $74, $9c, $03, $17, $a0, $26, $21
      .db $45, $22, $73, $46, $74, $23, $b4, $22, $b7, $03
      .db $2a, $c1, $46, $74, $84, $20, $85, $20, $9c, $02
      .db $c4, $20, $c5, $20, $07, $82, $12, $41, $13, $77
      .db $2e, $10, $77, $42, $78, $12, $d4, $42, $d5, $12
      .db $3e, $91, $66, $74, $e8, $72, $0c, $88, $c6, $74
      .db $1c, $88, $c7, $01, $d6, $01, $e5, $01, $17, $81
      .db $26, $00, $35, $01, $7a, $21, $89, $20, $9c, $06
      .db $08, $f2, $2c, $06, $99, $71, $07, $d0, $13, $50
      .db $17, $50, $23, $50, $27, $50, $33, $50, $37, $50
      .db $43, $50, $47, $50, $53, $50, $57, $07, $63, $50
      .db $a6, $74, $c9, $71, $1c, $8c, $26, $a7, $2c, $00
      .db $34, $71, $5c, $00, $c3, $27, $cc, $77, $11, $f1
      .db $4c, $06, $0f, $b4, $5c, $0b, $73, $64, $83, $64
      .db $10, $8d, $5f, $26, $fd

l1_g1roundArea15:
      .db $60, $b1, $a6, $41, $a8, $72, $cc, $03, $07, $81
      .db $17, $00, $57, $73, $87, $41, $ac, $01, $ec, $00
      .db $1c, $82, $4c, $72, $7c, $02, $b8, $72, $0c, $e7
      .db $0c, $77, $0c, $00, $5c, $00, $ec, $01, $29, $91
      .db $3c, $01, $57, $11, $59, $11, $6c, $01, $89, $11
      .db $d6, $74, $36, $c2, $39, $61, $59, $61, $6c, $04
      .db $08, $f2, $46, $41, $89, $71, $ac, $01, $ec, $01
      .db $1c, $80, $4c, $00, $6c, $00, $87, $41, $a7, $02
      .db $c4, $33, $d9, $71, $e2, $79, $3c, $86, $57, $41
      .db $07, $a2, $37, $07, $47, $06, $b7, $42, $39, $f1
      .db $8c, $02, $e7, $26, $eb, $71, $f3, $27, $57, $84
      .db $8c, $02, $b7, $11, $b9, $11, $ec, $01, $39, $91
      .db $9f, $33, $d7, $63, $ec, $05, $47, $93, $74, $26
      .db $a4, $08, $a7, $02, $07, $f3, $2c, $05, $45, $30
      .db $84, $76, $ac, $05, $08, $f2, $98, $12, $eb, $71
      .db $29, $91, $4c, $00, $87, $07, $96, $42, $97, $22
      .db $dc, $00, $f9, $0b, $0c, $89, $ca, $10, $e5, $71
      .db $e7, $31, $07, $a5, $67, $04, $c9, $11, $ea, $42
      .db $18, $91, $1a, $10, $3c, $05, $9a, $30, $b6, $42
      .db $15, $87, $19, $11, $79, $31, $7c, $0f, $a6, $31
      .db $e3, $31, $7d, $c1, $bf, $26, $bd, $c7, $fd

l1_g1roundArea16:
      .db $50, $31, $0f, $26, $7e, $10, $da, $62, $2a, $e2
      .db $78, $12, $c4, $1b, $53, $c2, $06, $91, $26, $0a
      .db $8a, $11, $da, $16, $e7, $00, $f2, $42, $f3, $12
      .db $27, $fa, $8a, $11, $98, $0b, $e3, $12, $53, $b2
      .db $d3, $0a, $e3, $11, $39, $f3, $6b, $1a, $c6, $12
      .db $e8, $12, $8a, $c1, $8b, $11, $f6, $41, $f7, $11
      .db $65, $8b, $67, $65, $b3, $12, $2c, $96, $2f, $11
      .db $8f, $16, $e3, $13, $f2, $41, $7c, $98, $7f, $14
      .db $ff, $12, $35, $f7, $79, $73, $b8, $74, $06, $c2
      .db $07, $15, $23, $12, $46, $41, $8b, $1f, $97, $00
      .db $ac, $72, $ff, $38, $db, $92, $00, $8d, $0b, $1f
      .db $2e, $42, $5f, $20, $fd

l1_g1roundArea17:
      .db $38, $d1, $0f, $26, $a0, $0c, $3d, $c7, $fd

l1_g1roundArea18:
      .db $52, $a1, $0f, $20, $6e, $40, $ac, $00, $0c, $84
      .db $53, $01, $58, $62, $95, $41, $e3, $01, $e8, $62
      .db $fc, $05, $78, $f2, $95, $42, $95, $42, $c7, $73
      .db $e6, $74, $42, $a1, $46, $22, $62, $05, $8c, $02
      .db $b8, $62, $c9, $61, $da, $60, $06, $c2, $75, $61
      .db $86, $07, $96, $25, $f5, $61, $0c, $82, $6c, $02
      .db $d9, $0b, $e3, $77, $58, $f2, $7c, $02, $0f, $b3
      .db $47, $63, $c7, $01, $d3, $01, $d7, $21, $e3, $22
      .db $f7, $01, $07, $a1, $13, $00, $27, $01, $3c, $02
      .db $e8, $7a, $7d, $c6, $fd

l1_g1roundArea19:
      .db $90, $21, $39, $f1, $bf, $37, $33, $e7, $cd, $41
      .db $0f, $a6, $ed, $47, $fd

l1_g1roundArea20:
      .db $50, $11, $0f, $26, $fe, $10, $29, $92, $38, $40
      .db $a5, $15, $f7, $12, $12, $c5, $13, $12, $43, $12
      .db $bc, $22, $3a, $e2, $4c, $4b, $67, $43, $0a, $e2
      .db $48, $64, $5c, $33, $dc, $22, $07, $e5, $23, $12
      .db $4a, $12, $62, $40, $66, $15, $72, $41, $b2, $15
      .db $1b, $97, $68, $72, $a7, $31, $d3, $12, $03, $92
      .db $69, $16, $78, $45, $fb, $16, $08, $80, $08, $92
      .db $36, $43, $37, $16, $73, $12, $a3, $13, $2c, $b4
      .db $45, $42, $be, $11, $c6, $64, $d6, $64, $e4, $66
      .db $f4, $66, $02, $e8, $12, $68, $ad, $41, $ad, $4a
      .db $ce, $42, $ff, $20, $cd, $c7, $fd

l1_g1roundArea21:
      .db $92, $21, $1e, $11, $1e, $40, $39, $71, $6e, $42
      .db $bf, $37, $33, $e7, $3e, $10, $3e, $40, $83, $12
      .db $e3, $12, $0d, $c8, $77, $42, $78, $12, $c7, $42
      .db $c8, $12, $19, $97, $34, $12, $66, $03, $84, $12
      .db $e2, $13, $5d, $ca, $5e, $11, $9d, $41, $ae, $11
      .db $ae, $42, $df, $20, $ed, $c7, $fd

l1_g1roundArea22:
      .db $06, $c1, $4c, $00, $f4, $4f, $0d, $02, $06, $20
      .db $24, $4f, $35, $a0, $36, $20, $53, $46, $d5, $20
      .db $d6, $20, $34, $a1, $73, $49, $74, $20, $94, $20
      .db $b4, $20, $d4, $20, $f4, $20, $2e, $80, $59, $42
      .db $4d, $c7, $fd

l1_g1roundArea23:
      .db $4d, $91, $39, $73, $6e, $21, $9c, $06, $39, $91
      .db $87, $00, $9c, $72, $48, $92, $dc, $02, $0a, $8a
      .db $57, $07, $67, $7b, $ed, $46, $fd

l1_g1roundArea24:
      .db $97, $21, $39, $f1, $bf, $37, $33, $e7, $cd, $41
      .db $0f, $a6, $ed, $47, $fd

l1_g1roundArea25:
      .db $00, $c1, $4c, $00, $f4, $4f, $0d, $02, $02, $42
      .db $43, $4f, $52, $c2, $de, $00, $5a, $c2, $4d, $c7
      .db $fd

l1_g1roundArea26:
      .db $92, $31, $1e, $c7, $39, $71, $5e, $42, $ae, $47
      .db $bf, $37, $33, $e7, $4c, $07, $cd, $41, $2f, $a6
      .db $ed, $47, $fd

l1_g1roundArea27:
      .db $97, $11, $0f, $26, $fe, $10, $18, $97, $37, $42
      .db $53, $13, $e5, $12, $e8, $14, $94, $c2, $95, $15
      .db $08, $95, $bb, $14, $ca, $43, $27, $92, $43, $00
      .db $a4, $17, $e3, $43, $c6, $93, $d5, $41, $37, $8b
      .db $39, $63, $c6, $17, $85, $c2, $86, $12, $23, $c2
      .db $24, $12, $b8, $16, $d7, $44, $dd, $4a, $6e, $a1
      .db $7f, $38, $bf, $b2, $e7, $63, $ed, $42, $f7, $63
      .db $7d, $c6, $8e, $c2, $bf, $20, $fd

l1_Underg1roundArea1:
      .db $40, $41, $00, $5a, $be, $02, $1c, $8b, $1e, $00
      .db $6f, $0c, $ae, $02, $28, $d2, $38, $72, $58, $52
      .db $a7, $00, $28, $a5, $f8, $62, $16, $e4, $2c, $54
      .db $33, $42, $76, $64, $88, $62, $de, $07, $17, $c9
      .db $b2, $07, $cc, $67, $46, $d4, $4e, $01, $59, $71
      .db $aa, $42, $c7, $01, $d7, $53, $16, $c2, $77, $73
      .db $99, $71, $be, $05, $db, $71, $0b, $f1, $5a, $44
      .db $bb, $71, $2e, $81, $5e, $00, $86, $41, $ae, $00
      .db $05, $c1, $3e, $01, $4a, $72, $93, $00, $97, $75
      .db $d2, $22, $d8, $74, $2e, $86, $6f, $47, $9e, $0f
      .db $0e, $82, $68, $7a, $ae, $01, $de, $3f, $6d, $c5
      .db $fd

l1_Underg1roundArea2:
      .db $87, $81, $00, $5a, $6e, $06, $8c, $62, $b3, $00
      .db $ce, $0a, $dc, $56, $3e, $86, $d5, $12, $17, $c2
      .db $44, $13, $4e, $0a, $5c, $54, $9e, $09, $e1, $51
      .db $e3, $07, $57, $8a, $b1, $51, $b3, $0a, $f6, $42
      .db $25, $f5, $5e, $04, $a8, $72, $cc, $01, $e9, $71
      .db $0c, $83, $4a, $0a, $d4, $0a, $da, $44, $28, $92
      .db $3c, $03, $7a, $10, $bc, $74, $e7, $00, $59, $91
      .db $6c, $54, $b9, $10, $ba, $10, $cc, $53, $fe, $08
      .db $07, $c2, $73, $07, $7e, $02, $8c, $02, $b8, $72
      .db $e5, $75, $98, $8a, $ac, $02, $df, $32, $0c, $d3
      .db $3e, $06, $76, $11, $7e, $02, $8c, $5d, $5e, $86
      .db $67, $10, $cf, $47, $fe, $0f, $7d, $c7, $fd

l1_Underg1roundArea3:
      .db $48, $8f, $0e, $01, $5e, $02, $89, $61, $9c, $03
      .db $1e, $84, $49, $11, $8c, $02, $b8, $11, $ba, $10
      .db $fe, $02, $0c, $83, $49, $61, $7c, $68, $7c, $78
      .db $48, $fa, $6c, $01, $86, $74, $ac, $01, $c5, $41
      .db $c8, $72, $ec, $01, $36, $c1, $39, $71, $74, $41
      .db $77, $73, $9c, $03, $d7, $13, $39, $f1, $70, $56
      .db $77, $24, $86, $43, $d1, $52, $e1, $54, $ee, $05
      .db $16, $87, $4c, $01, $8c, $00, $97, $50, $ac, $00
      .db $fe, $02, $01, $d4, $11, $52, $51, $52, $58, $12
      .db $71, $51, $a6, $12, $a9, $11, $fe, $09, $b5, $91
      .db $55, $8a, $56, $50, $96, $23, $a0, $08, $a5, $21
      .db $f1, $50, $f2, $0a, $fe, $00, $4e, $81, $87, $24
      .db $a3, $04, $1c, $81, $42, $26, $46, $26, $bc, $01
      .db $37, $a4, $53, $07, $ae, $00, $1e, $81, $28, $52
      .db $2e, $06, $6f, $47, $9e, $0f, $2d, $c6, $fd

l1_Underg1roundArea4:
      .db $48, $01, $00, $5a, $0e, $01, $3e, $06, $45, $46
      .db $47, $46, $53, $44, $ae, $01, $df, $4a, $4d, $c7
      .db $00, $da, $0e, $01, $2e, $04, $37, $28, $3a, $48
      .db $46, $47, $c7, $07, $ce, $0f, $df, $4a, $4d, $c7
      .db $00, $da, $0e, $01, $33, $53, $43, $51, $46, $40
      .db $47, $50, $53, $04, $55, $40, $56, $50, $62, $43
      .db $64, $40, $65, $20, $71, $41, $73, $51, $83, $51
      .db $94, $40, $95, $50, $a3, $50, $a5, $40, $a6, $50
      .db $b3, $51, $b6, $40, $b7, $50, $c3, $53, $df, $4a
      .db $4d, $c7, $00, $da, $0e, $01, $2e, $02, $36, $47
      .db $37, $52, $3a, $49, $47, $25, $a7, $52, $d7, $04
      .db $df, $4a, $4d, $c7, $00, $da, $0e, $01, $39, $70
      .db $3e, $02, $44, $51, $53, $44, $54, $44, $55, $24
      .db $a1, $54, $ae, $01, $b4, $21, $df, $4a, $e5, $07
      .db $4d, $c7, $fd

l1_Underg1roundArea5:
      .db $48, $0f, $0e, $01, $5e, $05, $7a, $4f, $e9, $4f
      .db $d7, $87, $e8, $21, $ef, $4a, $fe, $0f, $8d, $c6
      .db $fd

l1_Underg1roundArea6:
      .db $48, $01, $00, $5a, $0e, $01, $3e, $05, $47, $07
      .db $48, $48, $59, $46, $6a, $44, $df, $4a, $4d, $c7
      .db $00, $da, $0e, $01, $2e, $02, $39, $49, $47, $47
      .db $55, $45, $ce, $0f, $df, $4a, $4d, $c7, $00, $da
      .db $0e, $01, $33, $53, $43, $51, $46, $40, $47, $50
      .db $53, $04, $55, $40, $56, $50, $62, $43, $64, $40
      .db $65, $50, $71, $41, $73, $51, $83, $51, $94, $40
      .db $95, $50, $a3, $50, $a5, $40, $a6, $50, $b3, $51
      .db $b6, $40, $b7, $50, $c3, $53, $df, $4a, $4d, $c7
      .db $00, $da, $0e, $01, $2e, $02, $43, $51, $45, $28
      .db $53, $46, $54, $46, $c3, $51, $d5, $02, $df, $4a
      .db $4d, $c7, $00, $da, $0e, $01, $3e, $02, $44, $51
      .db $53, $44, $54, $44, $55, $24, $a1, $54, $ae, $01
      .db $b4, $21, $df, $4a, $e5, $07, $4d, $c7, $fd

l1_Cast1l1eArea1:
      .db $95, $31, $0f, $26, $fe, $31, $43, $c1, $63, $40
      .db $68, $04, $76, $64, $7e, $10, $85, $3f, $8c, $5f
      .db $7e, $91, $86, $66, $3a, $e0, $3e, $10, $4c, $57
      .db $66, $32, $73, $00, $be, $11, $c2, $43, $ca, $30
      .db $39, $8b, $5a, $30, $6c, $55, $ca, $30, $0a, $c1
      .db $1e, $33, $2e, $42, $47, $03, $d7, $84, $6e, $c5
      .db $ba, $41, $ba, $42, $09, $b9, $0a, $61, $0e, $11
      .db $1c, $57, $9a, $31, $a9, $63, $b9, $63, $c9, $63
      .db $da, $62, $eb, $61, $2a, $c2, $7f, $38, $0c, $d7
      .db $8d, $41, $cf, $26, $fd

l1_Cast1l1eArea2:
      .db $9b, $47, $05, $32, $06, $33, $07, $34, $ee, $03
      .db $fc, $51, $0e, $87, $78, $0a, $7e, $06, $9e, $0a
      .db $e3, $0a, $fe, $0a, $2a, $e2, $3a, $62, $a9, $73
      .db $be, $09, $c3, $00, $ce, $0b, $55, $e1, $b6, $60
      .db $8e, $82, $97, $0a, $e1, $60, $e2, $0a, $08, $fa
      .db $5a, $60, $6c, $5a, $81, $60, $82, $0a, $d8, $33
      .db $0e, $87, $7e, $03, $c6, $24, $16, $84, $39, $71
      .db $4e, $06, $7e, $02, $de, $07, $fe, $0a, $0d, $c4
      .db $cd, $43, $ce, $09, $dd, $42, $de, $0b, $fe, $02
      .db $5d, $c7, $fd

l1_Cast1l1eArea3:
      .db $9b, $87, $05, $32, $06, $33, $07, $34, $7c, $02
      .db $8e, $04, $ec, $74, $07, $8a, $8c, $03, $fc, $03
      .db $2e, $83, $47, $07, $57, $21, $77, $00, $aa, $33
      .db $c9, $31, $de, $0a, $fe, $02, $38, $c1, $4e, $00
      .db $50, $35, $ae, $02, $ba, $0a, $ee, $03, $fa, $32
      .db $13, $8a, $1e, $04, $2a, $0a, $89, $11, $ea, $0a
      .db $ee, $03, $f3, $0a, $fa, $32, $19, $e0, $1e, $06
      .db $37, $43, $7e, $0a, $be, $09, $0e, $8a, $5e, $0a
      .db $8e, $06, $be, $0a, $ee, $07, $3e, $83, $4c, $54
      .db $8e, $17, $fe, $0a, $0d, $c4, $cd, $43, $ce, $09
      .db $dd, $42, $de, $0b, $fe, $02, $5d, $c7, $fd

l1_Cast1l1eArea4:
      .db $9b, $07, $05, $34, $06, $35, $07, $36, $fe, $02
      .db $26, $8a, $6c, $63, $6c, $72, $97, $00, $d6, $0a
      .db $08, $e4, $18, $64, $1e, $02, $5c, $05, $da, $0a
      .db $01, $e2, $04, $0a, $9a, $0a, $d1, $63, $d5, $0a
      .db $4c, $8b, $78, $64, $c8, $64, $fe, $07, $2e, $80
      .db $38, $64, $3e, $43, $44, $00, $48, $64, $98, $33
      .db $be, $43, $c2, $0a, $ce, $07, $fe, $07, $4e, $81
      .db $52, $35, $58, $02, $ae, $00, $e7, $65, $f7, $65
      .db $07, $e5, $3e, $08, $7e, $04, $9e, $05, $be, $04
      .db $de, $08, $fe, $0a, $01, $d2, $0d, $44, $11, $52
      .db $12, $07, $cd, $43, $ce, $09, $dd, $42, $de, $0b
      .db $fe, $02, $5d, $c7, $fd

l1_Cast1l1eArea5:
      .db $5b, $86, $05, $32, $06, $33, $07, $34, $7e, $0a
      .db $fe, $02, $39, $f3, $e8, $12, $0d, $03, $37, $7d
      .db $de, $08, $1e, $8a, $ae, $06, $16, $fe, $45, $12
      .db $5e, $3f, $fe, $02, $fe, $82, $39, $f3, $a8, $72
      .db $49, $fb, $e8, $72, $fe, $0a, $6e, $82, $b7, $7d
      .db $fe, $0f, $0d, $0b, $1e, $02, $fe, $02, $39, $f3
      .db $5e, $06, $c8, $7c, $48, $fc, $5e, $0a, $de, $06
      .db $e7, $10, $45, $ff, $7e, $0f, $fe, $82, $39, $f3
      .db $a9, $73, $4e, $8a, $9e, $07, $fe, $0a, $0d, $c4
      .db $cd, $43, $ce, $09, $dd, $42, $de, $0b, $fe, $02
      .db $5d, $c7, $fd

l1_Cast1l1eArea6:
      .db $52, $31, $0f, $20, $6e, $46, $bc, $06, $44, $a4
      .db $57, $00, $77, $01, $c5, $0a, $49, $f1, $68, $72
      .db $8c, $05, $e4, $41, $e7, $73, $0c, $84, $59, $61
      .db $6c, $04, $b8, $62, $77, $c2, $a7, $7d, $cc, $03
      .db $09, $e1, $7a, $60, $8c, $04, $96, $42, $07, $a5
      .db $13, $25, $7c, $02, $b7, $22, $c3, $08, $c7, $0a
      .db $ec, $02, $39, $f3, $bc, $73, $bc, $63, $63, $8a
      .db $67, $04, $9c, $02, $33, $81, $37, $23, $4c, $02
      .db $53, $01, $73, $01, $77, $07, $0e, $90, $17, $13
      .db $94, $42, $9c, $36, $5e, $b1, $63, $01, $69, $61
      .db $7c, $03, $b3, $01, $b8, $62, $3a, $e0, $49, $61
      .db $58, $62, $67, $63, $7c, $03, $83, $41, $b7, $63
      .db $c8, $62, $d9, $61, $ea, $60, $87, $87, $97, $21
      .db $b7, $01, $cc, $04, $18, $f2, $39, $73, $7f, $38
      .db $0c, $86, $7d, $41, $bf, $26, $fd

l1_Cast1l1eArea7:
      .db $38, $21, $0f, $26, $ad, $40, $3d, $c7, $fd

l1_Cast1l1eArea8:
      .db $53, $02, $01, $69, $98, $72, $bc, $52, $e5, $75
      .db $0c, $d2, $33, $77, $5c, $64, $5c, $73, $97, $00
      .db $01, $e5, $07, $0a, $2e, $0a, $7b, $61, $88, $0a
      .db $8b, $61, $9b, $61, $ea, $62, $3a, $e2, $ce, $07
      .db $08, $8a, $33, $62, $68, $0a, $93, $62, $c8, $0a
      .db $f3, $62, $fe, $00, $39, $f3, $87, $7d, $d5, $77
      .db $3e, $82, $41, $62, $48, $62, $ca, $42, $f1, $63
      .db $fa, $60, $0c, $d6, $71, $63, $7a, $60, $8c, $56
      .db $f1, $63, $fa, $33, $29, $8a, $3c, $5c, $98, $41
      .db $99, $63, $a9, $63, $01, $e3, $05, $0a, $0a, $32
      .db $11, $63, $21, $63, $3c, $56, $9e, $07, $fe, $0a
      .db $0d, $c4, $cd, $43, $ce, $09, $dd, $42, $de, $0b
      .db $fe, $02, $5d, $c6, $fd

l1_Cast1l1eArea9:
      .db $9b, $07, $05, $32, $06, $33, $07, $34, $6e, $03
      .db $7c, $51, $8e, $07, $67, $c2, $97, $0a, $9e, $0a
      .db $fe, $06, $06, $e1, $17, $60, $71, $62, $74, $0a
      .db $b1, $62, $b4, $0a, $f1, $62, $f4, $0a, $35, $f2
      .db $85, $72, $d6, $71, $ee, $0a, $3e, $87, $47, $42
      .db $c3, $0a, $06, $e1, $43, $0a, $96, $61, $c3, $0a
      .db $87, $b0, $8e, $0a, $fe, $06, $16, $f1, $7e, $0a
      .db $d8, $30, $01, $e1, $38, $30, $8e, $06, $d5, $72
      .db $f5, $0a, $2e, $8a, $6e, $06, $a2, $0a, $ae, $07
      .db $fe, $0a, $0d, $c4, $31, $62, $61, $64, $cd, $43
      .db $ce, $09, $dd, $42, $de, $0b, $fe, $02, $5d, $c7
      .db $fd

l1_Cast1l1eArea10:
      .db $98, $87, $05, $32, $06, $33, $07, $34, $ae, $00
      .db $1e, $87, $9e, $00, $1e, $83, $68, $12, $a8, $11
      .db $aa, $60, $bc, $04, $0a, $8a, $63, $61, $65, $0a
      .db $ca, $0a, $29, $91, $3c, $03, $77, $13, $c9, $11
      .db $3c, $84, $7e, $05, $c7, $0a, $47, $8a, $c7, $0a
      .db $fe, $02, $0c, $84, $99, $11, $d7, $11, $d9, $11
      .db $48, $f2, $87, $20, $97, $04, $a4, $76, $c7, $07
      .db $d7, $20, $07, $f3, $3e, $06, $7e, $02, $8c, $04
      .db $d6, $64, $f8, $62, $0c, $82, $68, $7a, $86, $64
      .db $8e, $0f, $5d, $c7, $fd

l1_Cast1l1eArea11:
      .db $9b, $07, $05, $32, $06, $33, $07, $34, $8e, $0a
      .db $91, $61, $a1, $61, $b1, $61, $c1, $61, $ce, $07
      .db $33, $8a, $3e, $0a, $7e, $09, $87, $0a, $bc, $61
      .db $d3, $00, $ee, $0a, $2e, $89, $47, $0a, $5e, $02
      .db $c7, $0a, $c8, $62, $f1, $63, $fa, $42, $01, $e3
      .db $11, $63, $47, $0a, $48, $62, $9a, $60, $a9, $61
      .db $b8, $62, $be, $0a, $fe, $03, $07, $bf, $47, $0a
      .db $b3, $0a, $07, $ba, $27, $0a, $9a, $0a, $a3, $60
      .db $ae, $0a, $3e, $83, $49, $61, $75, $44, $79, $44
      .db $97, $0a, $e7, $63, $fc, $53, $37, $e3, $4c, $53
      .db $87, $63, $9c, $51, $ae, $07, $fe, $0a, $0d, $c4
      .db $cd, $43, $ce, $09, $dd, $42, $de, $0b, $fe, $02
      .db $5d, $c7, $fd

