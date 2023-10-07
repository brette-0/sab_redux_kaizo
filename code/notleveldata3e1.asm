;GAME LEVELS DATA

WorldAddrOffsets:
      .db World1Areas-AreaAddrOffsets, World2Areas-AreaAddrOffsets
      .db World3Areas-AreaAddrOffsets, World4Areas-AreaAddrOffsets
      .db World5Areas-AreaAddrOffsets, World6Areas-AreaAddrOffsets
      .db World7Areas-AreaAddrOffsets, World8Areas-AreaAddrOffsets
	  .db World9Areas-AreaAddrOffsets

AreaAddrOffsets:
World1Areas: .db $44, $48, $80, $45, $c0
World2Areas: .db $47, $53, $46, $c2
World3Areas: .db $43, $48, $01, $40, $c3
World4Areas: .db $42, $54, $4b, $c1
World5Areas: .db $49, $48, $81, $56, $c6
World6Areas: .db $4d, $48, $02, $4c, $c7
World7Areas: .db $51, $57, $58, $c4
World8Areas: .db $4f, $50, $41, $c5

;WorldAAreas: .db $28, $29, $42, $2c, $60
;WorldBAreas: .db $24, $29, $01, $2d, $63
;WorldCAreas: .db $32, $26, $27, $62
;WorldDAreas: .db $30, $31, $21, $65

;WorldEAreas:
;WorldFAreas:
;WorldGAreas:

EnemyAddrHOffsets:
      .db EnemyDataAddrLow_WaterStart - EnemyDataAddrLow          ; Water
      .db EnemyDataAddrLow_GroundStart - EnemyDataAddrLow         ; Ground
      .db EnemyDataAddrLow_UndergroundStart - EnemyDataAddrLow    ; Underground
      .db EnemyDataAddrLow_CastleStart - EnemyDataAddrLow         ; castle

EnemyDataAddrLow:
      ; Water
      EnemyDataAddrLow_WaterStart:
      .db <E_WaterArea1, <E_WaterArea2, <E_WaterArea3, <E_WaterArea4, <E_WaterArea5, <E_WaterArea6, <E_WaterArea7, <E_WaterArea8, <E_WaterArea9
      .db <E_WaterArea10, <E_WaterArea11
	  ; Ground
      EnemyDataAddrLow_GroundStart:
      .db <E_GroundArea1, <E_GroundArea2, <E_GroundArea3, <E_GroundArea4, <E_GroundArea5, <E_GroundArea6
      .db <E_GroundArea7, <E_GroundArea8, <E_GroundArea9, <E_GroundArea10, <E_GroundArea11, <E_GroundArea12
      .db <E_GroundArea13, <E_GroundArea14, <E_GroundArea15, <E_GroundArea16, <E_GroundArea17, <E_GroundArea18
      .db <E_GroundArea19, <E_GroundArea20, <E_GroundArea21, <E_GroundArea22, <E_GroundArea23, <E_GroundArea24
      .db <E_GroundArea25, <E_GroundArea26, <E_GroundArea27, <E_GroundArea28, <E_GroundArea29, <E_GroundArea30
      .db <E_GroundArea31, <E_GroundArea32, <E_GroundArea33, <E_GroundArea34, <E_GroundArea35, <E_GroundArea36
      .db <E_GroundArea37, <E_GroundArea38, <E_GroundArea39, <E_GroundArea40
	  ; Underground
      EnemyDataAddrLow_UndergroundStart:
      .db <E_UndergroundArea1, <E_UndergroundArea2, <E_UndergroundArea3, <E_UndergroundArea4, <E_UndergroundArea5, <E_UndergroundArea6
      ; Castle
      EnemyDataAddrLow_CastleStart:
      .db <E_CastleArea1, <E_CastleArea2, <E_CastleArea3, <E_CastleArea4, <E_CastleArea5, <E_CastleArea6
      .db <E_CastleArea7, <E_CastleArea8, <E_CastleArea9, <E_CastleArea10, <E_CastleArea11, <E_CastleArea12
      .db <E_CastleArea13

EnemyDataAddrHigh:
      ; Water
      .db >E_WaterArea1, >E_WaterArea2, >E_WaterArea3, >E_WaterArea4, >E_WaterArea5, >E_WaterArea6, >E_WaterArea7, >E_WaterArea8, >E_WaterArea9
      .db >E_WaterArea10, >E_WaterArea11
	  ; Ground
      .db >E_GroundArea1, >E_GroundArea2, >E_GroundArea3, >E_GroundArea4, >E_GroundArea5, >E_GroundArea6
      .db >E_GroundArea7, >E_GroundArea8, >E_GroundArea9, >E_GroundArea10, >E_GroundArea11, >E_GroundArea12
      .db >E_GroundArea13, >E_GroundArea14, >E_GroundArea15, >E_GroundArea16, >E_GroundArea17, >E_GroundArea18
      .db >E_GroundArea19, >E_GroundArea20, >E_GroundArea21, >E_GroundArea22, >E_GroundArea23, >E_GroundArea24
      .db >E_GroundArea25, >E_GroundArea26,  >E_GroundArea27,  >E_GroundArea28,  >E_GroundArea29,  >E_GroundArea30
      .db >E_GroundArea31, >E_GroundArea32, >E_GroundArea33, >E_GroundArea34, >E_GroundArea35, >E_GroundArea36
      .db >E_GroundArea37, >E_GroundArea38, >E_GroundArea39, >E_GroundArea40
	  ; Underground
      .db >E_UndergroundArea1, >E_UndergroundArea2, >E_UndergroundArea3, >E_UndergroundArea4, >E_UndergroundArea5, >E_UndergroundArea6
      ; Castle
      .db >E_CastleArea1, >E_CastleArea2, >E_CastleArea3, >E_CastleArea4, >E_CastleArea5, >E_CastleArea6
      .db >E_CastleArea7, >E_CastleArea8, >E_CastleArea9, >E_CastleArea10, >E_CastleArea11, >E_CastleArea12
      .db >E_CastleArea13

AreaDataHOffsets:
      .db AreaDataAddrLow_WaterStart - AreaDataAddrLow          ; Water
      .db AreaDataAddrLow_GroundStart - AreaDataAddrLow         ; Ground
      .db AreaDataAddrLow_UndergroundStart - AreaDataAddrLow    ; Underground
      .db AreaDataAddrLow_CastleStart - AreaDataAddrLow         ; castle

AreaDataAddrLow:
      ; Water
      AreaDataAddrLow_WaterStart:
      .db <L_WaterArea1, <L_WaterArea2, <L_WaterArea3, <L_WaterArea4, <L_WaterArea5, <L_WaterArea6, <L_WaterArea7, <L_WaterArea8, <L_WaterArea9
      .db <L_WaterArea10, <L_WaterArea11
	  ; Ground
      AreaDataAddrLow_GroundStart:
      .db <L_GroundArea1, <L_GroundArea2, <L_GroundArea3, <L_GroundArea4, <L_GroundArea5, <L_GroundArea6
      .db <L_GroundArea7, <L_GroundArea8, <L_GroundArea9, <L_GroundArea10, <L_GroundArea11, <L_GroundArea12
      .db <L_GroundArea13, <L_GroundArea14, <L_GroundArea15, <L_GroundArea16, <L_GroundArea17, <L_GroundArea18
      .db <L_GroundArea19, <L_GroundArea20, <L_GroundArea21, <L_GroundArea22, <L_GroundArea23, <L_GroundArea24
      .db <L_GroundArea25, <L_GroundArea26, <L_GroundArea27, <L_GroundArea28, <L_GroundArea29, <L_GroundArea30
      .db <L_GroundArea31, <L_GroundArea32, <L_GroundArea33, <L_GroundArea34, <L_GroundArea35, <L_GroundArea36
      .db <L_GroundArea37, <L_GroundArea38, <L_GroundArea39, <L_GroundArea40
	  
	  ; Underground
      AreaDataAddrLow_UndergroundStart:
      .db <L_UndergroundArea1, <L_UndergroundArea2, <L_UndergroundArea3, <L_UndergroundArea4,  <L_UndergroundArea5,  <L_UndergroundArea6
      ; Castle
      AreaDataAddrLow_CastleStart:
      .db <L_CastleArea1, <L_CastleArea2, <L_CastleArea3, <L_CastleArea4, <L_CastleArea5, <L_CastleArea6
      .db <L_CastleArea7, <L_CastleArea8, <L_CastleArea9, <L_CastleArea10, <L_CastleArea11, <L_CastleArea12
      .db <L_CastleArea13

AreaDataAddrHigh:
      ; Water
      .db >L_WaterArea1, >L_WaterArea2, >L_WaterArea3, >L_WaterArea4, >L_WaterArea5, >L_WaterArea6, >L_WaterArea7, >L_WaterArea8, >L_WaterArea9
      .db >L_WaterArea10, >L_WaterArea11
	  ; Ground
      .db >L_GroundArea1, >L_GroundArea2, >L_GroundArea3, >L_GroundArea4, >L_GroundArea5, >L_GroundArea6
      .db >L_GroundArea7, >L_GroundArea8, >L_GroundArea9, >L_GroundArea10, >L_GroundArea11, >L_GroundArea12
      .db >L_GroundArea13, >L_GroundArea14, >L_GroundArea15, >L_GroundArea16, >L_GroundArea17, >L_GroundArea18
      .db >L_GroundArea19, >L_GroundArea20, >L_GroundArea21, >L_GroundArea22, >L_GroundArea23, >L_GroundArea24
      .db >L_GroundArea25, >L_GroundArea26, >L_GroundArea27, >L_GroundArea28, >L_GroundArea29, >L_GroundArea30
      .db >L_GroundArea31, >L_GroundArea32, >L_GroundArea33, >L_GroundArea34, >L_GroundArea35, >L_GroundArea36
      .db >L_GroundArea37, >L_GroundArea38, >L_GroundArea39, >L_GroundArea40
	  ; Underground
      .db >L_UndergroundArea1, >L_UndergroundArea2, >L_UndergroundArea3, >L_UndergroundArea4, >L_UndergroundArea5, >L_UndergroundArea6
      ; Castle
      .db >L_CastleArea1, >L_CastleArea2, >L_CastleArea3, >L_CastleArea4, >L_CastleArea5, >L_CastleArea6
      .db >L_CastleArea7, >L_CastleArea8, >L_CastleArea9, >L_CastleArea10, >L_CastleArea11, >L_CastleArea12
      .db >L_CastleArea13

