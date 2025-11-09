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
                position = vector3_box(0, -0.071, 0.065),
                --rotation = vector3_box(0, 0, 0),
                --scale = vector3_box(1.25, 1.25, 1.25),
            },
        },
    },
}

local custom_attachments = {
    muzzle = {
        --parent_slot = "barrel",
        parent_slot = "receiver",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.0, 1.35, 0.0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(2.5, 2.5, 2.5),
                -- for barrel parent
                -- 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15: doesnt change fixes; no ctd
                --  absolutely none of the offsets will respond
                --  what
                --  the
                --  FUCK
                node = 1,
            },
        },
    }
}
-- Patches for if other plugins already defined
local ewc_ba = get_mod("extended_weapon_customization_base_additions")
if not ewc_ba then
    custom_attachments.flashlight = {
        parent_slot = "receiver",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, 0.0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(2.5, 2.5, 2.5),
                node = 1,
            },
        },
    }
end

return {
    --fixes = custom_fixes,
    attachment_slots = custom_attachments,
}