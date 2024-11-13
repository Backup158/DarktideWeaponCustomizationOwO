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
mod.wc.attachment[this_variant].barrelshroudacs = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_dreg_gunner_barrel(this_variant, "barrel")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    --[[
    {   dependencies = {
            "owo_dreg_barrel_01",
            "apistol_muzzle_01|apistol_muzzle_02|apistol_muzzle_03|apistol_muzzle_04|apistol_muzzle_05"
        }, -- Barrel
	    muzzle = {offset = true, position = vector3_box(0, 0.9, -0.09), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.9, 1)}
    },
    ]]
	{   dependencies = {
            "owo_dreg_barrel_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        }, -- Barrel
	    bayonet = {offset = true, position = vector3_box(0, 0.9, -0.09), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.4, 1.7)}
    },
	{   dependencies = {
            "owo_dreg_barrel_01"
        },
	    barrel = {offset = true, position = vector3_box(0, 0, 0.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.45, 0.7, 0.45)},
        barrelshroud = {offset = true, position = vector3_box(0, 0, 0.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.39, 0.7, 0.39)},
	    barrelshroudac = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.64, 1.2, 0.7)},
        flashlight = {offset = true, position = vector3_box(0.0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.)},
        trinket_hook = {parent = "barrel", position = vector3_box(0, 0.182, -.0925), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1, 1)},
	    emblem_left = {offset = false, parent = "barrel", position = vector3_box(-0.03, 0, -.02), rotation = vector3_box(0, 0, 180), scale = vector3_box(2, 2, 2)},
	    emblem_right = {offset = false, parent = "barrel", position = vector3_box(0.03, 0, -.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(2, 2, 2)},
	    muzzle = {offset = true, position = vector3_box(0, 1, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.2, 2.2, 2.2)}
    },
})