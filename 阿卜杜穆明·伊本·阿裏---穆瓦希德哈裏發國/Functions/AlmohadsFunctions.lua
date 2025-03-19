-- AlmohadsFunctions
-- Author: DuskJockey
-- DateCreated: 2/25/2021 1:42:18 PM
--------------------------------------------------------------
-- Included Files
--------------------------------------------------------------
include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")
--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus.SS_TAKEN or slotStatus == SlotStatus.SS_COMPUTER) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end

	return false
end

function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()

function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = Game_IsCPActive()

function HasTrait(player, traitID)
	if isCPActive then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
end

function Player_GetPrimaryReligionID(playerID)
	local player = Players[playerID]
	local religionID = player:GetReligionCreatedByPlayer()
	if isCPActive then
		if religionID <= 0 then
			religionID = player:GetStateReligion()
		end
	else
		if religionID <= 0 then
			local capital = player:GetCapitalCity()
			religionID = capital:GetReligiousMajority()
		end
	end

	return religionID
end

local tSpains = {}
function getCivsOfType(sType)
	local tCivs = {};
	--query will provide problems in cases where a civname is a substring of another civname.
	--E.g. "AUSTRIA" will also include all "AUSTRIAHUNGARY"-civs (and also "AUSTRIA_HUNGARY")
	for row in DB.Query([[
			SELECT ID, Type, DerivativeCiv
			FROM Civilizations
			WHERE Type LIKE "%]]..sType..[[%"
				OR DerivativeCiv LIKE "%]]..sType..[[%"
			]]) do
		print(tostring(row.Type).." ("..tostring(row.DerivativeCiv)..") is of civType: "..tostring(sType));
		tCivs[row.ID] = true;
	end
	return tCivs;
end
--------------------------------------------------------------
-- Localized Variables
--------------------------------------------------------------
local civilizationID = GameInfoTypes.CIVILIZATION_DJ_ALMOHADS
local isCivActive = JFD_IsCivilisationActive(civilizationID)
local defineMaxMajorCivs = GameDefines.MAX_MAJOR_CIVS

local traitAlMuminID = GameInfoTypes.TRAIT_DJ_UNITARIAN_REFORMS
local unitGreatGeneralID = GameInfoTypes.UNIT_GENERAL
local promotionGGCreatedID = GameInfoTypes.PROMOTION_DJ_ALMOHADS_GG_CREATED
local unitMissionaryID = GameInfoTypes.UNIT_MISSIONARY
local buildingGGPressureID = GameInfoTypes.BUILDING_DJ_ALMOHADS_GG_PRESSURE
local buildingGAExtenderID = GameInfoTypes.BUILDING_DJ_ALMOHADS_GA_EXTENDER

local unitclassLongswordsmanID = UNITCLASS_LONGSWORDSMAN
local unitMutatawwiaID = UNIT_DJ_MUTATAWWIA
local promotionSpawnGenerals2ID = GameInfoTypes.PROMOTION_SPAWN_GENERALS_II
local promotionGAPID = GameInfoTypes.PROMOTION_GOLDEN_AGE_POINTS

local buildingZawiyaID = GameInfoTypes.BUILDING_DJ_ZAWIYA
local buildingZawiyaGoldID = GameInfoTypes.BUILDING_DJ_ZAWIYA_GOLD
local isGreatPerson = false
local unitInquisitorID = GameInfoTypes.UNIT_INQUISITOR
local missionHeresyID = GameInfoTypes.MISSION_REMOVE_HERESY

local achievementAlmohadsSpecialID = GameInfoTypes.AA_DJ_ALMOHADS_SPECIAL

if isCivActive then
	print("Caliph Abd al-Mu'min is in this game.")
end
--------------------------------------------------------------
-- DJ_Almohads_OnCityCaptureComplete
--------------------------------------------------------------
function DJ_Almohads_OnCityCaptureComplete(oldPlayerID, _, plotX, plotY, newPlayerID, _, isConquest)
	if not isAAActive then return end
	local newPlayer = Players[newPlayerID]
	local oldPlayer = Players[oldPlayerID]
	if not newPlayer:IsAlive() then return end
	if newPlayer:IsMinorCiv() or newPlayer:IsBarbarian() then return end
	-- ADDITIONAL ACHIEVEMENTS SUPPORT
	if newPlayer:GetCivilizationType() == civilizationID and not IsAAUnlocked(achievementAlmohadsSpecialID) then
		if newPlayer:IsTurnActive() and isConquest then
			local city = Map.GetPlot(plotX, plotY):GetPlotCity()
			tSpains = getCivsOfType("SPAIN")
			if city:GetOriginalOwner() == newPlayerID and tSpains[oldPlayer:GetCivilizationType()] then
				UnlockAA(achievementAlmohadsSpecialID)
			end
		end
	end
