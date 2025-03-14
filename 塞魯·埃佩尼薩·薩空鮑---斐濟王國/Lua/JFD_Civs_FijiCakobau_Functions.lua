-- JFD_Civs_FijiCakobau_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--include("UniqueDiplomacyUtilsV2.lua")
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

local gameSpeedID		= Game:GetGameSpeedType()
local gameSpeed			= GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedGAMod	= gameSpeed.GoldenAgePercent
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
local defineMaxPlayers = GameDefines["MAX_CIV_PLAYERS"]
--=======================================================================================================================
-- UNIQUE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingHouseOfChiefsID = GameInfoTypes["BUILDING_JFD_HOUSE_OF_CHIEFS"]

local improvementBarbarianEncampmentID = GameInfoTypes["IMPROVEMENT_BARBARIAN_CAMP"]

local minorTraitMilitaristicID = GameInfoTypes["MINOR_TRAIT_MILITARISTIC"]

local traitFijiCakobauID = GameInfoTypes["TRAIT_JFD_FIJI_CAKOBAU"]

local promotionBati1ID = GameInfoTypes["PROMOTION_JFD_BATI_1"]
local promotionBati2ID = GameInfoTypes["PROMOTION_JFD_BATI_2"]
local promotionBati3ID = GameInfoTypes["PROMOTION_JFD_BATI_3"]

local unitBatiID = GameInfoTypes["UNIT_JFD_BATI"]
local unitCombatMeleeID = GameInfoTypes["UNIT_COMBAT_MELEE"]
local unitWorkerID = GameInfoTypes["UNIT_WORKER"]
local unitWorkforceID = GameInfoTypes["UNIT_JFD_WORKFORCE"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_FijiCakobau_PlayerDoTurn
local barbarianEncampments = {}
local function JFD_FijiCakobau_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	
	if player:IsBarbarian() and (not g_IsVMCActive) then
		for unit in player:Units() do
			local plot = unit:GetPlot()
			if (plot and plot:GetImprovementType() == improvementBarbarianEncampmentID) then
				if (not barbarianEncampments[plot]) then
					barbarianEncampments[plot] = true
				end
			end
		end
	end
	
	--UA
	if HasTrait(player, traitFijiCakobauID) then
		if (not g_IsVMCActive) then
			for plot, _ in pairs(barbarianEncampments) do
				if plot:GetImprovementType() ~= improvementBarbarianEncampmentID then
					barbarianEncampments[plot] = nil
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_FijiCakobau_PlayerDoTurn)
--------------------------------------------------------------------------------------------------------------------------
--JFD_FijiCakobau_BarbariansCampCleared
function JFD_FijiCakobau_BarbariansCampCleared(plotX, plotY, playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	
	--UA
	if HasTrait(player, traitFijiCakobauID) then
		local currentEraID = (player:GetCurrentEra()+1)*10
		local numCities = player:GetNumCities()
		local numFood = g_MathCeil(((currentEraID*gameSpeedGAMod)/100)/numCities)
		for city in player:Cities() do
			city:ChangeFood(numFood)
			if player:IsHuman() and player:IsTurnActive() then
				local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_FOOD][ENDCOLOR]", numFood))
			end
		end
		local numInfluence = 15
		for minorPlayerID = 0, defineMaxPlayers - 1 do
			local minorPlayer = Players[minorPlayerID]
			if (minorPlayer:IsAlive() and minorPlayer:GetCapitalCity() and minorPlayer:IsMinorCiv()) then
				if playerTeam:IsHasMet(minorPlayer:GetTeam()) then
					minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID,numInfluence)
				end
			end
		end
		if player:IsHuman() and player:IsTurnActive() then
			Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_FIJI_CAKOBAU_MESSAGE", numInfluence))
		end
	end
end
if g_IsVMCActive then
	GameEvents.BarbariansCampCleared.Add(JFD_FijiCakobau_BarbariansCampCleared)
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_FijiCakobau_SequenceGameInitComplete
local function JFD_FijiCakobau_SequenceGameInitComplete(oldPlayerID, isCapital, plotX, plotY, newPlayerID)
	for num = 0, Map:GetNumPlots() - 1, 1 do
		local plot = Map.GetPlotByIndex(num);
		if plot:GetImprovementType() == improvementBarbarianEncampmentID then
		print("barb")
			barbarianEncampments[plot] = true
		end
	end
