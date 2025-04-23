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
--[[ Covered Parts
-- By Syn
--mod.wc.attachment[this_variant].bladeshroud = {}
--mod.wc.attachment[this_variant].bladeshroudac = {}
--mod.wc.attachment[this_variant].bladeshroudac2 = {}
--mod.wc.attachment[this_variant].bladeshroudac10 = {}
--mod.wc.attachment[this_variant].bladeshroudac11 = {}
--mod.wc.attachment[this_variant].bladeshroudac12 = {}
--mod.wc.attachment[this_variant].bladeshroudac13 = {}
]]

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_slim_psword(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
local _owo_slim_psword_blades = "owo_slim_psword_01|owo_slim_psword_02|owo_slim_psword_03|owo_slim_psword_04|owo_slim_psword_05|owo_slim_psword_06|owo_slim_psword_07|owo_slim_psword_08"
local _owo_thin_psword_blades = "owo_slim_psword_01t|owo_slim_psword_02t|owo_slim_psword_03t|owo_slim_psword_04t|owo_slim_psword_05t|owo_slim_psword_06t|owo_slim_psword_07t|owo_slim_psword_08t"

local _power_sword_grips = "power_sword_grip_01|power_sword_grip_02|power_sword_grip_03|power_sword_grip_04|power_sword_grip_05|power_sword_grip_06"

mod.mt.inject_fixes(this_variant, {
    --  Slim Power Sword
    --      Hilt Patches
    {   dependencies =  { _owo_slim_psword_blades, _power_sword_grips },
        hilt = {position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
    },
    {   dependencies =  { _owo_slim_psword_blades },
        hilt = {position = vector3_box(0, 0, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
        blade = {position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 1)},
    },
    --  Thin Power Sword
    --      Hilt Patches
    {   dependencies =  { _owo_thin_psword_blades, _power_sword_grips },
        hilt = {position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
    },
    {   dependencies =  { _owo_thin_psword_blades },
        hilt = {position = vector3_box(0, 0, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
        blade = {position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 0.65, 1)},
    },
})
