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
mod.wc.attachment[this_variant].barrelshroud = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_bistol_shotgun_barrel_short(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    {   --dependencies = {"owo_bistol_sg_base_01|owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08|owo_bistol_sg_base_09"},
        dependencies = {"owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08"},
        barrel = {offset = true,  position = vector3_box(0, 0.162, 0.012), scale = vector3_box(1, 1, 1) },
        barrelshroud = {offset = true,  position = vector3_box(0, -0.144, 0.002), scale = vector3_box(1.328, 0.33, 0.9) },
        muzzle = {offset = true, position = vector3_box(0, 0.47, 0),scale = vector3_box(1, 1, 1) },
    },

    -- ###############
    -- HIDING UNUSED PARTS
    -- ###############
    {   -- dependencies = {"!owo_bistol_sg_base_01", "!owo_bistol_sg_base_04", "!owo_bistol_sg_base_05", "!owo_bistol_sg_base_06", "!owo_bistol_sg_base_08", "!owo_bistol_sg_base_09",
        dependencies = {"!owo_bistol_sg_base_04", "!owo_bistol_sg_base_05", 
            "!owo_bistol_sg_base_06", "!owo_bistol_sg_base_08",
        },
        barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})