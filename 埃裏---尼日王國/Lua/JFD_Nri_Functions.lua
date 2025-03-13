-- JFD_NriFunctions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
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

--HasTrait
function HasTrait(player, traitID)
	if isCPDLL then 
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

--JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
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
----------------------------------------------------------------------------------------------------------------------------
-- UNIQUE
----------------------------------------------------------------------------------------------------------------------------
--JFD_IsAtPeace
function JFD_IsAtPeace(playerID)
	return (Teams[Players[playerID]:GetTeam()]:GetAtWarCount(true) == 0)
end
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingPietyCore = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBAL
----------------------------------------------------------------------------------------------------------------------------
local activeTeam = Teams[Game.GetActiveTeam()]
local traitNriID = GameInfoTypes["TRAIT_JFD_NRI"]

local mathCeil				 = math.ceil
local defineFaithGiftLarge 	 = mathCeil(GameDefines["MINOR_GOLD_GIFT_LARGE"]*80/100)
local defineFaithGiftMedium  = mathCeil(GameDefines["MINOR_GOLD_GIFT_MEDIUM"]*80/100)
local defineFaithGiftSmall 	 = mathCeil(GameDefines["MINOR_GOLD_GIFT_SMALL"]*80/100)
----------------------------------------------------------------------------------------------------------------------------
-- HARMONY OF ANI
----------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]

