local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "boltpistol_p1_m1" -- Bolt Pistol

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
if not mod.syn then
    mod.wc.attachment[this_variant].barrelshroud = {}

    mod.wc.attachment[this_variant].sight_2 = {}
end
mod.wc.attachment[this_variant].sightac1 = {}
-- Covered by MT Plugin 
-- mod.wc.attachment[this_variant].sightac2 = {}
-- mod.wc.attachment[this_variant].sightac3 = {}
-- mod.wc.attachment[this_variant].sightac4 = {}
mod.wc.attachment[this_variant].sightac5 = {}
mod.wc.attachment[this_variant].sightac6 = {}
mod.wc.attachment[this_variant].sightac7 = {}
mod.wc.attachment[this_variant].sight_secondary = {}
mod.wc.attachment[this_variant].sight_secondary_ac1 = {}
mod.wc.attachment[this_variant].sight_secondary_ac2 = {}

mod.wc.attachment[this_variant].muzzle_2 = {}
mod.wc.attachment[this_variant].muzzle_3 = {}
mod.wc.attachment[this_variant].muzzle_4 = {}
mod.wc.attachment[this_variant].muzzle_5 = {}
mod.wc.attachment[this_variant].muzzle_6 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_bistol_shotgun_barrel_short(this_variant)

mod.owo_suppressor(this_variant, "muzzle")
mod.owo_muzzle_brake(this_variant)

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)

mod.owo_holographic_sight(this_variant, "sight")
mod.owo_telescopic_sight(this_variant, "sight")

mod.owo_tactical_stock(this_variant, "stock")

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_sight_2s = "owo_alt_viewmodel_01|owo_alt_viewmodel_02|owo_alt_viewmodel_03|owo_alt_viewmodel_04|owo_alt_viewmodel_05|owo_alt_viewmodel_06|owo_reticle_helper_invisible"
local _owo_no_magnifier_eotech_sights = "owo_holographic_sight_01_01|owo_holographic_sight_01_01ss"
local _owo_magnifier_aligned_eotech_sights = "owo_holographic_sight_01_02_z1|owo_holographic_sight_01_02_z2|owo_holographic_sight_01_02ss_z1|owo_holographic_sight_01_02ss_z2"
local _owo_magnifier_side_eotech_sights = "owo_holographic_sight_01_03|owo_holographic_sight_01_03ss"
local _owo_magnifier_eotech_sights = _owo_magnifier_aligned_eotech_sights.."|".._owo_magnifier_side_eotech_sights
local _owo_short_eotech_sights = "owo_holographic_sight_01_01ss|owo_holographic_sight_01_02ss_z1|owo_holographic_sight_01_02ss_z2|owo_holographic_sight_01_03ss"
local _owo_all_eotech_sights = _owo_no_magnifier_eotech_sights.."|".._owo_magnifier_eotech_sights
local _owo_no_magnifier_vortex_sights = "owo_holographic_sight_02_01|owo_holographic_sight_02_01ss"
local _owo_magnifier_aligned_vortex_sights = "owo_holographic_sight_02_02_z1|owo_holographic_sight_02_02_z2|owo_holographic_sight_02_02ss_z1|owo_holographic_sight_02_02ss_z2"
local _owo_magnifier_side_vortex_sights = "owo_holographic_sight_02_03|owo_holographic_sight_02_03ss"
local _owo_magnifier_vortex_sights = _owo_magnifier_aligned_vortex_sights.."|".._owo_magnifier_side_vortex_sights
local _owo_all_vortex_sights = _owo_no_magnifier_vortex_sights.."|".._owo_magnifier_vortex_sights
local _owo_forwards_acog_sights = "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_backwards_acog_sights = "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top"
local _owo_all_acog_sights = _owo_forwards_acog_sights.."|".._owo_backwards_acog_sights
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"

