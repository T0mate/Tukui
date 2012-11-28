﻿local T, C, L, G = unpack(select(2, ...))

-----------------------------------------
-- This is the default configuration file
-----------------------------------------

C["general"] = {
	["autoscale"] = true,                               -- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.71,                                 -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["overridelowtohigh"] = false,                      -- EXPERIMENTAL ONLY! override lower version to higher version on a lower reso.
	["backdropcolor"] = { .1,.1,.1 },                   -- default backdrop color of panels
	["bordercolor"] = { .6,.6,.6 },                     -- default border color of panels
	["blizzardreskin"] = true,                          -- reskin all Blizzard frames
}

C["unitframes"] = {
	-- general options
	["enable"] = true,                                  -- do i really need to explain this?
	["enemyhcolor"] = false,                            -- enemy target (players) color by hostility, very useful for healer.
	["unitcastbar"] = false,                            -- enable tukui castbar
	["cblatency"] = false,                              -- enable castbar latency
	["cbicons"] = true,                                 -- enable icons on castbar
	["classiccombo"] = false,                           -- display classic combo points (from Tukui 13 or less)
	["movecombobar"] = false,                           -- display the new combo bar (t14+) from target to player (ROGUE ONLY)
	["auratimer"] = true,                               -- enable timers on buffs/debuffs
	["auratextscale"] = 11,                             -- the font size of buffs/debuffs timers on unitframes
	["targetauras"] = true,                             -- enable auras on target unit frame
	["lowThreshold"] = 20,                              -- global low threshold, for low mana warning.
	["targetpowerpvponly"] = false,                     -- enable power text on pvp target only
	["totdebuffs"] = false,                             -- enable tot debuffs (high reso only)
	["showtotalhpmp"] = false,                          -- change the display of info text on player and target with XXXX/Total.
	["showsmooth"] = true,                              -- enable smooth bar
	["charportrait"] = true,                            -- do i really need to explain this?
	["maintank"] = false,                               -- enable maintank
	["mainassist"] = false,                             -- enable mainassist
	["unicolor"] = false,                               -- enable unicolor theme
	["combatfeedback"] = true,                          -- enable combattext on player and target.
	["playeraggro"] = true,                             -- color player border to red if you have aggro on current target.
	["healcomm"] = true,                                -- enable healprediction support.
	["onlyselfdebuffs"] = false,                        -- display only our own debuffs applied on target
	["showfocustarget"] = true,                         -- show focus target
	["showstatuebar"] = true,                           -- show statue bar (Dependencies: class bar option)
	["bordercolor"] = { .4,.4,.4 },                     -- unit frames panel border color

	-- raid layout (if one of them is enabled)
	["raid"] = true,                                    -- enable raid frames
	["showrange"] = true,                               -- show range opacity on raidframes
	["raidalphaoor"] = 0.3,                             -- alpha of unitframes when unit is out of range
	["showsymbols"] = true,	                            -- show symbol.
	["aggro"] = true,                                   -- show aggro on all raids layouts
	["raidunitdebuffwatch"] = true,                     -- track important spell to watch in pve for grid mode.
	["gridhealthvertical"] = true,                      -- enable vertical grow on health bar for grid mode.
	["gridscale"] = 1,                                  -- set the healing grid scaling
	["gridvertical"] = true,                            -- grid group displayed vertically
	["raidunitspercolumn"] = 10,                        -- number or raid member show per column
	["showraidpets"] = true,                            -- show pets in raid unit frames
	["maxraidplayers"] = false,                         -- max raid frames displayed according to instance max players
	["showgroupresurrect"] = false,                     -- show ressurect icon on raid frames
	
	-- boss frames
	["showboss"] = true,                                -- enable boss unit frames for PVELOL encounters.
	
	-- arena frames
	["arena"] = true,                                   -- enable arena frames

	-- priest only plugin
	["weakenedsoulbar"] = true,                         -- show weakened soul bar
	
	-- class bar
	["classbar"] = true,                                -- enable tukui classbar over player unit
	
	-- these class bar are considered optional
	["druidmanabar"] = true,                            -- enable druid class mana bar
	["druidmushroombar"] = true,                        -- enable druid class mushroom bar
	["mageclassbar"] = true,                            -- enable mage class arcane bar
}

C["auras"] = {
	["player"] = true,                                  -- enable tukui buffs/debuffs
	["consolidate"] = false,                            -- enable downpdown menu with consolidate buff
	["flash"] = false,                                  -- flash warning for buff with time < 30 sec
	["classictimer"] = true,                           -- Display classic timer on player auras.
}

