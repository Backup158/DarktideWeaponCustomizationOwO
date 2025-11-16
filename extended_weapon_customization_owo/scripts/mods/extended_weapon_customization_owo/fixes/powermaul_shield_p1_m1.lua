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
local all_owo_sight_reticle_names = create_requirements_string_from_names_table(mod.all_owo_sight_reticle_names)

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################


local custom_fixes = {
    -- Slim Blades
    {
        attachment_slot = "head",
        requirements = {
            blade_indicator = {
                has = "owo_indicator_blade_slim_blade_flat_pfalchion",
            },
        },
        fix = {
            offset = {
                --position = vector3_box(0, -0.071, 0.065),
                rotation = vector3_box(0, 0, 180),
                --scale = vector3_box(1.25, 1.25, 1.25),
            },
        },
    },
}

local custom_attachments = {
    blade_indicator = {
        parent_slot = "head",
        default_path = _item_empty_trinket,
    }
}

return {
    fixes = custom_fixes,
    attachment_slots = custom_attachments,
}