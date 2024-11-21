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
-- mod.wc.attachment[this_variant].barrelex = {}            wont show up
mod.wc.attachment[this_variant].barrelex = {}
-- mt.wc.attachment[this_variant].barrelex = {}             wc nil
-- mod.table_append(mod.wc.attachment[this_variant].barrelex, {         not a table
--[[        still not table
mod.table_append(mod.wc.barrelexs, {
    "owo_revolver_shotgun_barrel_01",
})]]

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_revolver_shotgun_barrel(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    {   dependencies = {"owo_revolver_shotgun_barrel_01|owo_revolver_shotgun_barrel_04|owo_revolver_shotgun_barrel_05|owo_revolver_shotgun_barrel_06|owo_revolver_shotgun_barrel_08|owo_revolver_shotgun_barrel_09"},
        barrelex = {offset = true, position = vector3_box(0, 0, 0), scale = vector3_box(1, 0.55, 0.75)}
    }
})