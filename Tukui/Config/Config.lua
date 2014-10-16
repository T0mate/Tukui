local T, C, L = select(2, ...):unpack()

----------------------------------------------------------------
-- Default settings of Tukui
----------------------------------------------------------------

C["General"] = {
	["AutoScale"] = true,
	["UIScale"] = 0.71,
	["BackdropColor"] = {0.1, 0.1, 0.1},
	["BorderColor"] = {0.6, 0.6, 0.6},
	["HideShadows"] = false,
}

C["ActionBars"] = {
	["Enable"] = true,
	["HotKey"] = false,
	["Macro"] = false,
	["ShapeShift"] = true,
	["Pet"] = true,
	["SwitchBarOnStance"] = true,
	["NormalButtonSize"] = 27,
	["PetButtonSize"] = 25,
	["ButtonSpacing"] = 4,
	["OwnShadowDanceBar"] = false,
	["OwnMetamorphosisBar"] = true,
	["OwnWarriorStanceBar"] = false,
	["HideBackdrop"] = false,
	["Font"] = "FRIZQT",
}

C["Auras"] = {
	["Enable"] = true,
	["Consolidate"] = false,
	["Flash"] = false,
	["ClassicTimer"] = false,
	["HideBuffs"] = false,
	["HideDebuffs"] = false,
	["Animation"] = false,
	["BuffsPerRow"] = 12,
	["Font"] = "FRIZQT",
}

C["Bags"] = {
	["Enable"] = true,
	["ButtonSize"] = 28,
	["Spacing"] = 4,
	["ItemsPerRow"] = 11,
	["PulseNewItem"] = false,
	["Font"] = "FRIZQT",
	["BagFilter"] = true,
}

C["Chat"] = {
	["Enable"] = true,
	["WhisperSound"] = true,
	["LinkColor"] = {0.08, 1, 0.36},
	["LinkBrackets"] = true,
	["LootFrame"] = true,
	["Background"] = false,
	["ScrollByX"] = 3,
	["TabFont"] = "FRIZQT",
	["ChatFont"] = "FRIZQT",
}

C["Cooldowns"] = {
	["Font"] = "FRIZQT",
}

C["DataTexts"] = {
	["Battleground"] = false,
	["LocalTime"] = true,
	["Time24HrFormat"] = true,
	["NameColor"] = {1, 1, 1},
	["ValueColor"] = {1, 1, 1},
	["Font"] = "FRIZQT",
}

C["Merchant"] = {
	["AutoSellGrays"] = true,
	["SellMisc"] = true,
	["AutoRepair"] = true,
	["UseGuildRepair"] = true,
}

C["Misc"] = {
	["ThreatBarEnable"] = true,
	["AltPowerBarEnable"] = true,
	["ExperienceEnable"] = true,
	["ReputationEnable"] = true,
	["ErrorFilterEnable"] = true,
}

C["NamePlates"] = {
	["Enable"] = true,
	["Width"] = 120,
	["Height"] = 8,
	["CastHeight"] = 5,
	["Spacing"] = 4,
	["NonTargetAlpha"] = .5,
	["Texture"] = "Tukui",
	["Font"] = "FRIZQT",
}

C["Party"] = {
	["Enable"] = true,
	["Portrait"] = true,
	["HealBar"] = true,
	["ShowPlayer"] = true,
	["ShowHealthText"] = true,
	["Font"] = "FRIZQT",
	["HealthFont"] = "FRIZQT",
	["PowerTexture"] = "Tukui",
	["HealthTexture"] = "Tukui",
}

C["Raid"] = {
	["Enable"] = true,
	["HealBar"] = true,
	["AuraWatch"] = true,
	["AuraWatchTimers"] = true,
	["DebuffWatch"] = true,
	["RangeAlpha"] = 0.3,
	["ShowRessurection"] = true,
	["ShowHealthText"] = true,
	["ShowPets"] = false,
	["MaxUnitPerColumn"] = 10,
	["Font"] = "FRIZQT",
	["HealthFont"] = "FRIZQT",
	["PowerTexture"] = "Tukui",
	["HealthTexture"] = "Tukui",
	["GroupBy"] = {
		["Options"] = {
			["Group"] = "GROUP",
			["Class"] = "CLASS",
			["Role"] = "ROLE",
		},
		
		["Value"] = "GROUP",
	},
}

C["Tooltips"] = {
	["Enable"] = true,
	["HideOnUnitFrames"] = false,
	["UnitHealthText"] = true,
	["ShowSpec"] = true,
	["HealthFont"] = "FRIZQT",
	["HealthTexture"] = "FRIZQT",
}

C["UnitFrames"] = {
	["Enable"] = true,
	["Portrait"] = true,
	["CastBar"] = true,
	["UnlinkCastBar"] = false,
	["CastBarIcon"] = true,
	["CastBarLatency"] = true,
	["Smooth"] = true,
	["CombatLog"] = false,
	["WeakBar"] = true,
	["HealBar"] = true,
	["TotemBar"] = true,
	["AnticipationBar"] = true,
	["SerendipityBar"] = true,
	["OnlySelfDebuffs"] = false,
	["DarkTheme"] = false,
	["Arena"] = true,
	["Font"] = "FRIZQT",
	["PowerTexture"] = "Tukui",
	["HealthTexture"] = "Tukui",
}