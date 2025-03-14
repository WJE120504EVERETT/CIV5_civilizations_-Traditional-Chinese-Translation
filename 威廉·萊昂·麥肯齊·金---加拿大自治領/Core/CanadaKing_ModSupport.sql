--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Buildings 	
		(Type, 								TrainedFreePromotion,	BuildingClass, Water, Cost, FaithCost, PrereqTech, GoldMaintenance, MinAreaSize, SpecialistCount, SpecialistType, MutuallyExclusiveGroup, NeverCapture, Description, 								Help, 												Strategy,												Civilopedia, 								ArtDefineTag,	PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	TrainedFreePromotion,	BuildingClass, Water, Cost, FaithCost, PrereqTech, GoldMaintenance, MinAreaSize, SpecialistCount, SpecialistType, MutuallyExclusiveGroup, 1, 			'TXT_KEY_BUILDING_JFD_MERCHANT_SHIPYARD', 	'TXT_KEY_BUILDING_JFD_MERCHANT_SHIPYARD_HELP_EE',	'TXT_KEY_BUILDING_JFD_MERCHANT_SHIPYARD_STRATEGY_EE',	'TXT_KEY_BUILDING_JFD_MERCHANT_SHIPYARD_TEXT',	ArtDefineTag,	2, 				'JFD_CANADA_KING_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK';		
--------------------------------------------------------------------------------------------------------------------------	
-- Building_SeaResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_SeaResourceYieldChanges WHERE BuildingType = 'BUILDING_JFD_MERCHANT_SHIPYARD'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
--------------------------------------------------------------------------------------------------------------------------	
-- Building_DomainProductionModifiers
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_JFD_MERCHANT_SHIPYARD'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_JFD_MERCHANT_SHIPYARD'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_DRYDOCK'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_JFD_MERCHANT_SHIPYARD'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
INSERT INTO Building_YieldChanges 	
		(BuildingType, 						YieldType,	Yield)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_EE_DRYDOCK'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
--------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_JFD_MERCHANT_SHIPYARD'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,	Flavor)
SELECT	'BUILDING_JFD_MERCHANT_SHIPYARD',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_EE_DRYDOCK'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_EE_DRYDOCK'
WHERE BuildingType = 'BUILDING_JFD_MERCHANT_SHIPYARD'
AND EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
--==========================================================================================================================
-- CIVILOPEDIA
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_JFD_FLOWER_CLASS_ACTIVE');
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LAW'),
		('FLAVOR_JFD_REFORM_DIPLOMACY'),
		('FLAVOR_JFD_REFORM_ECONOMY'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_REFORM_SOCIETY'),
		('FLAVOR_JFD_REFORM_WELFARE'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_DECOLONIZATION',		9),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_MERCENARY',				5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	0),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_LAW',			5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_DIPLOMACY',		3),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_ECONOMY',		5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_EDUCATION',		5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_INDUSTRY',		7),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_MILITARY',		2),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_RELIGION',		2),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_SOCIETY',		5),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_REFORM_WELFARE',		6),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_SLAVERY',				0),
		('LEADER_JFD_CANADA_KING',	'FLAVOR_JFD_STATE_RELIGION',		0);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y)
VALUES	('CIVILIZATION_JFD_CANADA_KING',	'Americas',				48,		58),
		('CIVILIZATION_JFD_CANADA_KING',	'AmericasGiant',		67,		126),
		('CIVILIZATION_JFD_CANADA_KING',	'AtlanticGiant',		76,		83),
		('CIVILIZATION_JFD_CANADA_KING',	'Cordiform',			18,		36),
		('CIVILIZATION_JFD_CANADA_KING',	'EarthMk3',				152,	76),
		('CIVILIZATION_JFD_CANADA_KING',	'GreatestEarth',		20,		54),
		('CIVILIZATION_JFD_CANADA_KING',	'NorthAmericaGiant',	95,		63),
		('CIVILIZATION_JFD_CANADA_KING',	'NorthAmericaHuge',		94,		50),
		('CIVILIZATION_JFD_CANADA_KING',	'NorthAtlantic',		19,		44),
		('CIVILIZATION_JFD_CANADA_KING',	'Yagem',				155,	70),
		('CIVILIZATION_JFD_CANADA_KING',	'Yahem',				31,		59);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_CANADA_KING',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_CultureTypes(
	CivilizationType 					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType 						text											default null,
	SubCultureType 						text											default null,
	ArtDefineTag						text											default	null,
	DecisionsTag						text											default	null,
	DefeatScreenEarlyTag				text											default	null,
	DefeatScreenMidTag					text											default	null,
	DefeatScreenLateTag					text											default	null,
	IdealsTag							text											default	null,
	SplashScreenTag						text											default	null,
	SoundtrackTag						text											default	null,
	UnitDialogueTag						text											default null);
	
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_CANADA_KING',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';
	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_JFD_CANADA_KING'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 					GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_CANADA_KING', 	'GOVERNMENT_JFD_MONARCHY',	60);
--==========================================================================================================================
--==========================================================================================================================