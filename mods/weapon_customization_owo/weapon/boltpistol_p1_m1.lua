local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "boltpistol_p1_m1" -- Bolt Pistol

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_bistol_shotgun_barrel_short(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    {   dependencies = {
            "owo_bistol_shotgun_barrel_short_01|owo_bistol_shotgun_barrel_short_04|owo_bistol_shotgun_barrel_short_05|owo_bistol_shotgun_barrel_short_06|owo_bistol_shotgun_barrel_short_08|owo_bistol_shotgun_barrel_short_09"
        },
        barrel = {
            offset = true, 
			position = vector3_box(0, 0.01, 0.01),
			scale = vector3_box(1, 0.33, 0.9)
        },
        --[[
        -- SCALING AND POS IS FUCKED RN
        -- because of changes in base mod
        muzzle = {
            offset = true, 
            position = vector3_box(0, 0.47, 0), -- 0.45
            scale = vector3_box(1, 3, 1)        -- 1/3 * 3 = 1 BUT WHY OWNE TIT TWOOOOORK
        }
        ]]
    },
})