end

GameEvents.CityCaptureComplete.Add(DJ_Almohads_OnCityCaptureComplete)
--------------------------------------------------------------
-- DJ_Almohads_OnGreatPersonExpended
--------------------------------------------------------------
function DJ_Almohads_OnGreatPersonExpended(playerID, unitID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:isBarbarian() or player:IsMinorCiv() then return end
	-- ZAWIYA
	if player:GetNumBuildings(buildingZawiyaID) > 0 then
		isGreatPerson = true
	end
end

GameEvents.GreatPersonExpended.Add(DJ_Almohads_OnGreatPersonExpended)
--------------------------------------------------------------
-- DJ_Almohads_OnSerialEventUnitCreated
--------------------------------------------------------------
function DJ_Almohads_OnCityTrained(playerID, unitID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if not player:IsAlive() then return end
	if player:IsMinorCiv() or player:IsBarbarian() then return end
	-- UNITARIAN REFORMS
	if hasTrait(player, traitAlMuminID) then
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() ~= unitGreatGeneralID or unit:HasPromotion(promotionGGCreatedID) then return end
		local initUnit = player:InitUnit(unitMissionaryID, unit:GetX(), unit:GetY())
		initUnit:JumpToNearestValidPlot()
		if player:IsGoldenAge() then
			local initUnit2 = player:InitUnit(unitMissionaryID, unit:GetX(), unit:GetY())
			initUnit2:JumpToNearestValidPlot()
		end
		unit:SetHasPromotion(promotionGGCreated, true)
	end
end

Events.SerialEventUnitCreated.Add(DJ_Almohads_OnSerialEventUnitCreated)
--------------------------------------------------------------
-- DJ_Almohads_OnPlayerDoTurn
--------------------------------------------------------------
function DJ_Almohads_OnCityTrained(playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:IsMinorCiv() or player:IsBarbarian() then return end
	-- UNITARIAN REFORMS
	if HasTrait(player, traitAlMuminID) then
		local numPiousCities = 0
		local numCities = player:GetNumCities()
		local capital = player:GetCapitalCity()
		for city in player:Cities() do
			local myReligionID = Player_GetPrimaryReligionID(playerID)
			local cityReligionID = city:GetMajorityReligion()
			local hasBuilding = 0
			if cityReligionID == myReligionID then
				numPiousCities = numPiousCities + 1
			end
			local cityPlot = city:GetPlot()
			local cityUnit = cityPlot:GetUnit()
			if unit:GetUnitType() == unitGeneralID then
				hasBuilding = 1
			end
			city:SetNumRealBuilding(buildingGGPressureID, hasBuilding)
			-- ZAWIYA
			local isGoldenAge = player:IsGoldenAge()
			if city:IsHasBuilding(buildingZawiyaID) then
				city:SetNumRealBuilding(buildingZawiyaGoldID, isGoldenAge)
			end
		end
		if numCities == numPiousCities then
			capital:SetNumRealBuilding(buildingGAExtenderID)
		end
	end
	-- MUTATAWWI'A
	if player:HasUnitOfClassType(unitclassLongswordsmanID) then
		for unit in player:Units() do
			if unit:GetUnitType() == unitMutatawwiaID then
				local unitPlot = unit:GetPlot()
				local plotCity = plot:GetWorkingCity()
				local hasPromotion = 0
				if plotCity then
					local myReligionID = Player_GetPrimaryReligionID(playerID)
					local cityReligionID = city:GetMajorityReligion()
					if myReligionID ~= cityReligionID then
						hasPromotion = 1
					end
				end
				unit:SetHasPromotion(promotionSpawnGenerals2ID, hasPromotion)
				unit:SetHasPromotion(promotionGAPID, hasPromotion)
			end
		end
	end
end
--------------------------------------------------------------
-- DJ_Almohads_OnUnitPrekill
--------------------------------------------------------------
function DJ_Almohads_OnUnitPrekill(playerID, unitID, _, plotX, plotY, _, byplayerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:IsMinorCiv() or player:IsBarbarian() then return end
	local unit = player:GetUnitByID(unitID)
	-- ZAWIYA
	if unit:GetUnitType() == unitGreatGeneralID and isGreatPerson then
		local plot = Map.GetPlot(plotX, plotY)
		local plotCity = plot:GetWorkingCity()
		if plotCity and plotCity:IsHasBuilding(buildingZawiyaID) then
			local initUnit = player:InitUnit(unitInquisitorID, plotCity:GetX(), plotCity:GetY())
			initUnit:PushMission(missionHeresyID)
		end		
	end
end

GameEvents.UnitPrekill.Add(DJ_Almohads_OnUnitPrekill)
--------------------------------------------------------------
print("AlmohadsFunctions.lua loaded successfully!")