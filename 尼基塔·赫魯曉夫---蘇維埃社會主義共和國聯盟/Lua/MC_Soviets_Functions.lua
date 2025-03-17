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

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

-- ======= --
-- DEFINES --
-- ======= --

include("FLuaVector")

local iCiv = GameInfoTypes["CIVILIZATION_MC_SOVIETS"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

local iNumDirections = DirectionTypes.NUM_DIRECTION_TYPES - 1

-- ================================= --
-- UA: CITIES START W/ UP TO 2 FARMS --
-- ================================= --

local iFarm = GameInfoTypes["IMPROVEMENT_FARM"]

function DifferentiateNums(iOne, iTwo, iMax)
	if iOne ~= iTwo then
		return iOne, iTwo
	end
	if iOne == iMax then
		iOne = iOne - 1
	else
		iOne = iOne + 1
	end
	return iOne, iTwo
end

function KhrushchevFarms(playerID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetPlotCity()
		if pCity then
			local tValidPlots = {}
			for iDir = 0, iNumDirections, 1 do
				local pAdjPlot = Map.PlotDirection(iX, iY, iDir)
				if pAdjPlot:CanHaveImprovement(iFarm) then
					local iNum = #tValidPlots or 0
					tValidPlots[iNum + 1] = pAdjPlot
				end
			end
			
			if #tValidPlots > 1 then
				local iFirstNum = JFD_GetRandom(1, #tValidPlots)
				local iSecondNum = JFD_GetRandom(1, #tValidPlots)
				iFirstNum, iSecondNum = DifferentiateNums(iFirstNum, iSecondNum, #tValidPlots)
				tValidPlots[iFirstNum]:SetImprovementType(iFarm)
				tValidPlots[iSecondNum]:SetImprovementType(iFarm)
			elseif #tValidPlots > 0 then
				tValidPlots[1]:SetImprovementType(iFarm)
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerCityFounded.Add(KhrushchevFarms)
end

-- ================================================================ --
-- UA: RECEIVE A SCI BURST WHEN BEING FIRST TO COMPLETE A MIL. TECH --
-- ================================================================ --

local tMilTechs = {}

for row in DB.Query("SELECT * FROM Units WHERE Combat > 0 OR RangedCombat > 0") do
	local iTech = GameInfoTypes[row.PrereqTech]
	if iTech then
		tMilTechs[iTech] = true
	end
end

function CollectClaimedTechs()
	for teamID, pTeam in pairs(Teams) do
		if (not pTeam:IsBarbarian()) and (not pTeam:IsMinorCiv()) then
			for iTech, _ in pairs(tMilTechs) do
				if pTeam:IsHasTech(iTech) then
					table.remove(tMilTechs, iTech)
				end
			end
		end
	end
end

function KhrushchevNewTechResearched(teamID, techID, bool)
	if not bool then return end
	if tMilTechs[techID] then
		local pTeam = Teams[teamID]
		local playerID = pTeam:GetLeaderID()
		local pPlayer = Players[playerID]
		if pPlayer:GetCivilizationType() == iCiv then
			local iTechCost = GameInfo.Technologies[techID].Cost
			local iQuantity = math.ceil(iTechCost / 10)
			local iCurrentTech = pPlayer:GetCurrentResearch()
			pTeam:GetTeamTechs():ChangeResearchProgress(iCurrentTech, iQuantity, playerID)
		end
		table.remove(tMilTechs, techID)
	end
end

if bIsActive then
	Events.SequenceGameInitComplete.Add(CollectClaimedTechs)
	GameEvents.TeamSetHasTech.Add(KhrushchevNewTechResearched)
end

-- ============================== --
-- UU: COMBAT BONUS PER ALLIED CS --
-- ============================== --

local iMIG = GameInfoTypes["UNIT_MC_SOVIET_MIG_21"]
local iJetClass = GameInfoTypes["UNITCLASS_JET_FIGHTER"]

local tPromos = {}
for i = 1, 10, 1 do
	tPromos[i] = GameInfoTypes["PROMOTION_MC_MIG_STRENGTH_" .. i]
end

function GetNumCSAllies(playerID)
	local iNum = 0
	for k, v in pairs(Players) do
		if v:IsMinorCiv() and (v:GetAlly() == playerID) then
			iNum = iNum + 1
		end
	end
	return iNum
end

function KhrushchevJets(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:HasUnitOfClassType(iJetClass) then
		local iNumber = math.min(10, GetNumCSAllies(playerID))
		print("KHRUSHCHEV: allocated promo value = " .. iNumber)
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iMIG then
				for i = 1, 10, 1 do
					pUnit:SetHasPromotion(tPromos[i], (iNumber == i))
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(KhrushchevJets)
end

-- ============================================== --
-- UB: SCIENCE PER MIL. UNIT IN WORKABLE DISTANCE --
-- ============================================== --

local iOKB = GameInfoTypes["BUILDING_MC_SOVIET_OKB"]

function HasMilitaryUnit(pPlot)
	local iNumUnits = pPlot:GetNumUnits()
	if iNumUnits < 1 then
		return false
	elseif iNumUnits == 1 then
		return pPlot:GetUnit(0):IsCombatUnit()
	else
		for i = 0, iNumUnits - 1, 1 do
			if pPlot:GetUnit(i):IsCombatUnit() then return true end
		end
	end
	return false
end

function KhrushchevScienceUB(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:CountNumBuildings(iOKB) > 0 then
		local iTotalNum = 0
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iOKB) then
				for i = 0, pCity:GetNumCityPlots() - 1, 1 do
					local pPlot = pCity:GetCityIndexPlot(i)
					if HasMilitaryUnit(pPlot) then
						iTotalNum = iTotalNum + 1
						if Game.GetActivePlayer() == playerID then
							local iX, iY = pPlot:GetX(), pPlot:GetY()
							local sMessage = "+1 [ICON_RESEARCH]"
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
						end
					end
				end
			end
		end
		
		if iTotalNum > 0 then
			local iCurrentTech = pPlayer:GetCurrentResearch()
			Teams[pPlayer:GetTeam()]:GetTeamTechs():ChangeResearchProgress(iCurrentTech, iTotalNum, playerID)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(KhrushchevScienceUB)
end
