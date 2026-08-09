local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local create_requirements_string_from_names_table = mod.create_requirements_string_from_names_table

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

-- ################################
-- Attachment Names for Fixes
-- ################################
local shared_fix_tables = mod.shared_fix_tables
local owo_chainsword_2h_with_gap = mod.owo_chainsword_2h_with_gap

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################
local custom_fixes = {
    -- Chainsword Blades
    {   attachment_slot = "body",
        requirements = {
            stock = {
                has = owo_chainsword_2h_with_gap,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0, -0.034),
                --rotation = vector3_box(0, 0, 0),
                --scale = vector3_box(1.0, 1.0, 1.0),
            },
        },
    },
}

local custom_attachments = nil
return {
    fixes = custom_fixes,
    attachment_slots = custom_attachments,
}