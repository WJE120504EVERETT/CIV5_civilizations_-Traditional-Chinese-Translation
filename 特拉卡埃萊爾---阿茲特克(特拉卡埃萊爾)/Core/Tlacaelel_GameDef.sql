-- Tlacaelel's Aztec
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_AZTEC', 'TXT_KEY_CIV_THP_AZTEC_DESC',  'TXT_KEY_CIV_THP_AZTEC_SHORT_DESC',   'TXT_KEY_CIV_THP_AZTEC_ADJECTIVE',    Civilopedia,  CivilopediaTag, 'PLAYERCOLOR_THP_AZTEC',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_AZTEC_ATLAS',   0,             'THP_AZTEC_ALPHA_ATLAS',   SoundtrackTag,  'Map_Tlacaelel.dds',  'TXT_KEY_CIV5_DAWN_THP_AZTEC_TEXT',   'Tlacaelel_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_AZTEC';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,          CityName)
SELECT  'CIVILIZATION_THP_AZTEC',   CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_AZTEC';
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,            BuildingClassType)
SELECT    'CIVILIZATION_THP_AZTEC',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_AZTEC';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,            TechType)
SELECT    'CIVILIZATION_THP_AZTEC',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_AZTEC';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,            UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_AZTEC',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_AZTEC';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,          LeaderheadType)
VALUES ('CIVILIZATION_THP_AZTEC', 'LEADER_THP_TLACAELEL');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,          BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_THP_AZTEC', 'BUILDINGCLASS_TEMPLE', 'BUILDING_THP_TEOCALLI');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,          UnitClassType,       UnitType)
VALUES ('CIVILIZATION_THP_AZTEC', 'UNITCLASS_PIKEMAN', 'UNIT_THP_EAGLE_WARRIOR');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,          ReligionType)
VALUES ('CIVILIZATION_THP_AZTEC', 'RELIGION_CHRISTIANITY');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,              SpyName)
VALUES    ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_0'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_1'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_2'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_3'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_4'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_5'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_6'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_7'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_8'),
          ('CIVILIZATION_THP_AZTEC',     'TXT_KEY_SPY_NAME_THP_AZTEC_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                Description,                                             Civilopedia,                               CivilopediaTag,     ArtDefineTag,              VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_TLACAELEL',     'TXT_KEY_LEADER_THP_TLACAELEL',    'TXT_KEY_LEADER_THP_TLACAELEL_PEDIA_TEXT',  'TXT_KEY_LEADER_THP_TLACAELEL_PEDIA', 'Leaderhead_Tlacaelel.xml',    9,                          6,                         3,                           9,                     4,              0,                 5,                       5,              3,           3,            7,               6,          6,           'THP_AZTEC_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                  MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_TLACAELEL',     'MAJOR_CIV_APPROACH_WAR',           9),
          ('LEADER_THP_TLACAELEL',     'MAJOR_CIV_APPROACH_HOSTILE',       6),
          ('LEADER_THP_TLACAELEL',     'MAJOR_CIV_APPROACH_DECEPTIVE',     6),
          ('LEADER_THP_TLACAELEL',     'MAJOR_CIV_APPROACH_GUARDED',       4),
          ('LEADER_THP_TLACAELEL',     'MAJOR_CIV_APPROACH_AFRAID',        2),
          ('LEADER_THP_TLACAELEL',     'MAJOR_CIV_APPROACH_FRIENDLY',      5),
          ('LEADER_THP_TLACAELEL',     'MAJOR_CIV_APPROACH_NEUTRAL',       5);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                  MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_TLACAELEL',     'MINOR_CIV_APPROACH_IGNORE',        2),
          ('LEADER_THP_TLACAELEL',     'MINOR_CIV_APPROACH_FRIENDLY',      1),
          ('LEADER_THP_TLACAELEL',     'MINOR_CIV_APPROACH_PROTECTIVE',    6),
          ('LEADER_THP_TLACAELEL',     'MINOR_CIV_APPROACH_CONQUEST',      9),
          ('LEADER_THP_TLACAELEL',     'MINOR_CIV_APPROACH_BULLY',         7);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                  FlavorType,                        Flavor)
VALUES    ('LEADER_THP_TLACAELEL',     'FLAVOR_OFFENSE',                   10),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_DEFENSE',                   5),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_CITY_DEFENSE',              5),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_MILITARY_TRAINING',         9),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_RECON',                     4),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_RANGED',                    6),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_MOBILE',                    4),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_NAVAL',                     5),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_NAVAL_RECON',               2),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_NAVAL_GROWTH',              4),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    4),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_AIR',                       5),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_EXPANSION',                 8),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_GROWTH',                    6),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_TILE_IMPROVEMENT',          5),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_INFRASTRUCTURE',            4),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_PRODUCTION',                6),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_GOLD',                      4),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_SCIENCE',                   3),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_CULTURE',                   9),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_HAPPINESS',                 5),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_GREAT_PEOPLE',              3),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_WONDER',                    7),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_RELIGION',                  6),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_DIPLOMACY',                 3),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_SPACESHIP',                 3),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_WATER_CONNECTION',          2),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_NUKE',                      5),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_USE_NUKE',                  7),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_ESPIONAGE',                 3),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_ANTIAIR',                   3),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_AIRLIFT',                   4),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_I_TRADE_DESTINATION',       6),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_I_TRADE_ORIGIN',            6),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_I_SEA_TRADE_ROUTE',         4),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_I_LAND_TRADE_ROUTE',        6),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_ARCHAEOLOGY',               7),
          ('LEADER_THP_TLACAELEL',     'FLAVOR_AIR_CARRIER',               5);
