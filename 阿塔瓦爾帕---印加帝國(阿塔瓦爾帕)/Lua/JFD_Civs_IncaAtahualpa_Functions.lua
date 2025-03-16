-- JFD_Civs_IncaAtahualpa_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("RouteConnections.lua")
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
-- MATH UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game.GetRandom
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
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
local traitIncaAtahualpaID = GameInfoTypes["TRAIT_JFD_INCA_ATAHUALPA"]
local domainLandID = GameInfoTypes["DOMAIN_LAND"]
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]

--g_UnitClasses_Table
local g_UnitClasses_Table = {}
local g_UnitClasses_Count = 1
for row in DB.Query("SELECT ID, Type FROM UnitClasses WHERE Type IN ('UNITCLASS_JFD_COLONIST', 'UNITCLASS_JFD_EXPLORER', 'UNITCLASS_EE_EXPLORER', 'UNITCLASS_JFD_LABOURER', 'UNITCLASS_SCOUT', 'UNITCLASS_SETTLER', 'UNITCLASS_COLONIST', 'UNITCLASS_JFD_SLAVE', 'UNITCLASS_WORKER', 'UNITCLASS_JFD_WORKER', 'UNITCLASS_JFD_WORKFORCE', 'UNITCLASS_JFD_ADVENTURER');") do 
	g_UnitClasses_Table[g_UnitClasses_Count] = row
	g_UnitClasses_Count = g_UnitClasses_Count + 1
end

--UU
local unitApuquispayID = GameInfoTypes["UNIT_JFD_APUQUISPAY"]
local promotionApuquispay1ID = GameInfoTypes["PROMOTION_JFD_APUQUISPAY_1"]
local promotionApuquispay2ID = GameInfoTypes["PROMOTION_JFD_APUQUISPAY_2"]

--UB
local buildingTamboID = GameInfoTypes["BUILDING_JFD_TAMBO"]
local techBuildingTamboID = GameInfoTypes[GameInfo.Buildings[buildingTamboID].PrereqTech]
local promotionTamboID = GameInfoTypes["PROMOTION_JFD_TAMBO"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_IncaAtahualpa_PlayerDoTurn
local function JFD_IncaAtahualpa_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	local playerTeam = Teams[playerTeamID]
	
	--UA
	if HasTrait(player, traitIncaAtahualpaID) then
		for city in player:Cities() do
			if city:IsRazing() then
				local originalOwnerID = city:GetOriginalOwner()
				if originalOwnerID ~= playerID then
					local otherPlayer = Players[originalOwnerID]
					local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
					if otherPlayerTeam:IsAtWar(playerTeamID) then
						local numConverts = 1
						for otherUnit in otherPlayer:Units() do
							if otherUnit:GetUnitClassType() == unitClassGreatGeneralID or (otherUnit:IsCombatUnit() and otherUnit:GetDomainType() == domainLandID) then
								local numChance = 50
								local numRazingTurns = city:GetRazingTurns()
								numChance = (numChance/numRazingTurns)
								numChance = (numChance/numConverts)
								
								local unitTypeID = otherUnit:GetUnitType()
								local unitX = otherUnit:GetX()
								local unitY = otherUnit:GetY()
								local unitPlot = g_MapGetPlot(unitX, unitY)
								if (not unitPlot:IsCity()) then
								
									--make it increase per city of their u already have and decrease distance
									local otherPlayerCapital = otherPlayer:GetCapitalCity()
									if otherPlayerCapital then
										local numDistance = Map.PlotDistance(otherPlayerCapital:GetX(), otherPlayerCapital:GetY(), city:GetX(), city:GetY()) 
										numChance = (numChance-numDistance)
										
										numChance = g_MathCeil(numChance)
										
										local numRand = g_GetRandom(1,100)
										if numChance > 0 and numRand <= numChance then
											if otherUnit:GetUnitClassType() == unitClassGreatGeneralID then
												unitTypeID = unitApuquispayID
											end
											local newUnit = player:InitUnit(unitTypeID, unitX, unitY)
											newUnit:Convert(otherUnit)
											numConverts = numConverts + 1

											local unitConvertID = unitTypeID
											if player:IsHuman() and player:IsTurnActive() then
												local hex = ToHexFromGrid(Vector2(newUnit:GetX(), newUnit:GetY()))
												Events.GameplayFX(hex.x, hex.y, -1)
												player:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], g_ConvertTextKey("TXT_KEY_TRAIT_JFD_INCA_ATAHUALPA_NOTIFICATION_DESC_2", city:GetName(), newUnit:GetName()), g_ConvertTextKey("TXT_KEY_TRAIT_JFD_INCA_ATAHUALPA_NOTIFICATION_SHORT_DESC"), newUnit:GetX(), newUnit:GetY(), unitConvertID, -1)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

		--UB
		if playerTeam:GetTeamTechs():HasTech(techBuildingTamboID) then
			for unit in player:Units() do
				if unit:GetDamage() > 0 and unit:GetDomainType() == domainLandID then
					local unitPlot = g_MapGetPlot(unit:GetX(), unit:GetY())
					if unitPlot:IsRoute() and (not unitPlot:IsRoutePillaged()) then
						local numHeal = 0
						for city in player:Cities() do
							if city:IsHasBuilding(buildingTamboID) then
								local cityPlot = g_MapGetPlot(city:GetX(), city:GetY())
								if isPlotConnected(player, unitPlot, cityPlot, "Road") or isPlotConnected(player, unitPlot, cityPlot, "Railroad") then
									local unitPlotOwnerID = unitPlot:GetOwner()
									if unitPlotOwnerID == playerID then
										numHeal = numHeal + 5
									elseif unitPlotOwnerID == -1 then
										numHeal = numHeal + 3
									else
										numHeal = numHeal + 2
									end
								end
							end
						end
						if numHeal > 0 then
							unit:ChangeDamage(-numHeal)
						end
					end
				end
			end
		end
	end

	--UU
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionApuquispay1ID) then
			unit:SetHasPromotion(promotionApuquispay1ID, false)
		end
		if unit:IsHasPromotion(promotionApuquispay2ID) then
			unit:SetHasPromotion(promotionApuquispay2ID, false)
		end
	end	
	if player:GetUnitClassCount(unitClassGreatGeneralID) > 0 then
		for unit in player:Units() do
			if unit:GetUnitType() == unitApuquispayID then
				local unitPlot = g_MapGetPlot(unit:GetX(), unit:GetY())
				for iVal = 0,(unitPlot:GetNumUnits() - 1) do
					local otherUnit = unitPlot:GetUnit(iVal)
					if otherUnit:IsCombatUnit() and otherUnit:GetOwner() == playerID and otherUnit:GetDomainType() == domainLandID then
						if (not otherUnit:IsHasPromotion(promotionApuquispay1ID)) then
							otherUnit:SetHasPromotion(promotionApuquispay1ID, true)
						end
						break
					end
				end
				for loopPlot in PlotAreaSpiralIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					local loopUnit = loopPlot:GetUnit()
					if loopUnit and loopUnit:GetOwner() == playerID and loopUnit:IsCombatUnit() and loopUnit:GetDomainType() == domainLandID then
						if (not loopUnit:IsHasPromotion(promotionApuquispay2ID)) then
							loopUnit:SetHasPromotion(promotionApuquispay2ID, true)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_IncaAtahualpa_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--JFD_IncaAtahualpac_CityCaptureComplete