E_WaterArea1:
      .db $16, $9b, $8c, $07, $fd, $1d, $3a, $87, $75, $1b
      .db $47, $87, $8a, $1b, $c5, $1d, $4e, $c5, $e7, $80, $ff

E_WaterArea2:
      .db $1b, $80, $8a, $17, $1b, $87, $b7, $07, $0f, $04
      .db $2b, $00, $59, $07, $94, $0a, $83, $a7, $89, $27
      .db $f8, $07, $c4, $87, $7b, $80, $6b, $80, $fb, $3c
      .db $58, $87, $29, $87, $fb, $00, $3b, $86, $fb, $38
      .db $0f, $0d, $47, $07, $96, $07, $cb, $b8, $d7, $07
      .db $5e, $5a, $41, $80, $ff

E_WaterArea3:
      .db $ab, $80, $b7, $87, $9b, $bc, $33, $87, $86, $07
      .db $bb, $85, $0f, $07, $44, $07, $09, $8f, $0f, $0a
      .db $39, $0a, $0f, $0c, $35, $07, $97, $1b, $47, $9e
      .db $d4, $07, $ee, $4a, $a1, $00, $ff

E_WaterArea4:
      .db $3b, $87, $66, $27, $cc, $27, $3b, $87, $db, $07
      .db $ee, $51, $80, $87, $ee, $43, $00, $a7, $ff

E_WaterArea5:
      .db $9a, $9b, $8b, $82, $4b, $b7, $33, $90, $64, $87
      .db $23, $87, $6a, $8a, $85, $2c, $8a, $2c, $e7, $0a
      .db $0f, $09, $95, $05, $d5, $05, $ff

E_WaterArea6:
      .db $ff

E_WaterArea7:
      .db $6b, $86, $72, $11, $0f, $03, $eb, $02, $92, $91
      .db $0f, $06, $02, $11, $d4, $05, $ab, $8d, $6b, $b7
      .db $cb, $bc, $ff

E_WaterArea8:
	  .db $6B, $B8, $D9, $08, $F5, $02, $BB, $87, $3B, $BB, $A9, $05, $0B, $9F, $6B, $01, $FF
	  
E_WaterArea9:
      .db $0f, $02, $57, $3d, $36, $87, $eb, $87, $64, $87
      .db $22, $87, $9b, $3b, $05, $a7, $0c, $27, $82, $26
      .db $89, $26, $a4, $87, $78, $9b, $c6, $07, $fb, $3c
      .db $bb, $bb, $39, $87, $ee, $45, $6b, $00, $ee, $45, $ab, $00
      .db $ff
	  
E_WaterArea10:
	  .db $3B, $87, $66, $27, $CC, $27, $3B, $87, $DB, $07, $EE, $54, $68, $80, $EE, $5a, $81, $00, $EE, $5a, $E1, $00, $FF

E_WaterArea11: ; B-2
      .db $0f, $02, $57, $3d, $36, $87, $eb, $87, $64, $87
      .db $22, $87, $9b, $3b, $05, $a7, $0c, $27, $82, $26
      .db $89, $26, $a4, $87, $78, $9b, $c6, $07, $fb, $3c
      .db $bb, $bb, $39, $87, $ee, $25, $6b, $ee, $25, $ab
      .db $ff

E_GroundArea1:
      .db $a6, $82, $07, $a8, $26, $80, $69, $00, $d4, $29
      .db $95, $80, $cb, $3c, $78, $aa, $53, $8f, $d5, $03
      .db $39, $a5, $c8, $02, $e8, $02, $48, $a9, $97, $29
      .db $ff

E_GroundArea2:
      .db $86, $91, $0f, $03, $64, $05, $86, $11, $9b, $85
      .db $0f, $06, $c8, $0e, $0f, $08, $25, $0f, $88, $05
      .db $28, $85, $cb, $80, $5b, $85, $58, $85, $b7, $05
      .db $ff

E_GroundArea3:
      .db $e2, $91, $db, $bc, $8b, $b8, $0f, $05, $89, $07
      .db $77, $8e, $02, $91, $49, $03, $0b, $b8, $4e, $82
      .db $60, $00, $2b, $8e, $37, $8f, $0f, $0d, $57, $18, $ff

E_GroundArea4:
      .db $c3, $85, $07, $85, $5b, $06, $8b, $bc, $9e, $82
      .db $44, $00, $1b, $80, $2b, $8a, $1b, $bc, $5b, $00, $23
      .db $83, $47, $03, $ae, $52, $40, $00, $c8, $86, $d7, $06
      .db $63, $8e, $6b, $02, $d7, $3a, $2b, $8e, $66, $0e
      .db $da, $0e, $f8, $0e, $c7, $80, $f4, $00, $ff

E_GroundArea5:
      .db $9b, $bb, $4e, $82, $08, $80, $8b, $07, $3b, $81, $5e
      .db $4a, $01, $00, $0f, $05, $03, $02, $23, $02, $16, $90
      .db $bb, $01, $2a, $8e, $06, $85, $7b, $2c, $d9, $1d
      .db $17, $9b, $0f, $0b, $0b, $37, $db, $3c, $ff

E_GroundArea6:
      .db $0f, $02, $92, $07, $c2, $06, $19, $a9, $76, $25
      .db $77, $83, $c7, $1e, $f4, $0b, $68, $a9, $e9, $29
      .db $e5, $83, $d5, $a9, $36, $a8, $5b, $03, $ff

E_GroundArea7:
      .db $b8, $80, $78, $80, $78, $83, $f8, $83, $0f, $07
      .db $bb, $03, $b6, $90, $87, $90, $0f, $0b, $1b, $3b
      .db $78, $9c, $57, $b9, $ff

E_GroundArea8:
      .db $f6, $8e, $36, $8e, $76, $0e, $4b, $b7, $36, $90
      .db $ab, $38, $0e, $82, $22, $80, $2a, $0f, $cb, $38, $d9
      .db $0f, $4e, $4e, $20, $80, $77, $07, $4b, $89, $8b, $06
      .db $8b, $bb, $7b, $8e, $4b, $b8, $9b, $05, $86, $85
      .db $9b, $00, $ff

E_GroundArea9:
      .db $ff

E_GroundArea10:
      .db $fb, $03, $9b, $bc, $1b, $b8, $fb, $3c, $9b, $b8
      .db $eb, $0e, $fb, $b8, $4b, $b8, $5e, $09, $80, $80, $bb
      .db $37, $7b, $80, $cb, $38, $ab, $b8, $3b, $bc, $a5
      .db $0f, $98, $82, $94, $8f, $1b, $bb, $ff

E_GroundArea11:
      .db $ff

E_GroundArea12:
      .db $c7, $84, $d7, $04, $42, $90, $69, $0f, $08, $a4
      .db $77, $24, $d6, $29, $2b, $80, $c3, $09, $07, $a4
      .db $87, $24, $b8, $24, $18, $a4, $67, $24, $c7, $24
      .db $92, $83, $e6, $06, $68, $86, $85, $27, $ff

E_GroundArea13:
      .db $85, $94, $17, $80, $a7, $25, $c7, $a8, $fb, $37
      .db $67, $a4, $ba, $24, $e5, $24, $19, $a4, $55, $0f
      .db $66, $90, $f5, $02, $65, $a9, $c6, $24, $19, $a4
      .db $97, $06, $16, $a9, $68, $29, $b6, $29, $43, $8f
      .db $ff

E_GroundArea14:
      .db $aa, $86, $17, $83, $37, $85, $53, $05, $87, $80
      .db $3b, $b7, $ae, $82, $a0, $00, $0f, $07, $0b, $0e, $e6
      .db $0e, $5b, $8e, $80, $65, $87, $4b, $b7, $7b, $b7, $46
      .db $8e, $02, $0e, $80, $ff

E_GroundArea15:
      .db $0e, $51, $ca, $00, $1e, $47, $29, $00, $0a, $aa, $ff

E_GroundArea16:
      .db $2b, $82, $ab, $38, $1b, $b8, $fa, $0f, $0f, $04
      .db $1b, $00, $ab, $38, $7b, $82, $f7, $06, $0f, $07
      .db $29, $0e, $bb, $3c, $6b, $bc, $7b, $b8, $1b, $8e
      .db $ca, $0e, $38, $90, $4e, $09, $e0, $00, $4e, $52, $e0, $80
      .db $67, $05, $93, $05, $39, $87, $bb, $b8, $db, $82
      .db $4b, $b8, $bb, $38, $0f, $12, $1b, $00, $be, $82
      .db $e0, $00, $5b, $80, $ab, $bc, $eb, $b7, $ff

E_GroundArea17:
      .db $29, $8a, $f7, $05, $23, $85, $49, $8f, $19, $90
      .db $78, $0e, $0f, $06, $0b, $0e, $27, $0e, $fb, $02
      .db $bb, $82, $eb, $02, $bb, $8e, $0f, $0a, $49, $0e
      .db $db, $05, $16, $85, $78, $06, $98, $06, $0b, $8e
      .db $89, $02, $be, $5a, $e0, $00, $bb, $bc, $ee, $82, $e4, $00
      .db $ff

E_GroundArea18:
      .db $0f, $02, $b9, $10, $3b, $82, $b9, $0f, $77, $90
      .db $3b, $8e, $ce, $82, $c6, $00, $37, $85, $73, $05, $2a
      .db $87, $fb, $80, $ae, $4e, $c0, $80, $b3, $05, $cb, $05
      .db $0f, $0c, $97, $3a, $93, $8e, $ff

E_GroundArea19:
      .db $0e, $43, $4a, $00, $0e, $56, $88, $00, $0e, $02, $aa, $00, $0e
      .db $4f, $f5, $00, $0a, $aa, $ff

E_GroundArea20:
      .db $6b, $86, $6b, $bc, $ab, $8e, $78, $90, $de, $53
      .db $2b, $00, $de, $44, $4b, $00, $de, $44, $cb, $00, $c8, $8b, $06
      .db $85, $d2, $07, $0f, $09, $5b, $38, $d7, $ba, $ff

E_GroundArea21:
      .db $9b, $83, $eb, $b8, $a6, $a7, $8e, $09, $60, $80, $d7
      .db $05, $2b, $87, $75, $0b, $7b, $bb, $9b, $83, $7b
      .db $81, $63, $85, $97, $05, $97, $8e, $c8, $8f, $63
      .db $86, $ff

E_GroundArea22:
      .db $0f, $02, $66, $27, $db, $27, $0f, $04, $4b, $38
      .db $2e, $81, $87, $80, $2e, $02, $a7, $00, $ff

