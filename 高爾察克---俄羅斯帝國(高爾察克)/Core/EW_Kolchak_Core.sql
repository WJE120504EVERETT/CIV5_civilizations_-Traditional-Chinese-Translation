--Russia under Kolchak
--By ExplosiveWatermelon
--Code by ExplosiveWatermelon
-----

--Leader

INSERT INTO Leaders
		(Type,					Description,						Civilopedia,							CivilopediaTag,					ArtDefineTag,						VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_EW_KOLCHAK',	'TXT_KEY_LEADER_EW_KOLCHAK',			'TXT_KEY_LEADER_EW_KOLCHAK_PEDIA',		'TXT_KEY_PEDIA_EW_KOLCHAK',		'Kolchak_LS.xml',		5,						4,						4,							10,			5,				4,				4,						4,						4,						6,				5,			4,			2,				3,			8,			0,				'ATLAS_EW_KOLCHAK');

-----

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_EW_KOLCHAK',	'MAJOR_CIV_APPROACH_WAR',		5),
		('LEADER_EW_KOLCHAK',	'MAJOR_CIV_APPROACH_HOSTILE',	4),
		('LEADER_EW_KOLCHAK',	'MAJOR_CIV_APPROACH_DECEPTIVE',	2),
		('LEADER_EW_KOLCHAK',	'MAJOR_CIV_APPROACH_GUARDED',	3),
		('LEADER_EW_KOLCHAK',	'MAJOR_CIV_APPROACH_FRIENDLY',	5),
		('LEADER_EW_KOLCHAK',	'MAJOR_CIV_APPROACH_AFRAID',	2),
		('LEADER_EW_KOLCHAK',	'MAJOR_CIV_APPROACH_NEUTRAL',	5);
		
-----

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_EW_KOLCHAK',	'MINOR_CIV_APPROACH_IGNORE',		4),
		('LEADER_EW_KOLCHAK',	'MINOR_CIV_APPROACH_FRIENDLY',		2),
		('LEADER_EW_KOLCHAK',	'MINOR_CIV_APPROACH_PROTECTIVE',	2),
		('LEADER_EW_KOLCHAK',	'MINOR_CIV_APPROACH_CONQUEST',		5),
		('LEADER_EW_KOLCHAK',	'MINOR_CIV_APPROACH_BULLY',			4);
		
-----

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_EW_KOLCHAK',	'FLAVOR_OFFENSE',					7),
		('LEADER_EW_KOLCHAK',	'FLAVOR_DEFENSE',					9),
		('LEADER_EW_KOLCHAK',	'FLAVOR_CITY_DEFENSE',				4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_MILITARY_TRAINING',			9),
		('LEADER_EW_KOLCHAK',	'FLAVOR_RECON',						4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_RANGED',					4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_MOBILE',					4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_NAVAL',						6),
		('LEADER_EW_KOLCHAK',	'FLAVOR_NAVAL_RECON',				5),
		('LEADER_EW_KOLCHAK',	'FLAVOR_NAVAL_GROWTH',				4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	5),
		('LEADER_EW_KOLCHAK',	'FLAVOR_AIR',						5),
		('LEADER_EW_KOLCHAK',	'FLAVOR_EXPANSION',					7),
		('LEADER_EW_KOLCHAK',	'FLAVOR_GROWTH',					4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_TILE_IMPROVEMENT',			4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_PRODUCTION',				7),
		('LEADER_EW_KOLCHAK',	'FLAVOR_GOLD',						2),
		('LEADER_EW_KOLCHAK',	'FLAVOR_SCIENCE',					6),
		('LEADER_EW_KOLCHAK',	'FLAVOR_CULTURE',					10),
		('LEADER_EW_KOLCHAK',	'FLAVOR_HAPPINESS',					2),
		('LEADER_EW_KOLCHAK',	'FLAVOR_GREAT_PEOPLE',				5),
		('LEADER_EW_KOLCHAK',	'FLAVOR_WONDER',					4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_RELIGION',					4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_DIPLOMACY',					7),
		('LEADER_EW_KOLCHAK',	'FLAVOR_SPACESHIP',					3),
		('LEADER_EW_KOLCHAK',	'FLAVOR_WATER_CONNECTION',			3),
		('LEADER_EW_KOLCHAK',	'FLAVOR_NUKE',						5),
		('LEADER_EW_KOLCHAK',	'FLAVOR_USE_NUKE',					5),
		('LEADER_EW_KOLCHAK',	'FLAVOR_ESPIONAGE',					4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_ANTIAIR',					4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_AIR_CARRIER',				4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_I_LAND_TRADE_ROUTE',		4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_I_SEA_TRADE_ROUTE',			4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_ARCHAEOLOGY',				4),
		('LEADER_EW_KOLCHAK',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_EW_KOLCHAK',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_EW_KOLCHAK',	'FLAVOR_AIRLIFT',					4);
		
-----

INSERT INTO Traits
		(Type,					Description,				ShortDescription)
VALUES	('TRAIT_EW_KOLCHAK',	'TXT_KEY_TRAIT_EW_KOLCHAK',	'TXT_KEY_TRAIT_EW_KOLCHAK_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_EW_KOLCHAK',	'TRAIT_EW_KOLCHAK');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,DerivativeCiv						,	CivilopediaTag,				ShortDescription,						Adjective,								DefaultPlayerColor,			ArtDefineTag,				ArtStyleType,				ArtStyleSuffix,	ArtStylePrefix,		PortraitIndex,	IconAtlas,				AlphaIconAtlas,			MapImage,				DawnOfManQuote,							DawnOfManImage)
SELECT	'CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA',	'CIVILIZATION_RUSSIA'	,'TXT_KEY_CIV5_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SHORT',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_ADJ',	'PLAYERCOLOR_EW_RUSSIA',	'ART_DEF_EW_RUSSIA',		'ARTSTYLE_EUROPEAN',		'_EURO',		'EUROPEAN',			0,				'ATLAS_EW_RUSSIA',		'ALPHA_EW_RUSSIA',		'kolchakMap_Small.dds',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_DOM',	'kolchak_DoM.dds'
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');

-----

INSERT INTO Civilization_CityNames
		(CivilizationType,			CityName)
VALUES	('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_1'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_2'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_3'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_4'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_5'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_6'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_7'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_8'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_9'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_10'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_11'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_12'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_13'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_14'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_15'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_16'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_17'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_18'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_19'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_20'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_21'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_22'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_23'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_24'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_25'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_26'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_27'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_28'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_29'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_CITY_30')
		;

--Units

INSERT INTO Units
		(Type,					Description,					Civilopedia,							Strategy,									Help,									Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	PortraitIndex,	IconAtlas,			UnitFlagIconOffset,	UnitFlagAtlas,		UnitArtInfo,	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech)
SELECT	'UNIT_EW_MARKOVTSY',		'TXT_KEY_UNIT_EW_MARKOVTSY',		'TXT_KEY_UNIT_EW_MARKOVTSY_PEDIA',			'TXT_KEY_UNIT_EW_MARKOVTSY_STRATEGY',			'TXT_KEY_UNIT_EW_MARKOVTSY_HELP',			Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	1,				'ATLAS_EW_KOLCHAK',	0,					'ALPHA_EW_MARKOVTSY',	UnitArtInfo,	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');

-----

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,	Flavor)
SELECT	'UNIT_EW_MARKOVTSY',	FlavorType,	Flavor + 5
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');

-----

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	('UNIT_EW_MARKOVTSY'),	('PROMOTION_SKI_INFANTRY');

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	('UNIT_EW_MARKOVTSY'),	('PROMOTION_GAIN_EXPERIENCE');

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	('UNIT_EW_MARKOVTSY'),	('PROMOTION_EW_MARKOVTSY');

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	('UNIT_EW_MARKOVTSY'),	('PROMOTION_CITY_PENALTY');

--Buildings

INSERT INTO Buildings
		(Type,					Description,					Civilopedia,						Strategy,								Help,								Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	PortraitIndex,	IconAtlas,			TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus)
SELECT	'BUILDING_EW_VOKZAL',	'TXT_KEY_BUILDING_EW_VOKZAL',	'TXT_KEY_BUILDING_EW_VOKZAL_PEDIA',	'TXT_KEY_BUILDING_EW_VOKZAL_STRATEGY',	'TXT_KEY_BUILDING_EW_VOKZAL_HELP',	Cost,	HurryCostModifier,	-1,				Happiness,	BuildingClass,	ArtDefineTag,	'TECH_RAILROAD',	2,				'ATLAS_EW_KOLCHAK',	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus
FROM Buildings WHERE (Type = 'BUILDING_HOTEL');

-----

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_EW_VOKZAL',	FlavorType,	Flavor + 5
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_HOTEL');
		
--Defines

INSERT INTO Civilization_FreeUnits
		(CivilizationType,				UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_EW_RUSSIA',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

-----

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,			BuildingClassType)
VALUES	('CIVILIZATION_EW_RUSSIA',	'BUILDINGCLASS_PALACE');

-----

INSERT INTO Civilization_FreeTechs
		(CivilizationType,			TechType)
VALUES	('CIVILIZATION_EW_RUSSIA',	'TECH_AGRICULTURE');

-----

INSERT INTO Civilization_Leaders
		(CivilizationType,			LeaderheadType)
VALUES	('CIVILIZATION_EW_RUSSIA',	'LEADER_EW_KOLCHAK');

-----

INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_EW_RUSSIA',	'RELIGION_ORTHODOXY');

-----

INSERT INTO Civilization_SpyNames
		(CivilizationType,			SpyName)
VALUES	('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_1'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_2'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_3'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_4'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_5'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_6'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_7'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_8'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_9'),
		('CIVILIZATION_EW_RUSSIA',	'TXT_KEY_CIVILIZATION_EW_RUSSIA_SPY_10');

-----

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,			UnitClassType,				UnitType)
VALUES	('CIVILIZATION_EW_RUSSIA',	'UNITCLASS_GREAT_WAR_INFANTRY',	'UNIT_EW_MARKOVTSY');

-----

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,			BuildingClassType,		BuildingType)
VALUES	('CIVILIZATION_EW_RUSSIA',	'BUILDINGCLASS_HOTEL',	'BUILDING_EW_VOKZAL');

--Diplo

INSERT INTO Diplomacy_Responses
			(LeaderType,			ResponseType,                                    Response,                                                       Bias)
VALUES		('LEADER_EW_KOLCHAK',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_EW_KOLCHAK_DEFEATED',                             500),
			('LEADER_EW_KOLCHAK',     'RESPONSE_DOW_GENERIC',							 'TXT_KEY_LEADER_EW_KOLCHAK_DOW_GENERIC',                          500),
			('LEADER_EW_KOLCHAK',     'RESPONSE_FIRST_GREETING',                       'TXT_KEY_LEADER_EW_KOLCHAK_FIRSTGREETING_%',                      500);

--Dummies

INSERT INTO BuildingClasses
		(Type,							DefaultBuilding,		Description)
VALUES	('BUILDINGCLASS_EW_RUSSIA_FAKE',	'BUILDING_EW_RUSSIA_FAKE',	'TXT_KEY_BUILDING_EW_RUSSIA_FAKE'),
		('BUILDINGCLASS_EW_VOKZAL_FAKE',	'BUILDING_EW_VOKZAL_FAKE',	'TXT_KEY_BUILDING_EW_VOKZAL_FAKE');

-----

INSERT INTO Buildings
		(Type,						Description,						NeverCapture,	NukeImmune,	Cost,	MinAreaSize,	BuildingClass,					GreatWorkCount,	PortraitIndex,	IconAtlas)
VALUES	('BUILDING_EW_RUSSIA_FAKE',	'TXT_KEY_BUILDING_EW_RUSSIA_FAKE',	1,				1,			-1,		-1,				'BUILDINGCLASS_EW_RUSSIA_FAKE',	-1,				19,				'BW_ATLAS_1'),
		('BUILDING_EW_VOKZAL_FAKE',	'TXT_KEY_BUILDING_EW_VOKZAL_FAKE',	1,				1,			-1,		-1,				'BUILDINGCLASS_EW_VOKZAL_FAKE',	-1,				19,				'BW_ATLAS_1');

-----

INSERT INTO Building_YieldChanges
		(BuildingType,	YieldType,	Yield)
VALUES	('BUILDING_EW_RUSSIA_FAKE',	'YIELD_GOLD',	1),
		('BUILDING_EW_VOKZAL',		'YIELD_GOLD',	2),
		('BUILDING_EW_VOKZAL_FAKE',	'YIELD_CULTURE',	1);

-----

INSERT INTO UnitPromotions
		(Type,	Description,	Help,	PortraitIndex,	IconAtlas,	Sound,	PediaType,	PediaEntry,	CannotBeChosen,	ExperiencePercent)
VALUES	('PROMOTION_EW_MARKOVTSY',	'TXT_KEY_PROMOTION_EW_MARKOVTSY',	'TXT_KEY_PROMOTION_EW_MARKOVTSY_HELP',	59,	'ABILITY_ATLAS',	'AS2D_IF_LEVELUP',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_EW_MARKOVTSY_HELP',	1,	50);