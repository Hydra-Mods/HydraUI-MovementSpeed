if (not HydraUIGlobal) then
	return
end

local HydraUI, Language, Assets, Settings = HydraUIGlobal:get()
local GetUnitSpeed = GetUnitSpeed
local STAT_SPEED = STAT_SPEED

local OnMouseUp = function()
	if InCombatLockdown() then
		return print(ERR_NOT_IN_COMBAT)
	end

	ToggleCharacter("PaperDollFrame")
end

local Update = function(self)
	self.Text:SetFormattedText("|cFF%s%s:|r |cFF%s%.0f%%|r", Settings["data-text-label-color"], STAT_SPEED, HydraUI.ValueColor, GetUnitSpeed("player") / 7 * 100)
end

local OnEnable = function(self)
	self:RegisterUnitEvent("UNIT_STATS", "player")
	self:SetScript("OnUpdate", Update)
	self:SetScript("OnMouseUp", OnMouseUp)
	self:Update()
end

local OnDisable = function(self)
	self:SetScript("OnUpdate", nil)
	self:SetScript("OnMouseUp", nil)
	self.Text:SetText("")
end

HydraUI:AddDataText(STAT_MOVEMENT_SPEED, OnEnable, OnDisable, Update)
HydraUI:NewPlugin("HydraUI_MovementSpeed")