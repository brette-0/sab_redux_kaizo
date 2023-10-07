; bank 00 -- first half of original SMB code
base $8000
.db $00                     ; bank identifier
include code\bank00.asm
pad $c000

; bank 01 -- custom code
base $8000
.db $01                     ; bank identifier
include code\bank01.asm
pad $c000

; bank 02 -- relocated original sound code
base $8000
.db $02                     ; bank identifier
include code\bank02.asm
pad $c000

; bank 03 -- self-contained core routines
base $8000
.db $03                     ; bank identifier
include code\bank03.asm
pad $c000

; bank 04 -- level decode routines
base $8000
.db $04                     ; bank identifier
include code\bank04.asm
pad $c000

; bank 05 -- level banks

                     ; bank identifier
include code\bank05.asm


base $c000
; fixed bank -- second half of original SMB code
org $c000
