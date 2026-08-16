local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"

-- ################################
-- Attachment Names for Fixes
-- ################################
local shared_fix_tables = mod.shared_fix_tables

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################


local custom_fixes = {
    
    shared_fix_tables["default_sight_reticle_position_holo"],
}

local custom_attachments = {
    flashlight = {
        parent_slot = "barrel",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.015, 0.17, 0.005),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(0.75, 0.75, 0.75),
                node = 1,
            },
        },
    },
    sight_reticle = shared_fix_tables["default_attachment_sight_reticle"],
    owo_underbarrel_weapon = {
        parent_slot = "receiver",
        default_path = _item_empty_trinket,
        fix = {
            offset= {
                position = vector3_box(0.0, 0.036, -0.13),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(0.75, 0.75, 0.75),
                node = 1,
            },
        },
    },
}

return {
    fixes = custom_fixes,
    attachment_slots = custom_attachments,
}