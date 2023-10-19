; [e] used in enemy data
; [l] used in level data
TwoGoombas = #$37    ; [e] Two Goombas
ThreeGoombas = #$38    ; [e] Three Goombas
PageSkip = #$0f      ; [e] Use on first byte to skip a number of pages specified by the second byte.
PageFlag = #$80      ; [e,l] Add to second byte to skip to the next page
Objects1Flag = #$10  ; [l] Tree ledge to Vertical pipe.  Add to second byte
Objects2Flag = #$0c  ; [l] Hole to low ? blocks.  Add to first byte
Objects3Flag = #$0d  ; [l] Intro pipe to loop keeper.  Add to first byte.  use this for flagpole
Objects4Flag = #$0f  ; [l] Intro pipe to loop keeper.  Add to first byte
WarpFlag = #$08      ; [l] Add this to a pipe to make it a warp pipe


ONOFFS = #$8d


powerup = #$00
coin = #$01
hcoin = #$02
h1up = #$03
bpowerup = #$04
bvine = #$05
bstar = #$06
bcoins = #$07
b1up = #$08
custom = #$0b
hpowerup = #$0c
hstar = #$0d
star = #$0e
oneup = #$0f


;GAME LEVELS DATA
;.db "GAMELEVELSDATA"


;.db "ENEMYOBJECTDATA"
;level 1-4
E_CastleArea1:

 .db #10 * $10 + 5, #64, $07
 .db PageSkip, #2
 .db PageSkip, #3
 .db PageSkip, #4

 .db #11 * $10 + 5, #3 + $80

 .db #8 * $10 + 11, #9 + $80
 .db #11 * $10 + 11, #9

 .db #15 * $10 + 2, #12 + $80

 .db #3 * $10 + 2, #12 + $80
 .db #7 * $10 + 2, #12

 .db #0 * $10 + 6, #12 + $80
 .db #9 * $10 + 3, #12
 .db #13 * $10 + 6, #3

 .db #10 * $10 + 6, #3 + $80

 .db #7 * $10 + 7, #18 + $80
 .db #14 * $10 + 7, #12

 .db #9 * $10 + 8, #3 + $80
 .db #15 * $10 + 7, #3
 .db #15 * $10 + 10, #29

 .db #10 * $10 + 5, #12 + $80
 .db #14 * $10 + 7, #0

 .db #3 * $10 + 7, #0 + $80
 .db #8 * $10 + 5, #12

 .db #4 * $10 + 8, #45 + $80

 .db #1 * $10 + 11, #65 + $80
 .db #9 * $10 + 11, #53
      .db $ff




;level 9-2
E_CastleArea7:
      .db $ff




;level 1-1
E_GroundArea6:
;      .db $1e, $c2, $00, $6b, $06, $8b, $86, $63, $b7, $0f, $05
;      .db $03, $06, $23, $06, $4b, $b7, $bb, $00, $5b, $b7
;      .db $fb, $37, $3b, $b7, $0f, $0b, $1b, $37
;      .db $ff

;TwoGoombas = $37
;PageFlag = $80
;PageSkip = $0f

      ;.db $55, $16 + $80
      ;.db $55, $1b + $80 ; clockwise firebar
      ;.db $55, $1c + $80 ; fast clockwise firebar
      ;.db $55, $1d + $80 ; counterclockwise firebar
      ;.db $55, $1e + $80 ; fast counterclockwise firebar
      ;.db $55, $1f + $80 ; clockwise long firebar
