    include code\sound.asm
	;include "D:\random\.disasembly w\smbdis mmc3\famitone\famitone2_asm6.asm"
	;include "D:\random\.disasembly w\smbdis mmc3\famitone\tools\music.asm"
	;include "D:\random\.disasembly w\smbdis mmc3\famitone\tools\sfx.asm"
	
;	----------------------------------------------------------------------------------------------------------------
;	ALL OF THIS CODE BELONGS TO STUDSX
;----------------------------------------------------------------------------------------------------------------
;CustomAudioInit 		EQU FamiToneInit
;	CustomAudioSfxInit 		EQU FamiToneSfxInit
;	CustomAudioSfxPlay 		EQU FamiToneSfxPlay
;	CustomAudioMusicPlay 	EQU FamiToneMusicPlay
;	CustomAudioMusicPause 	EQU FamiToneMusicPause
;	CustomAudioUpdate 		EQU FamiToneUpdate
;	SFX_CH0 EQU FT_SFX_CH0
;	SFX_CH1 EQU FT_SFX_CH1
;	SFX_CH2 EQU FT_SFX_CH2
;	SFX_CH3 EQU FT_SFX_CH3
;					;Enter music number here (Famitracker music number - 1)
;
;GroundMus        =	0
;WaterMus         =  1
;CaveMus          =  2
;CastleMus        =  3
;CloudMus         =  4
;PipeMus          =  5
;StarmanMus       =  6
;DeathMus         =  7
;GameOverMus      =  8
;PrincessMus      =  9
;CastleFinishMus  =  10
;LevelFinishMus   =  11
;HurryMus         =  12
;
;MusicLUT:
;		.db GroundMus, WaterMus, CaveMus, CastleMus, CloudMus, PipeMus, StarmanMus,	-1
;		.db DeathMus, GameOverMus, PrincessMus, CastleFinishMus, 0, LevelFinishMus, HurryMus, -1
;
;BRICK = 1		-1
;BREATH = 2		-1
;COIN = 3		-1
;GROWPU = 4		-1
;VINE = 5		-1
;BLAST = 6		-1
;TIMER = 7		-1
;GROW = 8		-1
;EXTRALIFE = 9	-1
;BOWS_FALL = 10	-1
;BJUMP = 11		-1
;BUMP = 12		-1
;STOMP = 13		-1
;SMACK = 14		-1
;INJURY = 15		-1
;FIREBALL = 16	-1
;FLAGPOLE = 17	-1
;SJUMP = 18		-1
;PAUSE_= 19		-1
;
;
;noise_sfx_table:
;			.db BRICK      , SFX_CH2
;			.db BREATH     , SFX_CH2
;			.db PAUSE_	   , SFX_CH3 ;put pause here cuz i can	   
;			
;sq2_sfx_table:	           
;			.db COIN       , SFX_CH1
;			.db GROWPU     , SFX_CH1
;			.db VINE       , SFX_CH1
;			.db BLAST      , SFX_CH1
;			.db TIMER      , SFX_CH1
;			.db GROW       , SFX_CH1
;			.db EXTRALIFE  , SFX_CH3
;			.db BOWS_FALL  , SFX_CH1
;
;sq1_sfx_table:             
;			.db BJUMP      , SFX_CH0
;			.db BUMP       , SFX_CH0
;			.db STOMP      , SFX_CH0
;			.db SMACK      , SFX_CH0
;			.db INJURY     , SFX_CH0
;			.db FIREBALL   , SFX_CH0
;			.db FLAGPOLE   , SFX_CH0
;			.db SJUMP      , SFX_CH0
;		
;CustomMusicEngine:
;		lda GamePauseStatus
;		bmi +
;		and #$01
;		ora SettingsBits
;		jsr FamiToneMusicPause
;+:
;		lda EventMusicQueue
;		ora AreaMusicQueue
;		beq NoTrigger
;		lda AreaMusicQueue
;		beq +
;		sta AreaMusicBuffer
;		ldx #-1
;		-
;		inx
;		lsr
;		bcc -
;		ldy #0
;		sty AreaMusicQueue
;		+
;		lda EventMusicQueue
;		beq +
;		sta EventMusicBuffer
;		ldx #7
;		-
;		inx
;		lsr
;		bcc -
;		ldy #0
;		sty EventMusicQueue
;		+
;		lda MusicLUT,x
;		pha
;		ldx #<music_music_data
;		ldy #>music_music_data
;		lda #1
;		sta songPlaying
;		jsr CustomAudioInit
;		ldx #<sounds
;		ldy #>sounds
;		jsr CustomAudioSfxInit
;		pla
;		jsr CustomAudioMusicPlay
;NoTrigger:
;		lda Square2SoundQueue
;		beq noSQ2
;		jsr countBITS_asl
;		lda sq2_sfx_table,y
;		ldx sq2_sfx_table+1,y
;		jsr CustomAudioSfxPlay
;		lda #0
;		sta Square2SoundQueue
;noSQ2:
;		lda Square1SoundQueue
;		beq noSQ1
;		jsr countBITS_asl
;		lda sq1_sfx_table,y
;		ldx sq1_sfx_table+1,y
;		jsr CustomAudioSfxPlay
;		lda #0
;		sta Square1SoundQueue
;noSQ1:
;		lda NoiseSoundQueue
;		beq noNOI
;		jsr countBITS_asl
;		lda noise_sfx_table,y
;		ldx noise_sfx_table+1,y
;		jsr CustomAudioSfxPlay
;		lda #0
;		sta NoiseSoundQueue
;noNOI:
;		jmp CustomAudioUpdate
;
;countBITS_asl:
;			ldx #$ff
;			sec
;			-
;			inx
;			ror
;			bcc -
;			txa
;			asl
;			tay
;			rts
;			
;CustomMusicLoopCallback:
;	lda #0
;	sta songPlaying
;	lda EventMusicBuffer
;	cmp #$40
;	bne +
;	lda #0
;	sta EventMusicBuffer
;	lda AreaMusicBuffer
;	sta AreaMusicQueue
;	+
;	rts
