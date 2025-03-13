--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,            TraitOne,               TraitTwo)
SELECT  'LEADER_JFD_ERI',		'POLICY_CHARISMATIC_X',	'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Eri [ICON_HAPPINESS_1][ICON_PEACE]'
WHERE Type = 'LEADER_JFD_ERI'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- Buildings
------------------------------------------------------------
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_BRONZE_CASTER_HELP_CBO'
WHERE Type = 'BUILDING_JFD_BRONZE_CASTER'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------
-- Building_ResourceYieldChanges
------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 					ResourceType,		YieldType,		Yield)
SELECT	'BUILDING_JFD_BRONZE_CASTER',	'RESOURCE_COPPER',	'YIELD_GOLD',	1
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_FORGE'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);

INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 					ResourceType,		YieldType,		Yield)
SELECT	'BUILDING_JFD_BRONZE_CASTER',	'RESOURCE_IRON',	'YIELD_GOLD',	1
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_FORGE'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------	
-- Building_ImprovementYieldChanges
------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_ImprovementYieldChanges (
	BuildingType 					text 	REFERENCES Buildings(Type) 		default null,
	ImprovementType 				text	REFERENCES Improvements(Type) 	default null,
	YieldType						text									default	null,
	Yield							integer									default	0);

INSERT INTO Building_ImprovementYieldChanges 	
		(BuildingType, 					ImprovementType,	YieldType,		Yield)
SELECT	'BUILDING_JFD_BRONZE_CASTER',	ImprovementType,	YieldType,		Yield
FROM Building_ImprovementYieldChanges WHERE BuildingType = 'BUILDING_FORGE'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_SONGHAI'
WHERE Type = 'CIVILIZATION_JFD_NRI'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_SONGHAI');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		20,	34);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		62,	34);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		32,	12);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		50,	21);
------------------------------------------------------------	
-- Civilizations_AfricaLargeStartPosition (Africa Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		23,	42);
------------------------------------------------------------	
-- Civilizations_WestAfricaStartPosition (West Africa)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_WestAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_WestAfricaStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		74,	17);
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustStartPosition (Africa, Asia & Australia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		22,	43);
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroStartPosition (Africa & Southern Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		34, 39);
------------------------------------------------------------	
-- Civilizations_AfriGiantStartPosition (Africa Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriGiantStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_NRI',		59, 78);
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType,	CultureEra)
SELECT	'CIVILIZATION_JFD_NRI',		CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_SONGHAI';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
--====================================	
-- JFD COLONIES
--====================================	
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,			LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_NRI',		LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,						Flavor)
VALUES	('LEADER_JFD_ERI',			'FLAVOR_JFD_DECOLONIZATION',	0);
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,			DefaultTitle,											UniqueTitle)
VALUES	('CIVILIZATION_JFD_NRI',	'TXT_KEY_PROVINCE_JFD_BARONY_DESC_MONARCHY',			'TXT_KEY_PROVINCE_JFD_BARONY_DESC_NRI'),
		('CIVILIZATION_JFD_NRI',	'TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_MONARCHY',		'TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_NRI'),
		('CIVILIZATION_JFD_NRI',	'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_MONARCHY',			'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_NRI'),
		('CIVILIZATION_JFD_NRI',	'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_MONARCHY',		'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_NRI'),
		('CIVILIZATION_JFD_NRI',	'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_MONARCHY',				'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_NRI'),
		('CIVILIZATION_JFD_NRI',	'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_MONARCHY',		'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_NRI');
--====================================	
-- JFD SLAVERY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,				Flavor)
VALUES	('LEADER_JFD_ERI',			'FLAVOR_JFD_SLAVERY',	0);
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,		ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag,	IdealsTag, SplashScreenTag, SoundtrackTag,  UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_NRI',	ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag,	IdealsTag, 'JFD_Nri',		'JFD_Bantu',	UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Bantu'
WHERE Type = 'CIVILIZATION_JFD_NRI'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bantu')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD AND POUAKAI MERCENARIES
--====================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_JFD_ERI',			'FLAVOR_JFD_MERCENARY',		5);
--====================================	
-- JFD PIETY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,								Flavor)
VALUES	('LEADER_JFD_ERI',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_JFD_ERI',			'FLAVOR_JFD_STATE_RELIGION',			8);
--====================================
-- JFD PROSPERITY
--====================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,			CurrencyType)
SELECT	'CIVILIZATION_JFD_NRI',		CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--====================================	
-- JFD SOVEREIGNTY
--====================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,			LegislatureName,										OfficeTitle,													GovernmentType,				Weight)
SELECT	'CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_JFD_NRI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI',	'GOVERNMENT_JFD_THEOCRACY',	60
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_1'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_2'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_3'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_4'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_5'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_6'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_7'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_8'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_9'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_10'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_11'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_12'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_13'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_14'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_15'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_16'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_17'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_18'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_19'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_20'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_21'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_22'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_23'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_24'),
        ('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_NRI_25');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	CultureType							text 		 											default null,
	ReligionType						text 		REFERENCES Religions(Type) 					default null,
	DefaultTitle						text 		 											default null,
	UniqueTitle							text 		 											default null,
	UseAdjective						boolean													default 0);	
	
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,				DefaultTitle,											UniqueTitle,														UseAdjective)
VALUES	('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER_JFD_NRI',				0),	
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER_JFD_NRI',			0),	
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT_JFD_NRI',		0),	
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT_JFD_NRI',			0),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_JFD_NRI',				0),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER_JFD_NRI',				0),	
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT_JFD_NRI',			0),	
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT_JFD_NRI',			0),	
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_JFD_NRI',				0),	
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_THEOCRACY_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_THEOCRACY_TITLE_GOVERNMENT_JFD_NRI',		0),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_GOVERNMENT_JFD_THEOCRACY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_THEOCRACY_TITLE_LEADER_JFD_NRI',			0);	
------------------------------------------------------------
-- Religion_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_JFD_Governments (
	ReligionType  												text 	 										default null,
	LegislatureName												text 		 									default null,
	FactionName													text 		 									default null,
	OfficeTitle													text											default null);	
	
