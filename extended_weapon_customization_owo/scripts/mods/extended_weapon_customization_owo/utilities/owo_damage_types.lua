local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local GibbingSettings = mod:original_require("scripts/settings/gibbing/gibbing_settings")
local LineEffects = mod:original_require("scripts/settings/effects/line_effects")
local PlayerCharacterSoundEventAliases = mod:original_require("scripts/settings/sound/player_character_sound_event_aliases")

local table = table
local table_clone = table.clone
--[[
local table = table
local table_size = table.size
local script_unit = ScriptUnit
local script_unit_extension = script_unit.extension

local damage_type_setting = "damage_type"
local damage_type_active_setting = "damage_type_active"
]]
local dump_if_debug = mod.dump_if_debug
local gibbing_types = GibbingSettings.gibbing_types
local gibbing_power = GibbingSettings.gibbing_power

-- ################################################################
-- Helpers
-- ################################################################
-- ################################
-- Damage Templates
-- ################################
local default_templates = {
    -- Sawing is what the cutting weapons use
    metal_slashing_light = {
        game_damage_type = "metal_slashing_light",
        gibbing_type = gibbing_types.sawing,
        gibbing_power = gibbing_power.medium,
    }, 
    metal_slashing_medium = {
        game_damage_type = "metal_slashing_medium",
        gibbing_type = gibbing_types.sawing,
        gibbing_power = gibbing_power.heavy,
    },
    metal_slashing_heavy = {
        game_damage_type = "metal_slashing_heavy",
        gibbing_type = gibbing_types.sawing,
        gibbing_power = gibbing_power.infinite,
    },
    sawing = {
        game_damage_type = "sawing",
        gibbing_type = gibbing_types.sawing,
        gibbing_power = gibbing_power.always,
    },
} 

mod.slim_blade_families_and_damage_types = { 
    ["psword"] = {
        damage_type = "metal_slashing_medium",
        real_name = "powersword_p1_m1",
    }, 
    ["pfalchion"] = {
        damage_type = "metal_slashing_medium",
        real_name = "powersword_p2_m1",
    }, 
    ["mech_psword"] = {
        damage_type = "metal_slashing_medium",
        real_name = "powersword_p3_m1",
    }, 
    ["2h_psword"] = {
        damage_type = "metal_slashing_heavy",
        real_name = "powersword_2h_p1_m1",
    }, 
    ["2h_psword_short"] = {
        damage_type = "metal_slashing_heavy",
        real_name = "powersword_2h_p1_m1",
    }, 
    ["fsword"] = {
        damage_type = "metal_slashing_light",
        real_name = "forcesword_p1_m1",
    }, 
    ["2h_fsword"] = {
        damage_type = "metal_slashing_light",
        real_name = "forcesword_2h_p1_m1",
    }, 
    ["2h_fsword_short"] = {
        damage_type = "metal_slashing_light",
        real_name = "forcesword_2h_p1_m1",
    }, 
    ["dclaw"] = {
        damage_type = "metal_slashing_light",
        real_name = "combatsword_p1_m1",
    }, 
    ["hsword"] = {
        damage_type = "metal_slashing_light",
        real_name = "combatsword_p2_m1",
    },  
}
local slim_blade_families_and_damage_types = mod.slim_blade_families_and_damage_types

mod.chainsword_blade_families_and_damage_types = {
    ["chainsword"] = {
        damage_type = "sawing",
        real_name = "chainsword_p1_m1",
    },
    ["chainsword_2h"] = {
        damage_type = "sawing",
        real_name = "chainsword_2h_p1_m1",
    },
    ["chainaxe"] = {
        damage_type = "sawing",
        real_name = "chainaxe_p1_m1",
    },
}
local chainsword_blade_families_and_damage_types = mod.chainsword_blade_families_and_damage_types

-- ################################
-- Helper Functions
-- ################################
local function create_melee_damage_type_from_template_data(data)
    local damage_type_weapon_key = "owo_"..data.damage_type.."_"..data.real_name
    mod.custom_damage_types[damage_type_weapon_key] = table_clone(default_templates[data.damage_type])
    mod.custom_damage_types[damage_type_weapon_key].sfx_swing = PlayerCharacterSoundEventAliases.sfx_swing.events[data.real_name]
    mod.custom_damage_types[damage_type_weapon_key].sfx_swing_heavy = PlayerCharacterSoundEventAliases.sfx_swing_heavy.events[data.real_name]
    mod.custom_damage_types[damage_type_weapon_key].sfx_weapon_foley_01_right_hand = "wwise/events/weapon/play_weapon_silence" -- special swing
    mod.custom_damage_types[damage_type_weapon_key].sfx_weapon_foley_02_right_hand = "wwise/events/weapon/play_weapon_silence"
end
local function create_melee_damage_type_from_template_table(table_name)
    for _, data in pairs(table_name) do
        create_melee_damage_type_from_template_data(data)
    end
end

-- ################################################################
-- Custom Damage Types
-- ################################################################
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
        muzzle_flash_crit = "content/fx/particles/weapons/rifles/shotgun/shotgun_trail_smoke",
        --muzzle_flash_crit = "content/fx/particles/weapons/rifles/shotgun/shotgun_incendiary_trail_smoke", -- YOU SEE THE FIRE LOL
        --muzzle_flash = "content/fx/particles/weapons/rifles/bolter/bolter_muzzle_secondary",
        --muzzle_flash_crit = "content/fx/particles/weapons/rifles/bolter/bolter_muzzle_secondary",
    },
}
create_melee_damage_type_from_template_table(slim_blade_families_and_damage_types)
create_melee_damage_type_from_template_table(chainsword_blade_families_and_damage_types)

-- ################################
-- Adding Damage Types to EWC
-- To be called later, so load order doesn't matter
-- ################################
function mod.add_damage_types_to_ewc(ewc)
    local custom_damage_types = mod.custom_damage_types
    for damage_type_name, type_data in pairs(custom_damage_types) do
        ewc.damage_types[damage_type_name] = type_data
    end
    -- dump_if_debug(ewc.damage_types, "ALL DAMAGE TYPES FROM MAIN MOD TABLE AFTER INSERTING")
end