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
		(Type, 							BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, MinAreaSize, NeverCapture, Description, 							Help, 										Strategy,										Civilopedia, 								ArtDefineTag,	IconAtlas,							PortraitIndex)
SELECT	'BUILDING_JFD_NAVAL_COLLEGE',	BuildingClass, Cost, GoldMaintenance, PrereqTech, Water, MinAreaSize, 1, 			'TXT_KEY_BUILDING_JFD_NAVAL_COLLEGE', 	'TXT_KEY_BUILDING_JFD_NAVAL_COLLEGE_HELP',	'TXT_KEY_BUILDING_JFD_NAVAL_COLLEGE_STRATEGY',	'TXT_KEY_BUILDING_JFD_NAVAL_COLLEGE_TEXT',	ArtDefineTag, 	'JFD_GREAT_QING_CIXI_ICON_ATLAS',	3
FROM Buildings WHERE Type = 'BUILDING_SEAPORT';		

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_ARSENAL'
WHERE Type = 'BUILDING_JFD_NAVAL_COLLEGE';
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_JFD_NAVAL_COLLEGE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_SEAPORT';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_DomainProductionModifiers
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_DomainProductionModifiers 	
		(BuildingType, 					DomainType,	Modifier)
SELECT	'BUILDING_JFD_NAVAL_COLLEGE',	DomainType,	Modifier
FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_SEAPORT';
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,	Flavor)
SELECT	'BUILDING_JFD_NAVAL_COLLEGE',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_SEAPORT';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_SeaResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_SeaResourceYieldChanges 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_JFD_NAVAL_COLLEGE',	YieldType,	Yield
FROM Building_SeaResourceYieldChanges WHERE BuildingType = 'BUILDING_SEAPORT';		
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 								ExperiencePercent,	LostWithUpgrade,	Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_PEKING_FORCE',		15,					0,					'TXT_KEY_PROMOTION_JFD_PEKING_FORCE',	'TXT_KEY_PROMOTION_JFD_PEKING_FORCE_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_PEKING_FORCE');
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 						Help, 									Strategy, 									Civilopedia, 							UnitArtInfo, 						UnitFlagAtlas,							UnitFlagIconOffset,	IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_PEKING_FORCE',	Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_PEKING_FORCE',	'TXT_KEY_UNIT_JFD_PEKING_FORCE_HELP',	'TXT_KEY_UNIT_JFD_PEKING_FORCE_STRATEGY', 	'TXT_KEY_UNIT_JFD_PEKING_FORCE_TEXT',	'ART_DEF_UNIT_JFD_PEKING_FORCE',	'JFD_GREAT_QING_CIXI_UNIT_FLAG_ATLAS',	0,					'JFD_GREAT_QING_CIXI_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_GREAT_WAR_INFANTRY';	

UPDATE Units
SET PrereqTech = 'TECH_STEAM_POWER', Combat = Combat-5
WHERE Type = 'UNIT_JFD_PEKING_FORCE';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_PEKING_FORCE', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_PEKING_FORCE', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_PEKING_FORCE', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_PEKING_FORCE', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_PEKING_FORCE', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_WAR_INFANTRY';		
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_PEKING_FORCE',	'BUILDING_DUMMY_JFD_PEKING_FORCE',		'TXT_KEY_BUILDING_DUMMY_JFD_PEKING_FORCE');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 									BuildingClass,								GreatWorkCount, Cost, FaithCost, PrereqTech,	NeverCapture,	Description,								Help)
VALUES	('BUILDING_DUMMY_JFD_PEKING_FORCE',		'BUILDINGCLASS_DUMMY_JFD_PEKING_FORCE',		-1, 			 -1,   -1, 		  null, 		1,				'TXT_KEY_BUILDING_DUMMY_JFD_PEKING_FORCE',	'TXT_KEY_BUILDING_DUMMY_JFD_PEKING_FORCE_HELP');
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ProductionModifierBuildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_ProductionModifierBuildings 	
		(UnitType,					BuildingType, 						ProductionModifier)
