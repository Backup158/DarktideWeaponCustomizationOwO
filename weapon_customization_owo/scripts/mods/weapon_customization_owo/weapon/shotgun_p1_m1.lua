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
    --{   dependencies = { "owo_alt_viewmodel_empty" },
    --    scope_offset =      { position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
    --    no_scope_offset =      { position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
    --},
    --  Doom
    {   dependencies = { "owo_alt_viewmodel_01" },
        scope_offset =         { position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0),  },
        no_scope_offset =      { position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0),  },
    },
    {   dependencies = { "owo_alt_viewmodel_02" },
        scope_offset =         { position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
        no_scope_offset =      { position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
    },
    {   dependencies = { "owo_alt_viewmodel_03" },
        scope_offset =         { position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
        no_scope_offset =      { position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
    },
    -- CS:S
    {   dependencies = { "owo_alt_viewmodel_04" },
        scope_offset =         { position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =      { position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
    },
    -- Hipfire
    {   dependencies = { "owo_alt_viewmodel_05" },
        scope_offset =         { position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =      { position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
    },
})
