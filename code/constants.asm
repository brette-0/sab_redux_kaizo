PPU_CTRL_REG1         = $2000
PPU_CTRL_REG2         = $2001
PPU_STATUS            = $2002
PPU_SPR_ADDR          = $2003
PPU_SPR_DATA          = $2004
PPU_SCROLL_REG        = $2005
PPU_ADDRESS           = $2006
PPU_DATA              = $2007

SND_REGISTER          = $4000
SND_SQUARE1_REG       = $4000
SND_SQUARE2_REG       = $4004
SND_TRIANGLE_REG      = $4008
SND_NOISE_REG         = $400c
SND_DELTA_REG         = $4010
SND_MASTERCTRL_REG    = $4015

SPR_DMA               = $4014
JOYPAD_PORT           = $4016
JOYPAD_PORT1          = $4016
JOYPAD_PORT2          = $4017


VerticalFlipFlag      = $0109
FlagpoleFNum_Y_Pos    = $010d
FlagpoleFNum_YMFDummy = $010e
FlagpoleScore         = $010f
FloateyNum_Control    = $0110
FloateyNum_X_Pos      = $0117
FloateyNum_Y_Pos      = $011e
ShellChainCounter     = $0125
FloateyNum_Timer      = $012c
DigitModifier         = $0134

Sprite_Data           = $0200
Sprite_Y_Position     = $0200
Sprite_Tilenumber     = $0201
Sprite_Attributes     = $0202
Sprite_X_Position     = $0203

VRAM_Buffer1_Offset   = $6400
VRAM_Buffer1          = $6401

VRAM_Buffer2_Offset   = $64e0
VRAM_Buffer2          = $64e1

BowserBodyControls    = $0563
BowserFeetCounter     = $0564
BowserMovementSpeed   = $0565
BowserOrigXPos        = $0566
BowserFlameTimerCtrl  = $0567
BowserFront_Offset    = $0568
BridgeCollapseOffset  = $0569
BowserGfxFlag         = $056a

FirebarSpinSpeed      = $0388

VineFlagOffset        = $0398
VineHeight            = $0399
VineObjOffset         = $039a

VineStart_Y_Position  = $039d

BalPlatformAlignment  = $03a0
Platform_X_Scroll     = $03a1
PlatformCollisionFlag = $03a2
HammerThrowingTimer   = $03a2

SprObject_Rel_XPos    = $03ad
Player_Rel_XPos       = $03ad
Enemy_Rel_XPos        = $03ae
Fireball_Rel_XPos     = $03af
Bubble_Rel_XPos       = $03b0
Block_Rel_XPos        = $03b1
Misc_Rel_XPos         = $03b3
SprObject_Rel_YPos    = $03b8
Player_Rel_YPos       = $03b8
Enemy_Rel_YPos        = $03b9
Fireball_Rel_YPos     = $03ba
Bubble_Rel_YPos       = $03bb
Block_Rel_YPos        = $03bc
Misc_Rel_YPos         = $03be
SprObject_SprAttrib   = $03c4
Player_SprAttrib      = $03c4
Enemy_SprAttrib       = $03c5


SprObject_OffscrBits  = $03d0
Player_OffscreenBits  = $03d0
Enemy_OffscreenBits   = $03d1
FBall_OffscreenBits   = $03d2
Bubble_OffscreenBits  = $03d3
Block_OffscreenBits   = $03d4

Misc_OffscreenBits    = $03d6
EnemyOffscrBitsMasked = $03d8

Block_Orig_YPos       = $03e4
Block_BBuf_Low        = $03e6
Block_Metatile        = $03e8
Block_PageLoc2        = $03ea
Block_RepFlag         = $03ec
SprDataOffset_Ctrl    = $03ee
Block_ResidualCounter = $03f0
Block_Orig_XPos       = $03f1

AttributeBuffer       = $03f9

SprObject_X_MoveForce = $0400
YPlatformTopYPos      = $0401
Enemy_X_MoveForce     = $0401
RedPTroopaOrigXPos    = $0401

SprObject_YMF_Dummy   = $0416
Player_YMF_Dummy      = $0416
Enemy_YMF_Dummy       = $0417
BowserFlamePRandomOfs = $0417
PiranhaPlantUpYPos    = $0417
Bubble_YMF_Dummy      = $042c

