local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "lasgun_p1_m1" -- Infantry Lasgun
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
    "muzzle_3",
    "muzzle_4",
    "muzzle_5",
    "muzzle_6",

    "bayonetac1",
    "bayonetac2",
    "bayonetac3",
    "bayonetac4",
    "bayonetac5",
    "bayonetac6",
    "bayonetac7",
    "bayonetac8",

    -- "barrelac", -- was only for scab gunner barrel

    "sightac1",
    "sightac5",
    "sightac6",
    "sightac7",
    "sight_secondary",
    "sight_secondary_ac1",
    "sight_secondary_ac2",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_magazine_flat(this_variant)

if not mod.syn then mod.owo_invisible_muzzle(this_variant) end
mod.owo_suppressor(this_variant)
mod.owo_condom(this_variant)

mod.owo_underbarrel_gl(this_variant, "bayonet")
mod.owo_underbarrel_shotgun(this_variant, "bayonet")

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)
mod.owo_holosight(this_variant, "sight", "rail")
mod.owo_prismatic_sight(this_variant, "sight", "rail")

mod.owo_tactical_stock(this_variant)

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
local _owo_chunky_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"
local _owo_slim_suppressor_muzzles = "owo_suppressor_01s|owo_suppressor_02s|owo_suppressor_03s|owo_suppressor_04s|owo_suppressor_05s"
local _owo_all_suppressor_muzzles = _owo_chunky_suppressor_muzzles.."|".._owo_slim_suppressor_muzzles

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
local _super_short_helbore_barrels = "barrel_19"
local _medium_short_helbore_barrels = "barrel_09|barrel_12|barrel_13|barrel_22|hlasgun_barrel_01|hlasgun_barrel_04|hlasgun_barrel_05|hlasgun_barrel_05b"-- Medium length, short bottom
local _medium_medium_helbore_barrels = "barrel_11|hlasgun_barrel_03"
local _long_helbore_barrels = "barrel_10|barrel_20|hlasgun_barrel_02"
local _all_helbore_barrels = _super_short_helbore_barrels.."|".._medium_short_helbore_barrels.."|".._medium_medium_helbore_barrels.."|".._long_helbore_barrels
local _short_infantry_lasgun_barrels = "barrel_03|ilasgun_barrel_03"
local _long_infantry_lasgun_barrels = "barrel_01|barrel_02|barrel_04|barrel_05|barrel_06|barrel_07|barrel_08|barrel_21|ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08"
local _all_infantry_lasgun_barrels = _short_infantry_lasgun_barrels.."|".._long_infantry_lasgun_barrels
local _recon_lasgun_barrels = "barrel_14|barrel_15|barrel_16|barrel_17|barrel_18"
local _all_recon_lasgun_barrels = _recon_lasgun_barrels.."|".._mt_recon_lasgun_barrels

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
mod.fixes_owo_condom(this_variant)

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
	-- Magazine: FLAT LASGUN
	-- ######
	{	dependencies =  { "owo_lasgun_magazine_flat_01" },
		magazine =      { offset = true, position = vector3_box(0, 0, -0.02), scale = vector3_box(1, 1, 0.5 ) },
	},
	{	dependencies =  { "owo_autogun_magazine_flat_03" },
		magazine =      { offset = true, scale = vector3_box(1, 1, 0.6 ) },
	},

	-- ######
	-- Muzzle: CONDOM
	-- ######

    -- ######
	-- Bayonet: UNDERBARREL GRENADE LAUNCHER
	-- ######
    --  --------------------------------------------
	--	M203
	--  --------------------------------------------
    --      Patches for MT parts
    --      Patches for Syn's parts
    --          Aquilon barrel flashlights clip with the underbarrel
    --          actually that feels weird to do and i cba lol
    --{	dependencies =  { "owo_m203", _syn_aquilon_barrels },
    --    flashlight =    { offset = true, position = vector3_box(0.033, 0.568, 0.062), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    --},
    --	M203 Default for iLas
    {	dependencies =  { "owo_m203", },
        bayonet =       { offset = true, position = vector3_box(0, 0.354, -0.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203_hl1_01|owo_m203_hl1_02", },
        bayonet =       { offset = true, position = vector3_box(0, 0.272, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.9, 1 ) },
    },
    --  --------------------------------------------
	--	GP25
	--  --------------------------------------------
    --      Patches for MT parts
    {	dependencies =  { "owo_gp25", _super_short_braced_autogun_mt_barrels.."|".._short_braced_autogun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.584, -0.064), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_braced_autogun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.666, -0.064), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --      Patches for Syn's parts
    {	dependencies =  { "owo_gp25", "exitus_barrel_01" },
        bayonet =       { offset = true, position = vector3_box(0, 0.65, -0.07), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_heavy_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.5, -0.038), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_carbine_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
        --flashlight =    { offset = true, position = vector3_box(0.033, 0.568, 0.062), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_aquilon_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.5, -0.038), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --          Canis barrels have the front thing sticking in the way but i'm not doing anything about that
    --	GP25 Default
    {	dependencies =  { "owo_gp25" },
        bayonet =       { offset = true, position = vector3_box(0, 0.464, -0.054), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },

    -- ######
	-- Bayonet: UNDERBARREL SHOTGUN
	-- ######
    --  --------------------------------------------
    --  Masterkey
    --  --------------------------------------------
    --  Main Body Position
    --[[
    --      A bit lower
    {	dependencies =  { _owo_masterkey_bayonets, _syn_hellgun_barrels.."|".._syn_carbine_barrels, },
        bayonet =       { offset = true, position = vector3_box(0, 0.0, -0.014), },
    },
    --      A bit and a bit lower
    {	dependencies =  { _owo_masterkey_bayonets, "exitus_barrel_01|", },
        bayonet =       { offset = true, position = vector3_box(0, 0.0, -0.02), },
    },
    ]]
    --[[
    --      Default
    --          0,0,0 is fine, so it's handled universally
	{	dependencies =  { _owo_masterkey_bayonets },
        -- Shotgun body
        bayonet =       { offset = true, position = vector3_box(0, 0.163, -0.060), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    ]]
    --  --------------------------------------------
    --  M26-MASS
    --  --------------------------------------------
    --  Main Body Position
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass", _syn_hellgun_barrels.."|".._syn_carbine_barrels, },
        bayonet =       { offset = true, position = vector3_box(0, 0.25, -0.1), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass", "exitus_barrel_01", },
        bayonet =       { offset = true, position = vector3_box(0, 0.25, -0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    --      M26-MASS Default
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass" },
        -- Receiver
        bayonet =       { offset = true, position = vector3_box(0, 0.25, -0.088), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    --  M26-MASS Helpers
    --      Connector Patches
    --[[
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass", _mt_laspistol_barrels.."|".._mt_autopistol_barrels, },
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 0.6, 1.0 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass", _mt_single_stubber_barrels.."|".._mt_ripper_barrels, },
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.7 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass", _mt_backwards_bolter_barrels, },
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 0.466, 0.7 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass", _syn_carry_sniper_barrels, },
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 0.7 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass", _syn_aquilon_barrels, },
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.5 ) },
    },
    ]]

	-- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  --------------------------------------------
    --  EOTech
    --  --------------------------------------------
    --  Patch to hide alt viewmodel sights
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Sight Alignment
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_no_magnifier_eotech_sights, },
        sight =             { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, -0.004), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_eotech_sights, },
        sight =             { offset = true, position = vector3_box(0, 0.13, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, -0.004), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  --------------------------------------------
    --  Vortex Razor
    --  --------------------------------------------
    --  Patch for alt sights
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    -- Sight Alignment
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_no_magnifier_vortex_sights },
        sight =             { offset = true, position = vector3_box(0, 0.034, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0064), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Magnifier moves sight forwards
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_magnifier_vortex_sights },
        sight =             { offset = true, position = vector3_box(0, 0.12, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0064), rotation = vector3_box(0, 0, 0), lense_transparency = true },
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
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.0915), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.0915), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_forwards_acog_sights },
        sight =             { offset = true, position = vector3_box(0, 0.108, 0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.018), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_backwards_acog_sights },
        sight =             { offset = true, position = vector3_box(0, 0.046, 0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.018), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  --------------------------------------------
    --  SUSAT
    --  --------------------------------------------
    --      Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.3, -0.079), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.3, -0.079), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_susat", 
            _owo_all_susat_sights, },
        sight =             { offset = true, position = vector3_box(0, 0.006, 0.048), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.04, -0.016), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

    -- ######
	-- Stock: TACTICAL STOCK
	-- ######
    --  Handled universally

})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)