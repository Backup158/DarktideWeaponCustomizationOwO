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
mod.wc.attachment[this_variant].muzzle2 = {}
mod.wc.attachment[this_variant].barrelshroud = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_revolver_shotgun_barrel(this_variant, "barrel")
mod.owo_grip_laser(this_variant, "flashlight")
mod.owo_suppressor(this_variant, "muzzle")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    -- ######
	-- Muzzle: SUPPRESSOR
	-- ######
	{	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
        muzzle = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },
    },
    {	dependencies = {"owo_suppressor_01"},
        muzzle2 = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2 ) }
    },
    -- the skinny bayonet. sits on muzzle
    {	dependencies = {"owo_suppressor_01|owo_suppressor_02", 
            "autogun_bayonet_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85 ) },
    },

    -- #####
    -- Barrel: Shotgun Extension
    -- #####
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04|owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08",
        },
        -- stole this part from MT
        barrel = {offset = true, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud = {parent = "barrel", parent_node = 9, offset = true, 
            position = vector3_box(0, 0.056, 0.02), scale = vector3_box(0.8, 0.345, 0.865)
        },
    },
    --      Muzzle handling
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04|owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08",
            "!owo_suppressor_01", "!owo_suppressor_02"
        },
        muzzle = {parent = "barrel", position = vector3_box(0, 0.23, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
    },
    --      Suppressor compat
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04|owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08",
            "owo_suppressor_01|owo_suppressor_02"
        },
        muzzle = {parent = "barrel", position = vector3_box(0, 0.23, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2)},
        muzzle2 = {parent = "barrel", position = vector3_box(0, 0.23, 0.018),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },	
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
    -- Barrels
    {   dependencies = {"!owo_revolver_shotgun_barrel_base_04", "!owo_revolver_shotgun_barrel_base_05", "!owo_revolver_shotgun_barrel_base_06", "!owo_revolver_shotgun_barrel_base_08"},
            barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}
        },
    },
    -- Muzzles
    {	dependencies = {"!owo_suppressor_01",  "!owo_suppressor_02", 
        },
        muzzle2 = {hide_mesh = { 	{"muzzle2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
})