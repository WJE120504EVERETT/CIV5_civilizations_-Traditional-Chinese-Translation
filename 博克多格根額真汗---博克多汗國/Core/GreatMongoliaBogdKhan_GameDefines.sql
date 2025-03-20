--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 									BuildingClass, PrereqTech, Cost, Happiness, HurryCostModifier, DisplayPosition, MinAreaSize, ConquestProb, NeverCapture, Description, 									Help, 												Strategy,												Civilopedia, 										PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JFD_GATE_PEACE_HAPPINESS',	BuildingClass, PrereqTech, Cost, Happiness, HurryCostModifier, DisplayPosition, MinAreaSize, ConquestProb, 1, 			  'TXT_KEY_BUILDING_JFD_GATE_PEACE_HAPPINESS', 	'TXT_KEY_BUILDING_JFD_GATE_PEACE_HAPPINESS_HELP',   'TXT_KEY_BUILDING_JFD_GATE_PEACE_HAPPINESS_STRATEGY',	'TXT_KEY_BUILDING_JFD_GATE_PEACE_HAPPINESS_TEXT',	3, 				'JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 							 FlavorType, Flavor)
SELECT	'BUILDING_JFD_GATE_PEACE_HAPPINESS',	 FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,				Flavor)
VALUES	('BUILDING_JFD_GATE_PEACE_HAPPINESS',	'FLAVOR_HAPPINESS',		50);
------------------------------------------------------------------------------------------------------------------------	
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
		(Type, 						 						DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_GATE_PEACE_HAPPINESS',	'BUILDING_DUMMY_JFD_GATE_PEACE_HAPPINESS',	'TXT_KEY_BUILDING_DUMMY_JFD_GATE_PEACE_HAPPINESS');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 											BuildingClass,										GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,										Help, 													NeverCapture)
VALUES	('BUILDING_DUMMY_JFD_GATE_PEACE_HAPPINESS',		'BUILDINGCLASS_DUMMY_JFD_GATE_PEACE_HAPPINESS',		-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_GATE_PEACE_HAPPINESS',	'TXT_KEY_BUILDING_DUMMY_JFD_GATE_PEACE_HAPPINESS_HELP',	1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 									YieldType,			Yield)
VALUES	('BUILDING_DUMMY_JFD_GATE_PEACE_HAPPINESS',		'YIELD_FAITH',		1);		
------------------------------------------------------------------------------------------------------------------------	
-- Building_CityToolTipYieldFromOther
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Building_CityToolTipYieldFromOther(BuildingType, YieldType, Yield integer);
INSERT INTO Building_CityToolTipYieldFromOther
		(BuildingType, 									YieldType,			Yield)
VALUES	('BUILDING_DUMMY_JFD_GATE_PEACE_HAPPINESS',		'YIELD_FAITH',		1);		
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 									GreatGeneralCombatModifier,	LostWithUpgrade,  Description, 										Help, 												Sound, 				 CannotBeChosen,  PortraitIndex, IconAtlas, 		 PediaType, 		 PediaEntry)
VALUES	('PROMOTION_JFD_MANLAIBAATAR_ACTIVE', 	100,						0,				  'TXT_KEY_PROMOTION_JFD_MANLAIBAATAR_ACTIVE',		'TXT_KEY_PROMOTION_JFD_MANLAIBAATAR_ACTIVE_HELP',	'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_MANLAIBAATAR_ACTIVE'),
		('PROMOTION_JFD_MANLAIBAATAR_INACTIVE', 0,							0,				  'TXT_KEY_PROMOTION_JFD_MANLAIBAATAR_INACTIVE',	'TXT_KEY_PROMOTION_JFD_MANLAIBAATAR_INACTIVE_HELP',	'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_MANLAIBAATAR_INACTIVE');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombats 	
		(PromotionType, 						UnitCombatType)
SELECT	'PROMOTION_JFD_MANLAIBAATAR_ACTIVE',	UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_EMBARKATION';
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class, CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves,   CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 						Help, 									Strategy, 									Civilopedia, 							ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					UnitFlagAtlas, 								UnitFlagIconOffset, IconAtlas,								PortraitIndex)
SELECT	'UNIT_JFD_MANLAIBAATAR',	Class, CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves+2, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_MANLAIBAATAR',	'TXT_KEY_UNIT_JFD_MANLAIBAATAR_HELP',   'TXT_KEY_UNIT_JFD_MANLAIBAATAR_STRATEGY',   'TXT_KEY_UNIT_JFD_MANLAIBAATAR_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_MANLAIBAATAR',	'JFD_GREAT_MONGOLIA_BOGD_KHAN_UNIT_FLAG_ATLAS',	0,					'JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';      
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_MANLAIBAATAR',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_MANLAIBAATAR',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 					BuildType)
SELECT	'UNIT_JFD_MANLAIBAATAR', 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_MANLAIBAATAR',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_MANLAIBAATAR',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_MANLAIBAATAR',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 					UniqueName)
VALUES	('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_1'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_2'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_3'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_4'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_5'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_6'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_7'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_8'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_9'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_10'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_11'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_12'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_13'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_14'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_15'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_16'),
		('UNIT_JFD_MANLAIBAATAR', 	'TXT_KEY_GREAT_PERSON_JFD_MANLAIBAATAR_17');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 										Description, 									Civilopedia, 											CivilopediaTag, 												ArtDefineTag, 							IconAtlas, 									PortraitIndex)
