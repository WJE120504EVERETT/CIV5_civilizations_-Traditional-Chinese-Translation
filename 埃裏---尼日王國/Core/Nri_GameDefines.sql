--==========================================================================================================================	
-- RELIGIONS
--==========================================================================================================================	
-- Religions
------------------------------	
INSERT OR REPLACE INTO Religions 
		(Type, 				 Description, 					Civilopedia,							IconAtlas,					PortraitIndex,	IconString)
SELECT	'RELIGION_ODINANI',  'TXT_KEY_RELIGION_JFD_ODINANI', 'TXT_KEY_RELIGION_JFD_ODINANI_PEDIA',	'JFD_NRI_RELIGION_ATLAS',	0,				'[ICON_RELIGION_JFD_ODINANI]'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RELIGION_ODINANI' AND Value = 1);	

UPDATE Religions
SET JFD_ReligionTheme = 'AS2D_JFD_NZAMBIISM'
WHERE Type IN ('RELIGION_ODINANI');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
--------------------------------	
INSERT INTO Buildings 	
		(Type, 							SpecialistType,			SpecialistCount, FreeStartEra, BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, Description, 							Civilopedia, 							Help, 										Strategy,										ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_BRONZE_CASTER',	'SPECIALIST_MERCHANT',	1,				 FreeStartEra, BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, 'TXT_KEY_BUILDING_JFD_BRONZE_CASTER', 	'TXT_KEY_CIV5_JFD_BRONZE_CASTER_TEXT',	'TXT_KEY_BUILDING_JFD_BRONZE_CASTER_HELP',	'TXT_KEY_BUILDING_JFD_BRONZE_CASTER_STRATEGY',	ArtDefineTag, 3, 			 'JFD_NRI_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_FORGE';	
--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 					ResourceType,		YieldType,		Yield)
SELECT	'BUILDING_JFD_BRONZE_CASTER',	'RESOURCE_COPPER',	'YIELD_FAITH',	1
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_FORGE';	

INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 					ResourceType,		YieldType,		Yield)
SELECT	'BUILDING_JFD_BRONZE_CASTER',	'RESOURCE_IRON',	'YIELD_FAITH',	1
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_FORGE';	
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_JFD_BRONZE_CASTER',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_FORGE';

INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,				Flavor)
VALUES	('BUILDING_JFD_BRONZE_CASTER',  'FLAVOR_HAPPINESS',		20),
		('BUILDING_JFD_BRONZE_CASTER',  'FLAVOR_PRODUCTION',	30),
		('BUILDING_JFD_BRONZE_CASTER',  'FLAVOR_GOLD',			10);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 							Description, 						Help, 									 Sound, 				CannotBeChosen, EnemyHealChange,	NeutralHealChange,	FriendlyHealChange, LostWithUpgrade, PortraitIndex, IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_MBUIRICHI', 	'TXT_KEY_PROMOTION_JFD_MBUIRICHI', 	'TXT_KEY_PROMOTION_JFD_MBUIRICHI_HELP',  'AS2D_IF_LEVELUP', 	1, 				-10,				-10,				-10,				1, 				 59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_MBUIRICHI');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, SpreadReligion,	ReligiousStrength,	ReligionSpreads,	Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,		BaseGold, NumGoldPerEra, WorkRate, Description, 				  Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,			MoveRate)
SELECT	'UNIT_JFD_MBURICHI',	Class, 1,				1000,				2,					Cost, Moves, CivilianAttackPriority, Special, Domain, 'UNITAI_MISSIONARY',  BaseGold, NumGoldPerEra, WorkRate, 'TXT_KEY_UNIT_JFD_MBURICHI',  'TXT_KEY_CIV5_JFD_MBURICHI_TEXT', 'TXT_KEY_UNIT_JFD_MBURICHI_STRATEGY',	'TXT_KEY_UNIT_HELP_JFD_MBURICHI',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, 'ART_DEF_UNIT_JFD_MBURICHI',	0,					'JFD_UNIT_FLAG_MBURICHI_ATLAS',	2, 				'JFD_NRI_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_MERCHANT';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_MBURICHI', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT';
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_MBURICHI', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_MBURICHI', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSIONARY';
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_MBURICHI', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MERCHANT';
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_MBURICHI', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MERCHANT';

INSERT INTO Unit_FreePromotions
		(UnitType,				PromotionType)
VALUES	('UNIT_JFD_MBURICHI',	'PROMOTION_JFD_MBUIRICHI');
--------------------------------
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_JFD_MBURICHI', 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_MERCHANT';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 				Description, 				Civilopedia, 									CivilopediaTag, 						ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES	('LEADER_JFD_ERI', 	'TXT_KEY_LEADER_JFD_ERI', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD__ERI_TEXT_1', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ERI',  'Janboruta_Eri_Diplo.xml',	2, 						2, 						7, 							4, 			6, 				9, 				2, 						5, 				5, 			4, 			4, 				4, 			2, 			'JFD_NRI_ATLAS',	1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 		MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_WAR', 			0),
		('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_AFRAID', 		6),
		('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_ERI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 		MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_CONQUEST', 		0),
		('LEADER_JFD_ERI', 	'MINOR_CIV_APPROACH_BULLY', 		0);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 		FlavorType, 						Flavor)