;      .db $55, $20 + $80 ; glitchy firebar (counterclockwise long firebar)
;      .db $55, $21 + $80 ; glitchy firebar (clockwise fast long firebar)
;      .db $55, $22 + $80 ; glitchy firebar (counterclockwise fast long firebar)
;      .db $ff

      ;.db $00, $b5 ; Mushroom Retainer
	
      ;.db $8b, PageFlag+Spiny

      ;.db $1e, PageFlag+$42, $00
	  
	  
	  
	  
	  
	  ;.db $4a, HammerBro + PageFlag
	  ;.db $5a, HammerBro
	  ;.db $6a, HammerBro
	  ;.db $7a, HammerBro
	  ;.db $8a, HammerBro
	  ;.db $9a, HammerBro
 
	  .db $4a, Goomba + PageFlag
	  .db $5b, Sign, $01
	  ;.db $94, PowerUpObject, $00
	  .db $aa, Goomba
	  .db $8a, $3b + PageFlag
	  .db $97, Goomba
	  .db $aa, Goomba
	  
	  .db $4a, GreenKoopa + PageFlag
	  .db $8a, GreenKoopa
	  
	  .db $2a, Goomba + PageFlag
	  
	  .db $ba, ThreeGoombas + PageFlag
	  
	  .db $24, GreenParatroopaJump + PageFlag
	  .db $9a, RedKoopa
	  .db $ea, Goomba
	  
	  .db $a9, UDPiranhaPlant + PageFlag
	  .db $ca, GreenKoopa
	  .db $fa, RedKoopa
	  
	  
	  .db PageSkip, $09
	  
	  .db $22, $30 + PageFlag
	  
	  
	  .db $ff
	  
	  

;level 1-3
E_GroundArea7:

      .db $19, PiranhaPlant + PageFlag
	  .db $5a, GreenKoopa
	  .db $ca, Goomba
	  .db $da, Goomba
	  
	  .db $aa, Goomba + PageFlag
	  ;.db $aa, $14 ;fish
	  .db $ba, Goomba
	  .db $c6, GreenKoopa
	  
	  .db $7a, UDPiranhaPlant + PageFlag
	  .db $e6, RedParatroopa
	  
	  .db $99, PiranhaPlant + PageFlag
	  .db $ea, Goomba
	  .db $fa, Goomba
	  
	  .db $7a, UDPiranhaPlant + PageFlag
	  .db $d9, BuzzyBeetle
	  
	  .db PageSkip, $07
	  .db $0a, Goomba + PageFlag
	  .db $1a, Goomba
	  .db $2a, Goomba
	  .db $89, PiranhaPlant
	  
	  .db $15, RedKoopa + PageFlag
	  .db $a7, PiranhaPlant
	  
	  .db $0a, UDPiranhaPlant + PageFlag
	  .db $ba, GreenKoopa
	  .db $e9, PiranhaPlant
	  
	  .db $2a, Goomba + PageFlag
	  .db $3a, Goomba
	  .db $4a, Goomba
	  
	  .db $68, UDPiranhaPlant + PageFlag
	  .db $d6, HammerBro
	  
	  .db $2a, Goomba + PageFlag
	  .db $3a, Goomba
	  .db $81, $30
	  
      .db $ff


;level 2-1
E_GroundArea9:
      
.db #14 * $10 + 11, #64, $03

 .db #5 * $10 + 7, #34 + $80

 .db #10 * $10 + 9, #3 + $80
 .db #12 * $10 + 9, #64, $05

 .db #13 * $10 + 4, #3 + $80
 .db #13 * $10 + 10, #6
 .db #14 * $10 + 10, #6

 .db #4 * $10 + 10, #13 + $80
 .db #14 * $10 + 8, #3

 .db #1 * $10 + 7, #13 + $80
 .db #9 * $10 + 8, #18
 .db #12 * $10 + 8, #18
 .db PageSkip, #7

 .db #1 * $10 + 9, #0 + $80
 .db #10 * $10 + 7, #6
 .db #15 * $10 + 7, #6
 .db PageSkip, #9

 .db #1 * $10 + 8, #0 + $80
 .db #4 * $10 + 5, #0

 .db #0 * $10 + 11, #0 + $80
 .db #2 * $10 + 11, #0
 .db #4 * $10 + 8, #32

 .db #2 * $10 + 5, #3 + $80

 .db #3 * $10 + 10, #6 + $80
 .db #13 * $10 + 6, #3

 .db #5 * $10 + 2, #48 + $80
 .db PageSkip, #15
 .db PageSkip, #16
 .db $ff
;end of data terminator here is also used by pipe intro area
E_GroundArea10:
      .db $00, ScrollLockEnemy + PageFlag
	  .db $ff

;cloud level used in levels 2-1 and 5-2
E_GroundArea12:
      .db $ff





;warp zone area used in level 4-2
E_GroundArea16:
      .db $ff

;cloud level used in levels 3-1 and 6-2
E_GroundArea21:
      .db $ff

