local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local type = type
local table = table
local table_insert = table.insert
local string = string
local string_regex_sub = string.gsub

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

-- ################################
-- Some Variables for Common Attachments
-- ################################
-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

-- local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment
local for_all_weapon_models = mod.for_all_weapon_models
local calculate_damage_type_key_name = mod.calculate_damage_type_key_name

local chainsword_blade_families_and_damage_types = mod.chainsword_blade_families_and_damage_types

-- ################################
-- Attachment
-- ################################
local function owo_chainsword_blade_helper(chainsword_name, path, amount_of_models, table_of_model_exceptions, given_slot, given_attachment_node)
    local current_slot = given_slot or "body"
    local current_attachment_node = given_attachment_node or "ap_body_01"

    local attachment_group_name = "owo_"..chainsword_name.."_blade"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names if this is the first time
    local all_attachment_names = nil
    if not mod["all_owo_"..chainsword_name.."_blade_names"] then
        all_attachment_names = {}
    end

    for_all_weapon_models(amount_of_models, table_of_model_exceptions, function(number_string)
        local base_item_address = path
        local damage_type = calculate_damage_type_key_name(chainsword_blade_families_and_damage_types, chainsword_name)
        local selection_group = attachment_group_name

        local specific_name = attachment_group_prefix..number_string

        create_an_attachment(table_to_return, specific_name,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..specific_name,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                damage_type = damage_type,
                custom_selection_group = selection_group,
                randomization_requirement = "mod_option_chainsword_blade_randomization",
            },
            -- Fixes
            {},
            -- Kitbash
            {   base_unit = string_regex_sub(base_item_address, "01", number_string),
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node,
            -- Disable VFX spawner exclusion
            true
        )

        if all_attachment_names then
            if not all_attachment_names[selection_group] then
                all_attachment_names[selection_group] = {}
            end
            table_insert(all_attachment_names[selection_group], specific_name)
        end
    end)

    return table_to_return

end

function mod.owo_chainsword_blade(given_slot, given_attachment_node)
    return owo_chainsword_blade_helper("chainsword", "content/weapons/player/melee/chain_sword/attachments/body_01/body_01", 12, {}, given_slot, given_attachment_node)
end

function mod.owo_chainsword_2h_blade(given_slot, given_attachment_node)
    return owo_chainsword_blade_helper("chainsword_2h", "content/weapons/player/melee/2h_chain_sword/attachments/body_01/body_01", 7, {5}, given_slot, given_attachment_node)
end

-- Chains
-- These are created by Satan himself
local function owo_chainsword_chain_single_helper(table_to_return, current_attachment_node, specific_name, replacement_path, selection_group, all_attachment_names)
    create_an_attachment(table_to_return, specific_name,
        -- Attachment
        {   replacement_path = replacement_path,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
            custom_selection_group = selection_group,
            randomization_requirement = "mod_option_chainsword_chain_randomization",
        },
        -- Fixes
        {},
        -- Kitbash
        {   base_unit = replacement_path,
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        current_attachment_node,
        -- Disable VFX spawner exclusion
        true
    )

    if all_attachment_names then
        if not all_attachment_names[selection_group] then
            all_attachment_names[selection_group] = {}
        end
        table_insert(all_attachment_names[selection_group], specific_name)
    end

    return table_to_return, all_attachment_names
end

local function owo_chainsword_chain_group_helper(current_slot, current_attachment_node, chainsword_name, table_of_replacement_paths)
    local attachment_group_name = "owo_"..chainsword_name.."_chain"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names if this is the first time
    local all_attachment_names = nil
    if not mod["all_owo_"..chainsword_name.."_chain_names"] then
        all_attachment_names = {}
    end

    for i = 1, #table_of_replacement_paths do
        local specific_name = attachment_group_prefix.."_"..tostring(i)
        local replacement_path = table_of_replacement_paths[i]

        table_to_return, all_attachment_names = owo_chainsword_chain_single_helper(table_to_return, current_attachment_node, specific_name, replacement_path, attachment_group_name, all_attachment_names)
    end

    return table_to_return
end

function mod.owo_chainsword_chain(given_slot, given_attachment_node)
    local current_slot = given_slot or "chain"
    local current_attachment_node = given_attachment_node or "ap_chain_01"

    local table_of_paths = {
        "content/weapons/player/melee/chain_sword/attachments/chain_01/chain_45_01",
        "content/weapons/player/melee/chain_sword/attachments/chain_01/chain_45_01_gold_01",
    }
    return owo_chainsword_chain_group_helper(current_slot, current_attachment_node, "chainsword", table_of_paths)
end

function mod.owo_chainsword_2h_chain(given_slot, given_attachment_node)
    local current_slot = given_slot or "chain"
    local current_attachment_node = given_attachment_node or "ap_chain_01"

    local table_of_paths = {
        "content/weapons/player/melee/2h_chain_sword/attachments/chain_01/chain_57_01",
        "content/weapons/player/melee/2h_chain_sword/attachments/chain_01/chain_57_01_gold_01",
    }
    return owo_chainsword_chain_group_helper(current_slot, current_attachment_node, "chainsword_2h", table_of_paths)
end

function mod.owo_chainaxe_chain(given_slot, given_attachment_node)
    local current_slot = given_slot or "chain"
    local current_attachment_node = given_attachment_node or "ap_chain_01"

    local table_of_paths = {
        "content/weapons/player/melee/chain_axe/attachments/chain_01/chain_24_01",
        "content/weapons/player/melee/chain_axe/attachments/chain_01/chain_24_01_gold_01",
    }
    return owo_chainsword_chain_group_helper(current_slot, current_attachment_node, "chainaxe", table_of_paths)
end