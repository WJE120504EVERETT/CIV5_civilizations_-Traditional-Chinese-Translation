--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 										Class, Cost, Range, AirInterceptRange, PrereqTech, RangedCombat, Moves, MoveRate, Immobile, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Special, Domain, Pillage, CombatLimit, RangedCombatLimit, IgnoreBuildingDefense, Mechanized, AirUnitCap, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_BOOMERANG'),		Class, Cost, Range, AirInterceptRange, PrereqTech, RangedCombat+10, Moves, MoveRate, Immobile, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Special,	Domain, Pillage, CombatLimit, RangedCombatLimit, IgnoreBuildingDefense, Mechanized, AirUnitCap, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_BOOMERANG'),	('TXT_KEY_CIV5_UNIT_SENSHI_BOOMERANG_TEXT'), 	('TXT_KEY_UNIT_SENSHI_BOOMERANG_HELP'), 	('TXT_KEY_UNIT_SENSHI_BOOMERANG_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_BOOMERANG'),  0,					('SENSHI_BOOMERANG_FLAG'),	2, 				('SENSHI_CURTIN_ATLAS')
FROM Units WHERE (Type = 'UNIT_FIGHTER');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_BOOMERANG'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_BOOMERANG'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_BOOMERANG'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_SENSHI_BOOMERANG'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 				ResourceType)
SELECT		('UNIT_SENSHI_BOOMERANG'),		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_FIGHTER');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		('UNIT_SENSHI_BOOMERANG'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_FIGHTER') AND NOT (PromotionType = 'PROMOTION_ANTI_AIR_II');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
VALUES		('UNIT_SENSHI_BOOMERANG', 	'PROMOTION_BOMBARDMENT_1'),
			('UNIT_SENSHI_BOOMERANG', 	'PROMOTION_SENSHI_BOOMERANG_ANTI_AIR');
--==========================================================================================================================
--==========================================================================================================================