local _short_braced_autogun_mt_barrels = "bagun_barrel_01|bagun_barrel_05|bagun_barrel_06|bagun_barrel_07|bagun_barrel_08"
local _long_braced_autogun_mt_barrels = "bagun_barrel_03|bagun_barrel_04"
local _short_infantry_autogun_mt_barrels = "iagun_barrel_04"
local _medium_infantry_autogun_mt_barrels = "iagun_barrel_01|iagun_barrel_02|iagun_barrel_06"
local _long_infantry_autogun_mt_barrels = "iagun_barrel_03|iagun_barrel_05"
local _short_vigilant_autogun_mt_barrels = "hagun_barrel_02"
local _long_vigilant_autogun_mt_barrels = "hagun_barrel_01|hagun_barrel_03|hagun_barrel_04"
local _all_vigilant_autogun_mt_barrels = _short_vigilant_autogun_mt_barrels.."|".._long_vigilant_autogun_mt_barrels
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
-- "owo_bistol_sg_base_01|owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08|owo_bistol_sg_base_09"
local _owo_short_bistol_shotgun_barrels = "owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08"
local _owo_super_short_bistol_shotgun_barrels = "owo_bistol_sg_base_04_s|owo_bistol_sg_base_05_s|owo_bistol_sg_base_06_s|owo_bistol_sg_base_08_s"
local _owo_all_bistol_shotgun_barrels = _owo_short_bistol_shotgun_barrels.."|".._owo_super_short_bistol_shotgun_barrels

local _bistol_barrels = "bolt_pistol_barrel_01|bolt_pistol_barrel_02|bolt_pistol_barrel_03"

