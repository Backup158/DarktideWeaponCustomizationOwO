local mod = get_mod("extended_weapon_customization_owo")

-- ################################################################
-- Data
-- ################################################################
-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local dump_if_debug = mod.dump_if_debug
local info_if_debug = mod.info_if_debug
local create_requirements_string_from_names_table = mod.create_requirements_string_from_names_table

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

-- ################################################################
-- Attachment Names for Fixes
-- ################################################################
-- ################################
-- OwO Parts
-- ################################
if mod.shared_fix_requirements_file_has_run then
    return
end
mod.shared_fix_requirements_file_has_run = true

-- --------------------------------
-- Sight Reticles
-- --------------------------------
mod.all_owo_sight_reticle_names = create_requirements_string_from_names_table(mod.all_owo_sight_reticle_names)
info_if_debug("OwO All Sight Reticles: "..mod.all_owo_sight_reticle_names)

-- --------------------------------
-- Slim and Flat Blades (with grip included)
-- --------------------------------
local slim_blades_to_flip = {}
--dump_if_debug(mod.all_slim_blade_names, "UWU SLIM BLADES TABLE BEFORE FLIPPING NYA")
-- psword not necessary
local slim_blades_flip_list_blade = {"pfalchion", "dclaw", "hsword", "2h_psword", "2h_psword_short"}
local slim_blades_flip_list_prefix = {"flat_", "slim_"}
local slim_blades_flip_list_suffix = {"", "_g"}
for i = 1, #(slim_blades_flip_list_blade) do
    for j = 1, #(slim_blades_flip_list_prefix) do
        for k = 1, #(slim_blades_flip_list_suffix) do
            local blade = "owo_slim_blade_"..slim_blades_flip_list_prefix[j]..slim_blades_flip_list_blade[i]..slim_blades_flip_list_suffix[k]
            slim_blades_to_flip[blade] = create_requirements_string_from_names_table(mod.all_slim_blade_names[blade])
            -- info_if_debug("results of flipping nyaaaa: "..blade.."\n"..slim_blades_to_flip[blade])
            mod.all_slim_blade_names[blade] = slim_blades_to_flip[blade]
        end
    end
end
mod.combined_slim_blades_to_flip = create_requirements_string_from_names_table(slim_blades_to_flip)
--dump_if_debug(mod.all_slim_blade_names, "UWU SLIM BLADES TABLE AFTER FLIPPING NYA AAAAAA")
info_if_debug("OwO List of Slim Blades that need to be flipped: "..mod.combined_slim_blades_to_flip)

-- --------------------------------
-- Suppressors
-- --------------------------------
for slot_name, _ in pairs(mod.all_owo_suppressor_names) do
    info_if_debug("OwO All Suppressors ("..slot_name.."): "..mod.all_owo_suppressor_names[slot_name])
end
-- --------------------------------
-- Holographic Sights
-- --------------------------------
--[[
   Turns each group into a long string
   The goal is to have
   mod.all_holographic_sights_names
        .all
        .eotech
        .vortex
   etc
   However, mod.all_holographic_sights_names goes {
     eotech = { }
     vortex = { }
     first_run = false
   }
   Therefore I can only create a requirements string for the others
   So in the end it'll be mod.all_holographic_sights_names goes {
     all = eotech_string.."|"..vortex_string etc
     eotech = eotech_string
     vortex = vortex_string
     first_run = false
   }
]]
for holosight_group, holosight_list in pairs(mod.all_holographic_sights_names) do
    if type(holosight_list) == "table" then
        mod.all_holographic_sights_names[holosight_group] = create_requirements_string_from_names_table(holosight_list)
    end
end
-- Creates a single string for all
--  Not sure if this redundancy is required but it feels like otherwise i'd be creating a key before iterating through all keys
local all_holographic_sights_names = create_requirements_string_from_names_table(mod.all_holographic_sights_names)
mod.all_holographic_sights_names.all = all_holographic_sights_names
dump_if_debug(mod.all_holographic_sights_names, "OwO All Holographic Sights: ", 15)

-- --------------------------------
-- Chainsword parts
-- --------------------------------
mod.owo_chainsword_2h_with_gap = "owo_chainsword_2h_blade_02|owo_chainsword_2h_blade_ml01"

-- --------------------------------
-- Modern Barrels
-- --------------------------------

