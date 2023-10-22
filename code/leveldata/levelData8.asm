;level 9-3
E93:
 .db #4 * $10 + 11, #46, $03

 .db #12 * $10 + 8, #15 + $80

 .db #6 * $10 + 9, #15 + $80
 .db PageSkip, #4
 .db PageSkip, #5

 .db #11 * $10 + 11, #18 + $80

 .db #0 * $10 + 11, #18 + $80
 .db #5 * $10 + 11, #18
 .db PageSkip, #8
 .db PageSkip, #9

 .db #0 * $10 + 5, #2 + $80
 .db #8 * $10 + 6, #4
 .db #10 * $10 + 10, #2

 .db #3 * $10 + 11, #2 + $80
 .db #10 * $10 + 11, #2
 .db PageSkip, #12
 .db PageSkip, #13

 .db #13 * $10 + 7, #15 + $80

 .db #1 * $10 + 2, #48 + $80
 .db PageSkip, #16
	.db $ff

;level 9-3
L93:
	.db $5b, $06
	include "code\leveldata\levels\9-3.asm"
	.db $fd
	