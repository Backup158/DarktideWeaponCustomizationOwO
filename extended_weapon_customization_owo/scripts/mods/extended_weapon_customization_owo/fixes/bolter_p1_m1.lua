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
return {
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
                1,
                position = vector3_box(0, -0.071, 0.065),
                --scale = vector3_box(1.25, 1.25, 1.25),
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
                1,
                position = vector3_box(0, -0.075, 0.065),
                scale = vector3_box(1.25, 1.25, 1.25),
            },
        },
    },
    {
        attachment_slot = "stock",
        requirements = {
            stock = {
                has = "owo_tactical_stock_folded_n_1|owo_tactical_stock_folded_n_m",
            },
        },
        fix = {
            offset = {
                1,
                position = vector3_box(-0.015, -0.05, 0.055),
                --rotation = vector3_box(0, 0, -176),
                scale = vector3_box(1.25, 1.25, 1.25),
            },
        },
    },
    {
        attachment_slot = "stock",
        requirements = {
            stock = {
                has = "owo_tactical_stock_folded_n_u",
            },
        },
        fix = {
            offset = {
                1,
                position = vector3_box(0, -0.08, 0.065),
                scale = vector3_box(1.3, 1.22, 1.25),
            },
        },
    },
}