--JFD_Nri_HarmonyOfAni_CanDeclareWar
function JFD_Nri_HarmonyOfAni_CanDeclareWar(teamID, otherTeamID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	local otherPlayerID = Teams[otherTeamID]:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	if (player:IsAlive() and HasTrait(player, traitNriID)) then
		if player:GetCurrentEra() > eraIndustrialID then return true end
		local religionID = player:GetReligionCreatedByPlayer()
		if userSettingPietyCore then religionID = player:GetStateReligion() end
		if religionID <= 0 then return true end
		if otherPlayer:HasReligionInMostCities(religionID) then return false end
	elseif (otherPlayer:IsAlive() and HasTrait(otherPlayer, traitNriID)) then
		if otherPlayer:GetCurrentEra() > eraIndustrialID then return true end
		local religionID = otherPlayer:GetReligionCreatedByPlayer()
		if userSettingPietyCore then religionID = otherPlayer:GetStateReligion() end
		if religionID <= 0 then return true end
		if player:HasReligionInMostCities(religionID) then return false end
	end
	return true
end
GameEvents.CanDeclareWar.Add(JFD_Nri_HarmonyOfAni_CanDeclareWar)

--JFD_Nri_HarmonyOfAni_DeclareWar
local notificationDeclarationID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function JFD_Nri_HarmonyOfAni_DeclareWar(teamID, otherTeamID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if (not player:IsAlive()) then return end
	if (not player:IsMinorCiv()) then return end
	if (not otherPlayer:IsAlive()) then return end
	if (not HasTrait(otherPlayer, traitNriID)) then return end
	if otherPlayer:GetCurrentEra() >= eraIndustrialID then return end
	local religionID = otherPlayer:GetReligionCreatedByPlayer()
	if religionID <= 0 then return end
	if player:GetCapitalCity():GetReligiousMajority() ~= religionID then return end
	Teams[otherTeamID]:MakePeace(teamID)
	player:ChangeMinorCivFriendshipWithMajor(otherPlayer:GetID(), 1)
	if player:IsHuman() then
		otherPlayer:AddNotification(notificationDeclarationID, Locale.ConvertTextKey("TXT_KEY_JFD_NRI_CITY_STATES_DECLARE_PEACE_NOTIFICATION_HUMAN", player:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_NRI_CITY_STATES_DECLARE_PEACE_NOTIFICATION_SHORT"), -1, -1)
	elseif activeTeam:IsHasMet(teamID) then
		otherPlayer:AddNotification(notificationDeclarationID, Locale.ConvertTextKey("TXT_KEY_JFD_NRI_CITY_STATES_DECLARE_PEACE_NOTIFICATION", player:GetName(), otherPlayer:GetCivilizationDescription()), Locale.ConvertTextKey("TXT_KEY_JFD_NRI_CITY_STATES_DECLARE_PEACE_NOTIFICATION_SHORT"), -1, -1)
	end
end
GameEvents.DeclareWar.Add(JFD_Nri_HarmonyOfAni_DeclareWar)

--JFD_Nri_HarmonyOfAni_PantheonFounded
local unitMburichiID	= GameInfoTypes["UNIT_JFD_MBURICHI"]
function JFD_Nri_HarmonyOfAni_PantheonFounded(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitNriID)) then return end
	local capital = player:GetCapitalCity()
	player:InitUnit(unitMburichiID, capital:GetX(), capital:GetY())
end
GameEvents.PantheonFounded.Add(JFD_Nri_HarmonyOfAni_PantheonFounded)
----------------------------------------------------------------------------------------------------------------------------
-- MBURICH
----------------------------------------------------------------------------------------------------------------------------
--JFD_Nri_Mburicihi_UnitSetXY
local playerBarbarianID = 63
local unitDomainLandID	= GameInfoTypes["DOMAIN_LAND"]
function JFD_Nri_Mburicihi_UnitSetXY(playerID, unitID, plotX, plotY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() ~= unitMburichiID then return end
	local plot = Map.GetPlot(plotX, plotY)
	for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local adjUnit = adjacentPlot:GetUnit()
		if (adjUnit and adjUnit:GetOwner() == playerBarbarianID) then
			local faithReward = (adjUnit:GetBaseCombatStrength()*2)
			adjUnit:Kill(true, playerID)
			player:ChangeFaith(faithReward)
			unit:ChangeDamage(34)
			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(adjUnit:GetX(), adjUnit:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PEACE]", faithReward))
				Events.GameplayFX(hex.x, hex.y, -1)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_Nri_Mburicihi_UnitSetXY)

--JFD_Nri_Mburichi_GreatPersonExpended
function JFD_Nri_Mburichi_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end
	if (not unitTypeID) then unitTypeID = unitID end
	if unitTypeID ~= unitMburichiID then return end
	player:ChangeFaith(200)
end
GameEvents.GreatPersonExpended.Add(JFD_Nri_Mburichi_GreatPersonExpended)
----------------------------------------------------------------------------------------------------------------------------
-- BRONZE CASTER
----------------------------------------------------------------------------------------------------------------------------
--JFD_Nri_BronzeCaster_CityConstructed
local buildingBronzeCasterID = GameInfoTypes["BUILDING_JFD_BRONZE_CASTER"]
local resourceCopperID		 = GameInfoTypes["RESOURCE_COPPER"]
local resourceIronID		 = GameInfoTypes["RESOURCE_IRON"]
function JFD_Nri_BronzeCaster_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitNriID)) then return end
	if buildingID ~= buildingBronzeCasterID then return end
	local city = player:GetCityByID(cityID)
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	for adjacentPlot in PlotAreaSpiralIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if adjacentPlot:GetResourceType() == resourceIronID then
			adjacentPlot:SetResourceType(resourceIronID, 0)
			adjacentPlot:SetResourceType(resourceCopperID, 1)
		end
	end
end
GameEvents.CityConstructed.Add(JFD_Nri_BronzeCaster_CityConstructed)
--------------------------------------------------------------------------------------------------------------------------
-- DECISIONS
--------------------------------------------------------------------------------------------------------------------------
--Decisions_SanctifyIkenga.Monitors = {}
--	Decisions_SanctifyIkenga.Monitors[GameEvents.CityConstructed] =  (
--	function(playerID, cityID, buildingID, withGold, withFaithorCulture)
--		local player = Players[playerID]
--		if player:GetCivilizationType() ~= civilisationID then return end
--		if load(player, "Decisions_SanctifyIkenga") == true then
--			local city = player:GetCityByID(cityID)
--			local buildingData = GameInfo.Buildings[buildingID]
--			local buildingCost = city:GetBuildingPurchaseCost(buildingID)
--			local buildingName = buildingData.Description
--			if withGold then
--				local reward = (buildingCost * 20/100)
--				player:ChangeFaith(reward)
--				if player:IsHuman() then
--					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PEACE] Faith from a {2_BuildingName} purchased in {3_CityName}", reward, buildingName, city:GetName())) 
--				end
--			elseif withFaithorCulture then
--				local buildingCost = buildingData.FaithCost
--				local reward = (buildingCost * 20/100)
--				player:ChangeGold(reward)
--				if player:IsHuman() then
--					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLD] Gold from a {2_BuildingName} purchased in {3_CityName}", reward, buildingName, city:GetName())) 
--				end
--			end
--		end
--	end
--=======================================================================================================================
-- AI FUNCTIONS
--=======================================================================================================================
-- HARMONY OF ANI
------------------------------------------------------------------------------------------------------------------------
--JFD_Nri_HarmonyOfAni_PlayerDoTurnAI
function JFD_Nri_HarmonyOfAni_PlayerDoTurnAI(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitNriID)) then return end
	if (not JFD_IsAtPeace(playerID)) then return end
	local religionID = player:GetReligionCreatedByPlayer()
	if userSettingPietyCore then religionID = player:GetStateReligion() end
	if religionID <= 0 then return end	
	local cityStatesFriends = {}
	local count = 1
	for minorPlayerID = 0, GameDefines["MAX_MINOR_CIVS"] - 1 do
		local minorPlayer = Players[minorPlayerID]
		local minorCapital = minorPlayer:GetCapitalCity()
		if (minorPlayer:IsAlive() and minorPlayer:GetCapitalCity() and playerTeam:IsHasMet(minorPlayer:GetTeam()) and minorPlayer:GetMinorCivFriendshipLevelWithMajor(playerID) <= 1) then
			local minorCapitalReligionID = minorCapital:GetReligiousMajority()
			if minorCapitalReligionID == religionID then
				cityStatesFriends[count] = minorPlayer
			end
		end
	end
	if player:GetFaith() <= 0 then return end
	if player:GetFaith() < defineFaithGiftSmall then return end
	if #cityStatesFriends > 0 then
		local mediumInfluenceReward = player:GetFriendshipFromGoldGift(playerID, defineFaithGiftSmall)
		local minorCityState = cityStatesFriends[JFD_GetRandom(1,#cityStatesFriends)]
		if (not minorCityState) then return end
		player:ChangeFaith(-defineFaithGiftSmall)
		minorCityState:ChangeMinorCivFriendshipWithMajor(playerID, mediumInfluenceReward)
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Nri_HarmonyOfAni_PlayerDoTurnAI)
--==========================================================================================================================
-- UI UTILS
--==========================================================================================================================
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
--JFD_SetButtonSize
local WordWrapOffset     = 19;
local WordWrapAnimOffset = 3;
function JFD_SetButtonSize(textControl, buttonControl, animControl, buttonHL)
	local sizeY = textControl:GetSizeY() + WordWrapOffset;
	buttonControl:SetSizeY(sizeY);
	animControl:SetSizeY(sizeY+WordWrapAnimOffset);
	buttonHL:SetSizeY(sizeY+WordWrapAnimOffset);
end
--==========================================================================================================================
-- UI FUNCTIONS -- Thanks to Gedemon for the help!
--==========================================================================================================================
-- GLOBALS
-------------------------------------------------
local g_MinorCivID 		     = -1
local g_MinorCivTeamID 	     = -1
local g_CityStatePopup       = nil

local activePlayerID		 = Game.GetActivePlayer()
local activePlayer			 = Players[activePlayerID]
--------------------------------------------------------------------------------------------------------------------------
-- HARMONY OF ANI
--------------------------------------------------------------------------------------------------------------------------
Controls.JFDShowFaithGiftsButton:SetHide(true)

--JFD_Nri_HarmonyOfAni_SerialEventGameMessagePopup
local buttonPopupCityStateDiplo = ButtonPopupTypes["BUTTONPOPUP_CITY_STATE_DIPLO"]
function JFD_Nri_HarmonyOfAni_SerialEventGameMessagePopup(popupInfo)
	if popupInfo.Type ~= buttonPopupCityStateDiplo then return end
	if (not HasTrait(activePlayer, traitNriID)) then return end
	local buttonStack = ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack")
	local buttonScrollPanel = ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonScrollPanel")
	if (not buttonStack:IsHidden()) then
		Controls.JFDShowFaithGiftsButton:ChangeParent(buttonStack)
		Controls.JFDFaithGiftStack:ChangeParent(buttonScrollPanel)
		buttonStack:ReprocessAnchoring()
		buttonScrollPanel:ReprocessAnchoring()
	end
	g_CityStatePopup = popupInfo
	local playerID = popupInfo.Data1
    local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	
	g_MinorCivID = playerID
    g_MinorCivTeamID = playerTeamID
	
	JFD_Nri_HarmonyOfAni_UpdateDeclareWarButton()
	JFD_Nri_HarmonyOfAni_UpdateFaithGiftStack()
end
Events.SerialEventGameMessagePopup.Add(JFD_Nri_HarmonyOfAni_SerialEventGameMessagePopup)

--JFD_Nri_HarmonyOfAni_SerialEventGameDataDirty
function JFD_Nri_HarmonyOfAni_SerialEventGameDataDirty()
	if (not HasTrait(activePlayer, traitNriID)) then return end
	if (ContextPtr:LookUpControl("/InGame/CityStateDiploPopup"):IsHidden()) then return end	
	JFD_Nri_HarmonyOfAni_UpdateFaithGiftStack()
end
Events.SerialEventGameDataDirty.Add(JFD_Nri_HarmonyOfAni_SerialEventGameDataDirty)

--JFD_Nri_HarmonyOfAni_UpdateFaithGifts
function JFD_Nri_HarmonyOfAni_UpdateFaithGifts()
	Controls.JFDFaithGiftStack:SetHide(false);
	ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack"):SetHide(true);
	JFD_Nri_HarmonyOfAni_UpdateFaithGifts();
end
Controls.JFDShowFaithGiftsButton:RegisterCallback(Mouse.eLClick, JFD_Nri_HarmonyOfAni_UpdateFaithGifts)

--JFD_Nri_HarmonyOfAni_Back
function JFD_Nri_HarmonyOfAni_Back()
	Controls.JFDFaithGiftStack:SetHide(true)
	local buttonStack = ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/ButtonStack")
	buttonStack:SetHide(false)
	buttonStack:ReprocessAnchoring()
end
Controls.JFDFaithGiftBackButton:RegisterCallback(Mouse.eLClick, JFD_Nri_HarmonyOfAni_Back)

--JFD_Nri_HarmonyOfAni_Close
function JFD_Nri_HarmonyOfAni_Close()
	Controls.JFDFaithGiftStack:SetHide(true)
end
Events.SerialEventGameMessagePopupProcessed.Add(JFD_Nri_HarmonyOfAni_Close)
----------------------------------
-- INFO
----------------------------------
--JFD_Nri_HarmonyOfAni_UpdateDeclareWarButton
function JFD_Nri_HarmonyOfAni_UpdateDeclareWarButton(playerID)
	local player = Players[g_MinorCivID]
	local warButton = ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/WarButton")
	local religionID = activePlayer:GetReligionCreatedByPlayer()
	if userSettingPietyCore then religionID = player:GetStateReligion() end
	local minorCapital = player:GetCapitalCity()
	local isFaithGiftingDisabled = true
	if minorCapital then
		local minorCapitalReligionID = minorCapital:GetReligiousMajority()
		if (JFD_IsAtPeace(activePlayerID) and religionID > 0 and minorCapitalReligionID == religionID and activePlayer:GetCurrentEra() < eraIndustrialID) then
			local disabledText = "[COLOR_FADING_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_POP_CSTATE_DECLARE_WAR") .. "[ENDCOLOR]"
			warButton:SetDisabled(true)
			warButton:LocalizeAndSetText(disabledText)
			warButton:LocalizeAndSetToolTip("TXT_KEY_JFD_NRI_WAR_BUTTON_TT_DISABLED")
		else
			warButton:SetDisabled(false)
			warButton:LocalizeAndSetText("TXT_KEY_POP_CSTATE_DECLARE_WAR")
			warButton:LocalizeAndSetToolTip(nil)
		end
	end