;level 1-2
E_UndergroundArea1:
	  .db $ee, $45, $08, $00
	  .db $19, Goomba + PageFlag
	  .db $28, Goomba
	  .db $5b, Sign, $02
	  .db $6a, Goomba
	  .db $79, UDPiranhaPlant
	  .db $c9, PiranhaPlant
	  
	  .db $9a, GreenKoopa + PageFlag
	  .db $a9, UDPiranhaPlant
	  .db $ba, BuzzyBeetle
	  
	  .db $39, RedPiranhaPlant + PageFlag
	  .db $9a, UDPiranhaPlant
	  .db $c5, RedPiranhaPlant
	  .db $ca, UDPiranhaPlant
	  
	  .db $39, RUDPiranhaPlant + PageFlag
	  .db $8a, GreenKoopa
	  .db $9a, GreenKoopa
	  .db $b9, PiranhaPlant
	  
	  .db $4a, HammerBro + PageFlag
	  .db $66, Goomba
	  .db $d9, RUDPiranhaPlant
	  
	  .db $ba, Goomba + PageFlag
	  .db $ca, Goomba
	  
	  .db $6a, Goomba + PageFlag
	  .db $aa, RUDPiranhaPlant
	  .db $fa, BuzzyBeetle
	  
	  .db $95, GreenParatroopaJump + PageFlag
	  .db $da, UDPiranhaPlant
	  
	  .db $99, BlackParatroopa + PageFlag
	  
	  .db $2a, FastGoomba + PageFlag
	  .db $fa, PiranhaPlant
	  
	  .db $4a, UDPiranhaPlant + PageFlag
	  .db $8a, GreenKoopa
	  .db $9a, GreenKoopa
	  
	  .db $33, ScrollLockEnemy + PageFlag
	  
      .db $ff

;level 9-2
E_UndergroundArea2:
      .db $ff



;water area used in levels 5-2 and 6-2
E_WaterArea1:
      .db $ff



;level 7-2
E_WaterArea3:
      .db $ff

;AREA OBJECT DATA
;.db "AREAOBJECTDATA"

;level 1-4
L_CastleArea1:
      .db $9b, $07
      include "code\leveldata\levels\1-4.asm"
	  
	  .db $fd




;level 9-2
L_CastleArea7:
      .db $00 + $02*$08 + $01*$40
      .db $01 + $02*$10 + $00*$40
      
      .db $fd





;level 1-1
;L_GroundArea6:
     
L_GroundArea6:
	  
	  .db $00 + $02*$08 + $01*$40                               ; header (first byte)
      .db $01 + $02*$10 + $00*$40
	 ; .db $24, $00, $01, $8C, $02, $00, $01, $8C, $01, $00, $01, $8C, $0A, $00, $01, $88, $02, $00, $01, $88, $01, $00, $01, $88, $0D, $00, $01, $88, $01, $00, $01, $88, $0D, $00, $01, $88, $01, $00, $01, $88, $0A, $00, $01, $88, $03, $00, $01, $88, $05, $00, $02, $C2, $0E, $00, $02, $C2, $0E, $00, $02, $C2, $0E, $00, $02, $C2, $0D, $00, $03, $C2, $20, $54, $A0, $00, $01, $C2, $0F, $00, $02, $54, $0E, $00, $02, $54, $AE, $00
	  
	  ;.db $00 + $02*$08 + $01*$40                               ; header (first byte)
      ;.db $01 + $02*$10 + $00*$40                               ; header (second byte)
	  ;.db Objects3Flag + $06 * $10, $40 + $01 + PageFlag        ; (6,) flagpole
      ; x=10, id=02, y=06
      ;.db Objects4Flag + $0a * $10, $02 * $10 + $06             ; (10,6) castle
	  ;.db $fd
	  