SprObject_Y_MoveForce = $0433
Player_Y_MoveForce    = $0433
Enemy_Y_MoveForce     = $0434
PiranhaPlantDownYPos  = $0434
CheepCheepOrigYPos    = $0434
Block_Y_MoveForce     = $043c

MaximumLeftSpeed      = $0450
MaximumRightSpeed     = $0456

Cannon_Offset         = $046a
Whirlpool_Offset      = $046a
Cannon_PageLoc        = $046b
Whirlpool_PageLoc     = $046b
Cannon_X_Position     = $0471
Whirlpool_LeftExtent  = $0471
Cannon_Y_Position     = $0477
Whirlpool_Length      = $0477
Cannon_Timer          = $047d
Whirlpool_Flag        = $047d

BowserHitPoints       = $0483
StompChainCounter     = $0484

Player_CollisionBits  = $0490
Enemy_CollisionBits   = $0491

SprObj_BoundBoxCtrl   = $0499
Player_BoundBoxCtrl   = $0499
Enemy_BoundBoxCtrl    = $049a
Fireball_BoundBoxCtrl = $04a0
Misc_BoundBoxCtrl     = $04a2

BoundingBox_UL_XPos   = $04ac
BoundingBox_UL_YPos   = $04ad
BoundingBox_DR_XPos   = $04ae
BoundingBox_DR_YPos   = $04af
BoundingBox_UL_Corner = $04ac
BoundingBox_LR_Corner = $04ae
EnemyBoundingBoxCoord = $04b0

Block_Buffer_1        = $6600
Block_Buffer_2        = $6700

BlockBufferColumnPos  = $06a0
MetatileBuffer        = $06a1

HammerEnemyOffset     = $06ae

JumpCoinMiscOffset    = $06b7

BrickCoinTimerFlag    = $06bc

Misc_Collision_Flag   = $06be

EnemyFrenzyBuffer     = $06cb
SecondaryHardMode     = $06cc
EnemyFrenzyQueue      = $06cd
FireballCounter       = $06ce
DuplicateObj_Offset   = $06cf

LakituReappearTimer   = $06d1

NumberofGroupEnemies  = $06d3
ColorRotateOffset     = $06d4
PlayerGfxOffset       = $06d5
WarpZoneControl       = $06d6
FireworksCounter      = $06d7

MultiLoopCorrectCntr  = $06d9
MultiLoopPassCntr     = $06da
JumpspringForce       = $06db
MaxRangeFromOrigin    = $06dc
BitMFilter            = $06dd
ChangeAreaTimer       = $06de

SprShuffleAmtOffset   = $06e0
SprShuffleAmt         = $06e1
SprDataOffset         = $06e4
Player_SprDataOffset  = $06e4
Enemy_SprDataOffset   = $06e5
Block_SprDataOffset   = $06ec
Alt_SprDataOffset     = $06ec
Bubble_SprDataOffset  = $06ee
FBall_SprDataOffset   = $06f1
Misc_SprDataOffset    = $06f3

SavedJoypadBits       = $06fc
SavedJoypad1Bits      = $06fc
SavedJoypad2Bits      = $06fd

Player_X_Scroll       = $06ff
Player_XSpeedAbsolute = $0700
FrictionAdderHigh     = $0701
FrictionAdderLow      = $0702
RunningSpeed          = $0703
SwimmingFlag          = $0704
Player_X_MoveForce    = $0705
DiffToHaltJump        = $0706
JumpOrigin_Y_HighPos  = $0707
JumpOrigin_Y_Position = $0708
VerticalForce         = $0709
VerticalForceDown     = $070a
PlayerChangeSizeFlag  = $070b
PlayerAnimTimerSet    = $070c
PlayerAnimCtrl        = $070d
JumpspringAnimCtrl    = $070e
FlagpoleCollisionYPos = $070f
PlayerEntranceCtrl    = $0710
FireballThrowingTimer = $0711
DeathMusicLoaded      = $0712
FlagpoleSoundQueue    = $0713
CrouchingFlag         = $0714
GameTimerSetting      = $0715
DisableCollisionDet   = $0716
DemoAction            = $0717
DemoActionTimer       = $0718
PrimaryMsgCounter     = $0719
ScreenEdge_PageLoc    = $071a
ScreenLeft_PageLoc    = $071a
ScreenRight_PageLoc   = $071b
ScreenLeft_X_Pos      = $071c
ScreenEdge_X_Pos      = $071c
ScreenRight_X_Pos     = $071d
ColumnSets            = $071e
AreaParserTaskNum     = $071f
CurrentNTAddr_High    = $0720
CurrentNTAddr_Low     = $0721
IRQDisable               = $0722
ScrollLock            = $0723

