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
            node = 3,
            offset = {
                position = vector3_box(0.0, -0.02, 2.3),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1.95, 1),
            },
        },
    },
    -- Filling in for Helbore
    {   attachment_slot = "stock_ac1",
        requirements = {
            stock = {
                has = "owo_tactical_stock_skeletal",
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, -0.02),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(0.35, 0.5, 0.65),
            },
        },
    },
}