VALUES	('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'JFD_GreatMongoliaBogdKhan_Scene.xml',	'JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 2,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 6,
Boldness = 1,
DiploBalance = 5,
WarmongerHate = 7,
DenounceWillingness = 1,
DoFWillingness = 8,
Loyalty = 8,
Neediness = 9,
Forgiveness = 8,
Chattiness = 7,
Meanness = 1
WHERE Type = 'LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN';	
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 								MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		1),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		8),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 								MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		1),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'MINOR_CIV_APPROACH_BULLY', 		1);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 								FlavorType, 						Flavor)
VALUES	('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_RECON', 					6),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_HAPPINESS', 				8),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_WONDER', 					5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_RELIGION', 					12),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 								ResponseType, 							 			Response, 																			Bias)
VALUES 	('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_DENOUNCE_FRIEND%', 			 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_ATTACKED_HOSTILE%', 			 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_ATTACKED_HOSTILE%', 			 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_DEFEATED%', 					 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_DOW_GENERIC%', 				 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_FIRSTGREETING%', 				 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_LUXURY_TRADE%', 		  				500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_OPEN_BORDERS_EXCHANGE%', 		  		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_PLOT_BUYING_SERIOUS_WARNING%', 		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_REQUEST%', 		  					500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_TOO_SOON_FOR_DOF%', 					500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_TOO_SOON_NO_PEACE%', 			  		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_DENOUNCE%', 					  		500),
		('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 								TraitType)
VALUES	('LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'TRAIT_JFD_GREAT_MONGOLIA_BOGD_KHAN');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 									Description, 									ShortDescription)
VALUES	('TRAIT_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_TRAIT_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_TRAIT_JFD_GREAT_MONGOLIA_BOGD_KHAN_SHORT');	
------------------------------------------------------------------------------------------------------------------------
-- Trait_FreePromotionUnitCombats
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_FreePromotionUnitCombats 
		(TraitType, 							PromotionType,							UnitCombatType)
SELECT	'TRAIT_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'PROMOTION_JFD_MANLAIBAATAR_INACTIVE',	UnitCombatType
FROM Trait_FreePromotionUnitCombats WHERE PromotionType = 'TRAIT_GREAT_EXPANSE';
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 													Description, 													Help, 																Sound, 				 CityAttack, CannotBeChosen, PortraitIndex, IconAtlas, 		 PediaType, 		  PediaEntry)
SELECT	'PROMOTION_JFD_GREAT_MONGOLIA_BOGD_KHAN_GREAT_PROPHET',	'TXT_KEY_PROMOTION_JFD_GREAT_MONGOLIA_BOGD_KHAN_GREAT_PROPHET',	'TXT_KEY_PROMOTION_JFD_GREAT_MONGOLIA_BOGD_KHAN_GREAT_PROPHET_HELP',   'AS2D_IF_LEVELUP', 	 0,			 1, 			 59, 			'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_GREAT_MONGOLIA_BOGD_KHAN_GREAT_PROPHET'
WHERE NOT EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'API_UNIFIED_YIELDS' AND Value = 1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations 	
		(Type, 											DerivativeCiv,			SoundtrackTag,  MapImage, 								DawnOfManQuote, 										DawnOfManImage,							Description,										ShortDescription,										Adjective,												Civilopedia,	CivilopediaTag,	DefaultPlayerColor,							ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,									PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'CIVILIZATION_MONGOL',	'Mongol', 		'JFD_MapGreatMongoliaBogdKhan512.dds',	'TXT_KEY_CIV_DAWN_JFD_GREAT_MONGOLIA_BOGD_KHAN_TEXT',	'JFD_DOM_GreatMongoliaBogdKhan.dds',	'TXT_KEY_CIV_JFD_GREAT_MONGOLIA_BOGD_KHAN_DESC',	'TXT_KEY_CIV_JFD_GREAT_MONGOLIA_BOGD_KHAN_SHORT_DESC',	'TXT_KEY_CIV_JFD_GREAT_MONGOLIA_BOGD_KHAN_ADJECTIVE',	Civilopedia,	CivilopediaTag,	'PLAYERCOLOR_JFD_GREAT_MONGOLIA_BOGD_KHAN',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_GREAT_MONGOLIA_BOGD_KHAN_ICON_ATLAS',	0,				'JFD_GREAT_MONGOLIA_BOGD_KHAN_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 								CityName)
VALUES	('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_1'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_2'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_3'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_4'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_5'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_6'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_7'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_8'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_9'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_10'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_11'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_12'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_13'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_14'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_15'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_16'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_17'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_18'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_19'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_20'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_21'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_22'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_23'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_24'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_25'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_26'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_27'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_28'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_29'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_30'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_31'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_32'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_CITY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_33');

INSERT INTO Civilization_CityNames
		(CivilizationType, 								CityName)
SELECT	'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType, 								BuildingClassType)
SELECT	'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeTechs
		(CivilizationType, 								TechType)
SELECT	'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeUnits
		(CivilizationType, 								UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions
		(CivilizationType, 								ReligionType)
VALUES	('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'RELIGION_BUDDHISM');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Leaders
		(CivilizationType, 								LeaderheadType)
VALUES	('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'LEADER_JFD_GREAT_MONGOLIA_BOGD_KHAN');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 								BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'BUILDINGCLASS_TEMPLE', 		'BUILDING_JFD_GATE_PEACE_HAPPINESS');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 								UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'UNITCLASS_GREAT_GENERAL',		'UNIT_JFD_MANLAIBAATAR');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames
		(CivilizationType, 								SpyName)
VALUES	('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_0'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_1'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_2'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_3'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_4'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_5'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_6'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_7'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_8'),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'TXT_KEY_SPY_NAME_JFD_GREAT_MONGOLIA_BOGD_KHAN_9');
--==========================================================================================================================
--==========================================================================================================================