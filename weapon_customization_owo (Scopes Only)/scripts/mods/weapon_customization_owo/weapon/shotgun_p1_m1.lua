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
end

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_alt_viewmodel(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
    -- ######
	-- Sight_2: Alt Viewmodels
	-- ######
    --{   dependencies =      { "owo_alt_viewmodel_empty" },
    --    scope_offset =      { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
    --    no_scope_offset =      { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
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
    -- Stock: Straight Grip
    -- For shotguns, stock is like grip
    -- ######
    --  Ogryn handles
    {   dependencies =  { "owo_heterosexual_foregrip_01|owo_heterosexual_foregrip_02|owo_heterosexual_foregrip_03|owo_heterosexual_foregrip_04|owo_heterosexual_foregrip_05|owo_heterosexual_foregrip_06|owo_heterosexual_foregrip_07|owo_heterosexual_foregrip_08"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.3, 0.3) },
    },
    --  Dclaw
    {   dependencies =  { "owo_heterosexual_foregrip_09|owo_heterosexual_foregrip_10|owo_heterosexual_foregrip_11|owo_heterosexual_foregrip_12|owo_heterosexual_foregrip_13|owo_heterosexual_foregrip_14"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.6, 0.45) },
    },
    --  Knife
    {   dependencies =  { "owo_heterosexual_foregrip_knife_01|owo_heterosexual_foregrip_knife_02|owo_heterosexual_foregrip_knife_03|owo_heterosexual_foregrip_knife_04|owo_heterosexual_foregrip_knife_05|owo_heterosexual_foregrip_knife_06"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_06_fat"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_01s|owo_heterosexual_foregrip_knife_02s|owo_heterosexual_foregrip_knife_03s|owo_heterosexual_foregrip_knife_04s|owo_heterosexual_foregrip_knife_05s|owo_heterosexual_foregrip_knife_06s"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 0.5) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_06s_fat"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 0.5) },
    },
    --  Grip grips
    {   dependencies =  { "owo_heterosexual_foregrip_grip_01|owo_heterosexual_foregrip_grip_02|owo_heterosexual_foregrip_grip_03|owo_heterosexual_foregrip_grip_04|owo_heterosexual_foregrip_grip_05|owo_heterosexual_foregrip_grip_06|owo_heterosexual_foregrip_grip_07|owo_heterosexual_foregrip_grip_08|owo_heterosexual_foregrip_grip_09|owo_heterosexual_foregrip_grip_10|owo_heterosexual_foregrip_grip_11|owo_heterosexual_foregrip_grip_12|owo_heterosexual_foregrip_grip_13|owo_heterosexual_foregrip_grip_14|owo_heterosexual_foregrip_grip_15|owo_heterosexual_foregrip_grip_16|owo_heterosexual_foregrip_grip_17|owo_heterosexual_foregrip_grip_18|owo_heterosexual_foregrip_grip_19|owo_heterosexual_foregrip_grip_20|owo_heterosexual_foregrip_grip_21|owo_heterosexual_foregrip_grip_22|owo_heterosexual_foregrip_grip_23|owo_heterosexual_foregrip_grip_24|owo_heterosexual_foregrip_grip_25|owo_heterosexual_foregrip_grip_26|owo_heterosexual_foregrip_grip_27|owo_heterosexual_foregrip_grip_28|owo_heterosexual_foregrip_grip_29"},
        foregrip = { offset = true,   position = vector3_box(0, 0.375, 0.06),   rotation = vector3_box(30, 0, 0),    scale = vector3_box(1, 1, 1) },
        stock = { offset = true,   position = vector3_box(0, 0.042, 0.018),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
    },

    -- ######
    -- Stock_2: Normal Stocks
    -- ######

    -- ######
    -- Stock_2: Tactical Stocks
    -- ######
    --  Skeletal
    {   dependencies =  { "owo_tactical_stock_s_01" },
        stock_2 =         { position = vector3_box(0.0, 0.11, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.95, 1 ) },
    },
    --  Folded
    {   dependencies =  { "owo_tactical_stock_01|owo_tactical_stock_02|owo_tactical_stock_03|owo_tactical_stock_04|owo_tactical_stock_05|owo_tactical_stock_06|owo_tactical_stock_07|owo_tactical_stock_08" },
        stock_2 =         { position = vector3_box(0.054, -0.092, 0.058), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(-0.0037, -0.054, 0.059), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.45, 0.3 )}
    },
    --  Folded (Left)
    {   dependencies =  { "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
        stock_2 =         { position = vector3_box(-0.05, -0.096, 0.060), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(0.0023, -0.054, 0.061), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 0.45, 0.3 )}
    },
    --  Natural
    {   dependencies =  { "owo_tactical_stock_f_01|owo_tactical_stock_f_02" },
        stock_2 =         { position = vector3_box(-0.012, -0.108, 0.064), rotation = vector3_box(0, 0, -176), scale = vector3_box(1, 1.0, 1 ) },
    },
    --  Natural (Under)
    {   dependencies =  { "owo_tactical_stock_f_03u" },
        stock_2 =         { position = vector3_box(0.0, -0.112, 0.0625), rotation = vector3_box(174, 0, 0), scale = vector3_box(2.52, 1.45, 1 ) },
    },
})