end

--JFD_Nri_HarmonyOfAni_UpdateFaithGiftStack
function JFD_Nri_HarmonyOfAni_UpdateFaithGiftStack()
	local minor = Players[g_MinorCivID]
	local religionID = activePlayer:GetReligionCreatedByPlayer()
	if userSettingPietyCore then religionID = player:GetStateReligion() end
	local minorCapital = minor:GetCapitalCity()
	local isFaithGiftingDisabled = true
	if minorCapital then
		local minorCapitalReligionID = minorCapital:GetReligiousMajority()
		if (JFD_IsAtPeace(activePlayerID) and religionID > 0 and minorCapitalReligionID == religionID) then
			isFaithGiftingDisabled = false
		end
		if isFaithGiftingDisabled then
			local disabledText = "[COLOR_FADING_NEGATIVE_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_JFD_SHOW_FAITH_GIFTS_BUTTON") .. "[ENDCOLOR]"
			Controls.JFDShowFaithGiftsButton:SetText(disabledText)
			Controls.JFDShowFaithGiftsButton:LocalizeAndSetToolTip("TXT_KEY_JFD_SHOW_FAITH_GIFTS_BUTTON_TT_DISABLED")
		else
			Controls.JFDShowFaithGiftsButton:LocalizeAndSetText("TXT_KEY_JFD_SHOW_FAITH_GIFTS_BUTTON")
			Controls.JFDShowFaithGiftsButton:LocalizeAndSetToolTip("TXT_KEY_JFD_SHOW_FAITH_GIFTS_BUTTON_TT")
		end
	end
	Controls.JFDShowFaithGiftsButton:SetDisabled(isFaithGiftingDisabled)
	Controls.JFDShowFaithGiftsButton:SetHide(false)