CurrentPageLoc        = $0725
CurrentColumnPos      = $0726
TerrainControl        = $0727
BackloadingFlag       = $0728
BehindAreaParserFlag  = $0729
AreaObjectPageLoc     = $072a
AreaObjectPageSel     = $072b
AreaDataOffset        = $072c

AreaStyle             = $0733
StaircaseControl      = $0734
AreaObjectHeight      = $0735

EnemyDataOffset       = $0739
EnemyObjectPageLoc    = $073a
EnemyObjectPageSel    = $073b
ScreenRoutineTask     = $073c
ScrollThirtyTwo       = $073d

HorizontalScroll      = $073f
VerticalScroll        = $0740
ForegroundScenery     = $0741
BackgroundScenery     = $0742
CloudTypeOverride     = $0743
BackgroundColorCtrl   = $0744
LoopCommand           = $0745
StarFlagTaskControl   = $0746
TimerControl          = $0747
CoinTallyFor1Ups      = $0748
SecondaryMsgCounter   = $0749
JoypadBitMask         = $074a

AreaType              = $074e
AreaAddrsLOffset      = $074f
AreaPointer           = $0750
EntrancePage          = $0751
AltEntranceControl    = $0752
CurrentPlayer         = $0753
PlayerSize            = $0754
Player_Pos_ForScroll  = $0755
PlayerStatus          = $0756
FetchNewGameTimerFlag = $0757
JoypadOverride        = $0758
GameTimerExpiredFlag  = $0759
OnscreenPlayerInfo    = $075a
NumberofLives         = $075a ;used by current player
HalfwayPage           = $075b
LevelNumber           = $075c ;the actual dash number
Hidden1UpFlag         = $075d
CoinTally             = $075e
WorldNumber           = $075f
AreaNumber            = $0760 ;internal number used to find areas

Player_OldCollisionBits = $0765
OffScr_WorldNumber    = $0766
OffScr_AreaNumber     = $0767
ScrollFractional      = $0768
DisableIntermediate   = $0769
PrimaryHardMode       = $076a
WorldSelectNumber     = $076b
OperMode              = $0770

OperMode_Task         = $0772
VRAM_Buffer_AddrCtrl  = $0773
DisableScreenFlag     = $0774
ScrollAmount          = $0775
GamePauseStatus       = $0776
GamePauseTimer        = $0777
Mirror_PPU_CTRL_REG1  = $0778
Mirror_PPU_CTRL_REG2  = $0779
NumberOfPlayers       = $077a
NameTableSelect       = $077b
IRQAckFlag            = $077c

IntervalTimerControl  = $077f
Timers                = $0780
SelectTimer           = $0780
PlayerAnimTimer       = $0781
JumpSwimTimer         = $0782
RunningTimer          = $0783
BlockBounceTimer      = $0784
SideCollisionTimer    = $0785
JumpspringTimer       = $0786
GameTimerCtrlTimer    = $0787
ClimbSideTimer        = $0789
EnemyFrameTimer       = $078a
FrenzyEnemyTimer      = $0792
BowserFireBreathTimer = $0790
StompTimer            = $0791
AirBubbleTimer        = $0792

ScrollIntervalTimer   = $0795
EnemyIntervalTimer    = $0796
UnusedTimer              = $079d
InjuryTimer           = $079e
StarInvincibleTimer   = $079f
ScreenTimer           = $07a0
WorldEndTimer         = $07a1
DemoTimer             = $07a2

PseudoRandomBitReg    = $07a7

SoundMemory           = $07b0
MusicOffset_Noise     = $07b0
EventMusicBuffer      = $07b1
PauseSoundBuffer      = $07b2
Squ2_NoteLenBuffer    = $07b3
Squ2_NoteLenCounter   = $07b4
Squ2_EnvelopeDataCtrl = $07b5
Squ1_NoteLenCounter   = $07b6
Squ1_EnvelopeDataCtrl = $07b7
Tri_NoteLenBuffer     = $07b8
Tri_NoteLenCounter    = $07b9
Noise_BeatLenCounter  = $07ba
Squ1_SfxLenCounter    = $07bb