end
if (not g_IsVMCActive) then
	Events.SequenceGameInitComplete.Add(JFD_FijiCakobau_SequenceGameInitComplete)
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_FijiCakobau_UnitSetXY
local function JFD_FijiCakobau_UnitSetXY(playerID, unitID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local playerTeam = Teams[player:GetTeam()]
	
	--UA
	if HasTrait(player, traitFijiCakobauID) then
		local plot = g_MapGetPlot(plotX, plotY)
		if plot then
			if barbarianEncampments[plot] then
				barbarianEncampments[plot] = nil
				local currentEraID = (player:GetCurrentEra()+1)*10
				local numCities = player:GetNumCities()
				local numFood = g_MathCeil(((currentEraID*gameSpeedGAMod)/100)/numCities)
				for city in player:Cities() do
					city:ChangeFood(numFood)
					if player:IsHuman() and player:IsTurnActive() then
						local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
						Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_FOOD][ENDCOLOR]", numFood))
					end
				end
				local numInfluence = 15
				for minorPlayerID = 0, defineMaxPlayers - 1 do
					local minorPlayer = Players[minorPlayerID]
					if (minorPlayer:IsAlive() and minorPlayer:GetCapitalCity() and minorPlayer:IsMinorCiv()) then
						if playerTeam:IsHasMet(minorPlayer:GetTeam()) then
							minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID,numInfluence)
						end
					end
				end
				if player:IsHuman() and player:IsTurnActive() then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_FIJI_CAKOBAU_MESSAGE_1", numInfluence))
				end
			end
		end
	end
end
if (not g_IsVMCActive) then
	GameEvents.UnitSetXY.Add(JFD_FijiCakobau_UnitSetXY);
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_FijiCakobau_SetPopulation
local function JFD_FijiCakobau_SetPopulation(plotX, plotY, oldPopulation, newPopulation)
	if newPopulation < oldPopulation then return end
	local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local playerID = city:GetOwner()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	
	--UB
	if (not city:IsHasBuilding(buildingHouseOfChiefsID)) then return end
	local numCulture = (city:GetJONSCulturePerTurn()*2)
	if numCulture > 0 then
		player:ChangeJONSCulture(numCulture)
		if player:IsHuman() and player:IsTurnActive() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_CULTURE][ENDCOLOR]", numCulture))
		end
		if (city:IsCapital()) then return end
		if (not player:IsCapitalConnectedToCity(city)) then return end
		local playerCapital = player:GetCapitalCity()
		if player:IsHuman() and player:IsTurnActive() then
			local hex = ToHexFromGrid(Vector2(playerCapital:GetX(), playerCapital:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_CULTURE][ENDCOLOR]", numCulture))
		end
		playerCapital:ChangeJONSCultureStored(numCulture)
	end
end
GameEvents.SetPopulation.Add(JFD_FijiCakobau_SetPopulation)
----------------------------------------------------------------------------------------------------------------------------
--JFD_FijiCakobau_CityTrained
local function JFD_FijiCakobau_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)

	if player:IsMinorCiv() then
		for otherPlayerID = 0, defineMaxMajorCivs - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:IsAlive() and HasTrait(otherPlayer, traitFijiCakobauID)) then
				if player:IsAllies(otherPlayerID) then
					local unitTypeID = unit:GetUnitType()
					local plotX, plotY = unit:GetX(), unit:GetY()
					if player:GetMinorCivTrait() == minorTraitMilitaristicID then
						if unit:GetUnitCombatType() == unitCombatMeleeID then
							local newUnit = otherPlayer:InitUnit(unitTypeID, plotX, plotY):JumpToNearestValidPlot()
							newUnit:JumpToNearestValidPlot()
							if otherPlayer:IsHuman() then
								Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_FIJI_CAKOBAU_MESSAGE_2", player:GetName(),unit:GetName()))
								UI.LookAt(g_MapGetPlot(newUnit:GetX(), newUnit:GetY()), 0)
								local hex = ToHexFromGrid(Vector2(newUnit:GetX(), newUnit:GetY()))
								Events.GameplayFX(hex.x, hex.y, -1)
							end
						end
					else
						if unitTypeID == unitWorkerID or (unitWorkforceID and unitTypeID == unitWorkforceID) then
							local newUnit = otherPlayer:InitUnit(unitTypeID, plotX, plotY):JumpToNearestValidPlot()
							newUnit:JumpToNearestValidPlot()
							if otherPlayer:IsHuman() then
								Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_FIJI_CAKOBAU_MESSAGE_2", player:GetName(),unit:GetName()))
								UI.LookAt(g_MapGetPlot(newUnit:GetX(), newUnit:GetY()), 0)
								local hex = ToHexFromGrid(Vector2(newUnit:GetX(), newUnit:GetY()))
								Events.GameplayFX(hex.x, hex.y, -1)
							end
						end
					end
				end
			end
		end
	else
		--UU
		if unit:GetUnitType() ~= unitBatiID then return end
		if isGold or isFaith then
			unit:SetHasPromotion(promotionBati1ID,true)
		elseif city:IsHasBuilding(buildingHouseOfChiefsID) then
			unit:SetHasPromotion(promotionBati3ID,true)
		else
			unit:SetHasPromotion(promotionBati3ID,true)
		end
	end
end
GameEvents.CityTrained.Add(JFD_FijiCakobau_CityTrained)
--=======================================================================================================================
--=======================================================================================================================