E_GroundArea23:
      .db $2b, $97, $98, $03, $f9, $07, $94, $86, $b4, $06
      .db $7a, $8e, $b7, $27, $4a, $8e, $bb, $07, $52, $8e
      .db $a7, $90, $76, $85, $7a, $05, $ae, $52, $80, $00, $d9
      .db $87, $2b, $97, $77, $06, $96, $8e, $d6, $0e, $56
      .db $81, $ff

E_GroundArea24:
      .db $5b, $b8, $cb, $03, $eb, $03, $0f, $03, $42, $11
      .db $9b, $3c, $a2, $91, $e7, $06, $fb, $02, $3e, $82
      .db $c8, $80, $82, $8f, $ea, $06, $0f, $09, $35, $10, $5b
      .db $bc, $05, $82, $07, $90, $8b, $bc, $15, $8e, $ff

E_GroundArea25:
      .db $0f, $02, $f7, $3d, $e7, $8e, $0f, $05, $47, $0e
      .db $78, $86, $98, $06, $0f, $08, $19, $10, $29, $90
      .db $47, $b9, $f7, $8e, $48, $9b, $88, $1e, $ff

E_GroundArea26:
      .db $6e, $04, $80, $80, $ff
	  
E_GroundArea27:
	  .db $ff

E_GroundArea28: ;D-3
      .db $fb, $bc, $0f, $03, $3b, $38, $c6, $07, $73, $85
      .db $77, $05, $0f, $07, $77, $05, $a3, $05, $18, $8e
      .db $9c, $1c, $fb, $3c, $0f, $0b, $03, $03, $ff
  
E_GroundArea29: ;B-1
      .db $4b, $8e, $eb, $38, $7b, $86, $8b, $bc, $9e, $41
      .db $46, $9e, $41, $a6, $1b, $80, $ab, $38, $56, $8f
      .db $0b, $b7, $a7, $03, $67, $85, $a3, $00, $9b, $86
      .db $b9, $06, $47, $87, $83, $03, $9e, $34, $40, $9e
      .db $2b, $a6, $a6, $03, $bb, $3c, $ab, $b7, $e6, $04
      .db $b5, $82, $e3, $02, $ff
  
E_GroundArea30:
      .db $3b, $81, $8b, $38, $27, $80, $67, $b9, $8b, $02
      .db $2b, $83, $37, $85, $73, $05, $0e, $81, $20, $80, $0e
      .db $81, $80, $00, $7b, $37, $77, $07, $6b, $bb, $b7, $03
      .db $0f, $09, $1b, $38, $5a, $0f, $26, $8e, $96, $0e
      .db $eb, $37, $a7, $80, $ff
	  
E_GroundArea31:
      .db $ff

E_GroundArea32: ;C-2
      .db $96, $8f, $ac, $14, $c3, $86, $18, $87, $68, $82
      .db $d9, $0f, $3a, $82, $65, $07, $f9, $29, $26, $90
      .db $18, $83, $f6, $0f, $c5, $86, $ff


E_GroundArea33: ;C-3
      .db $0f, $02, $67, $01, $07, $8e, $d7, $be, $f8, $83
      .db $0f, $07, $77, $03, $c1, $11, $c7, $ba, $c8, $90
      .db $ff

E_GroundArea34: ;A-1
      .db $3b, $81, $8b, $38, $27, $80, $67, $b9, $8b, $02
      .db $2b, $83, $37, $85, $73, $05, $0e, $c1, $20, $0e
      .db $41, $80, $7b, $37, $77, $07, $6b, $bb, $b7, $03
      .db $0f, $09, $1b, $38, $5a, $0f, $26, $8e, $96, $0e
      .db $eb, $37, $a7, $80, $ff

E_GroundArea35: ;A-3
      .db $57, $83, $52, $8f, $d7, $07, $76, $83, $7b, $80
      .db $b4, $07, $5b, $bc, $a8, $10, $74, $87, $f7, $03
      .db $62, $8b, $b2, $18, $e8, $02, $ff

E_GroundArea36: ;B-3
      .db $c7, $8f, $c5, $a4, $fa, $0a, $17, $a4, $97, $0f
      .db $65, $a4, $b9, $24, $0a, $97, $b9, $02, $0f, $07
      .db $53, $03, $cb, $03, $a2, $8e, $bb, $02, $db, $02
      .db $b1, $8e, $ff

E_GroundArea37: ;D-1
      .db $1b, $bc, $eb, $3c, $6b, $b8, $48, $85, $98, $00
      .db $1b, $8e, $eb, $3c, $6b, $b8, $7b, $80, $86, $03
      .db $a9, $9f, $b3, $85, $d7, $05, $e5, $8f, $ab, $b8
      .db $0f, $0d, $38, $10, $bb, $b8, $1b, $82, $4b, $02
      .db $0b, $bc, $8b, $38, $bb, $8e, $0f, $13, $89, $0e
      .db $1a, $9e, $88, $9f, $ff

E_GroundArea38: ;D-2
      .db $cb, $80, $95, $90, $07, $85, $5b, $b8, $8b, $02
      .db $0f, $06, $4b, $0e, $ab, $0e, $8b, $85, $b7, $05
      .db $1b, $bb, $2e, $00, $80, $2e, $00, $e0, $76, $03
      .db $d4, $03, $63, $90, $07, $90, $8b, $37, $a7, $0e
      .db $7b, $b7, $a7, $0e, $ff

E_GroundArea39: ;C-1
      .db $17, $8e, $54, $0f, $2b, $82, $9b, $82, $27, $8e
      .db $cb, $38, $cb, $b7, $0b, $82, $5b, $02, $9e, $41
      .db $c4, $9e, $41, $e4, $23, $82, $8b, $02, $c8, $8f
      .db $3e, $b4, $c0, $74, $06, $a4, $06, $1b, $8e, $7b
      .db $bc, $d5, $07, $a7, $82, $d4, $02, $ff

E_GroundArea40: ;D-4 Overworld Room?
      .db $a5, $86, $e4, $28, $18, $a8, $45, $83, $69, $03
      .db $c6, $29, $9b, $83, $16, $a4, $88, $24, $e9, $28
      .db $05, $a8, $7b, $28, $24, $8f, $c8, $03, $e8, $03
      .db $46, $a8, $85, $24, $c8, $24, $ff
	  
E_UndergroundArea1:
      .db $0b, $87, $1a, $07, $db, $02, $fb, $bc, $b7, $85
      .db $0b, $86, $47, $06, $b8, $0a, $9b, $83, $6b, $bc
      .db $7e, $82, $02, $00, $1b, $86, $c8, $0f, $35, $a7, $b7
      .db $27, $bd, $27, $2b, $83, $a2, $26, $a9, $26, $27
      .db $b4, $6e, $4a, $01, $00, $2e, $44, $0b, $80, $ff

E_UndergroundArea2:
      .db $7b, $80, $23, $85, $47, $05, $8b, $0e, $5e, $55, $80
      .db $80, $f9, $06, $17, $86, $eb, $37, $a9, $9f, $ab
      .db $8e, $07, $85, $80, $c3, $05, $69, $9c, $8b, $83, $bb
      .db $06, $18, $8e, $5b, $06, $00, $92, $a6, $97, $26, $fb
      .db $8e, $22, $a6, $29, $26, $ce, $5a, $81, $00, $ff

E_UndergroundArea3:
      .db $de, $44, $0b, $00, $de, $4a, $61, $00, $de, $4a, $a1, $00, $de
      .db $4f, $f6, $00, $0f, $02, $de, $80, $07, $00, $de, $47, $2b, $00
      .db $de, $50, $ea, $00, $0f, $04, $de, $43, $46, $00, $0f, $06
      .db $de, $51, $c9, $00, $0f, $08, $de, $44, $0b, $00, $de, $57
      .db $c9, $00, $ff

E_UndergroundArea4:
      .db $56, $ab, $47, $87, $8b, $00, $bb, $06, $38, $83
      .db $68, $03, $94, $87, $cb, $01, $97, $ba, $9b, $82
      .db $0f, $09, $0b, $3c, $89, $29, $08, $a9, $a7, $05
      .db $6e, $5a, $2b, $80, $6e, $80, $40, $00, $6e, $45, $8b, $6e, $00
      .db $25, $cb, $ff

E_UndergroundArea5: ;D-4 Cave Room
      .db $ee, $e5, $f0, $ff

E_UndergroundArea6: ;A-2
      .db $56, $ab, $47, $87, $8b, $00, $bb, $06, $38, $83
      .db $68, $03, $94, $87, $cb, $01, $97, $ba, $9b, $82
      .db $0f, $09, $0b, $3c, $89, $29, $08, $a9, $a7, $05
      .db $6e, $a5, $2b, $6e, $40, $40, $6e, $25, $8b, $6e
      .db $25, $cb, $ff

E_CastleArea1:
      .db $76, $9d, $ea, $1d, $0f, $03, $16, $1d, $c6, $1d
      .db $36, $9d, $c9, $1d, $04, $9b, $49, $1d, $84, $1b
      .db $88, $95, $0f, $08, $78, $2d, $a6, $28, $9b, $b5
      .db $ff

E_CastleArea2:
      .db $0f, $02, $14, $02, $34, $02, $56, $9b, $c9, $1b
      .db $0f, $07, $37, $1b, $aa, $1b, $42, $95, $0f, $0a
      .db $2a, $1b, $5b, $0c, $78, $2d, $9b, $b5, $ff

E_CastleArea3:
      .db $3b, $82, $77, $1f, $ab, $02, $59, $9d, $19, $9d
      .db $77, $03, $d9, $1d, $47, $83, $99, $1d, $26, $9d
      .db $5a, $2b, $8a, $2c, $ca, $1b, $22, $95, $ab, $38
      .db $db, $0c, $1b, $8c, $78, $ad, $a6, $28, $9b, $b5
      .db $ff

E_CastleArea4:
      .db $0b, $8c, $2b, $17, $5b, $0c, $ab, $0c, $fb, $0c
      .db $5b, $80, $8b, $03, $65, $9d, $6b, $1b, $05, $9d
      .db $0b, $1b, $8b, $37, $03, $9b, $0a, $1d, $8b, $0c
      .db $1b, $8c, $6b, $0c, $72, $15, $db, $0c, $98, $82
      .db $c8, $02, $78, $ad, $a6, $28, $9b, $b5, $ff

