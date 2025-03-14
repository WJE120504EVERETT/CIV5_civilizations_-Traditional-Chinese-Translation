-- JFD_Civs_CanadaKing_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local civilizationCanadaKingID = GameInfoTypes["CIVILIZATION_JFD_CANADA_KING"]
local traitCanadaKingID = GameInfoTypes["TRAIT_JFD_CANADA_KING"]
local unitFlowerClassID = GameInfoTypes["UNIT_JFD_FLOWER_CLASS"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_CanadaKing_PlayerDoTurn
local buildingCanadaKingProductionID = GameInfoTypes["BUILDING_JFD_CANADA_KING_PRODUCTION"]
local buildingCanadaKingTradeRoute1ID = GameInfoTypes["BUILDING_JFD_CANADA_KING_TRADE_ROUTE_1"]
local buildingCanadaKingTradeRoute2ID = GameInfoTypes["BUILDING_JFD_CANADA_KING_TRADE_ROUTE_2"]
local buildingCanadaKingTradeRoute3ID = GameInfoTypes["BUILDING_JFD_CANADA_KING_TRADE_ROUTE_3"]
local buildingMerchantShipyardID = GameInfoTypes["BUILDING_JFD_MERCHANT_SHIPYARD"]
local promotionFlowerClassActiveID = GameInfoTypes["PROMOTION_JFD_FLOWER_CLASS_ACTIVE"]
local promotionFlowerClassInactiveID = GameInfoTypes["PROMOTION_JFD_FLOWER_CLASS_INACTIVE"]
local unitCargoShipID = GameInfoTypes["UNIT_CARGO_SHIP"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
local function JFD_CanadaKing_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--FLOWER CLASS
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionFlowerClassActiveID) or unit:IsHasPromotion(promotionFlowerClassInactiveID) then
			local isOnTradeRoute = false
			local plot = g_MapGetPlot(unit:GetX(), unit:GetY())
			if (plot:GetOwner() == playerID or plot:GetOwner() == -1) then
				if #player:GetInternationalTradeRoutePlotToolTip(plot) > 0 then
					unit:ChangeMoves(120)
					isOnTradeRoute = true
				end
			end
			unit:SetHasPromotion(promotionFlowerClassActiveID, isOnTradeRoute)
			unit:SetHasPromotion(promotionFlowerClassInactiveID, (not isOnTradeRoute))
		end
	end

	--VOLUNTEER SPIRIT
	if (not HasTrait(player, traitCanadaKingID)) then return end
	for city in player:Cities() do
		if city:IsHasBuilding(buildingCanadaKingProductionID) then
			city:SetNumRealBuilding(buildingCanadaKingProductionID, 0)
		end
		if city:IsHasBuilding(buildingCanadaKingTradeRoute1ID) then
			city:SetNumRealBuilding(buildingCanadaKingTradeRoute1ID, 0)
		end
		if city:IsHasBuilding(buildingCanadaKingTradeRoute2ID) then
			city:SetNumRealBuilding(buildingCanadaKingTradeRoute2ID, 0)
		end
		if city:IsHasBuilding(buildingCanadaKingTradeRoute3ID) then
			city:SetNumRealBuilding(buildingCanadaKingTradeRoute3ID, 0)
		end
	end	

	local numFriendWars = 0
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsDoF(playerID) then
			local otherTeam = Teams[otherPlayer:GetTeam()]
			if otherTeam:GetAtWarCount(false) > 0 then
				numFriendWars = numFriendWars + 1
			end
		end
	end
	if numFriendWars >= 3 then
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute1ID, 1)
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute2ID, 1)
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute3ID, 1)
	elseif numFriendWars == 2 then
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute1ID, 1)
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute2ID, 1)
	elseif numFriendWars == 1 then
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute1ID, 1)
	end
	
	local tradeRoutes = player:GetTradeRoutes()
	for _, tradeRoute in ipairs(tradeRoutes) do
		if tradeRoute.ToID == playerID then
			tradeRoute.ToCity:SetNumRealBuilding(buildingCanadaKingProductionID, 1)
		end
		if tradeRoute.FromID == playerID then
			tradeRoute.fromCity:SetNumRealBuilding(buildingCanadaKingProductionID, 1)
		end
	end
	
	--MERCHANT SHIPYARD
	for city in player:Cities() do
		if city:IsHasBuilding(buildingMerchantShipyardID) and city:GetProductionUnit() == unitCargoShipID then
			local numProduction = g_MathFloor(city:GetYieldRate(yieldProductionID)/2)
			for unit in GameInfo.Units("CombatClass = 'UNITCOMBAT_NAVALRANGED' OR CombatClass = 'UNITCOMBAT_NAVALMELEE'") do
				local unitID = unit.ID
				if (player:CanTrain(unitID) and city:GetUnitProductionTurnsLeft(unit.ID) > 1) then
					city:ChangeUnitProduction(unitID, numProduction)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_CanadaKing_PlayerDoTurn)
--=======================================================================================================================
--=======================================================================================================================
