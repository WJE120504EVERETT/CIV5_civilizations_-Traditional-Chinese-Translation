--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_TONTON',	'Unit', 	'sv_Tonton.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_TONTON', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_TONTON', 	'ART_DEF_UNIT_MEMBER_JFD_TONTON', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TONTON',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TONTON',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model,				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TONTON',	Scale, ZOffset, Domain, 'Tonton.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MARINE';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 												Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_HAITI_PAPA_DOC_PEACE',			'JFD_HaitiPapaDoc_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_HAITI_PAPA_DOC_WAR', 			'JFD_HaitiPapaDoc_War', 	'DynamicResident'),
		('SND_SOUND_JFD_TONTON_GUNFIRE', 						'TontonGunfire', 			'DynamicResident');			
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 												SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_HAITI_PAPA_DOC_PEACE',			'SND_LEADER_MUSIC_JFD_HAITI_PAPA_DOC_PEACE',	'GAME_MUSIC',	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_HAITI_PAPA_DOC_WAR', 			'SND_LEADER_MUSIC_JFD_HAITI_PAPA_DOC_WAR', 		'GAME_MUSIC',	-1.0,					45, 		45, 		1,		 0),
		('AS2D_SND_SOUND_JFD_TONTON_GUNFIRE',					'SND_SOUND_JFD_TONTON_GUNFIRE', 				'GAME_SFX', 	-1.0,					100, 		100, 		0, 		 0);

UPDATE Audio_2DSounds
SET DontTriggerDuplicates = 1
WHERE ScriptID = 'AS2D_SND_SOUND_JFD_TONTON_GUNFIRE';
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_HAITI_PAPA_DOC_ICON', 		0.937,	0.643,	0.643, 	1),
		('COLOR_PLAYER_JFD_HAITI_PAPA_DOC_BACKGROUND',	0.219,	0.078,	0.137, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 								SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_JFD_HAITI_PAPA_DOC',	'COLOR_PLAYER_JFD_HAITI_PAPA_DOC_ICON', 	'COLOR_PLAYER_JFD_HAITI_PAPA_DOC_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_HAITI_PAPA_DOC_ALPHA_ATLAS', 		128, 		'JFD_HaitiPapaDoc_AlphaAtlas_128.dds',		1, 				1),
		('JFD_HAITI_PAPA_DOC_ALPHA_ATLAS', 		80, 		'JFD_HaitiPapaDoc_AlphaAtlas_80.dds',		1, 				1),
		('JFD_HAITI_PAPA_DOC_ALPHA_ATLAS', 		64, 		'JFD_HaitiPapaDoc_AlphaAtlas_64.dds',		1, 				1),
		('JFD_HAITI_PAPA_DOC_ALPHA_ATLAS', 		48, 		'JFD_HaitiPapaDoc_AlphaAtlas_48.dds',		1, 				1),
		('JFD_HAITI_PAPA_DOC_ALPHA_ATLAS', 		45, 		'JFD_HaitiPapaDoc_AlphaAtlas_45.dds',		1, 				1),
		('JFD_HAITI_PAPA_DOC_ALPHA_ATLAS', 		32, 		'JFD_HaitiPapaDoc_AlphaAtlas_32.dds',		1, 				1),
		('JFD_HAITI_PAPA_DOC_ALPHA_ATLAS', 		24, 		'JFD_HaitiPapaDoc_AlphaAtlas_24.dds',		1, 				1),
		('JFD_HAITI_PAPA_DOC_ALPHA_ATLAS', 		16, 		'JFD_HaitiPapaDoc_AlphaAtlas_16.dds',		1, 				1),
		('JFD_HAITI_PAPA_DOC_ICON_ATLAS', 		256, 		'JFD_HaitiPapaDoc_IconAtlas_256.dds',		2, 				2),
		('JFD_HAITI_PAPA_DOC_ICON_ATLAS', 		128, 		'JFD_HaitiPapaDoc_IconAtlas_128.dds',		2, 				2),
		('JFD_HAITI_PAPA_DOC_ICON_ATLAS', 		80, 		'JFD_HaitiPapaDoc_IconAtlas_80.dds',		2, 				2),
		('JFD_HAITI_PAPA_DOC_ICON_ATLAS', 		64, 		'JFD_HaitiPapaDoc_IconAtlas_64.dds',		2, 				2),
		('JFD_HAITI_PAPA_DOC_ICON_ATLAS', 		45, 		'JFD_HaitiPapaDoc_IconAtlas_45.dds',		2, 				2),
		('JFD_HAITI_PAPA_DOC_ICON_ATLAS', 		32, 		'JFD_HaitiPapaDoc_IconAtlas_32.dds',		2, 				2),
		('JFD_HAITI_PAPA_DOC_UNIT_FLAG_ATLAS',	32, 		'JFD_HaitiPapaDoc_UnitFlagAtlas_32.dds',	1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
