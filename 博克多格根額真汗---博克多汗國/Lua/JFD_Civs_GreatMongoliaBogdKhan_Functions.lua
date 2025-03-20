-- JFD_Civs_GreatMongoliaBogdKhan_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
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
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
----------------------------------------------------------------------------------------------------------------------------
--IsTraitActive
local slotComputerID = SlotStatus["SS_COMPUTER"]
local slotTakenID = SlotStatus["SS_TAKEN"]
function IsTraitActive(traitID)
	for slotID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotPlayer = Players[slotID]
		local slotStatus = PreGame.GetSlotStatus(slotID)
		if (slotStatus == slotTakenID or slotStatus == slotComputerID) then
			if HasTrait(slotPlayer, traitID) then
				return true
			end
		end
	end
	return false
end
------------------------------------------------------------------------------------------------------------------------
--MATH UTILS
------------------------------------------------------------------------------------------------------------------------
--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game.GetRandom
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
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--=======================================================================================================================
-- UNIQUE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]

local traitGreatMongoliaBogdKhanID = GameInfoTypes["TRAIT_JFD_GREAT_MONGOLIA_BOGD_KHAN"]
local g_IsTraitActive = IsTraitActive(traitGreatMongoliaBogdKhanID) 

local buildingDummyGatePeaceHappinessID = GameInfoTypes["BUILDING_DUMMY_JFD_GATE_PEACE_HAPPINESS"]
local buildingGatePeaceHappinessID = GameInfoTypes["BUILDING_JFD_GATE_PEACE_HAPPINESS"]

local domainLandID = GameInfoTypes["DOMAIN_LAND"]

local improvementEncampmentID = GameInfoTypes["IMPROVEMENT_BARBARIAN_CAMP"]

local promotionManlaibaatarAID = GameInfoTypes["PROMOTION_JFD_MANLAIBAATAR_ACTIVE"]
local promotionManlaibaatarIID = GameInfoTypes["PROMOTION_JFD_MANLAIBAATAR_INACTIVE"]

local unitManlaibaatarID = GameInfoTypes["UNIT_JFD_MANLAIBAATAR"]
local unitClassGreatProphetID = GameInfoTypes["UNITCLASS_PROPHET"]

local yieldFaithID = GameInfoTypes["YIELD_FAITH"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_GreatMongoliaBogdKhan_PlayerDoTurn
local function JFD_GreatMongoliaBogdKhan_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	if (not HasTrait(player, traitGreatMongoliaBogdKhanID)) then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UA
	for city in player:Cities() do
		local isGreatProphetStationed = false
		local plot = g_MapGetPlot(city:GetX(), city:GetY())
		for index = 0,(plot:GetNumUnits() - 1) do
			local thisUnit = plot:GetUnit(index)
			if thisUnit:GetUnitClassType() == unitClassGreatProphetID then
				isGreatProphetStationed = true
				break
			end
		end
		if isGreatProphetStationed then
			local numFaith = city:GetYieldRate(yieldFaithID) 
			if numFaith > 0 then
				city:ChangeJONSCultureStored(numFaith)	
			end
		end

		--UB
		local numHappiness = city:GetLocalHappiness()
		if (not city:IsHasBuilding(buildingGatePeaceHappinessID)) then
			numHappiness = 0
		end
		city:SetNumRealBuilding(buildingDummyGatePeaceHappinessID, numHappiness)
	end	

	--UU
	for unit in player:Units() do
		if unit:IsCombatUnit() and unit:GetDomainType() == domainLandID then
			local plot = g_MapGetPlot(unit:GetX(), unit:GetY())
			local unitIsOwnBorders = (plot:GetOwner() == playerID)
			unit:SetHasPromotion(promotionManlaibaatarAID, unitIsOwnBorders)
			unit:SetHasPromotion(promotionManlaibaatarIID, (not unitIsOwnBorders))
		end
	end
end
if g_IsTraitActive then
	GameEvents.PlayerDoTurn.Add(JFD_GreatMongoliaBogdKhan_PlayerDoTurn)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_GreatMongoliaBogdKhan_SerialEventUnitCreated
local promotionGreatMongoliaBogdKhanGreatProphetID = GameInfoTypes["PROMOTION_JFD_GREAT_MONGOLIA_BOGD_KHAN_GREAT_PROPHET"]
local function JFD_GreatMongoliaBogdKhan_SerialEventUnitCreated(playerID, unitID)
    local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	
	--UA
	if (not HasTrait(player, traitGreatMongoliaBogdKhanID)) then return end
	
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitClassType() ~= unitClassGreatProphetID then return end
	if unit:IsHasPromotion(promotionGreatMongoliaBogdKhanGreatProphetID) then return end
	
	local thisArea = g_MapGetPlot(plotX, plotY):GetArea()
	local numCurrentEra = (player:GetCurrentEra()+1)
	for otherUnit in Players[63]:Units() do
		local plotX, plotY = otherUnit:GetX(), otherUnit:GetY()
		local thatArea = g_MapGetPlot():GetArea(plotX, plotY)
		if thisArea == thatArea then
			if g_MapGetPlot(plotX, plotY):GetImprovementType() ~= improvementEncampmentID then
				player:InitUnit(otherUnit:GetUnitType(), plotX, plotY):JumpToNearestValidPlot()
				otherUnit:Kill(-1)

				player:ChangeCombatExperience(numCurrentEra)
			end
		end
	end
	if player:IsHuman() and player:IsTurnActive() then
		Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_MONGOLIA_BOGD_KHAN_MESSAGE"))
	end

	unit:SetHasPromotion(promotionGreatMongoliaBogdKhanGreatProphetID, true)
end
if (not g_IsVMCActive) then
	Events.SerialEventUnitCreated.Add(JFD_GreatMongoliaBogdKhan_SerialEventUnitCreated)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_GreatMongoliaBogdKhan_UnitCreated
local function JFD_GreatMongoliaBogdKhan_UnitCreated(playerID, unitID, unitType, plotX, plotY)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	
	--UA
	if (not HasTrait(player, traitGreatMongoliaBogdKhanID)) then return end
	
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitClassType() ~= unitClassGreatProphetID then return end

	local thisArea = g_MapGetPlot(plotX, plotY):GetArea()
	local numCurrentEra = (player:GetCurrentEra()+1)
	for otherUnit in Players[63]:Units() do
		local plotX, plotY = otherUnit:GetX(), otherUnit:GetY()
		local thatArea = g_MapGetPlot(plotX, plotY):GetArea()
		if thisArea == thatArea then
			if g_MapGetPlot(plotX, plotY):GetImprovementType() ~= improvementEncampmentID then
				player:InitUnit(otherUnit:GetUnitType(), plotX, plotY):JumpToNearestValidPlot()
				otherUnit:Kill(-1)

				player:ChangeCombatExperience(numCurrentEra)
			end
		end
	end
	if player:IsHuman() and player:IsTurnActive() then
		Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_MONGOLIA_BOGD_KHAN_MESSAGE"))
	end
end
if g_IsVMCActive then
	GameEvents.UnitCreated.Add(JFD_GreatMongoliaBogdKhan_UnitCreated)
end
--=======================================================================================================================
--=======================================================================================================================


