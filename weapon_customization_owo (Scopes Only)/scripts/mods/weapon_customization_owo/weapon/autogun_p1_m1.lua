local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "autogun_p1_m1" -- Braced/Infantry/Vigilant Autoguns

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].sightac1 = {}
--[[ Covered by MT Plugin 
-- mod.wc.attachment[this_variant].gripac = {}
-- mod.wc.attachment[this_variant].sightac2 = {}
-- mod.wc.attachment[this_variant].sightac3 = {}
-- mod.wc.attachment[this_variant].sightac4 = {}
]]
mod.wc.attachment[this_variant].sightac5 = {}
mod.wc.attachment[this_variant].sightac6 = {}
mod.wc.attachment[this_variant].sightac7 = {}
mod.wc.attachment[this_variant].sight_secondary = {}
mod.wc.attachment[this_variant].sight_secondary_ac1 = {}
mod.wc.attachment[this_variant].sight_secondary_ac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################

mod.owo_alt_viewmodel(this_variant)
mod.owo_m16_sight(this_variant, "sight")
mod.owo_rear_sight_ak(this_variant)
mod.owo_holosight(this_variant, "sight")
mod.owo_telescopic_sight(this_variant, "sight")
mod.owo_pu_scope(this_variant, "sight")

-- ############################################
-- Inject Fixes
-- ############################################
local _alternative_viewmodels_sight_2s = "owo_alt_viewmodel_01|owo_alt_viewmodel_02|owo_alt_viewmodel_03|owo_alt_viewmodel_04|owo_alt_viewmodel_05|owo_alt_viewmodel_06"
local _owo_all_eotech_sights = "owo_holosight_01_01|owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_03|owo_holosight_01_01ss|owo_holosight_01_02ss_z1|owo_holosight_01_03ss"
local _owo_no_magnifier_eotech_sights = "owo_holosight_01_01|owo_holosight_01_01ss"
local _owo_magnifier_aligned_eotech_sights = "owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_02ss_z1|owo_holosight_01_02ss_z2"
local _owo_magnifier_side_eotech_sights = "owo_holosight_01_03|owo_holosight_01_03ss"
local _owo_magnifier_eotech_sights = _owo_magnifier_aligned_eotech_sights.."|".._owo_magnifier_side_eotech_sights
local _owo_no_magnifier_vortex_sights = "owo_holosight_02_01|owo_holosight_02_01ss"
local _owo_magnifier_aligned_vortex_sights = "owo_holosight_02_02_z1|owo_holosight_02_02_z2|owo_holosight_02_02ss_z1|owo_holosight_02_02ss_z2"
local _owo_magnifier_side_vortex_sights = "owo_holosight_02_03|owo_holosight_02_03ss"
local _owo_magnifier_vortex_sights = _owo_magnifier_aligned_vortex_sights.."|".._owo_magnifier_side_vortex_sights
local _owo_all_vortex_sights = _owo_no_magnifier_vortex_sights.."|".._owo_magnifier_vortex_sights
local _owo_masterkey_bayonets = "owo_underbarrel_shotgun_01|owo_underbarrel_shotgun_01_01|owo_underbarrel_shotgun_01_02"

local _infantry_autogun_receivers = "receiver_01|receiver_10"
local _braced_autogun_receivers = "receiver_03|receiver_06|receiver_07|receiver_08"
local _vigilant_autogun_receivers = "receiver_02|receiver_04|receiver_05|receiver_09|receiver_11"

