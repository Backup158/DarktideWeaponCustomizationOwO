local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "forcesword_2h_p1_m1" -- Force Greatsword

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################


-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################


-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
    {   dependencies = {"2h_force_sword_hilt_01",
            "power_sword_grip_04",
            "2h_power_maul_pommel_03",
            "2h_force_sword_blade_03",
        },
        hilt =      { position = vector3_box(0, 0, -0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}, 
        grip =      { position = vector3_box(0, 0, .046), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        pommel =    { position = vector3_box(0, 0, 0.078), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
    },    
})
