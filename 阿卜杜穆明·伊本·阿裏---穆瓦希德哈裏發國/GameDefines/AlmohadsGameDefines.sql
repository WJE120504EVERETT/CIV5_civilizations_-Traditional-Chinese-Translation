--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 	DerivativeCiv,						Description, 						ShortDescription, 						Adjective,								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType,			ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage,				DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_DJ_ALMOHADS'),('CIVILIZATION_MOROCCO') 	,('TXT_KEY_CIV_DJ_ALMOHADS_DESC'), 	('TXT_KEY_CIV_DJ_ALMOHADS_SHORT_DESC'),	('TXT_KEY_CIV_DJ_ALMOHADS_ADJECTIVE'),	('TXT_KEY_CIV5_DJ_ALMOHADS_TEXT_1'),	('TXT_KEY_CIV5_DJ_ALMOHADS'),	('PLAYERCOLOR_DJ_ALMOHADS'), 	ArtDefineTag, ArtStyleType,			ArtStyleSuffix,	ArtStylePrefix,	('DJ_ALMOHADS_COLOR_ATLAS'),	0,				('DJ_ALMOHADS_ALPHA_ATLAS'),	SoundtrackTag,	('AlmohadsMap.dds'),	('TXT_KEY_CIV5_DOM_DJ_ABD_ALMUMIN_TEXT'),	('AlmohadsDoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_MOROCCO');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_MOROCCO' )
	THEN '_MOROCCO'
	ELSE '_AFRI' END) 
WHERE Type = 'CIVILIZATION_DJ_ALMOHADS';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_0'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_1'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_2'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_3'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_4'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_5'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_6'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_7'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_8'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_9'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_10'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_11'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_12'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_13'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_14'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_15'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_16'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_17'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_18'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_19'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_20'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_21'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_22'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_23'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_24'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_CITY_NAME_DJ_ALMOHADS_25');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_DJ_ALMOHADS'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_MOROCCO');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_DJ_ALMOHADS'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_MOROCCO');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_DJ_ALMOHADS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_MOROCCO');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_DJ_ALMOHADS', 	'LEADER_DJ_ABD_ALMUMIN');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_DJ_ALMOHADS', 	'UNITCLASS_LONGSWORDSMAN',	'UNIT_DJ_MUTATAWWIA');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_DJ_ALMOHADS', 	'BUILDINGCLASS_CARAVANSARY',	'BUILDING_DJ_ZAWIYA');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
SELECT		('CIVILIZATION_DJ_ALMOHADS'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_MOROCCO');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================		
INSERT INTO Civilization_Start_Region_Priority
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_DJ_ALMOHADS', 	'REGION_DESERT');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_0'),	
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_1'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_2'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_3'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_4'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_5'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_6'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_7'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_8'),
			('CIVILIZATION_DJ_ALMOHADS', 	'TXT_KEY_SPY_NAME_DJ_ALMOHADS_9');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_DJ_ALMOHADS_ICON', 		0.757,	0.757,	0.757,	1),
			('COLOR_PLAYER_DJ_ALMOHADS_BACKGROUND',	0.212,	0.200,	0.196,	1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_DJ_ALMOHADS',	'COLOR_PLAYER_DJ_ALMOHADS_ICON',	'COLOR_PLAYER_DJ_ALMOHADS_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas,						PortraitIndex)
