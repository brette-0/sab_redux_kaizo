LA1:
	.db $5f, $06
	include "code\leveldata\levels\a-1.asm"
	.db $fd


EA1:
 .db #9 * $10 + 8, #64, $0A
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
 .db #8 * $10 + 9, #45

 .db #12 * $10 + 13, #8 + $80
 .db #15 * $10 + 11, #7

 .db #7 * $10 + 13, #29 + $80

 .db #4 * $10 + 13, #7 + $80

 .db #0 * $10 + 10, #15 + $80
 .db #9 * $10 + 12, #7
 .db PageSkip, #16
	
LA2:
	.db $50, $06
	include "code\leveldata\levels\a-2.asm"
	.db $fd


EA2:
 .db #13 * $10 + 7, #64, $0B
 .db PageSkip, #2

 .db #2 * $10 + 7, #2 + $80
 .db #6 * $10 + 11, #42
 .db #13 * $10 + 7, #41

 .db #2 * $10 + 7, #41 + $80

 .db #11 * $10 + 9, #2 + $80
 .db #14 * $10 + 8, #19

 .db #1 * $10 + 8, #2 + $80

 .db #2 * $10 + 9, #27 + $80
 .db #6 * $10 + 11, #27
 .db #10 * $10 + 9, #29

 .db #6 * $10 + 9, #14 + $80
 .db #13 * $10 + 6, #4

 .db #7 * $10 + 9, #19 + $80
 .db #15 * $10 + 5, #4
 .db PageSkip, #10

 .db #0 * $10 + 2, #21 + $80
 .db #5 * $10 + 8, #27
 .db #12 * $10 + 6, #27

 .db #1 * $10 + 6, #30 + $80
 .db #9 * $10 + 5, #27

 .db #3 * $10 + 6, #5 + $80
 .db #6 * $10 + 6, #5
 .db #14 * $10 + 3, #24

 .db #0 * $10 + 6, #19 + $80
 .db #7 * $10 + 9, #0
 .db #10 * $10 + 7, #45
 .db #11 * $10 + 9, #0

 .db #2 * $10 + 7, #64 + $80, $0C
 .db #7 * $10 + 4, #64, $0D
 .db #15 * $10 + 4, #64, $0E

 .db #5 * $10 + 4, #64 + $80, $0F
 .db $ff

LA3:
	.db $5f, $06
	include "code\leveldata\levels\a-3.asm"
	.db $fd

EA3:
 .db #3 * $10 + 9, #64, $10

 .db #8 * $10 + 13, #28 + $80
 .db #11 * $10 + 8, #12
 .db #13 * $10 + 6, #28
 .db #15 * $10 + 8, #12

 .db #2 * $10 + 13, #28 + $80
 .db #8 * $10 + 13, #8

 .db #11 * $10 + 4, #12 + $80
 .db #13 * $10 + 4, #31
 .db #15 * $10 + 4, #12

 .db #8 * $10 + 6, #12 + $80
 .db #8 * $10 + 10, #18
 .db #10 * $10 + 2, #19

 .db #1 * $10 + 7, #27 + $80
 .db #2 * $10 + 13, #21
 .db #8 * $10 + 9, #27

 .db #0 * $10 + 7, #27 + $80
 .db #4 * $10 + 8, #27

 .db #3 * $10 + 13, #24 + $80
 .db #7 * $10 + 7, #19
 .db #13 * $10 + 7, #19

 .db #2 * $10 + 7, #45 + $80

 .db #6 * $10 + 13, #20 + $80
 .db #14 * $10 + 5, #31

 .db #10 * $10 + 5, #31 + $80
 .db PageSkip, #12

 .db #4 * $10 + 7, #66 + $80
 .db #8 * $10 + 6, #66
 .db #8 * $10 + 7, #29
 .db #11 * $10 + 9, #66
 .db #15 * $10 + 8, #66
 .db #15 * $10 + 9, #31

 .db #1 * $10 + 4, #66 + $80
 .db #5 * $10 + 7, #66
 .db #5 * $10 + 8, #29
 .db PageSkip, #15
 .db PageSkip, #16
 .db $ff

LA4:
	.db $5b, $06
	include "code\leveldata\levels\a-4.asm"
	.db $fd

EA4:
	 .db #4 * $10 + 7, #64, $00

 .db #7 * $10 + 6, #19 + $80
 .db #7 * $10 + 10, #8
 .db #9 * $10 + 6, #2
 .db #11 * $10 + 6, #19
 .db PageSkip, #3
 .db PageSkip, #4
 .db PageSkip, #5
 .db PageSkip, #6
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