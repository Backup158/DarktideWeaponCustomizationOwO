local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "bolter_p1_m1" -- Spearhead Boltgun
local _hide_slot_table = mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/common/hide_slot")

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
-- ###############
-- MT Plugin Compatibility
-- ###############
local table_of_mt_slots = {
    "sightac2",
    "sightac3",
    "sightac4",
    --"sight_2",
    --"carryhandle",
    "gripac",
    "stockac",
    --"stockac2",
    --"sightac",
    --"accessory",
}
for _, slot_name in ipairs(table_of_mt_slots) do
    mod.create_default_attachment(this_variant, slot_name)
end

-- ###############
-- Syn's Edits Compatibility
-- ###############
local table_of_syn_slots = {
    "muzzle_2",
}
if not mod.syn then -- these slots already exist in Syn's plugin
    mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_syn_slots)
else
    for _, slot_name in ipairs(table_of_syn_slots) do
        mod.create_default_attachment(this_variant, slot_name)
    end
end

-- ###############
-- OwO Slot Initialization
-- ###############
local table_of_owo_slots = {
    "receiverac1",
    "receiverac2",

    "sightac1",
    "sightac5",
    "sightac6",
    "sightac7",
    "sight_secondary",
    "sight_secondary_ac1",
    "sight_secondary_ac2",
    
    "bayonetac1",
    "bayonetac2",
    "bayonetac3",
    "bayonetac4",
    "bayonetac5",
    "bayonetac6",
    "bayonetac7",
    "bayonetac8",

    "muzzle_3",
    "muzzle_4",
    "muzzle_5",
    "muzzle_6",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_california_bolter(this_variant, "receiverac1")

if not mod.syn then mod.owo_invisible_muzzle(this_variant) end
mod.owo_suppressor(this_variant, "muzzle")
mod.owo_muzzle_brake(this_variant)

mod.owo_underbarrel_gl(this_variant, "bayonet")
mod.owo_underbarrel_shotgun(this_variant, "bayonet")

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)

mod.owo_holosight(this_variant, "sight", "rail")
mod.owo_prismatic_sight(this_variant, "sight", "receiver")

mod.owo_tactical_stock(this_variant, "stock")

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
local _owo_masterkey_bayonets = "owo_underbarrel_shotgun_masterkey|owo_underbarrel_shotgun_masterkey_01|owo_underbarrel_shotgun_masterkey_02"
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"
local _owo_california_bolter_receiverac1s = "owo_california_bolter_shroud_01|owo_california_bolter_shroud_02|owo_california_bolter_shroud_03|owo_california_bolter_shroud_04|owo_california_bolter_shroud_05|owo_california_bolter_shroud_06|owo_california_bolter_shroud_07|owo_california_bolter_shroud_08|owo_california_bolter_shroud_ml01"

local _short_infantry_lasgun_mt_barrels = "ilasgun_barrel_03"
local _long_infantry_lasgun_mt_barrels = "ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08"
local _mt_all_infantry_lasgun_barrels = _short_infantry_lasgun_mt_barrels.."|".._long_infantry_lasgun_mt_barrels
local _medium_short_helbore_mt_barrels = "hlasgun_barrel_01|hlasgun_barrel_04|hlasgun_barrel_05|hlasgun_barrel_05b" -- Medium length, short bottom
local _medium_medium_helbore_mt_barrels = "hlasgun_barrel_03"
local _long_helbore_mt_barrels = "hlasgun_barrel_02"
local _all_helbore_mt_barrels = _medium_short_helbore_mt_barrels.."|".._medium_medium_helbore_mt_barrels.."|".._long_helbore_mt_barrels
local _mt_recon_lasgun_barrels = "rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05"
local _mt_laspistol_barrels = "lpistol_barrel_01|lpistol_barrel_02|lpistol_barrel_03|lpistol_barrel_04|lpistol_barrel_05|lpistol_barrel_06|lpistol_barrel_07"
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
local _mt_plasma_grips = "plas_pisgrip_01|plas_pisgrip_02|plas_pisgrip_03"
local _mt_helbore_grips = "hlasgun_grip_01|hlasgun_grip_02|hlasgun_grip_03"

