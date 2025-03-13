--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================
-- BUILDINGS
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- Buildings
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 					BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture, Description, 						Help, 								 Strategy,									Civilopedia, 							ArtDefineTag, IconAtlas,							PortraitIndex)
SELECT	'BUILDING_JFD_SICH',	BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, 1, 			  'TXT_KEY_BUILDING_JFD_SICH', 	'TXT_KEY_BUILDING_JFD_SICH_HELP',	 'TXT_KEY_BUILDING_JFD_SICH_STRATEGY',	'TXT_KEY_BUILDING_JFD_SICH_TEXT',		ArtDefineTag, 'JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS',  2
FROM Buildings WHERE Type = 'BUILDING_ARMORY';	

UPDATE Buildings
SET PrereqTech = 'TECH_CHIVALRY'
WHERE Type = 'BUILDING_JFD_SICH';
-------------------------------------------------------------------------------------------------------------------------	                                                                                                                 				
-- Building_ClassesNeededInCity
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_JFD_SICH',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_ARMORY';
-------------------------------------------------------------------------------------------------------------------------	
-- Building_DomainFreeExperiences
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_DomainFreeExperiences 	
		(BuildingType, 			DomainType,		Experience)
SELECT	'BUILDING_JFD_SICH',	DomainType,		Experience
FROM Building_DomainFreeExperiences WHERE BuildingType = 'BUILDING_ARMORY';
-------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,						Flavor)
SELECT	'BUILDING_JFD_SICH',	FlavorType,						Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_ARMORY';	

INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,						Flavor)
VALUES	('BUILDING_JFD_SICH',	'FLAVOR_CULTURE',				20),
		('BUILDING_JFD_SICH',	'FLAVOR_MOBILE',				20),
		('BUILDING_JFD_SICH',	'FLAVOR_MILITARY_TRAINING',		10);
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_SICH_1',	'BUILDING_DUMMY_JFD_SICH_1',		'TXT_KEY_BUILDING_DUMMY_JFD_SICH_1'),
		('BUILDINGCLASS_DUMMY_JFD_SICH_2',	'BUILDING_DUMMY_JFD_SICH_2',		'TXT_KEY_BUILDING_DUMMY_JFD_SICH_2');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 							BuildingClass, 							MilitaryProductionModifier,	GreatWorkCount,		Cost, FaithCost,   PrereqTech,   NeverCapture,	Description, 							Help)