----------------
-- Leader_Traits
----------------
UPDATE Leader_Traits
SET TraitType = 'TRAIT_THP_MONTEZUMA'
WHERE LeaderType = 'LEADER_MONTEZUMA';

INSERT INTO Leader_Traits
        (LeaderType,              TraitType)
VALUES  ('LEADER_THP_TLACAELEL', 'TRAIT_CULTURE_FROM_KILLS');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                      Description,                     ShortDescription)
VALUES ('TRAIT_THP_MONTEZUMA',    'TXT_KEY_TRAIT_THP_MONTEZUMA',   'TXT_KEY_TRAIT_THP_MONTEZUMA_SHORT');

UPDATE Traits
SET ShortDescription = 'TXT_KEY_TRAIT_THP_AZTEC_SHORT'
WHERE Type = 'TRAIT_CULTURE_FROM_KILLS';
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                              DefaultBuilding,              Description)
VALUES  ('BUILDINGCLASS_THP_AZTEC_XP',     'BUILDING_THP_AZTEC_XP',      'TXT_KEY_BLDG_THP_AZTEC_XP'),
        ('BUILDINGCLASS_THP_MONTY_FAITH',  'BUILDING_THP_MONTY_FAITH',   'TXT_KEY_BLDG_THP_MONTY_FAITH'),
        ('BUILDINGCLASS_THP_MONTY_PROD',   'BUILDING_THP_MONTY_PROD',    'TXT_KEY_BLDG_THP_MONTY_PROD');
------------
-- Buildings
------------
INSERT INTO Buildings
(Type,                               BuildingClass,    Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,  FreshWater, GreatPeopleRateModifier,    Description,                         Help,                               Civilopedia,                                                    Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_THP_TEOCALLI',   BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,  FreeStartEra,  FreshWater, GreatPeopleRateModifier,   'TXT_KEY_BLDG_THP_TEOCALLI',    'TXT_KEY_BLDG_THP_TEOCALLI_HELP',    'TXT_KEY_BLDG_THP_TEOCALLI_TEXT',    'TXT_KEY_BLDG_THP_TEOCALLI_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  3,            'THP_AZTEC_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';

INSERT INTO Buildings
(Type,                                     BuildingClass,          SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                         Help,                                  NeverCapture)
VALUES    ('BUILDING_THP_AZTEC_XP', 'BUILDINGCLASS_THP_AZTEC_XP',       0,          -1,             -1,   -1,       'TXT_KEY_BLDG_THP_AZTEC_XP',   'TXT_KEY_BLDG_THP_AZTEC_XP',   1),
('BUILDING_THP_MONTY_FAITH', 'BUILDINGCLASS_THP_MONTY_FAITH',       0,              -1,             -1,   -1,       'TXT_KEY_BLDG_THP_MONTY_FAITH',   'TXT_KEY_BLDG_THP_MONTY_FAITH',   1),
('BUILDING_THP_MONTY_PROD', 'BUILDINGCLASS_THP_MONTY_PROD',       0,                -1,             -1,   -1,       'TXT_KEY_BLDG_THP_MONTY_PROD',   'TXT_KEY_BLDG_THP_MONTY_PROD',   1);
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
        (BuildingType,           BuildingClassType)
SELECT  'BUILDING_THP_TEOCALLI', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';
---------------------------------
-- Building_DomainFreeExperiences
---------------------------------
INSERT INTO Building_DomainFreeExperiences
        (BuildingType,               DomainType,    Experience)
VALUES  ('BUILDING_THP_AZTEC_XP',   'DOMAIN_LAND',  3),
        ('BUILDING_THP_AZTEC_XP',   'DOMAIN_SEA',   3),
        ('BUILDING_THP_AZTEC_XP',   'DOMAIN_AIR',   3);
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,              FlavorType,    Flavor)
SELECT    'BUILDING_THP_TEOCALLI',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors
        (BuildingType,              FlavorType,                 Flavor)
VALUES  ('BUILDING_THP_TEOCALLI',   'FLAVOR_MILITARY_TRAINING', 20);
------------------------
-- Building_YieldChanges
------------------------
INSERT INTO Building_YieldChanges
          (BuildingType,              YieldType,    Yield)
SELECT    'BUILDING_THP_TEOCALLI',    YieldType,    Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_YieldChanges
        (BuildingType,                   YieldType,         Yield)
