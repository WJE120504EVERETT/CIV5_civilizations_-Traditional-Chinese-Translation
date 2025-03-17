--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 							Description, 					ShortDescription, 		Adjective, 							CivilopediaTag, 					DefaultPlayerColor, 			DerivativeCiv,				ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 					DawnOfManQuote, 							DawnOfManImage,				DawnOfManAudio)
SELECT		('CIVILIZATION_MC_SOVIETS'), 	('TXT_KEY_MC_SOVIETS_DESC'), 	('TXT_KEY_MC_SOVIETS'),	('TXT_KEY_MC_SOVIETS_ADJECTIVE'), 	('TXT_KEY_CIVILOPEDIA_MC_SOVIETS'),	('PLAYERCOLOR_MC_SOVIETS'), 	('CIVILIZATION_RUSSIA'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	('MC_SOVIETS_ATLAS'), 	0, 				('MC_SOVIETS_ALPHA_ATLAS'),	('Russia'), 	('MC_SOVIETS_Map.dds'), 	('TXT_KEY_DAWN_OF_MAN_MC_SOVIETS_TEXT'), 	('MC_SOVIETS_DoM.dds'),	('AS2D_DOM_SPEECH_MC_SOVIETS')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');

--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_MC_SOVIETS', 	'LEADER_MC_KHRUSHCHEV');

--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_MC_SOVIETS', 	'BUILDINGCLASS_PALACE');
			
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
VALUES		('CIVILIZATION_MC_SOVIETS', 	'TECH_AGRICULTURE');
			
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType,			Count,		UnitAIType)
VALUES		('CIVILIZATION_MC_SOVIETS', 	'UNITCLASS_SETTLER',	1,			'UNITAI_SETTLE');
	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType,				UnitType)
VALUES		('CIVILIZATION_MC_SOVIETS', 	'UNITCLASS_JET_FIGHTER',	'UNIT_MC_SOVIET_MIG_21');
			
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_MC_SOVIETS', 	'BUILDINGCLASS_LABORATORY',	'BUILDING_MC_SOVIET_OKB');
			
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		'CIVILIZATION_MC_SOVIETS', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');

--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 												
		(Type,									Red, 		Green, 		Blue,		Alpha)
VALUES	('COLOR_PLAYER_MC_SOVIETS_ICON', 		0.71,		0.541,		0.294,		1),
		('COLOR_PLAYER_MC_SOVIETS_BACKGROUND',	0.38,		0.094,		0.196,		1);

--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_MC_SOVIETS',	'COLOR_PLAYER_MC_SOVIETS_ICON',	'COLOR_PLAYER_MC_SOVIETS_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 						
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_MOSCOW'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_LENINGRAD'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_KIEV'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_GORKY'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_KHARKIV'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_TASHKENT'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_NOVOSIBIRSK'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_KUYBYSHEV'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_VILNIUS'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_SVERDLOVSK'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_STALINO'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_TBLISI'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_VLADIVOSTOK'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_CHELYABINSK'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_ALMA_ATA'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_ODESSA'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_KAZAN'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_DNEPROPETROVSK'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_BAKU'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_PERM'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_ROSTOV_ON_DON'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_YEREVAN'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_RIGA'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_MINSK'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_STALINGRAD'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_OMSK'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_FRUNZE'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_CHISINAU'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_BAIKONUR'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_STALINABAD'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_ASHGABAT'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_BUKHARA'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_TALINN'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_UFA'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_KRASNOYARSK_26'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_SUKHUMI'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_KHIVA'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_KYZYL'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_YALTA'),
		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_CITY_NAME_MC_SOVIETS_SEVASTOPOL');			

--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_0'),	
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_1'),
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_2'),
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_3'),
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_4'),
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_5'),
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_6'),
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_7'),
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_8'),
			('CIVILIZATION_MC_SOVIETS', 	'TXT_KEY_SPY_NAME_MC_SOVIETS_9');
--==========================================================================================================================	
--==========================================================================================================================	
