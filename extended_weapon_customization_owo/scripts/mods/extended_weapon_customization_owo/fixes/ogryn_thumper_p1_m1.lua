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
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

local dump_if_debug = mod.dump_if_debug
local info_if_debug = mod.info_if_debug

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################
--dump_if_debug(mod.all_suppressor_names, "SUPPRESSOR NAMES CALLED FROM THUMPER", 10)
local all_suppressor_names = mod.all_suppressor_names
local any_suppressor = mod.create_requirements_string_from_names_table(all_suppressor_names)
--info_if_debug(any_suppressor)

local custom_fixes = {
    --[[
    -- Attempting to attach to muzzle when parented to body
    {
        attachment_slot = "muzzle",
        requirements = {
            muzzle = {
                has = any_suppressor,
            },
        },
        fix = {
            offset = {
                node = 12,
                --position = vector3_box(0.0, -0.07, 0.065),
                --rotation = vector3_box(0, 0, 0),
                --scale = vector3_box(1.25, 1.25, 1.25),
            },
        },
    },
    ]]
}

local custom_attachments = {
    muzzle = {
        parent_slot = "sight",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.0, 0.32, -0.146),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(2.8, 2.8, 2.8),
                -- nodes if parented to body
                --  1 doesn't attach when animating
                --  12, 13: ctd
                 node = 1,
            },
        },
    },
}
-- Patches for if other plugins already defined
local ewc_ba = get_mod("extended_weapon_customization_base_additions")
if not ewc_ba then
    custom_attachments.flashlight = {
        parent_slot = "sight",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.12, -0.15, -0.13),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1.5, 1.5, 1.5),
                node = 1,
            },
        },
    }
end

return {
    fixes = custom_fixes,
    attachment_slots = custom_attachments,
}