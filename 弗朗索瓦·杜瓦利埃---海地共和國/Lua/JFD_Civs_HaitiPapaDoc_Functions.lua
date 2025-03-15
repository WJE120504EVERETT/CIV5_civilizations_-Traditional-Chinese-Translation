-- JFD_Civs_HaitiPapaDoc_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
--include("PlotIterators.lua")
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
--UA
local traitHaitiPapaDocID = GameInfoTypes["TRAIT_JFD_HAITI_PAPA_DOC"]
local dummyTraitHaitiPapaDocID = GameInfoTypes["BUILDING_DUMMY_JFD_HAITI_PAPA_DOC"]
local yieldFaithID = GameInfoTypes["YIELD_FAITH"]

--g_Building_Espionage_Table
local g_Building_Espionage_Table = {}
local g_Building_Espionage_Count = 1
for row in GameInfo.Buildings("EspionageModifier != 0 AND Cost > -1") do
	g_Building_Espionage_Table[g_Building_Espionage_Count] = row.ID
	g_Building_Espionage_Count = g_Building_Espionage_Count + 1
end

--g_Building_GlobalEspionage_Table
local g_Building_GlobalEspionage_Table = {}
local g_Building_GlobalEspionage_Count = 1
for row in GameInfo.Buildings("GlobalEspionageModifier != 0 AND Cost > -1") do
	g_Building_GlobalEspionage_Table[g_Building_GlobalEspionage_Count] = row.ID
	g_Building_GlobalEspionage_Count = g_Building_GlobalEspionage_Count + 1
end

--g_Building_YieldChanges_Faith_Table
local g_Building_YieldChanges_Faith_Table = {}
local g_Building_YieldChanges_Faith_Count = 1
for row in GameInfo.Building_YieldChanges("YieldType = 'YIELD_FAITH' AND Yield > 0") do
	for row2 in GameInfo.Buildings("Type = '" .. row.BuildingType .. "' AND Cost > -1") do
		if (not g_Building_YieldChanges_Faith_Table[row2.ID]) then
			g_Building_YieldChanges_Faith_Table[g_Building_YieldChanges_Faith_Count] = row2.ID
			g_Building_YieldChanges_Faith_Count = g_Building_YieldChanges_Faith_Count + 1
		end
	end
end

--g_Building_Flavors_MilitaryTraining_Table
local g_Building_Flavors_MilitaryTraining_Table = {}
local g_Building_Flavors_MilitaryTraining_Count = 1
for row in GameInfo.Building_Flavors("FlavorType = 'FLAVOR_MILITARY_TRAINING'") do
	for row2 in GameInfo.Buildings("Type = '" .. row.BuildingType .. "' AND Cost > -1") do
		if (not g_Building_Flavors_MilitaryTraining_Table[row2.ID]) then
			g_Building_Flavors_MilitaryTraining_Table[g_Building_Flavors_MilitaryTraining_Count] = row2.ID
			g_Building_Flavors_MilitaryTraining_Count = g_Building_Flavors_MilitaryTraining_Count + 1
		end
	end
end

--UB
local buildingHonfourID = GameInfoTypes["BUILDING_JFD_HOUNFOUR"]
local dummyHonfourID = GameInfoTypes["BUILDING_DUMMY_JFD_HOUNFOUR"]
local defineWLTKDTurns = GameDefines["CITY_RESOURCE_WLTKD_TURNS"]