-- ############################################
-- Inject Fixes
-- ############################################
-- #################
-- HIDING HELPERS
-- By putting it up here, it ends up at the bottom of the list, so they will only be hidden if the fixes from above are not found
-- Because they match the main parts first, if there is no match it means the main part is not attached
-- #################
mod.mt.inject_fixes(this_variant, {
    -- Barrel
    {   dependencies = {"owo_bistol_shotgun_barrel_short_04|owo_bistol_shotgun_barrel_short_05|owo_bistol_shotgun_barrel_short_06|owo_bistol_shotgun_barrel_short_08"},
        barrelshroud = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Muzzles
    {	dependencies =  { "owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03|owo_suppressor_helper_04|owo_condom_helper_m2_01|owo_muzzle_brake_helper_01_01"},
        muzzle_2 = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_2 = "owo_muzzle_2_default"}, },
    },
    {	dependencies =  { "owo_muzzle_brake_helper_02_01|owo_suppressor_helper_02_01|owo_suppressor_helper_02_02|owo_suppressor_helper_02_03|owo_suppressor_helper_02_04|owo_condom_helper_m3_01"},
        muzzle_3 = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"muzzle_3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_3 = "owo_muzzle_3_default"}, },
    },
    {	dependencies =  { "owo_muzzle_brake_helper_03_01"},
        muzzle_4 = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"muzzle_4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_4 = "owo_muzzle_4_default"}, },
    },
    {	dependencies =  { "owo_muzzle_brake_helper_04_01"},
        muzzle_5 = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"muzzle_5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_5 = "owo_muzzle_5_default"}, },
    },
    {	dependencies =  { "owo_muzzle_brake_helper_05_01"},
        muzzle_6 = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"muzzle_6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_6 = "owo_muzzle_6_default"}, },
    },
    -- Sights
    {   dependencies = {"owo_holographic_sight_helper_01|owo_pu_scope_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01"},
        sightac1 = { hide_mesh = {{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holographic_sight_helper_02|owo_pu_scope_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01"},
        sightac2 = { hide_mesh = {{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holographic_sight_helper_03|owo_holographic_sight_helper_03_02|owo_pu_scope_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01"},
        sightac3 = { hide_mesh = {{"sightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holographic_sight_helper_04|owo_pu_scope_helper_04|owo_acog_sight_helper_04"},
        sightac4 = { hide_mesh = {{"sightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac5_01|owo_pu_scope_helper_05|owo_acog_sight_helper_05|owo_susat_ac5_01"},
        sightac5 = { hide_mesh = {{"sightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac6_01|owo_pu_scope_helper_06|owo_acog_sight_helper_06|owo_susat_ac6_01"},
        sightac6 = { hide_mesh = {{"sightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_acog_sight_helper_07|owo_susat_ac7_01"},
        sightac7 = { hide_mesh = {{"sightac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holographic_sight_sight_secondary_01|owo_acog_sight_sight_secondary_01|owo_pu_scope_riser_01"},
        sight_secondary = { hide_mesh = {{"sight_secondary", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holographic_sight_sight_secondary_helper_01"},
        sight_secondary_ac1 = { hide_mesh = {{"sight_secondary_ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},  
    },
    {   dependencies = { "owo_holographic_sight_sight_secondary_helper_02"},
        sight_secondary_ac2 = { hide_mesh = {{"sight_secondary_ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Stocks
    {   dependencies = {"owo_tactical_stockac_01"},
        stockac = { hide_mesh = {{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################
mod.fixes_owo_suppressors(this_variant)
mod.fixes_owo_muzzle_brake(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
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
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _bistol_barrels },
        muzzle_6 =      { offset = true, position = vector3_box(0, 0.06, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- Rest are in universal fixes

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  -------------------------------------------
    --  EOTech
    --  -------------------------------------------
    {   dependencies =  { _owo_all_eotech_sights },
        sightac3 =      { offset = true, position = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =      { offset = true, position = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
        rail =          { offset = true, position = vector3_box(0, 0.012, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 0.8), automatic_equip = { rail = "rail_01"}, },
    },
    {   dependencies =  { "owo_holographic_sight_01_01|owo_holographic_sight_01_02_z1|owo_holographic_sight_01_02_z2|owo_holographic_sight_01_03" },
        sightac1 =      { offset = true, position = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac2 =      { offset = true, position = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
    },
    --  Short Variant
    {   dependencies =  { _owo_short_eotech_sights },
        sightac1 =      { offset = true, position = vector3_box(0.00, 0.018, 0.018), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.366, 0.256) },
        sightac2 =      { offset = true, position = vector3_box(0.00, 0.018, 0.018), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.366, 0.256) },
    },
    {   dependencies =  { _owo_no_magnifier_eotech_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =  { _owo_no_magnifier_eotech_sights, },
        sight =         { offset = true, parent = "rail", position = vector3_box(0, 0, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies =  { _owo_magnifier_eotech_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =      { _owo_magnifier_eotech_sights, },
        --sight =             { offset = true, position = vector3_box(0, 0.05, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight =             { offset = true, position = vector3_box(0, 0.03, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    {   dependencies =          { _owo_magnifier_aligned_eotech_sights },
        sight_secondary_ac1 =   { offset = true, position = vector3_box(0, -0.154, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =   { offset = true, position = vector3_box(0, -0.0162, 0.034), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        lens =                  { offset = false, parent = "sight", position = vector3_box(0, -0.048, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 1}},
	    lens_2 =                { offset = false, parent = "sight", position = vector3_box(0, -0.12, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 2}},
    },
    {   dependencies =          { _owo_magnifier_side_eotech_sights },
        sight_secondary_ac1 =   { offset = true, position = vector3_box(0.042, -0.154, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =   { offset = true, position = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        lens =                  { offset = false, parent = "sight", position = vector3_box(0.042, -0.048, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 1}},
	    lens_2 =                { offset = false, parent = "sight", position = vector3_box(0.042, -0.12, 0.01), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 2}},
    },
    --  -------------------------------------------
    --  Vortex Razor
    --  -------------------------------------------
    --  Patch for alt sights
    {   dependencies =  { _owo_all_vortex_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.014), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Short Variant
    {   dependencies =  { "owo_holographic_sight_02_01ss|owo_holographic_sight_02_02ss_z1|owo_holographic_sight_02_02ss_z2|owo_holographic_sight_02_03ss" },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.018), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.4, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.018), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.4, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.032, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.05, 0.666, 1.282) },
    },
    --  Magnifier moves sight forwards
    {   dependencies =  { _owo_magnifier_vortex_sights },
        sight =         { offset = true, position = vector3_box(0, 0.09, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sight_secondary =         { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    {   dependencies =  { _owo_all_vortex_sights },
        sight =         { offset = true, parent = "rail", position = vector3_box(0, 0.01, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { offset = true, parent = "sight", position = vector3_box(0, -0.02, -0.00), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.004), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.032, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.05, 0.666, 0.884) },
        sightac4 =      { offset = true, position = vector3_box(0, -0.002, 0.002), rotation = vector3_box(90, -90, 180), scale = vector3_box(0.98, 0.24, 0.16) },
        rail =          { offset = true, position = vector3_box(0, 0.012, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 0.8), automatic_equip = { rail = "rail_01"}, },
    },
    --  Magnifier
    --      Aligned
    {   dependencies =          { _owo_magnifier_aligned_vortex_sights },
        sight_secondary_ac1 =   { offset = true, position = vector3_box(0, -0.194, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =   { offset = true, position = vector3_box(0, -0.0562, 0.034), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        lens =                  { offset = false, parent = "sight", position = vector3_box(0, -0.088, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.57), data = {lens = 1}},
	    lens_2 =                { offset = false, parent = "sight", position = vector3_box(0, -0.16, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.57), data = {lens = 2}},
	},
	--		Side
    {   dependencies =          { _owo_magnifier_side_vortex_sights },
        sight_secondary_ac1 =   { offset = true, position = vector3_box(0.042, -0.194, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =   { offset = true, position = vector3_box(0.042, -0.0562, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        lens =                  { offset = false, parent = "sight", position = vector3_box(0.042, -0.088, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.57), data = {lens = 1}},
	    lens_2 =                { offset = false, parent = "sight", position = vector3_box(0.042, -0.16, 0.01), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.57), data = {lens = 2}},
	},
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    -- Vortex Razor
    {   dependencies =      { _owo_no_magnifier_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0.002, -0.0, -0.0245), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0.002, -0.0, -0.0245), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0.002, -0.0, -0.0245), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    -- EOTech
    {   dependencies =      { _owo_no_magnifier_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0.002, 0, -0.0345), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0.002, 0, -0.0345), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0.002, 0, -0.0345), rotation = vector3_box(0, 0, 0), },
    },

	-- ######
    -- Sight: Telescopic Sights
    -- ######
    --  -------------------------------------------
    --  Trijicon ACOG
    --  -------------------------------------------
    --  ACOG only
    --      Sight and Sight 2 Adjustment
    --          For whatever fucking reason, the recon body won't apply position transformations to sight_2
    {   dependencies =  { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top" },
        sight =         { offset = true, position = vector3_box(0, 0.02, 0.128), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        lens =          { offset = true, parent = "sight", position = vector3_box(0, 0.072, 0.0325), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =        { offset = true, parent = "sight", position = vector3_box(0, -0.053, 0.0355), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =       { offset = true, position = vector3_box(0, 0.0, 0.004), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies =  { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight =         { offset = true, position = vector3_box(0, 0.07, 0.128), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        lens =          { offset = true, parent = "sight", position = vector3_box(0, 0.122, 0.0325), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =        { offset = true, parent = "sight", position = vector3_box(0, -0.003, 0.0355), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =       { offset = true, position = vector3_box(0, 0.0, 0.004), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      ACOG Parts
    {   dependencies =  { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sightac1 =      { offset = true, position = vector3_box(0, -0.022, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        sightac2 =      { offset = true, position = vector3_box(0, -0.132, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sightac3 =      { offset = true, position = vector3_box(0, 0.064, 0.032), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Base
        sightac4 =      { offset = true, position = vector3_box(0, -0.018, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Knobs
        sightac5 =      { offset = true, position = vector3_box(0, -0.01, 0.061), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.45, 0.68, 0.24) },
        sightac6 =      { offset = true, position = vector3_box(0.028, -0.014, 0.034), rotation = vector3_box(-180, -90, -180), scale = vector3_box(0.45, 0.45, 0.12) },
        -- Cable
        sightac7 =      { offset = true, position = vector3_box(0, -0.018, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.515, 0.195, 0.525) },
    },
    --  ACOG with RMR on top
    {   dependencies =      { "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  SUSAT
    --  -------------------------------------------
    {   dependencies =  { "owo_susat_01|owo_susat_01_ps|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight =         { offset = true, position = vector3_box(0, -0.03, 0.16), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Cylinder thing
        sightac1 =      { offset = true, position = vector3_box(0, -0.115, 0.147), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.6, 2.47, 2.14) },
        -- Rear
        sightac2 =      { offset = true, position = vector3_box(0, -0.0081, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        -- Base
        sightac4 =      { offset = true, position = vector3_box(0, 0.07, -0.036), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Reticle
        sightac5 =      { offset = true, position = vector3_box(-0.0028, 0.066, -0.026), rotation = vector3_box(0, 6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        sightac6 =      { offset = true, position = vector3_box(0.0028, 0.066, -0.026), rotation = vector3_box(0, -6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        -- Main sight body
        sightac7 =      { offset = true, position = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0) },
        lens =          { offset = false, parent = "sightac7", position = vector3_box(0, 0.096, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.3, 0.85), data = {lens = 1}},
	    lens_2 =        { offset = false, parent = "sightac7", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    --  SUSAT with red dot
    {   dependencies =      { "owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight_secondary =   { offset = true, position = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    --      Aiming with main sight
    --          Backwards
    {   dependencies =      { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1" },
        scope_offset =      { position = vector3_box(0.003, 0.04, -0.028), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1" },
        scope_offset =      { position = vector3_box(0.003, 0.04, -0.028), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1" },
        scope_offset =      { position = vector3_box(0.002, 0.04, -0.026), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Aiming with RMR on ACOG
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        --scope_offset =      { position = vector3_box(0.006, 0.001, -0.103), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { position = vector3_box(0.006, 0.001, -0.103), rotation = vector3_box(0, 0, 0), },
    },
    --      Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        --scope_offset =      { position = vector3_box(0.006, 0.04, -0.09), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { position = vector3_box(0.006, 0.04, -0.09), rotation = vector3_box(0, 0, 0), },
    },
    
    -- #####
    -- Barrel: Short Shotgun
    -- #####
    -- Muzzle Patches
    {   dependencies =  { _owo_all_bistol_shotgun_barrels },
        muzzle =        { offset = true, parent = "barrel", position = vector3_box(0, 0.0, 0), scale = vector3_box(1, 1, 1) },
    },
    --  Barrel
    --      Short
    {   dependencies =  { _owo_short_bistol_shotgun_barrels },
        barrel =        { offset = true,  position = vector3_box(0, 0.162, 0.012), scale = vector3_box(1, 1, 1) },
        barrelshroud =  { offset = true,  position = vector3_box(0, -0.148, 0.002), scale = vector3_box(1.165, 0.33, 0.9) },
    },
    --      Super Shorty
    {   dependencies =  { _owo_super_short_bistol_shotgun_barrels },
        barrel =        { offset = true,  position = vector3_box(0, 0.098, 0.012), scale = vector3_box(1, 1, 1) },
        barrelshroud =  { offset = true,  position = vector3_box(0, -0.082, 0.002), scale = vector3_box(1.165, 0.178, 0.9) },
    },

    -- ######
	-- Stock: TACTICAL STOCK
	-- ######
    --  Skeletal
    {   dependencies =  { "owo_tactical_stock_s_01" },
        stock =         { position = vector3_box(0.0, 0.11, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.95, 1 ) },
    },
    --  Folded
    {   dependencies =  { "owo_tactical_stock_01|owo_tactical_stock_02|owo_tactical_stock_03|owo_tactical_stock_04|owo_tactical_stock_05|owo_tactical_stock_06|owo_tactical_stock_07|owo_tactical_stock_08" },
        stock =         { position = vector3_box(0.056, -0.122, 0.044), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =      { position = vector3_box(-0.0037, -0.092, 0.043), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.5, 0.3 )}
    },
    --  Folded (Left)
    {   dependencies =  { "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
        stock =         { position = vector3_box(-0.05, -0.122, 0.044), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =      { position = vector3_box(0.0023, -0.092, 0.043), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 0.5, 0.3 )}
    },
    --  Floating/Natural
    {   dependencies =  { "owo_tactical_stock_f_01|owo_tactical_stock_f_02" },
        stock =         { position = vector3_box(-0.018, -0.137, 0.046), rotation = vector3_box(0, 0, -176), scale = vector3_box(1, 1.0, 1 ) },
    },
    {   dependencies =  { "owo_tactical_stock_f_03u" },
        stock =         { position = vector3_box(0.0, -0.142, 0.046), rotation = vector3_box(174, 0, 0), scale = vector3_box(3.76, 1.42, 1 ) },
    },
})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)