local _syn_m41a_barrels = "syn_m41a_barrel_01|syn_m41a_barrel_02|syn_m41a_barrel_03|syn_m41a_barrel_04|syn_m41a_barrel_05|syn_m41a_barrel_06|syn_m41a_barrel_07|syn_m41a_barrel_08"
local _syn_helbore_sniper_barrels = "helbore_sniper_barrel_01|helbore_sniper_barrel_02|helbore_sniper_barrel_03|helbore_sniper_barrel_04|helbore_sniper_barrel_05|helbore_sniper_barrel_05b"
local _syn_carry_sniper_barrels = "cleaver_sniper_barrel_01|cleaver_sniper_barrel_02|cleaver_sniper_barrel_04|cleaver_sniper_barrel_05|cleaver_sniper_barrel_06"
local _syn_all_sniper_barrels = _syn_helbore_sniper_barrels.."|".._syn_carry_sniper_barrels
local _syn_pulse_barrels = "SWSMPR_barrel_01|SWSMPR_barrel_02|SWSMPR_barrel_03|SWSMPR_barrel_06|SWSMPR_barrel_07|SWSMPR_barrel_08|SWSMPR_barrel_09|SWSMPR_barrel_10|SWSMPR_barrel_11|SWSMPR_barrel_12|SWSMPR_barrel_13"
local _syn_hellgun_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03|syn_hellgun_barrel_01|syn_hellgun_barrel_02"
local _syn_carbine_barrels = "syn_carbine_barrel_01|syn_carbine_barrel_02|syn_carbine_barrel_03|syn_carbine_barrel_04|syn_carbine_barrel_05"
local _syn_aquilon_barrels = "syn_aquilonbarrel_01|syn_aquilonbarrel_01a|syn_aquilonbarrel_02|syn_aquilonbarrel_02a"
local _syn_heavy_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03"
local _syn_thompson_barrels = "syn_thompson_barrel_01|syn_thompson_barrel_02"
local _syn_rotary_barrels = "rotary_barrel_01|rotary_barrel_01a|rotary_barrel_01b|rotary_barrel_01c"
local _syn_q3_barrels = "q3_machinegun_barrel_01|q3_machinegun_barrel_01a"
local _syn_canis_barrels = "syn_vescanis_barrel_01|syn_vescanis_barrel_02"
local _syn_gauss_barrels = "syn_gk8gauss_barrel_01|syn_gk8gauss_barrel_02"

-- ########
-- For This Variant Only
-- ########
local _bolter_barrels = "bolter_barrel_01|bolter_barrel_02|bolter_barrel_03|bolter_barrel_04"

local _syn_xl_iag_barrels = 'xl_iagun_barrel_01|xl_iagun_barrel_02|xl_iagun_barrel_03|xl_iagun_barrel_04|xl_iagun_barrel_05|xl_iagun_barrel_06|xl_iagun_barrel_07'
local _syn_xl_brauto_barrels = "xl_bagun_barrel_01|xl_bagun_barrel_02|xl_bagun_barrel_03|xl_bagun_barrel_04|xl_bagun_barrel_05|xl_bagun_barrel_06|xl_bagun_barrel_07|xl_bagun_barrel_08|xl_bagun_barrel_09"
local _syn_xl_hha_barrels = "xl_hagun_barrel_01|xl_hagun_barrel_02|xl_hagun_barrel_03|xl_hagun_barrel_04|xl_hagun_barrel_05"
local _syn_all_xl_barrels = _syn_xl_iag_barrels.."|".._syn_xl_brauto_barrels.."|".._syn_xl_hha_barrels

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
mod.fixes_owo_muzzle_brake(this_variant)

mod.fixes_owo_holosight(this_variant)
mod.fixes_owo_prismatic_sight(this_variant)

mod.fixes_owo_underbarrel_gl(this_variant)
mod.fixes_owo_underbarrel_shotgun(this_variant)

