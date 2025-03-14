--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================		
------------------------------------------------------------------------------------------------------------------------ 	
-- Buildings
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,  PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, GreatPeopleRateModifier, HurryCostModifier, NeverCapture, 	Description, 								Help, 											Strategy,											Civilopedia, 									ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_HOUSE_OF_CHIEFS',		BuildingClass,  PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, GreatPeopleRateModifier, HurryCostModifier, 1, 				'TXT_KEY_BUILDING_JFD_HOUSE_OF_CHIEFS', 	'TXT_KEY_BUILDING_JFD_HOUSE_OF_CHIEFS_HELP', 	'TXT_KEY_BUILDING_JFD_HOUSE_OF_CHIEFS_STRATEGY',	'TXT_KEY_BUILDING_JFD_HOUSE_OF_CHIEFS_TEXT',	ArtDefineTag, 3, 			 'JFD_FIJI_CAKOBAU_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GARDEN';	

UPDATE Buildings
SET PrereqTech = 'TECH_CIVIL_SERVICE'
WHERE Type = 'BUILDING_JFD_HOUSE_OF_CHIEFS';
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
VALUES	('BUILDING_JFD_HOUSE_OF_CHIEFS',	'BUILDINGCLASS_BARRACKS');	
------------------------------------------------------------------------------------------------------------------------ 	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType, Flavor)
SELECT	'BUILDING_JFD_HOUSE_OF_CHIEFS',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GARDEN';

INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType, 		Flavor)
VALUES	('BUILDING_JFD_HOUSE_OF_CHIEFS',	'FLAVOR_GROWTH',	10),
		('BUILDING_JFD_HOUSE_OF_CHIEFS',	'FLAVOR_CULTURE',	10);	
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 						RivalTerritory,	FriendlyLandsModifier,	OutsideFriendlyLandsModifier,	LostWithUpgrade,  Description, 						Help, 									Sound, 				 CannotBeChosen,  PortraitIndex, IconAtlas, 		 PediaType, 		 PediaEntry)
VALUES	('PROMOTION_JFD_BATI_1', 	1,				0,						0,								0,				  'TXT_KEY_PROMOTION_JFD_BATI_1',	'TXT_KEY_PROMOTION_JFD_BATI_1_HELP',	'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BATI_1'),
		('PROMOTION_JFD_BATI_2', 	0,				0,						20,								0,				  'TXT_KEY_PROMOTION_JFD_BATI_2',	'TXT_KEY_PROMOTION_JFD_BATI_2_HELP',	'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BATI_2'),
		('PROMOTION_JFD_BATI_3', 	0,				20,						0,								0,				  'TXT_KEY_PROMOTION_JFD_BATI_3',	'TXT_KEY_PROMOTION_JFD_BATI_3_HELP',	'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BATI_3');
------------------------------------------------------------------------------------------------------------------------	
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 				Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 				Help, 							Strategy, 							Civilopedia, 					UnitArtInfo, 				UnitFlagAtlas,						 UnitFlagIconOffset,	IconAtlas,						 PortraitIndex)
SELECT	'UNIT_JFD_BATI',	Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_BATI',	'TXT_KEY_UNIT_JFD_BATI_HELP', 	'TXT_KEY_UNIT_JFD_BATI_STRATEGY', 	'TXT_KEY_UNIT_JFD_BATI_TEXT',	'ART_DEF_UNIT_JFD_BATI',	'JFD_FIJI_CAKOBAU_UNIT_FLAG_ATLAS',  0,						'JFD_FIJI_CAKOBAU_ICON_ATLAS',	 2
FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN';	

UPDATE Units
SET Combat = Combat-5, PrereqTech = 'TECH_CHIVALRY', ObsoleteTech = NULL
WHERE Type = 'UNIT_JFD_BATI';
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_BATI',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_BATI', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_BATI',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_BATI',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_BATI', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WARRIOR';	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 					IconAtlas, 						  PortraitIndex)
VALUES	('LEADER_JFD_FIJI_CAKOBAU', 	'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU',		'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_FIJI_CAKOBAU', 	'JFD_FijiCakobau_Scene.xml',	'JFD_FIJI_CAKOBAU_ICON_ATLAS',    1);

