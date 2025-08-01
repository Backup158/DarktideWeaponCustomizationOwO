local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "combataxe_p3_m1" -- Sapper Shovel
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
    "head2",
    "pommelac1",
    "pommelac2",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_shovel_handles(this_variant, "pommel")

-- ############################################
-- Define Variables for Fixes
-- ############################################

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

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Head: Shovel Handles
    -- ALL of these are only really aligned for shovel_grip_02
    --  minor gaps for others, really small for ogryn grips
    -- ######
    --  --------------------------------------------
    --  The fucked up mini /\ handle
    --  --------------------------------------------
    {	dependencies =  { "owo_shovel_handles_01"},
        pommel =        { offset = true, position = vector3_box(0, 0.012, 0.003), rotation = vector3_box(84, 0, 0), scale = vector3_box(1, 1, 0.488 ) },
    },
    --  --------------------------------------------
    --  The proper three arms
    --  --------------------------------------------
    {	dependencies =  { "owo_shovel_handles_02"},
        pommel =        { offset = true, position = vector3_box(0, -0.009, -0.043), rotation = vector3_box(107, 0, 0), scale = vector3_box(1, 0.69, 0.275 ) },
        pommelac1 =     { offset = true, position = vector3_box(0, 0.015, -0.059), rotation = vector3_box(63, 0, 0), scale = vector3_box(1, 0.69, 0.275 ) },
        pommelac2 =     { offset = true, position = vector3_box(0, -0.01, -0.244), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.46, 0.38, 0.55 ) },
    },
    --  --------------------------------------------
    --  The classic D-ring handle
    --  --------------------------------------------
    {	dependencies =  { "owo_shovel_handles_03"},
        pommel =        { offset = true, position = vector3_box(-0.012, -0.036, -0.208), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.6, 0.64, 0.7 ) },
        pommelac1 =     { offset = true, position = vector3_box(0.008, 0.047, -0.208), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.6, 0.64, 0.7 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.014, 0.002, -0.065), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.75, 0.5, 0.67 ) },
    },
    {	dependencies =  { "owo_shovel_handles_04"},
        pommel =        { offset = true, position = vector3_box(-0.0, -0.036, -0.208), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.6, 0.64, 0.7 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.0, 0.002, -0.065), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.75, 0.5, 0.67 ) },
    },
    {	dependencies =  { "owo_shovel_handles_05"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.036, -0.208), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.6, 0.64, 0.7 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.0, 0.002, -0.065), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.75, 0.5, 0.67 ) },
    },
    --  --------------------------------------------
    --  D-ring handle (double chainswords)
    --  --------------------------------------------
    {	dependencies =  { "shovel_grip_01", "owo_shovel_handles_07|owo_shovel_handles_08" },
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.125), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 0.5, 0.5 ) },
        pommelac1 =     { offset = true, position = vector3_box(0.00, -0.00, -0.125), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.8, 0.5, 0.5 ) },
    },
    {	dependencies =  { "owo_shovel_handles_07|owo_shovel_handles_08"},
        -- pommel = { offset = true, position = vector3_box(-0.0, 0.004, -0.194), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.0, 1.0, 0.8 ) }, -- alt sizing. i think the gap and grip are too big
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.15), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 0.5, 0.5 ) },
        pommelac1 =     { offset = true, position = vector3_box(0.00, -0.00, -0.15), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.8, 0.5, 0.5 ) },
    },
    --  Big
    {	dependencies =  { "shovel_grip_01", "owo_shovel_handles_07b|owo_shovel_handles_08b"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.15), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 0.8, 0.75 ) },
        pommelac1 =     { offset = true, position = vector3_box(0.00, -0.00, -0.15), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.8, 0.8, 0.75 ) },
    },
    {	dependencies =  { "owo_shovel_handles_07b|owo_shovel_handles_08b"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.175), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 0.8, 0.75 ) },
        pommelac1 =     { offset = true, position = vector3_box(0.00, -0.00, -0.175), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.8, 0.8, 0.75 ) },
    },
    --  --------------------------------------------
    --  T-Handle (Ogryn pommelac2)
    --  --------------------------------------------
    {	dependencies =  { "shovel_grip_02", "owo_shovel_handles_09|owo_shovel_handles_10"},
        pommel =        { offset = false, position = vector3_box(-0.0, 0.00, -0.15), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.00, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.35, 0.25, 0.5 ) },
    },
    {	dependencies =  { "owo_shovel_handles_09|owo_shovel_handles_10"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.1), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.00, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.35, 0.25, 0.5 ) },
    },
    --  --------------------------------------------
    --  T-Handle (Double Ogryn)
    --  --------------------------------------------
    {	dependencies =  { "owo_shovel_handles_11"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.35, 0.25, 0.5 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.00, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.35, 0.25, 0.5 ) },
    },
    --  --------------------------------------------
    --  T-Handle (Ogryn pommel, humie handle)
    --  --------------------------------------------
    {	dependencies =  { "owo_shovel_handles_12"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.086), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.35, 0.25, 0.5 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.018, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(1.0, 1.0, 0.65 ) },
    },
    --  --------------------------------------------
    --  T-Handle (double human)
    --  --------------------------------------------
    {	dependencies =  { "owo_shovel_handles_13"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.128), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 0.4 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.018, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(1.0, 1.0, 0.65 ) },
    },
})