VALUES	('BUILDING_DUMMY_JFD_SICH_1', 	'BUILDINGCLASS_DUMMY_JFD_SICH_1', 		0,							-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_DUMMY_JFD_SICH_1',	'TXT_KEY_BUILDING_DUMMY_JFD_SICH_1_HELP'),
		('BUILDING_DUMMY_JFD_SICH_2', 	'BUILDINGCLASS_DUMMY_JFD_SICH_2', 		1,							-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_DUMMY_JFD_SICH_2',	'TXT_KEY_BUILDING_DUMMY_JFD_SICH_2_HELP');
------------------------------------------------------------------------------------------------------------------------								
-- Building_YieldModifiers																																	
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldModifiers
		(BuildingType,					YieldType,				Yield)
VALUES	('BUILDING_DUMMY_JFD_SICH_1',	'YIELD_PRODUCTION',		1);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 						CanMoveAfterAttacking,  LostWithUpgrade,  Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_CHAIKA',	1,						0,				  'TXT_KEY_PROMOTION_JFD_CHAIKA',	'TXT_KEY_PROMOTION_JFD_CHAIKA_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_CHAIKA');
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 					Help, 								Strategy, 								Civilopedia, 						UnitArtInfo, 					UnitFlagAtlas,								UnitFlagIconOffset,	IconAtlas,								PortraitIndex)
SELECT	'UNIT_JFD_CHAIKA',		Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_CHAIKA',	'TXT_KEY_UNIT_JFD_CHAIKA_HELP',		'TXT_KEY_UNIT_JFD_CHAIKA_STRATEGY', 	'TXT_KEY_UNIT_JFD_CHAIKA_TEXT',		'ART_DEF_UNIT_JFD_CHAIKA',		'JFD_ZAPORIZHZHIA_SIRKO_UNIT_FLAG_ATLAS',	0,					'JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_GALLEASS';	
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_CHAIKA', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GALLEASS';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_CHAIKA', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GALLEASS';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_CHAIKA',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GALLEASS';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_CHAIKA', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_CHAIKA', 	'PROMOTION_JFD_CHAIKA');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_CHAIKA',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GALLEASS';				
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								ArtDefineTag, 							Description, 								Civilopedia, 										CivilopediaTag, 											IconAtlas, 								PortraitIndex)
VALUES	('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'JFD_ZaporizhzhiaSirko_Scene.xml',		'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ZAPORIZHZHIA_SIRKO',		'JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 8,
WonderCompetitiveness = 2,
MinorCivCompetitiveness = 2,
Boldness = 12,
DiploBalance = 5,
WarmongerHate = 8,
DenounceWillingness = 9,
DoFWillingness = 2,
Loyalty = 1,
Neediness = 1,
Forgiveness = 1,
Chattiness = 7,
Meanness = 12
WHERE Type = 'LEADER_JFD_ZAPORIZHZHIA_SIRKO';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MAJOR_CIV_APPROACH_HOSTILE', 		8),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		4),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MINOR_CIV_APPROACH_IGNORE', 		8),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'MINOR_CIV_APPROACH_BULLY', 		7);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_RECON', 					6),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_MOBILE', 					9),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_NAVAL', 					6),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_GROWTH', 					7),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_WONDER', 					2),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																		Bias)
VALUES 	('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_DEFEATED%', 					 			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_FIRSTGREETING%', 				 		500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_BULLY', 							'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_BULLY%', 		  					500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_CITIES', 							'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_CITIES%', 		  				500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_CULTURE', 							'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_CULTURE%', 		  				500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_LEADER_JFD_ZAPORIZHZHIA_SIRKO%', 	500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_MILITARY', 						'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_MILITARY%', 		  				500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_NUKE', 							'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_NUKE%', 		  					500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_BULLY', 							'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_BULLY%', 		  					500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_POPULATION', 						'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_POPULATION%', 		  			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_INSULT_UNHAPPINESS', 						'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_INSULT_UNHAPPINESS%', 		  			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_OPEN_BORDERS_EXCHANGE%', 		  		500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_PLOT_BUYING_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_REQUEST%', 		  						500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_TOO_SOON_NO_PEACE%', 			  		500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_DENOUNCE%', 					  			500),
		('LEADER_JFD_ZAPORIZHZHIA_SIRKO',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_ZAPORIZHZHIA_SIRKO_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_ZAPORIZHZHIA_SIRKO', 	'TRAIT_JFD_ZAPORIZHZHIA_SIRKO');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_JFD_ZAPORIZHZHIA_SIRKO', 	'TXT_KEY_TRAIT_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_TRAIT_JFD_ZAPORIZHZHIA_SIRKO_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 										DerivativeCiv,				SoundtrackTag,  MapImage, 								DawnOfManQuote, 									DawnOfManImage,						Description,									ShortDescription,									Adjective,											Civilopedia,													CivilopediaTag,											DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,								PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_JFD_TAL_COSSACKS',	'Russia', 		'JFD_MapZaporizhzhiaSirko512.dds',		'TXT_KEY_CIV_DAWN_JFD_ZAPORIZHZHIA_SIRKO_TEXT',		'JFD_DOM_ZaporizhzhiaSirko.dds',	'TXT_KEY_CIV_JFD_ZAPORIZHZHIA_SIRKO_DESC',		'TXT_KEY_CIV_JFD_ZAPORIZHZHIA_SIRKO_SHORT_DESC',	'TXT_KEY_CIV_JFD_ZAPORIZHZHIA_SIRKO_ADJECTIVE',		'TXT_KEY_CIVILOPEDIA_CIVS_JFD_ZAPORIZHZHIA_SIRKO_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_JFD_ZAPORIZHZHIA_SIRKO',		'PLAYERCOLOR_JFD_ZAPORIZHZHIA_SIRKO',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_ZAPORIZHZHIA_SIRKO_ICON_ATLAS',	0,				'JFD_ZAPORIZHZHIA_SIRKO_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 							CityName)
VALUES	('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_1'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_2'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_3'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_4'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_5'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_6'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_7'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_8'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_9'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_10'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_11'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_12'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_13'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_14'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_15'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_16'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_17'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_18'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_19'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_20'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_21'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_22'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_23'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_24'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_25'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_26'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_27'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_28'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_CITY_NAME_JFD_ZAPORIZHZHIA_SIRKO_29');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 							BuildingClassType)
SELECT	'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO', 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 							TechType)
SELECT	'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO', 		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO', 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'LEADER_JFD_ZAPORIZHZHIA_SIRKO');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'BUILDINGCLASS_ARMORY',		'BUILDING_JFD_SICH');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 							UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'UNITCLASS_GALLEASS',		'UNIT_JFD_CHAIKA');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 							ReligionType)
VALUES	('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'RELIGION_ORTHODOXY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
VALUES	('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_0'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_1'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_2'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_3'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_4'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_5'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_6'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_7'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_8'),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'TXT_KEY_SPY_NAME_JFD_ZAPORIZHZHIA_SIRKO_9');
--=======================================================================================================================
--=======================================================================================================================