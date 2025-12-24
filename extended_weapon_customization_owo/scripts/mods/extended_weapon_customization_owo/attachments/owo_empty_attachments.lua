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
-- Some Variables for Common Attachments
-- ################################

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

-- local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment

local apply_two_dimensional_transformation_to_vector = mod.apply_two_dimensional_transformation_to_vector
local localize_single_attachment_with_table = mod.localize_single_attachment_with_table

local attachment_localizations = {

}

-- ################################
-- Attachment
-- ################################
function mod.owo_invisible_shock_maul_connector()
    local current_slot = "connector"
    local current_attachment_node = "ap_connector_01"

    local attachment_group_name = "owo_invisible_shock_maul_connector"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)


    local shortname = attachment_group_prefix.."01"
    create_an_attachment(table_to_return, shortname,
        -- Attachment
        {   replacement_path = _item_ranged.."/connectors/"..shortname,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
            custom_selection_group = "extended_weapon_customization_owo",
        },
        -- Fixes
        nil,
        -- Kitbash
        {   base_unit = "content/weapons/player/melee/human_power_maul/attachments/connector_01/connector_01",
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, 0.0, 0.0),
                    rotation = vector3_box(0.0, 0.0, 0.0),
                    scale = vector3_box(1.0, 1.0, 1.0)
                },
                alpha = 1,
            },
        },
        -- Attachment Node
        current_attachment_node
    )

    local shortname = attachment_group_prefix.."empty"
    create_an_attachment(table_to_return, shortname,
        -- Attachment
        {   replacement_path = _item_ranged.."/connectors/"..shortname,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
            custom_selection_group = "extended_weapon_customization_owo",
        },
        -- Fixes
        nil,
        -- Kitbash
        {   base_unit = "content/characters/empty_item/empty_item",
        },
        -- Attachment Node
        current_attachment_node
    )

    return table_to_return

end
