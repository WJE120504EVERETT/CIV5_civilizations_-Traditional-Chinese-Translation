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
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_JFD_CANADA_KING_0',	'BUILDING_JFD_CANADA_KING_PRODUCTION',		'TXT_KEY_BUILDING_JFD_CANADA_KING'),
		('BUILDINGCLASS_JFD_CANADA_KING_1',	'BUILDING_JFD_CANADA_KING_TRADE_ROUTE_1',	'TXT_KEY_BUILDING_JFD_CANADA_KING'),
		('BUILDINGCLASS_JFD_CANADA_KING_2',	'BUILDING_JFD_CANADA_KING_TRADE_ROUTE_2',	'TXT_KEY_BUILDING_JFD_CANADA_KING'),
		('BUILDINGCLASS_JFD_CANADA_KING_3',	'BUILDING_JFD_CANADA_KING_TRADE_ROUTE_3',	'TXT_KEY_BUILDING_JFD_CANADA_KING');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass, Water, Cost, FaithCost, PrereqTech, GoldMaintenance, MinAreaSize, SpecialistCount, SpecialistType, MutuallyExclusiveGroup, NeverCapture, Description, 								Help, 											Strategy,											Civilopedia, 									ArtDefineTag,	PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	BuildingClass, Water, Cost, FaithCost, PrereqTech, GoldMaintenance, MinAreaSize, SpecialistCount, SpecialistType, MutuallyExclusiveGroup, 1, 			'TXT_KEY_BUILDING_JFD_MERCHANT_SHIPYARD', 	'TXT_KEY_BUILDING_JFD_MERCHANT_SHIPYARD_HELP',	'TXT_KEY_BUILDING_JFD_MERCHANT_SHIPYARD_STRATEGY',	'TXT_KEY_BUILDING_JFD_MERCHANT_SHIPYARD_TEXT',	ArtDefineTag,	2, 				'JFD_CANADA_KING_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_SEAPORT';		
--------------------------------------------------------------------------------------------------------------------------	
-- Building_SeaResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_SeaResourceYieldChanges 	
		(BuildingType, 						YieldType, Yield)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	YieldType, Yield
FROM Building_SeaResourceYieldChanges WHERE BuildingType = 'BUILDING_SEAPORT';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_DomainProductionModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_DomainProductionModifiers 	
		(BuildingType, 						DomainType, Modifier)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	DomainType, Modifier
FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_SEAPORT';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_SEAPORT';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 						YieldType,	Yield)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_SEAPORT';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,	Flavor)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_SEAPORT';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 												Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 							PediaType, 			  PediaEntry)
VALUES	('PROMOTION_JFD_FLOWER_CLASS',			'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS',			'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS_HELP',			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS',					'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS'),
		('PROMOTION_JFD_FLOWER_CLASS_ACTIVE',	'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS_ACTIVE',	'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS_ACTIVE_HELP',	'AS2D_IF_LEVELUP', 	1, 				0, 				'JFD_CANADA_KING_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS'),
		('PROMOTION_JFD_FLOWER_CLASS_INACTIVE',	'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS_ACTIVE',	'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS_ACTIVE_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS',					'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_FLOWER_CLASS');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombatMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType, 				UnitCombatType,			 Modifier)
