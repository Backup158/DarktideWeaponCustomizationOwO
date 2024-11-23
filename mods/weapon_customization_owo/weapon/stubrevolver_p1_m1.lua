local mod = get_mod("weapon_customization_owo")
local mt = get_mod("weapon_customization_mt_stuff")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "stubrevolver_p1_m1" -- Quickdraw Stub Revolver

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].owobarrelex = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_revolver_shotgun_barrel(this_variant, "barrel")
mod.owo_grip_laser(this_variant, "flashlight")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    {   dependencies = {"owo_revolver_shotgun_barrel_base_01|owo_revolver_shotgun_barrel_base_04|owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08|owo_revolver_shotgun_barrel_base_09"},
        -- stole this part from MT
        barrel = {offset = true, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        muzzle = {parent = "owobarrelex", position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        owobarrelex = {parent = "barrel", parent_node = 9, offset = true, 
            position = vector3_box(0, 0, 0), scale = vector3_box(1, 0.55, 0.75)
        },
    },
    -- #####
    -- Flashlight: Grip Laser
    -- #####
    {   dependencies = {"owo_grip_laser_01|owo_grip_laser_02"},
        flashlight = {position = vector3_box(-0.01, 0.044, -0.016), scale = vector3_box(0.345, 0.3, 0.285)},
    },

    -- ################
    -- Hiding unused attachments
    -- ################
    {   dependencies = {"!owo_revolver_shotgun_barrel_base_01", "!owo_revolver_shotgun_barrel_base_04", "!owo_revolver_shotgun_barrel_base_05", "!owo_revolver_shotgun_barrel_base_06", "!owo_revolver_shotgun_barrel_base_08", "!owo_revolver_shotgun_barrel_base_09"},
        owobarrelex = {hide_mesh = {{"owobarrelex", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}
        },
    },
})