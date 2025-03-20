-- JFD_Civs_GreatQingCixi_Functions
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
--=======================================================================================================================
-- DIPLOMACY FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
--JFD_GreatQingCixi_SequenceGameInitComplete
local leaderGreatBritainVictoriaID = GameInfoTypes["LEADER_JFD_GREAT_BRITAIN_VICTORIA"]
local function JFD_GreatQingCixi_SequenceGameInitComplete()
	for playerID = 0, defineMaxMajorCivs - 1, 1 do
        local player = Players[playerID]
		local leaderID = player:GetLeaderType()
		if (player:IsAlive() and playerID == Game.GetActivePlayer() and leaderID == leaderGreatBritainVictoriaID) then
			ChangeDiplomacyResponse("LEADER_JFD_GREAT_QING_CIXI", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_VICTORIA_FIRSTGREETING_1", 500)
			ChangeDiplomacyResponse("LEADER_JFD_GREAT_QING_CIXI", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_DEFEATED%", "TXT_KEY_LEADER_JFD_GREAT_QING_CIXI_VICTORIA_DEFEATED_1", 500)
			break
		end
	end
end
Events.SequenceGameInitComplete.Add(JFD_GreatQingCixi_SequenceGameInitComplete)
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingNavalCollegeID = GameInfoTypes["BUILDING_JFD_NAVAL_COLLEGE"]

local traitGreatQingCixiID = GameInfoTypes["TRAIT_JFD_GREAT_QING_CIXI"]

local promotionPekingForceID = GameInfoTypes["PROMOTION_JFD_PEKING_FORCE"]

local unitPekingForceID	= GameInfoTypes["UNIT_JFD_PEKING_FORCE"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_GreatQingCixi_PlayerDoTurn
local buildingDummyPekingForceID = GameInfoTypes["BUILDING_DUMMY_JFD_PEKING_FORCE"]
function JFD_GreatQingCixi_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UNIQUE TRAIT
	if HasTrait(player, traitGreatQingCixiID) then
		--UNIQUE UNIT
		playerCapital:SetNumRealBuilding(buildingDummyPekingForceID, 1)
	end
end
GameEvents.PlayerDoTurn.Add(JFD_GreatQingCixi_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------	
--JFD_GreatQingCixi_CityTrained
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local function JFD_GreatQingCixi_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE BUILDING
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	if (not city:IsHasBuilding(buildingNavalCollegeID)) then return end
	if (not unit:IsCombatUnit()) then return end

	if unit:GetDomainType() ~= domainSeaID then return end
	local numXP = city:GetDomainFreeExperience(domainSeaID)
	unit:ChangeExperience(numXP)
end 
GameEvents.CityTrained.Add(JFD_GreatQingCixi_CityTrained)
----------------------------------------------------------------------------------------------------------------------------
--JFD_GreatQingCixi_UnitUpgraded
local function JFD_GreatQingCixi_UnitUpgraded(playerID, unitID, newUnitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE UNIT
	local newUnit = player:GetUnitByID(newUnitID)
	if newUnit:GetUnitType() ~= unitPekingForceID then return end
	newUnit:SetHasPromotion(promotionPekingForceID, true)
end
GameEvents.UnitUpgraded.Add(JFD_GreatQingCixi_UnitUpgraded)
----------------------------------------------------------------------------------------------------------------------------
--JFD_GreatQingCixi_PlayerAdoptPolicy
local function JFD_GreatQingCixi_PlayerAdoptPolicy(playerID, unitID, promotionID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitGreatQingCixiID)) then return end
	for unit in player:Units() do
		if unit:IsCombatUnit() then
			local unitUpgradeID = unit:GetUpgradeUnitType()
			if player:CanTrain(unitUpgradeID, true, true, true, false) then
				local newUnit = player:InitUnit(unitUpgradeID, unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
				--UNIQUE UNIT
				if unitUpgradeID == unitPekingForceID then
					newUnit:SetHasPromotion(promotionPekingForceID, true)
				end
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(JFD_GreatQingCixi_PlayerAdoptPolicy)
GameEvents.PlayerAdoptPolicyBranch.Add(JFD_GreatQingCixi_PlayerAdoptPolicy)
----------------------------------------------------------------------------------------------------------------------------
--JFD_GreatQingCixi_UnitPromoted
local function JFD_GreatQingCixi_UnitPromoted(playerID, unitID, promotionID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitGreatQingCixiID)) then return end
	local unit = player:GetUnitByID(unitID)
	local unitLevel = unit:GetLevel()
	local numCulture = (unitLevel*5)
	player:ChangeJONSCulture(numCulture)
	if player:IsHuman() and player:IsTurnActive() then
		local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
		Events.GameplayFX(hex.x, hex.y, -1)
		Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", numCulture), true)
	end
end
GameEvents.UnitPromoted.Add(JFD_GreatQingCixi_UnitPromoted)
--=======================================================================================================================
--=======================================================================================================================