--UU
local unitTontonID = GameInfoTypes["UNIT_JFD_TONTON"]
local unitClassMarineID = GameInfoTypes["UNITCLASS_MARINE"]
local domainLandID = GameInfoTypes["DOMAIN_LAND"]
local unitCombatGunID = GameInfoTypes["UNITCOMBAT_GUN"]
local promotionTontonID = GameInfoTypes["PROMOTION_JFD_TONTON"]
local yieldFoodID = GameInfoTypes["YIELD_FOOD"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_HaitiPapaDoc_PlayerDoTurn
local function JFD_HaitiPapaDoc_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	
	--UA
	if HasTrait(player, traitHaitiPapaDocID) then
		for city in player:Cities() do
			local isWLTKD = city:GetWeLoveTheKingDayCounter() > 0

			if isWLTKD then
				local numCanConstruct = 0
				local numFaith = city:GetYieldRate(yieldFaithID)
				for _, buildingID in ipairs(g_Building_Espionage_Table) do
					if city:CanConstruct(buildingID, 1) then
						city:ChangeBuildingProduction(buildingID, numFaith)
						numCanConstruct = numCanConstruct + 1
						if numCanConstruct > 1 then
							numFaith = g_MathCeil(g_MathMax(0,numFaith/numCanConstruct))
						end
					end
				end
				for _, buildingID in ipairs(g_Building_Flavors_MilitaryTraining_Table) do
					if city:CanConstruct(buildingID, 1) then
						city:ChangeBuildingProduction(buildingID, numFaith)
						numCanConstruct = numCanConstruct + 1
						if numCanConstruct > 1 then
							numFaith = g_MathCeil(g_MathMax(0,numFaith/numCanConstruct))
						end
					end
				end
			end

			local numFoodKept = 0
			if isWLTKD then
				for _, buildingID in ipairs(g_Building_YieldChanges_Faith_Table) do
					local building = GameInfo.Buildings[buildingID]
					if city:IsHasBuilding(buildingID) then
						numFoodKept = numFoodKept + 10
						if numFoodKept >= 30 then
							numFoodKept = 30
							break
						end
					end
				end
			end
			city:SetNumRealBuilding(dummyTraitHaitiPapaDocID, numFoodKept, true)
		end
	end

	--UB
	local cityCapital = player:GetCapitalCity()
	for city in player:Cities() do
		if (not city:IsCapital()) then
			local numProd = 0
			if city:GetProductionBuilding() == buildingHonfourID then
				local numDistance = Map.PlotDistance(city:GetX(), city:GetY(), cityCapital:GetX(), cityCapital:GetY())
				numProd = g_MathMin(numDistance, 100)
			end
			city:SetNumRealBuilding(dummyHonfourID, numProd, true)
		end
	end

	--UU
	if player:GetUnitClassCount(unitClassMarineID) > 0 then
		for city in player:Cities() do
			local numUnhappiness = player:GetExcessHappiness()
			if numUnhappiness < 0 then
				local numPop = city:GetPopulation()
				if ((city:IsCapital() and numPop > 5) or (numPop > 3)) then
					local unitGarrison = city:GetGarrisonedUnit()
					if unitGarrison and unitGarrison:IsHasPromotion(promotionTontonID) then
						local numFoodMod = 0
						for _, buildingID in ipairs(g_Building_GlobalEspionage_Table) do
							local building = GameInfo.Buildings[buildingID]
							local buildingClassID = GameInfoTypes[building.BuildingClass]
							local numGlobalEspionageMod = (building.GlobalEspionageModifier*-1)
							if player:GetBuildingClassCount(buildingClassID) > 0 then
								numFoodMod = numFoodMod + numGlobalEspionageMod
							end
						end
						for _, buildingID in ipairs(g_Building_Espionage_Table) do
							if city:IsHasBuilding(buildingID) then
								local building = GameInfo.Buildings[buildingID]
								local numEspionageMod = (building.EspionageModifier*-1)
								numFoodMod = numFoodMod + numEspionageMod
							end
						end
						local numFoodDiff = city:FoodDifference()
						if numFoodDiff < 0 then
							numFoodDiff = 0
						end
						local numFood = g_MathFloor((city:GetFood()*numFoodMod)/100)
						numFood = numFood + numFoodDiff
						numFood = numFood * numUnhappiness
						if city:IsPuppet() or city:IsOccupied() then
							numFood = numFood*2
						end
						numFood = g_MathCeil(numFood)
						if city:GetFood() <= numFood then
							numFood = city:GetFood()
						end
						local numProd = numFood
						numFood = numFood*-1
						
						city:ChangeFood(numFood)
						if city:GetFood() <= 0 then
							city:ChangePopulation(-1)
						end
						city:ChangeProduction(numProd)
						if numFood > 0 and numProd > 0 then
							if player:IsHuman() and player:IsTurnActive() then
								local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
								Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_NEGATIVE_TEXT]{1_Num} [ICON_FOOD], +{2_Num} [ICON_PRODUCTION][ENDCOLOR]", numFood, numProd))
							end
						end
					end 
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_HaitiPapaDoc_PlayerDoTurn)
--------------------------------------------------------------------------------------------------------------------------
--JFD_HaitiPapaDoc_CityConstructed
local function JFD_HaitiPapaDoc_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	
	--UB
	if buildingID ~= buildingHonfourID then return end

	city:ChangeWeLoveTheKingDayCounter(defineWLTKDTurns)