INSERT INTO Religion_JFD_Governments
		(ReligionType,			LegislatureName,									OfficeTitle,										FactionName)
SELECT	'RELIGION_ODINANI',		'TXT_KEY_JFD_LEGISLATURE_NAME_RELIGION_ODINANI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_JFD_NDI_NRI',	'TXT_KEY_JFD_FACTION_NAME_RELIGION_ODINANI'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RELIGION_ODINANI' AND Value = 1);	
------------------------------------------------------------
-- Religion_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Religion_JFD_Titles (
	ReligionType  												text 	 										default null,
	DefaultTitle												text 		 									default null,
	UniqueTitle													text 		 									default null,
	UseAdjective												boolean											default 0,					
	UseCapitalName												boolean											default 0);	

INSERT INTO Religion_JFD_Titles
		(ReligionType,				DefaultTitle,											UniqueTitle)
SELECT	'RELIGION_ODINANI',			'TXT_KEY_GOVERNMENT_JFD_THEOCRACY_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_THEOCRACY_TITLE_GOVERNMENT_JFD_ODINANI'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RELIGION_ODINANI' AND Value = 1);		
		
INSERT INTO Religion_JFD_Titles
		(ReligionType,				DefaultTitle,											UniqueTitle)
SELECT	'RELIGION_ODINANI',			'TXT_KEY_GOVERNMENT_JFD_THEOCRACY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_THEOCRACY_TITLE_LEADER_JFD_ODINANI'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RELIGION_ODINANI' AND Value = 1);	
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 			default null,
	PoliticsType  						text 												default null,
	UniqueName							text												default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				UniqueName,											PoliticsType)
VALUES	('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_ASSEMBLY_JFD_MILITARY_JFD_NRI',		'ASSEMBLY_JFD_MILITARY'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_FACTION_JFD_NATIONALIST_JFD_NRI',		'FACTION_JFD_NATIONALIST'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_FACTION_JFD_POPULARIST_JFD_NRI',		'FACTION_JFD_POPULARIST'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_JFD_NRI',		'FACTION_JFD_REVOLUTIONARY'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_BURGHERS_JFD_NRI',			'PARTY_JFD_BURGHERS'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_CLERGY_JFD_NRI',				'PARTY_JFD_CLERGY'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_JFD_NRI',			'PARTY_JFD_COMMUNIST'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_JFD_NRI',		'PARTY_JFD_CONSERVATIVE'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_FASCIST_JFD_NRI',			'PARTY_JFD_FASCIST'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_LIBERAL_JFD_NRI',			'PARTY_JFD_LIBERAL'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_JFD_NRI',		'PARTY_JFD_LIBERTARIAN'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_NOBILITY_JFD_NRI',			'PARTY_JFD_NOBILITY'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_JFD_NRI',		'PARTY_JFD_REVOLUTIONARY'),
		('CIVILIZATION_JFD_NRI',		'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_JFD_NRI',			'PARTY_JFD_SOCIALIST');
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_JFD_ERI',		'FLAVOR_JFD_REFORM_GOVERNMENT',		8),
		('LEADER_JFD_ERI',		'FLAVOR_JFD_REFORM_LEGAL',			7),
		('LEADER_JFD_ERI',		'FLAVOR_JFD_REFORM_CULTURE',		9),
		('LEADER_JFD_ERI',		'FLAVOR_JFD_REFORM_ECONOMIC',		5),
		('LEADER_JFD_ERI',		'FLAVOR_JFD_REFORM_FOREIGN',		7),
		('LEADER_JFD_ERI',		'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_JFD_ERI',		'FLAVOR_JFD_REFORM_MILITARY',		8),
		('LEADER_JFD_ERI',		'FLAVOR_JFD_REFORM_RELIGION',		2);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  					text 	REFERENCES Leaders(Type) 	default	null,
	ReformType						text								default	null);
	
INSERT INTO Leader_JFD_Reforms
		(LeaderType,			ReformType)
VALUES	('LEADER_JFD_ERI',		'REFORM_JFD_LEGITIMACY_DIVINE_RIGHT'),
		('LEADER_JFD_ERI',		'REFORM_JFD_POWER_SOFT'),
		('LEADER_JFD_ERI',		'REFORM_JFD_FESTIVALS_PRAYER');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Nri_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,											Description)
VALUES	('POLICY_DECISIONS_JFD_NRI_ANAMBRA_RIVER',		'TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER'),
		('POLICY_DECISIONS_JFD_NRI_IKENGA',				'TXT_KEY_DECISIONS_JFD_NRI_IKENGA');
--------------------------------
-- Policy_BuildingClassYieldChanges 
--------------------------------	
INSERT INTO Policy_BuildingClassYieldChanges 	
		(PolicyType, 									BuildingClassType,			YieldType,		 YieldChange)
VALUES	('POLICY_DECISIONS_JFD_NRI_IKENGA',				'BUILDINGCLASS_TEMPLE',		'YIELD_FAITH',	 2),
		('POLICY_DECISIONS_JFD_NRI_IKENGA',				'BUILDINGCLASS_MARKET',		'YIELD_FAITH',	 2);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Nri_Events.lua');
--==========================================================================================================================
--==========================================================================================================================