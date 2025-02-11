local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "combataxe_p3_m1" -- Sapper Shovel

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].head2 = {}
mod.wc.attachment[this_variant].pommelac1 = {}
mod.wc.attachment[this_variant].pommelac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_shovel_handles(this_variant, "head")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    -- ######
    -- Head: Shovel Handles
    -- only really aligned for grip2
    -- ######
    -- the fucked up mini handle
    {	dependencies = {"owo_shovel_handles_01"},
        pommel = {offset = true, position = vector3_box(0, 0.012, 0.003), rotation = vector3_box(84, 0, 0), scale = vector3_box(1, 1, 0.488 ) },
    },
    -- the proper three arms
    {	dependencies = {"owo_shovel_handles_02"},
        pommel = {offset = true, position = vector3_box(0, -0.009, -0.043), rotation = vector3_box(107, 0, 0), scale = vector3_box(1, 0.69, 0.275 ) },
        pommelac1 = {offset = true, position = vector3_box(0, 0.015, -0.059), rotation = vector3_box(63, 0, 0), scale = vector3_box(1, 0.69, 0.275 ) },
        pommelac2 = {offset = true, position = vector3_box(0, -0.01, -0.244), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.46, 0.38, 0.55 ) },
    },

    -- ####################################################################################
    -- HIDING HELPERS
    -- By putting it down here, they will only be hidden if the fixes from above are not found
    -- Because they match the main parts first, if there is no match it means the main part is not attached
    -- ####################################################################################
    -- Pommel
    {	dependencies = {"owo_shovel_handles_ac1_01"},
        pommelac1 = { hide_mesh = {{"pommelac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {	dependencies = {"owo_shovel_handles_ac2_01"},
        pommelac2 = { hide_mesh = {{"pommelac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})