VALUES	('PROMOTION_JFD_FLOWER_CLASS',	'UNITCOMBAT_SUBMARINE',	 25);
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 						Help, 									Strategy, 									Civilopedia, 							ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					 UnitFlagAtlas, 					UnitFlagIconOffset,  IconAtlas,						PortraitIndex)
SELECT	'UNIT_JFD_FLOWER_CLASS',	Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_FLOWER_CLASS',	'TXT_KEY_UNIT_JFD_FLOWER_CLASS_HELP', 	'TXT_KEY_UNIT_JFD_FLOWER_CLASS_STRATEGY',  	'TXT_KEY_UNIT_JFD_FLOWER_CLASS_TEXT',	ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_FLOWER_CLASS',	 'JFD_CANADA_KING_UNIT_FLAG_ATLAS',	0,					 'JFD_CANADA_KING_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_DESTROYER';  
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_FLOWER_CLASS',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_DESTROYER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 			
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_FLOWER_CLASS',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_DESTROYER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_FLOWER_CLASS',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_DESTROYER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_FLOWER_CLASS',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_DESTROYER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_JFD_FLOWER_CLASS',	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_DESTROYER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_FLOWER_CLASS',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_DESTROYER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_FLOWER_CLASS',	'PROMOTION_JFD_FLOWER_CLASS_INACTIVE'),
		('UNIT_JFD_FLOWER_CLASS',	'PROMOTION_JFD_FLOWER_CLASS');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 								CivilopediaTag, 								 ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_CANADA_KING',	'TXT_KEY_LEADER_JFD_CANADA_KING',	'TXT_KEY_LEADER_JFD_CANADA_KING_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_CANADA_KING',	 'JFD_CanadaKing_Scene.xml',	5, 						3, 						5, 							6, 			4, 				4, 				2, 						9, 				7, 			6, 			12, 			1, 			1, 			'JFD_CANADA_KING_ICON_ATLAS',	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				 MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_CANADA_KING',	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_JFD_CANADA_KING',	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_CANADA_KING',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
		('LEADER_JFD_CANADA_KING',	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_CANADA_KING',	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_CANADA_KING',	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_CANADA_KING',	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				 MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_CANADA_KING',	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_CANADA_KING',	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_CANADA_KING',	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
		('LEADER_JFD_CANADA_KING',	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_JFD_CANADA_KING',	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_CANADA_KING',	'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_RECON', 					4),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_MOBILE', 					6),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_NAVAL', 					8),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_NAVAL_GROWTH', 				6),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_AIR', 						7),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_PRODUCTION', 				8),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_GOLD', 						7),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_RELIGION', 					5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_CANADA_KING',	'TRAIT_JFD_CANADA_KING');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					  ShortDescription)
