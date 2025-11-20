local mod = get_mod("extended_weapon_customization_owo")
local ewc = get_mod("extended_weapon_customization")

-- ################################
-- Local References for Performance
-- ################################
local GibbingSettings = mod:original_require("scripts/settings/gibbing/gibbing_settings")
local LineEffects = mod:original_require("scripts/settings/effects/line_effects")

--[[
local table = table
local table_size = table.size
local script_unit = ScriptUnit
local script_unit_extension = script_unit.extension

local damage_type_setting = "damage_type"
local damage_type_active_setting = "damage_type_active"
]]
local gibbing_types = GibbingSettings.gibbing_types
local gibbing_power = GibbingSettings.gibbing_power

-- ################################
-- Custom Damage Types
-- ################################
mod.custom_damage_types = {
    ["owo_suppressed_autogun_bullet"] = {
        -- Sounds
        --  semiautomatic
        ranged_single_shot = "wwise/events/weapon/play_autogun_p3_m3_single",
        --  automatic
        --play_ranged_shooting = "wwise/events/weapon/play_autogun_p2_m3_auto",
        --stop_ranged_shooting = "wwise/events/weapon/stop_autogun_p2_m3_auto",
        stop_ranged_shooting = "wwise/events/weapon/play_autogun_p3_m3_single",
        play_ranged_shooting = "wwise/events/weapon/play_weapon_silence",
        ranged_pre_loop_shot = "wwise/events/weapon/play_autogun_p3_m3_single",
        -- Muzzle flash
        muzzle_flash = "content/fx/particles/weapons/rifles/shotgun/shotgun_trail_smoke",
        muzzle_flash_crit = "content/fx/particles/weapons/rifles/shotgun/shotgun_incendiary_trail_smoke",
        --muzzle_flash = "content/fx/particles/weapons/rifles/bolter/bolter_muzzle_secondary",
        --muzzle_flash_crit = "content/fx/particles/weapons/rifles/bolter/bolter_muzzle_secondary",
    },
}

--[[
ewc.damage_types["owo_pfalchion_metal_slash"] = {
    game_damage_type = "metal_crushing_light",
    gibbing_type = gibbing_types.crushing,
    gibbing_power = gibbing_power.medium,
    -- wait i dont think melee sounds are supported yet
}
]]
for damage_type_name, type_data in pairs(mod.custom_damage_types) do
    ewc.damage_types[damage_type_name] = type_data
end