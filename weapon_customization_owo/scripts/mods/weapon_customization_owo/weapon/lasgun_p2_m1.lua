local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "lasgun_p2_m1" -- Helbore Lasgun
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
    "stockac", -- MT didn't add this to Helbore yet but Syn did
    "stockac2", -- MT didn't add this to Helbore yet but Syn did
	"rearmag",
    "muzzle_2", -- MT didn't add this to Helbore yet but Syn did
    "barrelshroud",
    "barrelshroudac",
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

    "owo_magac1",

    "bayonetac1",
    "bayonetac2",
    "bayonetac3",
    "bayonetac4",
    "bayonetac5",
    "bayonetac6",
    "bayonetac7",
    "bayonetac8",

    "receiverac1",
    "receiverac2",
    
    "sightac1",
    "sightac5",
    "sightac6",
    "sightac7",
    "sight_secondary",
    "sight_secondary_ac1",
    "sight_secondary_ac2",

    "sight_2_ac1",
    "sight_2_ac2",
    "sight_2_ac3",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_helbore_gripstock(this_variant)
mod.owo_magazine_flat(this_variant)
mod.owo_lasgun_magazine_rear(this_variant)
mod.owo_plasma_mag(this_variant)

mod.owo_wood_krieg(this_variant)
mod.owo_plasma_krieg(this_variant)

if not mod.syn then mod.owo_invisible_muzzle(this_variant) end
mod.owo_suppressor(this_variant)
mod.owo_condom(this_variant)
mod.owo_muzzle_brake(this_variant)

mod.owo_historical_bayonet(this_variant)
mod.owo_underbarrel_gl(this_variant)
mod.owo_underbarrel_shotgun(this_variant)

mod.owo_bolt_action(this_variant)
mod.owo_helbore_mas49(this_variant)

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)
mod.owo_scope_crosshair(this_variant)
mod.owo_rear_sight(this_variant)
mod.owo_holosight(this_variant, "sight", "receiver")
mod.owo_prismatic_sight(this_variant, "sight", "receiver")
mod.owo_classic_telescopic_sight(this_variant)

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
local _owo_bolt_helbore_receiverac1s = "owo_bolt_helbore_bolt_01"
local _owo_stupid_bolt_helbore_receiverac1s = "owo_bolt_helbore_bolt_01s"
local _owo_all_helbore_bolt_receiverac1s = _owo_bolt_helbore_receiverac1s.."|".._owo_stupid_bolt_helbore_receiverac1s
local _owo_mas_helbore_receiverac1s = "owo_helbore_mas49_01|owo_helbore_mas49_01_s"

