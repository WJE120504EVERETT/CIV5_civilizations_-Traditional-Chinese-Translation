--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC',		'Americas',				48,		43,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC',		'Cordiform',			12,		26,		null,	null,	null),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC',		'EarthMk3',				154,	50,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC',		'GreatestEarth',		26,		35,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'Mesopotamia',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC',		'NorthAtlantic',		2,		4,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAITI_PAPA_DOC',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC',		'Yagem',				154,	47,		null,	null,	null),
		('CIVILIZATION_JFD_HAITI_PAPA_DOC',		'Yahem',				32,		43,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 					 LinguisticType)
SELECT	'CIVILIZATION_JFD_HAITI_PAPA_DOC',	 LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_HAITI_PAPA_DOC',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType,			  DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_HAITI_PAPA_DOC',	ArtDefineTag, 'CULTURE_JFD_COLONIAL', DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, 'JFD_ColonialLatin', 'JFD_WestAfrican', UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_FRANCE';

UPDATE Civilization_JFD_CultureTypes
SET DefeatScreenEarlyTag = 'JFD_WestAfrican', IdealsTag = 'JFD_WestAfrican', SoundtrackTag = 'JFD_WestAfrican'
WHERE CivilizationType = 'CIVILIZATION_JFD_HAITI_PAPA_DOC';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_HAITI_PAPA_DOC')
WHERE Type = 'CIVILIZATION_JFD_HAITI_PAPA_DOC'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,					 Weight)
VALUES	('CIVILIZATION_JFD_HAITI_PAPA_DOC',		'GOVERNMENT_JFD_TOTALITARIAN',	 100);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_VODUN'
WHERE CivilizationType = 'CIVILIZATION_JFD_HAITI_PAPA_DOC'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_VODUN');
--=======================================================================================================================
--=======================================================================================================================

