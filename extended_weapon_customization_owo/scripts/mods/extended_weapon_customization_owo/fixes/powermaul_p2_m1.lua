local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local info_if_debug = mod.info_if_debug

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
local combined_slim_blades_to_flip = mod.combined_slim_blades_to_flip

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################
--info_if_debug("FLIPPING BLADES FOR "..Localize("loc_powermaul_p2_m1")..": "..combined_slim_blades_to_flip)
--local all_hsword = mod.all_slim_blade_names["owo_slim_blade_flat_hsword"].."|"..mod.all_slim_blade_names["owo_slim_blade_flat_hsword_g"].."|"..mod.all_slim_blade_names["owo_slim_blade_slim_hsword_g"].."|"..mod.all_slim_blade_names["owo_slim_blade_slim_hsword"]
--info_if_debug("flat hswords uwu: " .. all_hsword)
local custom_fixes = {
    -- Slim Blades
    --[[
    {
        attachment_slot = "head",
        requirements = {
            --blade_indicator = {
            --    has = "owo_slim_blade_indicator_pfalchion",
                -- has = "query:powermaul_p2_m1,blade_indicator,extended_weapon_customization_owo"
            --},
            head = {
                --has = "query:powermaul_p2_m1,head,extended_weapon_customization_owo"
                has = combined_slim_blades_to_flip,
            },
        },
        fix = {
            offset = {
                --position = vector3_box(0, -0.071, 0.065),
                rotation = vector3_box(0, 0, 180),
                --scale = vector3_box(1.25, 1.25, 1.25),
            },
        },
    },]]
    --[
    {
        attachment_slot = "head",
        requirements = {
            head = {
                -- has = all_hsword,
                has = "owo_slim_blade_flat_hsword_01|owo_slim_blade_flat_hsword_02|owo_slim_blade_flat_hsword_03|owo_slim_blade_flat_hsword_04|owo_slim_blade_flat_hsword_05|owo_slim_blade_flat_hsword_06|owo_slim_blade_flat_hsword_ml01|owo_slim_blade_flat_2h_psword_short_01|owo_slim_blade_flat_2h_psword_short_02|owo_slim_blade_flat_2h_psword_short_03|owo_slim_blade_flat_2h_psword_short_ml01|owo_slim_blade_slim_dclaw_g_01|owo_slim_blade_slim_dclaw_g_02|owo_slim_blade_slim_dclaw_g_03|owo_slim_blade_slim_dclaw_g_04|owo_slim_blade_slim_dclaw_g_05|owo_slim_blade_slim_dclaw_g_06|owo_slim_blade_slim_dclaw_g_07|owo_slim_blade_slim_dclaw_g_ml01|owo_slim_blade_slim_2h_psword_01|owo_slim_blade_slim_2h_psword_02|owo_slim_blade_slim_2h_psword_03|owo_slim_blade_slim_2h_psword_ml01|owo_slim_blade_slim_hsword_g_01|owo_slim_blade_slim_hsword_g_02|owo_slim_blade_slim_hsword_g_03|owo_slim_blade_slim_hsword_g_04|owo_slim_blade_slim_hsword_g_05|owo_slim_blade_slim_hsword_g_06|owo_slim_blade_slim_hsword_g_ml01|owo_slim_blade_slim_dclaw_01|owo_slim_blade_slim_dclaw_02|owo_slim_blade_slim_dclaw_03|owo_slim_blade_slim_dclaw_04|owo_slim_blade_slim_dclaw_05|owo_slim_blade_slim_dclaw_06|owo_slim_blade_slim_dclaw_07|owo_slim_blade_slim_dclaw_ml01|owo_slim_blade_slim_2h_psword_short_g_01|owo_slim_blade_slim_2h_psword_short_g_02|owo_slim_blade_slim_2h_psword_short_g_03|owo_slim_blade_slim_2h_psword_short_g_ml01|owo_slim_blade_flat_pfalchion_01|owo_slim_blade_flat_pfalchion_02|owo_slim_blade_flat_pfalchion_ml01|owo_slim_blade_slim_pfalchion_g_01|owo_slim_blade_slim_pfalchion_g_02|owo_slim_blade_slim_pfalchion_g_ml01|owo_slim_blade_slim_hsword_01|owo_slim_blade_slim_hsword_02|owo_slim_blade_slim_hsword_03|owo_slim_blade_slim_hsword_04|owo_slim_blade_slim_hsword_05|owo_slim_blade_slim_hsword_06|owo_slim_blade_slim_hsword_ml01|owo_slim_blade_slim_2h_psword_g_01|owo_slim_blade_slim_2h_psword_g_02|owo_slim_blade_slim_2h_psword_g_03|owo_slim_blade_slim_2h_psword_g_ml01|owo_slim_blade_slim_2h_psword_short_01|owo_slim_blade_slim_2h_psword_short_02|owo_slim_blade_slim_2h_psword_short_03|owo_slim_blade_slim_2h_psword_short_ml01|owo_slim_blade_flat_2h_psword_short_g_01|owo_slim_blade_flat_2h_psword_short_g_02|owo_slim_blade_flat_2h_psword_short_g_03|owo_slim_blade_flat_2h_psword_short_g_ml01|owo_slim_blade_flat_2h_psword_g_01|owo_slim_blade_flat_2h_psword_g_02|owo_slim_blade_flat_2h_psword_g_03|owo_slim_blade_flat_2h_psword_g_ml01|owo_slim_blade_flat_dclaw_g_01|owo_slim_blade_flat_dclaw_g_02|owo_slim_blade_flat_dclaw_g_03|owo_slim_blade_flat_dclaw_g_04|owo_slim_blade_flat_dclaw_g_05|owo_slim_blade_flat_dclaw_g_06|owo_slim_blade_flat_dclaw_g_07|owo_slim_blade_flat_dclaw_g_ml01|owo_slim_blade_flat_hsword_g_01|owo_slim_blade_flat_hsword_g_02|owo_slim_blade_flat_hsword_g_03|owo_slim_blade_flat_hsword_g_04|owo_slim_blade_flat_hsword_g_05|owo_slim_blade_flat_hsword_g_06|owo_slim_blade_flat_hsword_g_ml01|owo_slim_blade_flat_pfalchion_g_01|owo_slim_blade_flat_pfalchion_g_02|owo_slim_blade_flat_pfalchion_g_ml01|owo_slim_blade_flat_2h_psword_01|owo_slim_blade_flat_2h_psword_02|owo_slim_blade_flat_2h_psword_03|owo_slim_blade_flat_2h_psword_ml01|owo_slim_blade_flat_dclaw_01|owo_slim_blade_flat_dclaw_02|owo_slim_blade_flat_dclaw_03|owo_slim_blade_flat_dclaw_04|owo_slim_blade_flat_dclaw_05|owo_slim_blade_flat_dclaw_06|owo_slim_blade_flat_dclaw_07|owo_slim_blade_flat_dclaw_ml01|owo_slim_blade_slim_pfalchion_01|owo_slim_blade_slim_pfalchion_02|owo_slim_blade_slim_pfalchion_ml01",
            },
        },
        fix = {
            offset = {
                rotation = vector3_box(0, 0, 180),
            },
        },
    },
    --]]
    -- works for slim g: 01, 03, 05, ml01
    -- works for slim: 02, 04, 06
}

local custom_attachments = {
    blade_indicator = {
        parent_slot = "head",
        default_path = _item_empty_trinket,
    }
}

return {
    fixes = custom_fixes,
    attachment_slots = custom_attachments,
}