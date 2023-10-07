save_Validate = $7fbf
save_Validate_value = $42
save_TopScore = $7f00


LoadBattery:
        jsr ReadJoypads

        ldx #$05
-
        lda save_TopScore,x
        sta TopScoreDisplay,x
        dex
        bpl -

rts
SaveBattery:
        ldx #$05
-
        lda TopScoreDisplay,x
        sta save_TopScore,x
        dex
        bpl -
rts