VALUES  ('BUILDING_THP_MONTY_FAITH',    'YIELD_FAITH',      1),
        ('BUILDING_THP_MONTY_PROD',     'YIELD_PRODUCTION', 1);
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                         Description,                                              Help,                                        Sound,  CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_THP_EAGLE_BASE',         'TXT_KEY_PROMOTION_THP_EAGLE_BASE',     'TXT_KEY_PROMOTION_THP_EAGLE_BASE_HELP',     'AS2D_IF_LEVELUP',  1,              59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_EAGLE_BASE'),
('PROMOTION_THP_EAGLE_STRENGTH',         'TXT_KEY_PROMOTION_THP_EAGLE_BASE',     'TXT_KEY_PROMOTION_THP_EAGLE_STRENGTH_HELP',     'AS2D_IF_LEVELUP',  1,              59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_EAGLE_BASE'),
('PROMOTION_THP_AZTEC_GREAT_PERSON',         'TXT_KEY_PROMOTION_THP_AZTEC_GREAT_PERSON',     'TXT_KEY_PROMOTION_THP_AZTEC_GREAT_PERSON_HELP',     'AS2D_IF_LEVELUP',  1,              59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_AZTEC_GREAT_PERSON');

UPDATE UnitPromotions
SET CombatPercent = 20
WHERE Type = 'PROMOTION_THP_EAGLE_STRENGTH';
--------
-- Units
--------
INSERT INTO Units
(Type,                            Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, BaseGold, NumGoldPerEra,  Description,                                                         Help,                                       Strategy,                                    Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_THP_EAGLE_WARRIOR',   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, BaseGold, NumGoldPerEra, 'TXT_KEY_UNIT_THP_EAGLE_WARRIOR',    'TXT_KEY_UNIT_THP_EAGLE_WARRIOR_HELP',    'TXT_KEY_UNIT_THP_EAGLE_WARRIOR_STRATEGY',      'TXT_KEY_UNIT_THP_EAGLE_WARRIOR_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_EAGLE_WARRIOR', 'THP_UNIT_EAGLE_WARRIOR_FLAG_ATLAS',    0,                    'THP_AZTEC_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_PIKEMAN';

UPDATE Units
SET Description = 'TXT_KEY_UNIT_THP_JAGUAR_WARRIOR'
WHERE Type = 'UNIT_AZTEC_JAGUAR';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,                 SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_EAGLE_WARRIOR',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PIKEMAN';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,                   UnitAIType)
SELECT    'UNIT_THP_EAGLE_WARRIOR',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PIKEMAN';
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
          (UnitType,                   UnitClassType)
SELECT    'UNIT_THP_EAGLE_WARRIOR',    UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PIKEMAN';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,                 FlavorType, Flavor)
SELECT 'UNIT_THP_EAGLE_WARRIOR',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PIKEMAN';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
          (UnitType,                   PromotionType)
SELECT    'UNIT_THP_EAGLE_WARRIOR',    PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_FreePromotions
        (UnitType,                   PromotionType)
VALUES  ('UNIT_THP_EAGLE_WARRIOR',  'PROMOTION_THP_EAGLE_BASE');
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_TLACAELEL',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_TLACAELEL_ATTACKED_GENERIC%',                     500),
('LEADER_THP_TLACAELEL',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_TLACAELEL_DEFEATED%',                             500),
('LEADER_THP_TLACAELEL',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_TLACAELEL_DOW_GENERIC%',                             500),
('LEADER_THP_TLACAELEL',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_TLACAELEL_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_TLACAELEL',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_TLACAELEL_FIRSTGREETING%',                         500),
('LEADER_THP_TLACAELEL',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_TLACAELEL_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_TLACAELEL',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_TLACAELEL_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_TLACAELEL',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_TLACAELEL_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_TLACAELEL',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_TLACAELEL_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_TLACAELEL',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_TLACAELEL_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_TLACAELEL',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_TLACAELEL_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_TLACAELEL',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_TLACAELEL_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_TLACAELEL',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_TLACAELEL_LETS_HEAR_IT%',                         500),
('LEADER_THP_TLACAELEL',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_TLACAELEL_LUXURY_TRADE%',                         500),
('LEADER_THP_TLACAELEL',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_TLACAELEL_NO_PEACE%',                             500),
('LEADER_THP_TLACAELEL',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_TLACAELEL_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_TLACAELEL',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_TLACAELEL_LOSEWAR%',                                 500),
('LEADER_THP_TLACAELEL',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_TLACAELEL_REPEAT_NO%',                             500),
('LEADER_THP_TLACAELEL',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_TLACAELEL_RESPONSE_REQUEST%',                     500),
('LEADER_THP_TLACAELEL',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_TLACAELEL_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_TLACAELEL',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_TLACAELEL_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_TLACAELEL',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_TLACAELEL_WINWAR%',                                 500),
('LEADER_THP_TLACAELEL',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_TLACAELEL_DENOUNCE%',                             500),
('LEADER_THP_TLACAELEL',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_TLACAELEL_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
