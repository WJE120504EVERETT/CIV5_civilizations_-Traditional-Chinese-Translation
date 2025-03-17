-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                           IconSize,    Filename,                      IconsPerRow,       IconsPerColumn)
VALUES    ('THP_AZTEC_ATLAS',     256,        'THP_AztecAtlas256.dds',        2,                 2),
('THP_AZTEC_ATLAS',               128,        'THP_AztecAtlas128.dds',        2,                 2),
('THP_AZTEC_ATLAS',               80,         'THP_AztecAtlas80.dds',         2,                 2),
('THP_AZTEC_ATLAS',               64,         'THP_AztecAtlas64.dds',         2,                 2),
('THP_AZTEC_ATLAS',               45,         'THP_AztecAtlas45.dds',         2,                 2),
('THP_AZTEC_ATLAS',               32,         'THP_AztecAtlas32.dds',         2,                 2),
('THP_AZTEC_ALPHA_ATLAS',         128,        'THP_AztecAlpha128.dds',        1,                 1),
('THP_AZTEC_ALPHA_ATLAS',         64,         'THP_AztecAlpha64.dds',         1,                 1),
('THP_AZTEC_ALPHA_ATLAS',         48,         'THP_AztecAlpha48.dds',         1,                 1),
('THP_AZTEC_ALPHA_ATLAS',         32,         'THP_AztecAlpha32.dds',         1,                 1),
('THP_AZTEC_ALPHA_ATLAS',         24,         'THP_AztecAlpha24.dds',         1,                 1),
('THP_AZTEC_ALPHA_ATLAS',         16,         'THP_AztecAlpha16.dds',         1,                 1),
('THP_UNIT_EAGLE_WARRIOR_FLAG_ATLAS',   32,   'Unit_EagleWarrior_Flag_32.dds',     1,            1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
          (Type,                            Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_AZTEC_ICON',   0.431,   0.204,    0.239,    1),
('COLOR_PLAYER_THP_AZTEC_BACKGROUND',       0.475,   0.757,    0.686,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_AZTEC',        'COLOR_PLAYER_THP_AZTEC_ICON',     'COLOR_PLAYER_THP_AZTEC_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		             TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_EAGLE_WARRIOR',		'Unit', 		'sv_eagle_warrior.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                                  DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_THP_EAGLE_WARRIOR',       DamageStates,    Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                       UnitMemberInfoType,                       NumMembers)
SELECT    'ART_DEF_UNIT_THP_EAGLE_WARRIOR',   'ART_DEF_UNIT_MEMBER_THP_EAGLE_WARRIOR',   NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_EAGLE_WARRIOR',  EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_EAGLE_WARRIOR',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                              Scale,    ZOffset, Domain, Model,                    MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_EAGLE_WARRIOR',  Scale,    ZOffset, Domain, 'Pikeman_Aztec.fxsxml',   MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 							         Filename, 		LoadType)
SELECT	('SND_LEADER_MUSIC_THP_TLACAELEL_PEACE', 	'Aztec_Peace', 'DynamicResident'),
		('SND_LEADER_MUSIC_THP_TLACAELEL_WAR', 		'Aztec_War',   'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_TLACAELEL_PEACE', 		'SND_LEADER_MUSIC_THP_TLACAELEL_PEACE', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_TLACAELEL_WAR', 	    'SND_LEADER_MUSIC_THP_TLACAELEL_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================