local _m16_all_barrels = "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
local _m16a1_01_barrels = "owo_m16_barrel_a1|owo_m16_barrel_t_a1|owo_m16_barrel_n_a1"
local _m16a1_02_barrels = "owo_m16_barrel_a1_02|owo_m16_barrel_t_a1_02|owo_m16_barrel_n_a1_02"
local _m16a2_barrels = "owo_m16_barrel_a2|owo_m16_barrel_t_a2|owo_m16_barrel_n_a2"
local _m16_normal_post_barrels = "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2"
local _m16_tall_post_barrels = "owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2"
local _m16_no_post_barrels = "owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
local _super_short_braced_autogun_all_barrels = "barrel_08|bagun_barrel_02"
local _short_braced_autogun_barrels = "barrel_07|barrel_13|barrel_14|barrel_18|barrel_19|barrel_20"
local _short_braced_autogun_mt_barrels = "bagun_barrel_01|bagun_barrel_05|bagun_barrel_06|bagun_barrel_07|bagun_barrel_08"
local _short_braced_autogun_all_barrels = _short_braced_autogun_barrels.."|".._short_braced_autogun_mt_barrels
local _long_braced_autogun_barrels = "barrel_09|barrel_10"
local _long_braced_autogun_mt_barrels = "bagun_barrel_03|bagun_barrel_04"
local _long_braced_autogun_all_barrels = _long_braced_autogun_barrels.."|".._long_braced_autogun_mt_barrels
local _short_infantry_autogun_barrels = "barrel_04"
local _short_infantry_autogun_mt_barrels = "iagun_barrel_04"
local _short_infantry_autogun_all_barrels = _short_infantry_autogun_barrels.."|".._short_infantry_autogun_mt_barrels
local _medium_infantry_autogun_barrels = "barrel_01|barrel_02|barrel_06|barrel_21"
local _medium_infantry_autogun_mt_barrels = "iagun_barrel_01|iagun_barrel_02|iagun_barrel_06"
local _medium_infantry_autogun_all_barrels = _medium_infantry_autogun_barrels.."|".._medium_infantry_autogun_mt_barrels
local _long_infantry_autogun_barrels = "barrel_03|barrel_05"
local _long_infantry_autogun_mt_barrels = "iagun_barrel_03|iagun_barrel_05"
local _long_infantry_autogun_all_barrels = _long_infantry_autogun_barrels.."|".._long_infantry_autogun_mt_barrels
local _short_vigilant_autogun_barrels = "barrel_12|hagun_barrel_02"
local _long_vigilant_autogun_barrels = "barrel_11|barrel_15|barrel_16|barrel_22"
local _long_vigilant_autogun_mt_barrels = "hagun_barrel_01|hagun_barrel_03|hagun_barrel_04"
local _long_vigilant_autogun_all_barrels = _long_vigilant_autogun_barrels.."|".._long_vigilant_autogun_mt_barrels

local _short_infantry_lasgun_mt_barrels = "ilasgun_barrel_03"
local _long_infantry_lasgun_mt_barrels = "ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08"
local _mt_laspistol_barrels = "lpistol_barrel_01|lpistol_barrel_02|lpistol_barrel_03|lpistol_barrel_04|lpistol_barrel_05|lpistol_barrel_06|lpistol_barrel_07"
local _medium_short_helbore_mt_barrels = "hlasgun_barrel_01|hlasgun_barrel_04|hlasgun_barrel_05|hlasgun_barrel_05b" -- Medium length, short bottom
local _medium_medium_helbore_mt_barrels = "hlasgun_barrel_03"
local _long_helbore_mt_barrels = "hlasgun_barrel_02"
local _all_helbore_mt_barrels = _medium_short_helbore_mt_barrels.."|".._medium_medium_helbore_mt_barrels.."|".._long_helbore_mt_barrels

local _recon_lasgun_mt_barrels = "rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05"

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

