--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type,						Class, Cost, Range, PrereqTech,			Combat,	RangedCombat,		Moves, Immobile,	AirInterceptRange,	Special,	Mechanized,	AirUnitCap,	RangedCombatLimit,	CombatLimit,	MoveRate,	FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 								Help, 										Strategy,									AdvancedStartCost,	UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,				PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_SOVIET_MIG_21'),	Class, Cost, Range, ('TECH_ROCKETRY'),	Combat,	RangedCombat-10,	Moves, Immobile,	AirInterceptRange,	Special,	Mechanized,	AirUnitCap,	RangedCombatLimit,	CombatLimit,	MoveRate,	FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_MC_SOVIET_MIG_21'),	('TXT_KEY_UNIT_MC_SOVIET_MIG_21_PEDIA'), 	('TXT_KEY_UNIT_MC_SOVIET_MIG_21_HELP'), 	('TXT_KEY_UNIT_MC_SOVIET_MIG_21_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_SOVIET_MIG_21'),  0,					('MC_SOVIET_MIG_21_FLAG'),	2, 				('MC_SOVIETS_ATLAS')
FROM Units WHERE (Type = 'UNIT_JET_FIGHTER');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 					UnitAIType)
SELECT		('UNIT_MC_SOVIET_MIG_21'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_JET_FIGHTER');

--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 					ResourceType)
SELECT		('UNIT_MC_SOVIET_MIG_21'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_JET_FIGHTER');

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,					FlavorType, Flavor)
SELECT		('UNIT_MC_SOVIET_MIG_21'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_JET_FIGHTER');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
VALUES		('UNIT_MC_SOVIET_MIG_21',	'PROMOTION_INTERCEPTION_IV'),
			('UNIT_MC_SOVIET_MIG_21',	'PROMOTION_AIR_SWEEP'),
			('UNIT_MC_SOVIET_MIG_21',	'PROMOTION_AIR_RECON'),
			('UNIT_MC_SOVIET_MIG_21',	'PROMOTION_ANTI_AIR_II');

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 								SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_SOVIET_MIG_21'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_JET_FIGHTER');
--==========================================================================================================================
--==========================================================================================================================
