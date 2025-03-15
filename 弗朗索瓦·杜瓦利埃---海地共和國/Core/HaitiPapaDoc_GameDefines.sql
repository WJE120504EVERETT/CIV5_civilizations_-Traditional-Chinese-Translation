--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding)
VALUES	('BUILDINGCLASS_DUMMY_JFD_HAITI_PAPA_DOC', 	'BUILDING_DUMMY_JFD_HAITI_PAPA_DOC');

UPDATE BuildingClasses
SET Description = 'TXT_KEY_' || DefaultBuilding
WHERE DefaultBuilding = 'BUILDING_DUMMY_JFD_HAITI_PAPA_DOC';
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================		
------------------------------------------------------------------------------------------------------------------------ 	
-- Buildings
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Buildings 	
		(Type, 						BuildingClass,  PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, GreatPeopleRateModifier, HurryCostModifier, NeverCapture, 	Description, 						Help, 									Strategy,									Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_HOUNFOUR',	BuildingClass,  PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, GreatPeopleRateModifier, HurryCostModifier, 1, 				'TXT_KEY_BUILDING_JFD_HOUNFOUR', 	'TXT_KEY_BUILDING_JFD_HOUNFOUR_HELP', 	'TXT_KEY_BUILDING_JFD_HOUNFOUR_STRATEGY',	'TXT_KEY_BUILDING_JFD_HOUNFOUR_TEXT',	ArtDefineTag, 3, 			 'JFD_HAITI_PAPA_DOC_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

UPDATE Buildings
SET GoldMaintenance = 0
WHERE Type = 'BUILDING_JFD_HOUNFOUR';
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_HOUNFOUR',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_HOUNFOUR',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';
------------------------------------------------------------------------------------------------------------------------ 	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_HOUNFOUR',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, 		Flavor)
VALUES	('BUILDING_JFD_HOUNFOUR',	'FLAVOR_GROWTH',	10);	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 						 			BuildingClass)
VALUES	('BUILDING_DUMMY_JFD_HOUNFOUR',			'BUILDINGCLASS_DUMMY_JFD_HAITI_PAPA_DOC');

UPDATE Buildings
SET Description = 'TXT_KEY_' || Type, 
Help = Description = 'TXT_KEY_' || Type || '_HELP',
GreatWorkCount = -1, 
Cost = -1, 
FaithCost = -1, 
PrereqTech = NULL, 
NeverCapture = 1
WHERE Type IN ('BUILDING_DUMMY_JFD_HOUNFOUR');

UPDATE Buildings
SET BuildingProductionModifier = 1
WHERE Type IN ('BUILDING_DUMMY_JFD_HOUNFOUR');
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 						LostWithUpgrade,  Description, 						Help, 									Sound, 				 CannotBeChosen,  PortraitIndex, IconAtlas, 		 PediaType, 		 PediaEntry)
VALUES	('PROMOTION_JFD_TONTON', 	0,				  'TXT_KEY_PROMOTION_JFD_TONTON',	'TXT_KEY_PROMOTION_JFD_TONTON_HELP',	'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TONTON');
------------------------------------------------------------------------------------------------------------------------	
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 				Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 				Help, 							Strategy, 							Civilopedia, 					UnitArtInfo, 				UnitFlagAtlas,							 UnitFlagIconOffset,	IconAtlas,							 PortraitIndex)
SELECT	'UNIT_JFD_TONTON',	Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_TONTON',	'TXT_KEY_UNIT_JFD_TONTON_HELP', 	'TXT_KEY_UNIT_JFD_TONTON_STRATEGY', 	'TXT_KEY_UNIT_JFD_TONTON_TEXT',	'ART_DEF_UNIT_JFD_TONTON',	'JFD_HAITI_PAPA_DOC_UNIT_FLAG_ATLAS',  0,						'JFD_HAITI_PAPA_DOC_ICON_ATLAS',	 2
FROM Units WHERE Type = 'UNIT_MARINE';	
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_TONTON',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MARINE';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
VALUES	('UNIT_JFD_TONTON',		'UNITAI_DEFENSE'),
		('UNIT_JFD_TONTON',		'UNITAI_ATTACK');
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_TONTON', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_TONTON',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MARINE';

UPDATE Unit_Flavors
SET Flavor = 15
WHERE UnitType = 'UNIT_JFD_TONTON' AND FlavorType = 'FLAVOR_OFFENSE';

UPDATE Unit_Flavors
SET Flavor = 20
WHERE UnitType = 'UNIT_JFD_TONTON' AND FlavorType = 'FLAVOR_DEFENSE';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,				Flavor)
VALUES	('UNIT_JFD_TONTON',		'FLAVOR_CITY_DEFENSE',	10),
		('UNIT_JFD_TONTON',		'FLAVOR_ESPIONAGE',		20),
		('UNIT_JFD_TONTON',		'FLAVOR_GROWTH',		15),
		('UNIT_JFD_TONTON',		'FLAVOR_HAPPINESS',		15);
------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_TONTON',		'PROMOTION_JFD_TONTON');
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_TONTON', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MARINE';	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 					IconAtlas, 						  PortraitIndex)
VALUES	('LEADER_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC',	'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_HAITI_PAPA_DOC', 	'JFD_HaitiPapaDoc_Scene.xml',	'JFD_HAITI_PAPA_DOC_ICON_ATLAS',  1);

