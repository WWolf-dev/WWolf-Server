Config                      = {}
Config.Locale               = GetConvar('esx:locale', 'en')

Config.Accounts             = {
	bank = {
		label = TranslateCap('account_bank'),
		round = true
	},
	black_money = {
		label = TranslateCap('account_black_money'),
		round = true
	},
	money = {
		label = TranslateCap('account_money'),
		round = true
	}
}

Config.StartingAccountMoney = { bank = 999999, money = 999999, black_money = 999999 }

Config.DefaultSpawns = { -- If you want to have more spawn positions and select them randomly uncomment commented code or add more locations
	{ x = 222.2027, y = -864.0162, z = 30.2922, heading = 1.0 }
}

Config.AdminGroups = {
	['owner'] = true,
	['admin'] = true
}


Config.EnablePaycheck            = true      -- enable paycheck
Config.LogPaycheck               = true     -- Logs paychecks to a nominated Discord channel via webhook (default is false)
Config.EnableSocietyPayouts      = true     -- pay from the society account that the player is employed at? Requirement: esx_society
Config.MaxWeight                 = 24        -- the max inventory weight without backpack
Config.PaycheckInterval          = 48 * 60000 -- how often to recieve pay checks in milliseconds
Config.EnableDebug               = false     -- Use Debug options?

Config.Multichar                 = false
Config.DistanceGive              = 4.0   -- Max distance when giving items, weapons etc.

Config.AdminLogging              = true -- Logs the usage of certain commands by those with group.admin ace permissions (default is false)

Config.DisableScenarios          = true -- Disable Scenarios
Config.DisableAimAssist          = false -- disables AIM assist (mainly on controllers)
Config.DisableVehicleSeatShuff   = false -- Disables vehicle seat shuff