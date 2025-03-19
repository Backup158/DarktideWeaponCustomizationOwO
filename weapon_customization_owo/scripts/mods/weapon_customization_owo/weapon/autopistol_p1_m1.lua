local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "autopistol_p1_m1" -- Shredder Autopistol

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].sight_2 = {}

--if not mod.syn then
mod.wc.attachment[this_variant].muzzle_2 = {} -- MT and Syn didn't add this to autopistol yet, though syn has it commented out
--end

-- Covered by MT plugin
-- mod.wc.attachment[this_variant].stockac = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_suppressor(this_variant)

mod.owo_tactical_stock(this_variant)

mod.owo_alt_viewmodel(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
    
    -- ######
	-- Muzzle: SUPPRESSOR
	-- ######
    --  Default autopistol barrel patches
    {	dependencies = { "owo_suppressor_03",
            "barrel_01|barrel_02|barrel_03|barrel_04|barrel_05"
        },
        muzzle = { offset = true,   position = vector3_box(0, 0.286, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
        muzzle_2 = { offset = true,   position = vector3_box(0, 0.088, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
    },
    {	dependencies = { "owo_suppressor_04|owo_suppressor_05",
            "barrel_01|barrel_02|barrel_03|barrel_04|barrel_05"
        },
        muzzle = { offset = true,   position = vector3_box(0, 0.084, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
        muzzle_2 = { offset = true,   position = vector3_box(0, 0.194, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.80, 1.80, 1.5) },
    },
    -- Base case
    {	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
        muzzle = { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
    },
    {	dependencies = { "owo_suppressor_03"},
        muzzle = { offset = true,   position = vector3_box(0, 0.5, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
        muzzle_2 = { offset = true,   position = vector3_box(0, 0.3, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
    },
    {	dependencies = { "owo_suppressor_04|owo_suppressor_05"},
        muzzle = { offset = true,   position = vector3_box(0, 0.072, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
        muzzle_2 = { offset = true,   position = vector3_box(0, 0.52, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.80, 1.80, 1.5) },
    },
    -- muzzle 2
    {	dependencies = {"owo_suppressor_01"},
        muzzle_2 = { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 22, 0),   scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle_2 = { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 17, 0),   scale = vector3_box(1.2, 1.8, 1.2) }
    },
    -- the skinny bayonet. sits on muzzle
    {	dependencies = {"owo_suppressor_01|owo_suppressor_02",
            "autogun_bayonet_03"
        },
        bayonet = { offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85) },
    },

    -- ######
	-- Sight_2: Alt Viewmodels
	-- ######
    --{   dependencies =      { "owo_alt_viewmodel_empty" },
    --    scope_offset =      { position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
    --    no_scope_offset =      { position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
    --},
    --  Doom
    {   dependencies =      { "owo_alt_viewmodel_01" },
        scope_offset =      { position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0), },
        no_scope_offset =   { position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0), },
    },
    {   dependencies =      { "owo_alt_viewmodel_02" },
        scope_offset =      { position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
        no_scope_offset =   { position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
    },
    {   dependencies =      { "owo_alt_viewmodel_03" },
        scope_offset =      { position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
        no_scope_offset =   { position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
    },
    -- CS:S
    {   dependencies =      { "owo_alt_viewmodel_04" },
        scope_offset =      { position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
    },
    -- Hipfire
    {   dependencies =      { "owo_alt_viewmodel_05" },
        scope_offset =      { position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
    },
    -- Point Shooting
    {   dependencies =      { "owo_alt_viewmodel_06" },
        scope_offset =          { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0),  },
        no_scope_offset =       { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0),  },
    },

    -- ######
	-- Stock: TACTICAL STOCK
	-- ######
    --  Skeletal
    {   dependencies = { "owo_tactical_stock_s_01" },
        stock =      { position = vector3_box(0.0, 0.11, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.95, 1 ) },
    },
    --  Folded
    {   dependencies = { "owo_tactical_stock_01|owo_tactical_stock_02|owo_tactical_stock_03|owo_tactical_stock_04|owo_tactical_stock_05|owo_tactical_stock_06|owo_tactical_stock_07|owo_tactical_stock_08" },
        stock =     { position = vector3_box(0.054, -0.092, 0.058), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =   { position = vector3_box(-0.0037, -0.054, 0.059), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.45, 0.3 )}
    },
    --  Folded (Left)
    {   dependencies = { "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
        stock =     { position = vector3_box(-0.05, -0.096, 0.060), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =   { position = vector3_box(0.0023, -0.054, 0.061), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 0.45, 0.3 )}
    },
    --  Floating
    {   dependencies = { "owo_tactical_stock_f_01|owo_tactical_stock_f_02" },
        stock =      { position = vector3_box(-0.012, -0.108, 0.064), rotation = vector3_box(0, 0, -176), scale = vector3_box(1, 1.0, 1 ) },
    },
    {   dependencies = { "owo_tactical_stock_f_03u" },
        stock =      { position = vector3_box(0.0, -0.112, 0.0625), rotation = vector3_box(174, 0, 0), scale = vector3_box(2.52, 1.3, 1 ) },
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
    {   dependencies = {"owo_tactical_stockac_01"},
        stockac = { hide_mesh = {{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
