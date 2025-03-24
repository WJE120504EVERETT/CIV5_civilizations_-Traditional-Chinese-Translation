--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 									Class, Cost, Range, PrereqTech, Combat, RangedCombat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_INDEPENDENT_COMPANY'),		Class, Cost, Range, PrereqTech, Combat, RangedCombat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_INDEPENDENT_COMPANY'),	('TXT_KEY_CIV5_UNIT_SENSHI_INDEPENDENT_COMPANY_TEXT'), 	('TXT_KEY_UNIT_SENSHI_INDEPENDENT_COMPANY_HELP'), 	('TXT_KEY_UNIT_SENSHI_INDEPENDENT_COMPANY_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_INDEPENDENT_COMPANY'),  0,					('SENSHI_INDEPENDENT_COMPANY_FLAG'),	3, 				('SENSHI_CURTIN_ATLAS')
FROM Units WHERE (Type = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_INDEPENDENT_COMPANY'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_INDEPENDENT_COMPANY'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_INDEPENDENT_COMPANY'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_INDEPENDENT_COMPANY', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 								PromotionType)
VALUES		('UNIT_SENSHI_INDEPENDENT_COMPANY', 		'PROMOTION_SENSHI_INDEPENDENT_COMPANY_PARADROP');

INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_INDEPENDENT_COMPANY',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
--==========================================================================================================================
