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
mod.combined_sight_reticle_names = create_requirements_string_from_names_table(mod.all_owo_sight_reticle_names)

-- slim and flat (with grip included)
local slim_blades_to_flip = {}
dump_if_debug(mod.all_slim_blade_names, "UWU SLIM BLADES TABLE BEFORE FLIPPING NYA")
-- psword not necessary
for _, blade in ipairs({"pfalchion", "dclaw", "hsword", "2h_psword", "2h_psword_short"}) do
    for _, width in ipairs({"flat_", "slim_"}) do
        for _, suffix in ipairs({"", "_g"}) do
            local blade = "owo_slim_blade_"..width..blade..suffix
            slim_blades_to_flip[blade] = create_requirements_string_from_names_table(mod.all_slim_blade_names[blade])
            mod.all_slim_blade_names[blade] = slim_blades_to_flip[blade]
        end
    end
end
mod.combined_slim_blades_to_flip = create_requirements_string_from_names_table(slim_blades_to_flip)