local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "combatsword_p1_m1" -- Catachan "Devil's Claw" Sword
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
    "crossguard",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_rapier_blade(this_variant)
mod.owo_slim_blade(this_variant, "body", "grip")
mod.owo_crossguard(this_variant, "crossguard", "grip")

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_flat_psword_blades = "owo_flat_psword_01|owo_flat_psword_02|owo_flat_psword_03|owo_flat_psword_04|owo_flat_psword_05|owo_flat_psword_06|owo_flat_psword_07|owo_flat_psword_08"
local _owo_slim_psword_blades = "owo_slim_psword_01|owo_slim_psword_02|owo_slim_psword_03|owo_slim_psword_04|owo_slim_psword_05|owo_slim_psword_06|owo_slim_psword_07|owo_slim_psword_08"
local _owo_flat_psword_g_blades = "owo_flat_psword_01g|owo_flat_psword_02g|owo_flat_psword_03g|owo_flat_psword_04g|owo_flat_psword_05g|owo_flat_psword_06g|owo_flat_psword_07g|owo_flat_psword_08g"
local _owo_slim_psword_g_blades = "owo_slim_psword_01g|owo_slim_psword_02g|owo_slim_psword_03g|owo_slim_psword_04g|owo_slim_psword_05g|owo_slim_psword_06g|owo_slim_psword_07g|owo_slim_psword_08g"
local _owo_flat_all_psword_blades = _owo_flat_psword_blades.."|".._owo_flat_psword_g_blades
local _owo_slim_all_psword_blades = _owo_slim_psword_blades.."|".._owo_slim_psword_g_blades
local _owo_all_psword_g_blades = _owo_flat_psword_g_blades.."|".._owo_slim_psword_g_blades
local _owo_flat_dclaw_blades = "owo_flat_dclaw_01|owo_flat_dclaw_02|owo_flat_dclaw_03|owo_flat_dclaw_04|owo_flat_dclaw_05|owo_flat_dclaw_06|owo_flat_dclaw_07|owo_flat_dclaw_08"
local _owo_flat_dclaw_g_blades = "owo_flat_dclaw_01g|owo_flat_dclaw_02g|owo_flat_dclaw_03g|owo_flat_dclaw_04g|owo_flat_dclaw_05g|owo_flat_dclaw_06g|owo_flat_dclaw_07g|owo_flat_dclaw_08g"
local _owo_flat_all_dclaw_blades = _owo_flat_dclaw_blades.."|".._owo_flat_dclaw_g_blades
local _owo_slim_dclaw_blades = "owo_slim_dclaw_01|owo_slim_dclaw_02|owo_slim_dclaw_03|owo_slim_dclaw_04|owo_slim_dclaw_05|owo_slim_dclaw_06|owo_slim_dclaw_07|owo_slim_dclaw_08"
local _owo_slim_dclaw_g_blades = "owo_slim_dclaw_01g|owo_slim_dclaw_02g|owo_slim_dclaw_03g|owo_slim_dclaw_04g|owo_slim_dclaw_05g|owo_slim_dclaw_06g|owo_slim_dclaw_07g|owo_slim_dclaw_08g"
local _owo_slim_all_dclaw_blades = _owo_slim_dclaw_blades.."|".._owo_slim_dclaw_g_blades
local _owo_all_dclaw_g_blades = _owo_flat_dclaw_g_blades.."|".._owo_slim_dclaw_g_blades

local _mt_knife_grips = "knife_mt_grip_01|knife_mt_grip_02|knife_mt_grip_03|knife_mt_grip_04|knife_mt_grip_05|knife_mt_grip_06|knife_mt_grip_07"
--local _mt_falchion_grips = "falchion_mt_grip_01|falchion_mt_grip_02|falchion_mt_grip_03|falchion_mt_grip_04|falchion_mt_grip_05"
local _mt_tacax_grips = "hatchet_mt_grip_01|hatchet_mt_grip_02|hatchet_mt_grip_03|hatchet_mt_grip_04|hatchet_mt_grip_05|hatchet_mt_grip_06"
local _mt_ogryn_grips = "ogrynbladehandle_01|ogrynbladehandle_02|ogrynbladehandle_03|ogrynbladehandle_04|ogrynbladehandle_05|ogrynbladehandle_06"