SELECT		('LEADER_DJ_ABD_ALMUMIN'), 	('TXT_KEY_LEADER_DJ_ABD_ALMUMIN'), 	('TXT_KEY_LEADER_DJ_ABD_ALMUMIN_PEDIA'),	('TXT_KEY_CIVILOPEDIA_LEADERS_DJ_ABD_ALMUMIN'), 	('AlMumin_Scene.xml'),		7, 						4, 						2, 							7, 			6, 				3, 				8, 						6, 				3, 			2, 			2, 				7, 			7, 			('DJ_ALMOHADS_COLOR_ATLAS'),	1
FROM Leaders WHERE Type = 'LEADER_WASHINGTON';
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_DJ_ABD_ALMUMIN', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_DJ_ABD_ALMUMIN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_DJ_ABD_ALMUMIN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_DJ_ABD_ALMUMIN', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_DJ_ABD_ALMUMIN', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_DJ_ABD_ALMUMIN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_DJ_ABD_ALMUMIN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_DJ_ABD_ALMUMIN',	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_DJ_ABD_ALMUMIN',	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_DJ_ABD_ALMUMIN',	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_DJ_ABD_ALMUMIN',	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_DJ_ABD_ALMUMIN',	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_OFFENSE', 					7),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_DEFENSE', 					5),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_CITY_DEFENSE', 				3),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_RECON', 					6),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_RANGED', 					3),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_MOBILE', 					4),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_NAVAL', 					3),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_AIR', 						5),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_EXPANSION', 				8),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_GROWTH', 					5),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_PRODUCTION', 				7),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_GOLD', 						4),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_SCIENCE', 					7),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_CULTURE', 					8),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_HAPPINESS', 				7),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_WONDER', 					3),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_RELIGION', 					2),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_DIPLOMACY', 				9),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_SPACESHIP', 				4),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_NUKE', 						6),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_USE_NUKE', 					2),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_AIRLIFT', 					5),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_I_TRADE_DESTINATION', 		4),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_I_SEA_TRADE_ROUTE', 		3),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_ARCHAEOLOGY', 				2),
			('LEADER_DJ_ABD_ALMUMIN',	'FLAVOR_AIR_CARRIER', 				4);
--=========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_DJ_ABD_ALMUMIN',	'TRAIT_DJ_UNITARIAN_REFORMS');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================						
INSERT INTO Traits
			(Type,							Description,							ShortDescription)
VALUES		('TRAIT_DJ_UNITARIAN_REFORMS',	'TXT_KEY_TRAIT_DJ_UNITARIAN_REFORMS',	'TXT_KEY_TRAIT_DJ_UNITARIAN_REFORMS_SHORT');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
		(Type, 					Class, Cost,	FaithCost,	PrereqTech,	Combat, RangedCombat,	Range,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 							Civilopedia, 								Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT	('UNIT_DJ_MUTATAWWIA'),	Class, 100,	100,	('TECH_THEOLOGY'),	18,	RangedCombat,	Range,	3, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_DJ_MUTATAWWIA_DESC'),	('TXT_KEY_CIV5_UNITS_DJ_MUTATAWWIA_TEXT'),	('TXT_KEY_UNIT_DJ_MUTATAWWIA_HELP'), 	('TXT_KEY_UNIT_DJ_MUTATAWWIA_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_DJ_MUTATAWWIA'),	0,					('UNIT_FLAG_DJ_MUTATAWWIA_ATLAS'),	2,				('DJ_ALMOHADS_COLOR_ATLAS')
FROM Units WHERE (Type = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 				ResourceType,	Cost)
SELECT	('UNIT_DJ_MUTATAWWIA'),	ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DJ_MUTATAWWIA'),	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 				UnitAIType)
SELECT		('UNIT_DJ_MUTATAWWIA'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 				UnitClassType)
SELECT		('UNIT_DJ_MUTATAWWIA'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	('UNIT_DJ_MUTATAWWIA'),	('PROMOTION_RECRUITMENT');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	('UNIT_DJ_MUTATAWWIA'),	('PROMOTION_ENEMY_BLADE');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	('UNIT_DJ_MUTATAWWIA'),	('PROMOTION_GOLDEN_AGE_POINTS');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,					FlavorType, Flavor)
SELECT		('UNIT_DJ_MUTATAWWIA'),	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 	DefaultBuilding, 					Description)
VALUES		('BUILDINGCLASS_DJ_ALMOHADS', 	'BUILDING_DJ_ALMOHADS_GG_PRESSURE',	'TXT_KEY_TRAIT_DJ_UNITARIAN_REFORMS'),
			('BUILDINGCLASS_DJ_ZAWIYA', 	'BUILDING_DJ_ZAWIYA_GOLD',			'TXT_KEY_BUILDING_DJ_ZAWIYA_DESC');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 					BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, GreatWorkCount, GreatWorkSlotType, ArtInfoEraVariation, NeverCapture, 	TradeRouteLandGoldBonus,	TradeRouteLandDistanceModifier,	Description, 							Civilopedia, 								Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_DJ_ZAWIYA'),	BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, GreatWorkCount, GreatWorkSlotType, ArtInfoEraVariation, NeverCapture, 	TradeRouteLandGoldBonus,	TradeRouteLandDistanceModifier, ('TXT_KEY_BUILDING_DJ_ZAWIYA_DESC'),	('TXT_KEY_CIV5_BUILDINGS_DJ_ZAWIYA_TEXT'),	('TXT_KEY_BUILDING_DJ_ZAWIYA_HELP'),	('TXT_KEY_BUILDING_DJ_ZAWIYA_STRATEGY'),	ArtDefineTag, 3,				('DJ_ALMOHADS_COLOR_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';

