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
	["EquipBorder"] = true,
	["HotKey"] = false,
	["Macro"] = false,
	["ShapeShift"] = false,
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
	["ClassicTimer"] = true,
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
	["BagFilter"] = false,
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
	["AutoInviteEnable"] = false,
}

C["NamePlates"] = {
	["Enable"] = true,
	["HealthText"] = true,
	["Width"] = 120,
	["Height"] = 8,
	["CastHeight"] = 5,
	["Spacing"] = 4,
	["NonTargetAlpha"] = .5,
	["Texture"] = "Tukui",
	["Font"] = "FRIZQT",
	["NameTextColor"] = true,
}

C["Party"] = {
	["Enable"] = true,
	["Portrait"] = true,
	["HealBar"] = true,
	["ShowPlayer"] = true,
	["ShowHealthText"] = true,
	["RangeAlpha"] = 0.3,
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
	["VerticalHealth"] = false,
	["Highlight"] = true,
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
	["MouseOver"] = false,
	["HealthFont"] = "FRIZQT",
	["HealthTexture"] = "Tukui",
}

C["UnitFrames"] = {
	["Enable"] = true,
	["Portrait"] = true,
	["CastBar"] = true,
	["ComboBar"] = true,
	["UnlinkCastBar"] = false,
	["CastBarIcon"] = true,
	["CastBarLatency"] = true,
	["Smooth"] = true,
	["TargetEnemyHostileColor"] = true,
	["CombatLog"] = false,
	["WeakBar"] = true,
	["HealBar"] = true,
	["TotemBar"] = true,
	["AnticipationBar"] = true,
	["TargetAuras"] = true,
	["FocusAuras"] = true,
	["FocusTargetAuras"] = true,
	["ArenaAuras"] = true,
	["BossAuras"] = true,
	["SerendipityBar"] = true,
	["OnlySelfBuffs"] = false,
	["OnlySelfDebuffs"] = false,
	["Threat"] = true,
	["BossAltPowerText"] = true,
	["AltPowerText"] = true,
	["DarkTheme"] = false,
	["Arena"] = true,
	["Boss"] = true,
	["Font"] = "FRIZQT",
	["PowerTexture"] = "Tukui",
	["HealthTexture"] = "Tukui",
	["CastTexture"] = "Tukui",
}