end
GameEvents.CityConstructed.Add(JFD_HaitiPapaDoc_CityConstructed)
--------------------------------------------------------------------------------------------------------------------------
--JFD_HaitiPapaDoc_SetPopulation
local function JFD_HaitiPapaDoc_SetPopulation(plotX, plotY, oldPopulation, newPopulation)
	local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local playerID = city:GetOwner()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end

	--UU
	if player:GetUnitClassCount(unitClassMarineID) > 0 then
		if newPopulation > oldPopulation then return end

		local unitGarrison = city:GetGarrisonedUnit()
		if unitGarrison and unitGarrison:IsHasPromotion(promotionTontonID) then
				
			local numUnitLevel = unitGarrison:GetLevel()
	
			local numXP = city:GetDomainFreeExperience(domainLandID) + city:GetUnitCombatFreeExperience(unitCombatGunID) + city:GetFreeExperience()
			numXP = g_MathCeil(numXP/numUnitLevel)
			unitGarrison:ChangeExperience(numXP)

			--local numXPMod = 0
			--local numProdMod = 0
			--for _, buildingID in ipairs(g_Building_GlobalEspionage_Table) do
			--	local building = GameInfo.Buildings[buildingID]
			--	local buildingClassID = GameInfoTypes[building.BuildingClass]
			--	local numGlobalEspionageMod = (building.GlobalEspionageModifier*-1)
			--	if player:GetBuildingClassCount(buildingClassID) > 0 then
			--		--numXPMod = numXPMod + numGlobalEspionageMod
			--		numProdMod = numProdMod + numGlobalEspionageMod
			--	end
			--end
			--for _, buildingID in ipairs(g_Building_Espionage_Table) do
			--	if city:IsHasBuilding(buildingID) then
			--		local building = GameInfo.Buildings[buildingID]
			--		local numEspionageMod = (building.EspionageModifier*-1)
			--		--numXPMod = numXPMod + numEspionageMod
			--		numProdMod = numProdMod + numEspionageMod
			--	end
			--end
			--local numXP = g_MathCeil((unitGarrison:ExperienceNeeded()*numXPMod)/100)
			--unitGarrison:ChangeExperience(numXP)
	
			--local numProd = g_MathCeil((city:GetYieldRate(yieldProductionID)*numProdMod)/100)
			--if city:IsPuppet() or city:IsOccupied() then
			--	numProd = numProd*2
			--end
			--city:ChangeProduction(numProd)
	
			if player:IsHuman() and player:IsTurnActive() then
				Events.AudioPlay2DSound("AS2D_SND_SOUND_JFD_TONTON_GUNFIRE")
	
				-- local hex = ToHexFromGrid(Vector2(plotX, plotY))
				-- Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_WARNING_TEXT]+{1_Num} [ICON_PRODUCTION] [ENDCOLOR]", numProd))
			end
		end
	end
end
GameEvents.SetPopulation.Add(JFD_HaitiPapaDoc_SetPopulation)
--=======================================================================================================================
--=======================================================================================================================