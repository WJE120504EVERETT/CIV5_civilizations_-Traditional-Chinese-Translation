--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_CHAIKA',		'Unit', 	'sv_Chaika.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_CHAIKA',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GALLEASS'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_CHAIKA',		'ART_DEF_UNIT_MEMBER_JFD_CHAIKA',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GALLEASS';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CHAIKA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CHAIKA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 			  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CHAIKA',	Scale, ZOffset, Domain, 'chaika.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GALLEASS';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 												Filename, 							LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_ZAPORIZHZHIA_SIRKO_PEACE',		'JFD_ZaporizhzhiaSirko_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_ZAPORIZHZHIA_SIRKO_WAR', 		'JFD_ZaporizhzhiaSirko_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 													SoundID, 											SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JFD_ZAPORIZHZHIA_SIRKO_AMBIENCE',	'SND_AMBIENCE_ODA_AMBIENCE', 						'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JFD_ZAPORIZHZHIA_SIRKO_PEACE', 			'SND_LEADER_MUSIC_JFD_ZAPORIZHZHIA_SIRKO_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_ZAPORIZHZHIA_SIRKO_WAR',			'SND_LEADER_MUSIC_JFD_ZAPORIZHZHIA_SIRKO_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 													Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_JFD_ZAPORIZHZHIA_SIRKO_ICON', 			1, 		0.796, 	0.619, 	1),
		('COLOR_PLAYER_JFD_ZAPORIZHZHIA_SIRKO_BACKGROUND', 		0.215,	0.203,	0.329, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 									 SecondaryColor, 										TextColor)
VALUES	('PLAYERCOLOR_JFD_ZAPORIZHZHIA_SIRKO',		'COLOR_PLAYER_JFD_ZAPORIZHZHIA_SIRKO_ICON',		'COLOR_PLAYER_JFD_ZAPORIZHZHIA_SIRKO_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 											IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS',		128, 		'JFD_ZaporizhzhiaSirko_AlphaAtlas_128.dds',			1,				1),
		('JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS',		80, 		'JFD_ZaporizhzhiaSirko_AlphaAtlas_80.dds',			1, 				1),
		('JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS',		64, 		'JFD_ZaporizhzhiaSirko_AlphaAtlas_64.dds',			1, 				1),
		('JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS',		48, 		'JFD_ZaporizhzhiaSirko_AlphaAtlas_48.dds',			1, 				1),
		('JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS',		45, 		'JFD_ZaporizhzhiaSirko_AlphaAtlas_45.dds',			1, 				1),
		('JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS',		32, 		'JFD_ZaporizhzhiaSirko_AlphaAtlas_32.dds',			1, 				1),
		('JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS',		24, 		'JFD_ZaporizhzhiaSirko_AlphaAtlas_24.dds',			1, 				1),
		('JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS',		16, 		'JFD_ZaporizhzhiaSirko_AlphaAtlas_16.dds',			1, 				1),
		('JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS', 		256, 		'JFD_ZaporizhzhiaSirko_IconAtlas_256.dds',			2, 				2),
		('JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS', 		128, 		'JFD_ZaporizhzhiaSirko_IconAtlas_128.dds',			2, 				2),
		('JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS', 		80, 		'JFD_ZaporizhzhiaSirko_IconAtlas_80.dds',			2, 				2),
		('JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS', 		64, 		'JFD_ZaporizhzhiaSirko_IconAtlas_64.dds',			2, 				2),
		('JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS', 		45, 		'JFD_ZaporizhzhiaSirko_IconAtlas_45.dds',			2, 				2),
		('JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS', 		32, 		'JFD_ZaporizhzhiaSirko_IconAtlas_32.dds',			2, 				2),
		('JFD_ZAPORIZHZHIA_SIRKO_UNIT_FLAG_ATLAS', 	32, 		'JFD_ZaporizhzhiaSirko_UnitFlagAtlas_32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
