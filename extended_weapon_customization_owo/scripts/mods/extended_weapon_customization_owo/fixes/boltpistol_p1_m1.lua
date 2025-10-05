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
                position = vector3_box(0, -0.12, 0.055),
                scale = vector3_box(1.1, 1, 1),
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
                position = vector3_box(-0.015, -0.09, 0.045),
                --rotation = vector3_box(0, 0, -176),
                scale = vector3_box(1, 1, 0.9),
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
                position = vector3_box(0, -0.11, 0.05),
                scale = vector3_box(1.0, 1.05, 1.0),
            },
        },
    },
}