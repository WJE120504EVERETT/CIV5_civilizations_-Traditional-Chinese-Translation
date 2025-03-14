--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_FLOWER_CLASS',	'Unit', 	'sv_FlowerClass.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_FLOWER_CLASS',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_DESTROYER';	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_FLOWER_CLASS', 	'ART_DEF_UNIT_MEMBER_JFD_FLOWER_CLASS',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_DESTROYER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_FLOWER_CLASS',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_DESTROYER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_FLOWER_CLASS',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_DESTROYER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_FLOWER_CLASS',	Scale,	ZOffset, Domain, 'corvette.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_DESTROYER';	
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_CANADA_KING_PEACE',	'JFD_CanadaKing_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_CANADA_KING_WAR', 	'JFD_CanadaKing_War', 	'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds	
		(ScriptID, 									SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_CANADA_KING_PEACE',	'SND_LEADER_MUSIC_JFD_CANADA_KING_PEACE', 	'GAME_MUSIC', 	45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_CANADA_KING_WAR', 	'SND_LEADER_MUSIC_JFD_CANADA_KING_WAR', 	'GAME_MUSIC', 	45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_CANADA_KING_ICON', 		0.678,	0.533,	0.329,	1),
		('COLOR_PLAYER_JFD_CANADA_KING_BACKGROUND',	0.325,	0.078,	0.109,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_JFD_CANADA_KING',	'COLOR_PLAYER_JFD_CANADA_KING_ICON',	'COLOR_PLAYER_JFD_CANADA_KING_BACKGROUND',   'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_CANADA_KING_ALPHA_ATLAS', 		128, 		'JFD_CanadaKing_AlphaAtlas_128.dds',	1,				1),
		('JFD_CANADA_KING_ALPHA_ATLAS', 		80, 		'JFD_CanadaKing_AlphaAtlas_80.dds',		1, 				1),
		('JFD_CANADA_KING_ALPHA_ATLAS', 		64, 		'JFD_CanadaKing_AlphaAtlas_64.dds',		1, 				1),
		('JFD_CANADA_KING_ALPHA_ATLAS', 		48, 		'JFD_CanadaKing_AlphaAtlas_48.dds',		1, 				1),
		('JFD_CANADA_KING_ALPHA_ATLAS', 		45, 		'JFD_CanadaKing_AlphaAtlas_45.dds',		1, 				1),
		('JFD_CANADA_KING_ALPHA_ATLAS', 		32, 		'JFD_CanadaKing_AlphaAtlas_32.dds',		1, 				1),
		('JFD_CANADA_KING_ALPHA_ATLAS', 		24, 		'JFD_CanadaKing_AlphaAtlas_24.dds',		1, 				1),
		('JFD_CANADA_KING_ALPHA_ATLAS', 		16, 		'JFD_CanadaKing_AlphaAtlas_16.dds',		1, 				1),
		('JFD_CANADA_KING_ICON_ATLAS', 			256, 		'JFD_CanadaKing_IconAtlas_256.dds',		2, 				2),
		('JFD_CANADA_KING_ICON_ATLAS', 			128, 		'JFD_CanadaKing_IconAtlas_128.dds',		2, 				2),
		('JFD_CANADA_KING_ICON_ATLAS', 			80, 		'JFD_CanadaKing_IconAtlas_80.dds',		2, 				2),
		('JFD_CANADA_KING_ICON_ATLAS', 			64, 		'JFD_CanadaKing_IconAtlas_64.dds',		2, 				2),
		('JFD_CANADA_KING_ICON_ATLAS', 			45, 		'JFD_CanadaKing_IconAtlas_45.dds',		2, 				2),
		('JFD_CANADA_KING_ICON_ATLAS', 			32, 		'JFD_CanadaKing_IconAtlas_32.dds',		2, 				2),
		('JFD_CANADA_KING_PROMOTION_ATLAS',		256, 	    'Tomatekh_PromotionAtlas_256.dds',		2, 				1),
		('JFD_CANADA_KING_PROMOTION_ATLAS',		64, 	    'Tomatekh_PromotionAtlas_64.dds',		2, 				1),
		('JFD_CANADA_KING_PROMOTION_ATLAS',		45, 	    'Tomatekh_PromotionAtlas_45.dds',		2, 				1),
		('JFD_CANADA_KING_PROMOTION_ATLAS',		32, 	    'Tomatekh_PromotionAtlas_32.dds',		2, 				1),
		('JFD_CANADA_KING_UNIT_FLAG_ATLAS',		32, 		'JFD_CanadaKing_UnitFlagAtlas_32.dds',	1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
