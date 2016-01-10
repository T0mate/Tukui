local T, C, L = select(2, ...):unpack()

local _G = _G
local unpack = unpack
local string = string
local WorldFrame = WorldFrame
local RAID_CLASS_COLORS = RAID_CLASS_COLORS
local FACTION_BAR_COLORS = FACTION_BAR_COLORS

local Hider
local Convert = T.RGBToHex
local Scale = T.Scale
local NameplateParent = WorldFrame
local frameUpdateList = {}
local NamePlateIndex

local IsInGroup = IsInGroup

local Plates = CreateFrame("Frame", nil, WorldFrame)

function Plates:GetColor()
	local Colors = T["Colors"]

	local Red, Green, Blue = self.ArtContainer.HealthBar:GetStatusBarColor()

	for Class, _ in pairs(RAID_CLASS_COLORS) do
		local AltBlue = Blue

		if Class == "MONK" then
			AltBlue = AltBlue - 0.01
		end

		if RAID_CLASS_COLORS[Class].r == Red and RAID_CLASS_COLORS[Class].g == Green and RAID_CLASS_COLORS[Class].b == AltBlue then
			Red, Green, Blue = unpack(Colors.class[Class])
			return Red, Green, Blue
		end
	end

	if (Red + Blue + Blue) == 1.59 then			-- Tapped
		Red, Green, Blue = unpack(Colors.tapped)
	elseif Green + Blue == 0 then				-- Hostile
		Red, Green, Blue = unpack(Colors.reaction[2])
	elseif Red + Blue == 0 then					-- Friendly NPC
		Red, Green, Blue = unpack(Colors.reaction[5])
	elseif Red + Green > 1.95 then				-- Neutral NPC
		Red, Green, Blue = unpack(Colors.reaction[4])
	elseif Red + Green == 0 then				-- Friendly Player
		Red, Green, Blue = unpack(Colors.reaction[5])
	end

	return Red, Green, Blue
end

function Plates:UpdateCastBar()
	local Red, Blue, Green = self.ArtContainer.CastBar:GetStatusBarColor()
	local Minimum, Maximum = self.ArtContainer.CastBar:GetMinMaxValues()
	local Current = self.ArtContainer.CastBar:GetValue()
	local Shield = self.ArtContainer.CastBarFrameShield

	if Shield:IsShown() then
		self.NewPlate.CastBar:SetStatusBarColor(222/255, 95/255, 95/255)
		self.NewPlate.CastBar.Background:SetTexture((222/255) * .15, (95/255) * .15, (95/255) * .15)
	else
		self.NewPlate.CastBar:SetStatusBarColor(Red, Blue, Green)
		self.NewPlate.CastBar.Background:SetTexture(Red * .15, Blue * .15, Green * .15)	
	end

	self.NewPlate.CastBar:SetMinMaxValues(Minimum, Maximum)
	self.NewPlate.CastBar:SetValue(Current)
end

function Plates:CastOnShow()
	self.NewPlate.CastBar.Icon:SetTexture(self.ArtContainer.CastBarSpellIcon:GetTexture())
	self.NewPlate.CastBar.Name:SetText(self.ArtContainer.CastBarText:GetText())
	self.NewPlate.CastBar.NameShadow:SetWidth(self.ArtContainer.CastBarText:GetStringWidth() + 10)
	self.NewPlate.CastBar:Show()
end

function Plates:CastOnHide()
	self.NewPlate.CastBar:Hide()
end

