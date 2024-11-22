local mod = get_mod("weapon_customization_owo")
local mt = get_mod("weapon_customization_mt_stuff")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "laspistol_p1_m1" -- Laspistols

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].muzzle2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_grip_laser(this_variant, "flashlight")
--mod.owo_lasgun_magazine_flat(this_variant, "magazine")
mod.owo_laspistol_magazine_flat(this_variant)
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
    -- ######
	-- Magazine: FLAT MAG
	-- ######
    {   dependencies = {"owo_laspistol_magazine_flat_01"},
        magazine = {offset = true, scale = vector3_box(1, 1, 0.5)},
    },
    -- ######
	-- Flashlight: LASER GRIP
	-- ######
    {   dependencies = {"owo_grip_laser_01|owo_grip_laser_02"},
        flashlight = {offset = true,  position = vector3_box(-0.064, -0.112, -0.119), scale = vector3_box(0.75, 0.425, 0.588)},
    },

    -- #########################
	-- Hiding unused helpers
	-- #########################
    -- Muzzles
    {	dependencies = {"!owo_suppressor_01",  "!owo_suppressor_02", 
            "!owo_condom_01"
        },
        muzzle2 = {hide_mesh = { 	{"muzzle2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
})