-- ########
-- For This Variant Only
-- ########
local _combat_sword_grips = "combat_sword_grip_01|combat_sword_grip_02|combat_sword_grip_03|combat_sword_grip_04|combat_sword_grip_05|combat_sword_grip_06|combat_sword_grip_ml01"

-- ############################################
-- Inject Fixes
-- ############################################
-- #################
-- HIDING HELPERS
-- By putting it up here, it ends up at the bottom of the list, so they will only be hidden if the fixes from above are not found
-- Because they match the main parts first, if there is no match it means the main part is not attached
-- #################
--mod.mt.inject_fixes(this_variant, {
    
--})

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################
mod.fixes_owo_slim_blade(this_variant, "body", "grip")
mod.fixes_owo_crossguard(this_variant, "crossguard", "grip")

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- Body: Rapier Blade
    --  Why did I choose 5 blades with wildly different proportions
    --  Just love making more work for myself eh
    -- MT Combat knife grip patch
    {   dependencies = { "owo_rapier_blade_01", _mt_knife_grips },
        -- grip = {mesh_move = true, position = vector3_box(0, 0, 0), rotation = vector3_box(-1, 0, 0), scale = vector3_box(1, 1, 1.6), scale_node = 1},
        body = { offset = true,   position = vector3_box(0, 0.0, -0.034),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.6, 1.7) },
    },
    {   dependencies = { "owo_rapier_blade_02", _mt_knife_grips },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.06),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.5, 1.7) },
    },
    {   dependencies = { "owo_rapier_blade_03", _mt_knife_grips },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.25, 0.6) },
    },
    {   dependencies = { "owo_rapier_blade_04", _mt_knife_grips },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.3, 0.6) },
    },
    {   dependencies = { "owo_rapier_blade_05", _mt_knife_grips },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.2, 0.6) },
    },
    -- MT Tacax grip patch
    {   dependencies = { "owo_rapier_blade_01", _mt_tacax_grips, },
        -- grip = {mesh_move = true, position = vector3_box(0, 0, 0), rotation = vector3_box(-1, 0, 0), scale = vector3_box(1, 1, .5), node = 1},
        body = { offset = true,   position = vector3_box(0, 0.0, -0.034),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.6, 6) },
    },
    {   dependencies = { "owo_rapier_blade_02", _mt_tacax_grips, },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.06),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.5, 6) },
    },
    {   dependencies = { "owo_rapier_blade_03", _mt_tacax_grips, },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.25, 2) },
    },
    {   dependencies = { "owo_rapier_blade_04", _mt_tacax_grips, },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.3, 2) },
    },
    {   dependencies = { "owo_rapier_blade_05", _mt_tacax_grips, },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.2, 2) },
    },
    -- MT Ogryn grip patch
    {   dependencies = { "owo_rapier_blade_01", _mt_ogryn_grips, },
        -- grip = {mesh_move = "both", position = vector3_box(0, 0, 0), rotation = vector3_box(-1, 0, 0), scale = vector3_box(.35, .35, .6), },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.034),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.7, 1.7, 5) },
    },
    {   dependencies = { "owo_rapier_blade_02", _mt_ogryn_grips, },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.06),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.7, 1.4, 5) },
    },
    {   dependencies = { "owo_rapier_blade_03", _mt_ogryn_grips, },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.7, 0.9, 1.7) },
    },
    {   dependencies = { "owo_rapier_blade_04", _mt_ogryn_grips, },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.7, 1, 1.7) },
    },
    {   dependencies = { "owo_rapier_blade_05", _mt_ogryn_grips, },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.9, 0.85, 1.7) },
    },
    -- Generic Case
    --  Knife based
    {   dependencies = { "owo_rapier_blade_01" },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.034),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.6, 3) },
    },
    --      The one with the hole
    {   dependencies = { "owo_rapier_blade_02" },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.06),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.5, 3) },
    },
    --  Force sword based
    {   dependencies = { "owo_rapier_blade_03" },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 0.25, 1) },
    },
    --      Fat blade
    {   dependencies = { "owo_rapier_blade_04" },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.00),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.3, 1) },
    },
    --      ULTRA GIRTHY Deimos blade
    {   dependencies = { "owo_rapier_blade_05" },
        body = { offset = true,   position = vector3_box(0, 0.0, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.2, 1) },
    },

    -- #######
    -- Blade: Flat Blades
    -- #######
    {   dependencies = { _owo_flat_dclaw_blades, _combat_sword_grips },
        body = { position = vector3_box(0, 0, 0.09), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
    },
})
