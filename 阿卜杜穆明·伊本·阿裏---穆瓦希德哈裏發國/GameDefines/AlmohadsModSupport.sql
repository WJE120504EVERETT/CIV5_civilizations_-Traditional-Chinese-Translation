--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,	MapPrefix, 	X,	Y,	AltX,	AltY)
SELECT	CivilizationType,	MapPrefix,	X,	Y,	AltX,	AltY
FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_MOROCCO';
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_DJ_ALMOHADS',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_MOROCCO';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- CIVILOPEDIA
--------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO JFD_Civilopedia_HideFromPedia
-- 		(Type);
--------------------------------------------------------------------------------------------------------------------------
-- LEADER FLAVOURS
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'), --0-10. Determines likelihood for annexing a colony, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_MERCENARY'), --0-10. Determines likelihood of taking out Mercenary Contracts, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_REFORM_GOVERNMENT'), --0-10. Determines Reform preference; corresponding to Left>Centre>Right/Liberal to Authoritarian continuum. 1-4=Left, 5-6=Centre, 7-10=Right. For government issues.
		('FLAVOR_JFD_REFORM_LEGAL'), --same as above for legal issues. 
		('FLAVOR_JFD_REFORM_CULTURE'), --same as above for cultural issues.
		('FLAVOR_JFD_REFORM_ECONOMIC'), --same as above for economic issues. 
		('FLAVOR_JFD_REFORM_EDUCATION'), --same as above for educational issues.
		('FLAVOR_JFD_REFORM_FOREIGN'), --same as above for diplomatic/international issues.
		('FLAVOR_JFD_REFORM_INDUSTRY'), --same as above for industrial/labour issues.
		('FLAVOR_JFD_REFORM_MILITARY'), --same as above for military issues.
		('FLAVOR_JFD_REFORM_RELIGION'), --same as above for religious issues.
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'), --0-12. Determines the diplomatic penalty/bonus with leaders of a different/same state religion
		('FLAVOR_JFD_SLAVERY'), --0-10. Determines likelihood of enslaving Cities and spending Shackles on Slave Units, where 0 means never, and 10 as much as possible.
		('FLAVOR_JFD_STATE_RELIGION'); --0-12. Determines chance to adopt a State Religion, where 0 means never. 9+ also means this leader will never secularize.
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
		(CivilizationType,			CultureType, SubCultureType,	ArtDefineTag,	DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_DJ_ALMOHADS', CultureType, SubCultureType,	ArtDefineTag,	DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MOROCCO';

-- UPDATE Civilizations 
-- SET SoundtrackTag = 'JFD_Northern'
-- WHERE Type = 'CIVILIZATION_DJ_ALMOHADS'
-- AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern');
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S SOVEREIGNTY
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  	text 		REFERENCES Civilizations(Type) 				default null,
	CultureType	  		text 		 											default null,
	GovernmentType		text													default	null,
	GovernmentName		text													default	null,
	Weight				integer													default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,				GovernmentType,				Weight)
INSERT	('CIVILIZATION_DJ_ALMOHADS',	'GOVERNMENT_JFD_CALIPHATE',	100);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Titles
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  	text 		REFERENCES Civilizations(Type) 				default null,
	CultureType			text 		 											default null,
	ReligionType		text 		REFERENCES Religions(Type) 					default null,
	DefaultTitle		text 		 											default null,
	UniqueTitle			text 		 											default null,
	UseAdjective		boolean													default 0);

INSERT INTO Civilization_JFD_Titles
			(CivilizationType,				DefaultTitle,	UniqueTitle, 	UseAdjective)
SELECT		('CIVILIZATION_DJ_ALMOHADS'),	DefaultTitle,	UniqueTitle,	UseAdjective
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_MOROCCO';
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Mods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  				integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text		default	null,
	ModName				text		default null,
	ModID				text		default	null,	
	Authors				text		default	null);

INSERT INTO AdditionalAchievements_Mods
		(Type,				ModName,						ModID,								Authors)
VALUES	('MOD_DJ_ALMOHADS',	'TXT_KEY_MOD_DJ_ALMOHADS_NAME',	'TXT_KEY_MOD_DJ_ALMOHADS_ID_STEAM',	'TXT_KEY_MOD_DJ_ALMOHADS_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID					integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text					default	null,
	Achievopedia		text					default null,
	Header				text					default	null,	
	IconAtlas			text					default	null,	
	PortraitIndex		integer					default	0,
	ModType				text					default	null,	
	ModVersion			integer					default	0,
	Unlocked			boolean					default	0,
	LockedIconAtlas		text					default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex	integer					default	23,
	UnlockSound			text					default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration		integer					default	-1,
	Hidden				boolean					default	0,
	HiddenBorder		boolean					default	0,
	RequiredCivWin		text					default	null,
	RequiredCivLoss		text					default	null,
	RequiredCivKill		text					default	null);

INSERT INTO AdditionalAchievements
		(Type,						Header,										Achievopedia,							ModType,			ModVersion,		RequiredCivWin,				IconAtlas,					PortraitIndex)
VALUES	('AA_DJ_ALMOHADS_SPECIAL',	'TXT_KEY_AA_DJ_ALMOHADS_SPECIAL_HEADER',	'TXT_KEY_AA_DJ_ALMOHADS_SPECIAL_TEXT',	'MOD_DJ_ALMOHADS',	1,				null,						'DJ_ALMOHADS_COLOR_ATLAS',	0),
		('AA_DJ_ALMOHADS_VICTORY',	'TXT_KEY_AA_DJ_ALMOHADS_VICTORY_HEADER',	'TXT_KEY_AA_DJ_ALMOHADS_VICTORY_TEXT',	'MOD_DJ_ALMOHADS',	1,				'CIVILIZATION_DJ_ALMOHADS',	'DJ_ALMOHADS_COLOR_ATLAS',	0);
