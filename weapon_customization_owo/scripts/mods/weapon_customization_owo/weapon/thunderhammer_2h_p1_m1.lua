local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "thunderhammer_2h_p1_m1" -- Thunder Hammer

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
if not syn then
    mod.wc.attachment[this_variant].bladeshroud = {}
end

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_tacax_spike(this_variant, "head", "shaft")
mod.owo_invisible_connector(this_variant, "connector", "shaft")

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_all_tacax_spike_heads = "owo_tacax_spike_01|owo_tacax_spike_02|owo_tacax_spike_03|owo_tacax_spike_04|owo_tacax_spike_05|owo_tacax_spike_06|owo_tacax_spike_07"
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
    {	dependencies = {"owo_tacax_spike_helper_01"},
        bladeshroud = { hide_mesh = {{"bladeshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################
mod.fixes_owo_tacax_spike(this_variant, "head", "shaft")

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
})