Squ2_SfxLenCounter    = $07bd
Sfx_SecondaryCounter  = $07be
Noise_SfxLenCounter   = $07bf
DAC_Counter           = $07c0
NoiseDataLoopbackOfs  = $07c1

NoteLengthTblAdder    = $07c4
AreaMusicBuffer_Alt   = $07c5
PauseModeFlag         = $07c6
GroundMusicHeaderOfs  = $07c7

AltRegContentFlag     = $07ca

WarmBootOffset        = <$07d6
DisplayDigits         = $07d7
TopScoreDisplay       = $07d7

ScoreAndCoinDisplay   = $07dd
PlayerScoreDisplay    = $07dd
PlayerCoinDisplay      = $07eb

GameTimerDisplay      = $07f8
ColdBootOffset        = <$07fe
WarmBootValidation    = $07ff
ClearRemainings          = $0600
TextBoxYScroll1          = $0601
OldTextboxID          = $0602
wea32                  = $0603
clearVRAM              = $0604

Sfx_SmallJump         = %10000000
Sfx_Flagpole          = %01000000
Sfx_Fireball          = %00100000
Sfx_PipeDown_Injury   = %00010000
Sfx_EnemySmack        = %00001000
Sfx_EnemySmackOr      = %00011000
Sfx_EnemyStomp        = %00000100
Sfx_PSwitchOut          = %00001100
Sfx_Bump              = %00000010
Sfx_BigJump           = %00000001

Sfx_BowserFall        = %10000000
Sfx_ExtraLife         = %01000000
Sfx_PowerUpGrab       = %00100000
Sfx_TimerTick         = %00010000
Sfx_Blast             = %00001000
Sfx_GrowVine          = %00000100
Sfx_GrowPowerUp       = %00000010
Sfx_CoinGrab          = %00000001

Sfx_BowserFlame       = %00000010
Sfx_BrickShatter      = %00000001

Silence               = %10000000

StarPowerMusic        = %01000000
PipeIntroMusic        = %00100000
CloudMusic            = %00010000
CastleMusic           = %00001000
UndergroundMusic      = %00000100
WaterMusic            = %00000010
GroundMusic           = %00000001
PSwitchMusic          = $5f

TimeRunningOutMusic   = %01000000
EndOfLevelMusic       = %00100000
AltGameOverMusic      = %00010000
EndOfCastleMusic      = %00001000
VictoryMusic          = %00000100
GameOverMusic         = %00000010
DeathMusic            = %00000001

Koopa                   = $00
GreenKoopa            = $00
DemotedRPTroopa          = $01
BuzzyBeetle           = $02
RedKoopa              = $03
KoopaShell              = $04
HammerBro             = $05
Goomba                = $06
Bloober               = $07
BulletBill_FrenzyVar  = $08
FastGoomba              = $09
GreyCheepCheep        = $0a
RedCheepCheep         = $0b
Podoboo               = $0c
PiranhaPlant          = $0d
GreenParatroopaJump   = $0e
RedParatroopa         = $0f
GreenParatroopaFly    = $10
Lakitu                = $11
Spiny                 = $12
BlackParatroopa          = $13
FlyCheepCheepFrenzy   = $14
FlyingCheepCheep      = $14
BowserFlame           = $15
Fireworks             = $16
BBill_CCheep_Frenzy   = $17
Stop_Frenzy           = $18
RedKoopaShell          = $19
Bowser                = $2d
PowerUpObject         = $2e
VineObject            = $2f
FlagpoleFlagObject    = $30
StarFlagObject        = $31
JumpspringObject      = $32
BulletBill_CannonVar  = $33
RetainerObject        = $35
UDPiranhaPlant          = $21
RUDPiranhaPlant          = $22
RedPiranhaPlant          = $20

Sign                  = $40
ScrollLockEnemy          = $41
BBillSpawner          = $42
PltRem                  = $43

LastEnemyID              = $43




World1 = 0
World2 = 1
World3 = 2
World4 = 3
World5 = 4
World6 = 5
World7 = 6
World8 = 7
World9 = 8
Level1 = 0
Level2 = 1
Level3 = 2
Level4 = 3


SwimTileRepOffset     = PlayerGraphicsTable + $9e
MusicHeaderOffsetData = MusicHeaderData - 1
MHD                   = MusicHeaderData

