--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 							LinguisticType)
SELECT	'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,								MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',			'Cordiform',			45,		28,		null,	null,	null),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',			'EarthMk3',				36,		64,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'EastAsia',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',			'EuroLarge',			57,		41,		null,	null,	null),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',			'EuroLargeNew',			63,		38,		null,	null,	null),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',			'GreatestEarth',		61,		50,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',			'Yagem',				36,		66,		null,	null,	null),
		('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',			'Yahem',				71,		58,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,							MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,							ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO')
WHERE Type = 'CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 							GovernmentType,					Weight)
VALUES	('CIVILIZATION_JFD_ZAPORIZHZHIA_SIRKO',		'GOVERNMENT_JFD_MILITARY',		80);
--=======================================================================================================================
--=======================================================================================================================

