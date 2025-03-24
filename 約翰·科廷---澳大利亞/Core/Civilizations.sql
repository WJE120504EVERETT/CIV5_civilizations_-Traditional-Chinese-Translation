--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_CURTIN'), 		('TXT_KEY_CIV_SENSHI_CURTIN_DESC'), 		('TXT_KEY_CIV_SENSHI_CURTIN_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_CURTIN_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_CURTIN_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_CURTIN'), 		('PLAYERCOLOR_SENSHI_CURTIN'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_CURTIN_ATLAS'), 		0, 				('SENSHI_CURTIN_ALPHA_ATLAS'), 	('ENGLAND'), 	('CurtinMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_CURTIN_TEXT'), 	('CurtinDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_CURTIN')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND' )
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_SENSHI_CURTIN';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_01'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_02'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_03'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_04'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_05'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_06'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_07'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_08'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_09'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_10'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_11'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_12'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_13'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_14'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_15'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_16'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_17'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_18'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_19'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_20'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_21'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_22'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_23'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_24'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_25'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_26'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_27'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_28'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_29'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_30'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_31'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_32'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_33'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_34'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_35'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_36'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_37'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_38'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_39'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_40'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_41'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_42'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_CITY_NAME_SENSHI_CURTIN_43');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_CURTIN'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_CURTIN'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_CURTIN'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_Start_Region_Avoid
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Avoid
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_SENSHI_CURTIN', 	'REGION_TUNDRA');	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_CURTIN', 	'LEADER_SENSHI_CURTIN');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SENSHI_CURTIN', 	'UNITCLASS_FIGHTER',		'UNIT_SENSHI_BOOMERANG'),
			('CIVILIZATION_SENSHI_CURTIN', 	'UNITCLASS_MACHINE_GUN',	'UNIT_SENSHI_INDEPENDENT_COMPANY');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_CURTIN', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_0'),	
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_1'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_2'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_3'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_4'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_5'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_6'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_7'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_8'),
			('CIVILIZATION_SENSHI_CURTIN', 	'TXT_KEY_SPY_NAME_SENSHI_CURTIN_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

