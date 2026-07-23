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

-- ################################
-- Attachment Names for Fixes
-- ################################
local all_infantry_autogun_receivers = mod.all_infantry_autogun_receivers
local all_braced_autogun_receivers = mod.all_braced_autogun_receivers
local all_headhunter_autogun_receivers = mod.all_headhunter_autogun_receivers

local all_owo_sight_reticle_names = mod.all_owo_sight_reticle_names
local all_holographic_sights_names = mod.all_holographic_sights_names

local syn_ma5_extensions = mod.syn_ma5_extensions
local syn_ma5_compact_extensions = mod.syn_ma5_compact_extensions
local syn_ma5_classic_extensions = mod.syn_ma5_classic_extensions
local syn_ma5_compact_classic = mod.syn_ma5_compact_classic
local syn_all_ma5_extensions = mod.syn_all_ma5_extensions
local syn_recon_extensions = mod.syn_recon_extensions
local syn_all_receiver_extensions = mod.syn_all_receiver_extensions

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################
local these_fixes = {
    -- Tactical Stocks
    {   attachment_slot = "stock",
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
                missing = "lasgun_rifle_krieg_stock_01|lasgun_rifle_krieg_stock_02|lasgun_rifle_krieg_stock_03|lasgun_rifle_krieg_stock_04|lasgun_rifle_krieg_stock_05|lasgun_rifle_krieg_stock_ml01",
            },
        },
        fix = {
            --attach = {
            --    stock_ac1 = _item_melee.."/heads/thunder_hammer_head_04",
            --    stock_ac1 = _item_melee.."/heads/owo_stock_fill_hammer_head_04",
            --},
            offset = {
                position = vector3_box(0.0, 0.0, -0.02),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(0.35, 0.5, 0.65),
            },
        },
    },
}

return {
    fixes = these_fixes,
}