VALUES	('TRAIT_JFD_CANADA_KING',   'TXT_KEY_TRAIT_JFD_CANADA_KING',  'TXT_KEY_TRAIT_JFD_CANADA_KING_SHORT');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 										BuildingClass,						NumTradeRouteBonus,	MilitaryProductionModifier,	GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,										Help, 													NeverCapture)
VALUES	('BUILDING_JFD_CANADA_KING_PRODUCTION',		'BUILDINGCLASS_JFD_CANADA_KING_0',	0,					10,							-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_CANADA_KING_PRODUCTION',		'TXT_KEY_BUILDING_JFD_CANADA_KING_PRODUCTION_HELP',		1),
		('BUILDING_JFD_CANADA_KING_TRADE_ROUTE_1',	'BUILDINGCLASS_JFD_CANADA_KING_1',	1,					0,							-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_CANADA_KING_TRADE_ROUTE',	'TXT_KEY_BUILDING_JFD_CANADA_KING_TRADE_ROUTE_HELP',	1),
		('BUILDING_JFD_CANADA_KING_TRADE_ROUTE_2',	'BUILDINGCLASS_JFD_CANADA_KING_2',	1,					0,							-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_CANADA_KING_TRADE_ROUTE',	'TXT_KEY_BUILDING_JFD_CANADA_KING_TRADE_ROUTE_HELP',	1),
		('BUILDING_JFD_CANADA_KING_TRADE_ROUTE_3',	'BUILDINGCLASS_JFD_CANADA_KING_3',	1,					0,							-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_JFD_CANADA_KING_TRADE_ROUTE',	'TXT_KEY_BUILDING_JFD_CANADA_KING_TRADE_ROUTE_HELP',	1);
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 				ResponseType, 							Response, 														Bias)
VALUES 	('LEADER_JFD_CANADA_KING',  'RESPONSE_AI_DOF_BACKSTAB', 			'TXT_KEY_LEADER_JFD_CANADA_KING_DENOUNCE_FRIEND%', 				500),
		('LEADER_JFD_CANADA_KING',  'RESPONSE_ATTACKED_HOSTILE', 			'TXT_KEY_LEADER_JFD_CANADA_KING_ATTACKED_HOSTILE%', 			500),
		('LEADER_JFD_CANADA_KING',  'RESPONSE_DEFEATED', 					'TXT_KEY_LEADER_JFD_CANADA_KING_DEFEATED%', 					500),
		('LEADER_JFD_CANADA_KING',  'RESPONSE_DOW_GENERIC', 				'TXT_KEY_LEADER_JFD_CANADA_KING_DOW_GENERIC%', 					500),
		('LEADER_JFD_CANADA_KING',  'RESPONSE_FIRST_GREETING', 				'TXT_KEY_LEADER_JFD_CANADA_KING_FIRSTGREETING%', 				500),
		('LEADER_JFD_CANADA_KING',  'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',	'TXT_KEY_LEADER_JFD_CANADA_KING_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_JFD_CANADA_KING',  'RESPONSE_WORK_AGAINST_SOMEONE', 		'TXT_KEY_LEADER_JFD_CANADA_KING_DENOUNCE%', 					500),
		('LEADER_JFD_CANADA_KING',  'RESPONSE_WORK_WITH_US', 				'TXT_KEY_LEADER_JFD_CANADA_KING_DEC_FRIENDSHIP%', 				500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,							Description,						 ShortDescription,							Adjective,									Civilopedia, 							CivilopediaTag, 				 DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,					SoundtrackTag,  MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_CANADA_KING',		'TXT_KEY_CIV_TAL_JFD_CANADA_DESC',		'TXT_KEY_CIV_JFD_CANADA_KING_DESC',	 'TXT_KEY_CIV_JFD_CANADA_KING_SHORT_DESC',	'TXT_KEY_CIV_JFD_CANADA_KING_ADJECTIVE',	'TXT_KEY_CIV5_JFD_CANADA_KING_TEXT_1', 	'TXT_KEY_CIV5_JFD_CANADA_KING',	 'PLAYERCOLOR_JFD_CANADA_KING',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_CANADA_KING_ICON_ATLAS',	0,				'JFD_CANADA_KING_ALPHA_ATLAS',	'America', 		'JFD_MapCanadaKing512.dds',		'TXT_KEY_CIV5_DAWN_JFD_CANADA_KING_TEXT',	'JFD_DOM_CanadaKing.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_01'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_02'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_03'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_04'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_05'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_06'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_07'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_08'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_09'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_10'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_11'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_12'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_13'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_14'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_15'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_16'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_17'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_18'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_19'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_20'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_21'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_22'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_23'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_24'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_25'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_26'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_27'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_28'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_29'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_30'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_31'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_32'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_33'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_34'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_35'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_36'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_37'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_38'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_CITY_NAME_JFD_CANADA_KING_39');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_CANADA_KING', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_CANADA_KING', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_CANADA_KING', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_CANADA_KING',	'LEADER_JFD_CANADA_KING');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_CANADA_KING',	'BUILDINGCLASS_SEAPORT',	'BUILDING_JFD_MERCHANT_SHIPYARD');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_CANADA_KING',	'UNITCLASS_DESTROYER',		'UNIT_JFD_FLOWER_CLASS');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_CANADA_KING',	'RELIGION_PROTESTANTISM');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 					StartAlongOcean)
VALUES	('CIVILIZATION_JFD_CANADA_KING',	1);	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_0'),	
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_1'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_2'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_3'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_4'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_5'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_6'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_7'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_8'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_9'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_10'),
		('CIVILIZATION_JFD_CANADA_KING',	'TXT_KEY_SPY_NAME_JFD_CANADA_KING_11');
--==========================================================================================================================
--==========================================================================================================================
