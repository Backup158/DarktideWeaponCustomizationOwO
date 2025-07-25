local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "thunderhammer_2h_p1_m1" -- Thunder Hammer
local _hide_slot_table = mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/common/hide_slot")

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
-- ###############
-- MT Plugin Compatibility
-- ###############
local table_of_mt_slots = {
    
}
for _, slot_name in ipairs(table_of_mt_slots) do
    mod.create_default_attachment(this_variant, slot_name)
end

-- ###############
-- Syn's Edits Compatibility
-- ###############
local table_of_syn_slots = {
    "bladeshroud",
    "bladeshroudac",
    "bladeshroudac2",
    "bladeshroudac3",
}
if not mod.syn then -- these slots already exist in Syn's plugin
    mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_syn_slots)
else
    for _, slot_name in ipairs(table_of_syn_slots) do
        mod.create_default_attachment(this_variant, slot_name)
    end
end

-- ###############
-- OwO Slot Initialization
-- ###############
local table_of_owo_slots = {
    "shaftac1",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_tacax_spike(this_variant, "head", "shaft")
mod.owo_polearm_head(this_variant, "head", "shaft")
mod.owo_crutch_head(this_variant, "head", "shaft")

mod.owo_invisible_connector(this_variant, "connector", "shaft")

mod.owo_shaft_low_grip(this_variant, "shaft")

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
local _owo_low_grip_shafts = "owo_shaft_low_grip_01|owo_shaft_low_grip_02|owo_shaft_low_grip_03|owo_shaft_low_grip_04|owo_shaft_low_grip_05|owo_shaft_low_grip_06"
    
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
for _, slots_table in ipairs({table_of_mt_slots, table_of_syn_slots, table_of_owo_slots}) do
    for _, slot_name in pairs(slots_table) do
        mod.mt.inject_fixes(this_variant, {
            mod.hide_slot(slot_name, { mod.hide_slot_fixes[slot_name] }),
        })
    end
end

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################
mod.fixes_owo_tacax_spike(this_variant, "head", "shaft")
mod.fixes_owo_polearm_head(this_variant, "head", "shaft")
mod.fixes_owo_crutch_head(this_variant, "head", "shaft")

mod.fixes_owo_invisible_connector(this_variant)

mod.fixes_owo_shaft_low_grip(this_variant, "shaft")

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Head: Tacax Spike
    -- ######
    -- Lowers it so the actual axehead is where the hammer head is usually
    {	dependencies =  { _owo_all_tacax_spike_heads },
        head =   { offset = true, position = vector3_box(0, 0, 0.61) },
    },
    -- ######
    -- Head: Polearm heads
    -- ######
    -- Lowers it so the actual axehead is where the hammer head is usually
    {	dependencies =  { _owo_polearm_heads },
        head =   { offset = true, position = vector3_box(0, 0, 0.61) },
    },
})