E_CastleArea5:
      .db $62, $ac, $63, $2c, $c4, $1e, $4b, $86, $82, $2c
      .db $87, $2c, $d4, $2c, $a8, $85, $e4, $05, $eb, $bc
      .db $44, $82, $74, $02, $bb, $38, $77, $9b, $77, $83
      .db $cb, $03, $08, $9d, $33, $1c, $78, $1d, $bd, $1c
      .db $c8, $1c, $a2, $95, $e8, $00, $39, $9c, $17, $9d
      .db $77, $1b, $38, $8e, $0f, $0e, $3a, $1b, $78, $2d
      .db $a6, $28, $9b, $b5, $ff

E_CastleArea6:
      .db $0f, $03, $bb, $38, $6d, $a8, $1e, $00, $e0, $80, $0f
      .db $07, $db, $0e, $fb, $0e, $7b, $82, $54, $8f, $8e
      .db $c5, $ec, $00, $0f, $0d, $4e, $00, $e0, $00, $88, $2d, $4e
      .db $c5, $f0, $80, $0f, $10, $9a, $07, $ae, $00, $e0, $00, $7b
      .db $8c, $b8, $05, $5b, $95, $78, $2d, $9b, $b5, $ff

E_CastleArea7:
      .db $09, $a9, $eb, $3b, $49, $9b, $75, $1e, $b9, $1d
      .db $f5, $1d, $4a, $9b, $67, $90, $f5, $1f, $02, $95
      .db $45, $2c, $86, $2c, $c7, $2c, $45, $9b, $d5, $1b
      .db $c7, $be, $78, $ad, $a6, $28, $9b, $b5, $ff

E_CastleArea8:
      .db $68, $83, $c7, $39, $6c, $a8, $fd, $29, $8d, $a9
      .db $0f, $08, $9a, $1c, $2a, $9b, $0f, $0b, $88, $1e
      .db $18, $9e, $ad, $1e, $8b, $80, $78, $ad, $96, $28
      .db $9b, $b5, $ff
	  
E_CastleArea9:
      .db $0f, $06, $03, $18, $0d, $98, $59, $ad, $ff

E_CastleArea10: ;A-4
      .db $7a, $9d, $dc, $29, $e5, $1d, $8b, $8c, $07, $86
      .db $b7, $3d, $f7, $06, $99, $9d, $e4, $1b, $0e, $c0
      .db $20, $0e, $41, $88, $4b, $02, $7b, $0c, $84, $1b
      .db $82, $15, $c4, $07, $68, $83, $0f, $08, $78, $2d
      .db $a6, $28, $9b, $b5, $ff

E_CastleArea11: ;C-4
      .db $28, $9f, $ab, $37, $d8, $1f, $dc, $9b, $06, $9d
      .db $9c, $1b, $d7, $1d, $3b, $b7, $9d, $0c, $18, $83
      .db $22, $15, $ad, $0c, $c4, $1b, $f8, $02, $8b, $b7
      .db $cb, $0c, $2b, $8c, $3a, $9c, $78, $2d, $a6, $28
      .db $9b, $b5, $ff

E_CastleArea12: ;B-4
      .db $09, $9d, $7b, $3c, $eb, $06, $0f, $03, $5b, $37
      .db $bc, $1d, $e1, $18, $15, $9d, $2c, $1b, $ec, $1d
      .db $f5, $1b, $12, $95, $9b, $0c, $e7, $02, $38, $8c
      .db $78, $10, $db, $0c, $0f, $08, $78, $2d, $a6, $28
      .db $9b, $b5, $ff

E_CastleArea13: ;D-4
      .db $0f, $03, $3e, $65, $e1, $bb, $3c, $6d, $a8, $1e
      .db $e5, $e7, $0f, $08, $0b, $0e, $4e, $65, $e1, $47
      .db $07, $bb, $38, $66, $90, $a5, $0f, $be, $65, $ec
      .db $0f, $0c, $ce, $65, $e1, $08, $ad, $4e, $b6, $e0
      .db $0f, $10, $ae, $65, $e1, $fb, $95, $3a, $9b, $78
      .db $2d, $ab, $0c, $9b, $b5, $ff

L_WaterArea1:
      .db $4f, $1f, $1e, $02, $39, $73, $5e, $07, $ae, $0c
      .db $14, $8a, $1e, $02, $fb, $0a, $6e, $88, $73, $0a
      .db $9e, $08, $88, $8a, $c3, $0a, $2e, $8b, $45, $09
      .db $4e, $0f, $ed, $47, $fd

L_WaterArea2:
      .db $89, $01, $6a, $41, $f8, $52, $47, $d3, $c6, $32
      .db $d5, $41, $47, $d3, $5c, $0a, $70, $63, $83, $34
      .db $9a, $40, $a9, $42, $d3, $63, $da, $40, $08, $d2
      .db $69, $42, $6a, $22, $bc, $01, $d3, $64, $e3, $64
      .db $41, $c2, $86, $32, $87, $63, $9c, $06, $04, $d6
      .db $19, $42, $1a, $43, $5c, $08, $20, $e6, $42, $48
      .db $45, $42, $a5, $42, $e0, $66, $48, $e2, $57, $63
      .db $80, $67, $e6, $40, $e7, $52, $ea, $23, $f9, $40
      .db $07, $c0, $08, $51, $19, $40, $28, $40, $29, $51
      .db $08, $d2, $1c, $03, $5a, $41, $7c, $03, $b8, $41
      .db $b9, $61, $c9, $61, $dc, $03, $11, $b4, $52, $52
      .db $88, $52, $a6, $54, $67, $b2, $76, $41, $38, $d2
      .db $77, $42, $c6, $54, $ba, $e0, $c9, $61, $d8, $62
      .db $e7, $63, $f6, $64, $0c, $81, $51, $34, $52, $51
      .db $92, $50, $c1, $34, $c2, $52, $e2, $50, $fa, $42
      .db $02, $d1, $2a, $60, $39, $61, $3e, $08, $54, $61
      .db $56, $09, $5e, $3f, $8d, $4a, $eb, $61, $0d, $c6
      .db $fd

L_WaterArea3:
      .db $49, $21, $0e, $41, $a6, $54, $cc, $04, $38, $f2
      .db $5a, $42, $86, $20, $87, $20, $88, $52, $c7, $73
      .db $ec, $04, $03, $f1, $05, $31, $36, $42, $39, $71
      .db $58, $72, $89, $51, $e7, $73, $00, $e1, $02, $36
      .db $19, $51, $1d, $49, $41, $42, $85, $75, $ac, $03
      .db $e3, $71, $e5, $31, $66, $c2, $a7, $73, $d5, $55
      .db $f0, $63, $03, $b4, $08, $72, $42, $36, $49, $71
      .db $75, $75, $a3, $3f, $e8, $72, $14, $d2, $2c, $03
      .db $54, $44, $67, $73, $91, $51, $a6, $74, $d8, $52
      .db $f4, $72, $f7, $31, $39, $f1, $72, $58, $a9, $51
      .db $bc, $05, $c6, $43, $31, $a1, $32, $36, $38, $72
      .db $79, $71, $93, $51, $b8, $52, $dc, $00, $e9, $0b
      .db $fc, $00, $26, $d4, $4a, $60, $59, $61, $68, $62
      .db $77, $63, $8c, $05, $95, $43, $e7, $63, $f9, $61
      .db $25, $d5, $74, $72, $77, $31, $9c, $04, $e7, $73
      .db $10, $e2, $21, $36, $22, $51, $37, $73, $43, $42
      .db $52, $50, $82, $52, $91, $62, $99, $71, $b8, $72
      .db $d3, $77, $6c, $88, $95, $30, $d0, $3f, $1c, $88
      .db $45, $30, $aa, $60, $b9, $61, $c8, $62, $ce, $2b
      .db $e4, $60, $e5, $09, $ee, $0f, $8d, $c6, $fd
	  
L_WaterArea4:
      .db $41, $01, $b4, $34, $c8, $52, $f2, $51, $47, $d3
      .db $65, $49, $6c, $03, $9e, $07, $be, $01, $cc, $03
      .db $fe, $07, $0d, $c9, $1e, $01, $62, $35, $63, $53
      .db $6c, $01, $8a, $41, $ac, $01, $b3, $53, $e9, $51
      .db $26, $c3, $27, $33, $63, $43, $64, $33, $ba, $60
      .db $c9, $61, $ce, $0b, $e5, $09, $ee, $0f, $7d, $ca
      .db $7d, $47, $fd

L_WaterArea5:
      .db $48, $a1, $0a, $60, $19, $61, $29, $71, $49, $61
      .db $5a, $30, $33, $f7, $98, $0a, $d6, $36, $ea, $10
      .db $05, $90, $30, $f5, $30, $29, $36, $21, $5e, $00
      .db $7e, $21, $b0, $77, $b8, $35, $17, $84, $26, $06
      .db $35, $04, $0c, $f4, $24, $12, $00, $e6, $70, $67
      .db $d8, $62, $e9, $61, $fa, $60, $9c, $80, $9f, $06
      .db $c7, $46, $3a, $e0, $49, $61, $59, $71, $79, $61
      .db $8a, $30, $dc, $74, $f4, $11, $f6, $10, $75, $a8
      .db $3f, $b8, $30, $8d, $8f, $26, $fd

L_WaterArea6:
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

L_WaterArea7:
      .db $50, $31, $0f, $26, $a9, $71, $f7, $73, $35, $f5
      .db $95, $65, $9e, $10, $b2, $71, $b4, $25, $24, $f2
      .db $27, $24, $47, $50, $79, $29, $87, $71, $e6, $72
      .db $6e, $b1, $79, $23, $85, $73, $17, $a5, $24, $43
      .db $35, $71, $fe, $30, $2e, $b1, $48, $24, $55, $72
      .db $b7, $24, $d3, $73, $2a, $c5, $c8, $23, $d4, $73
      .db $37, $f1, $39, $21, $7e, $00, $ab, $61, $bb, $61
      .db $de, $31, $85, $93, $8e, $10, $c7, $12, $f4, $14
      .db $fe, $31, $d8, $e2, $0d, $ca, $4f, $38, $4d, $c1
      .db $9f, $26, $6d, $c6, $fd
	  
