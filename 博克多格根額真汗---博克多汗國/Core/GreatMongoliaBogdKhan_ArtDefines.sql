--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_MANLAIBAATAR',	'Unit', 		'sv_Manlaibaatar.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_MANLAIBAATAR',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GENERAL'; 	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_MANLAIBAATAR', 	'ART_DEF_UNIT_MEMBER_JFD_MANLAIBAATAR',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GENERAL';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_MANLAIBAATAR',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_MANLAIBAATAR',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_MANLAIBAATAR',	Scale, ZOffset, Domain, 'Manlaibaatar.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 												Filename, 							LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_GREAT_MONGOLIA_BOGD_KHAN_PEACE',	'JFD_GreatMongoliaBogdKhan_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_GREAT_MONGOLIA_BOGD_KHAN_WAR', 	'JFD_GreatMongoliaBogdKhan_War', 	'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds	
		(ScriptID, 													SoundID, 												SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_GREAT_MONGOLIA_BOGD_KHAN_PEACE',	'SND_LEADER_MUSIC_JFD_GREAT_MONGOLIA_BOGD_KHAN_PEACE', 	'GAME_MUSIC', 	45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_GREAT_MONGOLIA_BOGD_KHAN_WAR',		'SND_LEADER_MUSIC_JFD_GREAT_MONGOLIA_BOGD_KHAN_WAR',	'GAME_MUSIC', 	45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 														Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON', 			0.070,	0.086,	0.192,	1),
		('COLOR_PLAYER_JFD_GREAT_MONGOLIA_BOGD_KHAN_BACKGROUND',	0.745,	0.639,	0.411,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 											PrimaryColor, 										SecondaryColor, 										TextColor)
VALUES	('PLAYERCOLOR_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'COLOR_PLAYER_JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON',	'COLOR_PLAYER_JFD_GREAT_MONGOLIA_BOGD_KHAN_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 											IconSize, 	Filename, 											IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS', 		128, 		'JFD_GreatMongoliaBogdKhan_AlphaAtlas_128.dds',		1,				1),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS', 		80, 		'JFD_GreatMongoliaBogdKhan_AlphaAtlas_80.dds',		1, 				1),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS', 		64, 		'JFD_GreatMongoliaBogdKhan_AlphaAtlas_64.dds',		1, 				1),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS', 		48, 		'JFD_GreatMongoliaBogdKhan_AlphaAtlas_48.dds',		1, 				1),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS', 		45, 		'JFD_GreatMongoliaBogdKhan_AlphaAtlas_45.dds',		1, 				1),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS', 		32, 		'JFD_GreatMongoliaBogdKhan_AlphaAtlas_32.dds',		1, 				1),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS', 		24, 		'JFD_GreatMongoliaBogdKhan_AlphaAtlas_24.dds',		1, 				1),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS', 		16, 		'JFD_GreatMongoliaBogdKhan_AlphaAtlas_16.dds',		1, 				1),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS', 		256, 		'JFD_GreatMongoliaBogdKhan_IconAtlas_256.dds',		2, 				2),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS', 		128, 		'JFD_GreatMongoliaBogdKhan_IconAtlas_128.dds',		2, 				2),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS', 		80, 		'JFD_GreatMongoliaBogdKhan_IconAtlas_80.dds',		2, 				2),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS', 		64, 		'JFD_GreatMongoliaBogdKhan_IconAtlas_64.dds',		2, 				2),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS', 		45, 		'JFD_GreatMongoliaBogdKhan_IconAtlas_45.dds',		2, 				2),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS', 		32, 		'JFD_GreatMongoliaBogdKhan_IconAtlas_32.dds',		2, 				2),
		('JFD_GREAT_MONGOLIA_BOGD_KHAN_UNIT_FLAG_ATLAS', 	32, 		'JFD_GreatMongoliaBogdKhan_UnitFlagAtlas_32.dds',	1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	