;L_GroundArea6a:
      ; Still needs work; have to see how castle terrain and water levels work.
      
      ; PageFlag = $80      ; Add to second byte to skip to the next page
      ; Objects1Flag = $10  ; Tree ledge to Vertical pipe.  Add to second byte
      ; Objects2Flag = $0c  ; Hole to low ? blocks.  Add to first byte
      ; Objects3Flag = $0d  ; Intro pipe to loop keeper.  Add to first byte.  use this for flagpole
      ; Objects4Flag = $0f  ; Intro pipe to loop keeper.  Add to first byte
      ; WarpFlag = $08      ; Add this to a pipe to make it a warp pipe

      ; ----------------------------------------------------------------------------------------------------
      ; Header (first byte): scenery/bg color + player entrance control * $08 + timer setting * $40
      
      ; Scenery/bg color (3 bits 00000xxx)
      ; 00 = green bushes
      ; 01 = water
      ; 02 = castle wall
      ; 03 = green bushes
      ; 04 = night sky, green bushes
      ; 05 = snow bushes, pipes
      ; 06 = night sky, snow bushes, pipes
      ; 07 = night sky, snow bushes, pipes, terrain, enemies
      
      ; Player entrance control (3 bits 00xxx000)
      ; 00 = drop in from top of screen on the left
      ; 01 = drop in from near top of screen on the left
      ; 02 = start standing to the left
      ; 03 = drop in from middle height on the left
      ; 04 = drop in from top of screen on the left
      ; 05 = drop in from top of screen on the left
      ; 06 = start to the left, auto walk to right
      ; 07 = start to the left, auto walk to right
      
      ; Timer setting (2 bits xx000000)
      ; 00 = 0
      ; 01 = 300
      ; 02 = 200
      ; 03 = 100
      ; ----------------------------------------------------------------------------------------------------
      
      ; ----------------------------------------------------------------------------------------------------
      ; Header (second byte): terrain control + background scenery type * $10 + background scenery * $40
      
      ; terrain control (4 bits xxxx0000)
      ; 00 = (no terrain)
      ; 01 = ground (1 block height)
      ; 02 = ground (1 block height) + ceiling (1 block height)
      ; 03 = ground (1 block height) + ceiling (3 block height)
      ; 04 = ground (1 block height) + ceiling (4 block height)
      ; 05 = ground (1 block height) + ceiling (8 block height)
      ; 06 = ground (5 block height) + ceiling (1 block height)
      ; 07 = ground (5 block height) + ceiling (3 block height)
      ; 08 = ground (5 block height) + ceiling (4 block height)
      ; 09 = ground (6 block height) + ceiling (1 block height)
      ; 0a = ceiling (1 block height)
      ; 0b = ground (6 block height) + ceiling (4 block height)
      ; 0c = ground (9 block height) + ceiling (1 block height)
      ; 0d = ground (2 block height) + ceiling (1 block height), middle section (y=03, 5 block height)
      ; 0e = ground (2 block height) + ceiling (1 block height), middle section (y=04, 5 block height)
      ; 0f = full of blocks (13 block height)
      
      ; background scenery type (2 bits 0000xx00)
      ; 00 = no scenery
      ; 01 = clouds
      ; 02 = hills, bushes, clouds
      ; 03 = fences
      
      ; background scenery (2 bits 000000xx)
      ; 00 = green pipes and bushes
      ; 01 = copper color pipes and bushes
      ; 02 = green pipes and bushes
      ; 03 = cloud type override
      ; ----------------------------------------------------------------------------------------------------
      
	  
	  ;.db $4a, custom, $71
	  ;.db $59, custom, $71
	  ;.db $5a, coin
	  ;.db $69, coin
	  include "code\leveldata\levels\1-1.asm"
	  
	  .db $fd

;level 1-2
L_UndergroundArea1:
      .db $48, $0f
	  include "code\leveldata\levels\1-2.asm"
	  
	  .db $fd

	 
	 
	 
	 
