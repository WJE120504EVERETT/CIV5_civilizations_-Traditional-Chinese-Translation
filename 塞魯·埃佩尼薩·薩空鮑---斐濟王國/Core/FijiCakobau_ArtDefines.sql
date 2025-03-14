--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_BATI',	'Unit', 	'sv_Bati.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_BATI', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_POLYNESIAN_MAORI_WARRIOR';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_BATI', 	'ART_DEF_UNIT_MEMBER_JFD_BATI', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_POLYNESIAN_MAORI_WARRIOR';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_BATI',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_MAORI_WARRIOR';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_BATI',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_MAORI_WARRIOR';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_BATI',		Scale, ZOffset, Domain, 'Oceanic_warrior.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_MAORI_WARRIOR';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_FIJI_CAKOBAU_PEACE',		'JFD_FijiCakobau_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_FIJI_CAKOBAU_WAR', 		'JFD_FijiCakobau_War', 		'DynamicResident');			
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JFD_FIJI_CAKOBAU_AMBIENCE',	'SND_AMBIENCE_ODA_AMBIENCE', 				'GAME_SFX', 	0.0,					15, 		15, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JFD_FIJI_CAKOBAU_PEACE',		'SND_LEADER_MUSIC_JFD_FIJI_CAKOBAU_PEACE',	'GAME_MUSIC',	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_FIJI_CAKOBAU_WAR', 			'SND_LEADER_MUSIC_JFD_FIJI_CAKOBAU_WAR', 	'GAME_MUSIC',	-1.0,					45, 		45, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_FIJI_CAKOBAU_ICON', 			0.278,	0.062,	0.121, 	1),
		('COLOR_PLAYER_JFD_FIJI_CAKOBAU_BACKGROUND',	0.611,	0.827,	0.839, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_JFD_FIJI_CAKOBAU',	'COLOR_PLAYER_JFD_FIJI_CAKOBAU_ICON', 	'COLOR_PLAYER_JFD_FIJI_CAKOBAU_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_FIJI_CAKOBAU_ALPHA_ATLAS', 		128, 		'JFD_FijiCakobau_AlphaAtlas_128.dds',		1, 				1),
		('JFD_FIJI_CAKOBAU_ALPHA_ATLAS', 		80, 		'JFD_FijiCakobau_AlphaAtlas_80.dds',		1, 				1),
		('JFD_FIJI_CAKOBAU_ALPHA_ATLAS', 		64, 		'JFD_FijiCakobau_AlphaAtlas_64.dds',		1, 				1),
		('JFD_FIJI_CAKOBAU_ALPHA_ATLAS', 		48, 		'JFD_FijiCakobau_AlphaAtlas_48.dds',		1, 				1),
		('JFD_FIJI_CAKOBAU_ALPHA_ATLAS', 		45, 		'JFD_FijiCakobau_AlphaAtlas_45.dds',		1, 				1),
		('JFD_FIJI_CAKOBAU_ALPHA_ATLAS', 		32, 		'JFD_FijiCakobau_AlphaAtlas_32.dds',		1, 				1),
		('JFD_FIJI_CAKOBAU_ALPHA_ATLAS', 		24, 		'JFD_FijiCakobau_AlphaAtlas_24.dds',		1, 				1),
		('JFD_FIJI_CAKOBAU_ALPHA_ATLAS', 		16, 		'JFD_FijiCakobau_AlphaAtlas_16.dds',		1, 				1),
		('JFD_FIJI_CAKOBAU_ICON_ATLAS', 		256, 		'JFD_FijiCakobau_IconAtlas_256.dds',		2, 				2),
		('JFD_FIJI_CAKOBAU_ICON_ATLAS', 		128, 		'JFD_FijiCakobau_IconAtlas_128.dds',		2, 				2),
		('JFD_FIJI_CAKOBAU_ICON_ATLAS', 		80, 		'JFD_FijiCakobau_IconAtlas_80.dds',			2, 				2),
		('JFD_FIJI_CAKOBAU_ICON_ATLAS', 		64, 		'JFD_FijiCakobau_IconAtlas_64.dds',			2, 				2),
		('JFD_FIJI_CAKOBAU_ICON_ATLAS', 		45, 		'JFD_FijiCakobau_IconAtlas_45.dds',			2, 				2),
		('JFD_FIJI_CAKOBAU_ICON_ATLAS', 		32, 		'JFD_FijiCakobau_IconAtlas_32.dds',			2, 				2),
		('JFD_FIJI_CAKOBAU_UNIT_FLAG_ATLAS',	32, 		'JFD_FijiCakobau_UnitFlagAtlas_32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
