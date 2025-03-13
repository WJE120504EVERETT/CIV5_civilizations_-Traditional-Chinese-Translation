-- JFD_NriDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Nri Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("JFD_RTP_SovereigntyUtils.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
------------------------------------------------------------------------------------------------------------------------
-- UNIQUE UTILS
------------------------------------------------------------------------------------------------------------------------
--JFD_HasRiverCity
function JFD_HasRiverCity(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if city:CountNumRiverPlots() > 0 then
			return true
		end
	end
	return false
end 
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingPietyCore	     = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
local userSettingSovereigntyCore = JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_NRI"]
--------------------------------------------------------------------------------------------------------------------------
-- Nri: Journey to the Anambra River
-------------------------------------------------------------------------------------------------------------------------
local reformLegitimacyDivineRightID = GameInfoTypes["REFORM_JFD_LEGITIMACY_DIVINE_RIGHT"]
local policyAnambraRiverID			= GameInfoTypes["POLICY_DECISIONS_JFD_NRI_ANAMBRA_RIVER"]
local Decisions_JFD_Nri_AnambraRiver = {}
	Decisions_JFD_Nri_AnambraRiver.Name = "TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER"
	Decisions_JFD_Nri_AnambraRiver.Desc = "TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Nri_AnambraRiver, "CIVILIZATION_JFD_NRI")
	Decisions_JFD_Nri_AnambraRiver.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyAnambraRiverID) then
			if userSettingSovereigntyCore then
				Decisions_JFD_Nri_AnambraRiver.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER_ENACTED_DESC_SOVEREIGNTY")
			else
				Decisions_JFD_Nri_AnambraRiver.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER_ENACTED_DESC")
			end
			return false, false, true 
		end
		local costFaith = mathCeil(500*iMod)
		if userSettingSovereigntyCore then
			Decisions_JFD_Nri_AnambraRiver.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER_DESC_SOVEREIGNTY", costFaith)
			if (not player:HasGovernment()) then return true, false end
		else
			Decisions_JFD_Nri_AnambraRiver.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER_DESC", costFaith)
		end
		if player:GetFaith() < costFaith then return true, false end
		if player:GetReligionCreatedByPlayer() <= 0 then return true, false end
		if (not JFD_HasRiverCity(playerID)) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Nri_AnambraRiver.DoFunc = (
	function(player)
		local costFaith = mathCeil(500*iMod)
		player:ChangeFaith(-costFaith)
		player:ChangeNumResourceTotal(iMagistrate, 2)
		if userSettingSovereigntyCore then
			JFD_SetHasReform(player:GetID(), reformLegitimacyDivineRightID, true, true)
		else
			player:ChangeGoldenAgeTurns(12)
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NRI_ANAMBRA_RIVER", player:GetName(), player:GetCivilizationShortDescription()))
		if isCPDLL then
			player:GrantPolicy(policyAnambraRiverID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyAnambraRiverID, true)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Nri_AnambraRiver", Decisions_JFD_Nri_AnambraRiver)
-------------------------------------------------------------------------------------------------------------------------
-- Nri: Sanctify the Ìkénga
-------------------------------------------------------------------------------------------------------------------------
local policyIkengaID = GameInfoTypes["POLICY_DECISIONS_JFD_NRI_IKENGA"]
local Decisions_JFD_Nri_Ikenga = {}
	Decisions_JFD_Nri_Ikenga.Name = "TXT_KEY_DECISIONS_JFD_NRI_IKENGA"
	Decisions_JFD_Nri_Ikenga.Desc = "TXT_KEY_DECISIONS_JFD_NRI_IKENGA_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Nri_Ikenga, "CIVILIZATION_JFD_NRI")
	Decisions_JFD_Nri_Ikenga.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyIkengaID) then
			Decisions_JFD_Nri_Ikenga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_IKENGA_ENACTED_DESC")
			return false, false, true
		end
		local costFaith = mathCeil(200*iMod)
		Decisions_JFD_Nri_Ikenga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_IKENGA_DESC", costFaith)
		if player:GetReligionCreatedByPlayer() <= 0	then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Nri_Ikenga.DoFunc = (
	function(player)
		local costFaith = mathCeil(200*iMod)
		player:ChangeFaith(-costFaith)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		if isCPDLL then
			player:GrantPolicy(policyIkengaID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyIkengaID, true)
		end
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Nri_Ikenga", Decisions_JFD_Nri_Ikenga)
--=======================================================================================================================
--=======================================================================================================================