TestLevel:
;	  .db $17, $0c
;	  .db $37, $0d
;	  .db $57, $0e
;	  .db $77, $0f
;	  ;.db $07, $01 + PageFlag                                   ; (0,7) ? block with coin (+0x80 for page skip)
;	  ;.db $00, Objects1Flag + $05 * $10 + $02 - $01             ; (14,10) column of 3D blocks (1 high)
;	  ;.db $09, Objects1Flag + $05 * $10 + $02 - $01             ; (14,10) column of 3D blocks (1 high)
;	  .db Objects4Flag + $01 * $10, $06 * $10 + $06 - $01 + PageFlag, $00  ; (6,1) upside down pipe
;	  .db Objects4Flag + 1*$10, $07 * $10 + 4 - $01, (1-$01)*$10+ 9, $36 ;1,9,4,1,$36 ;x,y,w,h,mt
;	  ;customobj 3,2,3,1,$20 ;x,y,w,h,mt
;	  .db Objects4Flag + 3*$10, $07 * $10 + 3 - $01, (1-$01)*$10+ 2, $20
;	  .db $57, Objects1Flag + $06 * $10 + $02 - $01             ; (12,9) Vertical pipe (2 blocks height)
;	  ;customobj 5,9,2,2,$61
;	  .db Objects4Flag + 5*$10, $07 * $10 + 2 - $01, (2-$01)*$10+ 9, $61
;	  .db Objects4Flag + 7*$10, $07 * $10 + 5 - $01, (3-$01)*$10+ 8, $90
;	  ;customobj 7,8,5,3,$90 ;x,y,w,h,mt
;	  .db Objects4Flag + 7*$10, $07 * $10 + 3 - $01, (1-$01)*$10+ 9, $20
;	  ;customobj 7,9,3,1,$20 ;x,y,w,h,mt
;	  .db $c6, Objects1Flag + $06 * $10 + $05 - $01
;	  .db Objects4Flag + $d*$10, $07 * $10 + 1 - $01, (1-$01)*$10+ 2, $8d
;	  ;customobj $d,2,1,1,$8d ;x,y,w,h,mt
;	  
;	  
;	  ;.db Objects4Flag + $01 * $10, $07 * $10 + $09 - $01, $05	; (12,6) bridge
;      ;.db $47, Objects1Flag + $01 * $10 + $05 - $01             ; (4,7) row of 5 bricks
;      ;.db $57, $00                                              ; (5,7) ? block with power-up
;	  
;	  ;customobj 5,6,1,1,$71									;commented this until i fix those fucking slopes
;	  ;customobj 6,5,1,1,$71
;	  
;      ;.db $66, Objects1Flag + $02 * $10 + $01 - $01
;	  ;.db $75, Objects1Flag + $02 * $10 + $01 - $01
;	  
;	  ;.db $63, $01                                               ; (6,3) ? block with coin
;	  ;.db Objects4Flag + 7*$10, $07 * $10 + 1 - $01 +$80, (1-$01)*$10+ 6, $8c
;	  ;customobj 7,6,1,1,$8c ;x,y,w,h,mt
;	  ;customobj 7,6,1,1,$8c ;x,y,w,h,mt
;
;	  ;.db Objects4Flag + $07 * $10, $07 * $10 + $01 - $01, $06, $8c
;      ;.db $77, $01                                              ; (7,7) ? block with coin
;	  ;.db $d0, Objects1Flag + $05 * $10 + $02 - $01             ; (14,10) column of 3D blocks (1 high)
;	  .db Objects4Flag + $e*$10, $07 * $10 + 8 - $01, (1-$01)*$10+ $b, $8a
;	  ;customobj $e,$b,8,1,$8a ;x,y,w,h,mt
;	  .db Objects4Flag + $e*$10, $07 * $10 + 8 - $01, (1-$01)*$10+ 8, $8e
;	  ;customobj $e,8,8,1,$8e ;x,y,w,h,mt
;	  ;customobjp $5,11,1,2,$00 ;x,y,w,h,mt
;	  .db Objects4Flag + 6*$10, $07 * $10 + 1 - $01 + $80, (6-$01)*$10 + 2, $8f
;	  ;customobjp 6,2,1,6,$8f ;x,y,w,h,mt
;	  
;      .db $68, Objects1Flag + $06 * $10 + $03 - $01; + PageFlag  ; (6,8) Vertical pipe (3 blocks height)
;	  
;      .db $e7, Objects1Flag + $06 * $10 + $04 - $01             ; (14,7) Vertical pipe (4 blocks height)
;      .db $97, Objects1Flag + $06 * $10 + WarpFlag + $04 - $01 + PageFlag ; (9,7) Vertical warp pipe (4 blocks height)
;	  .db Objects4Flag + $b*$10, $07 * $10 + 1 - $01, (1-$01)*$10+ $a, $8c
;      .db $06, $03 + PageFlag                                   ; (0,6) invisible block with 1-up
;	  customobj 0,4,6,1,$72 ;x,y,w,h,mt
;	  ;customobj 0,10,1,1,$8c ;x,y,w,h,mt
;	  
;	  .db $60, Objects1Flag + $02 * $10 + $02 - $01				; (6,0) row of blocks
;	  .db Objects4Flag + $06 * $10, $06 * $10 + $08 - $01, $01  ; (6,1) upside down pipe
;	  ;.db $83, Objects1Flag + $02 * $10 + $03 - $01
;	  .db $90, Objects1Flag + $02 * $10 + $02 - $01				; (9,0) row of blocks
;	  .db Objects4Flag + $09 * $10, $05 * $10 + $06 - $01, $01  ; (9,1) upside down pipe (enterable)
;	  
;	  ;.db Objects4Flag + $0b * $10, $07 * $10 + $05 - $01, $27, $8b	; (11,7) custom object with customizable lenght and height
;	  customobj 11,3,5,1,$72  ;x,y,w,h,mt
;	  customobj 12,7,5,3,$8b ;x,y,w,h,mt
;      ; x = 5, id = 0, width = 2
;      .db Objects2Flag + $05 * $10, $00 * $10 + $02 - $01       ; (5,) pit (2 blocks wide)
;      ; x = 13, y=7, id = 1, width = 3
;      .db $d7, Objects1Flag + $01 * $10 + $03 - $01             ; (13,7) row of 3 bricks
;      .db $e7, $00                                              ; (14,7) ? block with power-up
;      .db $03, Objects1Flag + $01 * $10 + $08 - $01 + PageFlag  ; (0,3) row of 8 bricks
;      ; x = 6, id = 0, width = 3
;      .db Objects2Flag + $06 * $10, $00 * $10 + $03 - $01       ; (6,) pit (3 blocks wide)
;
;      .db $b3, Objects1Flag + $01 * $10 + $03 - $01             ; (11,3) row of 3 bricks
;      .db $e3, $01                                              ; (14,3) ? block with coin
;      .db $e7, $07                                              ; (14,7) brick with multi-coin
;      .db $47, Objects1Flag + $01 * $10 + $01 - $01 + PageFlag  ; (4,7) single brick
;      .db $57, $06                                              ; (5,7) brick with starman
;      .db $a7, $01                                              ; (10,7) ? block with coin
;      .db $d3, $00                                              ; (13,3) ? block with power-up
;      .db $d7, $01                                              ; (13,7) ? block with coin
;      .db $07, $01 + PageFlag                                   ; (0,7) ? block with coin
;      .db $67, Objects1Flag + $01 * $10 + $01 - $01             ; (6,7) single brick
;
;      .db $93, Objects1Flag + $01 * $10 + $03 - $01             ; (9,3) row of 3 bricks
;      .db $03, Objects1Flag + $01 * $10 + $04 - $01 + PageFlag  ; (0,3) row of 4 bricks
;      ; x=1, id = 6, width = 2
;      .db Objects2Flag + $01 * $10, $06 * $10 + $02 - $01       ; (0,3) high ?-block row (2 wide)
;      .db $17, Objects1Flag + $01 * $10 + $02 - $01             ; (1,7) row of 2 bricks
;      ; x=6, id=3, width = 4
;      .db Objects4Flag + $06 * $10, $03 * $10 + $04 - $01       ; (6,) 3D block stairs ascending (4 width)
;      
;      ; x=12, y=7, id=5, height = 4
;      .db $c7, Objects1Flag + $05 * $10 + $04 - $01             ; (12,7) column of 3D blocks (4 high)
;      .db $d8, Objects1Flag + $05 * $10 + $03 - $01             ; (13,8) column of 3D blocks (3 high)
;      .db $e9, Objects1Flag + $05 * $10 + $02 - $01             ; (14,9) column of 3D blocks (2 high)
;      .db $fa, Objects1Flag + $05 * $10 + $01 - $01             ; (15,10) column of 3D blocks (1 high)
;      .db Objects4Flag + $04 * $10, $03 * $10 + $03 + PageFlag  ; (6,) 3D block stairs ascending (4 width)
;      
;      .db $87, Objects1Flag + $05 * $10 + $04 - $01             ; (8,7) column of 3D blocks (4 high)
;      .db Objects2Flag + $09 * $10, $00 * $10 + $02 - $01       ; (9,) pit (2 blocks wide)
;      .db $b7, Objects1Flag + $05 * $10 + $04 - $01             ; (11,7) column of 3D blocks (4 high)
;      .db $c8, Objects1Flag + $05 * $10 + $03 - $01             ; (12,8) column of 3D blocks (3 high)
;      .db $d9, Objects1Flag + $05 * $10 + $02 - $01             ; (13,9) column of 3D blocks (2 high)
;
;      .db $ea, Objects1Flag + $05 * $10 + $01 - $01             ; (14,10) column of 3D blocks (1 high)
;      .db $39, Objects1Flag + $06 * $10 + $02 - $01 + PageFlag  ; (3,9) Vertical pipe (2 blocks height)
;      .db $87, Objects1Flag + $01 * $10 + $02 - $01             ; (8,7) row of 2 bricks
;      .db $a7, $01                                              ; (10,7) ? block with coin
;      .db $b7, Objects1Flag + $01 * $10 + $01 - $01             ; (11,7) single brick
;      
;      .db $39, Objects1Flag + $06 * $10 + $02 - $01 + PageFlag  ; (3,9) Vertical pipe (2 blocks height)
;      ; x=5, id=3, width = 9
;      .db Objects4Flag + $05 * $10, $03 * $10 + $09 - $01       ; (5,) 3D block stairs ascending (9 width)
;      ; x=6, ?=$40, id = 1 
;      .db Objects3Flag + $06 * $10, $40 + $01 + PageFlag        ; (6,) flagpole
;      ; x=10, id=02, y=06
;      .db Objects4Flag + $0a * $10, $02 * $10 + $06             ; (10,6) castle
;
;      .db $fd                                                   ; end of level data marker
	  
	  ;.db $50, $21, $98, $72, $c6, $00, $d7, $00, $e7, $14
      ;.db $e8, $00, $f6, $15, $f9, $00, $0a, $80, $18, $11
      ;.db $29, $00, $38, $00, $47, $00, $56, $00, $68, $f2
      ;.db $e7, $73, $97, $fb, $06, $83, $5c, $01, $d7, $22
      ;.db $e7, $00, $03, $a7, $6c, $02, $b3, $22, $e3, $01
      ;.db $e7, $07, $47, $a0, $57, $06, $a7, $01, $d3, $00
      ;.db $d7, $01, $07, $81, $67, $20, $93, $22, $03, $a3
      ;.db $17, $21, $1c, $61, $6f, $33, $c7, $63, $d8, $62
      ;.db $e9, $61, $fa, $60, $4f, $b3, $87, $63, $9c, $01
      ;.db $b7, $63, $c8, $62, $d9, $61, $ea, $60, $39, $f1
      ;.db $87, $21, $a7, $01, $b7, $20, $39, $f1, $5f, $38
      ;.db $6d, $c1, $af, $26, $fd
      