C["actionbar"] = {
	["enable"] = true,                                  -- enable tukui action bars
	["hotkey"] = false,                                 -- enable hotkey display because it was a lot requested
	["macro"] = false,                                  -- enable macro display because it was a lot requested
	["hideshapeshift"] = true,                          -- hide shapeshift or totembar because it was a lot requested.
	["buttonsize"] = 27,                                -- normal buttons size
	["petbuttonsize"] = 29,                             -- pet & stance buttons size
	["buttonspacing"] = 4,                              -- buttons spacing
	["ownshdbar"] = false,                              -- use a complete new stance bar for shadow dance (rogue only)
	["ownmetabar"] = true,                              -- use a complete new stance bar for metamorphosis (warlock only)
	["ownwarstancebar"] = false,                        -- use a different bar for every warrior stance like it was in previous xpac (warrior only)
}

C["bags"] = {
	["enable"] = true,                                  -- enable an all in one bag mod that fit tukui perfectly
}

C["loot"] = {
	["lootframe"] = true,                               -- reskin the loot frame to fit tukui
	["rolllootframe"] = true,                           -- reskin the roll frame to fit tukui
}

C["cooldown"] = {
	["enable"] = true,                                  -- do i really need to explain this?
	["treshold"] = 10,                                  -- show decimal under X seconds and text turn red
}

C["datatext"] = {
	["fps_ms"] = 0,                                     -- show fps and ms on panels
	["system"] = 0,                                     -- show total memory and others systems infos on panels
	["bags"] = 0,                                       -- show space used in bags on panels
	["gold"] = 6,                                       -- show your current gold on panels
	["wowtime"] = 1,                                    -- show time on panels
	["guild"] = 0,                                      -- show number on guildmate connected on panels
	["dur"] = 0,                                        -- show your equipment durability on panels.
	["friends"] = 0,                                    -- show number of friends connected.
	["dps_text"] = 0,                                   -- show a dps meter on panels
	["hps_text"] = 0,                                   -- show a heal meter on panels
	["power"] = 0,                                      -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["haste"] = 0,                                      -- show your haste rating on panels.
	["crit"] = 0,                                       -- show your crit rating on panels.
	["avd"] = 0,                                        -- show your current avoidance against the level of the mob your targeting
	["armor"] = 0,                                      -- show your armor value against the level mob you are currently targeting
	["currency"] = 0,                                   -- show your tracked currency on panels
	["hit"] = 0,                                        -- show hit rating
	["mastery"] = 0,                                    -- show mastery rating
	["micromenu"] = 0,                                  -- add a micro menu thought datatext
	["regen"] = 0,                                      -- show mana regeneration
	["talent"] = 0,                                     -- show talent
	["calltoarms"] = 0,                                 -- show dungeon and call to arms
	["battleground"] = false,                           -- enable 3 stats in battleground only that replace stat1,stat2,stat3.
	["time24"] = true,                                  -- set time to 24h format.
	["localtime"] = false,                              -- set time to local time instead of server time.
	["fontsize"] = 12,                                  -- font size for panels.
}

C["broker_datatext"] = {
	["|cFFFFB366Ara|r Friends"] = 2,
	["|cFFFFB366Ara|r Guild"] = 3,
	["Broker_MicroMenu"] = 4,
	["|cffffb366Ara|r Reputations"] = 5,
	["BugSack"] = 7,
	["AtlasLoot"] = 8,
}

C["chat"] = {
	["enable"] = true,                                  -- blah
	["whispersound"] = true,                            -- play a sound when receiving whisper
	["background"] = false,
}

C["nameplate"] = {
	["enable"] = true,                                  -- enable nice skinned nameplates that fit into tukui
	["showhealth"] = true,				                -- show health text on nameplate
	["enhancethreat"] = true,			                -- threat features based on if your a tank or not
	["combat"] = false,					                -- only show enemy nameplates in-combat.
}

C["tooltip"] = {
	["enable"] = true,                                  -- true to enable this mod, false to disable
	["hidecombat"] = false,                             -- hide bottom-right tooltip when in combat
	["hidebuttons"] = false,                            -- always hide action bar buttons tooltip.
	["hideuf"] = false,                                 -- hide tooltip on unitframes
	["cursor"] = false,                                 -- tooltip via cursor only
}

C["merchant"] = {
	["sellgrays"] = true,                               -- automaticly sell grays?
	["autorepair"] = true,                              -- automaticly repair?
	["sellmisc"] = true,                                -- sell defined items automatically
}

C["error"] = {
	["enable"] = true,                                  -- true to enable this mod, false to disable
	filter = {                                          -- what messages to not hide
		[INVENTORY_FULL] = true,                        -- inventory is full will not be hidden by default
	},
}

C["invite"] = { 
	["autoaccept"] = true,                              -- auto-accept invite from guildmate and friends.
}
