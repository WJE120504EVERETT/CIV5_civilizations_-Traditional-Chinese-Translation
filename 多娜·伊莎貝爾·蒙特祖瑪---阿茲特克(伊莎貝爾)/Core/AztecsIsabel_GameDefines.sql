--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass, PrereqTech,	    Cost, SpecialistType, SpecialistCount, FaithCost, GoldMaintenance,   MinAreaSize, NeverCapture, Description, 									Help, 												Strategy,												Civilopedia, 									   ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_AUGUSTINIAN_FRIARY',	BuildingClass, 'TECH_THEOLOGY', Cost, SpecialistType, SpecialistCount, FaithCost, GoldMaintenance-1, MinAreaSize, 1, 			  'TXT_KEY_BUILDING_JFD_AUGUSTINIAN_FRIARY', 	'TXT_KEY_BUILDING_JFD_AUGUSTINIAN_FRIARY_HELP', 	'TXT_KEY_BUILDING_JFD_AUGUSTINIAN_FRIARY_STRATEGY',	'TXT_KEY_BUILDING_JFD_AUGUSTINIAN_FRIARY_TEXT',   ArtDefineTag, 3, 			'JFD_AZTECS_ISABEL_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';		
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 						YieldType, Yield)
SELECT	'BUILDING_JFD_AUGUSTINIAN_FRIARY',	YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_UNIVERSITY';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 		
		(BuildingType, 						YieldType, Yield)
SELECT	'BUILDING_JFD_AUGUSTINIAN_FRIARY',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_FeatureYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_FeatureYieldChanges 	
		(BuildingType, 						FeatureType, YieldType, Yield)
SELECT	'BUILDING_JFD_AUGUSTINIAN_FRIARY',	FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 						ResourceType, YieldType, Yield)
SELECT	'BUILDING_JFD_AUGUSTINIAN_FRIARY',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
--INSERT INTO Building_ClassesNeededInCity 	
--		(BuildingType, 						BuildingClassType)
--SELECT	'BUILDING_JFD_AUGUSTINIAN_FRIARY',	BuildingClassType
--FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_UNIVERSITY';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType, Flavor)
SELECT	'BUILDING_JFD_AUGUSTINIAN_FRIARY',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_UNIVERSITY';

INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,			Flavor)
VALUES	('BUILDING_JFD_AUGUSTINIAN_FRIARY',	'FLAVOR_RELIGION',  20);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost,	  Combat, MoveAfterPurchase, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 								Civilopedia, 						ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 				UnitFlagAtlas, 							UnitFlagIconOffset, IconAtlas,						PortraitIndex)
SELECT	'UNIT_JFD_TLACOTIN',	Class,	CombatClass, PrereqTech, Cost+30, Combat, 1,				 RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_TLACOTIN',	'TXT_KEY_UNIT_JFD_TLACOTIN_HELP', 	'TXT_KEY_UNIT_JFD_TLACOTIN_STRATEGY',	'TXT_KEY_UNIT_JFD_TLACOTIN_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_TLACOTIN',	'JFD_AZTECS_ISABEL_UNIT_FLAG_ATLAS',	0,					'JFD_AZTECS_ISABEL_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_WORKER';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_TLACOTIN',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_TLACOTIN',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_TLACOTIN',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_TLACOTIN',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_WORKER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 
		(UnitType,				BuildType)
SELECT	'UNIT_JFD_TLACOTIN',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER';
--------------------------------------------------------------------------------------------------------------------------
--JFD_AztecsIsabel_Unit_Builds
CREATE TRIGGER JFD_AztecsIsabel_Unit_Builds
AFTER INSERT ON Unit_Builds 
WHEN NEW.UnitType IN ('UNIT_WORKER')
BEGIN
	INSERT INTO Unit_Builds 
			(UnitType,				BuildType)
	VALUES	('UNIT_JFD_TLACOTIN',	NEW.BuildType);
