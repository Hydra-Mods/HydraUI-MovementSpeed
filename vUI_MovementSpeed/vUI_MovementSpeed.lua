if (not vUIGlobal) then
	return
end

local vUI, GUI, Language, Assets, Settings = vUIGlobal:get()

local GetUnitSpeed = GetUnitSpeed
local STAT_SPEED = STAT_SPEED

local OnMouseUp = function()
	ToggleCharacter("PaperDollFrame")
end

local Update = function(self)
	local Speed = GetUnitSpeed("player") / 7 * 100
	
	self.Text:SetFormattedText("|cFF%s%s:|r |cFF%s%.0f%%|r", Settings["data-text-label-color"], STAT_SPEED, Settings["data-text-value-color"], Speed)
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

vUI:AddDataText(STAT_MOVEMENT_SPEED, OnEnable, OnDisable, Update)
vUI:NewPlugin("vUI_MovementSpeed")