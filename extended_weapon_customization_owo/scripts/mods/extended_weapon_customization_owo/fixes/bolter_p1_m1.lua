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
local folded_stock_n_l_pos = vector3_box(-0.015, -0.12, 0.075)
local folded_stock_n_l_rot = vector3_box(0, 0, -174)

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
                node = 1,
                position = vector3_box(0, -0.071, 0.075),
                scale = vector3_box(1.25, 1.1, 1.25),
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
                node = 1,
                position = vector3_box(0, -0.075, 0.065),
                scale = vector3_box(1.25, 1.25, 1.25),
            },
        },
    },
    {
        attachment_slot = "stock",
        requirements = {
            stock = {
                has = "owo_tactical_stock_folded_n_1",
            },
        },
        fix = {
            offset = {
                node = 1,
                position = folded_stock_n_l_pos,
                rotation = folded_stock_n_l_rot,
                scale = vector3_box(1.25, 1.25, 1.25),
            },
        },
    },
    {
        attachment_slot = "stock",
        requirements = {
            stock = {
                has = "owo_tactical_stock_folded_n_m",
            },
        },
        fix = {
            offset = {
                node = 1,
                position = folded_stock_n_l_pos,
                rotation = folded_stock_n_l_rot,
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
                node = 1,
                position = vector3_box(0, -0.13, 0.065),
                rotation = vector3_box(174, 0, 0),
                scale = vector3_box(3.3, 1.7, 1.25),
            },
        },
    },
}