INSERT INTO Buildings
			(Type,									BuildingClass,					Cost,	FaithCost,	GreatWorkCount,	Description,								ArtDefineTag,				NukeImmune,	HurryCostModifier,	MinAreaSize,	ReligiousPressureModifier,	GoldenAgeModifier,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus)
VALUES		('BUILDING_DJ_ALMOHADS_GG_PRESSURE',	'BUILDINGCLASS_DJ_ALMOHADS',	-1,		-1,			-1,				'TXT_KEY_TRAIT_DJ_UNITARIAN_REFORMS_SHORT',	'ART_DEF_BUILDING_GARDEN',	1,			-1,					-1,				25,							0,					0,								0),
			('BUILDING_DJ_ALMOHADS_GA_EXTENDER',	'BUILDINGCLASS_DJ_ALMOHADS',	-1,		-1,			-1,				'TXT_KEY_TRAIT_DJ_UNITARIAN_REFORMS_SHORT',	'ART_DEF_BUILDING_GARDEN',	1,			-1,					-1,				0,							75,					0,								0),
			('BUILDING_DJ_ZAWIYA_GOLD',				'BUILDINGCLASS_DJ_ZAWIYA',		-1,		-1,			-1,				'TXT_KEY_BUILDING_DJ_ZAWIYA_DESC',			'ART_DEF_BUILDING_GARDEN',	1,			-1,					-1,				0,							0,					50,								200);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		('BUILDING_DJ_ZAWIYA'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CARAVANSARY';
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,							Response,														Bias)
VALUES  ('LEADER_DJ_ABD_ALMUMIN',	'RESPONSE_AI_DOF_BACKSTAB',				'TXT_KEY_LEADER_DJ_ABD_ALMUMIN_DENOUNCE_FRIEND%',				500),
        ('LEADER_DJ_ABD_ALMUMIN',	'RESPONSE_ATTACKED_HOSTILE',			'TXT_KEY_LEADER_DJ_ABD_ALMUMIN_ATTACKED_HOSTILE%',				500),
        ('LEADER_DJ_ABD_ALMUMIN',	'RESPONSE_DEFEATED',					'TXT_KEY_LEADER_DJ_ABD_ALMUMIN_DEFEATED%',						500),
        ('LEADER_DJ_ABD_ALMUMIN',	'RESPONSE_DOW_GENERIC',					'TXT_KEY_LEADER_DJ_ABD_ALMUMIN_DOW_GENERIC%',					500),
        ('LEADER_DJ_ABD_ALMUMIN',	'RESPONSE_FIRST_GREETING',				'TXT_KEY_LEADER_DJ_ABD_ALMUMIN_FIRSTGREETING%',					500),
        ('LEADER_DJ_ABD_ALMUMIN',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',	'TXT_KEY_LEADER_DJ_ABD_ALMUMIN_RESPONSE_TO_BEING_DENOUNCED%',	500),
        ('LEADER_DJ_ABD_ALMUMIN',	'RESPONSE_WORK_AGAINST_SOMEONE',		'TXT_KEY_LEADER_DJ_ABD_ALMUMIN_DENOUNCE%',						500),
        ('LEADER_DJ_ABD_ALMUMIN',	'RESPONSE_WORK_WITH_US',				'TXT_KEY_LEADER_DJ_ABD_ALMUMIN_DEC_FRIENDSHIP%',				500);