-- ################################
-- Syn's Parts
-- ################################
mod.syn_ma5_extensions = "ma5_extension_01|ma5_extension_02|ma5_extension_03|ma5_extension_04|ma5_extension_05|ma5_extension_06|ma5_extension_07|ma5_extension_08|ma5_extension_09|ma5_extension_10|ma5_extension_11|ma5_extension_12|ma5_extension_13|ma5_extension_14|ma5_extension_15|ma5_extension_16|ma5_extension_17|ma5_extension_18|ma5_extension_19"
mod.syn_ma5_compact_extensions = "ma5_compact_extension_01|ma5_compact_extension_02|ma5_compact_extension_03|ma5_compact_extension_04|ma5_compact_extension_05|ma5_compact_extension_06|ma5_compact_extension_07|ma5_compact_extension_08|ma5_compact_extension_09|ma5_compact_extension_10|ma5_compact_extension_11|ma5_compact_extension_12|ma5_compact_extension_13|ma5_compact_extension_14|ma5_compact_extension_15|ma5_compact_extension_16|ma5_compact_extension_17|ma5_compact_extension_18|ma5_compact_extension_19"
mod.syn_ma5_classic_extensions = "ma5_extension_20|ma5_extension_21|ma5_extension_20a|ma5_extension_21a"
mod.syn_ma5_compact_classic = "ma5_compact_extension_20|ma5_compact_extension_21"
mod.syn_all_ma5_extensions = mod.syn_ma5_extensions.."|"..mod.syn_ma5_compact_extensions.."|"..mod.syn_ma5_classic_extensions.."|"..mod.syn_ma5_compact_classic
mod.syn_recon_extensions = "recon_extension_01|recon_extension_02|recon_extension_03|recon_extension_04|recon_extension_05|recon_extension_06|recon_extension_07|recon_extension_08|recon_extension_09|recon_extension_01_reversed|recon_extension_02_reversed|recon_extension_03_reversed|recon_extension_04_reversed|recon_extension_05_reversed|recon_extension_06_reversed|recon_extension_07_reversed|recon_extension_08_reversed|recon_extension_09_reversed"
mod.syn_g36_extensions = "g36_extension_01|g36_extension_02"
mod.syn_all_receiver_extensions = mod.syn_all_ma5_extensions.."|"..mod.syn_recon_extensions.."|"..mod.syn_g36_extensions
mod.syn_hellgun_receivers = "syn_hellgun_receiver_01|syn_hellgun_receiver_02|syn_hellgun_receiver_03|syn_hellgun_receiver_ml01|syn_hellgun_receiver_14|syn_hellgun_receiver_15"

-- ################################
-- Regular and Base Additions Parts
-- ################################
mod.all_infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_02|autogun_rifle_receiver_03|autogun_rifle_receiver_04|autogun_rifle_receiver_ml01"
mod.all_braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_04|autogun_rifle_ak_receiver_ml01"
mod.all_headhunter_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
mod.all_autogun_receivers = mod.all_infantry_autogun_receivers.."|"..mod.all_braced_autogun_receivers.."|"..mod.all_headhunter_autogun_receivers
mod.all_recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_rifle_elysian_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_rifle_elysian_receiver_06|lasgun_rifle_elysian_receiver_07|lasgun_rifle_elysian_receiver_08|lasgun_rifle_elysian_receiver_ml01"

-- ################################################################
-- Shared Fixes
-- ################################################################
local all_owo_sight_reticle_names = mod.all_owo_sight_reticle_names

-- This table contains designations for fixes that are commonly copied WITHOUT changes
mod.shared_fix_tables = {
    -- --------------------------------------
    -- Fixes
    -- --------------------------------------
    ["default_sight_reticle_position_holo"] = {   
        attachment_slot = "sight_reticle",
        requirements = {
            sight = {
                has = all_holographic_sights_names,
            },
            sight_reticle = {
                has = all_owo_sight_reticle_names,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, -0.016, 0.01),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
            },
        },
    },
    -- Rails
    --  Removes rail for AK Irons
    ["default_sight_ak_iron_remove_rail"] = {   
        attachment_slot = "rail",
        requirements = {
            sight = {
                has = "owo_iron_sight_kalashnikov",
            },
        },
        fix = {
            attach = {
                rail = _item_empty_trinket,
            },
        },
    },
    --  Attaches rail for Holosight and telescopic
    ["default_sight_add_rail"] = {   
        attachment_slot = "rail",
        requirements = {
            sight = {
                has = all_holographic_sights_names.all,
            },
        },
        fix = {
            attach = {
                rail = "lasgun_rifle_rail_01",
            },
            offset = {
                position = vector3_box(0, 0, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    -- --------------------------------------
    -- Attachment Slots
    -- --------------------------------------
    ["default_attachment_sight_reticle"] = {
        parent_slot = "sight",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0, 0, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
}