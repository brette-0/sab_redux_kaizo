;File: 'test.t.asm
;Map Type: Multi Page [width: 256,height: 13] 
;Exported: Using Tiled(Assembly 6502) plugin by Haseeb Mir

.org $8000

test.t_page0
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#00,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#00,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#00,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#144,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#145,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#145,#98,#98,#98

test.t_page1
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#00,#00,#00,#00,#00,#98,#00,#00,#00,#00,#00,#98,#98,#98
.db #98,#98,#00,#00,#00,#00,#00,#98,#00,#00,#00,#00,#00,#98,#98,#98
.db #98,#98,#00,#00,#00,#00,#00,#98,#00,#00,#00,#00,#00,#98,#98,#98
.db #98,#98,#144,#144,#144,#144,#144,#98,#144,#144,#144,#144,#144,#98,#98,#98
.db #98,#98,#145,#145,#145,#145,#145,#98,#145,#145,#145,#145,#145,#98,#98,#98
.db #98,#98,#145,#145,#145,#145,#145,#98,#145,#145,#145,#145,#145,#98,#98,#98

test.t_page2
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#193,#00,#00,#00,#00
.db #98,#98,#98,#98,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#00,#00,#00,#18,#19,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#144,#144,#144,#98,#98,#98,#98,#98,#98,#98,#00,#00
.db #98,#98,#98,#98,#145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#144,#144
.db #98,#98,#98,#98,#145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#145,#145

test.t_page3
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98
.db #144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#98
.db #145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#98

test.t_page4
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00
.db #00,#00,#00,#194,#194,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00
.db #00,#00,#192,#192,#192,#192,#00,#00,#00,#20,#21,#00,#00,#196,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#44,#45,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98

test.t_page5
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#20
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#20
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#44
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#00,#00,#00,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#00,#00,#00,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#144,#144,#144,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#145,#145,#145,#98,#98,#98,#98,#00,#00,#00,#98,#98,#98
.db #98,#98,#98,#145,#145,#145,#98,#98,#98,#98,#00,#00,#00,#98,#98,#98
.db #98,#98,#98,#145,#145,#145,#98,#98,#98,#98,#144,#144,#144,#98,#98,#98
.db #98,#98,#98,#145,#145,#145,#98,#98,#98,#98,#145,#145,#145,#98,#98,#98
.db #98,#98,#98,#145,#145,#145,#98,#98,#98,#98,#145,#145,#145,#98,#98,#98

test.t_page6
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #21,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #21,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #45,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#192,#192,#192,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#98,#98,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00
.db #144,#144,#144,#98,#98,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00
.db #145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#144,#144,#144,#144,#144,#144
.db #145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#145,#145,#145,#145,#145,#145

test.t_page7
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#18,#19,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#20,#21,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#20,#21,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98,#98,#98,#98,#144
.db #144,#144,#144,#144,#144,#144,#144,#144,#98,#98,#98,#98,#98,#98,#98,#145
.db #145,#145,#145,#145,#145,#145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#145

test.t_page8
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98,#00
.db #00,#00,#00,#98,#98,#98,#98,#98,#00,#196,#00,#98,#98,#98,#98,#00
.db #00,#00,#00,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00,#00,#00
.db #144,#144,#144,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00,#00,#00
.db #145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98

test.t_page9
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #196,#00,#98,#98,#98,#98,#98,#00,#00,#00,#00,#98,#98,#98,#00,#00
.db #00,#00,#98,#98,#98,#98,#98,#00,#00,#00,#00,#98,#98,#98,#00,#00
.db #00,#00,#98,#98,#98,#98,#98,#144,#144,#144,#144,#98,#98,#98,#00,#00
.db #00,#00,#98,#98,#98,#98,#98,#145,#145,#145,#145,#98,#98,#98,#144,#144
.db #98,#98,#98,#98,#98,#98,#98,#145,#145,#145,#145,#98,#98,#98,#145,#145
.db #98,#98,#98,#98,#98,#98,#98,#145,#145,#145,#145,#98,#98,#98,#145,#145

test.t_page10
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#18,#19,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#20,#21,#00,#00,#00,#44,#45,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98,#98
.db #00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98,#98
.db #00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98,#98
.db #144,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #145,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #145,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98

test.t_page11
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#98,#98,#00,#00,#00,#98,#98,#98,#98,#98,#00,#00,#193
.db #00,#00,#00,#98,#98,#00,#00,#00,#98,#98,#98,#98,#98,#00,#00,#00
.db #144,#144,#144,#98,#98,#144,#144,#144,#98,#98,#98,#98,#98,#00,#00,#00
.db #145,#145,#145,#98,#98,#145,#145,#145,#98,#98,#98,#98,#98,#00,#00,#00
.db #145,#145,#145,#98,#98,#145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#98
.db #145,#145,#145,#98,#98,#145,#145,#145,#98,#98,#98,#98,#98,#98,#98,#98

test.t_page12
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#20,#21,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #192,#192,#192,#00,#00,#44,#45,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#144,#144,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#145,#145,#98,#98,#98,#98

test.t_page13
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#98,#98,#00,#00,#00,#00,#98,#98,#00,#00,#00,#98,#98
.db #00,#00,#00,#98,#98,#00,#00,#00,#00,#98,#98,#00,#00,#00,#98,#98
.db #144,#144,#144,#98,#98,#144,#144,#144,#144,#98,#98,#144,#144,#144,#98,#98
.db #145,#145,#145,#98,#98,#145,#145,#145,#145,#98,#98,#145,#145,#145,#98,#98
.db #145,#145,#145,#98,#98,#145,#145,#145,#145,#98,#98,#145,#145,#145,#98,#98

test.t_page14
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#197,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98
.db #137,#137,#137,#137,#196,#137,#137,#137,#137,#137,#137,#137,#137,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#98,#98,#98
.db #144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#144,#98,#98,#98
.db #145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#145,#98,#98,#98

test.t_page15
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98
.db #98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98,#98

IF 1 = 0
 .db #12 * $10 + 4, #12
 .db PageSkip, #2

 .db #5 * $10 + 5, #12 + $80
 .db #7 * $10 + 9, #13

 .db #2 * $10 + 11, #43 + $80
 .db #6 * $10 + 6, #12
 .db #8 * $10 + 11, #44

 .db #9 * $10 + 9, #34 + $80
 .db #13 * $10 + 8, #27

 .db #4 * $10 + 3, #12 + $80
 .db #15 * $10 + 5, #33

 .db #1 * $10 + 7, #12 + $80
 .db #13 * $10 + 9, #44

 .db #2 * $10 + 9, #44 + $80
 .db #13 * $10 + 8, #13

 .db #9 * $10 + 9, #27 + $80

 .db #0 * $10 + 9, #29 + $80
 .db #15 * $10 + 5, #12

 .db #1 * $10 + 6, #13 + $80
 .db #6 * $10 + 8, #33
 .db PageSkip, #12

 .db #5 * $10 + 9, #34 + $80

 .db #1 * $10 + 6, #12 + $80
 .db #12 * $10 + 6, #12

 .db #4 * $10 + 10, #27 + $80
 .db #7 * $10 + 8, #45

 .db #1 * $10 + 11, #65 + $80
 .db #9 * $10 + 11, #53
ENDIF