END;
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
--INSERT INTO Unit_ResourceQuantityRequirements
--		(UnitType, 				ResourceType,		Cost)
--SELECT	'UNIT_JFD_TLACOTIN',		ResourceType,		Cost
--FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_TLACOTIN',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_WORKER';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_AZTECS_ISABEL',	 'TXT_KEY_LEADER_JFD_AZTECS_ISABEL',	'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_AZTECS_ISABEL',	'JFD_AztecsIsabel_Scene.xml',	2, 						2, 						2, 							2, 			5, 				5, 				2, 						9, 				8, 			8, 			7, 				5, 			5, 			'JFD_AZTECS_ISABEL_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_AZTECS_ISABEL',	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_JFD_AZTECS_ISABEL',	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_JFD_AZTECS_ISABEL',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_AZTECS_ISABEL',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_AZTECS_ISABEL',	'MAJOR_CIV_APPROACH_AFRAID', 		8),
		('LEADER_JFD_AZTECS_ISABEL',	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_AZTECS_ISABEL',	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_AZTECS_ISABEL',	'MINOR_CIV_APPROACH_IGNORE', 		8),
		('LEADER_JFD_AZTECS_ISABEL',	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_AZTECS_ISABEL',	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_AZTECS_ISABEL',	'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_JFD_AZTECS_ISABEL',	'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_RECON', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_NAVAL', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_NAVAL_RECON', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_AIR', 						5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_TILE_IMPROVEMENT', 			9),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_WONDER', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_RELIGION', 					8),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_AZTECS_ISABEL',	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_AZTECS_ISABEL',	'TRAIT_JFD_AZTECS_ISABEL');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription)
VALUES	('TRAIT_JFD_AZTECS_ISABEL',  'TXT_KEY_TRAIT_JFD_AZTECS_ISABEL',	 'TXT_KEY_TRAIT_JFD_AZTECS_ISABEL_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 								Response, 															Bias)
VALUES 	('LEADER_JFD_AZTECS_ISABEL',	'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_DENOUNCE_FRIEND%', 				500),
		('LEADER_JFD_AZTECS_ISABEL',	'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_ATTACKED_HOSTILE%', 				500),
		('LEADER_JFD_AZTECS_ISABEL',	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_DEFEATED%', 						500),
		('LEADER_JFD_AZTECS_ISABEL',	'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_DOW_GENERIC%', 					500),
		('LEADER_JFD_AZTECS_ISABEL',	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_FIRSTGREETING%', 					500),
		('LEADER_JFD_AZTECS_ISABEL',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_JFD_AZTECS_ISABEL',	'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_DENOUNCE%', 						500),
		('LEADER_JFD_AZTECS_ISABEL',	'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_JFD_AZTECS_ISABEL_DEC_FRIENDSHIP%', 				500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,			Description,							ShortDescription,							Adjective,									Civilopedia,  CivilopediaTag, DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,						SoundtrackTag,  MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_AZTECS_ISABEL',	'CIVILIZATION_AZTEC',	'TXT_KEY_CIV_JFD_AZTECS_ISABEL_DESC',	'TXT_KEY_CIV_JFD_AZTECS_ISABEL_SHORT_DESC',	'TXT_KEY_CIV_JFD_AZTECS_ISABEL_ADJECTIVE',	Civilopedia,  CivilopediaTag, 'PLAYERCOLOR_JFD_AZTECS_ISABEL',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_AZTECS_ISABEL_ICON_ATLAS',	0,				'JFD_AZTECS_ISABEL_ALPHA_ATLAS',	'Aztec', 		'JFD_MapAztecsIsabel512.dds',	'TXT_KEY_CIV5_DAWN_JFD_AZTECS_ISABEL_TEXT',	'JFD_DOM_AztecsIsabel.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_AZTEC';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_AZTECS_ISABEL',  'TXT_KEY_CITY_NAME_JFD_AZTECS_ISABEL_01');

INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
SELECT	'CIVILIZATION_JFD_AZTECS_ISABEL', 	CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_AZTEC';
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_JFD_AZTECS_ISABEL' AND CityName = 'TXT_KEY_CITY_NAME_TENOCHTITLAN';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_AZTECS_ISABEL', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_AZTECS_ISABEL', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_AZTECS_ISABEL', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_AZTECS_ISABEL',	'LEADER_JFD_AZTECS_ISABEL');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_AZTECS_ISABEL', 	'UNITCLASS_WORKER',			'UNIT_JFD_TLACOTIN');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_AZTECS_ISABEL', 	'BUILDINGCLASS_UNIVERSITY',	'BUILDING_JFD_AUGUSTINIAN_FRIARY');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
--INSERT INTO Civilization_Religions 
--		(CivilizationType, 					ReligionType)
--VALUES	('CIVILIZATION_JFD_AZTECS_ISABEL',	'RELIGION_CHRISTIANITY');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
SELECT	'CIVILIZATION_JFD_AZTECS_ISABEL', 	SpyName
FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--==========================================================================================================================
--==========================================================================================================================
