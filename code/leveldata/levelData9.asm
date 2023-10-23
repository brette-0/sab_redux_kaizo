LA1:
	.db $5f, $06
	include "code\leveldata\levels\a-1.asm"
	.db $fd


EA1:
 .db PageSkip, #1
 .db PageSkip, #2

 .db #0 * $10 + 10, #5 + $80
 .db #1 * $10 + 10, #66
 .db #2 * $10 + 10, #5
 .db #12 * $10 + 10, #39

 .db #5 * $10 + 10, #4 + $80
 .db #9 * $10 + 10, #6
 .db #11 * $10 + 10, #6
 .db PageSkip, #5

 .db #13 * $10 + 7, #3 + $80

 .db #1 * $10 + 5, #3 + $80
 .db #8 * $10 + 8, #3

 .db #5 * $10 + 9, #12 + $80

 .db #1 * $10 + 6, #27 + $80
 .db #1 * $10 + 9, #12
 .db #9 * $10 + 10, #3
 .db #11 * $10 + 12, #27
 .db #13 * $10 + 9, #12
 .db PageSkip, #10

 .db #5 * $10 + 9, #19 + $80
 .db #9 * $10 + 9, #45

 .db #12 * $10 + 13, #8 + $80
 .db #15 * $10 + 11, #7

 .db #6 * $10 + 8, #66 + $80
 .db #7 * $10 + 13, #29
 .db #11 * $10 + 10, #66

 .db #3 * $10 + 10, #66 + $80
 .db #4 * $10 + 13, #7
 .db #12 * $10 + 6, #66

 .db #0 * $10 + 10, #15 + $80
 .db #1 * $10 + 6, #66
 .db #9 * $10 + 12, #7
 .db #13 * $10 + 10, #66
 .db PageSkip, #16
    .db $ff
	
LA2:
	.db $50, $06
	include "code\leveldata\levels\a-2.asm"
	.db $fd


EA2:
 .db PageSkip, #1
 .db PageSkip, #2

 .db #2 * $10 + 7, #2 + $80
 .db #6 * $10 + 11, #42
 .db #13 * $10 + 7, #41

 .db #2 * $10 + 7, #41 + $80

 .db #11 * $10 + 9, #2 + $80
 .db #14 * $10 + 8, #19

 .db #1 * $10 + 8, #2 + $80
 .db PageSkip, #7
 .db PageSkip, #8
 .db PageSkip, #9
 .db PageSkip, #10
 .db PageSkip, #11
 .db PageSkip, #12
 .db PageSkip, #13
 .db PageSkip, #14
 .db PageSkip, #15
 .db PageSkip, #16
	.db $ff