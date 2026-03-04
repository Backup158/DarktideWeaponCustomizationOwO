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

local short_arbites_barrels = "syn_assaultshotgun_barrel_01|syn_assaultshotgun_barrel_03|syn_assaultshotgun_barrel_04|syn_assaultshotgun_barrel_05"
local slightly_shorter_barrels = "shotgun_rifle_barrel_01|shotgun_rifle_barrel_07|shotgun_rifle_barrel_08|shotgun_rifle_barrel_09|shotgun_rifle_barrel_10"
local long_barrels = "shotgun_rifle_barrel_04"

local all_owo_suppressors = mod.any_suppressor

local custom_fixes = {
    -- Tactical Stocks
        {   attachment_slot = "stock",
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
        {   attachment_slot = "stock",
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
        {   attachment_slot = "stock",
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
        {   attachment_slot = "stock",
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
        {   attachment_slot = "stock",
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
    -- Suppressors
        {   attachment_slot = "muzzle",
            requirements = {
                muzzle = {
                    -- has = "query:shotgun_p1_m1,muzzle,extended_weapon_customization_owo",
                    has = all_owo_suppressors,
                },
                barrel = {
                    has = short_arbites_barrels,
                },
            },
            fix = {
                offset = {
                    position = vector3_box(0, -0.084, 0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                    node = 1,
                },
            },
        },
        {   attachment_slot = "muzzle",
            requirements = {
                muzzle = {
                    -- has = "query:shotgun_p1_m1,muzzle,extended_weapon_customization_owo",
                    has = all_owo_suppressors,
                },
                barrel = {
                    has = slightly_shorter_barrels,
                },
            },
            fix = {
                offset = {
                    position = vector3_box(0, -0.02, 0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                    node = 1,
                },
            },
        },
        {   attachment_slot = "muzzle",
            requirements = {
                muzzle = {
                    -- has = "query:shotgun_p1_m1,muzzle,extended_weapon_customization_owo",
                    has = all_owo_suppressors,
                },
                barrel = {
                    has = long_barrels,
                },
            },
            fix = {
                offset = {
                    position = vector3_box(0, 0.158, 0.0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                    node = 1,
                },
            },
        },
}

local custom_attachments = {
    flashlight = {
        parent_slot = "barrel",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.2, 0.4, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    muzzle = {
        parent_slot = "barrel",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0, 0.5, 0),
                --position = vector3_box(0, 0, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
                -- 1: middle of barrel
                -- 4, 6: middle of barrel and ctd
                -- 7: midle of barrel with no position (then crash lol)
                -- 2, 3, 5, 8, 9, 10: ctd
                --node = 11,
            },
        },
    },
}

return {
    --fixes = custom_fixes,
    attachment_slots = custom_attachments,
}