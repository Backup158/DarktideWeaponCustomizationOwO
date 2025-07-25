local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "lasgun_p3_m1" -- Recon Lasgun
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
--[[
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
    "muzzle_2", -- MT and Syn didn't add this to Recons yet
    "muzzle_3",
    "muzzle_4",
    "muzzle_5",
    "muzzle_6",

    -- "barrelac", -- only scab gunner barrel

    "bayonetac1",
    "bayonetac2",
    "bayonetac3",
    "bayonetac4",
    "bayonetac5",
    "bayonetac6",
    "bayonetac7",
    "bayonetac8",

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
mod.owo_muzzle_brake(this_variant)

mod.owo_underbarrel_gl(this_variant)
mod.owo_underbarrel_shotgun(this_variant)

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)
mod.owo_holosight(this_variant, "sight", "receiver")
mod.owo_prismatic_sight(this_variant)

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
local _owo_short_vortex_sights = "owo_holosight_02_01ss|owo_holosight_02_02ss_z1|owo_holosight_02_02ss_z2|owo_holosight_02_03ss"
local _owo_all_vortex_sights = _owo_no_magnifier_vortex_sights.."|".._owo_magnifier_vortex_sights
local _owo_forwards_acog_sights = "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_backwards_acog_sights = "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top"
local _owo_rmr_acog_sights = "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_all_acog_sights = _owo_forwards_acog_sights.."|".._owo_backwards_acog_sights
local _owo_all_susat_sights = "owo_susat_01|owo_susat_01_z1|owo_susat_01_ps|owo_susat_02|owo_susat_02_z1|owo_susat_02_top"
local _owo_masterkey_bayonets = "owo_underbarrel_shotgun_masterkey|owo_underbarrel_shotgun_masterkey_01|owo_underbarrel_shotgun_masterkey_02"
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"

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

local _recon_default_receivers = "receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07"
local _syn_volleygun_receivers = "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b"

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
mod.fixes_owo_prismatic_sight(this_variant, "sight", "receiver")

mod.fixes_owo_underbarrel_gl(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {

	-- ######
	-- Magazine: FLAT LASGUN
	-- ######
	-- trying to align with syn's aquilon barrel
	{	dependencies = { "owo_lasgun_magazine_flat_01", _syn_volleygun_receivers, },
		magazine = { offset = true, position = vector3_box(0, 0.05, 0.03), scale = vector3_box(1, 1, 0.5)},
	},
    {	dependencies = { "owo_lasgun_magazine_flat_01"},
		magazine = { offset = true, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.75)},
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
    --	M203 for iLas
    {	dependencies =  { "owo_m203", _syn_volleygun_receivers },
        bayonet =       { offset = true, position = vector3_box(0, 0.354, -0.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    --	M203 Default
    --  man this really isnt designed for bullpups lol
    {	dependencies =  { "owo_m203" },
        bayonet =       { offset = true, position = vector3_box(0, 0.39, -0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    --  --------------------------------------------
	--	GP25
	--  --------------------------------------------
    --[[
	{	dependencies =  { "owo_gp25", _short_infantry_lasgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.088, -0.144), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_infantry_lasgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.0, -0.138), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _all_helbore_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.092, -0.142), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _all_recon_lasgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.124, -0.152), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --      Patches for MT parts
    {	dependencies =  { "owo_gp25", _short_infantry_autogun_mt_barrels},
        bayonet =       { offset = true, position = vector3_box(0, 0.06, -0.136), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _medium_infantry_autogun_mt_barrels.."|".._long_infantry_autogun_mt_barrels},
        bayonet =       { offset = true, position = vector3_box(0, -0.044, -0.136), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _super_short_braced_autogun_mt_barrels.."|".._short_braced_autogun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.05, -0.106), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_braced_autogun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.204, -0.106), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _short_vigilant_autogun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.13, -0.15), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_vigilant_autogun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.072, -0.148), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_laspistol_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.198, -0.142), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_combat_shotgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.414, -0.132), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_autopistol_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.152, -0.152), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", "longlasgun_barrel_01" },
        bayonet =       { offset = true, position = vector3_box(0, 0.022, -0.138), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 0.68, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_twin_stubber_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.634, -0.464), rotation = vector3_box(0, 0, 180), scale = vector3_box(6, 2.4, 6 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_single_stubber_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.326, -0.084), rotation = vector3_box(0, 0, 180), scale = vector3_box(4, 1.2, 4 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_db_shotgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.184, -0.084), rotation = vector3_box(0, 0, 180), scale = vector3_box(3, 1.8, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_plasma_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.22, -0.18), rotation = vector3_box(0, 0, 180), scale = vector3_box(2.2, 1.2, 2.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_flamer_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.218, -0.208), rotation = vector3_box(0, 0, 180), scale = vector3_box(2.3, 1.2, 2.15 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_bolter_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.056), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_backwards_bolter_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.056), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_ripper_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.06, 0.03), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.06, 0.038), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 0.566, 0.39 ) },
    },
    --      Patches for Syn's parts
    {	dependencies =  { "owo_gp25", "exitus_barrel_01" },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.65, -0.07), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --{	dependencies =  { "owo_gp25", _syn_helbore_sniper_barrels },
    --    bayonet =       { offset = true, position = vector3_box(0, 0.116, -0.476), rotation = vector3_box(0, 0, 180), scale = vector3_box(3.3, 1.5, 3.3 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_carry_sniper_barrels },
    --    bayonet =       { offset = true, position = vector3_box(0, 0.116, -0.488), rotation = vector3_box(0, 0, 180), scale = vector3_box(3.3, 1.5, 3.3 ) },
    --},
    {	dependencies =  { "owo_gp25", "ilasgun_double_barrel_01" },
        bayonet =       { offset = true, position = vector3_box(0, -0.0, -0.142), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", "ilasgun_triple_barrel_01" },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.464, -0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_hellgun_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.352, -0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_heavy_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.038), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --{	dependencies =  { "owo_gp25", _syn_m41a_barrels },
    --    bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    {	dependencies =  { "owo_gp25", _syn_carbine_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
        flashlight =    { offset = true, position = vector3_box(0.033, 0.568, 0.062), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    --{	dependencies =  { "owo_gp25", _syn_thompson_barrels },
    --    bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.066), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    --{	dependencies =  { "owo_gp25", "syn_daewook11_barrel_01" },
    --    bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.08), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_rotary_barrels },
    --    bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_q3_barrels },
    --    bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.046), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_pulse_barrels },
    --    bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.094), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    {	dependencies =  { "owo_gp25", _syn_aquilon_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.038), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_canis_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.464, -0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_gauss_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.5, -0.056), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --  Syn's Volleygun Receivers
    {	dependencies =  { "owo_gp25", _syn_volleygun_receivers, },
        bayonet =       { offset = true, position = vector3_box(0, 0.112, -0.134), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --	GP25 Default
    {	dependencies =  { "owo_gp25", },
        bayonet =       { offset = true, position = vector3_box(0, 0.018, -0.16), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --	GP25 Helpers
    {	dependencies =  { "owo_gp25" },
        bayonetac1 =    { offset = true, position = vector3_box(0, -0.022, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.875, 1, 0.875 ) },
        bayonetac2 =    { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(90, 0, 180), scale = vector3_box(1.1, 1.1, 1.3 ) },
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.06, 0.03), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 0.566, 0.21 ) },
        bayonetac4 =    { offset = true, position = vector3_box(0, 0.142, 0.004), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.0, 0.6, 0.35 ) },
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.158, -0.012), rotation = vector3_box(-173, 0, 0), scale = vector3_box(0.6, 0.7, 0.7 ) },
    },
    ]]
    --	GP25 for iLas
    {	dependencies =  { "owo_gp25", _syn_volleygun_receivers },
        bayonet =       { offset = true, position = vector3_box(0, 0.464, -0.054), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --	GP25 Default
    {	dependencies =  { "owo_gp25" },
        bayonet =       { offset = true, position = vector3_box(0, 0.546, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },

    -- ######
	-- Bayonet: UNDERBARREL SHOTGUN
	-- ######
    --  --------------------------------------------
    --  Masterkey
    --  --------------------------------------------
    --[[
    --  Syn's Volleygun/Kantrael bodies (uses the same positioning as lasgun_p1_m1 because they're iLas bodies)
    --      THICC
    {	dependencies = {"owo_underbarrel_shotgun_masterkey",
            _syn_volleygun_receivers,
        },
        -- Shotgun body
        bayonet =       { offset = true, position = vector3_box(0, -0.0708, -0.11), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        -- Connector
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.6, 1.0 ) },
    },
    --      Smaller Masterkey
    {	dependencies = {"owo_underbarrel_shotgun_masterkey_02",
            _syn_volleygun_receivers,
        },
        -- Shotgun body
        bayonet =       { offset = true, position = vector3_box(0, -0.0708, -0.11), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
        -- Connector
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.6, 1.0 ) },
    },
    --  Recon Receivers
    --      THICC
    {	dependencies = {"owo_underbarrel_shotgun_masterkey",
            --"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
        },
        -- Shotgun body
        bayonet =       { offset = true, position = vector3_box(0, -0.0628, -0.184), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        -- Connector, shorter because of hand rest position
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 0.82, 1.0 ) },
    },
    --      Smaller Masterkey
    {	dependencies = {"owo_underbarrel_shotgun_masterkey_02",
            --"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
        },
        -- Shotgun body
        bayonet =       { offset = true, position = vector3_box(0, -0.0628, -0.184), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
        -- Connector, shorter because of hand rest position
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 0.82, 1.0 ) },
    },
    ]]
    --  Main Body Position
    --      A bit lower
    {	dependencies =  { _mt_combat_shotgun_barrels.."|".._mt_db_shotgun_barrels.."|".._syn_hellgun_barrels.."|".._syn_carbine_barrels, 
            _syn_volleygun_receivers, 
            "owo_underbarrel_shotgun_masterkey_01",
        },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.065), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    {	dependencies =  { _mt_combat_shotgun_barrels.."|".._mt_db_shotgun_barrels.."|".._syn_hellgun_barrels.."|".._syn_carbine_barrels, 
            _syn_volleygun_receivers, 
            "owo_underbarrel_shotgun_masterkey",
        },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.087), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { _mt_combat_shotgun_barrels.."|".._mt_db_shotgun_barrels.."|".._syn_hellgun_barrels.."|".._syn_carbine_barrels, 
            _syn_volleygun_receivers, 
            "owo_underbarrel_shotgun_masterkey_02",
        },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.049), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --      A bit and a bit lower
    {	dependencies =  { "exitus_barrel_01|".._syn_aquilon_barrels, 
            _syn_volleygun_receivers,
            "owo_underbarrel_shotgun_masterkey_01", 
        },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.070), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    {	dependencies =  { "exitus_barrel_01|".._syn_aquilon_barrels, 
            _syn_volleygun_receivers, 
            "owo_underbarrel_shotgun_masterkey",
        },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.092), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { "exitus_barrel_01|".._syn_aquilon_barrels, 
            _syn_volleygun_receivers, 
            "owo_underbarrel_shotgun_masterkey_02"
        },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.054), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --      Default
    --          Normal
    {	dependencies =  { _syn_volleygun_receivers, "owo_underbarrel_shotgun_masterkey_01"},
        -- Shotgun Body
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.163, -0.060), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_masterkey_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.060), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    --          THICC
    {	dependencies =  { _syn_volleygun_receivers, "owo_underbarrel_shotgun_masterkey"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.163, -0.082), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_masterkey"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.082), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    --          Mini
    {	dependencies =  { _syn_volleygun_receivers, "owo_underbarrel_shotgun_masterkey_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.163, -0.044), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_masterkey_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.295, -0.044), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --  Masterkey Helpers
	{	dependencies = {"owo_underbarrel_shotgun_masterkey|owo_underbarrel_shotgun_masterkey_01|owo_underbarrel_shotgun_masterkey_02"},
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
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.2, 1.0 ) },
        -- Pump
        bayonetac7 =    { offset = true, position = vector3_box(0, 0.46, -0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.95, 0.7, 0.85 ) },
    },
    --  --------------------------------------------
    --  M26-MASS
    --  --------------------------------------------
    --      Syn's Volleygun Receivers
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass",
            _syn_volleygun_receivers,
        },
        -- Receiver
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.25, -0.088), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    --      Recon Receivers
    {	dependencies =  { "owo_underbarrel_shotgun_m26mass",
            --"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
        },
        -- Receiver
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.313, -0.11), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    --  M26-MASS Helpers
    {	dependencies = {"owo_underbarrel_shotgun_m26mass"},
        -- Mag
        bayonetac1 =    { offset = true, position = vector3_box(0, -0.015, -0.079), rotation = vector3_box(15, 0, 0), scale = vector3_box(1, 1.2, 1 ) },
        -- Barrel
        bayonetac2 =    { offset = true, position = vector3_box(0, -0.02, 0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Muzzle
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.36, 0.086), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    { offset = true, position = vector3_box(0, -0.044, -0.026), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 1.085 ) },
        -- Front Connector is too far up on these short ass guns
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.246, 0.082), rotation = vector3_box(-180, -90, 90), scale = vector3_box(0.75, 0.95, 0.335 ), hide_mesh = {{"bayonetac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        -- Connector
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.0 ) },
    },

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  --------------------------------------------
    --  EOTech
    --  --------------------------------------------
    --  Alt vm patch
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, 0, 0.014), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Sight Alignment
    --      Sight Only
    --          Syn's Hellgun Receivers
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _syn_volleygun_receivers, _owo_no_magnifier_eotech_sights, },
        sight =             { offset = true, parent = "rail", position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, 0.0265), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --          Else, Recon Receiver
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_no_magnifier_eotech_sights, },
        rail =              { automatic_equip = { rail = "rail_default"}, },
        sight =             { offset = true, position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0007, -0.0333), rotation = vector3_box(0, 0, 0)},
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    --          Syn's Hellgun Receivers
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _syn_volleygun_receivers, _owo_magnifier_aligned_eotech_sights, },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        sight =             { offset = true, parent = "rail", position = vector3_box(0, 0.11, 0.132), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, 0.0265), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _syn_volleygun_receivers, _owo_magnifier_side_eotech_sights, },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        sight =             { offset = true, parent = "rail", position = vector3_box(0, 0.11, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0004, 0.0265), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --          Else, Recon Receiver
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_aligned_eotech_sights, },
        rail =              { automatic_equip = { rail = "rail_default"}, },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        sight =             { offset = true, position = vector3_box(0, 0.16, 0.18), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0007, -0.0333), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_side_eotech_sights, },
        rail =              { automatic_equip = { rail = "rail_default"}, },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        sight =             { offset = true, position = vector3_box(0, 0.16, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0007, -0.0333), rotation = vector3_box(0, 0, 0)},
    },
    --  --------------------------------------------
    --  Vortex Razor
    --  --------------------------------------------
    --  Patch for alt sights
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_sight_2s, },
        sight_2 =           { offset = true, parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Sight Alignment
    --      Sight Only
    --          Syn's Hellgun Receivers
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _syn_volleygun_receivers, _owo_no_magnifier_vortex_sights, },
        rail =              { offset = true, position = vector3_box(0, 0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.8), },
        sight =             { offset = true, parent = "rail", position = vector3_box(0, 0.03, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, 0.0235), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --          Else, Recon Receiver
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_no_magnifier_vortex_sights, },
        rail =              { automatic_equip = { rail = "rail_default"}, },
        sight =             { offset = true, position = vector3_box(0, 0.052, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0204), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Magnifier moves sight forwards
    --          Syn's Hellgun Receivers
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _syn_volleygun_receivers, _owo_magnifier_vortex_sights, },
        rail =              { offset = true, position = vector3_box(0, 0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
        sight =             { offset = false, parent = "rail", position = vector3_box(0, 0.12, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, 0.021), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --          Else, Recon Receiver
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_magnifier_vortex_sights, },
        rail =              { automatic_equip = { rail = "rail_default"}, },
        sight =             { offset = true, position = vector3_box(0, 0.12, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0204), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

	-- ######
    -- Sight: Prismatic Sights (Telescopic)
    -- ######
    --  --------------------------------------------
    -- Trijicon ACOG
    --  --------------------------------------------
    --  Patch to hide alt viewmodel sights
    {   dependencies =      { "owo_sight_group_indicator_prismatic_sight_acog", _owo_sight_2s, },
        sight_2 =           { offset = false, parent = "sight", position = vector3_box(0, -0.04, 0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --      Syn's Hellgun Receivers
    {   dependencies =      { _syn_volleygun_receivers, "owo_acog_sight_02_top|owo_acog_sight_02f_top", },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.05), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.073), rotation = vector3_box(0, 0, 0), },
    },
	{   dependencies =      { _syn_volleygun_receivers, _owo_forwards_acog_sights, },
        rail =              { offset = true, position = vector3_box(0, -0.01, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.0), },
        sight =             { offset = true, parent = "rail", position = vector3_box(0, 0.108, 0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.03, 0.002), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _syn_volleygun_receivers, _owo_backwards_acog_sights, },
        rail =              { offset = true, position = vector3_box(0, -0.01, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.0), },
        sight =             { offset = true, parent = "rail", position = vector3_box(0, 0.046, 0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.03, 0.002), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Else: Recon Body
    --          Recon rail already put acog forwards
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top", },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.11), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.11), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { _owo_all_acog_sights, },
        rail =              { automatic_equip = { rail = "rail_default"}, },
        sight =             { offset = true, position = vector3_box(0, 0.138, 0.19), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.02, -0.034), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  --------------------------------------------
    --  SUSAT
    --  --------------------------------------------
    --      Syn's Hellgun Receivers
    {   dependencies =      { _syn_volleygun_receivers, "owo_susat_02_top", },
        scope_offset =      { offset = true, position = vector3_box(0, 0.2, -0.05), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0, 0.2, -0.05), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { _syn_volleygun_receivers, _owo_all_susat_sights, },
        rail =              { offset = true, position = vector3_box(0, -0.01, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.0), },
        sight =             { offset = true, parent = "rail", position = vector3_box(0, 0.006, 0.048), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.03, 0.013), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Else: Recon Receivers
    {   dependencies =      { "owo_susat_02_top", },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.3, -0.097), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.3, -0.097), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { "owo_sight_group_indicator_prismatic_sight_susat", },
        rail =              { automatic_equip = { rail = "rail_default"}, },
        sight =             { offset = true, position = vector3_box(0, 0.016, 0.221), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.02, -0.034), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    
    -- ######
	-- Sight: SOVIET PU SCOPE
	-- ######
	{	dependencies =      { "owo_pu_scope_01|owo_pu_scope_02"},
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0), lense_transparency = true },
        scope_offset =      { offset = true, position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0), lense_transparency = true },
        lens =              { offset = false, parent = "sight", position = vector3_box(0, 0.162, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},

        sight = 	  { offset = true, position = vector3_box(0, -0.09, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        -- Scope Body
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
    {	dependencies = {"owo_pu_scope_01"},
        sight_secondary = { offset = true, position = vector3_box(0, 0.016, 0.1), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
    {	dependencies = {"owo_pu_scope_02"},
        sight_secondary = { offset = true, position = vector3_box(0, -0.036, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)