VALUES	('LEADER_JFD_ERI', 	'FLAVOR_OFFENSE', 					2),
		('LEADER_JFD_ERI', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_ERI', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_ERI', 	'FLAVOR_MILITARY_TRAINING', 		2),
		('LEADER_JFD_ERI', 	'FLAVOR_RECON', 					2),
		('LEADER_JFD_ERI', 	'FLAVOR_RANGED', 					2),
		('LEADER_JFD_ERI', 	'FLAVOR_MOBILE', 					2),
		('LEADER_JFD_ERI', 	'FLAVOR_NAVAL', 					2),
		('LEADER_JFD_ERI', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_ERI', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_ERI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_ERI', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_ERI', 	'FLAVOR_EXPANSION', 				2),
		('LEADER_JFD_ERI', 	'FLAVOR_GROWTH', 					7),
		('LEADER_JFD_ERI', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_ERI', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_ERI', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_ERI', 	'FLAVOR_GOLD', 						7),
		('LEADER_JFD_ERI', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_ERI', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_ERI', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_ERI', 	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_JFD_ERI', 	'FLAVOR_WONDER', 					2),
		('LEADER_JFD_ERI', 	'FLAVOR_RELIGION', 					12),
		('LEADER_JFD_ERI', 	'FLAVOR_DIPLOMACY', 				8),
		('LEADER_JFD_ERI', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_ERI', 	'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_JFD_ERI', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_ERI', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_ERI', 	'FLAVOR_ESPIONAGE', 				2),
		('LEADER_JFD_ERI', 	'FLAVOR_AIRLIFT', 					4),
		('LEADER_JFD_ERI', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_ERI', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_ERI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_ERI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_ERI', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_ERI', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------
INSERT INTO Leader_Traits 
		(LeaderType, 		TraitType)
VALUES	('LEADER_JFD_ERI', 'TRAIT_JFD_NRI');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 				Description, 					ShortDescription)
VALUES	('TRAIT_JFD_NRI', 	'TXT_KEY_TRAIT_JFD_NRI', 		'TXT_KEY_TRAIT_JFD_NRI_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------			
INSERT INTO Civilizations 	
		(Type, 						Description, 					ShortDescription, 					Adjective, 							Civilopedia, 					CivilopediaTag, 		DefaultPlayerColor, 	ArtDefineTag, ArtStyleType,				ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas, 		SoundtrackTag, 	MapImage, 					DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_JFD_NRI',		'TXT_KEY_CIV_JFD_NRI_DESC',		'TXT_KEY_CIV_JFD_NRI_SHORT_DESC', 	'TXT_KEY_CIV_JFD_NRI_ADJECTIVE',	'TXT_KEY_CIV5_JFD_NRI_TEXT_1', 	'TXT_KEY_CIV5_JFD_NRI',	'PLAYERCOLOR_JFD_NRI', 	ArtDefineTag, 'ARTSTYLE_SOUTH_AMERICA', ArtStyleSuffix, ArtStylePrefix, 'JFD_NRI_ATLAS', 	0, 				'JFD_NRI_ALPHA_ATLAS', 	'Songhai', 		'Tomatekh_MapNri512.dds', 	'TXT_KEY_CIV5_DOM_JFD_ERI_TEXT', 	'Janboruta_Nri_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_SONGHAI';
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_01'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_02'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_03'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_04'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_05'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_06'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_07'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_08'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_09'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_10'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_11'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_12'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_13'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_14'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_15'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_16'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_17'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_18'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_19'),
		('CIVILIZATION_JFD_NRI', 		'TXT_KEY_CITY_NAME_JFD_NRI_20');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_JFD_NRI', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_JFD_NRI', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_NRI', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_JFD_NRI', 	'LEADER_JFD_ERI');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_NRI', 	'UNITCLASS_MERCHANT',		'UNIT_JFD_MBURICHI');
--------------------------------
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_NRI', 	'BUILDINGCLASS_FORGE',		'BUILDING_JFD_BRONZE_CASTER');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
VALUES	('CIVILIZATION_JFD_NRI', 	'RELIGION_PROTESTANTISM');		

UPDATE Civilization_Religions
SET ReligionType = 'RELIGION_ODINANI'
WHERE CivilizationType = 'CIVILIZATION_JFD_NRI'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RELIGION_ODINANI' AND Value = 1);	
--------------------------------
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 			RegionType)
VALUES	('CIVILIZATION_JFD_NRI', 	'REGION_HILLS');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_0'),	
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_1'),
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_2'),
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_3'),
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_4'),
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_5'),
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_6'),
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_7'),
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_8'),
		('CIVILIZATION_JFD_NRI', 	'TXT_KEY_SPY_NAME_JFD_NRI_9');
--==========================================================================================================================
--==========================================================================================================================