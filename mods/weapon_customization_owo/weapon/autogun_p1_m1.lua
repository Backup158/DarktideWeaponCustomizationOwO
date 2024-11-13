local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "autogun_p1_m1"

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].barrelshroud = {}
mod.wc.attachment[this_variant].barrelshroudac = {}
mod.wc.attachment[this_variant].barrelshroudac2 = {}
mod.wc.attachment[this_variant].barrelshroudac3 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_dreg_gunner_barrel(this_variant, "barrel")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    -- Helbore bayonets
	{   dependencies = {
            "owo_dreg_barrel_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        }, -- Barrel
	    bayonet = {offset = true, position = vector3_box(0, 0.699, -0.095), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.6, 1.7, 2.0)}
    },
	{   dependencies = {
            "owo_dreg_barrel_01"
        },
	    barrel = { offset = true, 
            position = vector3_box(0, 0, 0.025), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(0.45, 0.7, 0.45)
        },
        -- outside, one with the front sight
        barrelshroud = {
            offset = true, position = vector3_box(0, 0, 0.025), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(0.39, 0.7, 0.39)
        }, 
        -- long receiver, reverse las
        barrelshroudac = {
            offset = true, position = vector3_box(0, 0, 0),
            rotation = vector3_box(0, 0, 180),
            scale = vector3_box(1, 1, 1)
        },
        -- bayonet lug
        barrelshroudac2 = {
            offset = true, position = vector3_box(0, 0, -0.115), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(1, 1.9, 0.8)
        }, 
        -- hand grip for long receiver
        barrelshroudac3 = {
            offset = true, position = vector3_box(0, 0, -0.115), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(1, 1.5, 1.67)
        }, 
        flashlight = {offset = true, position = vector3_box(0.0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        muzzle = {offset = true, position = vector3_box(0, 1, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.2, 2.2, 2.2)}
    },
})