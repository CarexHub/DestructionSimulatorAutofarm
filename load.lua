getfenv().config = {
    ["AutoSell"] = true,
    ["Area"] = "Area1",
    ["FixLag"] = true,
    ["StealthMode"] = true,
    ["AutoAreaDetect"] = true,
    ["AutoFarm"] = true,
    ["RankAreaAllowed"] = true,
    ["UnlockAllWeapons"] = true,
    ["GetAllBoosts"] = true,
    ["BoostDuration"] = 1000000,
    ["BoostMultiplier"] = 1000000,
    ["AutoRankUp"] = true,
    ["GetMagicCarpet"] = true,
    ["GetVip"] = true,
    ["StopOnMaxLevel"] = true,
    ["StopOnMaxRank"] = true,
    ["AutoFarmInterval"] = 0.1
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/CarexHub/DestructionSimulatorAutofarm/refs/heads/main/DestructionSimulator.lua"))()
