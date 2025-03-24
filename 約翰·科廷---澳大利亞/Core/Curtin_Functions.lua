-- ========= --
-- UTILITIES --
-- ========= --

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

function GetNearestCity(pPlayer, pPlot)
	local distance = 9999
	local cNearestCity = nil
	for cCity in pPlayer:Cities() do
		local pCityPlot = cCity:Plot()
		local between = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pCityPlot:GetX(), pCityPlot:GetY())
		if between < distance then
			distance = between
			cNearestCity = cCity
		end
	end
	return cNearestCity
end

-- ======= --
-- DEFINES --
-- ======= --

include("FLuaVector.lua")

local iCiv = GameInfoTypes["CIVILIZATION_SENSHI_CURTIN"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

local iNumDirections = DirectionTypes.NUM_DIRECTION_TYPES - 1

-- ==================================================== --
-- UA: MAKING DOFS SPAWNS PROD BUILDING IN LARGEST CITY --
-- ==================================================== --

local tProdBuildings = {}
local iVal = 1
for row in DB.Query("SELECT * FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_YieldModifiers WHERE YieldType = 'YIELD_PRODUCTION' UNION SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_PRODUCTION')") do
	local iBuilding = row.ID
	local bIsWonder = (GameInfo.BuildingClasses[row.BuildingClass].MaxGlobalInstances == 1) or (GameInfo.BuildingClasses[row.BuildingClass].MaxPlayerInstances == 1)
	if not bIsWonder then
		tProdBuildings[iVal] = iBuilding
		iVal = iVal + 1
	end
end

function GetLargestCity(pPlayer)
	local pLargest = nil
	local iHighestPop = -1
	for pCity in pPlayer:Cities() do
		local iLocalPop = pCity:GetPopulation()
		if iLocalPop > iHighestPop then
			pLargest, iHighestPop = pCity, iLocalPop
		end
	end
	return pLargest
end

local tCurtinDOFs = {}
function TabulateCurtinDOFs()
	for kID, vPlayer in pairs(Players) do
		if vPlayer:GetCivilizationType() == iCiv then
			tCurtinDOFs[kID] = {}
			for kFriendID, vFriend in pairs(Players) do
				if vPlayer:IsDoF(kFriendID) then
				tCurtinDOFs[kID][kFriendID] = true
				end
			end
		end
	end
end

function Curtin_CheckNewDOFs(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local bHasNewFriend = false
		local tNewFriendNames = {}
		for kID, vPlayer in pairs(Players) do
			if pPlayer:IsDoF(kID) then
				if not tCurtinDOFs[playerID][kID] then
					bHasNewFriend = true
					tNewFriendNames[kID] = vPlayer:GetName()
					tCurtinDOFs[playerID][kID] = true
				end
			elseif tCurtinDOFs[playerID][kID] then
				tCurtinDOFs[playerID][kID] = false
			end
		end
		
		if bHasNewFriend then
			local pLargestCity = GetLargestCity(pPlayer)
			for kFriendID, vNameString in pairs(tNewFriendNames) do
				local sBuildingName = "TEXT ERROR"
				local bBuilt = false
				for k, v in ipairs(tProdBuildings) do
					if pLargestCity:CanConstruct(v) then
						pLargestCity:SetNumRealBuilding(v, 1)
						sBuildingName = Locale.ConvertTextKey(GameInfo.Buildings[v].Description)
						bBuilt = true
						break
					end
				end
				if pPlayer:IsHuman() and bBuilt then
					Events.GameplayAlertMessage("Your new friendship with " .. vNameString .. " has led to the construction of a " .. sBuildingName .. " in " .. pLargestCity:GetName() .. "!")
				end
			end
		end
	end
end

if bIsActive then
	Events.LoadScreenClose.Add(TabulateCurtinDOFs)
	GameEvents.PlayerDoTurn.Add(Curtin_CheckNewDOFs)
end

-- ==================================================== --
-- UA: FRIEND/ALLY UNITS IN YOUR TERRITORY PROVIDE PROD --
--  UA: SAID UNITS ALSO GIVE XP TO YOUR ADJACENT UNITS  --
-- ==================================================== --

function IsAlliedToYou(pUnit, playerID)
	local pOwner = Players[pUnit:GetOwner()]
	if pOwner:IsMinorCiv() then
		if pOwner:GetAlly() == playerID then
			return true
		end
	elseif (not pOwner:IsBarbarian()) then
		if pOwner:IsDoF(playerID) then
			return true
		end
	end
	return false
end

function Curtin_BonusesFromAlliedUnitsInYourLand(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local tDonePlots = {}
		for pCity in pPlayer:Cities() do
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot and not tDonePlots[pPlot] and (pPlot:GetOwner() == playerID) and (pPlot:GetNumUnits() > 0) then
					local pUnit = pPlot:GetUnit(0)
					if (pUnit:GetOwner() ~= playerID) and IsAlliedToYou(pUnit, playerID) then
						tDonePlots[pPlot] = true
						pCity:ChangeProduction(2)
						
						for iDir = 0, iNumDirections, 1 do
							local pAdjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDir)
							if pAdjPlot and (pAdjPlot:GetNumUnits() > 0) then
								local pAdjUnit = pAdjPlot:GetUnit(0)
								if pAdjUnit:GetOwner() == playerID then
									pAdjUnit:ChangeExperience(2)
								end
							end
						end
					end
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Curtin_BonusesFromAlliedUnitsInYourLand)
end

-- ================================================ --
-- UU1: GET ONE FREE WHEN A FRIEND BUILDS A FIGHTER --
-- ================================================ --

local iBoomerang = GameInfoTypes["UNIT_SENSHI_BOOMERANG"]
local iFighterClass = GameInfoTypes["UNITCLASS_FIGHTER"]

function Curtin_FreeBoomerangFromFriendsFighter(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit:GetUnitClassType() == iFighterClass then
		for kID, vPlayer in pairs(Players) do
			if pPlayer:IsDoF(kID) then
				if vPlayer:CanTrain(iBoomerang, true, true, true, false) then
					local pCap = vPlayer:GetCapitalCity()
					if pCap then
						vPlayer:InitUnit(iBoomerang, pCap:GetX(), pCap:GetY())
						if vPlayer:IsHuman() then
							Events.GameplayAlertMessage("Your friend, " .. pPlayer:GetName() .. ", trained a Fighter, thus providing you a free Boomerang!")
						end
					end
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.CityTrained.Add(Curtin_FreeBoomerangFromFriendsFighter)
end

-- ========================================================== --
-- UU2: MAY DOUBLE ATTACK IF NOT ADJACENT TO YOUR OTHER UNITS --
--      UU2: TEMPORARILY CLAIMS TILES IN ENEMY TERRITORY      --
-- ========================================================== --

local iIndepCompany = GameInfoTypes["UNIT_SENSHI_INDEPENDENT_COMPANY"]
local iIndepCompanyBlitzPromo = GameInfoTypes["PROMOTION_SENSHI_INDEPENDENT_COMPANY_BLITZ"]
local iMachineGunClass = GameInfoTypes["UNITCLASS_MACHINE_GUN"]
local tTemporaryCurtinTiles = {}

--[[
this is likely to behave weirdly if you close and reload the game while independent companies are sitting somewhere other than where they started their turn, or while non-Curtin players have independent companies. but this option at least lets you avoid saveutils :b
--]]

function Curtin_TabulateTemporaryTiles()
	for kID, vPlayer in pairs(Players) do
		tTemporaryCurtinTiles[kID] = {}
		if vPlayer:GetCivilizationType() == iCiv then
			if vPlayer:HasUnitOfClassType(iMachineGunClass) and (vPlayer:GetAtWarCount(false) > 0) then
				local pTeam = Teams[vPlayer:GetTeam()]
				for pUnit in vPlayer:Units() do
					if pUnit:GetUnitType() == iIndepCompany then
						local pPlot = pUnit:GetPlot()
						if pPlot:GetOwner() == kID then
							-- check that this is plausible foreign territory
							local tAdjacentOwners = {}
							for iDir = 0, iNumDirections, 1 do
								local pAdjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), iDir)
								if pAdjPlot then
									local iAdjOwner = pAdjPlot:GetOwner()
									tAdjacentOwners[iAdjOwner] = (tAdjacentOwners[iAdjOwner] + 1) or 1
								end
							end
							local iHighest = -1
							local iLikelyOwner = -1
							for k, v in pairs(tAdjacentOwners) do
								if (k ~= -1) and (k ~= kID) and pTeam:IsAtWar(Players[k]:GetTeam()) then
									if v > iHighest then
										iLikelyOwner = k
										iHighest = v
									end
								end
							end
							if (iLikelyOwner ~= -1) then
								tTemporaryCurtinTiles[kID][pPlot] = iLikelyOwner
							end
						end
					end
				end
			end
		end
	end