UPDATE Leaders
SET VictoryCompetitiveness = 8,
WonderCompetitiveness = 1,
MinorCivCompetitiveness = 6,
Boldness = 9,
DiploBalance = 2,
WarmongerHate = 5,
DenounceWillingness = 8,
DoFWillingness = 2,
Loyalty = 1,
Neediness = 5,
Forgiveness = 1,
Chattiness = 5,
Meanness = 9
WHERE Type = 'LEADER_JFD_HAITI_PAPA_DOC';
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_HAITI_PAPA_DOC', 		'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	9),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------ 				
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_HAITI_PAPA_DOC', 		'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'MINOR_CIV_APPROACH_BULLY', 		9);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_OFFENSE', 					4),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_CITY_DEFENSE', 				8),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_RECON', 					2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_RANGED', 					2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_AIR', 						2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_EXPANSION', 				7),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_GROWTH', 					8),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_GOLD', 						4),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_HAPPINESS', 				2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_GREAT_PEOPLE', 				2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_WONDER', 					2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_RELIGION', 					8),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_NUKE', 						2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_ESPIONAGE', 				8),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_HAITI_PAPA_DOC', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																		Bias)
VALUES 	('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_ATTACKED_STRONG_HOSTILE', 				'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_DEFEATED%', 					 				500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_DOW_GENERIC%', 				 				500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 		500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_LUXURY_TRADE%', 		  						500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_REQUEST%', 		  							500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_TOO_SOON_FOR_DOF%', 							500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_DENOUNCE%', 					  				500),
		('LEADER_JFD_HAITI_PAPA_DOC',		'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_HAITI_PAPA_DOC_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_HAITI_PAPA_DOC',		'TRAIT_JFD_HAITI_PAPA_DOC');
------------------------------------------------------------------------------------------------------------------------ 
-- Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_JFD_HAITI_PAPA_DOC', 		'TXT_KEY_TRAIT_JFD_HAITI_PAPA_DOC',		 'TXT_KEY_TRAIT_JFD_HAITI_PAPA_DOC_SHORT');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 						 			BuildingClass)
VALUES	('BUILDING_DUMMY_JFD_HAITI_PAPA_DOC',	'BUILDINGCLASS_DUMMY_JFD_HAITI_PAPA_DOC');

UPDATE Buildings
SET Description = 'TXT_KEY_' || Type, 
Help = Description = 'TXT_KEY_' || Type || '_HELP',
GreatWorkCount = -1, 
Cost = -1, 
FaithCost = -1, 
PrereqTech = NULL, 
NeverCapture = 1
WHERE Type IN ('BUILDING_DUMMY_JFD_HAITI_PAPA_DOC');

UPDATE Buildings
SET FoodKept = 10
WHERE Type IN ('BUILDING_DUMMY_JFD_HAITI_PAPA_DOC');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------ 
-- Civilizations
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,						SoundtrackTag,  MapImage, 						DawnOfManQuote, 							DawnOfManImage,				Description,							ShortDescription,								Adjective,									Civilopedia,											CivilopediaTag,									DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_HAITI_PAPA_DOC',		'TXT_KEY_CIV_TAL_JFD_HAITI_DESC',	'France', 		'JFD_MapHaitiPapaDoc512.dds',	'TXT_KEY_CIV_DAWN_JFD_HAITI_PAPA_DOC_TEXT',	'JFD_DOM_HaitiPapaDoc.dds',	'TXT_KEY_CIV_JFD_HAITI_PAPA_DOC_DESC', 	'TXT_KEY_CIV_JFD_HAITI_PAPA_DOC_SHORT_DESC',	'TXT_KEY_CIV_JFD_HAITI_PAPA_DOC_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_HAITI_PAPA_DOC_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_HAITI_PAPA_DOC',	'PLAYERCOLOR_JFD_HAITI_PAPA_DOC',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_HAITI_PAPA_DOC_ICON_ATLAS',	0,				'JFD_HAITI_PAPA_DOC_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_01'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_02'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_03'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_04'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_05'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_06'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_07'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_08'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_09'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_10'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_11'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_12'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_13'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_14'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_15'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_16'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_17'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_18'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_19'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_20'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_21'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_22'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_23'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_24'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_25'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_26'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_27'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_28'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_29'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_30'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_31'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_32'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_33'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_34'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_35'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_36'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_37'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_38'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_39'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_CITY_NAME_JFD_HAITI_PAPA_DOC_40');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_HAITI_PAPA_DOC', 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_HAITI_PAPA_DOC', 		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_HAITI_PAPA_DOC', 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'LEADER_JFD_HAITI_PAPA_DOC');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'BUILDINGCLASS_TEMPLE',		'BUILDING_JFD_HOUNFOUR');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'UNITCLASS_MARINE', 		'UNIT_JFD_TONTON');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_0'),	
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_1'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_2'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_3'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_4'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_5'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_6'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_7'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_8'),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC', 	'TXT_KEY_SPY_NAME_JFD_HAITI_PAPA_DOC_9');
--=======================================================================================================================
--=======================================================================================================================