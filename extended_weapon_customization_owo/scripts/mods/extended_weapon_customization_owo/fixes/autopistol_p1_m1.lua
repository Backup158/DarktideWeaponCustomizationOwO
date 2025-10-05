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
                position = vector3_box(0.0, -0.07, 0.065),
                --rotation = vector3_box(0, 0, 0),
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
                position = vector3_box(0, -0.085, 0.065),
                --scale = vector3_box(1.25, 1.25, 1.25),
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
                position = vector3_box(-0.015, -0.075, 0.055),
                --rotation = vector3_box(0, 0, -176),
                --scale = vector3_box(1.25, 1.25, 1.25),
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
                position = vector3_box(0, -0.085, 0.065),
                scale = vector3_box(1.0, 0.9, 1.0),
            },
        },
    },
}