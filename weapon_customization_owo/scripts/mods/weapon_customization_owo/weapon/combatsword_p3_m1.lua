local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "combatsword_p3_m1" -- Duelling Sword

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################


-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_rapier_blade(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
    -- Body: Rapier Blade
    --  Knife based
    {   dependencies = {"owo_rapier_blade_01"},
        body = {offset = true,   position = vector3_box(0, 0.0, -0.034),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.6, 3) },
    },
    --      The one with the hole
    {   dependencies = {"owo_rapier_blade_02"},
        body = {offset = true,   position = vector3_box(0, 0.0, -0.06),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.5, 3) },
    },
    --  Force sword based
    {   dependencies = {"owo_rapier_blade_03"},
        body = {offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.25, 1) },
    },
    --      Fat blade
    {   dependencies = {"owo_rapier_blade_04"},
        body = {offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.3, 1) },
    },
    --      ULTRA GIRTHY Deimos blade
    {   dependencies = {"owo_rapier_blade_05"},
        body = {offset = true,   position = vector3_box(0, 0.0, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.2, 1) },
    },
})
