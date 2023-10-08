             macro bricks x,y,w
             .db x*$10+y, Objects1Flag + $01 * $10 + w - $01             ; (x,y) row of w bricks
             endm
             
             macro blocks x,y,w
             .db x*$10+y, Objects1Flag + $02 * $10 + w - $01             ; (x,y) row of w blocks
             endm
             macro levelheader scenery_bgcolor, entrance, timer, terrain_control, background_scenery_type, background_scenery
; Header (first byte): scenery/bg color + player entrance control * $08 + timer setting * $40
; Header (second byte): terrain control + background scenery type * $10 + background scenery * $40
             .db scenery_bgcolor + entrance * $08 + timer * $40
             .db terrain_control + background_scenery_type * $10 + background_scenery * $40
             endm
             
             
             
             macro customobj x,y,w,h,mt
             .db Objects4Flag + x*$10, $07 * $10 + w - $01, (h-$01)*$10+ y, mt         ;(x,y) custom metatile (mt), lenght (w) and height (h)
             endm
             macro customobjp x,y,w,h,mt
             .db Objects4Flag + x*$10, $07 * $10 + w - $01 + $80, (h-$01)*$10 + y, mt;(x,y) custom metatile (mt), lenght (w) and height (h)
             endm
             macro uverticalpipe x,y,h
             .db Objects4Flag + x*$10, $06 * $10 + h - $01, y                          ;(x,y) upside down pipe (not enterable) (h blocks height)
             endm
             macro verticalpipe x,y,h
             .db x*$10 + y, Objects1Flag + $06 * $10 + h - $01                         ;(x,y) Vertical pipe (h blocks height)
             endm
             macro water x,y,w,h
             .db Objects4Flag + x*$10, $07 * $10 + w - $01, (h-$01)*$10+ y, $90         ;(x,y) custom metatile (mt), lenght (w) and height (h)
             endm
             
             macro add adrr    
             clc
             adc adrr ;apparently this sometimes refuses to work correctly lmao
             endm
             
             macro sub addr
             sec
             sbc addr
             endm
             
             macro asr
             cmp #$80
             ror
             endm
             
             macro hny
             and #$f0
             lsr
             lsr
             lsr
             lsr
             endm
             
             macro lny
             and #$0f
             asl
             asl
             asl
             asl
             endm
