local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "ogryn_pickaxe_2h_p1_m1" -- Delver's Pickaxe

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
-- Syn hasn't added these to pickaxes yet
mod.wc.attachment[this_variant].bladeshroud = {}
mod.wc.attachment[this_variant].bladeshroudac = {}
mod.wc.attachment[this_variant].bladeshroudac2 = {}
mod.wc.attachment[this_variant].bladeshroudac3 = {}

mod.wc.attachment[this_variant].shaftac1 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_tacax_spike(this_variant, "head", "shaft")
mod.owo_polearm_head(this_variant, "head", "shaft")

mod.owo_ogryn_shaft_low_grip(this_variant, "shaft")

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_all_tacax_spike_heads = "owo_tacax_spike_01|owo_tacax_spike_02|owo_tacax_spike_03|owo_tacax_spike_04|owo_tacax_spike_05|owo_tacax_spike_06|owo_tacax_spike_07"
local _owo_polearm_bec_heads = "owo_polearm_head_bc_01|owo_polearm_head_bc_02|owo_polearm_head_bc_03|owo_polearm_head_bc_04"
local _owo_polearm_lucerne_heads = "owo_polearm_head_l_01|owo_polearm_head_l_02||owo_polearm_head_l_03"
local _owo_polearm_pollax_shovel_heads = "owo_polearm_head_p_04|owo_polearm_head_p_05|owo_polearm_head_p_06|owo_polearm_head_p_07|owo_polearm_head_p_08|owo_polearm_head_p_09"
local _owo_polearm_pollax_misc_heads = "owo_polearm_head_p_01|owo_polearm_head_p_02|owo_polearm_head_p_03"
local _owo_polearm_pollax_heads = _owo_polearm_pollax_shovel_heads.."|".._owo_polearm_pollax_misc_heads
local _owo_polearm_heads = _owo_polearm_bec_heads.."|".._owo_polearm_lucerne_heads.."|".._owo_polearm_pollax_heads
local _owo_low_grip_ogryn_shafts = "owo_ogryn_shaft_low_grip_01|owo_ogryn_shaft_low_grip_02|owo_ogryn_shaft_low_grip_03|owo_ogryn_shaft_low_grip_04|owo_ogryn_shaft_low_grip_05|owo_ogryn_shaft_low_grip_06"
    
-- ########
-- For This Variant Only
-- ########

-- ############################################
-- Inject Fixes
-- ############################################
-- #################
-- HIDING HELPERS
-- By putting it up here, it ends up at the bottom of the list, so they will only be hidden if the fixes from above are not found
-- Because they match the main parts first, if there is no match it means the main part is not attached
-- #################
mod.mt.inject_fixes(this_variant, {
    -- Head
    {	dependencies = {"owo_tacax_spike_helper_01|owo_polearm_head_helper_0_01"},
        bladeshroud = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"bladeshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {	dependencies = {"owo_polearm_head_helper_1_01|owo_polearm_head_helper_1_02|owo_polearm_head_helper_1_03|owo_polearm_head_helper_1_04|owo_polearm_head_helper_1_l_01|owo_polearm_head_helper_1_l_02|owo_polearm_head_helper_1_p_01|owo_polearm_head_helper_1_p_02|owo_polearm_head_helper_1_p_03|owo_polearm_head_helper_1_p_04|owo_polearm_head_helper_1_p_05|owo_polearm_head_helper_1_p_06|owo_polearm_head_helper_1_p_07|owo_polearm_head_helper_1_p_08|owo_polearm_head_helper_1_p_09"},
        bladeshroudac = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"bladeshroudac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, automatic_equip = { bladeshroudac = "owo_polearm_head_helper_1_00" },
    },
    {	dependencies = {"owo_polearm_head_helper_2_01"},
        bladeshroudac2 = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"bladeshroudac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, automatic_equip = { bladeshroudac2 = "owo_polearm_head_helper_2_00" },
    },
    {	dependencies = {"owo_polearm_head_helper_3_01|owo_polearm_head_helper_3_02"},
        bladeshroudac3 = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"bladeshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, automatic_equip = { bladeshroudac3 = "owo_polearm_head_helper_3_00" },
    },
    -- Shaft
    {	dependencies = {"owo_ogryn_shaft_low_grip_helper_01|owo_ogryn_shaft_low_grip_helper_02|owo_ogryn_shaft_low_grip_helper_03|owo_ogryn_shaft_low_grip_helper_04|owo_ogryn_shaft_low_grip_helper_05|owo_ogryn_shaft_low_grip_helper_06"},
        shaftac1 = {position = vector3_box(0, 0, 0.04), hide_mesh = {{"shaftac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, automatic_equip = { shaftac1 = "owo_ogryn_shaft_low_grip_helper_00" },
    },
})

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################
mod.fixes_owo_tacax_spike(this_variant, "head", "shaft")
mod.fixes_owo_polearm_head(this_variant, "head", "shaft")
mod.fixes_owo_ogryn_shaft_low_grip(this_variant, "shaft")

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Head: Tacax Spike
    -- ######
    -- Lowers it so the actual axehead is where the hammer head is usually
    {	dependencies =  { _owo_all_tacax_spike_heads },
        head =   { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 90), scale = vector3_box(2.5, 2.5, 2.5), },
    },
    -- ######
    -- Head: Polearm heads
    -- ######
    -- Lowers it so the actual axehead is where the hammer head is usually
    {	dependencies =  { _owo_polearm_heads },
        head =   { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 90), scale = vector3_box(2.5, 2.5, 2.5), },
    },
})