end

--JFD_Nri_HarmonyOfAni_UpdateFaithGifts
local friendsAmount = GameDefines["FRIENDSHIP_THRESHOLD_FRIENDS"]
local alliesAmount 	= GameDefines["FRIENDSHIP_THRESHOLD_ALLIES"]
function JFD_Nri_HarmonyOfAni_UpdateFaithGifts()
	local player = Players[g_MinorCivID]
	Controls.JFDFaithGift1:SetDisabled(false)
	Controls.JFDFaithGift2:SetDisabled(false)
	Controls.JFDFaithGift3:SetDisabled(false)
	local largeInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, defineFaithGiftLarge)
	local largeGiftText = Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_LARGE", defineFaithGiftLarge, largeInfluenceReward)
	local mediumInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, defineFaithGiftMedium)
	local mediumGiftText = Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_MEDIUM", defineFaithGiftMedium, mediumInfluenceReward)
	local smallInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, defineFaithGiftSmall)
	local smallGiftText = Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_SMALL", defineFaithGiftSmall, smallInfluenceReward)
	
	local playerFaith = activePlayer:GetFaith()
	if playerFaith < defineFaithGiftSmall then
		smallGiftText = "[COLOR_WARNING_TEXT]" .. smallGiftText .. "[ENDCOLOR]"
		Controls.JFDFaithGift1Button:SetDisabled(true)
		Controls.JFDFaithGift1Anim:SetHide(true)
	else	
		Controls.JFDFaithGift1Button:SetDisabled(false)
		Controls.JFDFaithGift1Anim:SetHide(false)
	end
	Controls.JFDFaithGift1:SetText(smallGiftText)
	JFD_SetButtonSize(Controls.JFDFaithGift1, Controls.JFDFaithGift1Button, Controls.JFDFaithGift1Anim, Controls.JFDFaithGift1ButtonHL)
	
	if playerFaith < defineFaithGiftMedium then
		mediumGiftText = "[COLOR_WARNING_TEXT]" .. mediumGiftText .. "[ENDCOLOR]"
		Controls.JFDFaithGift2Button:SetDisabled(true)
		Controls.JFDFaithGift2Anim:SetHide(true)
	else	
		Controls.JFDFaithGift2Button:SetDisabled(false)
		Controls.JFDFaithGift2Anim:SetHide(false)
	end
	Controls.JFDFaithGift2:SetText(mediumGiftText)
	JFD_SetButtonSize(Controls.JFDFaithGift2, Controls.JFDFaithGift2Button, Controls.JFDFaithGift2Anim, Controls.JFDFaithGift2ButtonHL)
	
	if playerFaith < defineFaithGiftLarge then
		largeGiftText = "[COLOR_WARNING_TEXT]" .. largeGiftText .. "[ENDCOLOR]"
		Controls.JFDFaithGift3Button:SetDisabled(true)
		Controls.JFDFaithGift3Anim:SetHide(true)
	else	
		Controls.JFDFaithGift3Button:SetDisabled(false)
		Controls.JFDFaithGift3Anim:SetHide(false)
	end
	Controls.JFDFaithGift3:SetText(largeGiftText)
	JFD_SetButtonSize(Controls.JFDFaithGift3, Controls.JFDFaithGift3Button, Controls.JFDFaithGift3Anim, Controls.JFDFaithGift3ButtonHL)
		
	local currentFriendship = player:GetMinorCivFriendshipWithMajor(activePlayerID)
	local faithGiftTT = Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_STATUS_TT", friendsAmount, alliesAmount, currentFriendship) .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_JFD_FAITH_GIFT_TT")
	Controls.JFDFaithGift1Button:LocalizeAndSetToolTip(faithGiftTT)
	Controls.JFDFaithGift2Button:LocalizeAndSetToolTip(faithGiftTT)
	Controls.JFDFaithGift3Button:LocalizeAndSetToolTip(faithGiftTT)