UPDATE Leaders
SET VictoryCompetitiveness = 8,
WonderCompetitiveness = 2,
MinorCivCompetitiveness = 8,
Boldness = 9,
DiploBalance = 3,
WarmongerHate = 1,
DenounceWillingness = 5,
DoFWillingness = 4,
Loyalty = 4,
Neediness = 6,
Forgiveness = 4,
Chattiness = 4,
Meanness = 8
WHERE Type = 'LEADER_JFD_FIJI_CAKOBAU';
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_FIJI_CAKOBAU', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------ 				
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_FIJI_CAKOBAU', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JFD_FIJI_CAKOBAU', 	'MINOR_CIV_APPROACH_BULLY', 		6);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_DEFENSE', 					3),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_CITY_DEFENSE', 				2),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_RANGED', 					2),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_NAVAL', 					6),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_NAVAL_GROWTH', 				6),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_GROWTH', 					7),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_WONDER', 					2),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_RELIGION', 					6),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_FIJI_CAKOBAU', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	Bias)
VALUES 	('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_ATTACKED_STRONG_HOSTILE', 				'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_DEFEATED%', 					 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_PLOT_BUYING_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_REQUEST%', 		  						500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_DENOUNCE%', 					  			500),
		('LEADER_JFD_FIJI_CAKOBAU',		'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_FIJI_CAKOBAU_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_FIJI_CAKOBAU',		'TRAIT_JFD_FIJI_CAKOBAU');
------------------------------------------------------------------------------------------------------------------------ 
-- Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Traits 
		(Type, 							Description, 						ShortDescription)
VALUES	('TRAIT_JFD_FIJI_CAKOBAU', 		'TXT_KEY_TRAIT_JFD_FIJI_CAKOBAU',  'TXT_KEY_TRAIT_JFD_FIJI_CAKOBAU_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------ 
-- Civilizations
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,						SoundtrackTag,  MapImage, 						DawnOfManQuote, 							DawnOfManImage,				Description,							ShortDescription,							Adjective,									Civilopedia,											CivilopediaTag,								DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_FIJI_CAKOBAU',	'TXT_KEY_CIV_TAL_JFD_FIJI_DESC',	'Polynesia', 	'JFD_MapFijiCakobau512.dds',	'TXT_KEY_CIV_DAWN_JFD_FIJI_CAKOBAU_TEXT',	'JFD_DOM_FijiCakobau.dds',	'TXT_KEY_CIV_JFD_FIJI_CAKOBAU_DESC', 	'TXT_KEY_CIV_JFD_FIJI_CAKOBAU_SHORT_DESC',	'TXT_KEY_CIV_JFD_FIJI_CAKOBAU_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_FIJI_CAKOBAU_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_FIJI_CAKOBAU',	'PLAYERCOLOR_JFD_FIJI_CAKOBAU',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_FIJI_CAKOBAU_ICON_ATLAS',	0,				'JFD_FIJI_CAKOBAU_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_01'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_02'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_03'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_04'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_05'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_06'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_07'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_08'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_09'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_10'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_11'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_12'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_13'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_14'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_15'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_16'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_17'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_18'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_19'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_20'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_21'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_22'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_23'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_24'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_25'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_CITY_NAME_JFD_FIJI_CAKOBAU_26');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_FIJI_CAKOBAU', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_FIJI_CAKOBAU', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_FIJI_CAKOBAU', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'LEADER_JFD_FIJI_CAKOBAU');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'BUILDINGCLASS_GARDEN',		'BUILDING_JFD_HOUSE_OF_CHIEFS');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'UNITCLASS_LONGSWORDSMAN', 	'UNIT_JFD_BATI');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_0'),	
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_1'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_2'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_3'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_4'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_5'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_6'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_7'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_8'),
		('CIVILIZATION_JFD_FIJI_CAKOBAU', 	'TXT_KEY_SPY_NAME_JFD_FIJI_CAKOBAU_9');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_JFD_FIJI_CAKOBAU', 		1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Avoid
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 						RegionType)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'REGION_TUNDRA');
--=======================================================================================================================
--=======================================================================================================================