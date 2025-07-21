local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "laspistol_p1_m1" -- Laspistols
local _hide_slot_table = mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/common/hide_slot")

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
--[[
-- ###############
-- MT Plugin Compatibility
-- ###############
local table_of_mt_slots = {
    
}
for _, slot_name in ipairs(table_of_mt_slots) do
    mod.create_default_attachment(this_variant, slot_name)
end

-- ###############
-- Syn's Edits Compatibility
-- ###############
local table_of_syn_slots = {
    
}
if not mod.syn then -- these slots already exist in Syn's plugin
    mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_syn_slots)
else
    for _, slot_name in ipairs(table_of_syn_slots) do
        mod.create_default_attachment(this_variant, slot_name)
    end
end
]]
-- ###############
-- OwO Slot Initialization
-- ###############
local table_of_owo_slots = {
    "muzzle_2", -- MT and Syn didn't add this to laspistol yet
    "muzzle_3",

    "receiverac1",
    "receiverac2",
    "receiverac3",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_grip_laser(this_variant, "flashlight")
mod.owo_magazine_flat(this_variant)

mod.owo_invisible_muzzle(this_variant)
mod.owo_suppressor(this_variant, "muzzle")

mod.owo_chunky_laspistol_grip_mag(this_variant)
mod.owo_laspistol_grip_mag(this_variant)

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_sight_2s = "owo_alt_viewmodel_01|owo_alt_viewmodel_02|owo_alt_viewmodel_03|owo_alt_viewmodel_04|owo_alt_viewmodel_05|owo_alt_viewmodel_06|owo_reticle_helper_invisible"
local _owo_no_magnifier_eotech_sights = "owo_holosight_01_01|owo_holosight_01_01ss"
local _owo_magnifier_aligned_eotech_sights = "owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_02ss_z1|owo_holosight_01_02ss_z2"
local _owo_magnifier_side_eotech_sights = "owo_holosight_01_03|owo_holosight_01_03ss"
local _owo_magnifier_eotech_sights = _owo_magnifier_aligned_eotech_sights.."|".._owo_magnifier_side_eotech_sights
local _owo_short_eotech_sights = "owo_holosight_01_01ss|owo_holosight_01_02ss_z1|owo_holosight_01_02ss_z2|owo_holosight_01_03ss"
local _owo_all_eotech_sights = _owo_no_magnifier_eotech_sights.."|".._owo_magnifier_eotech_sights
local _owo_no_magnifier_vortex_sights = "owo_holosight_02_01|owo_holosight_02_01ss"
local _owo_magnifier_aligned_vortex_sights = "owo_holosight_02_02_z1|owo_holosight_02_02_z2|owo_holosight_02_02ss_z1|owo_holosight_02_02ss_z2"
local _owo_magnifier_side_vortex_sights = "owo_holosight_02_03|owo_holosight_02_03ss"
local _owo_magnifier_vortex_sights = _owo_magnifier_aligned_vortex_sights.."|".._owo_magnifier_side_vortex_sights
local _owo_all_vortex_sights = _owo_no_magnifier_vortex_sights.."|".._owo_magnifier_vortex_sights
local _owo_forwards_acog_sights = "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_backwards_acog_sights = "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top"
local _owo_rmr_acog_sights = "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_all_acog_sights = _owo_forwards_acog_sights.."|".._owo_backwards_acog_sights
local _owo_all_susat_sights = "owo_susat_01|owo_susat_01_z1|owo_susat_01_ps|owo_susat_02|owo_susat_02_z1|owo_susat_02_top"
local _owo_masterkey_bayonets = "owo_underbarrel_shotgun_01|owo_underbarrel_shotgun_01_01|owo_underbarrel_shotgun_01_02"
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"
local _owo_slim_slide_receiverac1s = "owo_slim_laspistol_grip_mag_01|owo_slim_laspistol_grip_mag_02|owo_slim_laspistol_grip_mag_03|owo_slim_laspistol_grip_mag_04|owo_slim_laspistol_grip_mag_05|owo_slim_laspistol_grip_mag_06|owo_slim_laspistol_grip_mag_07|owo_slim_laspistol_grip_mag_08|owo_slim_laspistol_grip_mag_ml01"

local _mt_recon_lasgun_barrels = "rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05"
local _mt_laspistol_barrels = "lpistol_barrel_01|lpistol_barrel_02|lpistol_barrel_03|lpistol_barrel_04|lpistol_barrel_05|lpistol_barrel_06|lpistol_barrel_07"
local _short_infantry_autogun_mt_barrels = "iagun_barrel_04"
local _medium_infantry_autogun_mt_barrels = "iagun_barrel_01|iagun_barrel_02|iagun_barrel_06"
local _long_infantry_autogun_mt_barrels = "iagun_barrel_03|iagun_barrel_05"
local _all_infantry_autogun_mt_barrels = _long_infantry_autogun_mt_barrels.."|".._medium_infantry_autogun_mt_barrels.."|".._short_infantry_autogun_mt_barrels
local _super_short_braced_autogun_mt_barrels = "bagun_barrel_02"
local _short_braced_autogun_mt_barrels = "bagun_barrel_01|bagun_barrel_05|bagun_barrel_06|bagun_barrel_07|bagun_barrel_08"
local _long_braced_autogun_mt_barrels = "bagun_barrel_03|bagun_barrel_04"
local _all_braced_autogun_mt_barrels = _super_short_braced_autogun_mt_barrels.."|".._short_braced_autogun_mt_barrels.."|".._long_braced_autogun_mt_barrels
local _short_vigilant_autogun_mt_barrels = "hagun_barrel_02"
local _long_vigilant_autogun_mt_barrels = "hagun_barrel_01|hagun_barrel_03|hagun_barrel_04"
local _all_vigilant_autogun_mt_barrels = _short_vigilant_autogun_mt_barrels.."|".._long_vigilant_autogun_mt_barrels
local _mt_autopistol_barrels = "apistol_barrel_01|apistol_barrel_02|apistol_barrel_03|apistol_barrel_04|apistol_barrel_05"
local _mt_twin_stubber_barrels = "stubber_barrel_01|stubber_barrel_02|stubber_barrel_03|stubber_barrel_04|stubber_barrel_05"
local _mt_single_stubber_barrels = "singlestubber_barrel_01|singlestubber_barrel_02|singlestubber_barrel_03"
local _mt_combat_shotgun_barrels = "shot_barrel_01|shot_barrel_02|shot_barrel_03|shot_barrel_04|shot_barrel_07|shot_barrel_08|shot_barrel_09"
local _mt_db_shotgun_barrels = "dbshot_barrel_01|dbshot_barrel_02|dbshot_barrel_03"
local _mt_plasma_barrels = "plas_barrel_01|plas_barrel_02|plas_barrel_03"
local _mt_flamer_barrels = "flamer_barrel_01|flamer_barrel_02|flamer_barrel_03|flamer_barrel_04|flamer_barrel_05|flamer_barrel_06"
local _mt_bolter_barrels = "bolter_barrel_01|bolter_barrel_02|bolter_barrel_03|bolter_barrel_04"
local _mt_backwards_bolter_barrels = "fbolter_barrel_01|fbolter_barrel_02|fbolter_barrel_03|fbolter_barrel_04"
local _mt_ripper_barrels = "ripper_barrel_01|ripper_barrel_02|ripper_barrel_03|ripper_barrel_04|ripper_barrel_05|ripper_barrel_06"

local _syn_helbore_sniper_barrels = "helbore_sniper_barrel_01|helbore_sniper_barrel_02|helbore_sniper_barrel_03|helbore_sniper_barrel_04|helbore_sniper_barrel_05|helbore_sniper_barrel_05b"
local _syn_carry_sniper_barrels = "cleaver_sniper_barrel_01|cleaver_sniper_barrel_02|cleaver_sniper_barrel_04|cleaver_sniper_barrel_05|cleaver_sniper_barrel_06"
local _syn_all_sniper_barrels = _syn_helbore_sniper_barrels.."|".._syn_carry_sniper_barrels
local _syn_hellgun_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03|syn_hellgun_barrel_01|syn_hellgun_barrel_02"
local _syn_heavy_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03"
local _syn_carbine_barrels = "syn_carbine_barrel_01|syn_carbine_barrel_02|syn_carbine_barrel_03|syn_carbine_barrel_04|syn_carbine_barrel_05"
local _syn_aquilon_barrels = "syn_aquilonbarrel_01|syn_aquilonbarrel_01a|syn_aquilonbarrel_02|syn_aquilonbarrel_02a"
local _syn_canis_barrels = "syn_vescanis_barrel_01|syn_vescanis_barrel_02"
local _syn_gauss_barrels = "syn_gk8gauss_barrel_01|syn_gk8gauss_barrel_02"
-- ########
-- For This Variant Only
-- ########

-- ############################################
-- Inject Fixes
-- ############################################
-- #################
-- HIDING HELPERS
-- By putting it up here, it ends up at the bottom of the list, so they will only be hidden if the fixes from above are not found
-- Because they match the main parts first, if there is no match it means the main part is not attached
-- #################
for _, slots_table in ipairs({table_of_mt_slots, table_of_syn_slots, table_of_owo_slots}) do
    for _, slot_name in pairs(slots_table) do
        mod.mt.inject_fixes(this_variant, {
            mod.hide_slot(slot_name, { mod.hide_slot_fixes[slot_name] }),
        })
    end
end

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################
mod.fixes_owo_suppressors(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
	-- Magazine: FLAT MAG
	-- ######
    {   dependencies =  { "owo_lasgun_magazine_flat_01" },
        magazine =      { offset = true, scale = vector3_box(1, 1, 0.5)},
    },
    {   dependencies =  { "owo_autogun_magazine_flat_03" },
        magazine =      { offset = true, rotation = vector3_box(14, 0, 0), scale = vector3_box(1, 1, 0.45), hide_mesh = {{"magazine", 1,2,3,4,5,6,7,8,9,10}}, },
    },

    -- ######
    -- Receiver: CHUNKY Grip Mag
    -- ######
    -- Flashlights
    --      Trigger flashlights
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
            "owo_grip_laser_01|owo_grip_laser_02"
        },
        flashlight = { offset = true,  position = vector3_box(-0.024, 0.072, -0.057), scale = vector3_box(0.75, 0.425, 0.588)},
    },
    -- Body
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03"},
        receiver = { offset = true, position = vector3_box(0, 0, 0.050), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        -- None of my transformations are working im gonna kill someone
        -- and receiverac1 is stealing mag anims lmaoooo
        -- SETTING OFFSET TO FALSE FIXED IT. lets this take over from default? it would stretch this time but wouldn't move (unlike shotgun which didn't stretch either)
        receiverac3 = { offset = false, position = vector3_box(0, 0.136, 0.022), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.3, 2.33, 0.38)},
        -- trigger already aligned. reuse as hammer? on a las weapon lmao
        -- receiverac2 = { offset = true, position = vector3_box(0, -0.04, -0.07), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.2, 0.2, 0.033)},
        receiverac2 = {position = vector3_box(0, 0, 0.04), hide_mesh = { 	{"receiverac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
        magazine = { offset = true, position = vector3_box(0, -0.115, -0.031), rotation = vector3_box(-30, 0, 0), scale = vector3_box(0.85, 0.5, 1)},
        grip = { offset = true,position = vector3_box(0, 0.0, -0.050), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.7, 1, 1)},
        flashlight = { offset = true,  position = vector3_box(-0.064, -0.112, -0.119), scale = vector3_box(1, 1, 1)},
    },
    -- Sights
    --      MT Irons
    --      offsets are already set, so these just get overwritten unless this goes before them in the load order
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
            "lasgun_sight_01",
        },
        --no_scope_offset = { offset = true, position = vector3_box(-0.058, -0.5, -0.063), rotation = vector3_box(0, 29, 0)},
        no_scope_offset = { offset = true, position = vector3_box(-0.055, -0.5, -0.063), rotation = vector3_box(0, 29, 0)},
    },
    --      Syn's aquilon scope alignment
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
            "aquilon_scope_01|aquilon_scope_01a|aquilon_scope_02|aquilon_scope_02a"
        },
        scope_offset = { offset = true, position = vector3_box(-0.035, -0.5, -0.053), rotation = vector3_box(0, 29, 0), aim_scale = -0.13, lense_transparency = true },
    },
    --      other sights
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
        },
        -- rotated to be straight in first person
        no_scope_offset = { offset = false, position = vector3_box(-0.035, -0.5, -0.10), rotation = vector3_box(0, 29, 0)},
        scope_offset = { offset = false, position = vector3_box(-0.035, -0.5, -0.10), rotation = vector3_box(0, 29, 0), aim_scale = -0.13, lense_transparency = true },
    },

    -- ######
    -- Receiver AC1: Slim Grip Mag
    -- ######
    -- RAW DAWG
    {   dependencies =  { "owo_slim_laspistol_grip_mag_00" },
        receiver =      { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.666)},
        receiverac2 =   { offset = false, parent = "receiver", position = vector3_box(0, 0, 0.04), },
        receiverac3 =   { offset = false, parent = "receiver", position = vector3_box(0, 0.136, 0.022), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.3, 2.33, 0.38)},
        magazine =      { offset = false, position = vector3_box(0, -0.088, -0.066), rotation = vector3_box(-20, 0, 0), scale = vector3_box(0.5, 0.5, 1)},
        grip =          { offset = false ,position = vector3_box(0, 0.042, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.7, 1, 1)},
        stock =         { offset = true, position = vector3_box(0, 0, -0.04), },
    },
    -- SLIM SHROUDS
    --  Magazine
    --      MT Autogun mags
    {   dependencies =  { "owo_receiverac1_group_indicator_slim_lasslide", "agun_magazine_01|agun_magazine_02|agun_magazine_03|bgun_magazine_01", _owo_slim_slide_receiverac1s },
        magazine =      { offset = true, position = vector3_box(0, -0.115, 0.0), rotation = vector3_box(-30, 0, 0), scale = vector3_box(0.47, 0.5, 0.7)},
    },
    --  Default
    {   dependencies =  { "owo_receiverac1_group_indicator_slim_lasslide", _owo_slim_slide_receiverac1s },
        receiverac1 =   { offset = true, position = vector3_box(0, 0, 0.044), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.666)},
        receiverac2 =   { offset = true, position = vector3_box(0.0, 0.082, 0.028), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 0.894, 0.574), },
        receiverac3 =   { offset = true, position = vector3_box(0.0, 0.0, -0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.46, 1, 1)},
        -- Other parts moving up
        barrel =        { offset = true, position = vector3_box(0, 0, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6)},
        magazine =      { offset = true, position = vector3_box(0, -0.115, 0.0), rotation = vector3_box(-30, 0, 0), scale = vector3_box(0.47, 0.5, 1)},
        -- widen to fit mag inside
        grip =          { offset = true,position = vector3_box(0, 0.0, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.7, 1, 1)},
        -- flashlight = { offset = true,  position = vector3_box(-0.064, -0.112, -0.119), scale = vector3_box(1, 1, 1)},
    },
    --[[
    --  MT Irons
    -- offsets are already set, so these just get overwritten unless this goes before them in the load order
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
            "lasgun_sight_01",
        },
        --no_scope_offset = { offset = true, position = vector3_box(-0.058, -0.5, -0.063), rotation = vector3_box(0, 29, 0)},
        no_scope_offset = { offset = true, position = vector3_box(-0.055, -0.5, -0.063), rotation = vector3_box(0, 29, 0)},
    },
    -- Syn's aquilon scope alignment
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
            "aquilon_scope_01|aquilon_scope_01a|aquilon_scope_02|aquilon_scope_02a"
        },
        scope_offset = { offset = true, position = vector3_box(-0.035, -0.5, -0.053), rotation = vector3_box(0, 29, 0), aim_scale = -0.13, lense_transparency = true },
    },
    -- other sights
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
        },
        -- rotated to be straight in first person
        no_scope_offset = { offset = false, position = vector3_box(-0.035, -0.5, -0.10), rotation = vector3_box(0, 29, 0)},
        scope_offset = { offset = false, position = vector3_box(-0.035, -0.5, -0.10), rotation = vector3_box(0, 29, 0), aim_scale = -0.13, lense_transparency = true },
    },
    ]]
    
    -- ######
	-- Flashlight: LASER GRIP
	-- ######
    {   dependencies = {"owo_grip_laser_01|owo_grip_laser_02"},
        flashlight = { offset = true,  position = vector3_box(-0.064, -0.112, -0.119), scale = vector3_box(0.75, 0.425, 0.588)},
    },
})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)