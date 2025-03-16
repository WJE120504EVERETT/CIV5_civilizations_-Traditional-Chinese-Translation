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
VALUES	('BUILDINGCLASS_DUMMY_JFD_INCA_ATAHUALPA', 	'BUILDING_DUMMY_JFD_INCA_ATAHUALPA');

UPDATE BuildingClasses
SET Description = 'TXT_KEY_' || DefaultBuilding
WHERE DefaultBuilding = 'BUILDING_DUMMY_JFD_INCA_ATAHUALPA';
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, GoldMaintenance, FreeStartEra, PrereqTech, TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, MinAreaSize, ConquestProb, HurryCostModifier, NeverCapture,  Description, 					 Help, 								  Strategy,									Civilopedia, 						 ArtDefineTag, DisplayPosition, IconAtlas,						  PortraitIndex)
SELECT	'BUILDING_JFD_TAMBO',	BuildingClass, Cost, GoldMaintenance, FreeStartEra, PrereqTech, TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, MinAreaSize, ConquestProb, HurryCostModifier, 1, 			  'TXT_KEY_BUILDING_JFD_TAMBO',  'TXT_KEY_BUILDING_JFD_TAMBO_HELP',   'TXT_KEY_BUILDING_JFD_TAMBO_STRATEGY',	'TXT_KEY_BUILDING_JFD_TAMBO_TEXT',   ArtDefineTag, DisplayPosition, 'JFD_INCA_ATAHUALPA_ICON_ATLAS',  3
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	

UPDATE Buildings
SET PrereqTech = 'TECH_MATHEMATICS'
WHERE Type = 'BUILDING_JFD_TAMBO';
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,	Flavor)
SELECT	'BUILDING_JFD_TAMBO',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CARAVANSARY';

INSERT INTO Building_Flavors 										 
		(BuildingType, 			FlavorType,					 Flavor)
VALUES	('BUILDING_JFD_TAMBO',	'FLAVOR_GOLD',				 20),
		('BUILDING_JFD_TAMBO',	'FLAVOR_I_SEA_TRADE_ROUTE',  10),
		('BUILDING_JFD_TAMBO',	'FLAVOR_I_TRADE_ORIGIN',	 20);	
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 						Description, 					Help, 								Sound, 			    CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			  PediaEntry)
VALUES	('PROMOTION_JFD_TAMBO',		'TXT_KEY_PROMOTION_JFD_TAMBO',	'TXT_KEY_PROMOTION_JFD_TAMBO_HELP',	'AS2D_IF_LEVELUP',  1, 			    59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_TAMBO');

UPDATE UnitPromotions
SET EnemyRoute = 1
WHERE Type = 'PROMOTION_JFD_TAMBO';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 			    CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			  PediaEntry)
VALUES	('PROMOTION_JFD_APUQUISPAY',	'TXT_KEY_PROMOTION_JFD_APUQUISPAY',		'TXT_KEY_PROMOTION_JFD_APUQUISPAY_HELP',	'AS2D_IF_LEVELUP',  1, 			    59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_APUQUISPAY'),
		('PROMOTION_JFD_APUQUISPAY_1',	'TXT_KEY_PROMOTION_JFD_APUQUISPAY_1',	'TXT_KEY_PROMOTION_JFD_APUQUISPAY_1_HELP',	'AS2D_IF_LEVELUP',  1, 			    59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_APUQUISPAY_1'),
		('PROMOTION_JFD_APUQUISPAY_2',	'TXT_KEY_PROMOTION_JFD_APUQUISPAY_2',	'TXT_KEY_PROMOTION_JFD_APUQUISPAY_2_HELP',	'AS2D_IF_LEVELUP',  1, 			    59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_APUQUISPAY_2');

UPDATE UnitPromotions
SET GreatGeneralCombatModifier = 15
WHERE Type = 'PROMOTION_JFD_APUQUISPAY_1';

UPDATE UnitPromotions
SET AdjacentMod = 15
WHERE Type = 'PROMOTION_JFD_APUQUISPAY_2';
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class, CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 								 Strategy, 									Civilopedia, 					    ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					UnitFlagAtlas, 							UnitFlagIconOffset, IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_APUQUISPAY',	Class, CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_APUQUISPAY',	'TXT_KEY_UNIT_JFD_APUQUISPAY_HELP',  'TXT_KEY_UNIT_JFD_APUQUISPAY_STRATEGY',    'TXT_KEY_UNIT_JFD_APUQUISPAY_TEXT', ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_APUQUISPAY',	'JFD_INCA_ATAHUALPA_UNIT_FLAG_ATLAS',	0,					'JFD_INCA_ATAHUALPA_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';    
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_APUQUISPAY',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_APUQUISPAY',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_JFD_APUQUISPAY', 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_APUQUISPAY',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_APUQUISPAY',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_APUQUISPAY',	'PROMOTION_JFD_APUQUISPAY');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 				UniqueName)
VALUES	('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_01'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_02'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_03'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_04'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_05'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_06'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_07'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_08'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_09'),
		('UNIT_JFD_APUQUISPAY', 'TXT_KEY_GREAT_PERSON_JFD_APUQUISPAY_10');
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 					IconAtlas, 							PortraitIndex)
VALUES	('LEADER_JFD_INCA_ATAHUALPA', 	'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA',	'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_INCA_ATAHUALPA', 	'JFD_IncaAtahualpa_Scene.xml',	'JFD_INCA_ATAHUALPA_ICON_ATLAS',    1);

