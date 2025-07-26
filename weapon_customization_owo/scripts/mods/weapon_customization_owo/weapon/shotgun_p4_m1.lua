local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "shotgun_p4_m1" -- Exterminator Shotgun
local _hide_slot_table = mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/common/hide_slot")

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
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
    --"sight_2",
    --"sightac2",
    --"sightac3",
    --"sightac4",

    --"stockac",
    --"stockac2",

    --"muzzle_2",
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
    "foregrip",
    "foregripac1",
    "foregripac2",
    "foregripac3",

    "sightac1",
    "sightac5",
    "sightac6",
    "sightac7",
    "sight_secondary",
    "sight_secondary_ac1",
    "sight_secondary_ac2",

    --"stock_2",

    "muzzle_3",

    "sight_2",
    "sightac2",
    "sightac3",
    "sightac4",

    "stockac",
    "stockac2",

    "muzzle_2",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
-- mt plugin sight_2
mod.mt.reflex_scopehelper(this_variant)
mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)
mod.owo_holosight(this_variant, "sight", "rail")
mod.owo_prismatic_sight(this_variant, "sight", "rail")

mod.owo_invisible_muzzle(this_variant)
mod.owo_suppressor(this_variant)

--mod.owo_empty_foregrip(this_variant)
mod.owo_tactical_foregrip(this_variant, "foregrip", "underbarrel")
mod.owo_heterosexual_foregrip(this_variant, "foregrip", "underbarrel")

