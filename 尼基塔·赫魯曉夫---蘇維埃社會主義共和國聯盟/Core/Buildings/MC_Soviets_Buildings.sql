--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings 	
		(Type, 						BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,						Civilopedia,								Help,										Strategy,										FaithCost,	UnlockedByBelief,	AllowsRangeStrike,	Defense,	ExtraCityHitPoints,		ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_MC_SOVIET_OKB'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_MC_SOVIET_OKB'),	('TXT_KEY_BUILDING_MC_SOVIET_OKB_PEDIA'),	('TXT_KEY_BUILDING_MC_SOVIET_OKB_HELP'),	('TXT_KEY_BUILDING_MC_SOVIET_OKB_STRATEGY'),	FaithCost,	UnlockedByBelief,	AllowsRangeStrike,	Defense,	ExtraCityHitPoints,		ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	'MC_SOVIETS_ATLAS',		3
FROM Buildings WHERE (Type = 'BUILDING_LABORATORY');

--Dummy Building
--INSERT INTO Buildings
--		(Type,										BuildingClass,									Description,										Cost,	PrereqTech,	GreatWorkCount,	FaithCost,	NeverCapture,	NumTradeRouteBonus,	BuildingProductionModifier)
--VALUES	('BUILDING_MC_SOVIETS_ROUTE_SLOT',		'BUILDINGCLASS_MC_SOVIETS_ROUTE_SLOT',		'TXT_KEY_BUILDING_MC_SOVIETS_ROUTE_SLOT',			-1,		null,		-1,				-1,			1,				1,					0);

--==========================================================================================================================
-- Building_ClassesNeededInCity
--==========================================================================================================================
INSERT INTO Building_ClassesNeededInCity
		(BuildingType,						BuildingClassType)
SELECT	('BUILDING_MC_SOVIET_OKB'),			BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType ='BUILDING_LABORATORY');

--==========================================================================================================================
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges
		(BuildingType,						YieldType,		Yield)
SELECT	('BUILDING_MC_SOVIET_OKB'),			YieldType,		Yield
FROM Building_ClassesNeededInCity WHERE (BuildingType ='BUILDING_LABORATORY');

--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers 	
		(BuildingType,						YieldType,		Yield)
SELECT	('BUILDING_MC_SOVIET_OKB'),			YieldType,		Yield
FROM Building_ClassesNeededInCity WHERE (BuildingType ='BUILDING_LABORATORY');

--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
--INSERT INTO BuildingClasses
--		(Type,												DefaultBuilding,							Description)
--VALUES	('BUILDINGCLASS_MC_SOVIETS_ROUTE_SLOT',			'BUILDING_MC_SOVIETS_ROUTE_SLOT',			'TXT_KEY_BUILDING_MC_SOVIETS_ROUTE_SLOT');

--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
VALUES	('BUILDING_MC_SOVIET_OKB',	'FLAVOR_SCIENCE',		100),
		('BUILDING_MC_SOVIET_OKB',	'FLAVOR_GREAT_PEOPLE',	10),
		('BUILDING_MC_SOVIET_OKB',	'FLAVOR_SPACESHIP',		20);
		

