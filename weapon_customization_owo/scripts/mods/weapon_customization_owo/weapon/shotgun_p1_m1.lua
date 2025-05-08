local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "shotgun_p1_m1" -- Combat Shotgun

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
if not mod.syn then
    mod.wc.attachment[this_variant].sight_2 = {}
    mod.wc.attachment[this_variant].sightac2 = {}
    mod.wc.attachment[this_variant].sightac3 = {}
    mod.wc.attachment[this_variant].sightac4 = {}

    -- Inject empty stock_2 for default
    mod.wc.attachment[this_variant].stock_2 = {}
    mod.inject_attachments_owo(this_variant, "stock_2", { {id = "owo_stock_02_empty", name = "None"}, })
    mod.inject_models(this_variant, { owo_stock_02_empty = { model = "", type = "stock_2", parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_00", }, }, })
    mod.wc.attachment[this_variant].stockac = {}

    mod.wc.attachment[this_variant].shotgun_p1_m1.muzzle_2 = {}
end
mod.wc.attachment[this_variant].foregrip = {}
mod.wc.attachment[this_variant].foregripac1 = {}
mod.wc.attachment[this_variant].foregripac2 = {}
mod.wc.attachment[this_variant].foregripac3 = {}

mod.wc.attachment[this_variant].sightac1 = {}
mod.wc.attachment[this_variant].sightac5 = {}
mod.wc.attachment[this_variant].sightac6 = {}
mod.wc.attachment[this_variant].sightac7 = {}
mod.wc.attachment[this_variant].sight_secondary = {}
mod.wc.attachment[this_variant].sight_secondary_ac1 = {}
mod.wc.attachment[this_variant].sight_secondary_ac2 = {}

mod.wc.attachment[this_variant].muzzle_3 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)
mod.owo_holosight(this_variant, "sight")
mod.owo_telescopic_sight(this_variant, "sight")

mod.owo_suppressor(this_variant)

mod.owo_empty_foregrip(this_variant)
mod.owo_tactical_foregrip(this_variant, "foregrip")
mod.owo_heterosexual_foregrip(this_variant, "foregrip")

mod.owo_heterosexual_foregrip(this_variant, "stock") -- Reusing my foregrips list as the regular stock/grip
mod.owo_tactical_stock(this_variant, "stock_2")
mod.owo_beeg_stock(this_variant, "stock_2")

-- ############################################
-- Inject Fixes
-- ############################################
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


mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  -------------------------------------------
    --  EOTech
    --  -------------------------------------------
    --      Short Variant
    {   dependencies =  { _owo_short_eotech_sights },
        sightac1 =      { offset = true, position = vector3_box(0.00, 0.018, 0.018), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.366, 0.256) },
        sightac2 =      { offset = true, position = vector3_box(0.00, 0.018, 0.018), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.366, 0.256) },
    },
    --  Sight Helpers
    {   dependencies =  { _owo_all_eotech_sights },
        sightac1 =      { offset = true, position = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac2 =      { offset = true, position = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =      { offset = true, position = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
        rail =          { offset = true, position = vector3_box(0, 0.034, 0.048), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.8), automatic_equip = { rail = "rail_01"}, },
    },
    --  Main Sight body
    --      Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =  { _owo_no_magnifier_eotech_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =  { _owo_no_magnifier_eotech_sights },
        sight =         { offset = true, position = vector3_box(0, 0.066, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =      { _owo_magnifier_eotech_sights, _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =      { _owo_magnifier_eotech_sights },
        sight =             { offset = true, position = vector3_box(0, 0.13, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
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
    {   dependencies =  { _owo_all_vortex_sights, _owo_sight_2s, },
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
        sight =         { offset = true, position = vector3_box(0, 0.17, 0.14), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sight_secondary =         { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    {   dependencies =  { _owo_all_vortex_sights },
        sight =         { offset = true, position = vector3_box(0, 0.098, 0.14), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.004), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.032, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.05, 0.666, 0.884) },
        sightac4 =      { offset = true, position = vector3_box(0, -0.002, 0.002), rotation = vector3_box(90, -90, 180), scale = vector3_box(0.98, 0.24, 0.16) },
        rail =          { offset = true, position = vector3_box(0, 0.034, 0.048), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.8), automatic_equip = { rail = "rail_01"}, },
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
    {   dependencies =      { _owo_all_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.022), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --[[{   dependencies =      { _owo_no_magnifier_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.022), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.022), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.022), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },]]
    -- EOTech
    {   dependencies =      { _owo_all_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0.0005, -0.0, -0.0165), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --[[{   dependencies =      { _owo_no_magnifier_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0.0005, -0.0, -0.0165), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0.0005, -0.0, -0.0165), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0.0005, -0.0, -0.0165), rotation = vector3_box(0, 0, 0) },
    },]]

    -- ######
    -- Sight: Telescopic Sights
    -- ######
    --  -------------------------------------------
    --  Trijicon ACOG
    --  -------------------------------------------
    --  ACOG only
    --      Main sight and reticle
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =  { _owo_forwards_acog_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =  { _owo_forwards_acog_sights },
        sight =         { offset = true, position = vector3_box(0, 0.202, 0.142), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { offset = true, position = vector3_box(0, -0.046, 0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Main sight and reticle (backwards)
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =  { _owo_backwards_acog_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =  { _owo_backwards_acog_sights },
        sight =         { offset = true, position = vector3_box(0, 0.114, 0.142), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { offset = true, position = vector3_box(0, -0.046, 0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Sight Helpers
    {   dependencies =  { _owo_all_acog_sights },
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
        -- Lenses are the same for forwards and backwards
        lens =          { offset = false, parent = "sight", position = vector3_box(0, 0.026, 0.0345), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =        { offset = false, parent = "sight", position = vector3_box(0, -0.098, 0.0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    --  ACOG with RMR on top
    {   dependencies =      { "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  SUSAT
    --  -------------------------------------------
    {   dependencies =  { "owo_susat_01|owo_susat_01_ps|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight =         { offset = true, position = vector3_box(0, 0.036, 0.172), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
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
        -- Lenses
        lens =          { offset = false, parent = "sightac7", position = vector3_box(0, 0.096, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.3, 0.85), data = {lens = 1}},
	    lens_2 =        { offset = false, parent = "sightac7", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    -- SUSAT with red dot
    {   dependencies =      { "owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight_secondary =   { offset = true, position = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    --  Aiming with main sight
    --      ACOG
    {   dependencies =      { _owo_forwards_acog_sights },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0237), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      ACOG Backwards
    {   dependencies =      { _owo_backwards_acog_sights },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0237), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      SUSAT
    {   dependencies =      { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1", },
        scope_offset =      { offset = true, position = vector3_box(0.0005, 0.0, -0.020), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  Aiming with RMR on ACOG
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        --scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.100), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0004, 0.0, -0.0990), rotation = vector3_box(0, 0, 0), },
    },
    --  Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        --scope_offset =      { offset = true, position = vector3_box(0.0002, 0.0, -0.0872), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.0, -0.084), rotation = vector3_box(0, 0, 0), },
    },

    -- ######
	-- Muzzle: SUPPRESSOR
	-- ######
    --  -------------------------------------------
    --  Double cans
    --  -------------------------------------------
    --  The one shotgun barrel that's longer for WHATEVER FUCKING REASON
    {	dependencies =  { "owo_suppressor_01", "barrel_02"},
        muzzle =        { offset = true,   position = vector3_box(0, 0.69, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
        muzzle_2 =      { offset = true,   position = vector3_box(0, 0.69, 0),    rotation = vector3_box(0, 22, 0),   scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies =  { "owo_suppressor_02", "barrel_02"},
        muzzle =        { offset = true,   position = vector3_box(0, 0.69, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
        muzzle_2 =      { offset = true,   position = vector3_box(0, 0.69, 0),    rotation = vector3_box(0, 17, 0),   scale = vector3_box(1.2, 1.8, 1.2) }
    },
    --  Base Case
    {	dependencies =  { "owo_suppressor_01" },
        muzzle =        { offset = true,   position = vector3_box(0, 0.466, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
        muzzle_2 =      { offset = true,   position = vector3_box(0, 0.466, 0),    rotation = vector3_box(0, 22, 0),   scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies =  { "owo_suppressor_02" },
        muzzle =        { offset = true,   position = vector3_box(0, 0.466, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
        muzzle_2 =      { offset = true,   position = vector3_box(0, 0.466, 0),    rotation = vector3_box(0, 17, 0),   scale = vector3_box(1.2, 1.8, 1.2) }
    },
    -- The skinny bayonet. Sits on muzzle
    {	dependencies =  { "owo_suppressor_01|owo_suppressor_02", "autogun_bayonet_03" },
        bayonet =       { offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85) },
    },
    --  -------------------------------------------
    --  PBS-1
    --  -------------------------------------------
    --[[
    -- Braced Autogun barrels
    --  super short
    {   dependencies =  { _super_short_braced_autogun_all_barrels, "owo_suppressor_03" },
        muzzle =        { offset = true,    position = vector3_box(0, 0.52, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
        muzzle_2 =      { offset = true,    position = vector3_box(0, 0.38, 0),   rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
    },
    --  short
    {   dependencies =  { _short_braced_autogun_all_barrels, "owo_suppressor_03" },
        muzzle =        { offset = true,    position = vector3_box(0, 0.63, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
        muzzle_2 =      { offset = true,    position = vector3_box(0, 0.43, 0),   rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
    },
    --  long
    {   dependencies =  { _long_braced_autogun_all_barrels, "owo_suppressor_03" },
        muzzle =        { offset = true,    position = vector3_box(0, 0.83, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
        muzzle_2 =      { offset = true,    position = vector3_box(0, 0.63, 0),   rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
    },
    ]]
    {	dependencies =  { "owo_suppressor_03" },
        muzzle =        { offset = true,   position = vector3_box(0, 0.710, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
        muzzle_2 =      { offset = true,   position = vector3_box(0, 0.516, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
    },
    --  -------------------------------------------
    --  Can and Seat
    --  -------------------------------------------
    {	dependencies =  { "owo_suppressor_04|owo_suppressor_05" },
        muzzle =        { offset = true,   position = vector3_box(0, 0.55, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
        muzzle_2 =      { offset = true,   position = vector3_box(0, 0.6, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.80, 1.80, 1.5) },
    },

    -- ######
    -- Foregrip: Tactical Foregrip
    -- ######
    -- skeletal shotgun
    {   dependencies =  { "owo_tactical_foregrip_01"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.161, 0.023),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 0.8, 1.0) },
    },
    -- skeletal shotgun (slant)
    {   dependencies =  { "owo_tactical_foregrip_02"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.10, 0.045),   rotation = vector3_box(15, 0, 0),    scale = vector3_box(1.2, 0.6, 0.7) },
    },
    -- skeletal brauto (slant)
    {   dependencies =  { "owo_tactical_foregrip_03"},
        foregrip =      {offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.151, 0.06),   rotation = vector3_box(10, 0, 0),    scale = vector3_box(0.8, 1.0, 0.8) },
    },
    -- magpul afg triple threat
    {   dependencies =  { "owo_tactical_foregrip_04"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0.0, 0.045, 0.035),   rotation = vector3_box(-67, 0, -180),    scale = vector3_box(0.85, 0.37, 0.74) },
        foregripac1 =   { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0.002, -0.024, -0.053),   rotation = vector3_box(0, 90, -40),    scale = vector3_box(0.5, 0.45, 0.2) },
        foregripac2 =   { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(-0.002, -0.024, -0.053),   rotation = vector3_box(-40, -90, 0),    scale = vector3_box(0.5, 0.45, 0.2) },
        foregripac3 =   { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.0, -0.004),   rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.5, 0.45, 0.2) },
    },

    -- ######
    -- Stock: Straight Grip
    -- For shotguns, stock is like grip
    -- ######
    --  No stock_2
    --      reconstocknone is the None option added by syn
    {   dependencies =  { "reconstocknone|owo_stock_02_empty", _owo_grip_grip_straight_grips },
        stock =         { offset = true,   position = vector3_box(0, 0.07, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
    },
    --  Syn's Short Shotgun Barrels
    --  Ogryn handles
    {   dependencies =  { _syn_short_shotgun_barrels, "owo_heterosexual_foregrip_01|owo_heterosexual_foregrip_02|owo_heterosexual_foregrip_03|owo_heterosexual_foregrip_04|owo_heterosexual_foregrip_05|owo_heterosexual_foregrip_06|owo_heterosexual_foregrip_07|owo_heterosexual_foregrip_08"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.45, 0.3) },
    },
    --  Dclaw
    {   dependencies =  { _syn_short_shotgun_barrels, "owo_heterosexual_foregrip_09|owo_heterosexual_foregrip_10|owo_heterosexual_foregrip_11|owo_heterosexual_foregrip_12|owo_heterosexual_foregrip_13|owo_heterosexual_foregrip_14"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.9, 0.45) },
    },
    --  Knife
    {   dependencies =  { _syn_short_shotgun_barrels, "owo_heterosexual_foregrip_knife_01|owo_heterosexual_foregrip_knife_02|owo_heterosexual_foregrip_knife_03|owo_heterosexual_foregrip_knife_04|owo_heterosexual_foregrip_knife_05|owo_heterosexual_foregrip_knife_06"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1.5, 1) },
    },
    {   dependencies =  { _syn_short_shotgun_barrels, "owo_heterosexual_foregrip_knife_06_fat"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1.5, 1) },
    },
    {   dependencies =  { _syn_short_shotgun_barrels, "owo_heterosexual_foregrip_knife_01s|owo_heterosexual_foregrip_knife_02s|owo_heterosexual_foregrip_knife_03s|owo_heterosexual_foregrip_knife_04s|owo_heterosexual_foregrip_knife_05s|owo_heterosexual_foregrip_knife_06s"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1.5, 0.5) },
    },
    {   dependencies =  { _syn_short_shotgun_barrels, "owo_heterosexual_foregrip_knife_06s_fat"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1.5, 0.5) },
    },
    --  Grip grips
    {   dependencies =  { _syn_short_shotgun_barrels, _owo_grip_grip_straight_grips },
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.09, 0.07),   rotation = vector3_box(30, 0, 0),    scale = vector3_box(1, 1.2, 1) },
    },
    --  Default
    --  Ogryn handles
    {   dependencies =  { "owo_heterosexual_foregrip_01|owo_heterosexual_foregrip_02|owo_heterosexual_foregrip_03|owo_heterosexual_foregrip_04|owo_heterosexual_foregrip_05|owo_heterosexual_foregrip_06|owo_heterosexual_foregrip_07|owo_heterosexual_foregrip_08"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.3, 0.3) },
        stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.45, 0.3, 0.3) },
    },
    --  Dclaw
    {   dependencies =  { "owo_heterosexual_foregrip_09|owo_heterosexual_foregrip_10|owo_heterosexual_foregrip_11|owo_heterosexual_foregrip_12|owo_heterosexual_foregrip_13|owo_heterosexual_foregrip_14"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.6, 0.45) },
        stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.1, 0.6, 0.45) },
    },
    --  Knife
    {   dependencies =  { "owo_heterosexual_foregrip_knife_01|owo_heterosexual_foregrip_knife_02|owo_heterosexual_foregrip_knife_03|owo_heterosexual_foregrip_knife_04|owo_heterosexual_foregrip_knife_05|owo_heterosexual_foregrip_knife_06"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
        stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_06_fat"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
        stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.25, 1, 1) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_01s|owo_heterosexual_foregrip_knife_02s|owo_heterosexual_foregrip_knife_03s|owo_heterosexual_foregrip_knife_04s|owo_heterosexual_foregrip_knife_05s|owo_heterosexual_foregrip_knife_06s"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 0.5) },
        stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 0.5) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_06s_fat"},
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 0.5) },
        stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.25, 1, 0.5) },
    },
    --  Grip grips
    {   dependencies =  { _owo_grip_grip_straight_grips },
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.04, 0.06),   rotation = vector3_box(30, 0, 0),    scale = vector3_box(1, 1, 1) },
        stock =         { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
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
    {   dependencies =  { _owo_all_beeg_stocks },
        stock_2 =       { offset = true, position = vector3_box(0.0, 0.020, 0.045), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1.5, 1.2 ) },
    },
    -- ######
    -- Stock_2: Tactical Stocks
    -- ######
    --  Skeletal
    {   dependencies =  { "owo_tactical_stock_s_01" },
        stock_2 =       { position = vector3_box(0.0, 0.11, 0.076), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.95, 1 ) },
    },
    --  Folded
    {   dependencies =  { "owo_tactical_stock_01|owo_tactical_stock_02|owo_tactical_stock_03|owo_tactical_stock_04|owo_tactical_stock_05|owo_tactical_stock_06|owo_tactical_stock_07|owo_tactical_stock_08" },
        stock_2 =       { position = vector3_box(0.054, -0.044, 0.048), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(-0.0037, -0.014, 0.049), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.45, 0.3 )}
    },
    --  Folded (Left)
    {   dependencies =  { "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
        stock_2 =       { position = vector3_box(-0.05, -0.076, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(0.0023, -0.036, 0.031), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 0.45, 0.3 )}
    },
    --  Natural
    {   dependencies =  { "owo_tactical_stock_f_01|owo_tactical_stock_f_02" },
        stock_2 =       { position = vector3_box(-0.012, -0.108, 0.064), rotation = vector3_box(0, 0, -176), scale = vector3_box(1, 1.0, 1 ) },
    },
    --  Natural (Under)
    {   dependencies =  { "owo_tactical_stock_f_03u" },
        stock_2 =       { position = vector3_box(0.0, -0.112, 0.0625), rotation = vector3_box(174, 0, 0), scale = vector3_box(2.52, 1.45, 1 ) },
    },



    -- ####################################################################################
    -- HIDING HELPERS
    -- By putting it down here, they will only be hidden if the fixes from above are not found
    -- Because they match the main parts first, if there is no match it means the main part is not attached
    -- ####################################################################################
    -- Foregrips
    {   dependencies =  { "owo_tactical_foregrip_ac1_01"},
        foregripac1 = {hide_mesh = {{"foregripac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_tactical_foregrip_ac2_01"},
        foregripac2 = {hide_mesh = {{"foregripac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_tactical_foregrip_ac3_01"},
        foregripac3 = {hide_mesh = {{"foregripac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Muzzles
    {	dependencies = {"owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03|owo_suppressor_helper_04|owo_condom_helper_01"},
		muzzle_2 = {hide_mesh = {{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_2 = "owo_suppressor_helper_empty"}, },
	},
    {	dependencies =  { "owo_muzzle_brake_helper_02_01|owo_suppressor_helper_02_01|owo_suppressor_helper_02_02|owo_suppressor_helper_02_03|owo_suppressor_helper_02_04"},
        muzzle_3 = {hide_mesh = {{"muzzle_3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_3 = "owo_suppressor_helper_02_empty"}, },
    },
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
    -- Stocks
    {   dependencies =  { "owo_tactical_stockac_01"},
        stockac = { hide_mesh = {{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)