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
    mod.wc.attachment[this_variant].stock_2 = {}
    mod.inject_attachments_owo(this_variant, "stock_2", {
		{id = "owo_stock_02_empty", name = "None"},
	})
    mod.inject_models(this_variant, {
        owo_stock_02_empty = { model = "", type = "stock_2", parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_00", }, },
    })
    mod.wc.attachment[this_variant].stockac = {}
end
mod.wc.attachment[this_variant].foregrip = {}


-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)

mod.owo_suppressor(this_variant)

mod.owo_empty_foregrip(this_variant)
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


mod.mt.inject_fixes(this_variant, {
    -- ######
	-- Sight_2: Alt Viewmodels
	-- ######
    --{   dependencies =      { "owo_alt_viewmodel_empty" },
    --    scope_offset =      { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
    --    no_scope_offset =   { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
    --},
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
        foregrip =      { offset = false, parent = "underbarrel", parent_node = 1, position = vector3_box(0, 0.04, 0.06),   rotation = vector3_box(30, 0, 0),    scale = vector3_box(1, 1.5, 1) },
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
        stock_2 =       { offset = true, position = vector3_box(0.0, 0.11, 0.076), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, 1.5, 1.2 ) },
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
    -- Muzzles
    {	dependencies = {"owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03|owo_suppressor_helper_04|owo_condom_helper_01"},
		muzzle_2 = {hide_mesh = {{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_2 = "owo_suppressor_helper_empty"}, },
	},
    -- Stocks
    {   dependencies =  { "owo_tactical_stockac_01"},
        stockac = { hide_mesh = {{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