end

function SetTileToPrevOwner(pPlot, playerID)
	local pPlayer = Players[playerID]
	local pNearestCity = GetNearestCity(pPlayer, pPlot)
	pPlot:SetOwner(playerID, pNearestCity:GetID())
	tTemporaryCurtinTiles[kID][pPlot] = nil
end

function Curtin_UpdateTemporaryTiles(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:HasUnitOfClassType(iMachineGunClass) then
		local pTeam = Teams[pPlayer:GetTeam()]
		-- first, reset existing temporary tiles
		for k, v in pairs(tTemporaryCurtinTiles[playerID]) do
			SetTileToPrevOwner(k, v)
		end
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iIndepCompany then
				local bAwayFromFoes, bAwayFromAllies = true, true
				for iDir = 0, iNumDirections, 1 do
					local pAdjPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), iDir)
					if pAdjPlot and pAdjPlot:GetNumUnits() > 0 then
						local pAdjUnit = pAdjPlot:GetUnit(0)
						local iAdjOwner = pAdjUnit:GetOwner()
						if iAdjOwner == playerID then
							bAwayFromAllies = false
						else
							local iAdjTeam = Players[iAdjOwner]:GetTeam()
							if pTeam:IsAtWar(iAdjTeam) then
								bAwayFromFoes = false
							end
						end
					end
				end
				
				-- temporarily claim tiles if in enemy territory and not adjacent to foes
				if bAwayFromFoes then
					local pPlot = pUnit:GetPlot()
					local iPlotOwner = pPlot:GetOwner()
					if (iPlotOwner ~= -1) and (iPlotOwner ~= playerID) then
						local iOwningTeam = Players[iPlotOwner:GetTeam()]
						if pTeam:IsAtWar(iOwningTeam) then
							pPlot:SetOwner(playerID) -- city deliberately omitted
							tTemporaryCurtinTiles[playerID][pPlot] = iPlotOwner
						end
					end
				end
				
				-- may attack twice if not adjacent to other of your units
				pUnit:SetHasPromotion(iIndepCompanyBlitzPromo, bAwayFromAllies)
			end
		end
	elseif tTemporaryCurtinTiles[playerID] then
		for k, v in pairs(tTemporaryCurtinTiles[playerID]) do
			SetTileToPrevOwner(k, v)
		end
	end
end

function Curtin_ClearTileOfDeadIndepCompany(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if bDelay then return end
	if unitType == iIndepCompany then
		local pPlot = Map.GetPlot(iX, iY)
		local iOldOwner = tTemporaryCurtinTiles[playerID][pPlot]
		if iOldOwner then
			SetTileToPrevOwner(pPlot, iOldOwner)
		else
			for iDir = 0, iNumDirections, 1 do
				local pAdjPlot = Map.PlotDirection(iX, iY, iDir)
				local iAdjOwner = tTemporaryCurtinTiles[playerID][pAdjPlot]
				if iAdjOwner and pAdjPlot:GetNumUnits() < 1 then
					SetTileToPrevOwner(pAdjPlot, iAdjOwner)
				end
			end
		end
	end
end

if bIsActive then
	Events.SequenceGameInitComplete.Add(Curtin_TabulateTemporaryTiles)
	GameEvents.PlayerDoTurn.Add(Curtin_UpdateTemporaryTiles)
	GameEvents.UnitPrekill.Add(Curtin_ClearTileOfDeadIndepCompany)
end