mod.fixes_owo_tactical_stock(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Receiver: California Bolter receiver
    -- ######
    -- Grips
    --      MT Plasma grips
    --      this one sits higher than other grips for whatever the fuck reason
    {   dependencies =  { "owo_california_bolter_shroud_00", _mt_plasma_grips },
        grip =          { offset = true,  position = vector3_box(0, 0.006, -0.032), scale = vector3_box(1, 1, 1.564)},
    },
    --      Repositioning for MT Cadia Compliant Stock
    --      makes it sit higher than usual so the top of the trigger guard is flush with the receiver
    {   dependencies =  { "owo_california_bolter_shroud_00", _mt_helbore_grips },
        grip =          { offset = true,  position = vector3_box(0, 0, 0.013), scale = vector3_box(1, 1, 1.564)},
    },
    {   dependencies =  { "owo_receiver_group_indicator_california_bolter", _owo_california_bolter_receiverac1s, _mt_helbore_grips },
        grip =          { offset = true,  position = vector3_box(0, 0.032, 0.064), scale = vector3_box(1, 1, 1)},
    },
    -- Barrels
    --  Default Barrel
    {   dependencies =  { "owo_receiver_group_indicator_california_bolter", _owo_california_bolter_receiverac1s, _bolter_barrels },
        barrel =        { offset = true,  position = vector3_box(0, 0.0, 0.018), scale = vector3_box(0.7, 1, 0.7)},
    },
    --  Defaults
    {   dependencies =  { "owo_california_bolter_shroud_00", },
        receiver =      { offset = true,  position = vector3_box(0, 0, 0.054), scale = vector3_box(1, 1, 0.64)}, 
        -- In compliance with California Penal Code § 32310 PC: Reducing magazine capacity
        magazine =      { offset = true,  position = vector3_box(0, 0, 0.055), scale = vector3_box(1, 1, 0.58)},
        --sight =         { offset = true,  position = vector3_box(0, 0.0, 0.0), scale = vector3_box(1, 1, 1.564)}, -- fuck this shit
        grip =          { offset = true,  position = vector3_box(0, 0, 0.03), scale = vector3_box(1, 1, 1.564)},
    },
    {   dependencies =  { "owo_receiver_group_indicator_california_bolter", _owo_california_bolter_receiverac1s },
        receiver =      { offset = true,  position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}, 
        receiverac1 =   { offset = true,  position = vector3_box(0, 0, 0.054), scale = vector3_box(1, 1, 0.64)},   
        -- In compliance with California Penal Code § 32310 PC: Reducing magazine capacity
        magazine =      { offset = true,  position = vector3_box(0, 0, 0.055), scale = vector3_box(1, 1, 0.58)},
        grip =          { offset = true,  position = vector3_box(0, 0, 0.03), scale = vector3_box(1, 1, 1)},
        underbarrel =   { offset = true,  position = vector3_box(0, 0, 0.054), scale = vector3_box(1, 1, 0.64)},
    },

    -- ######
	-- Bayonet: UNDERBARREL GRENADE LAUNCHER
	-- ######
    --  --------------------------------------------
    --  M203
    --  --------------------------------------------
    --      Default
    {	dependencies =  { "owo_m203" },
        bayonet =       { offset = true, position = vector3_box(0, 0.366, -0.066), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    --  --------------------------------------------
    --  GP-25
    --  --------------------------------------------
    --      Default
    {	dependencies =  { "owo_gp25" },
        bayonet =       { offset = true, position = vector3_box(0, 0.474, -0.066), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },


    -- ######
	-- Bayonet: UNDERBARREL SHOTGUN
	-- ######
    --  --------------------------------------------
    --  Masterkey
    --  --------------------------------------------
    {	dependencies =  { "owo_underbarrel_shotgun_masterkey|owo_underbarrel_shotgun_masterkey_01|owo_underbarrel_shotgun_masterkey_02"},
        bayonet =       { offset = true, position = vector3_box(0, 0.0, -0.015), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    --  --------------------------------------------
    --  M26-MASS
    --  --------------------------------------------
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass" },
        -- Receiver
        bayonet =       { offset = true, position = vector3_box(0, 0.25, -0.11), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },

    -- ######
	-- Muzzle: Muzzle Brake
	-- ######
    -- MT The long boys
    --  Long Helbores and Longlas
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _long_helbore_mt_barrels.."|longlasgun_barrel_01" },
        muzzle_6 =      { offset = true, position = vector3_box(0, 0.13, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- MT Lasgun Barrels (ALL)
    --  What a fucking mess
    --  Infantry, Helbore, Recon, Laspistol
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _mt_all_infantry_lasgun_barrels.."|".._all_helbore_mt_barrels.."|".._mt_recon_lasgun_barrels.."|".._mt_laspistol_barrels },
        muzzle_6 =      { offset = true, position = vector3_box(0, 0.06, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- MT Autopistol
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _mt_autopistol_barrels },
        muzzle_6 =      { offset = true, position = vector3_box(0, -0.02, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", },
        muzzle_6 =      { offset = true, position = vector3_box(0, 0.0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- Rest are in universal fixes

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  --------------------------------------------
    --  EOTech
    --  --------------------------------------------
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_no_magnifier_eotech_sights, },
        rail =              { offset = true, position = vector3_box(0, 0.062, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
        sight =             { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, -0.030), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_aligned_eotech_sights, },
        rail =              { offset = true, position = vector3_box(0, 0.062, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
        sight =             { offset = true, position = vector3_box(0, 0.13, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.029), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_side_eotech_sights, },
        rail =              { offset = true, position = vector3_box(0, 0.062, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
        sight =             { offset = true, position = vector3_box(0, 0.13, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, -0.029), rotation = vector3_box(0, 0, 0), },
    },
    --  --------------------------------------------
    --  Vortex Razor
    --  --------------------------------------------
    --  Patch for alt sights
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_sight_2s, },
        sight_2 =           { offset = true, parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_no_magnifier_vortex_sights },
        rail =              { offset = true, position = vector3_box(0, 0.062, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
        sight =             { offset = true, position = vector3_box(0, 0.05, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.028), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  Magnifier moves sight forwards
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_magnifier_aligned_vortex_sights },
        rail =              { offset = true, position = vector3_box(0, 0.062, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
        sight =             { offset = true, position = vector3_box(0, 0.11, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.030), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_magnifier_side_vortex_sights },
        rail =              { offset = true, position = vector3_box(0, 0.062, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
        sight =             { offset = true, position = vector3_box(0, 0.11, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.028), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

	-- ######
    -- Sight: Prismatic Sights (Telescopic)
    -- ######
    --  --------------------------------------------
    --  Trijicon ACOG
    --  --------------------------------------------
    --  Patch to hide alt viewmodel sights
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_sight_2s, },
        sight_2 =           { offset = false, parent = "sight", position = vector3_box(0, -0.04, 0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --      Aiming with RMR on ACOG
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.114), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.114), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_forwards_acog_sights },
        sight =             { offset = true, position = vector3_box(0, 0.108, 0.18), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        rail =              { offset = true, position = vector3_box(0, 0.036, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 0.8), },
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.041), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_backwards_acog_sights },
        sight =             { offset = true, position = vector3_box(0, 0.046, 0.18), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        rail =              { offset = true, position = vector3_box(0, 0.036, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 0.8), },
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.041), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  --------------------------------------------
    --  SUSAT
    --  --------------------------------------------
    --      Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.3, -0.094), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.3, -0.094), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_susat", 
            _owo_all_susat_sights, },
        sight =             { offset = true, position = vector3_box(0, 0.006, 0.204), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        rail =              { offset = true, position = vector3_box(0, 0.036, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 0.8), },
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.03), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

    -- ######
	-- Stock: TACTICAL STOCK
	-- ######
    --  Folded
    {   dependencies =  { "owo_stock_group_indicator_ac2_tactical_stock_folded", "owo_tactical_stock_01|owo_tactical_stock_02|owo_tactical_stock_03|owo_tactical_stock_04|owo_tactical_stock_05|owo_tactical_stock_06|owo_tactical_stock_07|owo_tactical_stock_08" },
        stock =         { position = vector3_box(0.08, -0.092, 0.078), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(-0.0037, -0.064, 0.079), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.62, 0.3 )}
    },
    --  Folded (Left)
    {   dependencies =  { "owo_stock_group_indicator_ac2_tactical_stock_folded_left", "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
        stock =         { position = vector3_box(-0.05, -0.096, 0.080), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(0.0023, -0.064, 0.081), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 0.62, 0.3 )}
    },
    --  Floating/Natural
    {   dependencies =  { "owo_tactical_stock_f_01|owo_tactical_stock_f_02" },
        stock =         { position = vector3_box(-0.026, -0.115, 0.082), rotation = vector3_box(0, 0, -176), scale = vector3_box(1, 1.0, 1 ) },
    },
    {   dependencies =  { "owo_tactical_stock_f_03u" },
        stock =         { position = vector3_box(0.0, -0.126, 0.0625), rotation = vector3_box(174, 0, 0), scale = vector3_box(3.76, 1.9, 1 ) },
    },
})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)