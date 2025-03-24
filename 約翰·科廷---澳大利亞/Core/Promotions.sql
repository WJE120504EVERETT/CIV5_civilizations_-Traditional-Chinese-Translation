--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions 
		(Type, 													Description, 												Help, 																Sound, 				DropRange,	ExtraAttacks,	CanMoveAfterAttacking,	CannotBeChosen, LostWithUpgrade, PortraitIndex,  IconAtlas, 		PediaType, 				PediaEntry)
VALUES	('PROMOTION_SENSHI_INDEPENDENT_COMPANY_PARADROP',		'TXT_KEY_PROMOTION_SENSHI_INDEPENDENT_COMPANY_PARADROP',	'TXT_KEY_PROMOTION_SENSHI_INDEPENDENT_COMPANY_PARADROP_HELP',		'AS2D_IF_LEVELUP', 	4,			0,				0,						1, 				0, 				 59, 			 'ABILITY_ATLAS',   'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_INDEPENDENT_COMPANY_PARADROP'),
		('PROMOTION_SENSHI_INDEPENDENT_COMPANY_BLITZ',			'TXT_KEY_PROMOTION_SENSHI_INDEPENDENT_COMPANY_BLITZ',		'TXT_KEY_PROMOTION_SENSHI_INDEPENDENT_COMPANY_BLITZ_HELP',				'AS2D_IF_LEVELUP', 	0,			1,				1,						1, 				1, 				 9, 			 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_INDEPENDENT_COMPANY_BLITZ'),
		('PROMOTION_SENSHI_BOOMERANG_ANTI_AIR',					'TXT_KEY_PROMOTION_SENSHI_BOOMERANG_ANTI_AIR',				'TXT_KEY_PROMOTION_SENSHI_BOOMERANG_ANTI_AIR_HELP',						'AS2D_IF_LEVELUP', 	0,			0,				0,						1, 				1, 				 59, 			 'ABILITY_ATLAS',   'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_BOOMERANG_ANTI_AIR');

INSERT INTO UnitPromotions_UnitCombatMods
			(PromotionType, 							UnitCombatType		Modifier)
SELECT		('PROMOTION_SENSHI_BOOMERANG_ANTI_AIR'),	UnitCombatType,		Modifier-75
FROM UnitPromotions_UnitCombatMods WHERE (PromotionType = 'PROMOTION_ANTI_AIR_II');
--==========================================================================================================================