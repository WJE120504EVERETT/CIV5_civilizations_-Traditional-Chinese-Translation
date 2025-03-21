--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 				  Scale, ImprovementType,					LayoutHandler, 	ResourceType, 			Model, 					TerrainContour)
VALUES 	('Any', 'Constructed',		  1.0, 	 'ART_DEF_IMPROVEMENT_SAS_JEU',	'SNAPSHOT', 		'ART_DEF_RESOURCE_ALL', 'Water Village B.fxsxml', 		1),
		('Any', 'UnderConstruction',  1.0,   'ART_DEF_IMPROVEMENT_SAS_JEU',	'SNAPSHOT', 		'ART_DEF_RESOURCE_ALL', 'Water Village HB.fxsxml', 		1),		
		('Any', 'Pillaged',			  1.0,   'ART_DEF_IMPROVEMENT_SAS_JEU',	'SNAPSHOT', 		'ART_DEF_RESOURCE_ALL', 'Water Village PL.fxsxml',		1);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_LandmarkTypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes
		(Type,								LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_SAS_JEU',	'Improvement',	'Jeu');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_SAS_JEU',  'Improvement', 	'SV_Sas_Jeu.dds'),
		('ART_DEF_UNIT_SAS_HEADHUNTER',		'Unit', 		'SV_Sas_Headhunter.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_SAS_HEADHUNTER',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_ARCHER'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_HEADHUNTER', 'ART_DEF_UNIT_MEMBER_SAS_HEADHUNTER', 12);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_SAS_HEADHUNTER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ARCHER';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SAS_HEADHUNTER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ARCHER';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SAS_HEADHUNTER',	Scale, ZOffset, Domain, 'SonghaiArcher.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_ARCHER';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_SAS_FIN_PEACE',		'Sas_Fin_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_SAS_FIN_WAR', 		'Sas_Fin_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_SAS_FIN_PEACE', 	'SND_LEADER_MUSIC_SAS_FIN_PEACE',	'GAME_MUSIC', 	-1.0,					70, 		70, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SAS_FIN_WAR',		'SND_LEADER_MUSIC_SAS_FIN_WAR', 	'GAME_MUSIC', 	-1.0,					70, 		70, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											 Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_SAS_FIN_ICON', 		 0.317, 0.062, 	0.023, 	1),
		('COLOR_PLAYER_SAS_FIN_BACKGROUND',  0.788,	0.8,	0.717, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_SAS_ASMAT',		'COLOR_PLAYER_SAS_FIN_ICON',	'COLOR_PLAYER_SAS_FIN_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('SAS_ASMAT_ALPHA_ATLAS',			128, 		'SasAsmatAlpha_128.dds',			1,				1),
		('SAS_ASMAT_ALPHA_ATLAS',			80, 		'SasAsmatAlpha_80.dds',			1, 				1),
		('SAS_ASMAT_ALPHA_ATLAS',			64, 		'SasAsmatAlpha_64.dds',			1, 				1),
		('SAS_ASMAT_ALPHA_ATLAS',			48, 		'SasAsmatAlpha_48.dds',			1, 				1),
		('SAS_ASMAT_ALPHA_ATLAS',			45, 		'SasAsmatAlpha_45.dds',			1, 				1),
		('SAS_ASMAT_ALPHA_ATLAS',			32, 		'SasAsmatAlpha_32.dds',			1, 				1),
		('SAS_ASMAT_ALPHA_ATLAS',			24, 		'SasAsmatAlpha_24.dds',			1, 				1),
		('SAS_ASMAT_ALPHA_ATLAS',			16, 		'SasAsmatAlpha_16.dds',			1, 				1),
		('SAS_ASMAT_ICON_ATLAS', 			256, 		'SasAsmatIcons256.dds',			6, 				1),
		('SAS_ASMAT_ICON_ATLAS', 			128, 		'SasAsmatIcons128.dds',			6, 				1),
		('SAS_ASMAT_ICON_ATLAS', 			80, 		'SasAsmatIcons80.dds',			6, 				1),
		('SAS_ASMAT_ICON_ATLAS', 			64, 		'SasAsmatIcons64.dds',			6, 				1),
		('SAS_ASMAT_ICON_ATLAS', 			45, 		'SasAsmatIcons45.dds',			6, 				1),
		('SAS_ASMAT_ICON_ATLAS', 			32, 		'SasAsmatIcons32.dds',			6, 				1),
		('SAS_HEADHUNTER_ATLAS', 	32, 		'Sas_Headhunter_Flag.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	