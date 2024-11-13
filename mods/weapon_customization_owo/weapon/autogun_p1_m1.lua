local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "autogun_p1_m1" -- Braced Autoguns

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].barrelshroud = {}
--mod.wc.attachment[this_variant].barrelshroudac = {}
mod.wc.attachment[this_variant].barrelshroudac2 = {}
mod.wc.attachment[this_variant].barrelshroudac3 = {}
mod.wc.attachment[this_variant].barrelshroudac4 = {}
mod.wc.attachment[this_variant].bayonet = {}
mod.wc.attachment[this_variant].bayonet2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_dreg_gunner_barrel(this_variant, "barrel")
mod.owo_dreg_gunner_bayonet(this_variant, "bayonet")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    -- DREG GUNNER BARREL
    -- Helbore bayonets
	{   dependencies = {
            "owo_dreg_barrel_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
	    bayonet = {offset = true, position = vector3_box(0, 0.699, -0.095), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.5, 1.7, 3.0)}
    },
	{   dependencies = {
            "owo_dreg_barrel_01"
        },
	    barrel = { offset = true, 
            position = vector3_box(0, 0, 0.025), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(0.27, 0.63, 0.27)
        },
        -- outside, one with the front sight
        barrelshroud = {
            offset = true, position = vector3_box(0, 0, 0.025), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(0.24, 0.7, 0.24)
        }, 
        --[[-- long receiver, reverse las
        barrelshroudac = {
            offset = true, position = vector3_box(0, 0, 0),
            rotation = vector3_box(0, 0, 180),
            scale = vector3_box(1, 1, 1)
        },]]
        -- bayonet lug
        barrelshroudac2 = {
            offset = true, position = vector3_box(0, 0, -0.115), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(1, 2.45, 0.8)
        }, 
        -- hand grip for long receiver
        barrelshroudac3 = {
            offset = true, position = vector3_box(0, 0, -0.215), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(2, 1.5, 2.5)
        }, 
        -- hand grip (top)
        barrelshroudac4 = {
            offset = true, position = vector3_box(0, 0.153, 0.115), 
            rotation = vector3_box(180, 0, 0), 
            scale = vector3_box(2.4, 0.969, 2.85)
        }, 
        flashlight = {offset = true, position = vector3_box(0.096, 0.17, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.7, 2.7, 2.7)},
        muzzle = {offset = true, position = vector3_box(0, 1, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.2, 2.2, 2.2)}
    },
    -- DREG GUNNER BAYONET
    {   dependencies = {
            "!owo_dreg_barrel_01",
            "owo_dreg_bayonet_01",
        },
        bayonet = {
            offset = true, position = vector3_box(0, 0.55, -0.055), 
            rotation = vector3_box(-90, 0, 0), 
            scale = vector3_box(0.35, 0.275, 0.35)
        },
        bayonet2 = {
            offset = true, position = vector3_box(0, 0.55, -0.069), 
            rotation = vector3_box(90, 0, 0), 
            scale = vector3_box(0.35, 0.225, 0.075)
        },
    },
    {   dependencies = {
            "owo_dreg_barrel_01",
            "owo_dreg_bayonet_01"
        },
        --[[bayonet = {
            offset = true, position = vector3_box(0, 0.6, -0.3), 
            scale = vector3_box(1, 2.1, 1)
        },
        bayonet2 = {
            offset = true, position = vector3_box(0, 0.6, -0.3), 
            scale = vector3_box(1, 2, 1)
        },]]
        bayonet = {
            offset = true, position = vector3_box(0, 0.8, -0.18), 
            rotation = vector3_box(-90, 0, 0), 
            scale = vector3_box(1, 1, 0.555)
        },
        bayonet2 = {
            offset = true, position = vector3_box(0, 0.8, -0.222), 
            rotation = vector3_box(90, 0, 0), 
            scale = vector3_box(1, 0.67, 0.115)
        },
    }
})