function Plates:OnShow()
	if InCombatLockdown() then
		table.insert(frameUpdateList, self)
		-- return -- TODO: watch this carefully
	else
		frameUpdateList = {}
		--self.Bar:SetSize(self.NewPlate:GetWidth(), Plates.PlateHeight*2)
	end
	
	if not self:IsShown() then
		return
	end


	--[[local Colors = T["Colors"]
	local Name = self.Name:GetText() or "Unknown"
	local Level = self.Level:GetText() or ""
	local Red, Green, Blue = Plates.GetColor(self)
	local LevelRed, LevelGreen, LevelBlue = self.Level:GetTextColor()
	local Hex = Convert(LevelRed, LevelGreen, LevelBlue)
	local Boss, Dragon = self.Boss, self.Dragon
	local Threat = self.Threat
	local IsInGroup = select(2, UnitClass(Name))
	
	if IsInGroup then
		-- Party/Raid members name will be class colored
		local Class = IsInGroup
		local R, G, B = unpack(Colors.class[Class])
		local Color = Convert(R, G, B)
		
		Name = Color .. Name .. "|r"
	end
	
	self.Health:ClearAllPoints()
	self.Health:SetPoint("BOTTOM", self.NewPlate)
	self.Health:SetPoint("LEFT", self.NewPlate)
	self.Health:SetPoint("RIGHT", self.NewPlate)
	self.Health:SetHeight(Plates.PlateHeight)
	self.Health.NewTexture:SetVertexColor(Red, Green, Blue)
	self.Health.Background:SetTexture(Red * .15, Green * .15, Blue * .15)]]
	

	local Name = self.NameContainer.NameText:GetText() or "Unknown"
	local Level = self.ArtContainer.LevelText:GetText() or ""
	local LevelRed, LevelGreen, LevelBlue = self.ArtContainer.LevelText:GetTextColor()
	local Hex = Convert(LevelRed, LevelGreen, LevelBlue)
	local Boss, Elite = self.ArtContainer.HighLevelIcon, self.ArtContainer.EliteIcon


	if Boss:IsShown() then
		Level = "??"
	elseif Elite:IsShown() then
		Level = Level .. "+"
	end

	self.NewPlate.Name:SetText(Hex .. Level .. "|r " .. Name)
end

function Plates:Highlight()
	if self.ArtContainer.Highlight:IsShown() then
		self.NewPlate.Health.Highlight:Show()
	else
		self.NewPlate.Health.Highlight:Hide()
	end
end

function Plates:UpdateHealth()
	self.NewPlate.Health:SetMinMaxValues(self.ArtContainer.HealthBar:GetMinMaxValues())
	self.NewPlate.Health:SetValue(self.ArtContainer.HealthBar:GetValue())
end

function Plates:UpdateHealthColor()
	if not self:IsShown() then
		return
	end

	local Red, Green, Blue = Plates.GetColor(self)

	if IsInGroup() then
		local Name = self.NameContainer.NameText:GetText() or "Unknown"
		Name = string.gsub(Name, ' %(.%)$', '')			-- X-Realm Fix
		local Class = select(2, UnitClass(Name))
		if Class then
			if C.NamePlates.NameTextColor then
				self.NewPlate.Name:SetTextColor(unpack(T["Colors"].class[Class]))
			else
				Red, Green, Blue = unpack(T["Colors"].class[Class])
			end
		end
	end

	self.NewPlate.Health:SetStatusBarColor(Red, Green, Blue)
	self.NewPlate.Health.Background:SetTexture(Red * .15, Green * .15, Blue * .15)
end

function Plates:UpdateHealthText()
	local MinHP, MaxHP = self.ArtContainer.HealthBar:GetMinMaxValues()
	local CurrentHP = self.ArtContainer.HealthBar:GetValue()
	local Percent = (CurrentHP / MaxHP) * 100

	-- self.NewPlate.Health.Text:SetText(T.ShortValue(CurrentHP).." / "..T.ShortValue(MaxHP))
	self.NewPlate.Health.Text:SetFormattedText("%.1f%%", Percent)
end

