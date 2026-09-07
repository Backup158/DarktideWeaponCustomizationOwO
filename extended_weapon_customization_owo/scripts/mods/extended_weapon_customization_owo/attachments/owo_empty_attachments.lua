local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local table = table
local table_insert = table.insert

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"
local _item_empty = "content/characters/empty_item/empty_item"

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
            randomization_requirement = "mod_option_empty_randomization",
        },
        -- Fixes
        nil,
        -- Kitbash
        {   base_unit = "content/characters/empty_item/empty_item",
            attachments = {
                --[[
                zzz_shared_material_overrides = {
                    item = "",
                    children = {},
                },
                ]]
                connector = {
                    item = "content/weapons/player/melee/human_power_maul/attachments/connector_01/connector_01",
                    fix = {
                        disable_in_ui = false,
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = vector3_box(1.0, 1.0, 1.0)
                        },
                        --[[
                        hide = {
                            mesh = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
                        },
                        ]]
                        alpha = 1, -- also makes children invis
                    },
                    children = {},
                },
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

function mod.owo_invisible_generic(given_slot, given_attachment_node, specific_name, item_address)
    local current_slot = given_slot or "connector"
    local current_attachment_node = given_attachment_node or "ap_connector_01"

    local attachment_group_name = "owo_invisible"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    local function invisible_helper(name_suffix, fixes, kitbashes) 
        local shortname = attachment_group_prefix..name_suffix
        create_an_attachment(table_to_return, shortname,
            -- Attachment
            {   replacement_path = _item_ranged.."/"..current_slot.."s/"..shortname,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                custom_selection_group = "extended_weapon_customization_owo",
                randomization_requirement = "mod_option_empty_randomization",
            },
            -- Fixes
            fixes,
            -- Kitbash
            kitbashes,
            -- Attachment Node
            current_attachment_node
        )
    end

    invisible_helper(specific_name, nil, {   
        base_unit = "content/characters/empty_item/empty_item",
        attachments = {
            --[[
            zzz_shared_material_overrides = {
                item = "",
                children = {},
            },
            ]]
            [current_slot] = {
                item = item_address or "content/weapons/player/melee/human_power_maul/attachments/connector_01/connector_01",
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = vector3_box(1.0, 1.0, 1.0)
                    },
                    --[[
                    hide = {
                        mesh = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
                    },
                    ]]
                    alpha = 1, -- also makes children invis
                },
                children = {},
            },
        },
    })
    
    invisible_helper(specific_name.."_empty", nil, {   
        base_unit = _item_empty,
    })

    return table_to_return

end