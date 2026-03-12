local mod = get_mod("extended_weapon_customization_owo")

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

-- ################################
-- Attachment Names for Fixes
-- ################################
if mod.shared_fix_requirements_file_has_run then
    return
end
mod.shared_fix_requirements_file_has_run = true

-- --------------------------------
-- Sight Reticles
-- --------------------------------
mod.combined_sight_reticle_names = create_requirements_string_from_names_table(mod.all_owo_sight_reticle_names)

-- --------------------------------
-- Slim and Flat Blades (with grip included)
-- --------------------------------
local slim_blades_to_flip = {}
--dump_if_debug(mod.all_slim_blade_names, "UWU SLIM BLADES TABLE BEFORE FLIPPING NYA")
-- psword not necessary
for _, blade in ipairs({"pfalchion", "dclaw", "hsword", "2h_psword", "2h_psword_short"}) do
    for _, width in ipairs({"flat_", "slim_"}) do
        for _, suffix in ipairs({"", "_g"}) do
            local blade = "owo_slim_blade_"..width..blade..suffix
            slim_blades_to_flip[blade] = create_requirements_string_from_names_table(mod.all_slim_blade_names[blade])
            info_if_debug("results of flipping nyaaaa: "..blade.."\n"..slim_blades_to_flip[blade])
            mod.all_slim_blade_names[blade] = slim_blades_to_flip[blade]
        end
    end
end
mod.combined_slim_blades_to_flip = create_requirements_string_from_names_table(slim_blades_to_flip)
--dump_if_debug(mod.all_slim_blade_names, "UWU SLIM BLADES TABLE AFTER FLIPPING NYA AAAAAA")
info_if_debug("uwu all combined blades: "..mod.combined_slim_blades_to_flip)

-- --------------------------------
-- Suppressors
-- --------------------------------
local all_suppressor_names = mod.all_suppressor_names
mod.any_suppressor = create_requirements_string_from_names_table(all_suppressor_names)

-- --------------------------------
-- Holographic Sights
-- --------------------------------
-- Turns each group into a long string
for holosight_group, holosight_list in pairs(mod.all_holographic_sights_names) do
    mod.all_holographic_sights_names[holosight_group] = create_requirements_string_from_names_table(holosight_list)
end
-- Creates a single string for all
--  Not sure if this redundancy is required but it feels like otherwise i'd be creating a key before iterating through all keys
local all_holo = create_requirements_string_from_names_table(mod.all_holographic_sights_names)
mod.all_holographic_sights_names.all = all_holo

mod.syn_ma5_extensions = "ma5_extension_01|ma5_extension_02|ma5_extension_03|ma5_extension_04|ma5_extension_05|ma5_extension_06|ma5_extension_07|ma5_extension_08|ma5_extension_09|ma5_extension_10|ma5_extension_11|ma5_extension_12|ma5_extension_13|ma5_extension_14|ma5_extension_15|ma5_extension_16|ma5_extension_17|ma5_extension_18|ma5_extension_19"
mod.syn_ma5_compact_extensions = "ma5_compact_extension_01|ma5_compact_extension_02|ma5_compact_extension_03|ma5_compact_extension_04|ma5_compact_extension_05|ma5_compact_extension_06|ma5_compact_extension_07|ma5_compact_extension_08|ma5_compact_extension_09|ma5_compact_extension_10|ma5_compact_extension_11|ma5_compact_extension_12|ma5_compact_extension_13|ma5_compact_extension_14|ma5_compact_extension_15|ma5_compact_extension_16|ma5_compact_extension_17|ma5_compact_extension_18|ma5_compact_extension_19"
mod.syn_ma5_classic_extensions = "ma5_extension_20|ma5_extension_21|ma5_extension_20a|ma5_extension_21a"
mod.syn_ma5_compact_classic = "ma5_compact_extension_20|ma5_compact_extension_21"
mod.syn_all_ma5_extensions = mod.syn_ma5_extensions.."|"..mod.syn_ma5_compact_extensions.."|"..mod.syn_ma5_classic_extensions.."|"..mod.syn_ma5_compact_classic
mod.syn_recon_extensions = "recon_extension_01|recon_extension_02|recon_extension_03|recon_extension_04|recon_extension_05|recon_extension_06|recon_extension_07|recon_extension_08|recon_extension_09|recon_extension_01_reversed|recon_extension_02_reversed|recon_extension_03_reversed|recon_extension_04_reversed|recon_extension_05_reversed|recon_extension_06_reversed|recon_extension_07_reversed|recon_extension_08_reversed|recon_extension_09_reversed"