function Plates:Skin(obj)
	local Plate = obj
	local Texture = T.GetTexture(C["NamePlates"].Texture)
	local Font = T.GetFont(C["NamePlates"].Font)
	local FontName, FontSize, FontFlags = _G[Font]:GetFont()
	local IsPixel = false

	if (Font == "TukuiPixelFont") then
		IsPixel = true
	end

	local HealthBar = Plate.ArtContainer.HealthBar
	-- local OverAbsorb = HealthBar.OverAbsorb
	local AbsorbBar = Plate.ArtContainer.AbsorbBar
	local Border = Plate.ArtContainer.Border
	local Highlight = Plate.ArtContainer.Highlight
	local LevelText = Plate.ArtContainer.LevelText
	local RaidTargetIcon = Plate.ArtContainer.RaidTargetIcon
	local Elite = Plate.ArtContainer.EliteIcon
	local Threat = Plate.ArtContainer.AggroWarningTexture
	local Boss = Plate.ArtContainer.HighLevelIcon
	local CastBar = Plate.ArtContainer.CastBar
	local CastBarBorder = Plate.ArtContainer.CastBarBorder
	local CastBarSpellIcon = Plate.ArtContainer.CastBarSpellIcon
	local CastBarFrameShield = Plate.ArtContainer.CastBarFrameShield
	local CastBarText = Plate.ArtContainer.CastBarText
	local CastBarTextBG = Plate.ArtContainer.CastBarTextBG

	local Name = Plate.NameContainer.NameText

	HealthBar:SetParent(Hider)
	LevelText:SetParent(Hider)
	Border:SetParent(Hider)
	Name:SetParent(Hider)

	CastBar:SetAlpha(0)

	Boss:SetAlpha(0)
	Boss:SetTexture(nil)
	Highlight:SetAlpha(0)
	Highlight:SetTexture(nil)
	Elite:SetAlpha(0)
	Elite:SetTexture(nil)
	Threat:SetAlpha(0)
	Threat:SetTexture(nil)

	self.Container[Plate] = CreateFrame("Frame", nil, self)

	local NewPlate = self.Container[Plate]
	NewPlate:Size(self.PlateWidth, self.PlateHeight + self.PlateCastHeight + self.PlateSpacing)
	NewPlate:SetFrameStrata("BACKGROUND")
	NewPlate:SetFrameLevel(2)
	
	-- Reference
	--[[NewPlate.BlizzardPlate = Plate
	Plate.NewPlate = NewPlate
	
	Plate.Frame:SetParent(Hider)
	
	-- Original Health
	Plate.Health:SetParent(NewPlate)
	Plate.Health.Texture = Plate.Health:GetStatusBarTexture()
	Plate.Health.Texture:SetTexture(nil)
	--Plate.Health:SetScript("OnChangedValue", Plates.UpdateHealthText)
	
	-- New Health
	Plate.Health.NewTexture = Plate.Health:CreateTexture(nil, "ARTWORK", nil, -6)
	Plate.Health.NewTexture:SetAllPoints(Plate.Health.Texture)
	Plate.Health.NewTexture:SetTexture(Texture)
	Plate.Health.NewTexture:SetVertexColor(0, 1, 0)
	
	-- Health Backdrop
	Plate.Health.Background = Plate.Health:CreateTexture(nil, "BACKGROUND")
	Plate.Health.Background:SetAllPoints()
	Plate.Health:CreateShadow()
	
	-- Textures
	Plate.Border:SetAlpha(0)
	Plate.Border:SetTexture(nil)
	Plate.Highlight:SetAlpha(0)
	Plate.Highlight:SetTexture(nil)
	Plate.Boss:SetAlpha(0)
	Plate.Boss:SetTexture(nil)
	Plate.Dragon:SetAlpha(0)
	Plate.Dragon:SetTexture(nil)
	Plate.Threat:SetAlpha(0)
	Plate.Threat:SetTexture(nil)
	
	-- Casting
	Plate.Cast:SetAlpha(0)
	Plate.Cast:SetFrameLevel(1)
	
	Plate.NewCast = CreateFrame("StatusBar", nil, Plate.Health)
	Plate.NewCast:SetStatusBarTexture(C.Medias.Normal)
	Plate.NewCast:SetMinMaxValues(0, 100)
	Plate.NewCast:SetHeight(Plates.PlateCastHeight)
	Plate.NewCast:SetWidth(C.NamePlates.Width)
	Plate.NewCast:SetPoint("TOP", Plate.Health, "BOTTOM", 0, -4)
	Plate.NewCast:SetValue(100)
	Plate.NewCast.Background = Plate.NewCast:CreateTexture(nil, "BACKGROUND")
	Plate.NewCast.Background:SetAllPoints()
	Plate.NewCast:CreateShadow()
	Plate.NewCast:Hide()
	
	Plate.Cast.Icon:SetTexCoord(unpack(T.IconCoord))
	Plate.Cast.Icon:Size(self.PlateHeight + self.PlateCastHeight + self.PlateSpacing)

	Plate.Cast.Icon.Backdrop = CreateFrame("Frame", nil, Plate.NewCast)
	Plate.Cast.Icon.Backdrop:SetFrameLevel(Plate.Cast:GetFrameLevel() - 1)
	Plate.Cast.Icon.Backdrop:SetAllPoints(Plate.Cast.Icon)
	Plate.Cast.Icon.Backdrop:CreateShadow()
	
	Plate.Cast.Icon:SetParent(Plate.NewCast)
	Plate.Cast.Icon:ClearAllPoints()
	Plate.Cast.Icon:SetPoint("TOPRIGHT", Plate.Health, "TOPLEFT", -4, 0)
	
	Plate.Cast.Name:SetParent(Plate.NewCast)
	Plate.Cast.Name:ClearAllPoints()
	Plate.Cast.Name:Point("BOTTOM", Plate.NewCast, 0, -9)
	Plate.Cast.Name:Point("LEFT", Plate.NewCast, 7, 0)
	Plate.Cast.Name:Point("RIGHT", Plate.NewCast, -7, 0)
	Plate.Cast.Name:SetFont(FontName, FontSize - (IsPixel and 2 or 4), FontFlags)
	Plate.Cast.Name:SetShadowColor(0, 0, 0, 0)
	
	Plate.Cast.NameShadow:SetParent(Plate.NewCast)
	Plate.Cast.NameShadow:ClearAllPoints()
	Plate.Cast.NameShadow:SetPoint("CENTER", Plate.Cast.Name, "CENTER", 0, -2)
	Plate.Cast.Shield:SetTexture(nil)
	
	-- Level
	Plate.Level:SetParent(Hider)
	Plate.Level:Hide()
	
	-- Name
	Plate.NewName = NewPlate:CreateFontString(nil, "OVERLAY")
	Plate.NewName:SetPoint("BOTTOM", Plate.Health, "TOP", 0, 2)
	Plate.NewName:SetPoint("LEFT", Plate.Health, -2, 0)
	Plate.NewName:SetPoint("RIGHT", Plate.Health, 2, 0)
	Plate.NewName:SetFont(FontName, FontSize - 2, FontFlags)
	
	-- Raid Icon
	--point, relativeTo, relativePoint, xOfs, yOfs = Plate.Raid:GetPoint()
	Plate.Raid:SetSize(20,20)
	Plate.Raid:ClearAllPoints()
	Plate.Raid:SetPoint('BOTTOM', Plate.NewName, 'TOP', 0, 0)
	]]
	-- Health Text


	NewPlate.Health = CreateFrame("StatusBar", nil, NewPlate)
	NewPlate.Health:SetFrameStrata("BACKGROUND")
	NewPlate.Health:SetFrameLevel(3)
	NewPlate.Health:Size(self.PlateWidth, self.PlateHeight)
	NewPlate.Health:SetStatusBarTexture(Texture)
	NewPlate.Health:SetPoint("BOTTOM", 0, 0)
	NewPlate.Health:CreateShadow()

	NewPlate.Health.Highlight = NewPlate.Health:CreateTexture(nil, "OVERLAY")
	NewPlate.Health.Highlight:SetTexture(1, 1, 1, 0.3)
	NewPlate.Health.Highlight:SetBlendMode("BLEND")
	NewPlate.Health.Highlight:SetAllPoints()

	NewPlate.Health.Background = NewPlate.Health:CreateTexture(nil, "BACKGROUND", nil, -8)
	NewPlate.Health.Background:SetTexture(Texture)
	NewPlate.Health.Background:SetAllPoints()


	if C.NamePlates.HealthText then
		NewPlate.Health.Text = NewPlate.Health:CreateFontString(nil, "OVERLAY")	
		NewPlate.Health.Text:SetFont(FontName, FontSize - 3, FontFlags)
		NewPlate.Health.Text:SetShadowColor(0, 0, 0, 0.4)
		NewPlate.Health.Text:SetPoint("CENTER", NewPlate.Health)
		NewPlate.Health.Text:SetTextColor(1, 1, 1)
	end

	NewPlate.Name = NewPlate.Health:CreateFontString(nil, "OVERLAY")
	NewPlate.Name:SetPoint("BOTTOM", NewPlate.Health, "TOP", 0, 2)
	NewPlate.Name:SetFont(FontName, FontSize - 2, FontFlags)

	NewPlate.CastBar = CreateFrame("StatusBar", nil, NewPlate.Health)
	NewPlate.CastBar:SetFrameStrata("BACKGROUND")
	NewPlate.CastBar:SetFrameLevel(3)
	NewPlate.CastBar:SetStatusBarTexture(Texture)
	NewPlate.CastBar:SetMinMaxValues(0, 100)
	NewPlate.CastBar:SetHeight(Plates.PlateCastHeight)
	NewPlate.CastBar:SetWidth(C.NamePlates.Width)
	NewPlate.CastBar:SetPoint("TOP", NewPlate.Health, "BOTTOM", 0, -4)
	NewPlate.CastBar:SetValue(100)
	NewPlate.CastBar.Background = NewPlate.CastBar:CreateTexture(nil, "BACKGROUND")
	NewPlate.CastBar.Background:SetAllPoints()
	NewPlate.CastBar:CreateShadow()
	NewPlate.CastBar:Hide()

	NewPlate.CastBar.Icon = NewPlate.CastBar:CreateTexture(nil, "OVERLAY")
	NewPlate.CastBar.Icon:SetTexture(Texture)
	NewPlate.CastBar.Icon:SetTexCoord(unpack(T.IconCoord))
	NewPlate.CastBar.Icon:Size(self.PlateHeight + self.PlateCastHeight + self.PlateSpacing)
	NewPlate.CastBar.Icon:SetPoint("TOPRIGHT", NewPlate.Health, "TOPLEFT", -4, 0)

	NewPlate.CastBar.Icon.Backdrop = CreateFrame("Frame", nil, NewPlate.CastBar)
	NewPlate.CastBar.Icon.Backdrop:SetFrameStrata("BACKGROUND")
	NewPlate.CastBar.Icon.Backdrop:SetFrameLevel(3)
	NewPlate.CastBar.Icon.Backdrop:SetAllPoints(NewPlate.CastBar.Icon)
	NewPlate.CastBar.Icon.Backdrop:CreateShadow()

	NewPlate.CastBar.Name = NewPlate.CastBar:CreateFontString(nil, "OVERLAY")
	NewPlate.CastBar.Name:Point("BOTTOM", NewPlate.CastBar, 0, -9)
	NewPlate.CastBar.Name:Point("LEFT", NewPlate.CastBar, 7, 0)
	NewPlate.CastBar.Name:Point("RIGHT", NewPlate.CastBar, -7, 0)
	NewPlate.CastBar.Name:SetFont(FontName, FontSize - (IsPixel and 2 or 4), FontFlags)
	NewPlate.CastBar.Name:SetShadowColor(0, 0, 0, 0)

	NewPlate.CastBar.NameShadow = NewPlate.CastBar:CreateTexture(nil, "BACKGROUND")
	NewPlate.CastBar.NameShadow:SetTexture("Interface\\Common\\NameShadow")
	NewPlate.CastBar.NameShadow:SetPoint("CENTER", NewPlate.CastBar.Name, "CENTER", 0, -2)

	Plate.NewPlate = NewPlate

	self.OnShow(Plate)
	
	-- Tell Tukui that X nameplate is Skinned
	--[[Plate.IsSkinned = true

	Plate.Bar:SetBackdrop(
		{
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "",
			tile = true, tileSize = 1, edgeSize = 0,
			insets = { left = 0, right = 0, top = 0, bottom = 0 }
		}
	);
	Plate.Bar:SetBackdropColor(0,0,0,.2);
	if InCombatLockdown() then
		table.insert(frameUpdateList, Plate)
		-- return -- TODO: watch this carefully
	else
		frameUpdateList = {}
		Plate.Bar:SetSize(Plate.NewPlate:GetWidth(), Plates.PlateHeight*2)
	end
end]]

	Plate:HookScript("OnShow", self.OnShow)
	HealthBar:HookScript('OnValueChanged', function() self.UpdateHealth(Plate) end)
	CastBar:HookScript("OnShow", function() self.CastOnShow(Plate) end)
	CastBar:HookScript("OnHide", function() self.CastOnHide(Plate) end)
	CastBar:HookScript("OnValueChanged", function() self.UpdateCastBar(Plate) end)

	Plate.IsSkinned = true
	NamePlateIndex = NamePlateIndex + 1