L_WaterArea8:
	  .db $97, $01, $0F, $26, $D3, $32, $E3, $67, $25, $E5, $37, $31, $55, $65, $86, $64, $95, $31, $98, $31, $B6, $64, $E5, $65, $F5, $30, $06, $E0, $17, $30, $25, $65, $55, $65, $67, $60, $76, $60, $78, $60, $85, $31, $89, $60, $9A, $30, $C2, $60, $D3, $30, $E4, $66, $F3, $30, $02, $E0, $25, $63, $34, $31, $39, $31, $55, $63, $84, $64, $99, $32, $C4, $64, $02, $E5, $09, $60, $8B, $60, $E7, $63, $ED, $42, $0D, $06, $3E, $42, $6F, $20, $CE, $47, $3D, $C7, $FD

L_WaterArea9:
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

L_WaterArea10:
	  .db $41, $01, $B4, $34, $C8, $52, $F2, $51, $47, $D3, $65, $49, $6C, $03, $9E, $07, $BE, $01, $CC, $03, $FE, $07, $0D, $C9, $1E, $01, $62, $35, $63, $53, $6C, $01, $8A, $41, $AC, $01, $B3, $53, $E9, $51, $26, $C3, $27, $33, $63, $43, $64, $33, $BA, $60, $C9, $61, $CE, $0B, $E5, $09, $EE, $0F, $7D, $CA, $7D, $47, $FD

L_WaterArea11: ; B-2
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

L_GroundArea1:
      .db $94, $11, $0f, $26, $fe, $10, $0e, $c5, $17, $14
      .db $53, $12, $76, $15, $b5, $41, $4a, $f2, $78, $16
      .db $b7, $42, $e9, $19, $f6, $17, $03, $80, $45, $42
      .db $72, $13, $81, $41, $15, $9a, $1b, $1f, $24, $46
      .db $d2, $12, $e1, $40, $49, $95, $78, $42, $48, $f4
      .db $64, $15, $93, $42, $b5, $12, $d9, $14, $f8, $42
      .db $78, $9b, $de, $91, $e3, $77, $7d, $c1, $9e, $42
      .db $cf, $20, $fd

L_GroundArea2:
      .db $90, $70, $0b, $17, $0f, $26, $9e, $31, $6e, $c2
      .db $0e, $c0, $1e, $10, $4a, $14, $a7, $16, $25, $96
      .db $33, $0b, $fe, $42, $0b, $9f, $26, $04, $36, $20
      .db $86, $08, $0b, $95, $5e, $40, $b8, $64, $18, $e4
      .db $5c, $38, $3c, $a7, $cc, $01, $e7, $73, $eb, $31
      .db $0c, $81, $2e, $42, $3b, $1f, $48, $2f, $3b, $9d
      .db $48, $2c, $f8, $07, $0e, $b1, $5e, $40, $ee, $42
      .db $fe, $c0, $39, $e1, $3e, $00, $48, $33, $87, $39
      .db $8d, $4a, $fe, $31, $03, $82, $13, $02, $6d, $41
      .db $8e, $42, $bf, $20, $fd

L_GroundArea3:
      .db $52, $21, $0f, $20, $6e, $40, $92, $82, $97, $00
      .db $b4, $01, $fb, $71, $3c, $80, $f8, $62, $98, $f2
      .db $15, $81, $26, $01, $37, $01, $48, $01, $c8, $41
      .db $c9, $71, $ec, $03, $ac, $f3, $e7, $00, $77, $e3
      .db $8a, $42, $39, $f1, $6a, $43, $48, $fa, $7a, $47
      .db $5c, $81, $77, $00, $8c, $72, $bc, $73, $f7, $20
      .db $07, $87, $87, $42, $c9, $71, $ec, $01, $4b, $f1
      .db $6f, $38, $27, $87, $37, $01, $3d, $4a, $6d, $41
      .db $af, $26, $fd

L_GroundArea4:
      .db $52, $31, $0f, $20, $6e, $45, $ec, $73, $04, $80
      .db $14, $01, $b3, $26, $b7, $26, $68, $f2, $dc, $02
      .db $98, $fa, $f7, $01, $07, $81, $37, $73, $ba, $30
      .db $c9, $61, $dc, $59, $fc, $25, $78, $e2, $7e, $31
      .db $a6, $06, $b6, $21, $c2, $03, $39, $f1, $79, $71
      .db $97, $73, $07, $a9, $13, $21, $13, $01, $33, $22
      .db $63, $00, $73, $22, $a3, $05, $f9, $0b, $0c, $85
      .db $af, $33, $ec, $01, $57, $a6, $5c, $65, $b3, $00
      .db $66, $a1, $67, $20, $77, $07, $df, $33, $1c, $84
      .db $9f, $38, $2c, $81, $8d, $41, $cf, $26, $fd

L_GroundArea5:
      .db $53, $21, $0f, $26, $43, $81, $47, $00, $65, $01
      .db $83, $01, $87, $01, $c7, $73, $49, $f9, $d6, $74
      .db $59, $89, $68, $72, $3a, $e0, $4c, $52, $7a, $60
      .db $e7, $00, $f5, $50, $03, $a8, $7c, $71, $a7, $42
      .db $e7, $08, $06, $a2, $47, $07, $57, $06, $b5, $01
      .db $d3, $00, $d7, $01, $f5, $01, $76, $a0, $93, $23
      .db $f6, $24, $f7, $24, $1c, $f1, $8f, $0b, $d7, $0a
      .db $15, $8a, $5f, $33, $9c, $51, $b7, $63, $c8, $62
      .db $d9, $61, $ea, $60, $37, $f3, $97, $02, $a7, $01
      .db $b7, $01, $39, $f1, $bc, $73, $c4, $72, $5f, $b8
      .db $6d, $c1, $af, $26, $fd

L_GroundArea6:
      .db $90, $11, $0f, $26, $fe, $10, $2c, $c3, $87, $17
      .db $b2, $42, $f3, $12, $1a, $92, $32, $40, $36, $15
      .db $42, $41, $82, $15, $2b, $93, $c2, $43, $c3, $13
      .db $d1, $41, $1b, $94, $27, $00, $67, $12, $c4, $15
      .db $c5, $0a, $f5, $c1, $29, $93, $85, $17, $a4, $41
      .db $c4, $41, $0a, $c4, $0b, $14, $44, $13, $63, $41
      .db $96, $13, $0e, $91, $9f, $37, $13, $e7, $8d, $41
      .db $ae, $42, $df, $20, $fd

L_GroundArea7:
      .db $94, $11, $0f, $26, $6e, $43, $af, $32, $d8, $62
      .db $e8, $62, $ee, $10, $fc, $3f, $ed, $c8, $f8, $64
      .db $0c, $be, $a5, $42, $f8, $64, $0c, $be, $35, $43
      .db $f8, $64, $48, $e4, $5c, $39, $83, $42, $f8, $64
      .db $48, $e4, $5c, $39, $f8, $64, $37, $e5, $4c, $24
      .db $63, $00, $73, $42, $97, $65, $9e, $11, $09, $97
      .db $ee, $10, $f8, $64, $0c, $bf, $53, $45, $9d, $48
      .db $08, $e4, $28, $64, $3c, $37, $b8, $64, $f8, $64
      .db $0c, $b7, $88, $64, $8e, $11, $b7, $00, $d7, $01
      .db $f7, $01, $78, $e4, $8c, $38, $8c, $58, $18, $e4
      .db $49, $1a, $5d, $4a, $76, $0a, $ee, $11, $1f, $b8
      .db $1d, $c1, $3e, $42, $6f, $20, $fd

L_GroundArea8:
      .db $52, $21, $0f, $20, $6e, $44, $07, $84, $17, $20
      .db $6f, $33, $ac, $2f, $ac, $5f, $13, $81, $33, $00
      .db $53, $01, $a6, $16, $a7, $65, $4a, $e0, $5c, $54
      .db $a7, $63, $bc, $28, $bc, $58, $47, $e3, $54, $06
      .db $64, $22, $fc, $07, $0b, $fa, $13, $25, $4b, $72
      .db $dc, $02, $04, $a3, $44, $05, $57, $02, $bc, $04
      .db $57, $f3, $a6, $74, $d3, $04, $e3, $22, $e8, $72
      .db $24, $f6, $dc, $02, $8c, $81, $aa, $32, $43, $a4
      .db $47, $07, $c3, $04, $c7, $01, $39, $f1, $76, $23
      .db $c9, $0b, $e1, $69, $f1, $69, $8d, $c1, $cf, $26
      .db $fd

L_GroundArea9:
      .db $f0, $31, $0f, $26, $ad, $40, $3d, $c6, $fd

L_GroundArea10:
      .db $95, $b1, $0f, $20, $4e, $42, $6e, $45, $2b, $f1
      .db $f6, $42, $fb, $71, $39, $f1, $6c, $01, $09, $91
      .db $1c, $01, $98, $11, $9a, $10, $03, $c3, $0c, $73
      .db $27, $00, $66, $86, $76, $20, $a8, $02, $b6, $64
      .db $cc, $54, $19, $f1, $44, $43, $57, $7b, $f7, $11
      .db $f9, $11, $2c, $81, $1b, $f1, $27, $03, $37, $34
      .db $38, $62, $4a, $42, $eb, $71, $57, $84, $8c, $02
      .db $d4, $72, $d7, $31, $f7, $43, $28, $92, $84, $33
      .db $95, $41, $98, $72, $bc, $04, $08, $92, $34, $41
      .db $36, $74, $a4, $16, $36, $c1, $38, $72, $7f, $38
      .db $7d, $c1, $bf, $26, $fd

L_GroundArea11:
      .db $90, $21, $39, $f1, $bf, $37, $33, $e7, $a3, $02
      .db $a7, $02, $cd, $41, $0f, $a6, $ed, $47, $fd

L_GroundArea12:
      .db $90, $21, $0f, $26, $fe, $10, $0b, $93, $46, $14
      .db $55, $42, $a7, $16, $b6, $44, $12, $93, $4a, $17
      .db $59, $42, $73, $13, $90, $00, $b7, $13, $05, $c0
      .db $1c, $17, $1f, $14, $8f, $13, $94, $40, $1b, $94
      .db $35, $12, $61, $42, $62, $12, $70, $40, $86, $12
      .db $95, $40, $a3, $14, $1c, $98, $1f, $13, $47, $13
      .db $9f, $13, $b5, $40, $cc, $16, $cf, $14, $d5, $40
      .db $15, $c0, $2f, $14, $35, $40, $39, $12, $7c, $16
      .db $7f, $13, $98, $13, $c4, $40, $df, $13, $e4, $40
      .db $17, $95, $46, $42, $72, $12, $a6, $16, $28, $94
      .db $ce, $11, $2d, $c1, $4e, $42, $7f, $20, $fd