UPDATE Leaders
SET VictoryCompetitiveness = 7,
WonderCompetitiveness = 2,
MinorCivCompetitiveness = 4,
Boldness = 6,
DiploBalance = 5,
WarmongerHate = 5,
DenounceWillingness = 7,
DoFWillingness = 5,
Loyalty = 4,
Neediness = 5,
Forgiveness = 4,
Chattiness = 5,
Meanness = 5
WHERE Type = 'LEADER_JFD_INCA_ATAHUALPA';
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_INCA_ATAHUALPA', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------ 				
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_INCA_ATAHUALPA', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JFD_INCA_ATAHUALPA', 	'MINOR_CIV_APPROACH_BULLY', 		5);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_RECON', 					5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_AIR', 						5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_RELIGION', 					5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_SPACESHIP', 				5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_USE_NUKE', 					4),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_I_TRADE_DESTINATION', 		7),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		4),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_INCA_ATAHUALPA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																		Bias)
VALUES 	('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 				'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_DEFEATED%', 					 				500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_DOW_GENERIC%', 				 				500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 		500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_LUXURY_TRADE%', 		  						500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_REQUEST%', 		  							500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_TOO_SOON_FOR_DOF%', 							500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_DENOUNCE%', 					  				500),
		('LEADER_JFD_INCA_ATAHUALPA',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_INCA_ATAHUALPA_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_INCA_ATAHUALPA',		'TRAIT_JFD_INCA_ATAHUALPA');
------------------------------------------------------------------------------------------------------------------------ 
-- Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_JFD_INCA_ATAHUALPA', 		'TXT_KEY_TRAIT_JFD_INCA_ATAHUALPA',	'TXT_KEY_TRAIT_JFD_INCA_ATAHUALPA_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------ 
-- Civilizations
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,			SoundtrackTag,  MapImage, 						DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,									 Civilopedia, CivilopediaTag, DefaultPlayerColor,				 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_INCA_ATAHUALPA',	'CIVILIZATION_INCA',	'Inca', 		'JFD_MapIncaAtahualpa512.dds',	'TXT_KEY_CIV_DAWN_JFD_INCA_ATAHUALPA_TEXT',		'JFD_DOM_IncaAtahualpa.dds',	'TXT_KEY_CIV_JFD_INCA_ATAHUALPA_DESC', 		'TXT_KEY_CIV_JFD_INCA_ATAHUALPA_SHORT_DESC',	'TXT_KEY_CIV_JFD_INCA_ATAHUALPA_ADJECTIVE',	 Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_INCA_ATAHUALPA',	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_INCA_ATAHUALPA_ICON_ATLAS',	0,				'JFD_INCA_ATAHUALPA_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_INCA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_01'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_02'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_03'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_04'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_05'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_06'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_07'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_08'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_09'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_10'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_11'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_12'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_13'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_14'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_15'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_16'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_17'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_18'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_19'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_20'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_21'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_22'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_23'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_24'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_25'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_26'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_27'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_28'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_29'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_30'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_31'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_32'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_33'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_34'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_35'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_36'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_37'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_38'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_39'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_CITY_NAME_JFD_INCA_ATAHUALPA_40');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_INCA_ATAHUALPA',		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_INCA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_INCA_ATAHUALPA',		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_INCA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_INCA_ATAHUALPA', 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_INCA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_INCA_ATAHUALPA',		'LEADER_JFD_INCA_ATAHUALPA');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_INCA_ATAHUALPA',		'BUILDINGCLASS_CARAVANSARY', 	'BUILDING_JFD_TAMBO');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_JFD_INCA_ATAHUALPA',		'UNITCLASS_GREAT_GENERAL',		'UNIT_JFD_APUQUISPAY');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_INCA_ATAHUALPA',		'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_0'),	
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_1'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_2'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_3'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_4'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_5'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_6'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_7'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_8'),
		('CIVILIZATION_JFD_INCA_ATAHUALPA',		'TXT_KEY_SPY_NAME_JFD_INCA_ATAHUALPA_9');
--=======================================================================================================================
--=======================================================================================================================