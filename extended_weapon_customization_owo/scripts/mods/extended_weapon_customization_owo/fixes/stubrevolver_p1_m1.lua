local mod = get_mod("extended_weapon_customization_owo")
local ewc_ba = get_mod("extended_weapon_customization_base_additions")

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


local custom_fixes = {

}

local custom_attachments = {
    flashlight_under_small = {
        parent_slot = "barrel",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.0, 0.185, -0.02),
                rotation = vector3_box(0, 90, 0),
                scale = vector3_box(0.5, 0.5, 0.5),
                node = 1,
            },
        },
    },
    --[[
    muzzle = {
        parent_slot = "barrel",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0, 0.2, 0.015),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    ]]
    
}
-- define if not already using base additions
--  not just copying those values because i dont like them :3
--  but i'm also not going to overwrite another plugin
if not ewc_ba then
    custom_attachments.flashlight = {
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
    }
    -- Barrel parent has a weird issue with one barrel in particular (idk the name. the one with the grippy part in the front)
    --  somehow rail parent just works
    --  copied for ewc_base_additions
    custom_attachments.muzzle = {
        parent_slot = "rail",
        default_path = _item_empty_trinket,
    }
end

return {
    --fixes = custom_fixes,
    attachment_slots = custom_attachments,
}