L_GroundArea13:
      .db $90, $11, $0f, $26, $fe, $10, $18, $92, $35, $15
      .db $99, $73, $9d, $48, $f7, $13, $5b, $92, $69, $0b
      .db $e9, $17, $f8, $46, $7b, $97, $88, $00, $8d, $4a
      .db $17, $94, $7c, $15, $7f, $13, $cf, $16, $fc, $13
      .db $ff, $11, $2f, $95, $68, $14, $77, $43, $d7, $41
      .db $d8, $74, $f9, $41, $fa, $72, $1b, $94, $1d, $48
      .db $79, $12, $a5, $16, $d4, $43, $1b, $94, $49, $0b
      .db $5d, $4a, $9b, $71, $dc, $15, $df, $12, $03, $c1
      .db $2f, $15, $43, $12, $77, $13, $b4, $13, $c2, $71
      .db $e2, $c2, $e3, $12, $5e, $91, $6d, $41, $8e, $42
      .db $bf, $20, $fd

L_GroundArea14:
      .db $52, $21, $0f, $20, $6e, $40, $0c, $f3, $4c, $01
      .db $aa, $34, $b9, $33, $c8, $32, $f7, $33, $f8, $62
      .db $fe, $20, $4e, $a1, $59, $71, $7c, $01, $93, $22
      .db $97, $21, $a3, $04, $b7, $07, $27, $a5, $33, $25
      .db $9c, $01, $f6, $43, $5f, $b3, $97, $63, $ac, $03
      .db $58, $e2, $67, $63, $76, $64, $85, $65, $94, $66
      .db $a6, $41, $a7, $7b, $cc, $02, $59, $f1, $98, $72
      .db $c6, $42, $13, $83, $17, $02, $4c, $00, $af, $34
      .db $f9, $71, $27, $80, $37, $01, $8c, $00, $ff, $35
      .db $4e, $a0, $55, $23, $7a, $33, $95, $07, $9e, $21
      .db $7f, $b6, $d3, $0b, $ec, $01, $00, $ea, $10, $6a
      .db $28, $72, $78, $72, $0f, $b8, $82, $60, $92, $68
      .db $2d, $c1, $6f, $26, $fd

L_GroundArea15:
      .db $06, $c1, $4c, $00, $f4, $4f, $0d, $02, $06, $20
      .db $24, $4f, $35, $a0, $36, $20, $53, $46, $d5, $20
      .db $d6, $20, $34, $a1, $73, $49, $74, $20, $94, $20
      .db $b4, $20, $d4, $20, $f4, $20, $2e, $80, $59, $42
      .db $4d, $c7, $fd

L_GroundArea16:
      .db $92, $b1, $0f, $20, $6e, $40, $de, $45, $e9, $71
      .db $dc, $f5, $07, $80, $37, $73, $5c, $0a, $0a, $c2
      .db $3c, $00, $49, $11, $6c, $00, $9c, $02, $06, $87
      .db $16, $22, $c6, $74, $26, $f4, $b5, $42, $c9, $11
      .db $e7, $73, $59, $91, $6c, $03, $76, $41, $a8, $11
      .db $aa, $10, $29, $f1, $f9, $61, $b8, $92, $c6, $74
      .db $27, $83, $99, $61, $a5, $28, $e2, $07, $39, $e1
      .db $57, $01, $67, $00, $77, $01, $ca, $60, $dc, $56
      .db $48, $fa, $4c, $61, $69, $71, $43, $85, $47, $27
      .db $53, $26, $29, $e1, $a7, $42, $bb, $71, $1c, $82
      .db $47, $73, $e8, $72, $0c, $81, $49, $11, $67, $06
      .db $75, $41, $77, $73, $c4, $10, $c5, $60, $25, $b2
      .db $34, $41, $b8, $12, $34, $81, $3f, $35, $43, $01
      .db $52, $01, $b6, $41, $d6, $74, $2c, $82, $36, $40
      .db $7c, $02, $86, $40, $b7, $7b, $f9, $61, $19, $e1
      .db $39, $61, $9c, $03, $d9, $42, $da, $42, $0c, $83
      .db $09, $91, $18, $12, $88, $72, $f7, $20, $07, $87
      .db $17, $08, $39, $71, $a9, $61, $b7, $63, $c5, $65
      .db $d3, $67, $e1, $69, $8d, $c1, $cf, $26, $fd

L_GroundArea17:
      .db $50, $71, $0f, $26, $fc, $00, $1f, $b4, $65, $65
      .db $74, $66, $84, $66, $98, $72, $dc, $65, $dc, $75
      .db $4c, $80, $b3, $20, $c3, $08, $c9, $0b, $dc, $02
      .db $2c, $82, $63, $2e, $8c, $00, $fc, $00, $53, $aa
      .db $78, $72, $ec, $01, $4c, $80, $79, $0b, $8c, $04
      .db $27, $a1, $47, $04, $89, $71, $d7, $06, $e7, $21
      .db $26, $e4, $3e, $42, $66, $07, $86, $04, $87, $a3
      .db $be, $40, $e9, $71, $4c, $85, $9e, $42, $c7, $73
      .db $39, $f1, $c6, $26, $2e, $c0, $58, $34, $be, $42
      .db $5e, $c0, $7f, $32, $b3, $05, $b7, $63, $e3, $67
      .db $f3, $67, $e7, $fb, $6d, $c6, $fd

L_GroundArea18:
      .db $52, $b1, $0f, $20, $6e, $47, $39, $91, $77, $01
      .db $87, $00, $c8, $10, $c9, $11, $0c, $8f, $4c, $47
      .db $76, $42, $47, $93, $d8, $12, $e6, $0b, $e8, $62
      .db $ee, $10, $fc, $38, $7e, $b1, $86, $11, $88, $61
      .db $8a, $10, $f6, $41, $f7, $21, $17, $84, $27, $07
      .db $69, $11, $ac, $01, $c6, $7c, $17, $a6, $33, $26
      .db $e9, $71, $5c, $83, $a8, $72, $dc, $03, $46, $83
      .db $87, $12, $8a, $10, $d7, $42, $39, $f1, $97, $24
      .db $a3, $05, $b3, $23, $09, $f1, $3c, $73, $99, $11
      .db $28, $91, $2a, $10, $45, $22, $71, $04, $79, $0b
      .db $8c, $00, $9f, $35, $e3, $11, $fc, $2b, $fc, $0b
      .db $b7, $e3, $2f, $b8, $3d, $c1, $7f, $26, $fd

L_GroundArea19:
      .db $00, $c1, $4c, $00, $f4, $4f, $0d, $02, $02, $42
      .db $43, $4f, $52, $c2, $de, $00, $5a, $c2, $4d, $c7
      .db $fd

L_GroundArea20:
      .db $54, $11, $0f, $26, $ea, $41, $28, $f2, $a7, $73
      .db $06, $a1, $26, $04, $57, $42, $a7, $03, $2c, $83
      .db $cb, $71, $2c, $84, $38, $42, $d9, $09, $e8, $62
      .db $f8, $62, $79, $8b, $a3, $77, $06, $a3, $59, $42
      .db $c7, $07, $db, $71, $14, $c2, $36, $31, $98, $72
      .db $4c, $86, $f4, $40, $02, $c0, $05, $42, $22, $40
      .db $34, $40, $37, $21, $57, $04, $7b, $71, $c3, $67
      .db $d3, $36, $dc, $06, $43, $e7, $77, $07, $87, $50
      .db $97, $50, $a7, $50, $b7, $50, $c7, $50, $d7, $50
      .db $39, $f1, $7f, $38, $8d, $c1, $cf, $26, $fd

L_GroundArea21:
      .db $53, $11, $0f, $26, $7e, $10, $eb, $61, $fb, $61
      .db $2b, $e1, $6e, $21, $ba, $42, $f7, $08, $f9, $51
      .db $58, $a2, $78, $07, $2c, $e2, $2c, $71, $47, $00
      .db $6e, $10, $fe, $21, $03, $87, $06, $02, $13, $21
      .db $16, $02, $27, $02, $89, $79, $c3, $25, $c7, $20
      .db $d7, $07, $e7, $73, $07, $a0, $17, $06, $48, $72
      .db $db, $71, $6e, $90, $79, $63, $89, $63, $b9, $73
      .db $f9, $63, $09, $e3, $6e, $21, $97, $06, $a7, $20
      .db $ae, $20, $fe, $21, $39, $f1, $99, $71, $b7, $73
      .db $d8, $72, $43, $a6, $47, $26, $ae, $00, $fe, $21
      .db $17, $84, $27, $29, $36, $49, $c7, $07, $ff, $33
      .db $58, $f2, $6e, $00, $ee, $21, $ff, $38, $0d, $0d
      .db $0d, $41, $4f, $26, $fd

L_GroundArea22:
      .db $55, $31, $16, $03, $4c, $00, $4e, $21, $fe, $00
      .db $18, $95, $37, $42, $66, $17, $81, $42, $82, $12
      .db $b5, $42, $0e, $a1, $5c, $03, $9a, $42, $cc, $03
      .db $57, $a2, $5c, $63, $87, $04, $fe, $21, $8f, $b8
      .db $02, $bb, $28, $7a, $68, $7a, $a8, $7a, $e0, $6a
      .db $f0, $6a, $6d, $c5, $fd

L_GroundArea23:
      .db $95, $31, $0f, $26, $fe, $10, $18, $e4, $2c, $3c
      .db $c5, $42, $f8, $64, $36, $92, $54, $17, $a3, $42
      .db $1a, $96, $46, $01, $56, $00, $1c, $c3, $7c, $43
      .db $c8, $13, $d7, $42, $f5, $16, $42, $f2, $57, $12
      .db $cb, $71, $eb, $13, $ff, $32, $2c, $b7, $66, $42
      .db $a8, $64, $e8, $64, $3a, $e2, $42, $25, $46, $07
      .db $4c, $46, $56, $25, $a2, $05, $ba, $62, $0a, $c2
      .db $0b, $12, $37, $12, $6a, $42, $6b, $12, $92, $12
      .db $98, $15, $c7, $42, $1b, $92, $5c, $23, $ab, $15
      .db $f9, $0b, $16, $95, $25, $44, $86, $15, $b1, $12
      .db $f4, $41, $26, $95, $63, $72, $b3, $13, $c2, $42
      .db $dd, $4a, $6e, $91, $7d, $41, $9e, $42, $cf, $20
      .db $fd