end
----------------------------------
-- PURCHASES
----------------------------------
--JFD_Nri_HarmonyOfAni_JFDFaithGift1Button
function JFD_Nri_HarmonyOfAni_JFDFaithGift1Button()
	local player = Players[g_MinorCivID]
	local smallInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, defineFaithGiftSmall)
	activePlayer:ChangeFaith(-defineFaithGiftSmall)
	player:ChangeMinorCivFriendshipWithMajor(activePlayerID, smallInfluenceReward)
	JFD_Nri_HarmonyOfAni_Close()
end
Controls.JFDFaithGift1Button:RegisterCallback(Mouse.eLClick, JFD_Nri_HarmonyOfAni_JFDFaithGift1Button)

--JFD_Nri_HarmonyOfAni_JFDFaithGift2Button
function JFD_Nri_HarmonyOfAni_JFDFaithGift2Button()
	local player = Players[g_MinorCivID]
	local mediumInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, defineFaithGiftMedium)
	activePlayer:ChangeFaith(-defineFaithGiftMedium)
	player:ChangeMinorCivFriendshipWithMajor(activePlayerID, mediumInfluenceReward)
	JFD_Nri_HarmonyOfAni_Close()
end
Controls.JFDFaithGift2Button:RegisterCallback(Mouse.eLClick, JFD_Nri_HarmonyOfAni_JFDFaithGift2Button)

--JFD_Nri_HarmonyOfAni_JFDFaithGift3Button
function JFD_Nri_HarmonyOfAni_JFDFaithGift3Button()
	local player = Players[g_MinorCivID]
	local largeInfluenceReward = player:GetFriendshipFromGoldGift(activePlayerID, defineFaithGiftLarge)
	activePlayer:ChangeFaith(-defineFaithGiftLarge)
	player:ChangeMinorCivFriendshipWithMajor(activePlayerID, largeInfluenceReward)
	JFD_Nri_HarmonyOfAni_Close()
end
Controls.JFDFaithGift3Button:RegisterCallback(Mouse.eLClick, JFD_Nri_HarmonyOfAni_JFDFaithGift3Button)
--==========================================================================================================================
--==========================================================================================================================