A_Button              = %10000000
B_Button              = %01000000
Select_Button         = %00100000
Start_Button          = %00010000
Up_Dir                = %00001000
Down_Dir              = %00000100
Left_Dir              = %00000010
Right_Dir             = %00000001

GrabState = $04

TitleScreenModeValue  = 0
GameModeValue         = 1
VictoryModeValue      = 2
GameOverModeValue     = 3


ChangeBankR             = $6000
ChangeBankRDelay        = $6001
SuppressJumpNoise       = $6002
UnlockWorld9            = $6003
GrabFlag                = $6004
temp5                   = $6005
HurryUp                 = $6006
UnknownHurryUp          = $6007    ;i forgor why i made this?
GrabID                  = $6008
                       
AreaObjOffsetBuffer     = $0500
AreaObjectLength        = $0510
MushroomLedgeHalfLen    = $0520
                       
GrabDown                = $601d
eastereggflag           = $601e
StarChainCounter        = $601f
                       
debug                   = $6020
FlipGFX                 = $6021
FlipTimer               = $6022
dontinc                 = $6023
RemoveChain             = $6024
EnemyDefeatPitch        = $6025
DoNotChangeSize         = $6026
                       
PFlag                   = $6027
PTimer                  = $6028
                       
WaterReplace            = $6029
                       
temp6                   = $602a
temp7                   = $602b
temp8                   = $602c
                       
peo                     = $602d
                       
FballCooldown           = $602e
OldStatus               = $6030
ExplosionTimerCounter   = $6031
BlockUsed               = $6032
temp9                   = $6034
BowserKilled            = $6035
ParallaxOffset          = $6036
World9Debug             = $6037 ;i dont now why i have this
StartTimer              = $6038
                       
Flag1kCoins             = $6039
                       
ExtendedLength          = $0530
ExtendedMetatile        = $0540
ExtendedHeight          = $0550
                       
WaitForReset            = $6050
tempA                   = $6051
HardModeFlag            = $6052
OnOffBits               = $6053
OnOffFlag               = $6054
DebugSwim               = $6065
tempB                   = $6056
tempC                   = $6057
tempD                   = $6058
LakituRespawning        = $6059
WaterCooldown           = $605a
Tortilla                = $605b
lag                     = $605c
LagFrameYes             = $605d
OldSwim                 = $605e
bocata                  = $605f
bocata2                 = $6060
bocata3                 = $6061
FrameCaunter            = $6062
PlayerFoot              = $6065
OnSlope                 = $606b
TwoFoot                 = $6071
OneSecTimer             = $6077
GrabUp                  = $6078
CrouchingFlag2          = $6079
Webito                  = $607a
EntranceCoolDown        = $607b
DontDecPT               = $607c
sleeping                = $607d
EvenFrame               = $607e
DetectedFoot            = $607f
OldDetectedFoot         = $6080
TimerWa                 = $6081
currentBank             = $6082
                       
                       
ContinueWriting         = $6084
CurrentText             = $6085
OldWriting              = $6086
test                    = $6087
dontchecklag            = $6088
dou                     = $6089
Wea                     = $608a
ClimbingSlope           = $608b
temp2a                  = $608c
temp3a                  = $608d
temp4a                  = $608e
temp5a                  = $608f
temp6a                  = $6090
pspeed                  = $6091
pspeeddelay             = $6092
pspeedsound             = $6093
tickid                  = $6094
oldpspeed               = $6095
framesfour              = $6096
dontdecrementagain      = $6097
ScrollThirtyTwoOG       = $6098
olddirscroll            = $6099
stopload                = $609a
Player_X_ColumnLoc      = $609b
bbl2                    = $609c
Block_BBuf_High         = $609f
dont                    = $60a1
scrolldir               = $60a2
tempXD                  = $60a3
dontscroll              = $60a4
iwantdie                = $60a5
ScrollLockPageLoc       = $60a6
ScrollLockColumnPos     = $60a7
WarpZoneCheck           = $60a8
ScrollLeftLock          = $60a9
Player_X_Column         = $60aa
GlobalSaveOffset        = $60ab
Saved_X_Position        = $60ac
Saved_Y_Position        = $614c
Saved_PageLoc           = $61ac
Saved_State             = $624c
Saved_isDefeated        = $62ac
Saved_ID                = $634c
OldPageLoc              = $63ac
OldHorizontalScroll     = $63ad
OldNameTableSelect      = $63ae
TouchingFloor           = $63af
TouchingCeiling         = $63b0
PlatformTimer           = $63b1
timerupthing            = $63b2
ChangeBankRDelay2       = $63b3
BrickCoinTimer          = $63b4
DisableScreenFlag2      = $63b5
waitforit               = $63b6
SetupPause              = $63b7
PreviousUp_Down_Buttons = $63b8
SettingSelec            = $63b9
OldSettingSelec         = $63ba
DoFin                   = $63bb
BackgroundColorCtrlFP   = $63bc
FlagpoleEnemyPage       = $63bd
FlagpoleEnemyCol        = $63be
OnPlatform              = $63bf
OnWater                 = $63c0
OrigMetatile            = $63c1
Cbolla                  = $069e
SavedOffset             = $63c4
FlagpoleOnScreen        = $63ca
tempE                   = $63cc
AreaPages               = $63cd
PagesPages              = $63ed
Averveamos              = $63dd
WasLocked               = $63de
ScrollLeftFlag          = $63df
AutoScrollFlag          = $63e0
AutoScrollFlag2         = $63e1
OldScrollLeftFlag       = $63e2
OldSquare1SoundBuffer   = $63e3
OldMirror_PPU_CTRLREG1  = $63e4
OldVerticalScroll       = $63e5
tempF                   = $63e6
tempG                   = $63e7
SideCollisionAdder      = $63e8
FramesMissed            = $63e9
GroundedTimer           = $63ea
EnemyOnSlope            = $05f0
lagframedetect          = $63eb
DecodingLevel           = $63ec
FloateyNum_PageLoc      = $63ed
                       
