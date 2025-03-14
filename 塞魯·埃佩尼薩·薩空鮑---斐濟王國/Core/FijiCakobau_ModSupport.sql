--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 					 LinguisticType)
SELECT	'CIVILIZATION_JFD_FIJI_CAKOBAU',	 LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'Asia',					0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'Cordiform',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_FIJI_CAKOBAU',		'EarthMk3',				118,	21,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_FIJI_CAKOBAU',		'GreatestEarth',		3,		16,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_FIJI_CAKOBAU',	'Orient',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_FIJI_CAKOBAU',		'SouthPacific',			32,		36,		null,	null,	null),
		('CIVILIZATION_JFD_FIJI_CAKOBAU',		'Yagem',				117,	23,		null,	null,	null),
		('CIVILIZATION_JFD_FIJI_CAKOBAU',		'Yahem',				7,		21,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_FIJI_CAKOBAU',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_FIJI_CAKOBAU',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_FIJI_CAKOBAU')
WHERE Type = 'CIVILIZATION_JFD_FIJI_CAKOBAU'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 					GovernmentType,				 Weight)
VALUES	('CIVILIZATION_JFD_FIJI_CAKOBAU',   'GOVERNMENT_JFD_MONARCHY',	 70);
--=======================================================================================================================
--=======================================================================================================================