VALUES	('UNIT_JFD_PEKING_FORCE',	'BUILDING_DUMMY_JFD_PEKING_FORCE',	100);	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							ArtDefineTag, 					Description, 							Civilopedia, 									CivilopediaTag, 									IconAtlas, 							PortraitIndex)
VALUES	('LEADER_JFD_GREAT_QING_CIXI', 	'JFD_GreatQingCixi_Scene.xml',	'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI',	'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_GREAT_QING_CIXI',	'JFD_GREAT_QING_CIXI_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 7,
WonderCompetitiveness = 2,
MinorCivCompetitiveness = 2,
Boldness = 7,
DiploBalance = 6,
WarmongerHate = 9,
DenounceWillingness = 8,
DoFWillingness = 4,
Loyalty = 4,
Neediness = 4,
Forgiveness = 2,
Chattiness = 3,
Meanness = 5
WHERE Type = 'LEADER_JFD_GREAT_QING_CIXI';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_GREAT_QING_CIXI', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		9),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		9),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MAJOR_CIV_APPROACH_GUARDED', 		9),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MAJOR_CIV_APPROACH_AFRAID', 		7),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		1),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_GREAT_QING_CIXI', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_JFD_GREAT_QING_CIXI', 	'MINOR_CIV_APPROACH_BULLY', 		7);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_CITY_DEFENSE', 				8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_NAVAL', 					8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_NAVAL_RECON', 				8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_NAVAL_GROWTH', 				8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_GROWTH', 					8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_GOLD', 						8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_CULTURE', 					8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_HAPPINESS', 				3),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_RELIGION', 					2),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_SPACESHIP', 				7),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_WATER_CONNECTION', 			8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_NUKE', 						7),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_USE_NUKE', 					7),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_ESPIONAGE', 				8),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_AIRLIFT', 					3),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_GREAT_QING_CIXI', 	'FLAVOR_AIR_CARRIER', 				3);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_DEFEATED%', 					 			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_DOW_GENERIC%', 				 				500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 		500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_REQUEST%', 		  							500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_DENOUNCE%', 					  			500),
		('LEADER_JFD_GREAT_QING_CIXI',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_GREAT_QING_CIXI', 	'TRAIT_JFD_GREAT_QING_CIXI');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_JFD_GREAT_QING_CIXI', 	'TXT_KEY_TRAIT_JFD_GREAT_QING_CIXI',	'TXT_KEY_TRAIT_JFD_GREAT_QING_CIXI_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 						DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,								DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_GREAT_QING_CIXI',		'TXT_KEY_JFD_TAL_CHINA',	'China', 		'JFD_MapGreatQingCixi512.dds',	'TXT_KEY_CIV_DAWN_JFD_GREAT_QING_CIXI_TEXT',	'JFD_DOM_GreatQingCixi.dds',	'TXT_KEY_CIV_JFD_GREAT_QING_CIXI_DESC', 	'TXT_KEY_CIV_JFD_GREAT_QING_CIXI_SHORT_DESC',	'TXT_KEY_CIV_JFD_GREAT_QING_CIXI_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_GREAT_QING_CIXI_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_GREAT_QING_CIXI',	'PLAYERCOLOR_JFD_GREAT_QING_CIXI',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_GREAT_QING_CIXI_ICON_ATLAS',	0,				'JFD_GREAT_QING_CIXI_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_1'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_2'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_3'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_4'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_5'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_6'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_7'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_8'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_9'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_10'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_11'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_12'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_13'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_14'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_15'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_16'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_17'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_18'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_19'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_20'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_21'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_22'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_23'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_24'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_25'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_26'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_CITY_NAME_JFD_GREAT_QING_CIXI_27');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses	
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_GREAT_QING_CIXI', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_GREAT_QING_CIXI', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_GREAT_QING_CIXI', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',	'LEADER_JFD_GREAT_QING_CIXI');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 					BuildingType)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',	'BUILDINGCLASS_SEAPORT',			'BUILDING_JFD_NAVAL_COLLEGE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 						UnitType)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',	'UNITCLASS_GREAT_WAR_INFANTRY', 	'UNIT_JFD_PEKING_FORCE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',	'RELIGION_CONFUCIANISM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_0'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_1'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_2'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_3'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_4'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_5'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_6'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_7'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_8'),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',	'TXT_KEY_SPY_NAME_JFD_GREAT_QING_CIXI_9');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',	1);
--=======================================================================================================================
--=======================================================================================================================