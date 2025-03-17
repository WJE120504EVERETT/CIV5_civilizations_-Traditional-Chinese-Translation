--==========================================================================================================================	
-- Leaders
--==========================================================================================================================				
INSERT INTO Leaders
			(Type, 						Description, 							Civilopedia, 					CivilopediaTag, 				ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_MC_KHRUSHCHEV',	'TXT_KEY_LEADER_MC_KHRUSHCHEV_DESC',	'TXT_KEY_LEADER_MC_KHRUSHCHEV',	'TXT_KEY_LEADER_MC_KHRUSHCHEV',	'MC_SOVIETS_Leaderscene.xml',	7,						6,						8,							5,			5,				7,				6,						5,				6,			4,			4,				7,			6,			'MC_SOVIETS_ATLAS',	1);

--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================				
INSERT INTO Diplomacy_Responses
			(LeaderType,				ResponseType,				Response)
VALUES		('LEADER_MC_KHRUSHCHEV',	'RESPONSE_FIRST_GREETING',	'TXT_KEY_LEADER_MC_KHRUSHCHEV_FIRSTGREETING_%'),
			('LEADER_MC_KHRUSHCHEV',	'RESPONSE_DEFEATED',		'TXT_KEY_LEADER_MC_KHRUSHCHEV_DEFEATED_%'),
			('LEADER_MC_KHRUSHCHEV',	'RESPONSE_ATTACKED',		'TXT_KEY_LEADER_MC_KHRUSHCHEV_ATTACKED_%'),
			('LEADER_MC_KHRUSHCHEV',	'RESPONSE_DOW_GENERIC',		'TXT_KEY_LEADER_MC_KHRUSHCHEV_DOW_%');
			
--==========================================================================================================================	
-- Traits
--==========================================================================================================================				
INSERT INTO Traits
			(Type,								Description,							ShortDescription)
VALUES		('TRAIT_MC_VIRGIN_LANDS_COSMOS',	'TXT_KEY_TRAIT_MC_VIRGIN_LANDS_COSMOS',	'TXT_KEY_TRAIT_MC_VIRGIN_LANDS_COSMOS_SHORT');

--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================				
INSERT INTO Leader_Traits
			(LeaderType,				TraitType)
VALUES		('LEADER_MC_KHRUSHCHEV',	'TRAIT_MC_VIRGIN_LANDS_COSMOS');

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================				
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 					Bias)
VALUES		('LEADER_MC_KHRUSHCHEV', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_MC_KHRUSHCHEV', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
			('LEADER_MC_KHRUSHCHEV', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_MC_KHRUSHCHEV', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_MC_KHRUSHCHEV', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_MC_KHRUSHCHEV', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_MC_KHRUSHCHEV', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_KHRUSHCHEV', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_MC_KHRUSHCHEV', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_MC_KHRUSHCHEV', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_MC_KHRUSHCHEV', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_MC_KHRUSHCHEV', 	'MINOR_CIV_APPROACH_BULLY', 		4);

--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================	
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_RECON', 					6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_RANGED', 					5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_MOBILE', 					7),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_NAVAL', 					5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_AIR', 						7),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_GROWTH', 					6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_GOLD', 						5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_CULTURE', 					5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_WONDER', 					5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_RELIGION', 					2),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_SPACESHIP', 				8),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_NUKE', 						7),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_USE_NUKE', 					4),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_AIRLIFT', 					7),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_ARCHAEOLOGY', 				6),
			('LEADER_MC_KHRUSHCHEV', 	'FLAVOR_AIR_CARRIER', 				6);
--==========================================================================================================================