--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Buildings 	
		(Type, 							BuildingClass, Cost, GoldMaintenance, PrereqTech, TrainedFreePromotion, MinAreaSize, NeverCapture,  Description, 							Help, 											Strategy,											Civilopedia, 								ArtDefineTag,	IconAtlas,							PortraitIndex)
SELECT	'BUILDING_JFD_NAVAL_COLLEGE',	BuildingClass, Cost, GoldMaintenance, PrereqTech, TrainedFreePromotion, MinAreaSize, 1, 			'TXT_KEY_BUILDING_JFD_NAVAL_COLLEGE', 	'TXT_KEY_BUILDING_JFD_NAVAL_COLLEGE_HELP_EE',	'TXT_KEY_BUILDING_JFD_NAVAL_COLLEGE_STRATEGY_EE',	'TXT_KEY_BUILDING_JFD_NAVAL_COLLEGE_TEXT',	ArtDefineTag, 	'JFD_GREAT_QING_CIXI_ICON_ATLAS',	3
FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');		

UPDATE Buildings
SET FreeBuildingThisCity = 'BUILDINGCLASS_ARSENAL'
WHERE Type = 'BUILDING_JFD_NAVAL_COLLEGE';
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_JFD_NAVAL_COLLEGE' AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_JFD_NAVAL_COLLEGE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_DRYDOCK'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
------------------------------------------------------------------------------------------------------------------------	
-- Building_DomainProductionModifiers
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_JFD_NAVAL_COLLEGE' AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_JFD_NAVAL_COLLEGE' AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,	Flavor)
SELECT	'BUILDING_JFD_NAVAL_COLLEGE',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_EE_DRYDOCK'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
------------------------------------------------------------------------------------------------------------------------	
-- Building_SeaResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_SeaResourceYieldChanges WHERE BuildingType = 'BUILDING_JFD_NAVAL_COLLEGE' AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 						ColonyName, LinguisticType)
SELECT	'CIVILIZATION_JFD_GREAT_QING_CIXI',		ColonyName, LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',		'AfriAsiaAust',			106,	77,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'Americas',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',		'Asia',					67,		55,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',		'Cordiform',			60,		35,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',		'EarthMk3',				86,		68,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',		'GreatestEarth',		87,		54,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'NorthAtlantic',		0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',		'NorthEastAsia',		6,		40,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_QING_CIXI',		'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',		'Yagem',				83,		65,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_QING_CIXI',		'Yahem',				105,	52,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_GREAT_QING_CIXI',		MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_GREAT_QING_CIXI',		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_GREAT_QING_CIXI')
WHERE Type = 'CIVILIZATION_JFD_GREAT_QING_CIXI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				 Weight)
VALUES	('CIVILIZATION_JFD_GREAT_QING_CIXI',	'GOVERNMENT_JFD_IMPERIAL',	 80);
------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_EE_DRYDOCK'
WHERE CivilizationType = 'CIVILIZATION_JFD_GREAT_QING_CIXI' AND BuildingClassType = 'BUILDINGCLASS_SEAPORT'
AND EXISTS (SELECT Type FROM Buildings WHERE Type = 'BUILDING_EE_DRYDOCK');
--=======================================================================================================================
--=======================================================================================================================

