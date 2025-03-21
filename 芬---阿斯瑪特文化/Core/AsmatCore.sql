--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Pillage, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 			 Help, 							 Strategy, 							Civilopedia, 					ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 			 UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_SAS_HEADHUNTER',		Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Pillage, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_HEADHUNTER', 'TXT_KEY_UNIT_SAS_HEADHUNTER_HELP', 	 'TXT_KEY_UNIT_SAS_HEADHUNTER_STRATEGY',  'TXT_KEY_CIVILOPEDIA_SAS_HEADHUNTER_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_SAS_HEADHUNTER',	 'SAS_HEADHUNTER_ATLAS',	0,					'SAS_ASMAT_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_CROSSBOWMAN';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_HEADHUNTER',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CROSSBOWMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_SAS_HEADHUNTER',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CROSSBOWMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_SAS_HEADHUNTER',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CROSSBOWMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_SAS_HEADHUNTER',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CROSSBOWMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_SAS_HEADHUNTER',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CROSSBOWMAN';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				 PromotionType)
VALUES		('UNIT_SAS_HEADHUNTER', 'PROMOTION_GOLDEN_AGE_POINTS');

INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound,	DefenseMod,	AttackMod, 				CannotBeChosen, IconAtlas,  PortraitIndex,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_BISJPOLE',	'TXT_KEY_PROMOTION_SAS_BISJPOLE',	'TXT_KEY_PROMOTION_SAS_BISJPOLE_HELP',	'AS2D_IF_LEVELUP',	10,	10, 	1,	'ABILITY_ATLAS', 				59,	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_BISJPOLE_PROMO_HELP'),
		('PROMOTION_SAS_BISJPOLE_2',	'TXT_KEY_PROMOTION_SAS_BISJPOLE',	'TXT_KEY_PROMOTION_SAS_BISJPOLE_2_HELP',	'AS2D_IF_LEVELUP',	20,	20, 	1,	'ABILITY_ATLAS', 				59,	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_BISJPOLE_2_HELP');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_SAS_BISJPOLE', 	'BUILDING_SAS_BISJPOLE',	'TXT_KEY_BUILDING_SAS_BISJPOLE'),
		('BUILDINGCLASS_SAS_BISJPOLE_2', 	'BUILDING_SAS_BISJPOLE_2',	'TXT_KEY_BUILDING_SAS_BISJPOLE');
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, 						Cost,	FaithCost,	NeverCapture,	UnmoddedHappiness,	EnhancedYieldTech,	TechEnhancedTourism,	Description,	Civilopedia, 							Help,	PortraitIndex,	IconAtlas)
VALUES	('BUILDING_SAS_BISJPOLE',	'BUILDINGCLASS_SAS_BISJPOLE',	-1,		-1, 		1,	'1',	'TECH_AGRICULTURE',	'2',				'TXT_KEY_BUILDING_SAS_BISJPOLE',	'TXT_KEY_BUILDING_SAS_BISJPOLE_PEDIA', 	'TXT_KEY_BUILDING_SAS_BISJPOLE_HELP',	5,	'SAS_ASMAT_ICON_ATLAS'),
		('BUILDING_SAS_BISJPOLE_2',	'BUILDINGCLASS_SAS_BISJPOLE_2',	-1,		-1, 		1,	'2',	'TECH_AGRICULTURE',	'4',				'TXT_KEY_BUILDING_SAS_BISJPOLE',	'TXT_KEY_BUILDING_SAS_BISJPOLE_PEDIA', 	'TXT_KEY_BUILDING_SAS_BISJPOLE_HELP',	5,	'SAS_ASMAT_ICON_ATLAS');

INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 				Description,	NoLimit)
VALUES	('BUILDINGCLASS_SAS_BISJPOLE_TIMER',	'BUILDING_SAS_BISJPOLE_TIMER',	'TXT_KEY_BUILDING_SAS_BISJPOLE_TIMER',	1);

INSERT INTO Buildings 	
		(Type, 								 BuildingClass, 							GreatWorkCount, Cost,	FaithCost,	ConquestProb,	NukeImmune,	PrereqTech,	NeverCapture,	Description, 						Help)
VALUES	('BUILDING_SAS_BISJPOLE_TIMER',	 'BUILDINGCLASS_SAS_BISJPOLE_TIMER',		-1, 			-1,		-1,	0,	1,	null,		1,				'TXT_KEY_BUILDING_SAS_BISJPOLE_TIMER',	'TXT_KEY_BUILDING_SAS_BISJPOLE_TIMER');