end

function Plates:Search()
	if not NamePlateIndex then
		for _, BlizzardPlate in next, {WorldFrame:GetChildren()} do
			local Name = BlizzardPlate:GetName()
			if Name and string.match(Name, "^NamePlate%d+$") then
				NamePlateIndex = string.gsub(Name,"NamePlate","")
				break
			end
		end
	else
		local BlizzardPlate = _G["NamePlate"..NamePlateIndex]
		if BlizzardPlate and not BlizzardPlate.IsSkinned then
			self:Skin(BlizzardPlate)
		end
	end
end

function Plates:UpdateAggro()
	if (self.ArtContainer.AggroWarningTexture:IsShown()) then
		self.NewPlate.Name:SetTextColor(1, 0, 0)
	else
		self.NewPlate.Name:SetTextColor(1, 1, 1)
	end
end

function Plates:Update()
	for Plate, NewPlate in pairs(self.Container) do
		if Plate:IsShown() then
			NewPlate:Hide()
			NewPlate:SetPoint("CENTER", NameplateParent, "BOTTOMLEFT", Plate:GetCenter())
			NewPlate:Show()

			if Plate:GetAlpha() == 1 then
				NewPlate:SetAlpha(1)
			else
				NewPlate:SetAlpha(C.NamePlates.NonTargetAlpha)
			end

			self.UpdateAggro(Plate)
			self.UpdateHealthColor(Plate)
			self.Highlight(Plate)
			if C.NamePlates.HealthText then
				self.UpdateHealthText(Plate)
			end
		else
			NewPlate:Hide()
		end
	end
end

function Plates:OnUpdate(elapsed)
	self:Search()
	self:Update()
end

function Plates:Enable()
	if (not C.NamePlates.Enable) then
		return
	end

	if IsAddOnLoaded("CT_Viewport") then
		NameplateParent = UIParent
	end

	Hider = T["Panels"].Hider

	SetCVar("bloatnameplates", 0)
	SetCVar("bloatthreat", 0)

	self:SetAllPoints()
	self.Container = {}
	self:SetScript("OnUpdate", self.OnUpdate)
	self.PlateWidth = C.NamePlates.Width
	self.PlateHeight = C.NamePlates.Height
	self.PlateCastHeight = C.NamePlates.CastHeight
	self.PlateSpacing = C.NamePlates.Spacing
	self.Backdrop = {
		bgFile = C.Medias.Blank,
		edgeFile = C.Medias.Blank,
		insets = {top = -T.Mult, left = -T.Mult, bottom = -T.Mult, right = -T.Mult},
	}
end

T["NamePlates"] = Plates