local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "bolter_p1_m1" -- Spearhead Boltgun

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].sightac1 = {}
-- Covered by MT Plugin 
--mod.wc.attachment[this_variant].sightac3 = {}
--mod.wc.attachment[this_variant].sightac4 = {}
--mod.wc.attachment[this_variant].sightac2 = {}
mod.wc.attachment[this_variant].sightac5 = {}
mod.wc.attachment[this_variant].sightac6 = {}
mod.wc.attachment[this_variant].sightac7 = {}
mod.wc.attachment[this_variant].sight_secondary = {}
mod.wc.attachment[this_variant].sight_secondary_ac1 = {}
mod.wc.attachment[this_variant].sight_secondary_ac2 = {}
-- Also covered by MT Plugin
--mod.wc.attachment[this_variant].sight_2 = {}
--mod.wc.attachment[this_variant].carryhandle = {}
--mod.wc.attachment[this_variant].gripac = {}
--mod.wc.attachment[this_variant].stockac = {}
--mod.wc.attachment[this_variant].stockac2 = {}
--mod.wc.attachment[this_variant].sightac = {}
--mod.wc.attachment[this_variant].accessory = {}

mod.wc.attachment[this_variant].bayonetac1 = {}
mod.wc.attachment[this_variant].bayonetac2 = {}
mod.wc.attachment[this_variant].bayonetac3 = {}
mod.wc.attachment[this_variant].bayonetac4 = {}
mod.wc.attachment[this_variant].bayonetac5 = {}
mod.wc.attachment[this_variant].bayonetac6 = {}
mod.wc.attachment[this_variant].bayonetac7 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_california_bolter(this_variant, "receiver")

mod.owo_underbarrel_gl(this_variant, "bayonet")
mod.owo_underbarrel_shotgun(this_variant, "bayonet")

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)

mod.owo_holosight(this_variant, "sight")
mod.owo_telescopic_sight(this_variant, "sight")

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
local _owo_all_acog_sights = _owo_forwards_acog_sights.."|".._owo_backwards_acog_sights
local _owo_masterkey_bayonets = "owo_underbarrel_shotgun_01|owo_underbarrel_shotgun_01_01|owo_underbarrel_shotgun_01_02"
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"

local _short_infantry_lasgun_mt_barrels = "ilasgun_barrel_03"
local _long_infantry_lasgun_mt_barrels = "ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08"
local _mt_laspistol_barrels = "lpistol_barrel_01|lpistol_barrel_02|lpistol_barrel_03|lpistol_barrel_04|lpistol_barrel_05|lpistol_barrel_06|lpistol_barrel_07"
local _medium_short_helbore_mt_barrels = "hlasgun_barrel_01|hlasgun_barrel_04|hlasgun_barrel_05|hlasgun_barrel_05b" -- Medium length, short bottom
local _medium_medium_helbore_mt_barrels = "hlasgun_barrel_03"
local _long_helbore_mt_barrels = "hlasgun_barrel_02"
local _all_helbore_mt_barrels = _medium_short_helbore_mt_barrels.."|".._medium_medium_helbore_mt_barrels.."|".._long_helbore_mt_barrels
local _mt_recon_lasgun_barrels = "rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05"

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

