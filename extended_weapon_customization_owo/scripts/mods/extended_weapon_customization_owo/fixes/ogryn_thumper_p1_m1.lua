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

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################
--table.dump(mod.all_suppressor_names, "SUPPRESSOR NAMES CALLED FROM THUMPER", 10)
local all_suppressor_names = mod.all_suppressor_names
local all_suppressors = mod.create_requirements_string_from_names_table(all_suppressor_names)

local custom_fixes = {

}

local custom_attachments = {
    muzzle = {
        parent_slot = "body",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.0, 1.08, 0.25),
                --position = vector3_box(0.0, 0.0, 0.0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(2.8, 2.8, 2.8),
                -- 1 doesn't attach when animating
                -- 12, 13: ctd
                 node = 1,
                --node = 13,
            },
        },
    },
}
-- Patches for if other plugins already defined
local ewc_ba = get_mod("extended_weapon_customization_base_additions")
if not ewc_ba then
    custom_attachments.flashlight = {
        parent_slot = "body",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.12, 0.15, 0.13),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1.5, 1.5, 1.5),
                node = 1,
            },
        },
    }
end

return {
    --fixes = custom_fixes,
    attachment_slots = custom_attachments,
}