--mod.owo_heterosexual_foregrip(this_variant, "stock") -- Reusing my foregrips list as the regular stock/grip
--mod.owo_tactical_stock(this_variant, "stock_2")
--mod.owo_beeg_stock(this_variant, "stock_2")

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
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"
-- ########
-- For This Variant Only
-- ########
local _syn_short_shotgun_barrels = "short_shot_barrel_01|short_shot_barrel_02|short_shot_barrel_03|short_shot_barrel_04|short_shot_barrel_07|short_shot_barrel_08|short_shot_barrel_09|short_shot_barrel_10"
--local _owo_basic_beeg_stocks = "owo_beeg_stock_01|owo_beeg_stock_02|owo_beeg_stock_03|owo_beeg_stock_04|owo_beeg_stock_05"
local _owo_iag_beeg_stocks = "owo_beeg_stock_iag_01|owo_beeg_stock_iag_02|owo_beeg_stock_iag_03|owo_beeg_stock_iag_04|owo_beeg_stock_iag_05"
local _owo_bag_beeg_stocks = "owo_beeg_stock_bag_01|owo_beeg_stock_bag_02|owo_beeg_stock_bag_03|owo_beeg_stock_bag_04|owo_beeg_stock_bag_05|owo_beeg_stock_bag_06|owo_beeg_stock_bag_07|owo_beeg_stock_bag_08"
local _owo_sg_beeg_stocks = "owo_beeg_stock_sg_01|owo_beeg_stock_sg_02|owo_beeg_stock_sg_03|owo_beeg_stock_sg_04|owo_beeg_stock_sg_05|owo_beeg_stock_sg_06|owo_beeg_stock_sg_07|owo_beeg_stock_sg_08"
local _owo_las_beeg_stocks = "owo_beeg_stock_las_01|owo_beeg_stock_las_02|owo_beeg_stock_las_03|owo_beeg_stock_las_04"
local _owo_h_beeg_stocks = "owo_beeg_stock_h_01|owo_beeg_stock_h_02|owo_beeg_stock_h_03"
local _owo_all_beeg_stocks = "owo_beeg_stockac_01"
-- What a fucking mess
local _owo_grip_grip_straight_grips = "owo_heterosexual_foregrip_grip_01|owo_heterosexual_foregrip_grip_02|owo_heterosexual_foregrip_grip_03|owo_heterosexual_foregrip_grip_04|owo_heterosexual_foregrip_grip_05|owo_heterosexual_foregrip_grip_06|owo_heterosexual_foregrip_grip_07|owo_heterosexual_foregrip_grip_08|owo_heterosexual_foregrip_grip_09|owo_heterosexual_foregrip_grip_10|owo_heterosexual_foregrip_grip_11|owo_heterosexual_foregrip_grip_12|owo_heterosexual_foregrip_grip_13|owo_heterosexual_foregrip_grip_14|owo_heterosexual_foregrip_grip_15|owo_heterosexual_foregrip_grip_16|owo_heterosexual_foregrip_grip_17|owo_heterosexual_foregrip_grip_18|owo_heterosexual_foregrip_grip_19|owo_heterosexual_foregrip_grip_20|owo_heterosexual_foregrip_grip_21|owo_heterosexual_foregrip_grip_22|owo_heterosexual_foregrip_grip_23|owo_heterosexual_foregrip_grip_24|owo_heterosexual_foregrip_grip_25|owo_heterosexual_foregrip_grip_26|owo_heterosexual_foregrip_grip_27|owo_heterosexual_foregrip_grip_28|owo_heterosexual_foregrip_grip_29"

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
mod.fixes_owo_holosight(this_variant, "sight", "receiver")
mod.fixes_owo_prismatic_sight(this_variant, "sight", "receiver")
mod.fixes_owo_suppressors(this_variant)
--mod.fixes_owo_tactical_stock(this_variant, "stock_2")

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Muzzle: Suppressors
    -- ######
    -- Handled universally

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
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_no_magnifier_eotech_sights },
        rail =              { offset = true, position = vector3_box(-0.032, 0.05, 0.14), rotation = vector3_box(0, -45, 0), scale = vector3_box(1, 1, 1) },
        sight =             { offset = true, position = vector3_box(0, 0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        -- to aim with, but the shell rack (top) doesn't rotate
        no_scope_offset =   { offset = true, position = vector3_box(-0.065, -0.01, 0.105), rotation = vector3_box(-5, 0, -7), lense_transparency = true },
        scope_offset =      { offset = true, position = vector3_box(-0.065, -0.01, 0.105), rotation = vector3_box(-5, 0, -7), lense_transparency = true },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_aligned_eotech_sights },
        rail =              { offset = true, position = vector3_box(-0.032, 0.05, 0.14), rotation = vector3_box(0, -45, 0), scale = vector3_box(1, 1, 1) },
        sight =             { offset = true, position = vector3_box(0, 0.11, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0.0005, -0.0, -0.0165), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_side_eotech_sights },
        rail =              { offset = true, position = vector3_box(-0.032, 0.05, 0.14), rotation = vector3_box(0, -45, 0), scale = vector3_box(1, 1, 1) },
        sight =             { offset = true, position = vector3_box(0, 0.11, 0.136), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0.0005, -0.0, -0.0165), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  --------------------------------------------
    --  Vortex Razor
    --  --------------------------------------------
    --  Patch for alt sights
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_no_magnifier_vortex_sights, },
        rail =              { offset = true, position = vector3_box(-0.032, 0.05, 0.14), rotation = vector3_box(0, -45, 0), scale = vector3_box(1, 1, 1) },
        sight =             { offset = true, position = vector3_box(0, 0.042, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.022), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  Magnifier moves sight forwards
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_magnifier_vortex_sights, },
        rail =              { offset = true, position = vector3_box(-0.032, 0.05, 0.14), rotation = vector3_box(0, -45, 0), scale = vector3_box(1, 1, 1) },
        sight =             { offset = true, position = vector3_box(0, 0.11, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.022), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

    -- ######
    -- Sight: Prismatic Sights (Telescopic)
    -- ######
    --  --------------------------------------------
    --  Trijicon ACOG
    --  --------------------------------------------
    --  Patch to hide alt viewmodel sights
    {   dependencies =      { "owo_sight_group_indicator_prismatic_sight_acog", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.046, 0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  RMR Aim
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.100), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0004, 0.0, -0.0990), rotation = vector3_box(0, 0, 0), },
    },
    --  Main sight
    {   dependencies =      { "owo_sight_group_indicator_prismatic_sight_acog", _owo_forwards_acog_sights },
        rail =              { offset = true, position = vector3_box(-0.032, 0.05, 0.14), rotation = vector3_box(0, -45, 0), scale = vector3_box(1, 1, 1) },
        sight =             { offset = true, position = vector3_box(0, 0.124, 0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0237), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_sight_group_indicator_prismatic_sight_acog", _owo_backwards_acog_sights },
        rail =              { offset = true, position = vector3_box(-0.032, 0.05, 0.14), rotation = vector3_box(0, -45, 0), scale = vector3_box(1, 1, 1) },
        sight =             { offset = true, position = vector3_box(0, 0.052, 0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0237), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  --------------------------------------------
    --  SUSAT
    --  --------------------------------------------
    --  Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.0, -0.0872), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.0, -0.084), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { _owo_all_susat_sights, },
        rail =              { offset = true, position = vector3_box(-0.032, 0.05, 0.14), rotation = vector3_box(0, -45, 0), scale = vector3_box(1, 1, 1) },
        sight =             { offset = true, position = vector3_box(0, -0.032, 0.052), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0.0005, 0.0, -0.020), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

    -- ######
    -- Foregrip: Tactical Foregrip
    -- Attaching to underbarrel, so it moves when you pump
    -- ######
    -- skeletal shotgun
    {   dependencies =  { "owo_tactical_foregrip_01" },
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.161, 0.023),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 0.8, 1.0) },
    },
    -- skeletal shotgun (slant)
    {   dependencies =  { "owo_tactical_foregrip_02" },
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.10, 0.045),   rotation = vector3_box(15, 0, 0),    scale = vector3_box(1.2, 0.6, 0.7) },
    },
    -- skeletal brauto (slant)
    {   dependencies =  { "owo_tactical_foregrip_03" },
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.151, 0.06),   rotation = vector3_box(10, 0, 0),    scale = vector3_box(0.8, 1.0, 0.8) },
    },
    -- magpul afg triple threat
    {   dependencies =  { "owo_tactical_foregrip_04" },
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0.0, 0.045, 0.035),   rotation = vector3_box(-67, 0, -180),    scale = vector3_box(0.85, 0.37, 0.74) },
        foregripac1 =   { offset = true, parent_node = 1, position = vector3_box(0.002, -0.024, -0.053),   rotation = vector3_box(0, 90, -40),    scale = vector3_box(0.5, 0.45, 0.2) },
        foregripac2 =   { offset = true, parent_node = 1, position = vector3_box(-0.002, -0.024, -0.053),   rotation = vector3_box(-40, -90, 0),    scale = vector3_box(0.5, 0.45, 0.2) },
        foregripac3 =   { offset = true, parent_node = 1, position = vector3_box(0, 0.0, -0.004),   rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.5, 0.45, 0.2) },
    },

    -- ######
    -- Foregrip: Straight Grip
    -- Foregrips attach to underbarrel so it can move when pumped
    -- Grip (proper) is the parent of everything, so that'll take some more tinkering
    -- ######
    --  No stock_2
    --      reconstocknone is the None option added by syn
    --{   dependencies =  { "reconstocknone|owo_stock_02_empty", _owo_grip_grip_straight_grips },
    --    stock =         { offset = true,   position = vector3_box(0, 0.07, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
    --},
    --  Syn's Short Shotgun Barrels
    --      Ogryn handles
    --          "owo_heterosexual_foregrip_01|owo_heterosexual_foregrip_02|owo_heterosexual_foregrip_03|owo_heterosexual_foregrip_04|owo_heterosexual_foregrip_05|owo_heterosexual_foregrip_06|owo_heterosexual_foregrip_07|owo_heterosexual_foregrip_08",
    --{   dependencies =  { "owo_foregrip_group_indicator_heterosexual_ogryn_grip", _syn_short_shotgun_barrels, },
    --    foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.45, 0.3) },
    --},
    --      Dclaw
    --          "owo_heterosexual_foregrip_09|owo_heterosexual_foregrip_10|owo_heterosexual_foregrip_11|owo_heterosexual_foregrip_12|owo_heterosexual_foregrip_13|owo_heterosexual_foregrip_14",
    --{   dependencies =  { "owo_foregrip_group_indicator_heterosexual_dclaw_grip", _syn_short_shotgun_barrels, },
    --    foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.9, 0.45) },
    --},
    --      Knife
    --{   dependencies =  { "owo_foregrip_group_indicator_heterosexual_knife_grip", _syn_short_shotgun_barrels, "owo_heterosexual_foregrip_knife_01|owo_heterosexual_foregrip_knife_02|owo_heterosexual_foregrip_knife_03|owo_heterosexual_foregrip_knife_04|owo_heterosexual_foregrip_knife_05|owo_heterosexual_foregrip_knife_06"},
    --    foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1.5, 1) },
    --},
    --{   dependencies =  { "owo_heterosexual_foregrip_knife_06_fat", _syn_short_shotgun_barrels, },
    --    foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1.5, 1) },
    --},
    --{   dependencies =  { "owo_foregrip_group_indicator_heterosexual_knife_grip", _syn_short_shotgun_barrels, "owo_heterosexual_foregrip_knife_01s|owo_heterosexual_foregrip_knife_02s|owo_heterosexual_foregrip_knife_03s|owo_heterosexual_foregrip_knife_04s|owo_heterosexual_foregrip_knife_05s|owo_heterosexual_foregrip_knife_06s"},
    --    foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1.5, 0.5) },
    --},
    --{   dependencies =  { "owo_heterosexual_foregrip_knife_06s_fat", _syn_short_shotgun_barrels, },
    --    foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1.5, 0.5) },
    --},
    --      Grip grips
    --          _owo_grip_grip_straight_grips
    --{   dependencies =  { "owo_foregrip_group_indicator_heterosexual_gun_grip", _syn_short_shotgun_barrels, },
    --    foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.09, 0.07),   rotation = vector3_box(30, 0, 0),    scale = vector3_box(1, 1.2, 1) },
    --},
    --  Default
    --      Ogryn handles
    {   dependencies =  { "owo_foregrip_group_indicator_heterosexual_ogryn_grip", },
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.3, 0.3) },
       -- stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.45, 0.3, 0.3) },
    },
    --      Dclaw
    {   dependencies =  { "owo_foregrip_group_indicator_heterosexual_dclaw_grip", },
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.6, 0.45) },
       -- stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.1, 0.6, 0.45) },
    },
    --      Knife
    {   dependencies =  { "owo_foregrip_group_indicator_heterosexual_knife_grip", "owo_heterosexual_foregrip_knife_01|owo_heterosexual_foregrip_knife_02|owo_heterosexual_foregrip_knife_03|owo_heterosexual_foregrip_knife_04|owo_heterosexual_foregrip_knife_05|owo_heterosexual_foregrip_knife_06"},
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
      -- stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_06_fat"},
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
       -- stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.25, 1, 1) },
    },
    {   dependencies =  { "owo_foregrip_group_indicator_heterosexual_knife_grip", "owo_heterosexual_foregrip_knife_01s|owo_heterosexual_foregrip_knife_02s|owo_heterosexual_foregrip_knife_03s|owo_heterosexual_foregrip_knife_04s|owo_heterosexual_foregrip_knife_05s|owo_heterosexual_foregrip_knife_06s"},
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 0.5) },
       -- stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 0.5) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_06s_fat"},
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 0.5) },
       -- stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.25, 1, 0.5) },
    },
    --      Grip grips
    {   dependencies =  { "owo_foregrip_group_indicator_heterosexual_gun_grip", },
        foregrip =      { offset = true, parent_node = 1, position = vector3_box(0, 0.04, 0.06),   rotation = vector3_box(30, 0, 0),    scale = vector3_box(1, 1, 1) },
       -- stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
    },

    -- ######
    -- Stock_2: Beeg Stocks
    -- ######
    --{   dependencies =  { _owo_basic_beeg_stocks },
    --    --stock_2 =       { position = vector3_box(0.0, -0.146, -0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    --    stock_2 =       { offset = false, parent = "receiver", parent_node = 2, position = vector3_box(-0.03, -0.064, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.75, 1.5, 1 ) },
    --},
    --{   dependencies =  { _owo_basic_bigga_stocks },
    --    stock_2 =       { offset = false, parent = "receiver", parent_node = 2, position = vector3_box(0.0, -0.208, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.75, 1.35 ) },
    --},
    --  _owo_all_beeg_stocks
   -- {   dependencies =  { "owo_stock_group_indicator_beeg", },
   --     stock_2 =       { offset = true, position = vector3_box(0.0, 0.020, 0.045), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1.5, 1.2 ) },
   -- },

    -- ######
    -- Stock_2: Tactical Stocks
    -- ######
    --  Folded
   -- {   dependencies =  { "owo_stock_group_indicator_ac2_tactical_stock_folded", "owo_tactical_stock_01|owo_tactical_stock_02|owo_tactical_stock_03|owo_tactical_stock_04|owo_tactical_stock_05|owo_tactical_stock_06|owo_tactical_stock_07|owo_tactical_stock_08" },
   --     stock_2 =       { position = vector3_box(0.054, -0.044, 0.048), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
   --     stockac =       { position = vector3_box(-0.0037, -0.014, 0.049), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.45, 0.3 )}
   -- },
   -- --  Folded (Left)
   -- {   dependencies =  { "owo_stock_group_indicator_ac2_tactical_stock_folded_left", "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
   --     stock_2 =       { position = vector3_box(-0.05, -0.076, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
   --     stockac =       { position = vector3_box(0.0023, -0.036, 0.031), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 0.45, 0.3 )}
   -- },
   -- --  Natural (Under)
   -- {   dependencies =  { "owo_tactical_stock_f_03u" },
   --     stock_2 =       { position = vector3_box(0.0, -0.112, 0.0625), rotation = vector3_box(174, 0, 0), scale = vector3_box(2.52, 1.45, 1 ) },
   -- },
    --  Rest are handled universally
})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)