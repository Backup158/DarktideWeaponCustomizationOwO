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
mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Head: Shovel Handles
    -- ALL of these are only really aligned for shovel_grip_02
    --  minor gaps for others, really small for ogryn grips
    -- ######
    --  -------------------------------------------
    --  The fucked up mini /\ handle
    --  -------------------------------------------
    {	dependencies =  { "owo_shovel_handles_01"},
        pommel =        { offset = true, position = vector3_box(0, 0.012, 0.003), rotation = vector3_box(84, 0, 0), scale = vector3_box(1, 1, 0.488 ) },
    },
    --  -------------------------------------------
    --  The proper three arms
    --  -------------------------------------------
    {	dependencies =  { "owo_shovel_handles_02"},
        pommel =        { offset = true, position = vector3_box(0, -0.009, -0.043), rotation = vector3_box(107, 0, 0), scale = vector3_box(1, 0.69, 0.275 ) },
        pommelac1 =     { offset = true, position = vector3_box(0, 0.015, -0.059), rotation = vector3_box(63, 0, 0), scale = vector3_box(1, 0.69, 0.275 ) },
        pommelac2 =     { offset = true, position = vector3_box(0, -0.01, -0.244), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.46, 0.38, 0.55 ) },
    },
    --  -------------------------------------------
    --  The classic D-ring handle
    --  -------------------------------------------
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
    --  -------------------------------------------
    --  D-ring handle (double chainswords)
    --  -------------------------------------------
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
    --  -------------------------------------------
    --  T-Handle (Ogryn pommelac2)
    --  -------------------------------------------
    {	dependencies =  { "shovel_grip_02", "owo_shovel_handles_09|owo_shovel_handles_10"},
        pommel =        { offset = false, position = vector3_box(-0.0, 0.00, -0.15), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.00, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.35, 0.25, 0.5 ) },
    },
    {	dependencies =  { "owo_shovel_handles_09|owo_shovel_handles_10"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.1), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.00, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.35, 0.25, 0.5 ) },
    },
    --  -------------------------------------------
    --  T-Handle (Double Ogryn)
    --  -------------------------------------------
    {	dependencies =  { "owo_shovel_handles_11"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.35, 0.25, 0.5 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.00, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(0.35, 0.25, 0.5 ) },
    },
    --  -------------------------------------------
    --  T-Handle (Ogryn pommel, humie handle)
    --  -------------------------------------------
    {	dependencies =  { "owo_shovel_handles_12"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.086), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.35, 0.25, 0.5 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.018, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(1.0, 1.0, 0.65 ) },
    },
    --  -------------------------------------------
    --  T-Handle (double human)
    --  -------------------------------------------
    {	dependencies =  { "owo_shovel_handles_13"},
        pommel =        { offset = true, position = vector3_box(-0.0, 0.00, -0.128), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 0.4 ) },
        pommelac2 =     { offset = true, position = vector3_box(0.00, -0.018, -0.162), rotation = vector3_box(-90, 0, -180), scale = vector3_box(1.0, 1.0, 0.65 ) },
    },

    -- ####################################################################################
    -- HIDING HELPERS
    -- By putting it down here, they will only be hidden if the fixes from above are not found
    -- Because they match the main parts first, if there is no match it means the main part is not attached
    -- ####################################################################################
    -- Pommel
    {	dependencies = {"owo_shovel_handles_ac1_01|owo_shovel_handles_ac1_02|owo_shovel_handles_ac1_03|owo_shovel_handles_ac1_04|owo_shovel_handles_ac1_05"},
        pommelac1 = { hide_mesh = {{"pommelac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {	dependencies = {"owo_shovel_handles_ac2_01|owo_shovel_handles_ac2_02|owo_shovel_handles_ac2_03|owo_shovel_handles_ac2_04"},
        pommelac2 = { hide_mesh = {{"pommelac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
