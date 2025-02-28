local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "combatknife_p1_m1" -- Combat Blade

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

    --[[
    {   dependencies = {"ogrynbladehandle_01",
            --"knife_body_01|knife_body_02|knife_body_03|knife_body_04|knife_body_05|knife_body_06|knife_body_07|combat_knife_blade_ml01"
            "knife_body_03"
        },
        grip = {mesh_move = true, position = vector3_box(0, 0, -0.01), rotation = vector3_box(-1, 0, 0), scale = vector3_box(.35, .35, .45), node = 1},
        trinket_hook = {position = vector3_box(0, 0, -.064), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.834, 0.834, 0.834)},    
        body = {position = vector3_box(0, 0, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}
    }, 
    ]]   
})
