--========================================================================================================================
-- Sas's Asmat
-- Lua by PorkBean
--========================================================================================================================
include("PlotIterators")
include("C15_IteratorPack_v4")
local iAsmatCiv = GameInfoTypes.CIVILIZATION_SAS_ASMAT

------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end

local isAsmatCivActive = JFD_IsCivilisationActive(iAsmatCiv)

--========================================================================================================================
-- UNIQUE ABILITY: Carving of the Dead
--========================================================================================================================
local iBisj = GameInfoTypes.BUILDING_SAS_BISJPOLE
local iBisj2 = GameInfoTypes.BUILDING_SAS_BISJPOLE_2 --second bisjpole with double tourism and happiness
local iBisjTimer = GameInfoTypes.BUILDING_SAS_BISJPOLE_TIMER --dummy building for counting bisjpole turns left

local iBisjPromotion = GameInfoTypes.PROMOTION_SAS_BISJPOLE --10% CS
local iBisjPromotion2 = GameInfoTypes.PROMOTION_SAS_BISJPOLE_2 --20% CS

local iHeadhunter = GameInfoTypes.UNIT_SAS_HEADHUNTER

------------------------------------------------------------------------------------------------------------------------
-- SpawnBisjOnKill
------------------------------------------------------------------------------------------------------------------------
function SpawnBisjOnKill(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if bDelay then
		if iByPlayer ~= -1 then
			local pByPlayer = Players[iByPlayer]
			if pByPlayer:GetCivilizationType() == iAsmatCiv then
				local pPlot = Map.GetPlot(iX, iY)
				if pPlot:GetOwner() == iByPlayer then
					local iBuildingToGive = iBisj
					if pByPlayer:IsGoldenAge() then
						iBuildingToGive = iBisj2
					end
					for pAdjPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if pAdjPlot:IsCity() then
							local pCity = pAdjPlot:GetPlotCity()
							if pCity:GetOwner() == iByPlayer then
								pCity:SetNumRealBuilding(iBuildingToGive, 1)
								pCity:SetNumRealBuilding(iBisjTimer, 5)
								print(pCity:GetName(), "received bisjpole, countdown begun")
							end
						end
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- NearBisjBonus
------------------------------------------------------------------------------------------------------------------------
function NearBisjBonus(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iAsmatCiv then
		for pUnit in pPlayer:Units() do
			local iGivePromotion = false
			local iGivePromotion2 = false
			local pPlot = pUnit:GetPlot()
			for pAdjPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if pAdjPlot:IsCity() then
					local pCity = pAdjPlot:GetPlotCity()
					if pCity:GetOwner() == iPlayer then
						if pCity:IsHasBuilding(iBisj2) then
							iGivePromotion2 = true
							break;
						elseif pCity:IsHasBuilding(iBisj) then
							iGivePromotion = true
							break;
						end
					end
				end
			end
			pUnit:SetHasPromotion(iBisjPromotion, iGivePromotion)
			pUnit:SetHasPromotion(iBisjPromotion2, iGivePromotion2)
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- CountdownBisj
------------------------------------------------------------------------------------------------------------------------
function CountdownBisj(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iAsmatCiv then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iBisjTimer) then
				if pPlayer:IsGoldenAge() then
					pCity:SetNumRealBuilding(iBisj, 0)
					pCity:SetNumRealBuilding(iBisj2, 1)
				else
					pCity:SetNumRealBuilding(iBisj, 1)
					pCity:SetNumRealBuilding(iBisj2, 0)
				end
				local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
				local bDoTick = true
				for pUnit in C15_PlotUnitsIterator(pPlot) do
					if pUnit:GetUnitType() == iHeadhunter then
						bDoTick = false
						print("headhunter is halting bisjpole countdown in", pCity:GetName())
						break;
					end
				end
				if bDoTick then
					pCity:SetNumRealBuilding(iBisjTimer, pCity:GetNumRealBuilding(iBisjTimer)-1)
				end
			else
				print(pCity:GetName(), "ended bisjpole countdown, building removed")
				pCity:SetNumRealBuilding(iBisj, 0)
				pCity:SetNumRealBuilding(iBisj2, 0)
			end
		end
	end
end

if isAsmatCivActive then
	GameEvents.UnitPrekill.Add(SpawnBisjOnKill)
	GameEvents.PlayerDoTurn.Add(NearBisjBonus)
	GameEvents.PlayerDoTurn.Add(CountdownBisj)
end