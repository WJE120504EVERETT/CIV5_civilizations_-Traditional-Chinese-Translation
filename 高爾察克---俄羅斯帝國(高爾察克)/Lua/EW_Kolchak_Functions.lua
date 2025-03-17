local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
local pRussia = GameInfoTypes["CIVILIZATION_EW_RUSSIA"]

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

if JFD_IsCivilisationActive(pRussia) then
	print("Kolchak active!")
end

local bActive = JFD_IsCivilisationActive(pRussia)

-----

local tMajors = {}
function EW_Russia_CheckMajors()
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1, 1 do
		local pPlayer = Players[iPlayer]
		if (not pPlayer:IsMinorCiv()) and (not pPlayer:IsBarbarian()) then
			tMajors[iPlayer] = pPlayer
		end
	end
end

if bActive then
	Events.SequenceGameInitComplete.Add(EW_Russia_CheckMajors)
end

-----

local tPolicy = {}
for row in DB.Query("SELECT * FROM PolicyBranchTypes WHERE FreePolicy IN (SELECT Type FROM Policies)") do
	tPolicy[row.ID] = GameInfoTypes[row.FreePolicy]
end

-----

local pMarkovtsy = GameInfoTypes["UNIT_EW_MARKOVTSY"]
local pVokzal = GameInfoTypes["BUILDING_EW_VOKZAL"]

local pGeneral = GameInfoTypes["UNIT_GREAT_GENERAL"]
local pHeal = GameInfoTypes["PROMOTION_INSTA_HEAL"]
local pGold = GameInfoTypes["YIELD_GOLD"]

local pDummy_1 = GameInfoTypes["BUILDING_EW_RUSSIA_FAKE"]
local pDummy_2 = GameInfoTypes["BUILDING_EW_VOKZAL_FAKE"]
local pPromo = GameInfoTypes["PROMOTION_EW_MARKOVTSY"]

--UA: Adopting Social Policies and Ideology Tenets grant Great General points per Ally that shares the policy

function EW_Kolchak_Adopt(playerID, pPolicy)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pRussia then
		for k, v in pairs(tMajors) do
			if (k ~= playerID) then
				if pPlayer:IsDoF(k) and v:HasPolicy(pPolicy) then
					pPlayer:ChangeCombatExperience(10)
				end
			end
		end
	end
end

--Part of the same function, just makes sure to give the bonus when adopting a Policy branch.

function EW_Kolchak_Branch(playerID, pPolicyBranch)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pRussia then
		local pPolicy = tPolicy[pPolicyBranch] or false
		if pPolicy then	
			EW_Kolchak_Adopt(playerID, pPolicy)
		end
	end
end

if bActive then
	GameEvents.PlayerAdoptPolicy.Add(EW_Kolchak_Adopt)
	GameEvents.PlayerAdoptPolicyBranch.Add(EW_Kolchak_Branch)
end

--UA: Upon earning a Great General, earn a burst of Unit Production.

function EW_Kolchak_UnitCreated(playerID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pRussia then
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit:GetUnitType() == pGeneral then
			
			for pCity in pPlayer:Cities() do
				if pCity:IsProductionUnit() then
					
					local pOther = pCity:GetProductionUnit()
					local iProduction = pCity:GetProductionNeeded(pOther)
					print(math.floor(iProduction / 5))
					pCity:ChangeProduction(pOther, math.floor(iProduction / 5))
				end
			end
		end
	end
end

if bActive then
	Events.SerialEventUnitCreated.Add(EW_Kolchak_UnitCreated)
end

--UU: Promotions damage adjacent enemy units

function EW_Kolchak_Promoted(playerID, unitID, promotion)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if (pPlayer:GetCivilizationType() == pRussia) then
		if (pUnit:GetUnitType() == pMarkovtsy) then
			
			local pPlot = pUnit:GetPlot()
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
				for i = 0, pAdjPlot:GetNumUnits() - 1, 1 do
					local pOther = pAdjPlot:GetUnit(i)
					local pTeam = Teams[pPlayer:GetTeam()]
					local pEnemy = Players[pOther:GetOwner()]
					if pTeam:IsAtWar(pEnemy:GetTeam()) then
						
						pOther:ChangeDamage(10, playerID)
					end
				end
			end
		end
	end
end

if bActive then
	GameEvents.UnitPromoted.Add(EW_Kolchak_Promoted)
end

--[[UU: Earns +33% Experience when starting its turn near a Great General.
	UB: +2 Gold for every active War.
	UB: Gold buildings generate Culture during War.]]--

function EW_Kolchak_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pRussia then
		--UU
		for pUnit in pPlayer:Units() do
			pUnit:SetHasPromotion(pPromo, false)
			if pUnit:GetUnitType() == pMarkovtsy then
				
				if pUnit:IsNearGreatGeneral() then
					
					pUnit:SetHasPromotion(pPromo, true)
				end
			end
			
		end
		--UB
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(pVokzal) then
				local pTeam = Teams[pPlayer:GetTeam()]
				local bWar = false
				local iWar = 0
				for k, v in pairs(tMajors) do
					if (k ~= playerID) and pTeam:IsAtWar(v:GetTeam()) then
						bWar = true
						iWar = iWar + 1
					end
				end
				if bWar then
					pCity:SetNumRealBuilding(pDummy_2, pCity:GetBaseYieldRateFromBuildings(pGold))
					pCity:SetNumRealBuilding(pDummy_1, iWar)
				end
			end
		end
	end
end


if bActive then
	GameEvents.PlayerDoTurn.Add(EW_Kolchak_DoTurn)
end