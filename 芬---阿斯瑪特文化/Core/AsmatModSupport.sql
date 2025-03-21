--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- CIVILOPEDIA
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_SAS_ASMAT', 	'GOVERNMENT_JFD_MILITARY',	10),
		('CIVILIZATION_SAS_ASMAT', 	'GOVERNMENT_JFD_TRIBAL',	90);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SAS_ASMAT',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_INDONESIA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Oceanic'
WHERE Type = 'CIVILIZATION_SAS_ASMAT'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--==========================================================================================================================
INSERT INTO Civilization_Religions
	(CivilizationType,		 ReligionType)
VALUES	('CIVILIZATION_SAS_ASMAT',	'RELIGION_PROTESTANTISM');

UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_MALAGAN" )
THEN "RELIGION_MALAGAN"
ELSE "RELIGION_PROTESTANTISM" END
) WHERE CivilizationType = "CIVILIZATION_SAS_ASMAT";

CREATE TRIGGER IF NOT EXISTS THP_YaliReligion_Insert
AFTER INSERT ON Religions
WHEN (NEW.Type = 'RELIGION_MALAGAN') AND EXISTS (SELECT Type FROM Civilizations WHERE Type='CIVILIZATION_SAS_ASMAT')
BEGIN
UPDATE Civilization_Religions
SET ReligionType = NEW.Type
WHERE CivilizationType = 'CIVILIZATION_SAS_ASMAT';
END;