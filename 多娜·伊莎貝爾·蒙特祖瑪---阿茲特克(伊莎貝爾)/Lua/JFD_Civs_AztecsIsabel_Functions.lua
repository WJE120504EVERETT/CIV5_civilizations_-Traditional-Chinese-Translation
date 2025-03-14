-- JFD_Civs_AztecsIsabel_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
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
----------------------------------------------------------------------------------------------------------------------------
-- MATH UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game.GetRandom
--==========================================================================================================================
-- MOD USE
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local buildingAugustinianFriaryID = GameInfoTypes["BUILDING_JFD_AUGUSTINIAN_FRIARY"]
local civilizationAztecsIsabelID = GameInfoTypes["CIVILIZATION_JFD_AZTECS_ISABEL"]
local traitAztecsIsabelID = GameInfoTypes["TRAIT_JFD_AZTECS_ISABEL"]
local unitTlacotinID = GameInfoTypes["UNIT_JFD_TLACOTIN"]

local yieldFoodID = GameInfoTypes["YIELD_FOOD"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--g_Religions_Table
local g_Religions_Table = {}
local g_Religions_Count = 1
for row in DB.Query("SELECT ID FROM Religions WHERE Type != 'RELIGION_PANTHEON';") do 	
	g_Religions_Table[g_Religions_Count] = row
	g_Religions_Count = g_Religions_Count + 1
end

--JFD_AztecsIsabel_PlayerDoTurn
local yieldFaithID = GameInfoTypes["YIELD_FAITH"]
local function JFD_AztecsIsabel_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	--BAPTISM OF TECUICHPOCHTZIN
	if HasTrait(player, traitAztecsIsabelID) then
		for otherPlayerID = 0, defineMaxMajorCivs - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				if otherPlayer:IsDoF(playerID) then
					local religionID = otherPlayer:GetReligionCreatedByPlayer()
					if religionID > 0 then
						for city in player:Cities() do
							if city:GetReligiousMajority() ~= religionID then
								--g_Religions_Table
								local religionsTable = g_Religions_Table
								local numReligions = #religionsTable
								for index = 1, numReligions do
									local row = religionsTable[index]
									local thisReligionID = row.ID
									city:ConvertPercentFollowers(religionID, thisReligionID, 10) 
								end
								city:ConvertPercentFollowers(religionID, -1, 10) 
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_AztecsIsabel_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--JFD_AztecsIsabel_BuildFinished
local function JFD_AztecsIsabel_BuildFinished(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--AUGUSTINIAN FRIARY
	local plot = g_MapGetPlot(plotX, plotY)
	local plotCity = plot:GetWorkingCity()
	if plotCity then
		if plotCity:GetOwner() == playerID then
			if plotCity:IsHasBuilding(buildingAugustinianFriaryID) then
				local numFaith = (plot:GetYield(yieldFoodID) + plot:GetYield(yieldProductionID))*(player:GetCurrentEra()+1)
				player:ChangeFaith(numFaith)
				if player:IsHuman() and player:IsTurnActive() then
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					if numFaith > 0 then
						Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_PEACE][ENDCOLOR]", numFaith))
					end
				end
			end
		end
	end
end
GameEvents.BuildFinished.Add(JFD_AztecsIsabel_BuildFinished)
----------------------------------------------------------------------------------------------------------------------------
--JFD_AztecsIsabel_CityTrained
local unitClassMissionaryID = GameInfoTypes["UNITCLASS_MISSIONARY"]
local unitClassInquisitorID = GameInfoTypes["UNITCLASS_INQUISITOR"]
local function JFD_AztecsIsabel_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--BAPTISM OF TECUICHPOCHTZIN
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	local unitTypeID = unit:GetUnitType()
	local unitClassTypeID = unit:GetUnitClassType()
	if unitClassTypeID == unitClassMissionaryID or unitClassTypeID == unitClassInquisitorID then
		local cityReligionID = city:GetReligiousMajority()
		if cityReligionID ~= player:GetReligionCreatedByPlayer() then
			local religionFounderID = Game.GetFounder(cityReligionID, -1)
			local numGold = Players[religionFounderID]:CalculateGoldRate()
			local numProd = Players[religionFounderID]:CalculateTotalYield(yieldProductionID)
			city:ChangeProduction(numProd)
			player:ChangeGold(numGold)
			if player:IsHuman() and player:IsTurnActive() then
				local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
				if numProd > 0 then
					Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_PRODUCTION] +{2_Num} [ICON_GOLD][ENDCOLOR]", numProd, numGold))
				end
			end
		end
	end
	
	--TLACOTIN
	if unitTypeID ~= unitTlacotinID then return end
	city:DoJONSCultureLevelIncrease()
end
GameEvents.CityTrained.Add(JFD_AztecsIsabel_CityTrained)
--=======================================================================================================================
--=======================================================================================================================
