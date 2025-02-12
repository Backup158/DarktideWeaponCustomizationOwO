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
if not mod.syn then
    mod.wc.attachment[this_variant].barrelshroud = {}
end

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_bistol_shotgun_barrel_short(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    -- #####
    -- Barrel: Short Shotgun
    -- #####
    {   dependencies = {"owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08|owo_bistol_sg_base_04_s|owo_bistol_sg_base_05_s|owo_bistol_sg_base_06_s|owo_bistol_sg_base_08_s"},
        muzzle = {offset = true, position = vector3_box(0, 0.47, 0), scale = vector3_box(1, 1, 1) },
    },
    {   --dependencies = {"owo_bistol_sg_base_01|owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08|owo_bistol_sg_base_09"},
        dependencies = {"owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08"},
        barrel = {offset = true,  position = vector3_box(0, 0.162, 0.012), scale = vector3_box(1, 1, 1) },
        barrelshroud = {offset = true,  position = vector3_box(0, -0.144, 0.002), scale = vector3_box(1.328, 0.33, 0.9) },
    },
    -- Super Shorty
    {   dependencies = {"owo_bistol_sg_base_04_s|owo_bistol_sg_base_05_s|owo_bistol_sg_base_06_s|owo_bistol_sg_base_08_s"},
        barrel = {offset = true,  position = vector3_box(0, 0.098, 0.012), scale = vector3_box(1, 1, 1) },
        barrelshroud = {offset = true,  position = vector3_box(0, -0.082, 0.002), scale = vector3_box(1.328, 0.178, 0.9) },
    },


    -- ###############
    -- HIDING UNUSED PARTS
    -- ###############
    {   dependencies = {"owo_bistol_shotgun_barrel_short_04|owo_bistol_shotgun_barrel_short_05|owo_bistol_shotgun_barrel_short_06|owo_bistol_shotgun_barrel_short_08"},
        barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