L_GroundArea24:
      .db $96, $31, $0f, $26, $5e, $43, $c7, $01, $f5, $01
      .db $5c, $85, $48, $e0, $66, $60, $73, $01, $83, $01
      .db $ac, $01, $c3, $00, $c7, $02, $e8, $72, $27, $c3
      .db $0f, $b8, $9c, $01, $b7, $23, $f7, $07, $36, $c1
      .db $38, $7a, $63, $41, $65, $75, $ce, $10, $17, $95
      .db $98, $74, $ba, $13, $39, $e3, $80, $40, $83, $60
      .db $87, $65, $e8, $40, $eb, $61, $18, $94, $47, $41
      .db $66, $13, $c7, $75, $39, $f3, $7e, $31, $f7, $04
      .db $07, $a3, $6e, $10, $95, $67, $a5, $36, $15, $e7
      .db $78, $64, $8c, $38, $18, $e4, $6e, $31, $9c, $71
      .db $b7, $00, $f5, $43, $08, $f2, $8b, $71, $cf, $38
      .db $ad, $ca, $cd, $41, $0f, $a6, $fd

L_GroundArea25:
      .db $56, $11, $0f, $26, $af, $32, $d8, $62, $e8, $62
      .db $f8, $62, $fe, $10, $38, $92, $74, $12, $ad, $48
      .db $0b, $94, $2f, $32, $5c, $3b, $18, $e5, $68, $65
      .db $7c, $36, $e8, $65, $f4, $40, $03, $c0, $14, $40
      .db $28, $65, $3c, $34, $88, $65, $94, $40, $a3, $40
      .db $b4, $40, $c8, $65, $dc, $36, $48, $e5, $9a, $63
      .db $ac, $46, $e7, $42, $1a, $e3, $5c, $37, $1a, $e4
      .db $2c, $4f, $5c, $65, $5c, $76, $b3, $00, $2a, $e4
      .db $3c, $4f, $87, $47, $3a, $e4, $8b, $16, $07, $94
      .db $16, $42, $7b, $16, $89, $71, $06, $f3, $0a, $31
      .db $5c, $31, $9c, $31, $dc, $31, $1a, $9c, $43, $34
      .db $46, $0a, $5d, $4a, $86, $0a, $ee, $11, $0f, $b3
      .db $4c, $02, $73, $67, $83, $67, $95, $03, $1d, $c1
      .db $3e, $42, $6f, $20, $fd

L_GroundArea26:
      .db $50, $01, $00, $3e, $0e, $33, $9f, $34, $ae, $31
      .db $e6, $03, $68, $fa, $de, $2f, $6d, $c6, $fd

L_GroundArea27:
	  .db $95, $31, $39, $F1, $BF, $37, $33, $E7, $A3, $02, $A7, $02, $CD, $41, $0F, $A6, $ED, $47, $FD
	  
L_GroundArea28: ;D-3
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

L_GroundArea29: ;B-1
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

L_GroundArea30:
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

L_GroundArea31:
      .db $38, $31, $0f, $26, $ad, $40, $3d, $c7, $fd

L_GroundArea32: ;C-2
      .db $96, $11, $0f, $26, $bf, $32, $ec, $00, $fe, $10
      .db $38, $93, $57, $41, $ca, $12, $d8, $40, $3c, $b4
      .db $66, $41, $b3, $12, $2b, $98, $58, $00, $67, $41
      .db $68, $21, $b7, $41, $b8, $72, $bb, $16, $48, $94
      .db $fa, $62, $0c, $c9, $66, $42, $96, $01, $a6, $01
      .db $aa, $62, $55, $93, $d8, $64, $ec, $3a, $55, $c3
      .db $98, $64, $0e, $91, $1d, $4a, $7f, $33, $b6, $64
      .db $c5, $65, $d4, $66, $e3, $67, $f3, $67, $8d, $c1
      .db $df, $26, $fd

L_GroundArea33: ;C-3
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

L_GroundArea34: ; A-1
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

L_GroundArea35: ;A-3
      .db $90, $50, $0b, $1f, $0f, $26, $44, $c2, $47, $14
      .db $85, $0b, $ad, $48, $01, $c4, $02, $16, $a8, $16
      .db $d4, $00, $d7, $42, $36, $9c, $55, $43, $d3, $21
      .db $f3, $06, $1b, $99, $8a, $42, $eb, $17, $59, $8b
      .db $c5, $42, $c6, $16, $1c, $e1, $68, $41, $69, $73
      .db $b7, $14, $c6, $43, $23, $96, $b8, $14, $f6, $0b
      .db $72, $ea, $82, $6a, $92, $6a, $ed, $4a, $2e, $b1
      .db $3d, $41, $5e, $42, $8f, $20, $fd

L_GroundArea36: ;B-3
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

L_GroundArea37: ;D-1
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

L_GroundArea38: ;D-2
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

L_GroundArea39: ;C-1
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

L_GroundArea40: ;D-4 Overworld Room?
      .db $94, $11, $0f, $26, $fe, $10, $28, $94, $65, $15
      .db $eb, $12, $fa, $41, $4a, $96, $54, $40, $a4, $42
      .db $b7, $13, $e9, $19, $f5, $15, $11, $80, $47, $42
      .db $71, $13, $80, $41, $15, $92, $1b, $1f, $24, $40
      .db $55, $12, $64, $40, $95, $12, $a4, $40, $d2, $12
      .db $e1, $40, $13, $c0, $2c, $17, $2f, $12, $49, $13
      .db $83, $40, $9f, $14, $a3, $40, $17, $92, $83, $13
      .db $92, $41, $b9, $14, $c5, $12, $c8, $40, $d4, $40
      .db $4b, $92, $78, $1b, $9c, $94, $9f, $11, $df, $14
      .db $fe, $11, $7d, $c1, $9e, $42, $cf, $20, $fd

L_UndergroundArea1:
      .db $48, $0f, $0e, $01, $5e, $02, $a7, $00, $cc, $73
      .db $19, $e1, $3a, $60, $58, $62, $79, $61, $97, $63
      .db $b8, $62, $d6, $02, $f8, $62, $19, $e1, $75, $52
      .db $83, $43, $85, $52, $93, $43, $95, $52, $a5, $22
      .db $3e, $8d, $48, $51, $58, $51, $5e, $03, $7e, $02
      .db $a3, $24, $a7, $25, $f3, $08, $1a, $c3, $34, $53
      .db $46, $40, $47, $21, $56, $04, $81, $55, $91, $54
      .db $96, $50, $be, $03, $f7, $07, $fe, $02, $0c, $82
      .db $43, $44, $44, $24, $45, $24, $77, $fb, $d8, $72
      .db $39, $f1, $81, $53, $8c, $01, $a9, $71, $cc, $01
      .db $d1, $53, $2e, $81, $5f, $0b, $97, $63, $9e, $00
      .db $0e, $81, $43, $21, $57, $04, $67, $20, $8e, $00
      .db $fe, $01, $0e, $86, $6f, $47, $9e, $0f, $0e, $82
      .db $28, $7a, $68, $7a, $a8, $7a, $ae, $01
      .db $de, $0f, $6d, $c5, $fd

L_UndergroundArea2:
      .db $48, $81, $00, $5a, $5e, $02, $88, $62, $af, $33
      .db $6a, $c2, $97, $13, $ac, $02, $da, $42, $03, $a4
      .db $17, $25, $53, $04, $cf, $35, $76, $f4, $8e, $01
      .db $b3, $05, $b7, $02, $de, $02, $ef, $33, $2c, $81
      .db $46, $64, $56, $64, $64, $11, $66, $64, $7c, $01
      .db $ec, $74, $52, $c1, $52, $41, $53, $21, $7c, $02
      .db $a7, $0a, $b3, $22, $07, $f3, $69, $71, $c8, $12
      .db $19, $f1, $67, $27, $73, $27, $fc, $04, $67, $8a
      .db $c7, $07, $d7, $04, $f9, $11, $0c, $86, $a1, $55
      .db $b1, $55, $f8, $52, $08, $d2, $18, $52, $68, $72
      .db $89, $71, $ac, $02, $d9, $71, $fc, $01, $4e, $80
      .db $ee, $01, $26, $80, $36, $22, $7f, $31, $88, $10
      .db $9c, $02, $1c, $85, $6e, $06, $cf, $47, $fe, $0f
      .db $bd, $c6, $fd

L_UndergroundArea3:
      .db $48, $01, $00, $5a, $0e, $01, $3e, $06, $45, $46
      .db $47, $46, $53, $44, $ae, $01, $df, $4a, $4d, $c7
      .db $00, $da, $0e, $01, $2e, $04, $37, $28, $3a, $48
      .db $46, $47, $c7, $07, $ce, $0f, $df, $4a, $4d, $c7
      .db $00, $da, $0e, $01, $33, $53, $43, $51, $46, $40
      .db $47, $50, $53, $04, $55, $40, $56, $50, $62, $43
      .db $64, $40, $65, $50, $71, $41, $73, $51, $83, $51
      .db $94, $40, $95, $50, $a3, $50, $a5, $40, $a6, $50
      .db $b3, $51, $b6, $40, $b7, $50, $c3, $53, $df, $4a
      .db $4d, $c7, $00, $da, $0e, $01, $2e, $02, $36, $47
      .db $37, $52, $3a, $49, $47, $25, $a7, $52, $d7, $04
      .db $df, $4a, $4d, $c7, $00, $da, $0e, $01, $3e, $02
      .db $44, $51, $53, $44, $54, $44, $55, $24, $a1, $54
      .db $ae, $01, $b4, $21, $df, $4a, $e5, $07, $4d, $c7
      .db $fd
	  
L_UndergroundArea4:
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

L_UndergroundArea5: ;D-1 Room
      .db $48, $0f, $0e, $01, $5e, $05, $7a, $4f, $e9, $4f
      .db $d7, $87, $e8, $21, $ef, $4a, $fe, $0f, $8d, $c6
      .db $fd

L_UndergroundArea6: ;A-2
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

L_CastleArea1:
      .db $9b, $07, $05, $32, $06, $33, $07, $34, $ce, $03
      .db $dc, $51, $ee, $07, $73, $e0, $74, $0a, $7e, $06
      .db $9e, $0a, $ce, $06, $e4, $00, $e8, $0a, $fe, $0a
      .db $2e, $89, $4e, $0c, $14, $8a, $c4, $0a, $34, $8a
      .db $7e, $07, $c7, $0a, $01, $e0, $02, $0a, $47, $0a
      .db $81, $60, $82, $0a, $0e, $87, $7e, $09, $a3, $02
      .db $b3, $02, $c3, $02, $d3, $02, $e3, $02, $f3, $02
      .db $3e, $86, $7e, $00, $ae, $07, $fe, $0a, $0d, $c4
      .db $cd, $43, $ce, $09, $dd, $42, $de, $0b, $fe, $02
      .db $5d, $c7, $fd