ExtraShit               = $0501
ExtraShit2              = $0541
ExtraShit3              = $0581
ExtraShit4              = $05a1    
                       
CHR0:                   = $7e00
CHR1:                   = $7e01
CHR2:                   = $7e02
CHR3:                   = $7e03
CHR4:                   = $7e04
CHR5:                   = $7e05
LevelBank               = $7e06
seed                    = $7e07
VineGrabCooldown        = $7e09
TitleScreenSelect       = $7e0a
FirstFrame              = $7e0b
FirstBootFlag           = $7e0c
DontRepeat              = $7e0d
Cannon_Creator          = $7e0e
WorldPalette            = $7e13
TheresPal3              = $7e14
OldPal3                 = $7e15
dumbflag                = $7e19
FloateyShit             = $7e1a
BowserGotHit            = $7e1f
PCooldown               = $7e20
                      
TextboxID               = $05c1
CurrentChar             = $05c2
IncrementedTxtHAdd      = $05c3
IRQnum                  = $05c4
Old8000                 = $05c5
StartedTextBox          = $05c6
SomeOffset              = $05c7
TextBoxYScroll          = $05c8
ScrollText              = $05c9
songPlaying             = $05ca
EndTimer                = $05cb
LastCHR3                = $05cc
TimesScrolled           = $05cd
PlayerOnVine            = $05ce
OldSavedJoypadBits      = $05cf
LevelParserOffset       = $05d0
LevelSelectNumber       = $05d1
EnemyOffsetPage         = $05d2
                       
                       
                       
                       
SavedScore              = $7f00
SettingsBits            = $7f06
WorldSelectEnableFlag   = $7f0a
TopMaxedOut             = $7f10
ContinueWorld           = $7f11
ContinueLevel           = $7f12
ContinueScore           = $7f13
ContinueCoins           = $7f1a
ContinuePwrup           = $7f1e
ContinueCoinTally       = $7f1f
World9Progress          = $7f20
SignReadList			= $7f21
SavedWord               = $7fbc 


UP = $7f
DOWN = $81
LEFT = $80
RIGHT = $82
Abutton = $83
Bbutton = $84


OriginalLevelDataStart = $09CB4 ; start of level data in a normal SMB 
LevelDataOffset = OriginalLevelDataStart - LevelDataStart

ContinueMenuSelect = Player_Y_Position

FinalWorld = World8         ; Final world
SecHardModeWorld = World5   ; Secondary hard mode starts on this world

save_playerData = $7e00

NumberOfCharacters = #$02

shufflelevels = 0

if shufflelevels == 1
Enablew1l1PiranhaPlants = 1
else
Enablew1l1PiranhaPlants = 0
endif

BANK_SOUND = #$02
BANK_CORE = #$03

Unlock9Steps = #$01

FirstLevelBank = #$0a


