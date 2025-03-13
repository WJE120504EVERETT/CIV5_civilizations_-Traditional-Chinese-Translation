-- JFD_Civs_ZaporizhzhiaSirko_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("UniqueDiplomacyUtilsV2.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingSichID = GameInfoTypes["BUILDING_JFD_SICH"]
local buildingDummySich1ID = GameInfoTypes["BUILDING_DUMMY_JFD_SICH_1"]
local buildingDummySich2ID = GameInfoTypes["BUILDING_DUMMY_JFD_SICH_2"]

local domainLandID = GameInfoTypes["DOMAIN_LAND"]

local traitZaporizhzhiaSirkoID = GameInfoTypes["TRAIT_JFD_ZAPORIZHZHIA_SIRKO"]

local promotionChaikaID = GameInfoTypes["PROMOTION_JFD_CHAIKA"]
local promotionLeadershipID = GameInfoTypes["PROMOTION_GREAT_GENERAL"]

local unitChaikaID = GameInfoTypes["UNIT_JFD_CHAIKA"]
local unitColonistID = GameInfoTypes["UNIT_JFD_COLONIST"]
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local unitWarriorID = GameInfoTypes["UNIT_WARRIOR"]

local unitCombatGunID = GameInfoTypes["UNITCOMBAT_GUN"]
local unitCombatMeleeID = GameInfoTypes["UNITCOMBAT_MELEE"]
local unitCombatMountedID = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local unitCombatSiegeID = GameInfoTypes["UNITCOMBAT_SIEGE"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_ZaporizhzhiaSirko_PlayerDoTurn
function JFD_ZaporizhzhiaSirko_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UA
	if HasTrait(player, traitZaporizhzhiaSirkoID) then
		local numDenunciations = 0
		for otherPlayerID = 0, defineMaxMajorCivs-1, 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
				if playerTeam:IsHasMet(otherPlayer:GetTeam()) then
					if (player:IsDenouncedPlayer(otherPlayerID) or otherPlayer:IsDenouncedPlayer(playerID) or otherPlayer:IsDenouncingPlayer(playerID)) then
						numDenunciations = numDenunciations + 1
					end
				end
			end
		end
		for city in player:Cities() do
			if city:GetWeLoveTheKingDayCounter() == 0 and numDenunciations > 0 then
				city:ChangeWeLoveTheKingDayCounter(numDenunciations*5)
				if player:IsHuman() then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_ZAPORIZHZHIA_SIRKO_ALERT"))
				end
			end	
		end
	end

	--UU
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionChaikaID) then
			local plot = g_MapGetPlot(unit:GetX(), unit:GetY())
			for index = 0,(plot:GetNumUnits() - 1) do
				local otherUnit = plot:GetUnit(index)
				if otherUnit:GetUnitCombatType() == unitCombatSiegeID then
					unit:ChangeMoves(unit:GetMoves())
					otherUnit:ChangeMoves(otherUnit:GetMoves())
				end
			end
		end
	end

	--UB
	for city in player:Cities() do
		local numMilProd = 0
		local numSettlerProd = 0
		if city:IsHasBuilding(buildingSichID) then
			numMilProd = city:GetUnitProductionModifier(unitWarriorID) + city:GetMilitaryProductionModifier() + player:GetMilitaryProductionModifier() + city:GetDomainProductionModifier(domainLandID) - city:GetNumRealBuilding(buildingDummySich1ID ) - city:GetNumRealBuilding(buildingDummySich2ID)
			numSettlerProd = city:GetUnitProductionModifier(unitSettlerID) + player:GetSettlerProductionModifier() - city:GetNumRealBuilding(buildingDummySich1ID) - city:GetNumRealBuilding(buildingDummySich2ID)
			if city:IsCapital() then
				numSettlerProd = numSettlerProd + player:GetCapitalSettlerProductionModifier()
			end
		end
		if city:GetWeLoveTheKingDayCounter() > 0 then
			numMilProd = (numMilProd*2)
			numSettlerProd = (numSettlerProd*2)
		end
		numSettlerProd = (numSettlerProd/2)
		if city:GetProductionUnit() ~= unitSettlerID and (unitColonistID and city:GetProductionUnit() ~= unitColonistID) then
			numSettlerProd = 0
		end
		city:SetNumRealBuilding(buildingDummySich1ID, numMilProd)
		city:SetNumRealBuilding(buildingDummySich2ID, numSettlerProd)
	end
end
GameEvents.PlayerDoTurn.Add(JFD_ZaporizhzhiaSirko_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--JFD_ZaporizhzhiaSirko_CityTrained
local function JFD_ZaporizhzhiaSirko_CityTrained(playerID, cityID, unitID)
    local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local playerTeamTechs = playerTeam:GetTeamTechs()
	if (not player:IsAlive()) then return end
	local unit = player:GetUnitByID(unitID)
	
	--UU
	if HasTrait(player, traitZaporizhzhiaSirkoID) then
		local city = player:GetCityByID(cityID)
		if city:GetWeLoveTheKingDayCounter() > 0 then
			local unitCombatID = unit:GetUnitCombatType()
			if unitCombatID == unitCombatMountedID or
			unitCombatID == unitCombatMeleeID or
			unitCombatID == unitCombatGunID then
				unit:SetHasPromotion(promotionLeadershipID, true)
			end
		end	
	end
end
GameEvents.CityTrained.Add(JFD_ZaporizhzhiaSirko_CityTrained)
--=======================================================================================================================
--=======================================================================================================================
