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
-- Attachment Creation Help
-- ################################
-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

-- Helper Functions
local create_an_attachment = mod.create_an_attachment
local create_kitbash_full_item = mod.create_kitbash_full_item

local apply_two_dimensional_transformation_to_vector = mod.apply_two_dimensional_transformation_to_vector
local return_all_numbers_for_hide = mod.return_all_numbers_for_hide
local for_all_weapon_models = mod.for_all_weapon_models
local localize_attachment_triple_threat = mod.localize_attachment_triple_threat

-- ################################
-- Attachment
-- ################################
function mod.owo_bayonet_flip(given_slot, given_attachment_node)
    local current_slot = given_slot or "bayonet"
    local current_attachment_node = given_attachment_node or "ap_muzzle_01"

    local attachment_group_name = "owo_bayonet_flip"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names if this is the first time
    local all_these_attachments = nil
    if not mod.all_owo_bayonet_names then
        all_these_attachments = {}
    end

    for_all_weapon_models(5, {3, "ml01"}, function(number_as_string)
        -- adding helpers
        local owo_kitbash_address = _item_ranged.."/bayonets/owo_bayonet_vesa_helbore_"..number_as_string
        create_kitbash_full_item(table_to_return, owo_kitbash_address, nil, "content/weapons/player/attachments/bayonets/bayonet_"..number_as_string.."/bayonet_"..number_as_string, current_attachment_node)

        local name_suffix = "helbore_"..number_as_string
        local shortname = attachment_group_prefix..name_suffix
        create_an_attachment(table_to_return, shortname,
            -- Attachment
            {   replacement_path = _item_ranged.."/bayonets/"..shortname,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                custom_selection_group = "extended_weapon_customization_owo",
            },
            -- Fixes
            nil,
            -- Kitbash
            {   base_unit = _item_empty, -- invisible base
                attachments = {
                    owo_visible_bayonet_ = {
                        item = owo_kitbash_address,
                        fix = {
                            disable_in_ui = false,
                            offset = {
                                node = 1,
                                position = vector3_box(-0.002, -0.069, -0.065),
                                rotation = vector3_box(180.0, 0.0, 180.0),
                                scale = vector3_box(1.0, 1.0, 1.0)
                            },
                        },
                    },  
                },
            },
            -- Attachment Node
            current_attachment_node
        )
        -- Adding name to this group's list
        if all_these_attachments then
            table_insert(all_these_attachments, shortname)
        end
        localize_attachment_triple_threat(attachment_group_name, name_suffix, number_as_string)
    end)
    

    -- Making list of all attachments global
    if all_these_attachments then
        mod.all_owo_bayonet_names = mod.create_requirements_string_from_names_table(all_these_attachments)
    end

    -- This is the point to insert fixes that apply to all the parts

    return table_to_return

end
