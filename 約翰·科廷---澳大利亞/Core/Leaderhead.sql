--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 				Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_CURTIN', 		'TXT_KEY_LEADER_SENSHI_CURTIN', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_CURTIN', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_CURTIN', 	'Senshi_Curtin_Scene.xml',					4, 						4, 						5, 							8, 			7, 				6, 				5, 						8, 				5, 			7, 			5, 				6, 			4, 			'SENSHI_CURTIN_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_CURTIN', 		'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_SENSHI_CURTIN', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_SENSHI_CURTIN', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_SENSHI_CURTIN', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_SENSHI_CURTIN', 		'MAJOR_CIV_APPROACH_AFRAID', 		6),
			('LEADER_SENSHI_CURTIN', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_SENSHI_CURTIN', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_CURTIN', 	'MINOR_CIV_APPROACH_IGNORE', 		7),
			('LEADER_SENSHI_CURTIN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_SENSHI_CURTIN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_SENSHI_CURTIN', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_SENSHI_CURTIN', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_CURTIN', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_DEFENSE', 					9),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_RECON', 					6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_RANGED', 					6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_MOBILE', 					6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_NAVAL', 					6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_NAVAL_GROWTH', 				7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_AIR', 						9),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_GROWTH', 					6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_GOLD', 						5),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_CULTURE', 					5),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_WONDER', 					4),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_RELIGION', 					4),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_WATER_CONNECTION', 			7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_NUKE', 						6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_AIRLIFT', 					7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		7),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_ARCHAEOLOGY', 				3),
			('LEADER_SENSHI_CURTIN', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_CURTIN', 	'TRAIT_SENSHI_CURTIN');
--==========================================================================================================================				
--==========================================================================================================================		