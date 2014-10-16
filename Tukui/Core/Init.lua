----------------------------------------------------------------
-- Initiation of Tukui engine
----------------------------------------------------------------

-- [[ Build the engine ]] --
local AddOn, Engine = ...

Engine[1] = CreateFrame("Frame")
Engine[2] = {}
Engine[3] = {}
Engine[4] = {}

function Engine:unpack()
	return self[1], self[2], self[3], self[4]
end

Engine[1].Resolution = GetCVar("gxResolution")
Engine[1].ScreenHeight = tonumber(string.match(Engine[1].Resolution, "%d+x(%d+)"))
Engine[1].ScreenWidth = tonumber(string.match(Engine[1].Resolution, "(%d+)x+%d"))
Engine[1].MyClass = select(2, UnitClass("player"))
Engine[1].MyLevel = UnitLevel("player")
Engine[1].Version = GetAddOnMetadata(AddOn, "Version")
Engine[1].VersionNumber = tonumber(Engine[1].Version)
Engine[1].WoWPatch, Engine[1].WoWBuild, Engine[1].WoWPatchReleaseDate, Engine[1].TocVersion = GetBuildInfo()

SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

Tukui = Engine
if (Tukui[1].ScreenWidth > 3840) or (UIParent:GetWidth() + 1 > Tukui[1].ScreenWidth) then
	local width = Tukui[1].ScreenWidth
	local height = Tukui[1].ScreenHeight
	
	-- because some user enable bezel compensation, we need to find the real width of a single monitor.
	-- I don't know how it really work, but i'm assuming they add pixel to width to compensate the bezel. :P
	
	-- HQ resolution
	if width >= 9840 then width = 3280 end                   	                -- WQSXGA
	if width >= 7680 and width < 9840 then width = 2560 end                     -- WQXGA
	if width >= 5760 and width < 7680 then width = 1920 end 	                -- WUXGA & HDTV
	if width >= 5040 and width < 5760 then width = 1680 end 	                -- WSXGA+
	
	-- adding height condition here to be sure it work with bezel compensation because WSXGA+ and UXGA/HD+ got approx same width
	if width >= 4800 and width < 5760 and height == 900 then width = 1600 end   -- UXGA & HD+
	
	-- low resolution screen
	if width >= 4320 and width < 4800 then width = 1440 end 	                -- WSXGA
	if width >= 4080 and width < 4320 then width = 1360 end 	                -- WXGA
	if width >= 3840 and width < 4080 then width = 1224 end 	                -- SXGA & SXGA (UVGA) & WXGA & HDTV
	
	-- register a constant, we will need it later for launch.lua
	Tukui[1].eyefinity = width
end
	
--------------------------------------------------------
-- Graphics Settings
--------------------------------------------------------

-- the ui doesn't reload if ratio stay the same, we need to force reload if it happen.
local function NeedReloadUI()
	local resolution = Graphics_ResolutionDropDown
	local x, y = resolution:getValues()
	local oldratio = Tukui[1].ScreenWidth / Tukui[1].ScreenHeight
	local newratio = x / y
	local oldreso = Tukui[1].Resolution
	local newreso = x.."x"..y
	
	if (oldratio == newratio) and (oldreso ~= newreso) then
		ReloadUI()
	end
end

local Graphic = CreateFrame("Frame")
Graphic:RegisterEvent("PLAYER_ENTERING_WORLD")
Graphic:SetScript("OnEvent", function(self, event)
	-- we adjust UIParent to screen #1 if Eyefinity is found
	if Tukui[1].eyefinity then
		local width = Tukui[1].eyefinity
		local height = Tukui[1].ScreenHeight
		
		UIParent:SetSize(width, height)
		UIParent:ClearAllPoints()
		UIParent:SetPoint("CENTER")		
	end

	-- require a reload when graphics option changes, even if Standard Blizzard UI doesn't really need it.
	VideoOptionsFrameOkay:HookScript("OnClick", NeedReloadUI)
	VideoOptionsFrameApply:HookScript("OnClick", NeedReloadUI)
	
	-- unload
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)