local _short_infantry_lasgun_mt_barrels = "ilasgun_barrel_03"
local _long_infantry_lasgun_mt_barrels = "ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08"
local _mt_all_infantry_lasgun_barrels = _short_infantry_lasgun_mt_barrels.."|".._long_infantry_lasgun_mt_barrels
local _mt_laspistol_barrels = "lpistol_barrel_01|lpistol_barrel_02|lpistol_barrel_03|lpistol_barrel_04|lpistol_barrel_05|lpistol_barrel_06|lpistol_barrel_07"
local _medium_short_helbore_mt_barrels = "hlasgun_barrel_01|hlasgun_barrel_04|hlasgun_barrel_05|hlasgun_barrel_05b" -- Medium length, short bottom
local _medium_medium_helbore_mt_barrels = "hlasgun_barrel_03"
local _long_helbore_mt_barrels = "hlasgun_barrel_02"
local _all_helbore_mt_barrels = _medium_short_helbore_mt_barrels.."|".._medium_medium_helbore_mt_barrels.."|".._long_helbore_mt_barrels
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
-- hlasgun from MT plugin. I autocombined them here because fuck you
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
mod.mt.inject_fixes(this_variant, {
    {	dependencies = {"owo_lasgun_magazine_rear_child_01"},
        rearmag = {position = vector3_box(0, 0, 0.04), hide_mesh = {     {"rearmag", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
})

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################
mod.fixes_owo_suppressors(this_variant)
mod.fixes_owo_muzzle_brake(this_variant)
mod.fixes_owo_condom(this_variant)

mod.fixes_owo_scope_crosshair(this_variant)
mod.fixes_owo_holosight(this_variant)
mod.fixes_owo_prismatic_sight(this_variant)
mod.fixes_owo_classic_telescopic_sight(this_variant)

mod.fixes_owo_underbarrel_gl(this_variant)
mod.fixes_owo_underbarrel_shotgun(this_variant)

mod.fixes_owo_bolt_action(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
	-- ######
	-- Receiver: BOLT ACTION HELBORE
	-- ######
	-- Handled universally
    --	Wooden Helbore
	{	dependencies =  { _owo_all_helbore_bolt_receiverac1s, "receiver_04" },
        receiverac1 =   { offset = true, position = vector3_box(0, 0.012, 0.11), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.6, 0.5, 1 ) },
    },

	-- ######
	-- Receiver: HELBORE MAS-49
	-- ######
    -- Slims down receiver
	{	dependencies =  { "owo_helbore_mas49_01_s", },
		receiver =      { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.69, 1, 1 ) },
	},
	{	dependencies =  { _owo_mas_helbore_receiverac1s, },
		receiverac1 =   { offset = true, position = vector3_box(0.031, 0.022, 0.046), rotation = vector3_box(-90, 0, 90), scale = vector3_box(0.518, 0.573, 0.545 ) },
		receiverac2 =   { offset = true, position = vector3_box(0.046, 0.18, 0.096), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.755, 0.755, 0.15 ) },
	},

	-- ######
	-- Stock: STRAIGHT GRIP AND STOCK
	-- ######
    --  --------------------------------------------
    --  Recon
    --  --------------------------------------------
	{	dependencies =  { "owo_gripstock_recon_01|owo_gripstock_recon_02|owo_gripstock_recon_03" },
		stock =         { offset = true, position = vector3_box(0, -0.04, 0.065), scale = vector3_box(1, 1.15, 0.85 ) },
		stockac =       { offset = true, position = vector3_box(0, 0.02, 0),scale = vector3_box(1, 1, 1 ) },
	},
    --  --------------------------------------------
    --  AMR
    --  --------------------------------------------
    --  Stock and Grip
    {	dependencies =  { "owo_gripstock_amr_01|owo_gripstock_amr_02|owo_gripstock_amr_03|owo_gripstock_amr_04|owo_gripstock_amr_05|owo_gripstock_amr_06|owo_gripstock_amr_07|owo_gripstock_amr_08|owo_gripstock_amr_09" },
		stock =         { offset = true, position = vector3_box(0, -0.03, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.25, 1.5, 1.25 ) },
		stockac =       { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.67, 1 ) },
    },
    --  Rear Handle options
    {	dependencies =  { "owo_gripstock_amr_01" },
		--stockac2 =      { offset = true, position = vector3_box(0.5, -0.28, -0.037), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.45, 0.5, 0.6 ) },
        stockac2 =      { offset = false, parent="receiver", position = vector3_box(0.0, -0.07, -0.33), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.6, 0.75, 0.8 ) },
	},
    {	dependencies =  { "owo_gripstock_amr_02" },
		stockac2 =      { offset = false, parent="receiver", position = vector3_box(0.0, -0.07, -0.3), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.6, 0.75, 0.8 ) },
	},
    --  For this rotation, moving (+0, +x, +x) is equal to moving forwards
    {	dependencies =  { "owo_gripstock_amr_03" },
        --stockac2 =      { offset = true, position = vector3_box(0.0, -0.66, -0.047), rotation = vector3_box(-125, 0, 180), scale = vector3_box(0.1, 0.12, 0.15 ) },
		--stockac2 =      { offset = false, position = vector3_box(0.0, -0.66, -0.047), rotation = vector3_box(-125, 0, 180), scale = vector3_box(0.1, 0.12, 0.15 ) },
        stockac2 =      { offset = false, parent="receiver", position = vector3_box(0.0, -1.195, -1.078), rotation = vector3_box(-120, 0, 180), scale = vector3_box(0.1, 0.14, 0.2 ) },
    },
    {	dependencies =  { "owo_gripstock_amr_04|owo_gripstock_amr_07|owo_gripstock_amr_08|owo_gripstock_amr_09" },
		stockac2 =      { offset = false, parent="receiver", position = vector3_box(0.0, 0.037, -0.373), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.25, 0.35, 0.45 ) },
	},
    {	dependencies =  { "owo_gripstock_amr_05|owo_gripstock_amr_06" },
		stockac2 =      { offset = false, parent="receiver", position = vector3_box(0.0, -0.01, -0.373), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.25, 0.35, 0.45 ) },
	},
	

	-- ######
	-- Magazine: FLAT
	-- ######
	{	dependencies =  { "owo_lasgun_magazine_flat_01"},
		magazine =      { offset = true,scale = vector3_box(1, 1, 0.5 ) },
	},
	{	dependencies =  { "owo_autogun_magazine_flat_03"},
		magazine =      { offset = true, scale = vector3_box(1, 1, 0.6 ) },
	},

	-- ######
	-- Magazine: REAR
	-- ######
	{	dependencies = { "owo_lasgun_magazine_rear_01", "owo_gripstock_recon_01|owo_gripstock_recon_02|owo_gripstock_recon_03" },
		magazine = { offset = true, position = vector3_box(.0, .0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.7 ) },
		rearmag = { offset = true, position = vector3_box(.0, -0.255, 0.035), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
	},
	--		Magazine: Rear when there's no recon stock
	{	dependencies = {"owo_lasgun_magazine_rear_01"},
		magazine = { offset = true, position = vector3_box(.0, .0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.7 ) },
		rearmag = { offset = true, position = vector3_box(.0, -0.23, 0.035), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0 ) },
	},

    -- ######
	-- Magazine: Plasma
	-- ######
    {	dependencies =  { "owo_plasma_mag_01|owo_plasma_mag_02|owo_plasma_mag_03|owo_plasma_mag_04|owo_plasma_melta_mag_01" },
        magazine =         { offset = true, position = vector3_box(-0.0, 0.06, -0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
		--magazine =      { offset = true, scale = vector3_box(1, 1, 0.5 ) },
    },
    {	dependencies =  { "owo_plasma_mag_01ss|owo_plasma_mag_02ss|owo_plasma_mag_03ss|owo_plasma_mag_04ss|owo_plasma_melta_mag_01ss" },
        magazine =      { offset = true, scale = vector3_box(1, 1, 0.5 ) },
        owo_magac1 =    { offset = true, position = vector3_box(-0.003, 0.05, -0.085), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 2), },
        --magac =         { offset = false, position = vector3_box(-0.003, 0.05, -0.085), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 2), },
    },

	-- ######
	-- Muzzle: CONDOM
	-- ######
    -- Reserved

    -- ######
	-- Muzzle: Muzzle Brake
	-- ######
    -- MT The long boys
    --  Long Helbores and Longlas
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _long_helbore_barrels.."|longlasgun_barrel_01" },
        muzzle_6 =      { offset = true, position = vector3_box(0, 0.13, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- MT Lasgun Barrels (ALL)
    --  What a fucking mess
    --  Infantry, Helbore, Recon, Laspistol
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _all_infantry_lasgun_barrels.."|".._all_helbore_barrels.."|".._all_recon_lasgun_barrels.."|".._mt_laspistol_barrels },
        muzzle_6 =      { offset = true, position = vector3_box(0, 0.06, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- MT Autopistol
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _mt_autopistol_barrels },
        muzzle_6 =      { offset = true, position = vector3_box(0, -0.02, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
	
	-- ######
	-- Barrel: WOODEN HELBORE
	-- ######
	{	dependencies = {"owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03", },
		barrel = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		barrelshroud = { offset = true, position = vector3_box(0, 0.19, -0.001), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.78, 0.6, 1.188 ) },
	},
	-- Regular Helbore bayonets (barrel parent)
	{   dependencies = {"owo_wood_krieg_01", "autogun_bayonet_01|autogun_bayonet_02" },
		bayonet = { offset = true,   position = vector3_box(0, 0.504, -0.03),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },
	-- 	these barrels are shorter
	{   dependencies = {"owo_wood_krieg_02|owo_wood_krieg_03", "autogun_bayonet_01|autogun_bayonet_02" },
        bayonet = { offset = true,   position = vector3_box(0, 0.428, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },

    -- ######
	-- Barrel: PLASMA HELBORE
	-- ######
    {	dependencies =      { "owo_plasma_krieg_01f|owo_plasma_krieg_02f|owo_plasma_dmr_01|owo_plasma_dmr_01f|owo_plasma_dmr_02|owo_plasma_dmr_02f|owo_plasma_sniper_01|owo_plasma_sniper_02|owo_plasma_sniper_03|owo_plasma_sniper_04|owo_plasma_sniper_05|owo_plasma_sniper_06|owo_plasma_sniper_07|owo_plasma_sniper_08|owo_plasma_sniper_09", },
		barrel =            { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
	},
    {	dependencies =      { "owo_plasma_krieg_01f", },
		barrelshroud =      { offset = true, position = vector3_box(0, 0.242, -0.027), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.0, 1.0, 0.69 ) },
	},
    {	dependencies =      { "owo_plasma_krieg_02f", },
		barrelshroud =      { offset = true, position = vector3_box(0, 0.17, -0.029), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.0, 0.72, 0.69 ) },
	},
    {	dependencies =      { "owo_plasma_dmr_01", },
		barrelshroud =      { offset = true, position = vector3_box(0, 0.032, -0.033), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.95, 0.55, 0.69 ) },
	},
    {	dependencies =      { "owo_plasma_dmr_01f", },
		barrelshroud =      { offset = true, position = vector3_box(0, 0.196, -0.033), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.8, 0.67, 0.69 ) },
	},
    {	dependencies =      { "owo_plasma_dmr_02", },
		barrelshroud =      { offset = true, position = vector3_box(0, 0.034, -0.033), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.72, 0.35, 0.69 ) },
	},
    {	dependencies =      { "owo_plasma_dmr_02f", },
		barrelshroud =      { offset = true, position = vector3_box(0, 0.118, -0.033), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.72, 0.35, 0.69 ) },
	},
    {	dependencies =      { "owo_plasma_sniper_01", },
        barrelshroud =      { offset = true, position = vector3_box(0, 0.032, -0.029), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.83, 0.95, 0.69 ) },
		barrelshroudac =    { offset = true, position = vector3_box(0, 0.084, -0.081), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.49, 0.88 ) },
	},
    {	dependencies =      { "owo_plasma_sniper_02|owo_plasma_sniper_03|owo_plasma_sniper_04|owo_plasma_sniper_05|owo_plasma_sniper_06|owo_plasma_sniper_07|owo_plasma_sniper_08|owo_plasma_sniper_09", },
        barrelshroud =      { offset = true, position = vector3_box(0, 0.336, -0.029), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.83, 1.3, 0.69 ) },
		barrelshroudac =    { offset = true, position = vector3_box(0, 0.202, -0.005), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.42, 1 ) },
	},
	-- Regular Helbore bayonets (barrel parent)
	{   dependencies =      { "owo_plasma_krieg_01f", "autogun_bayonet_01|autogun_bayonet_02" },
		bayonet =           { offset = true,   position = vector3_box(0, 0.504, -0.03),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.1, 1.15, 0.66) },
    },
	-- 	these barrels are shorter
	{   dependencies =      { "owo_plasma_krieg_02f", "autogun_bayonet_01|autogun_bayonet_02", },
        bayonet =           { offset = true,   position = vector3_box(0, 0.428, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },

	-- ######
    -- Bayonet: HISTORICAL PACK
    -- ######
	--  --------------------------------------------
	-- 	M7
	--  --------------------------------------------
	-- 	Helbores
	-- 		Ultra shorty flintlock helbore
	{   dependencies = {"owo_historical_bayonet_m7_01",
			_super_short_helbore_barrels,
		},
		bayonet = { offset = true, position = vector3_box(0, 0.335, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
	},
	--		Medium Helbore barrels, Short bottom
	{   dependencies = {"owo_historical_bayonet_m7_01",
			_medium_short_helbore_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.415, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	-- 		Medium Helbore barrels, medium bottom
	{   dependencies = {"owo_historical_bayonet_m7_01",
			_medium_medium_helbore_barrels.."|owo_wood_krieg_02",
		},
		bayonet = { offset = true, position = vector3_box(0, 0.435, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
	},
	-- 		Long Helbore barrels
	{   dependencies = {"owo_historical_bayonet_m7_01",
			_long_helbore_barrels.."|owo_wood_krieg_01|owo_wood_krieg_03",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.566, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	-- Infantry Lasgun Barrels
	-- 		Short Lasgun
	{   dependencies = {"owo_historical_bayonet_m7_01",
			"barrel_03|ilasgun_barrel_03",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.25, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	--		Medium/Long iLas
	{   dependencies = {"owo_historical_bayonet_m7_01",
			"barrel_01|barrel_02|barrel_04|barrel_05|barrel_06|barrel_07|barrel_08|barrel_21|ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.336, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	-- Recon
	{   dependencies = {"owo_historical_bayonet_m7_01",
			"barrel_14|barrel_15|barrel_16|barrel_17|barrel_18|rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.235, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	--	Default M7
    {   dependencies = {"owo_historical_bayonet_m7_01"},
        bayonet = { offset = true, position = vector3_box(0, 0.47, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	--	M7 Helpers
    {   dependencies = {"owo_historical_bayonet_m7_01"},
        bayonetac1 = { offset = true, position = vector3_box(0, 0.002, -0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        bayonetac2 = { offset = true, position = vector3_box(0, -0.012, -0.002), rotation = vector3_box(0, 90, 180), scale = vector3_box(0.25, 0.825, 0.25) },
    },
	--  --------------------------------------------
	-- 	Seitengewehr 98
	--  --------------------------------------------
	-- 	Helbores
	-- 		Ultra shorty flintlock helbore
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			_super_short_helbore_barrels,
		},
		bayonet = { offset = true, position = vector3_box(0, 0.335, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
	},
	--		Medium Helbore barrels, short bottom
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			_medium_short_helbore_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.415, -0.044), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	-- 		Medium Helbore barrels
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			_medium_medium_helbore_barrels.."|owo_wood_krieg_02",
		},
		bayonet = { offset = true, position = vector3_box(0, 0.435, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
	},
	-- 		Long Helbore barrels
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			_long_helbore_barrels.."|owo_wood_krieg_01|owo_wood_krieg_03",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.47, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	-- 	Infantry Lasgun Barrels
	-- 		Short Lasgun
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			_short_infantry_lasgun_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.25, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	--		Medium/Long iLas
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			_long_infantry_lasgun_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.326, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	-- 	Recon
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			_all_recon_lasgun_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.235, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	-- 	MT Iag
	--		Short
	--			VIAG5 is shorter, but relatively they're the same for bayonet
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			"iagun_barrel_01|iagun_barrel_02|iagun_barrel_04|iagun_barrel_06",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.394, -0.05), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			"iagun_barrel_03",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.47, -0.05), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	{   dependencies = {"owo_historical_bayonet_seitengewehr",
			"iagun_barrel_05",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.408, -0.05), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	-- 	Default
    {   dependencies = {"owo_historical_bayonet_seitengewehr"},
        bayonet = { offset = true, position = vector3_box(0, 0.575, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	--	Seitengewehr Helpers
    {   dependencies = {"owo_historical_bayonet_seitengewehr"},
        bayonetac1 = { offset = true, position = vector3_box(0, 0.002, -0.036), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.46, 0.25) },
        bayonetac2 = { offset = true, position = vector3_box(0, 0, -0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.6, 0.2) },
    },
	--  --------------------------------------------
	-- 	Épée baïonnette modèle 1886 Lebel
	--  --------------------------------------------
	-- 	Helbores
	-- 		Ultra shorty flintlock helbore
	{   dependencies = {"owo_historical_bayonet_epee",
			_super_short_helbore_barrels,
		},
		bayonet = { offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
	},
	--		Medium Helbore barrels, short bottom
	{   dependencies = {"owo_historical_bayonet_epee",
			_medium_short_helbore_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.316, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	-- 		Medium Helbore barrels
	{   dependencies = {"owo_historical_bayonet_epee",
			_medium_medium_helbore_barrels.."|owo_wood_krieg_02",
		},
		bayonet = { offset = true, position = vector3_box(0, 0.368, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
	},
	-- 		Long Helbore barrels
	{   dependencies = {"owo_historical_bayonet_epee",
			_long_helbore_barrels.."|owo_wood_krieg_01|owo_wood_krieg_03",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.462, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	-- 	Infantry Lasgun Barrels
	-- 		Short Lasgun
	{   dependencies = {"owo_historical_bayonet_epee",
			_short_infantry_lasgun_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.146, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	--		Medium/Long iLas
	{   dependencies = {"owo_historical_bayonet_epee",
			_long_infantry_lasgun_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.224, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	-- 	Recon
	{   dependencies = {"owo_historical_bayonet_epee",
			_all_recon_lasgun_barrels,
		},
        bayonet = { offset = true, position = vector3_box(0, 0.12, -0.068), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	-- 	MT Iag
	--		Short
	--			VIAG5 is shorter, but relatively they're the same for bayonet
	{   dependencies = {"owo_historical_bayonet_epee",
			"iagun_barrel_01|iagun_barrel_02|iagun_barrel_04|iagun_barrel_06",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.068, 0.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	{   dependencies = {"owo_historical_bayonet_epee",
			"iagun_barrel_03",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.098, 0.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	{   dependencies = {"owo_historical_bayonet_epee",
			"iagun_barrel_05",
		},
        bayonet = { offset = true, position = vector3_box(0, 0.114, 0.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	--	Default Epee
    {   dependencies = {"owo_historical_bayonet_epee"},
        bayonet = { offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
	--	Epee Helpers
    {   dependencies = {"owo_historical_bayonet_epee"},
        bayonetac1 = { offset = true, position = vector3_box(0, 0.025, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.1, 1.35, 0.6) },
        bayonetac2 = { offset = true, position = vector3_box(0, 0.06, 0.014), rotation = vector3_box(180, 0, 180), scale = vector3_box(0.25, 0.09, 0.245) },
    },
	
	-- ######
	-- Bayonet: UNDERBARREL GRENADE LAUNCHER
	-- ######
	--  --------------------------------------------
	--	M203
	--  --------------------------------------------
    {	dependencies =  { "owo_m203" },
		bayonet =       { offset = true, position = vector3_box(0, 0.36, -0.054), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
	},
	--  --------------------------------------------
	--	GP25
	--  --------------------------------------------
    --[[
	{	dependencies =  { "owo_gp25", _short_infantry_lasgun_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.088, -0.144), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_infantry_lasgun_barrels },
        bayonet =      { offset = true, position = vector3_box(0, -0.0, -0.138), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _all_helbore_barrels },
        bayonet =      { offset = true, position = vector3_box(0, -0.092, -0.142), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _all_recon_lasgun_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.124, -0.152), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --      Patches for MT parts
    {	dependencies =  { "owo_gp25", _short_infantry_autogun_mt_barrels},
        bayonet =      { offset = true, position = vector3_box(0, 0.06, -0.136), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _medium_infantry_autogun_mt_barrels.."|".._long_infantry_autogun_mt_barrels},
        bayonet =      { offset = true, position = vector3_box(0, -0.044, -0.136), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _super_short_braced_autogun_mt_barrels.."|".._short_braced_autogun_mt_barrels },
        bayonet =      { offset = true, position = vector3_box(0, -0.05, -0.106), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_braced_autogun_mt_barrels },
        bayonet =      { offset = true, position = vector3_box(0, -0.204, -0.106), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _short_vigilant_autogun_mt_barrels },
        bayonet =      { offset = true, position = vector3_box(0, -0.13, -0.15), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_vigilant_autogun_mt_barrels },
        bayonet =      { offset = true, position = vector3_box(0, -0.072, -0.148), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_laspistol_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.198, -0.142), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_combat_shotgun_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.414, -0.132), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_autopistol_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.152, -0.152), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", "longlasgun_barrel_01" },
        bayonet =      { offset = true, position = vector3_box(0, 0.022, -0.138), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 0.68, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_twin_stubber_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.634, -0.464), rotation = vector3_box(0, 0, 180), scale = vector3_box(6, 2.4, 6 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_single_stubber_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.326, -0.084), rotation = vector3_box(0, 0, 180), scale = vector3_box(4, 1.2, 4 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_db_shotgun_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.184, -0.084), rotation = vector3_box(0, 0, 180), scale = vector3_box(3, 1.8, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_plasma_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.22, -0.18), rotation = vector3_box(0, 0, 180), scale = vector3_box(2.2, 1.2, 2.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_flamer_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.218, -0.208), rotation = vector3_box(0, 0, 180), scale = vector3_box(2.3, 1.2, 2.15 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_bolter_barrels },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.056), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_backwards_bolter_barrels },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.056), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_ripper_barrels },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.06, 0.03), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.06, 0.038), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 0.566, 0.39 ) },
    },
    --      Patches for Syn's parts
    {	dependencies =  { "owo_gp25", "exitus_barrel_01" },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.65, -0.07), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --{	dependencies =  { "owo_gp25", _syn_helbore_sniper_barrels },
    --    bayonet =      { offset = true, position = vector3_box(0, 0.116, -0.476), rotation = vector3_box(0, 0, 180), scale = vector3_box(3.3, 1.5, 3.3 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_carry_sniper_barrels },
    --    bayonet =      { offset = true, position = vector3_box(0, 0.116, -0.488), rotation = vector3_box(0, 0, 180), scale = vector3_box(3.3, 1.5, 3.3 ) },
    --},
    {	dependencies =  { "owo_gp25", "ilasgun_double_barrel_01" },
        bayonet =      { offset = true, position = vector3_box(0, -0.0, -0.142), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", "ilasgun_triple_barrel_01" },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.464, -0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_hellgun_barrels },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.352, -0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_heavy_barrels },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.038), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --{	dependencies =  { "owo_gp25", _syn_m41a_barrels },
    --    bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    {	dependencies =  { "owo_gp25", _syn_carbine_barrels },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
        flashlight =    { offset = true, position = vector3_box(0.033, 0.568, 0.062), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    --{	dependencies =  { "owo_gp25", _syn_thompson_barrels },
    --    bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.066), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    --{	dependencies =  { "owo_gp25", "syn_daewook11_barrel_01" },
    --    bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.08), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_rotary_barrels },
    --    bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_q3_barrels },
    --    bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.046), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_pulse_barrels },
    --    bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.094), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    {	dependencies =  { "owo_gp25", _syn_aquilon_barrels },
        bayonet =      { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.038), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_canis_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.464, -0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_gauss_barrels },
        bayonet =      { offset = true, position = vector3_box(0, 0.5, -0.056), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    ]]
    --	GP25 Default
	{	dependencies = { "owo_gp25" },
        bayonet =      { offset = true, position = vector3_box(0, -0.072, -0.112), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
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
    --      Default
    -- 
    --  --------------------------------------------
    --  M26-MASS
    --  --------------------------------------------
    --  M26-MASS Default
    {	dependencies = { "owo_underbarrel_shotgun_m26mass" },
        -- Receiver
        bayonet =      { offset = true, position = vector3_box(0, 0.25, -0.098), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },

	-- ######
	-- Sight: REAR APERTURE SIGHTS
	-- ######
	--  --------------------------------------------
	-- 	U notch ladder sights
	--  --------------------------------------------
	{	dependencies = {"owo_rear_sight_01",},
		no_scope_offset =   { offset = true, position = vector3_box(0, 0, -0.01), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { offset = true, position = vector3_box(0, 0, -0.01), rotation = vector3_box(0, 0, 0)},
		sight = { offset = true, position = vector3_box(0, 0.012, 0.117), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
	},
	--	ladder up
	{	dependencies = {"owo_rear_sight_02",},
		no_scope_offset =   { offset = true, position = vector3_box(0, 0, -0.02), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { offset = true, position = vector3_box(0, 0, -0.02), rotation = vector3_box(0, 0, 0)},
		sight = { offset = true, position = vector3_box(0, 0.012, 0.117), rotation = vector3_box(-45, 90, 135), scale = vector3_box(0.23, 0.5, 0.1 ) },
	},
	{	dependencies = {"owo_rear_sight_01|owo_rear_sight_02",},
		sightac1 = { offset = true, position = vector3_box(0, 0.044, -0.086), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.05, 0.3, 0.1 ) },
		sightac2 = { offset = true, position = vector3_box(0, 0.044, 0.094), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.05, 0.3, 0.1 ) },
		sightac3 = { offset = true, position = vector3_box(-0.012, 0.012, -0.088), rotation = vector3_box(0, 90, -90), scale = vector3_box(0.55, 0.7, 0.42 ) },
		sightac4 = { offset = true, position = vector3_box(-0.012, 0.012, 0.088), rotation = vector3_box(0, 90, 90), scale = vector3_box(0.55, 0.7, 0.42 ) },
	},
	--  --------------------------------------------
	-- 	MAS49 irons
	--  --------------------------------------------
	{	dependencies = {"owo_rear_sight_o_00|owo_rear_sight_o_01|owo_rear_sight_o_02|owo_rear_sight_o_03",},
		no_scope_offset =   { offset = true, position = vector3_box(0, 0, -0.0062), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { offset = true, position = vector3_box(0, 0, -0.0062), rotation = vector3_box(0, 0, 0)},
		sight = { offset = true, position = vector3_box(0, 0.004, 0.1158), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
		sightac1 = { offset = true, position = vector3_box(-0.044, 0.006, 0.002), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.1, 1.8 ) },
	},
	{	dependencies = {"owo_rear_sight_o_00|owo_rear_sight_o_03",},
		sightac5 = { offset = true, position = vector3_box(0, -0.042, 0.1), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.42, 1.11 ) },
		--sightac6 = {position = vector3_box(0, 0, 0.04), hide_mesh = {	{"sightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
	},
	{	dependencies = {"owo_rear_sight_o_01|owo_rear_sight_o_02",},
		sightac5 = { offset = true, position = vector3_box(0.012, -0.042, 0.232), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.44, 1.85, 2.82 ) },
		sightac6 = { offset = true, position = vector3_box(-0.022, -0.028, -0.072), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.08, 0.042, 0.24 ) },
	},
	{	dependencies = {"owo_rear_sight_o_00|owo_rear_sight_o_01",},
		sightac2 = { offset = true, position = vector3_box(-0.044, 0.006, 0.002), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.1, 1.8 ) },
		sightac3 = { offset = true, position = vector3_box(-0.012, 0.012, -0.088), rotation = vector3_box(0, 90, -90), scale = vector3_box(0.55, 0.7, 0.3 ) },
		sightac4 = { offset = true, position = vector3_box(-0.012, 0.012, 0.088), rotation = vector3_box(0, 90, 90), scale = vector3_box(0.55, 0.7, 0.3 ) },
	},
	--	MAS49/56
	{	dependencies = {"owo_rear_sight_o_02|owo_rear_sight_o_03",},
		--sightac2 = {position = vector3_box(0, 0, 0.04), hide_mesh = {	{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
		sightac3 = { offset = true, position = vector3_box(-0.026, 0.002, 0.054), rotation = vector3_box(0, 0, -90), scale = vector3_box(1.35, 0.23, 0.66 ) },
		sightac4 = { offset = true, position = vector3_box(-0.026, 0.002, -0.054), rotation = vector3_box(180, 0, -90), scale = vector3_box(1.35, 0.23, 0.66 ) },
	},
	
	-- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
	--  --------------------------------------------
    -- 	EOTech
	--  --------------------------------------------
	--  Patch to hide alt viewmodel sights
	{   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_no_magnifier_eotech_sights },
        sight =             { offset = true, position = vector3_box(0, 0.03, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0373), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    --          Using pommel as base
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_aligned_eotech_sights },
        sight =             { offset = true, position = vector3_box(0, 0.1, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0373), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --          Using sight as base
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_side_eotech_sights },
        sight =             { offset = true, position = vector3_box(0, 0.1, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0373), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  --------------------------------------------
    --  Vortex Razor
    --  --------------------------------------------
    --  Patch for alt sights
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Sight Alignment
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_no_magnifier_vortex_sights },
        sight =             { offset = true, position = vector3_box(0, 0.06, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0373), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Magnifier moves sight forwards
    --          Using sight as base
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_magnifier_side_vortex_sights },
        sight =             { offset = true, position = vector3_box(0, 0.11, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0373), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --          Using pommel as base
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_magnifier_aligned_vortex_sights },
        sight =             { offset = true, position = vector3_box(0, 0.11, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0373), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

	-- ######
    -- Sight: Prismatic Sights (Telescopic)
    -- ######
	--  --------------------------------------------
    -- 	Trijicon ACOG
	--  --------------------------------------------
    --  Patch to hide alt viewmodel sights
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_sight_2s, },
        sight_2 =           { offset = false, parent = "sight", position = vector3_box(0, -0.04, 0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --      Aiming with RMR on ACOG
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.1175), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.1175), rotation = vector3_box(0, 0, 0), },
    },
	{   dependencies =      { _owo_backwards_acog_sights, },
        sight =             { offset = true, position = vector3_box(0, 0.078, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
		scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0435), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
	{   dependencies =      { _owo_forwards_acog_sights, },
        sight =             { offset = true, position = vector3_box(0, 0.1, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
		scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0435), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
	--  --------------------------------------------
    --  SUSAT
	--  --------------------------------------------
    --      Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.1035), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.1035), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { _owo_all_susat_sights, },
        sight =             { offset = true, position = vector3_box(0, 0.01, 0.160), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0405), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

	-- ######
	-- Sight: CLASSIC TELESCOPIC SIGHTS
	-- ######
	{	dependencies =      {"owo_pu_scope_01|owo_pu_scope_02",},
		sight =             { offset = true, position = vector3_box(0, -0.002, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
		-- Aligning to Crosshair
        --no_scope_offset =   { offset = true, position = vector3_box(0, -0.002, -0.0467), rotation = vector3_box(0, 0, 0), lense_transparency = true },
		scope_offset =      { offset = true, position = vector3_box(0, -0.002, -0.0467), rotation = vector3_box(0, 0, 0), lense_transparency = true },
	},
})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)