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

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    
})