-- ########
-- For This Variant Only
-- ########
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
mod.mt.inject_fixes(this_variant, {
    -- Bayonet
    {	dependencies =  { "owo_dreg_bayonet_rear_01|owo_bayonet_m7_helper_01|owo_bayonet_seitengewehr_helper_01|owo_bayonet_epee_helper_01|owo_m203_helper_01|owo_gp25_helper_01|owo_underbarrel_shotgun_helper_01|owo_underbarrel_shotgun_helper_01_02"},
        bayonetac1 = {hide_mesh = {     {"bayonetac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_bayonet_m7_helper_02|owo_bayonet_seitengewehr_helper_02|owo_bayonet_epee_helper_02|owo_m203_helper_02|owo_gp25_helper_02|owo_underbarrel_shotgun_helper_02|owo_underbarrel_shotgun_helper_02_02"},
        bayonetac2 = {hide_mesh = {     {"bayonetac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_m203_helper_03|owo_gp25_helper_03|owo_underbarrel_shotgun_helper_03|owo_underbarrel_shotgun_helper_03_02"},
        bayonetac3 = {hide_mesh = {     {"bayonetac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_m203_helper_04|owo_gp25_helper_04|owo_underbarrel_shotgun_helper_04"},
        bayonetac4 = {hide_mesh = {     {"bayonetac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_gp25_helper_05|owo_underbarrel_shotgun_helper_05|owo_underbarrel_shotgun_helper_05_02"},
        bayonetac5 = {hide_mesh = {     {"bayonetac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_underbarrel_shotgun_helper_06|owo_underbarrel_shotgun_helper_06_02"},
        bayonetac6 = {hide_mesh = {     {"bayonetac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_underbarrel_shotgun_helper_07"},
        bayonetac7 = {hide_mesh = {     {"bayonetac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    -- Sights
    {   dependencies = {"owo_holosight_helper_01|owo_pu_scope_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01"},
        sightac1 = { hide_mesh = {{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_02|owo_pu_scope_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01"},
        sightac2 = { hide_mesh = {{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_03|owo_holosight_helper_03_02|owo_pu_scope_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01"},
        sightac3 = { hide_mesh = {{"sightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_04|owo_pu_scope_helper_04|owo_acog_sight_helper_04"},
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
    {   dependencies = { "owo_holosight_sight_secondary_01|owo_acog_sight_sight_secondary_01|owo_pu_scope_riser_01"},
        sight_secondary = { hide_mesh = {{"sight_secondary", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_01"},
        sight_secondary_ac1 = { hide_mesh = {{"sight_secondary_ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},  
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_02"},
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

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Receiver: California Bolter receiver
    -- ######
    {   dependencies = { "owo_california_bolter_01|owo_california_bolter_02|owo_california_bolter_03|owo_california_bolter_04|owo_california_bolter_05|owo_california_bolter_06|owo_california_bolter_07|owo_california_bolter_08"},
        receiver = { offset = true,  position = vector3_box(0, 0, 0.054), scale = vector3_box(1, 1, 0.64)},    
        -- In compliance with California Penal Code § 32310 PC 
        -- Reducing magazine capacity
        magazine = { offset = true,  position = vector3_box(0, 0, 0.055), scale = vector3_box(1, 1, 0.58)},
    },
    -- Grips
    --      MT Plasma grips
    --      this one sits higher than other grips for whatever the fuck reason
    {   dependencies = { "owo_california_bolter_01|owo_california_bolter_02|owo_california_bolter_03|owo_california_bolter_04|owo_california_bolter_05|owo_california_bolter_06|owo_california_bolter_07|owo_california_bolter_08", 
            "plas_pisgrip_01|plas_pisgrip_02|plas_pisgrip_03"
        },
        grip = { offset = true,  position = vector3_box(0, 0.006, -0.032), scale = vector3_box(1, 1, 1.564)},
    },
    --      Repositioning for MT Cadia Compliant Stock
    --      makes it sit higher than usual so the top of the trigger guard is flush with the receiver
    {   dependencies = { "owo_california_bolter_01|owo_california_bolter_02|owo_california_bolter_03|owo_california_bolter_04|owo_california_bolter_05|owo_california_bolter_06|owo_california_bolter_07|owo_california_bolter_08", 
            "hlasgun_grip_01|hlasgun_grip_02|hlasgun_grip_03"
        },
        grip = { offset = true,  position = vector3_box(0, 0, 0.013), scale = vector3_box(1, 1, 1.564)},
    },
    --      Else
    {   dependencies = { "owo_california_bolter_01|owo_california_bolter_02|owo_california_bolter_03|owo_california_bolter_04|owo_california_bolter_05|owo_california_bolter_06|owo_california_bolter_07|owo_california_bolter_08", 
        },
        grip = { offset = true,  position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.564)}
    },

    -- ######
	-- Bayonet: UNDERBARREL GRENADE LAUNCHER
	-- ######
    --  -------------------------------------------
    --  M203
    --  -------------------------------------------
    --      Default
    --          Bolter barrels do not extend very far and they all have the same receiver shapes (besides my fucked up one), so I'll attach it in the underbarrel grip part
	{	dependencies =  { "owo_m203" },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.366, -0.066), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    --  Helpers
    {	dependencies =  { "owo_m203"},
        bayonetac1 =    { offset = true, position = vector3_box(0, 0.138, 0.), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1, 1 ) },
        bayonetac2 =    { offset = true, position = vector3_box(0, -0.046, 0), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.4, 1.4, 0.8 ) },
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.06, 0.042), rotation = vector3_box(-180, 0, -180), scale = vector3_box(1, 0.51, 0.51 ) },
        bayonetac4 =    { offset = true, position = vector3_box(0, -0.112, -0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.28, 0.69 ) },
    },
    --  -------------------------------------------
    --  GP-25
    --  -------------------------------------------
    --      Default
    {	dependencies =  { "owo_gp25" },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.366, -0.066), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --  Helpers
    {	dependencies =  { "owo_gp25" },
        bayonetac1 =    { offset = true, position = vector3_box(0, -0.022, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.875, 1, 0.875 ) },
        bayonetac2 =    { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(90, 0, 180), scale = vector3_box(1.1, 1.1, 1.3 ) },
        -- Connector
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.06, 0.03), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 0.566, 0.21 ) },
        -- Trigger
        bayonetac4 =    { offset = true, position = vector3_box(0, 0.142, 0.004), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.0, 0.6, 0.35 ) },
        -- Top trigger
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.158, -0.012), rotation = vector3_box(-173, 0, 0), scale = vector3_box(0.6, 0.7, 0.7 ) },
    },


    -- ######
	-- Bayonet: UNDERBARREL SHOTGUN
	-- ######
    --  -------------------------------------------
    --  Masterkey
    --  -------------------------------------------
    --      Default
    --          Normal
    {	dependencies =  { "owo_underbarrel_shotgun_01_01"},
        -- Shotgun body
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.042), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    --          THICC
    {	dependencies =  { "owo_underbarrel_shotgun_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    --          Mini
    {	dependencies =  { "owo_underbarrel_shotgun_01_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.042), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --  Masterkey Helpers
    --      Default Helpers
	{	dependencies =  { "owo_underbarrel_shotgun_01|owo_underbarrel_shotgun_01_01|owo_underbarrel_shotgun_01_02"},
        -- Shotgun tube
        bayonetac1 =    { offset = true, position = vector3_box(0, 0.613, 0), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.2, 1, 1.2 ) },
        -- Shotgun barrel 2
        bayonetac2 =    { offset = true, position = vector3_box(0, 0.01, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Shotgun tube middle extension
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.42, -0.05), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    { offset = true, position = vector3_box(0, 0.036, -0.088), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 0.85 ) },
        -- Shotgun Trap
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.06, -0.0818), rotation = vector3_box(-90, 0, -84), scale = vector3_box(0.135, 0.25, 0.365 ) },
        -- Connector
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.6, 1.0 ) },
        -- Pump
        bayonetac7 =    { offset = true, position = vector3_box(0, 0.46, -0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.95, 0.7, 0.85 ) },
    },
    --  -------------------------------------------
    --  M26-MASS
    --  -------------------------------------------
    {	dependencies =  { "owo_underbarrel_shotgun_02"},
        -- Receiver
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.25, -0.092), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    --  M26-MASS Helpers
    --      Default Helpers
    {	dependencies =  { "owo_underbarrel_shotgun_02"},
        -- Mag
        bayonetac1 =    { offset = true, position = vector3_box(0, -0.015, -0.079), rotation = vector3_box(15, 0, 0), scale = vector3_box(1, 1.2, 1 ) },
        -- Barrel
        bayonetac2 =    { offset = true, position = vector3_box(0, -0.02, 0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Muzzle
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.36, 0.086), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    { offset = true, position = vector3_box(0, -0.044, -0.026), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 1.085 ) },
        -- Front Connector
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.246, 0.082), rotation = vector3_box(-180, -90, 90), scale = vector3_box(0.75, 0.95, 0.335 ) },
        -- Connector
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.0 ) },
    },

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  -------------------------------------------
    --  EOTech
    --  -------------------------------------------
    {   dependencies =  { _owo_all_eotech_sights },
        sightac3 =      { offset = true, position = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =      { offset = true, position = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
        rail =          { offset = true, position = vector3_box(0, 0.036, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 0.8), automatic_equip = { rail = "rail_01"}, },
    },
    {   dependencies =  { "owo_holosight_01_01|owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_03" },
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
        sight =         { offset = true, parent = "rail", position = vector3_box(0, 0, 0.16), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies =  { _owo_magnifier_eotech_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
     },
    {   dependencies =          { _owo_magnifier_eotech_sights, },
        --sight =             { offset = true, position = vector3_box(0, 0.05, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight =                 { offset = true, position = vector3_box(0, 0.13, 0.16), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =               { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
        sight_secondary =       { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
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
        sight_2 =       { offset = true, parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Short Variant
    {   dependencies =  { "owo_holosight_02_01ss|owo_holosight_02_02ss_z1|owo_holosight_02_02ss_z2|owo_holosight_02_03ss" },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.018), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.4, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.018), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.4, 0.286) },
    },
    --  Magnifier moves sight forwards
    {   dependencies =  { _owo_magnifier_aligned_vortex_sights },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.001), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
    },
    {   dependencies =  { _owo_magnifier_vortex_sights },
        sight =         { offset = true, position = vector3_box(0, 0.11, 0.17), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.005), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sight_secondary =         { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    {   dependencies =  { _owo_all_vortex_sights },
        sight =         { offset = true, position = vector3_box(0, 0.05, 0.17), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { offset = true, parent = "sight", position = vector3_box(0, -0.02, 0.005), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.004), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.032, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.05, 0.666, 0.884) },
        sightac4 =      { offset = true, position = vector3_box(0, -0.002, 0.002), rotation = vector3_box(90, -90, 180), scale = vector3_box(0.98, 0.24, 0.16) },
        rail =          { offset = true, position = vector3_box(0, 0.036, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 0.8), automatic_equip = { rail = "rail_01"}, },
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
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.028), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.030), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.028), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    -- EOTech
    {   dependencies =      { _owo_no_magnifier_eotech_sights},
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, -0.030), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.029), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, -0.029), rotation = vector3_box(0, 0, 0), },
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
        sight =         { offset = true, position = vector3_box(0, 0.046, 0.18), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        lens =          { offset = true, parent = "sight", position = vector3_box(0, 0.088, 0.0525), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =        { offset = true, parent = "sight", position = vector3_box(0, -0.04, 0.0495), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =       { offset = true, position = vector3_box(0, 0.0, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        rail =          { offset = true, position = vector3_box(0, 0.036, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 0.8), automatic_equip = { rail = "rail_01"}, },
    },
    {   dependencies =  { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight =         { offset = true, position = vector3_box(0, 0.108, 0.18), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        lens =          { offset = true, parent = "sight", position = vector3_box(0, 0.145, 0.0525), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =        { offset = true, parent = "sight", position = vector3_box(0, 0.021, 0.0495), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =       { offset = true, position = vector3_box(0, 0.072, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        rail =          { offset = true, position = vector3_box(0, 0.036, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 0.8), automatic_equip = { rail = "rail_01"}, },
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
        sight =         { offset = true, position = vector3_box(0, 0.006, 0.204), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
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
        rail =          { offset = true, position = vector3_box(0, 0.036, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.1, 0.8), automatic_equip = { rail = "rail_01"}, },
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
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.041), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1" },
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.041), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1" },
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.03), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Aiming with RMR on ACOG
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        --scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.114), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.114), rotation = vector3_box(0, 0, 0), },
    },
    --      Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        --scope_offset =      { offset = true, position = vector3_box(0.0002, 0.3, -0.094), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.3, -0.094), rotation = vector3_box(0, 0, 0), },
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
        stock =         { position = vector3_box(0.08, -0.092, 0.078), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(-0.0037, -0.064, 0.079), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.62, 0.3 )}
    },
    --  Folded (Left)
    {   dependencies =  { "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
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