L_CastleArea2:
      .db $5b, $07, $06, $33, $07, $34, $5e, $0a, $68, $64
      .db $98, $64, $a8, $64, $ce, $06, $fe, $02, $1e, $8e
      .db $48, $07, $7e, $0c, $be, $8e, $0d, $04, $ae, $02
      .db $cd, $48, $e8, $72, $fe, $02, $26, $f4, $69, $71
      .db $a9, $61, $c7, $31, $e5, $65, $ee, $07, $f5, $31
      .db $08, $bf, $55, $32, $85, $63, $95, $32, $e5, $31
      .db $05, $bf, $08, $3f, $05, $bf, $08, $3f, $0e, $83
      .db $1a, $46, $2e, $02, $48, $00, $7e, $06, $be, $02
      .db $de, $06, $fe, $0a, $0d, $c4, $cd, $43, $ce, $09
      .db $dd, $42, $de, $0b, $fe, $02, $5d, $c7, $fd

L_CastleArea3:
      .db $9b, $07, $05, $32, $06, $33, $07, $34, $fe, $01
      .db $27, $b1, $65, $32, $71, $00, $75, $0a, $b7, $31
      .db $08, $e4, $18, $64, $1e, $06, $57, $3b, $57, $0a
      .db $17, $8a, $27, $3a, $43, $04, $d7, $0a, $e7, $3a
      .db $97, $8a, $fe, $08, $24, $8a, $2e, $00, $38, $64
      .db $3e, $40, $6f, $00, $9f, $00, $be, $43, $c8, $0a
      .db $c9, $63, $ce, $07, $fe, $07, $2e, $83, $66, $42
      .db $6a, $42, $be, $00, $c8, $64, $f8, $64, $08, $e4
      .db $2e, $07, $7e, $03, $9e, $0d, $a1, $3a, $a2, $35
      .db $be, $03, $de, $07, $fe, $0a, $0d, $c4, $cd, $43
      .db $ce, $09, $dd, $42, $de, $0b, $fe, $02, $5d, $c7
      .db $fd

L_CastleArea4:
      .db $9b, $07, $05, $32, $06, $33, $07, $34, $fe, $04
      .db $0c, $d1, $2a, $32, $36, $01, $5c, $51, $7a, $32
      .db $86, $00, $ac, $51, $ca, $32, $d6, $01, $fc, $51
      .db $1a, $b1, $2e, $03, $a8, $21, $b4, $01, $c8, $07
      .db $de, $0a, $fe, $02, $4e, $83, $5a, $32, $63, $0a
      .db $69, $0a, $7e, $06, $ee, $03, $fa, $32, $03, $8a
      .db $09, $0a, $1e, $02, $ee, $09, $fa, $32, $01, $8a
      .db $08, $0a, $1e, $02, $7e, $0a, $9e, $07, $a7, $42
      .db $fe, $0a, $7e, $86, $8d, $4a, $be, $0a, $ee, $04
      .db $3e, $83, $43, $32, $5e, $08, $fe, $0a, $01, $d2
      .db $0d, $44, $11, $52, $cd, $43, $ce, $09, $dd, $42
      .db $de, $0b, $fe, $02, $5d, $c7, $fd

L_CastleArea5:
      .db $58, $87, $05, $33, $06, $33, $07, $34, $fe, $08
      .db $2e, $80, $7f, $06, $be, $07, $c2, $0a, $fe, $02
      .db $5e, $80, $9f, $06, $ef, $06, $1e, $82, $74, $3a
      .db $78, $3a, $5e, $8e, $7e, $82, $84, $62, $94, $61
      .db $a4, $31, $08, $e2, $18, $62, $3c, $02, $55, $34
      .db $75, $0a, $9c, $02, $fa, $10, $07, $e3, $17, $63
      .db $2c, $03, $67, $63, $77, $63, $8c, $03, $e6, $34
      .db $06, $8a, $31, $0a, $56, $34, $76, $0a, $bb, $0a
      .db $c6, $34, $c6, $0a, $36, $f4, $5c, $05, $b8, $72
      .db $ce, $06, $37, $8a, $45, $62, $5c, $01, $75, $62
      .db $8c, $01, $a5, $62, $ce, $07, $d5, $3e, $15, $8a
      .db $75, $0a, $ce, $06, $fe, $02, $2e, $86, $5e, $02
      .db $7e, $06, $96, $11, $f5, $11, $f7, $10, $fe, $02
      .db $1e, $86, $3e, $07, $5e, $06, $7e, $02, $9e, $0b
      .db $fe, $0a, $0d, $c4, $cd, $43, $ce, $09, $dd, $42
      .db $de, $0b, $fe, $02, $5d, $c7, $fd

L_CastleArea6:
      .db $5b, $06, $05, $32, $06, $33, $07, $34, $5e, $0a
      .db $ae, $02, $39, $f3, $da, $f2, $0d, $03, $39, $73
      .db $4d, $4b, $de, $08, $1e, $8a, $ae, $06, $b1, $35
      .db $16, $fe, $a7, $75, $fe, $03, $0d, $07, $39, $73
      .db $aa, $72, $ed, $4b, $45, $81, $49, $7b, $55, $00
      .db $e8, $74, $fe, $0a, $5e, $89, $84, $7a, $0d, $0b
      .db $fe, $02, $0d, $0c, $39, $73, $5e, $06, $c8, $74
      .db $48, $fc, $9d, $48, $be, $0a, $fe, $06, $3d, $cb
      .db $46, $7e, $ad, $4a, $fe, $82, $39, $f3, $ab, $79
      .db $2e, $8a, $9e, $07, $fe, $0a, $0d, $c4, $cd, $43
      .db $ce, $09, $dd, $42, $de, $0b, $fe, $02, $5d, $c7
      .db $fd

L_CastleArea7:
      .db $9b, $07, $05, $32, $06, $33, $07, $34, $5e, $0a
      .db $9e, $06, $a7, $43, $de, $0a, $3e, $82, $47, $63
      .db $67, $00, $87, $63, $0a, $e0, $0e, $04, $19, $61
      .db $37, $33, $47, $0a, $73, $0a, $97, $33, $b7, $0a
      .db $f3, $0a, $f7, $33, $48, $8a, $49, $61, $4e, $0a
      .db $88, $64, $d8, $64, $28, $e4, $5e, $02, $68, $62
      .db $ba, $42, $ea, $60, $f3, $0a, $f9, $61, $fe, $08
      .db $2e, $80, $3c, $0c, $5f, $06, $9f, $06, $df, $06
      .db $fe, $02, $07, $e3, $43, $0a, $48, $72, $53, $37
      .db $88, $72, $c8, $72, $d3, $0a, $fa, $42, $29, $e1
      .db $2e, $09, $ae, $07, $fe, $0a, $01, $a5, $02, $25
      .db $0d, $44, $cd, $43, $ce, $09, $dd, $42, $de, $0b
      .db $fe, $02, $5d, $c7, $fd

L_CastleArea8:
      .db $5b, $09, $05, $33, $06, $34, $fe, $0a, $08, $bc
      .db $d8, $61, $e9, $63, $fb, $61, $bb, $e1, $4b, $e1
      .db $db, $61, $0d, $04, $1e, $06, $e5, $01, $f5, $01
      .db $fe, $02, $0c, $d3, $49, $61, $77, $3f, $83, $3f
      .db $5d, $cb, $77, $3f, $83, $3f, $0d, $07, $13, $3f
      .db $77, $39, $4e, $8a, $88, $31, $d8, $31, $28, $b1
      .db $6e, $02, $97, $3f, $a3, $3f, $6d, $cb, $97, $39
      .db $a3, $38, $5e, $8a, $76, $31, $8b, $30, $bb, $30
      .db $c6, $31, $eb, $30, $16, $b1, $1b, $30, $4b, $30
      .db $66, $31, $7b, $30, $ab, $30, $b6, $31, $db, $30
      .db $fe, $07, $5e, $84, $9e, $07, $fe, $0a, $0d, $c4
      .db $41, $53, $51, $53, $cd, $43, $ce, $09, $dd, $42
      .db $de, $0b, $fe, $02, $5d, $c6, $fd

L_CastleArea9:
      .db $95, $31, $0f, $26, $fe, $31, $43, $c1, $63, $40
      .db $68, $04, $76, $64, $7e, $10, $85, $3f, $8c, $5f
      .db $7e, $91, $86, $66, $3a, $e0, $3e, $10, $4c, $57
      .db $66, $32, $73, $00, $be, $11, $c2, $43, $ca, $30
      .db $39, $8b, $5a, $30, $6c, $55, $ca, $30, $0a, $c1
      .db $1e, $33, $2e, $42, $47, $03, $d7, $84, $6e, $c5
      .db $ba, $41, $ba, $42, $09, $b9, $0a, $61, $0e, $11
      .db $1c, $57, $9a, $31, $a9, $63, $b9, $63, $c9, $63
      .db $da, $62, $eb, $61, $2a, $c2, $7f, $38, $0c, $d7
      .db $8d, $41, $df, $26, $fd

L_CastleArea10: ;A-4
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

L_CastleArea11: ;C-4
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

L_CastleArea12: ;B-4
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


L_CastleArea13: ;D-4
      .db $5b, $86, $05, $32, $06, $33, $07, $34, $7e, $0a
      .db $fe, $02, $39, $f3, $e8, $12, $0d, $03, $37, $7d
      .db $de, $08, $1e, $8a, $ae, $06, $16, $fe, $45, $12
      .db $5e, $3f, $fe, $02, $fe, $82, $39, $f3, $a8, $72
      .db $49, $fb, $e8, $72, $fe, $0a, $6e, $82, $b7, $7d
      .db $fe, $0f, $0d, $0b, $1e, $02, $fe, $02, $39, $f3
      .db $5e, $06, $c8, $7c, $48, $fc, $5e, $0a, $de, $06
      .db $e7, $10, $45, $ff, $7e, $0f, $fe, $82, $39, $f3
      .db $a9, $7b, $4e, $8a, $9e, $07, $fe, $0a, $0d, $c4
      .db $cd, $43, $ce, $09, $dd, $42, $de, $0b, $fe, $02
      .db $5d, $c7, $fd
	  