local function JFD_IncaAtahualpac_CityCaptureComplete(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (not player:IsAlive()) then return end
	--UA
	if HasTrait(player, traitIncaAtahualpaID) then
		local plot = g_MapGetPlot(plotX, plotY)
		local city = plot:GetPlotCity()
		local numUnits = 0
		local unitID = -1
		for unit in player:Units() do
			local unitClassID = unit:GetUnitClassType()
			--g_UnitClasses_Table
			local unitClassesTable = g_UnitClasses_Table
			for index = 1, #unitClassesTable do
				local row = unitClassesTable[index]
				local thisUnitClassID = row.ID
				if unitClassID == thisUnitClassID then
					unit:ChangeMoves(unit:GetMoves())

					numUnits = numUnits + 1
					if unitID == -1 then
						unitID = unit:GetUnitType()
					end
					if player:IsHuman() and player:IsTurnActive() then
						local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
						Events.GameplayFX(hex.x, hex.y, -1)
					end
				end
			end
		end
		if numUnits > 0 and unitID ~= -1 and player:IsHuman() and player:IsTurnActive() then
			player:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], g_ConvertTextKey("TXT_KEY_TRAIT_JFD_INCA_ATAHUALPA_NOTIFICATION_DESC_1", city:GetName()), g_ConvertTextKey("TXT_KEY_TRAIT_JFD_INCA_ATAHUALPA_NOTIFICATION_SHORT_DESC"), plotX, plotY, unitID, -1)
		end
	end
end
GameEvents.CityCaptureComplete.Add(JFD_IncaAtahualpac_CityCaptureComplete)	
----------------------------------------------------------------------------------------------------------------------------
--JFD_IncaAtahualpa_CityTrained
local function JFD_IncaAtahualpa_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	--UA
	if (not HasTrait(player, traitIncaAtahualpaID)) then return end
	
	local city = player:GetCityByID(cityID)
	
	--UB
	if (not playerTeam:GetTeamTechs():HasTech(techBuildingTamboID)) then return end
	if (not city:IsHasBuilding(buildingTamboID)) then return end
	
	local unit = player:GetUnitByID(unitID)
	if unit:GetDomainType() == domainLandID then
		unit:SetHasPromotion(promotionTamboID, true)
	end
end
GameEvents.CityTrained.Add(JFD_IncaAtahualpa_CityTrained)
--=======================================================================================================================
--=======================================================================================================================