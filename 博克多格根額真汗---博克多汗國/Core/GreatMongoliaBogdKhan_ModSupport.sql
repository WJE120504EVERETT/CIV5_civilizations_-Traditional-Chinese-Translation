--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 									LinguisticType)
SELECT	'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',		LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_MONGOLIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
DELETE FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_CHINA';
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,									MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'AfriAsiaAust',			101,    78,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'Cordiform',			55,		36,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'EarthMk3',				79,		76,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'EastAsia',				25,		78,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'GreatestEarth',		83,		58,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'Yagem',				74,		71,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',		'Yahem',				101,	59,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,								MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_MONGOLIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,								ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MONGOLIA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN')
WHERE Type = 'CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 								GovernmentType,			 Weight)
VALUES	('CIVILIZATION_JFD_GREAT_MONGOLIA_BOGD_KHAN',	'GOVERNMENT_THEOCRACY',	 100);
--=======================================================================================================================
--=======================================================================================================================

