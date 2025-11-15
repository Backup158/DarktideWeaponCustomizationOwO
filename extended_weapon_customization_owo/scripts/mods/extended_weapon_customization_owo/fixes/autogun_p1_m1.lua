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
local these_fixes = {
    -- Tactical Stocks
    {
        attachment_slot = "stock",
        requirements = {
            stock = {
                has = "owo_tactical_stock_skeletal",
            },
        },
        fix = {
            offset = {
                -- position = vector3_box(0.0, 0.0, 0.01),
                position = vector3_box(0.0, 0.2, 0.02),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1.95, 1),
            },
        },
    },
    {
        attachment_slot = "stock",
        requirements = {
            stock = {
                has = "owo_tactical_stock_telescoping_in",
            },
        },
        fix = {
            offset = {
                -- position = vector3_box(0.0, 0.12, 0.015),
                position = vector3_box(0.0, 0.12, 0.015),
                rotation = vector3_box(0, 0.035, 0),
                scale = vector3_box(1, 1.0, 1),
            },
        },
    },
    -- Holographic Sights
    {
        attachment_slot = "sight_offset",
        requirements = {
            sight_group_indicator = {
                has = "owo_indicator_sight_eotech",
            },
        },
        fix = {
            offset = {
                -- position = vector3_box(0.0, 0.12, 0.015),
                position = vector3_box(0.0, 0.0, -0.02),
                rotation = vector3_box(0, 0.0, 0),
                scale = vector3_box(1, 1.0, 1),
            },
        },
    },
    -- Sight Reticles
    {
        attachment_slot = "sight_reticle",
        requirements = {
            sight_group_indicator = {
                has = "owo_indicator_sight_eotech",
            },
            sight_reticle = {
                has = all_owo_sight_reticle_names,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, 0.01),
                rotation = vector3_box(0, 0.0, 0),
                scale = vector3_box(1, 1.0, 1),
            },
            --[[
            hide = {
                mesh = {5,6},
            },
            --]]
        },
    },
}

local custom_attachments = {
    sight_reticle = {
        parent_slot = "sight",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0, 0, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
}

return {
    fixes = these_fixes,
    attachment_slots = custom_attachments,
}