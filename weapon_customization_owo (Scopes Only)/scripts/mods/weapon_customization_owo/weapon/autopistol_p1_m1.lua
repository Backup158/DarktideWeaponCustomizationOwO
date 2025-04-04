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

-- Covered by MT plugin
-- mod.wc.attachment[this_variant].stockac = {}

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
    -- Point Shooting
    {   dependencies =      { "owo_alt_viewmodel_06" },
        scope_offset =          { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0),  },
        no_scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0),  },
    },

    
    -- ####################################################################################
    -- HIDING HELPERS
    -- By putting it down here, they will only be hidden if the fixes from above are not found
    -- Because they match the main parts first, if there is no match it means the main part is not attached
    -- ####################################################################################

})