--=======================================================================================================================	
-- IMPROVEMENTS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Improvements
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,							SpecificCivRequired,	CivilizationType,					GoldMaintenance,	FreshwaterMakesValid,	NearbyEnemyDamage,	Description,						Help,								Civilopedia,							ArtDefineTag,						BuildableOnResources,	DestroyedWhenPillaged,	Permanent,	PillageGold,	DefenseModifier,	PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_SAS_JEU',		1,						'CIVILIZATION_SAS_ASMAT',				0,					1,	'5',	'TXT_KEY_IMPROVEMENT_SAS_JEU',	'TXT_KEY_BUILD_SAS_JEU_HELP',	'TXT_KEY_IMPROVEMENT_SAS_JEU_TEXT',	'ART_DEF_IMPROVEMENT_SAS_JEU', 					0,						0,						0,			30,				0,					3,				'SAS_ASMAT_ICON_ATLAS');
------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceTypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,				ResourceType)
SELECT	'IMPROVEMENT_SAS_JEU', 		ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FORT';
------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_SAS_JEU',		'YIELD_CULTURE',	1),
		('IMPROVEMENT_SAS_JEU',		'YIELD_FOOD',		1);
------------------------------------------------------------------------------------------------------------------------
-- Improvement_AdjacentCityYields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_AdjacentCityYields
		(ImprovementType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_SAS_JEU',		'YIELD_CULTURE',	1),
		('IMPROVEMENT_SAS_JEU',		'YIELD_FOOD',		1);
------------------------------------------------------------------------------------------------------------------------
-- Improvement_TechYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,				TechType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_SAS_JEU',		'TECH_FLIGHT',		'YIELD_CULTURE',	1),
		('IMPROVEMENT_SAS_JEU',		'TECH_FLIGHT',		'YIELD_GOLD',	2);
------------------------------------------------------------------------------------------------------------------------
-- Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Builds
		(Type,				PrereqTech,			ImprovementType, 			HotKey, EntityEvent, Kill, CtrlDown, OrderPriority,	Time, Description,					Help,								Recommendation,						IconIndex,  IconAtlas)
SELECT	'BUILD_SAS_JEU',	'TECH_CONSTRUCTION',	'IMPROVEMENT_SAS_JEU',	HotKey,	EntityEvent, Kill, CtrlDown, 96,			Time, 'TXT_KEY_BUILD_SAS_JEU',	'TXT_KEY_BUILD_SAS_JEU_HELP',	'TXT_KEY_BUILD_SAS_JEU_REC',		4,			'SAS_ASMAT_ICON_ATLAS'
FROM Builds WHERE Type = 'BUILD_KASBAH';
------------------------------------------------------------------------------------------------------------------------	
-- BuildFeatures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildFeatures
		(BuildType, 		FeatureType, PrereqTech, Time, Remove)
SELECT	'BUILD_SAS_JEU',	FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_FORT';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_Builds 	
		(UnitType, 	BuildType)
SELECT	UnitType,	'BUILD_SAS_JEU'
FROM Unit_Builds WHERE BuildType = 'BUILD_FORT';
--------------------------------------------------------------------------------------------------------------------------
--JFD_BosniaTvrtkoI_Unit_Builds
CREATE TRIGGER Sas_Asmat_Unit_Builds
AFTER INSERT ON Unit_Builds 
WHEN NEW.BuildType IN ('BUILD_FORT')
BEGIN
	INSERT INTO Unit_Builds 	
			(UnitType, 		BuildType)
	SELECT	NEW.UnitType,	'BUILD_SAS_JEU'
	WHERE NOT EXISTS (SELECT BuildType FROM Unit_Builds WHERE BuildType = 'BUILD_SAS_JEU' AND UnitType = NEW.UnitType);
END;
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 	ArtDefineTag, 								VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_SAS_FIN',	 'TXT_KEY_LEADER_SAS_FIN',	'TXT_KEY_LEADER_SAS_FIN_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SAS_FIN',	'Sas_Fin_Scene.xml',												6, 						4, 						6, 							9, 			4, 				3, 				6, 						7, 				4, 			6, 			1, 				4, 			8, 			'SAS_ASMAT_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_FIN',	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_SAS_FIN',	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_SAS_FIN',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
		('LEADER_SAS_FIN',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_SAS_FIN',	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_SAS_FIN',	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_SAS_FIN',	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_FIN',	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_SAS_FIN',	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_SAS_FIN',	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_SAS_FIN',	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_SAS_FIN',	'MINOR_CIV_APPROACH_BULLY', 		7);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_SAS_FIN',	'FLAVOR_OFFENSE', 					6),
		('LEADER_SAS_FIN',	'FLAVOR_DEFENSE', 					8),
		('LEADER_SAS_FIN',	'FLAVOR_CITY_DEFENSE', 				8),
		('LEADER_SAS_FIN',	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_SAS_FIN',	'FLAVOR_RECON', 					6),
		('LEADER_SAS_FIN',	'FLAVOR_RANGED', 					8),
		('LEADER_SAS_FIN',	'FLAVOR_MOBILE', 					6),
		('LEADER_SAS_FIN',	'FLAVOR_NAVAL', 					8),
		('LEADER_SAS_FIN',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_SAS_FIN',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_SAS_FIN',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_SAS_FIN',	'FLAVOR_AIR', 						7),
		('LEADER_SAS_FIN',	'FLAVOR_EXPANSION', 				7),
		('LEADER_SAS_FIN',	'FLAVOR_GROWTH', 					8),
		('LEADER_SAS_FIN',	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_SAS_FIN',	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_SAS_FIN',	'FLAVOR_PRODUCTION', 				7),
		('LEADER_SAS_FIN',	'FLAVOR_GOLD', 						5),
		('LEADER_SAS_FIN',	'FLAVOR_SCIENCE', 					6),
		('LEADER_SAS_FIN',	'FLAVOR_CULTURE', 					6),
		('LEADER_SAS_FIN',	'FLAVOR_HAPPINESS', 				8),
		('LEADER_SAS_FIN',	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_SAS_FIN',	'FLAVOR_WONDER', 					5),
		('LEADER_SAS_FIN',	'FLAVOR_RELIGION', 					6),
		('LEADER_SAS_FIN',	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_SAS_FIN',	'FLAVOR_SPACESHIP', 				6),
		('LEADER_SAS_FIN',	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_SAS_FIN',	'FLAVOR_NUKE', 						7),
		('LEADER_SAS_FIN',	'FLAVOR_USE_NUKE', 					7),
		('LEADER_SAS_FIN',	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_SAS_FIN',	'FLAVOR_AIRLIFT', 					9),
		('LEADER_SAS_FIN',	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_SAS_FIN',	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_SAS_FIN',	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_SAS_FIN',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_SAS_FIN',	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_SAS_FIN',	'FLAVOR_AIR_CARRIER', 				2);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SAS_FIN',	'TRAIT_SAS_FIN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription)
VALUES	('TRAIT_SAS_FIN',  'TXT_KEY_TRAIT_SAS_ASMAT',	 'TXT_KEY_TRAIT_SAS_ASMAT_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 								Response, 															Bias)
VALUES	('LEADER_SAS_FIN',	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_SAS_FIN_DEFEATED%', 						500),
		('LEADER_SAS_FIN',	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_SAS_FIN_FIRSTGREETING%', 					500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_SAS_ASMAT',		SoundtrackTag, 		'SasAsmat412.dds',		'TXT_KEY_CIV_DAWN_SAS_ASMAT_TEXT',	'Sas_Fin_DOM.dds',	'TXT_KEY_CIV_SAS_ASMAT_DESC', 	'TXT_KEY_CIV_SAS_ASMAT_SHORT_DESC',	'TXT_KEY_CIV_SAS_ASMAT_ADJECTIVE',	'TXT_KEY_CIV5_SAS_ASMAT_HEADING_1',		'TXT_KEY_CIV5_SAS_ASMAT',		'PLAYERCOLOR_SAS_ASMAT',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SAS_ASMAT_ICON_ATLAS',	0,				'SAS_ASMAT_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_0'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_1'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_2'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_3'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_4'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_5'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_6'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_7'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_8'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_SPY_NAME_CIV_SAS_ASMAT_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_1'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_2'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_3'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_4'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_5'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_6'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_7'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_8'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_9'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_10'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_11'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_12'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_13'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_14'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_15'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_16'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_17'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_18'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_19'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_20'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_21'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_22'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_23'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_24'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_25'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_26'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_27'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_28'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_29'),
		('CIVILIZATION_SAS_ASMAT',	'TXT_KEY_CITY_NAME_SAS_ASMAT_30');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_SAS_ASMAT', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_SAS_ASMAT', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SAS_ASMAT', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_SAS_ASMAT',	'LEADER_SAS_FIN');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_SAS_ASMAT', 	'UNITCLASS_CROSSBOWMAN',			'UNIT_SAS_HEADHUNTER');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_SAS_ASMAT',	'REGION_JUNGLE');