mod.mt.inject_fixes(this_variant, {

    -- ######
	-- Sight_2: Alt Viewmodels
	-- ######
    --  Doom
    {   dependencies =      { "owo_alt_viewmodel_01" },
        scope_offset =      { offset = true, position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0), },
    },
    {   dependencies =      { "owo_alt_viewmodel_02" },
        scope_offset =      { offset = true, position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
    },
    {   dependencies =      { "owo_alt_viewmodel_03" },
        scope_offset =      { offset = true, position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
    },
    -- CS:S
    {   dependencies =      { "owo_alt_viewmodel_04" },
        scope_offset =      { offset = true, position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
    },
    -- Hipfire
    {   dependencies =      { "owo_alt_viewmodel_05" },
        scope_offset =      { offset = true, position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
    },
    -- Point Shooting
    {   dependencies =      { "owo_alt_viewmodel_06" },
        scope_offset =          { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0),  },
        no_scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0),  },
    },

    -- ######
	-- Sight: M16 Sights
	-- ######
    {	dependencies =  { "owo_m16_sight_01|owo_m16_sight_02",
            _vigilant_autogun_receivers,
        },
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.00015, -0.0273), rotation = vector3_box(0, 0, 0)},
        scope_offset =      { offset = true, position = vector3_box(0, -0.00015, -0.0273), rotation = vector3_box(0, 0, 0)},
        sight =      { offset = true, position = vector3_box(0, -0.038, 0.024), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.745, 0.714, 0.758 ) },
        sightac1 =    { offset = true, position = vector3_box(0.005, 0.247, 0.098), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.03, 0.804, 0.104 ) },
        sightac2 =    { offset = true, position = vector3_box(-0.005, 0.247, 0.098), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.03, 0.804, 0.104 ) },
    },
    {	dependencies =  { "owo_m16_sight_01|owo_m16_sight_02"},
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.00015, -0.0223), rotation = vector3_box(0, 0, 0)},
        scope_offset =      { offset = true, position = vector3_box(0, -0.00015, -0.0223), rotation = vector3_box(0, 0, 0)},
        sight =      { offset = true, position = vector3_box(0, -0.038, 0.019), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.745, 0.714, 0.758 ) },
        sightac1 =    { offset = true, position = vector3_box(0.005, 0.247, 0.098), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.03, 0.804, 0.104 ) },
        sightac2 =    { offset = true, position = vector3_box(-0.005, 0.247, 0.098), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.03, 0.804, 0.104 ) },
    },
    --  M16 Helpers
	{	dependencies =  { "owo_m16_sight_01|owo_m16_sight_02"},
        -- Rear Sight Aperture. the peep hole then the 2 bases
        sightac3 =    { offset = true, position = vector3_box(0, 0.022, 0.185), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.15, 0.06, 0.15 ) },
        sightac4 =    { offset = true, position = vector3_box(0.001, 0.024, 0.177), rotation = vector3_box(180, 90, 0), scale = vector3_box(0.08, 0.1, 0.03 ) },
        sightac5 =    { offset = true, position = vector3_box(-0.003, 0.024, 0.177), rotation = vector3_box(-90, -90, -180), scale = vector3_box(0.08, 0.1, 0.03 ) },
        -- Windage Knob on the right side of the sight
        sightac6 =    { offset = true, position = vector3_box(0.006, 0.016, 0.174), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.14, 0.14, 0.056 ) },
        -- Rear Elevation Knob in the base, below the rear sight
        sightac7 =    { offset = true, position = vector3_box(0, 0.012, 0.146), rotation = vector3_box(45, 90, 45), scale = vector3_box(0.77, 0.09, 0.77 ) },
    },

    -- ######
    -- Sight: Rear Sight
    -- ######
    -- AK
    {	dependencies =  { "owo_rear_sight_ak_01"},
        no_scope_offset =      { offset = true, position = vector3_box(0, -0.1, 0.007), rotation = vector3_box(0.5, 0, 0)},
        sight =     { offset = true, position = vector3_box(0, 0.24, -0.004), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0 ) },
        sightac5 = { offset = true, position = vector3_box(0.008, -0.01, 0.005), rotation = vector3_box(-145, 90, 145), scale = vector3_box(0.23, 0.24, 0.25 ) },
    },
    {	dependencies =  { "owo_rear_sight_ak_02"},
        no_scope_offset =      { offset = true, position = vector3_box(0, -0.15, 0.002), rotation = vector3_box(0.9, 0, 0)},
        sight =     { offset = true, position = vector3_box(0, 0.24, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0 ) },
        sightac5 = { offset = true, position = vector3_box(0.008, -0.01, 0.003), rotation = vector3_box(-145, 90, 145), scale = vector3_box(0.23, 0.24, 0.25 ) },
        sightac6 =     { offset = true, position = vector3_box(0.0, 0.0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.75, 1.4, 1.0 ) },
    },
    {	dependencies =  { "owo_rear_sight_ak_01|owo_rear_sight_ak_02"},
        sightac1 = { offset = true, position = vector3_box(-0.004, -0.06, 0.01), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.36, 0.36, 0.25 ) },
        sightac2 = { offset = true, position = vector3_box(0.022, -0.06, 0.01), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.32, 0.32, 0.06 ) },
        sightac3 = { offset = true, position = vector3_box(0.009, -0.07, 0.0226), rotation = vector3_box(90, 90, 0), scale = vector3_box(0.23, 0.047, 0.22 ) },
        sightac4 = { offset = true, position = vector3_box(-0.009, -0.07, 0.0226), rotation = vector3_box(90, -90, 0), scale = vector3_box(0.23, 0.047, 0.22 ) },
    },
    --   Scuffed
    --      0.5 degree up to align with brauto front post
    --      Pushed forwards to hide stock
    {	dependencies =  { "owo_rear_sight_ak_03"},
        no_scope_offset =      { offset = true, position = vector3_box(0, -0.1, 0.007), rotation = vector3_box(0.5, 0, 0)},
        sight =     { offset = true, position = vector3_box(0, 0.19, 0.119), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
    },
    --      pushed even more forwards to hide receiver not covered by dust cover (aka the part that gets molested by dust)
    {	dependencies =  { "owo_rear_sight_ak_04"},
        no_scope_offset =      { offset = true, position = vector3_box(0, -0.15, 0.002), rotation = vector3_box(0.9, 0, 0)},
        sight =     { offset = true, position = vector3_box(0, 0.19, 0.125), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
    },
    {	dependencies =  { "owo_rear_sight_ak_03|owo_rear_sight_ak_04"},
        sightac1 = { offset = true, position = vector3_box(0, 0.034, 0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.38, 4.18 ) },
        --sightac2 = { offset = true, position = vector3_box(-0.008, -0.044, 0.016), rotation = vector3_box(180, 0, 90), scale = vector3_box(0.8, 0.38, 4.18 ) },
        sightac2 = { offset = true, position = vector3_box(0, 0.034, -0.004), rotation = vector3_box(180, 0, 90), scale = vector3_box(0.36, 0.73, 3.48 ) },
        sightac3 = { offset = true, position = vector3_box(-0.05, -0.034, 0.054), rotation = vector3_box(0, 0, 90), scale = vector3_box(0.55, 0.27, 1.34 ) },
        sightac4 = { offset = true, position = vector3_box(-0.05, -0.034, -0.062), rotation = vector3_box(180, 0, 90), scale = vector3_box(0.55, 0.27, 1.34 ) },
        sightac5 = { offset = true, position = vector3_box(-0.008, 0.012, -0.068), rotation = vector3_box(180, 0, 180), scale = vector3_box(1.04, 0.254, 1.62 ) },
    },
    {	dependencies =  { "owo_rear_sight_ak_04"},
        sightac6 =     { offset = true, position = vector3_box(0.126, 0.126, 0.0), rotation = vector3_box(-180, -90, -180), scale = vector3_box(8.23, 2.8, 3.92 ) },
    },

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  -------------------------------------------
    --  EOTech
    --  -------------------------------------------
    --  Sight Helpers
    {   dependencies =  { _owo_all_eotech_sights },
        sightac3 =      { offset = true, position = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =      { offset = true, position = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
        
        rail =          { offset = true, position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.8), automatic_equip = { rail = "rail_01"}, },
    },
    {   dependencies =  { "owo_holosight_01_01|owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_03" },
        sightac1 =      { offset = true, position = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac2 =      { offset = true, position = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
    },
    --      Short Variant
    {   dependencies =  { "owo_holosight_01_01ss|owo_holosight_01_02ss_z1|owo_holosight_01_03ss" },
        sightac1 =      { offset = true, position = vector3_box(0.00, 0.018, 0.018), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.366, 0.256) },
        sightac2 =      { offset = true, position = vector3_box(0.00, 0.018, 0.018), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.366, 0.256) },
    },
    --  Main Sight body
    --      Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =  { _owo_no_magnifier_eotech_sights,
            _alternative_viewmodels_sight_2s,
        },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =  { _owo_no_magnifier_eotech_sights },
        sight =         { offset = true, position = vector3_box(0, 0, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =      { _owo_magnifier_eotech_sights,
            _alternative_viewmodels_sight_2s,
        },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =      { _owo_magnifier_eotech_sights },
        sight =             { offset = true, position = vector3_box(0, 0.13, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
    
        sight_secondary =         { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    --  Magnifier
    --      Aligned
    {   dependencies =      { _owo_magnifier_aligned_eotech_sights },
        sight_secondary_ac1 =      { offset = true, position = vector3_box(0, -0.154, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position = vector3_box(0, -0.0162, 0.034), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    
        lens =              { offset = false, parent = "sight", position = vector3_box(0, -0.048, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0, -0.12, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 2}},
    },
    --      Side
    {   dependencies =      { _owo_magnifier_side_eotech_sights },
        sight_secondary_ac1 =      { offset = true, position = vector3_box(0.042, -0.154, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    
        lens =              { offset = false, parent = "sight", position = vector3_box(0.042, -0.048, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.52)},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0.042, -0.12, 0.01), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.52)},
    },
    --  -------------------------------------------
    --  Vortex Razor
    --  -------------------------------------------
    --  Patch for alt sights
    {   dependencies =  { _owo_all_vortex_sights, _alternative_viewmodels_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Short Variant
    {   dependencies =  { "owo_holosight_02_01ss|owo_holosight_02_02ss_z1|owo_holosight_02_02ss_z2|owo_holosight_02_03ss" },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.018), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.4, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.018), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.4, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.032, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.05, 0.666, 1.282) },
    },
    --  Magnifier moves sight forwards
    {   dependencies =  { _owo_magnifier_vortex_sights },
        sight =         { offset = true, position = vector3_box(0, 0.11, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sight_secondary =         { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    {   dependencies =  { _owo_all_vortex_sights },
        sight =         { offset = true, position = vector3_box(0, 0, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.004), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.032, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.05, 0.666, 0.884) },
        sightac4 =      { offset = true, position = vector3_box(0, -0.002, 0.002), rotation = vector3_box(90, -90, 180), scale = vector3_box(0.98, 0.24, 0.16) },
        rail =          { offset = true, position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.8), automatic_equip = { rail = "rail_01"}, },
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
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0193), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0193), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0193), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    -- EOTech
    {   dependencies =      { _owo_no_magnifier_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0193), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.018), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.018), rotation = vector3_box(0, 0, 0) },
    },

    -- ######
    -- Sight: Telescopic Sights
    -- ######
    --  -------------------------------------------
    --  Trijicon ACOG
    --  -------------------------------------------
    --  ACOG only
    --      Main sight and reticle
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top",
        _alternative_viewmodels_sight_2s,
        },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight =             { offset = true, position = vector3_box(0, 0.074, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =           { offset = true, position = vector3_box(0, -0.046, 0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Main sight and reticle (backwards)
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top",
            _alternative_viewmodels_sight_2s,
        },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top" },
        sight =             { offset = true, position = vector3_box(0, 0, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =           { offset = true, position = vector3_box(0, -0.046, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Sight Helpers
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
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
    
        -- For whatever fucking reason, the recon body won't apply position transformations to lenses
        -- These are the same for forwards and backwards
        lens =              { offset = false, parent = "sight", position = vector3_box(0, 0.026, 0.0345), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0, -0.098, 0.0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    --  ACOG with RMR on top
    {   dependencies = { "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight_secondary =      { offset = true, position = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  SUSAT
    --  -------------------------------------------
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight =             { offset = true, position = vector3_box(0, -0.06, 0.160), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
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

        lens =              { offset = false, parent = "sightac7", position = vector3_box(0, 0.096, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.3, 0.85), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sightac7", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    -- SUSAT with red dot
    {   dependencies = { "owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight_secondary =     { offset = true, position = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    --  Aiming with main sight
    --      ACOG
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1",
            _vigilant_autogun_receivers,
        },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.0258), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1" },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.0237), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      ACOG Backwards
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1",
            _vigilant_autogun_receivers,
        },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.026), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1" },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.0257), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      SUSAT
    {   dependencies = { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1",
            _vigilant_autogun_receivers,
        },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0238), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies = { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1",
        },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0237), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  Aiming with RMR on ACOG
    {   dependencies = { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.100), rotation = vector3_box(0, 0, 0),  },
    },
    --  Aiming with RMR on SUSAT
    {   dependencies = { "owo_susat_02_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.0872), rotation = vector3_box(0, 0, 0),  },
    },

    -- ######
	-- Sight: SOVIET PU SCOPE
	-- ######
    --  Position for MAS bodies
    {	dependencies =  { "owo_pu_scope_01|owo_pu_scope_02", 
            "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s",
        },
        sight = 	  { offset = true, position = vector3_box(0, -0.028, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        -- Scope body
        sightac1 = { offset = true, position = vector3_box(0, 0.166 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        sightac7 = { offset = true, position = vector3_box(0, 0.0 , 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
	{	dependencies =  { "owo_pu_scope_01|owo_pu_scope_02"},
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0), lense_transparency = true },
        scope_offset =      { offset = true, position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0), lense_transparency = true },

        lens =              { offset = false, parent = "sight", position = vector3_box(0, 0.162, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},

        sight = 	  { offset = true, position = vector3_box(0, -0.09, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        -- Scope body
        sightac1 = { offset = true, position = vector3_box(0, 0.106 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        sightac7 = { offset = true, position = vector3_box(0, 0.0 , 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        -- Crosshair
        sightac2 = { offset = true, position = vector3_box(0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
        sightac3 = { offset = true, position = vector3_box(-0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
        sightac4 = { offset = true, position = vector3_box(0, 0.08, -0.031), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.25, 0.1 ) },
        -- Knobs
        sightac5 = { offset = true, position = vector3_box(0, 0.13, 0.03), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.5, 0.5, 0.2 ) },
        sightac6 = { offset = true, position = vector3_box(0.03, 0.095, 0), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.5, 0.5, 0.2 ) },
    },
    -- Riser alightment
    {	dependencies =  { "owo_pu_scope_01", 
            "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s",
        },
        sight_secondary = { offset = true, position = vector3_box(0, 0.066, 0.096), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
    {	dependencies =  { "owo_pu_scope_01"},
        sight_secondary = { offset = true, position = vector3_box(0, 0.016, 0.1), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
    {	dependencies =  { "owo_pu_scope_02"},
        sight_secondary = { offset = true, position = vector3_box(0, -0.036, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },

    -- ####################################################################################
    -- HIDING HELPERS
    -- By putting it down here, they will only be hidden if the fixes from above are not found
    -- Because they match the main parts first, if there is no match it means the main part is not attached
    -- ####################################################################################
    -- Sights
    {   dependencies =  { "owo_holosight_helper_01|owo_rear_sight_ac1_01|owo_rear_sight_ac1_02|owo_rear_sight_ac1_02|owo_rear_sight_ac1_03|owo_rear_sight_ak_ac1_01|owo_rear_sight_ak_ac1_02|owo_pu_scope_helper_01|owo_m16_sight_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01"},
        sightac1 = { hide_mesh = {{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_holosight_helper_02|owo_rear_sight_ac2_01|owo_rear_sight_ac2_02|owo_rear_sight_ac2_03|owo_rear_sight_ac2_04|owo_rear_sight_ak_ac2_01|owo_rear_sight_ak_ac2_02|owo_pu_scope_helper_02|owo_m16_sight_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01"},
        sightac2 = { hide_mesh = {{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_holosight_helper_03|owo_holosight_helper_03_02|owo_rear_sight_ac3_01|owo_rear_sight_ak_ac3_01|owo_pu_scope_helper_03|owo_m16_sight_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01"},
        sightac3 = { hide_mesh = {{"sightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_holosight_helper_04|owo_rear_sight_ac4_01|owo_rear_sight_ak_ac4_01|owo_pu_scope_helper_04|owo_m16_sight_helper_04|owo_acog_sight_helper_04"},
        sightac4 = { hide_mesh = {{"sightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac5_01|owo_rear_sight_ak_ac5_01|owo_pu_scope_helper_05|owo_m16_sight_helper_05|owo_acog_sight_helper_05|owo_susat_ac5_01"},
        sightac5 = { hide_mesh = {{"sightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac6_01|owo_rear_sight_ak_ac6_01|owo_pu_scope_helper_06|owo_m16_sight_helper_06|owo_acog_sight_helper_06|owo_susat_ac5_01"},
        sightac6 = { hide_mesh = {{"sightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_m16_sight_helper_07|owo_acog_sight_helper_07|owo_susat_ac7_01|owo_pu_scope_helper_07"},
        sightac7 = { hide_mesh = {{"sightac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_01|owo_acog_sight_sight_secondary_01|owo_pu_scope_riser_01"},
        sight_secondary = { hide_mesh = {{"sight_secondary", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_01"},
        sight_secondary_ac1 = { hide_mesh = {{"sight_secondary_ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},  
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_02"},
        sight_secondary_ac2 = { hide_mesh = {{"sight_secondary_ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