;level 1-3
L_GroundArea7:
      .db $50, $11
      
	  
      include "code\leveldata\levels\1-3.asm"
	  
      .db $fd



;level 2-1
L_GroundArea9:
      .db $52, $31
      include "code\leveldata\levels\2-1.asm"
	  
      .db $fd

;pipe intro area
L_GroundArea10:
      .db $38, $11
      include "code\leveldata\levels\entry.asm"
      .db $fd

;cloud level used in levels 2-1 and 5-2
L_GroundArea12:
      .db $00, $c1
      .db $4c, $00, $f4, $4f, $0d, $02, $02, $42, $43, $4f
      .db $52, $c2, $de, $00, $5a, $c2, $4d, $c7
      .db $fd



;warp zone area used in level 4-2
L_GroundArea16:
      .db $10, $51
      .db $fd







;cloud level used in levels 3-1 and 6-2
L_GroundArea21:
      .db $06, $c1
      .db $fd


	  
;level 4-2
L_UndergroundArea2:
      .db $48, $0f
      .db $fd

;water area used in levels 5-2 and 6-2
L_WaterArea1:
      .db $41, $01
      .db $fd


;level 7-2
L_WaterArea3:
      .db $49, $0f
      .db $fd
	  



E91:
E92:
E93:

	.db $ff


L91:
L92:
L93:

	.db $90, $51
	.db $fd


;-------------------------------------------------------------------------------------
