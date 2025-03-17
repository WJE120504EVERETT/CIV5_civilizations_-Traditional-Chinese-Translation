-- ========= --
-- UTILITIES --
-- ========= --

local iPracticalNumCivs = (GameDefines["MAX_MAJOR_CIVS"] - 1)

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

function JFDGame_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = JFDGame_IsAAActive()

-- ======= --
-- DEFINES --
-- ======= --

include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")
include("PlotIterators")

local iCiv = GameInfoTypes["CIVILIZATION_THP_AZTEC"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ========================================= --
-- MONTY UA: PERM YIELD BOOSTS UPON GP BIRTH --
-- ========================================= --

local iCivMonty = GameInfoTypes["CIVILIZATION_AZTEC"]

local iFaithDummy = GameInfoTypes["BUILDING_THP_MONTY_FAITH"]
local iProdDummy = GameInfoTypes["BUILDING_THP_MONTY_PROD"]

-- thanks to Machiavelli's SerialEventUnitCreatedGood utility for demonstrating this
local iDummyPromo = GameInfoTypes["PROMOTION_THP_AZTEC_GREAT_PERSON"]

local tCulturalGP = {}
for row in DB.Query("SELECT * FROM Unit_UniqueNames WHERE GreatWorkType IS NOT NULL") do
	tCulturalGP[GameInfoTypes[row.UnitType]] = true
end

function Montezuma_GreatPersonBorn(playerID, unitID, hexVec, unitType)
	local pPlayer = Players[playerID]
	if pPlayer and pPlayer:GetCivilizationType() == iCivMonty then
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit and (not pUnit:IsDead()) and (not pUnit:IsHasPromotion(iDummyPromo)) then
			if pUnit:IsGreatPerson() then
				pUnit:SetHasPromotion(iDummyPromo, true)
				
				local iX, iY = ToGridFromHex(hexVec.x, hexVec.y)
				local pPlot = Map.GetPlot(iX, iY)
				local pCity = pPlot:GetPlotCity()
				if pCity then
					if tCulturalGP[pUnit:GetUnitType()] then
						if pCity:IsHasBuilding(iFaithDummy) then
							local iCurrentNum = pCity:GetNumBuilding(iFaithDummy)
							pCity:SetNumRealBuilding(iFaithDummy, iCurrentNum + 1)
						else
							pCity:SetNumRealBuilding(iFaithDummy, 1)
						end
					else
						if pCity:IsHasBuilding(iProdDummy) then
							local iCurrentNum = pCity:GetNumBuilding(iProdDummy)
							pCity:SetNumRealBuilding(iProdDummy, iCurrentNum + 1)
						else
							pCity:SetNumRealBuilding(iProdDummy, 1)
						end
					end
				end
			end
		end
	end
end

if bIsActive then
	Events.SerialEventUnitCreated.Add(Montezuma_GreatPersonBorn)
end

-- ======================================================== --
-- UU: STRONGER WHEN A FOE W/I 2 TILES IS BELOW HALF HEALTH --
-- ======================================================== --

local iClassPikeman = GameInfoTypes["UNITCLASS_PIKEMAN"]
local iEagle = GameInfoTypes["UNIT_THP_EAGLE_WARRIOR"]
local iBasePromo = GameInfoTypes["PROMOTION_THP_EAGLE_BASE"]
local iEaglePromo = GameInfoTypes["PROMOTION_THP_EAGLE_STRENGTH"]

function IsUnitAWeakEnemy(pUnit, pTeam)
	local owningTeamID = Players[pUnit:GetOwner()]:GetTeam()
	if pTeam:IsAtWar(owningTeamID) then
		return (pUnit:GetDamage() >= 50)
	end
	return false
end

function Aztec_EagleWarriorPromos(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:HasUnitOfClassType(iClassPikeman) then
		local pTeam = Teams[pPlayer:GetTeam()]
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iEagle then
				local bIsQualified = false
				if pTeam:GetAtWarCount(false) > 0 then
					for pPlot in PlotAreaSweepIterator(pUnit:GetPlot(), 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if pPlot:GetNumUnits() > 0 then
							if IsUnitAWeakEnemy(pPlot:GetUnit(0), pTeam) then
								bIsQualified = true
								break
							end
						end
					end
				end
				pUnit:SetHasPromotion(iEaglePromo, bIsQualified)
				pUnit:SetHasPromotion(iBasePromo, not bIsQualified)
			end
		end
	end
end

function Aztec_EagleWarriorBorn(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit:GetUnitType() == iEagle then
		local bIsQualified = false
		local pTeam = Teams[pPlayer:GetTeam()]
		if pTeam:GetAtWarCount(false) > 0 then
			for pPlot in PlotAreaSweepIterator(pUnit:GetPlot(), 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if pPlot:GetNumUnits() > 0 then
					if IsUnitAWeakEnemy(pPlot:GetUnit(0), pTeam) then
						bIsQualified = true
						break
					end
				end
			end
		end
		pUnit:SetHasPromotion(iEaglePromo, bIsQualified)
		pUnit:SetHasPromotion(iBasePromo, not bIsQualified)
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Aztec_EagleWarriorPromos)
	GameEvents.CityTrained.Add(Aztec_EagleWarriorBorn)
end

-- ===================================================== --
-- UB: +3 XP PER OPENED SP BRANCH, +3 MORE PER COMPLETED --
-- ===================================================== --

local iTeocalli = GameInfoTypes["BUILDING_THP_TEOCALLI"]
local iExtraXP = GameInfoTypes["BUILDING_THP_AZTEC_XP"]

function Aztec_TeocalliConstructed(playerID, cityID, buildingType)
	if buildingType == iTeocalli then
		local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		local iNum = pPlayer:GetNumPolicyBranchesUnlocked() + pPlayer:GetNumPolicyBranchesFinished()
		local iRealNum = math.min(iNum, 10)
		pCity:SetNumRealBuilding(iExtraXP, iRealNum)
	end
end

function Aztec_TeocalliSold(playerID, cityID, buildingType)
	if buildingType == iTeocalli then
		local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		pCity:SetNumRealBuilding(iExtraXP, 0)
	end
end

function Aztec_TeocalliUpdatePolicies(playerID, policyID)
	local pPlayer = Players[playerID]
	if pPlayer:CountNumBuildings(iTeocalli) > 0 then
		for pCity in pPlayer:Cities() do
			local iNum = pPlayer:GetNumPolicyBranchesUnlocked() + pPlayer:GetNumPolicyBranchesFinished()
			local iRealNum = math.min(iNum, 10)
			pCity:SetNumRealBuilding(iExtraXP, iRealNum)
		end
	end
end

if bIsActive then
	GameEvents.CityConstructed.Add(Aztec_TeocalliConstructed)
	GameEvents.CitySoldBuilding.Add(Aztec_TeocalliSold)
	GameEvents.PlayerAdoptPolicy.Add(Aztec_TeocalliUpdatePolicies)
	GameEvents.PlayerAdoptPolicyBranch.Add(Aztec_TeocalliUpdatePolicies)
end

-- ========== --
-- AA SUPPORT --
-- ========== --

if isAAActive then
	function TlacaelelAA(playerID, cityID, unitID)
		if IsAAUnlocked('AA_THP_AZTEC_SPECIAL') then return end
		local pPlayer = Players[playerID]
		if pPlayer:IsHuman() and (pPlayer:GetCivilizationType() == iCiv) and (pPlayer:CountNumBuildings(iExtraXP) > 9) then
			local pCity = pPlayer:GetCityByID(cityID)
			if pCity:GetNumBuilding(iExtraXP) > 9 then
				UnlockAA('AA_THP_AZTEC_SPECIAL')
			end
		end
	end
	GameEvents.CityTrained.Add(TlacaelelAA)
end