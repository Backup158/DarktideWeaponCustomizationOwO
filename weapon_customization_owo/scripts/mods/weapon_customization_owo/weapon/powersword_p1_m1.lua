local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "powersword_p1_m1" -- Power Sword

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
-- Covered by Syn
--mod.wc.attachment[this_variant].bladeshroud = {}
--mod.wc.attachment[this_variant].bladeshroudac = {}
--mod.wc.attachment[this_variant].bladeshroudac2 = {}
--mod.wc.attachment[this_variant].bladeshroudac10 = {}
--mod.wc.attachment[this_variant].bladeshroudac11 = {}
--mod.wc.attachment[this_variant].bladeshroudac12 = {}
--mod.wc.attachment[this_variant].bladeshroudac13 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_slim_blade(this_variant)
mod.owo_crossguard(this_variant, "hilt", "grip")

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

-- ########
-- For This Variant Only
-- ########
local _power_sword_grips = "power_sword_grip_01|power_sword_grip_02|power_sword_grip_03|power_sword_grip_04|power_sword_grip_05|power_sword_grip_06"

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
mod.fixes_owo_slim_blade(this_variant)
mod.fixes_owo_crossguard(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- PSword
    --      Flat Power Sword
    --          Hilt Patches
    {   dependencies =  { _owo_flat_psword_g_blades, _power_sword_grips },
        hilt =  { position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
    },
    --      Slim Power Sword
    --          Hilt Patches
    {   dependencies =  { _owo_slim_psword_g_blades, _power_sword_grips },
        hilt =  { position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
    },
})
