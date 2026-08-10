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
--local infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_ml01"
--local braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_ml01"
--local vigilant_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
--local infantry_lasgun_receivers = "lasgun_rifle_receiver_01|lasgun_rifle_receiver_02|lasgun_rifle_receiver_03|lasgun_rifle_receiver_ml01"
--local helbore_lasgun_receivers = "lasgun_rifle_krieg_receiver_01|lasgun_rifle_krieg_receiver_02|lasgun_krieg_rifle_receiver_03|lasgun_rifle_krieg_receiver_04|lasgun_rifle_krieg_receiver_05|lasgun_krieg_rifle_receiver_06|lasgun_rifle_krieg_receiver_ml01"
--local recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_elysian_rifle_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_elysian_rifle_receiver_06|lasgun_elysian_rifle_receiver_07|lasgun_rifle_elysian_receiver_ml01"

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment

local apply_two_dimensional_transformation_to_vector = mod.apply_two_dimensional_transformation_to_vector
local localize_single_attachment_with_table = mod.localize_single_attachment_with_table
local return_all_numbers_for_hide = mod.return_all_numbers_for_hide

local attachment_localizations = mod.owo_kalashnikov_barrel_localizations

-- ################################
-- Attachment
-- ################################

function mod.owo_kalashnikov_barrel(given_slot, given_attachment_node)
    local current_slot = given_slot or "barrel"
    local current_attachment_node = given_attachment_node or "ap_barrel_01"

    local attachment_group_name = "owo_kalashnikov_barrel"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names if this is the first time
    local all_these_attachments = nil
    if not mod.all_owo_kalashnikov_barrel_names then
        all_these_attachments = {}
    end

    local function owo_kalashnikov_barrel_helper(name_suffix, fixes, kitbashs)
        local shortname = attachment_group_prefix..name_suffix
        create_an_attachment(table_to_return, shortname,
            -- Attachment
            {   replacement_path = _item_ranged.."/barrel/"..shortname,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                custom_selection_group = attachment_group_name,
                randomization_requirement = "mod_option_kalashnikov_barrel_randomization",
            },
            -- Fixes
            fixes,
            -- Kitbash
            kitbashs,
            -- Attachment Node
            current_attachment_node
        )
        -- Adding name to this group's list
        if all_these_attachments then
            table_insert(all_these_attachments, shortname)
        end
        localize_single_attachment_with_table(shortname, attachment_localizations)

        return table_to_return, all_these_attachments
    end

    -- Creating helper attachments

    create_kitbash_full_item(table_to_return, _item_ranged.."/barrel/owo_kalashnikov_barrel_helper_barrel_squish", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/barrel_03/barrel_03", current_attachment_node)

    owo_kalashnikov_barrel_helper("short", nil, {
        base_unit = _item_empty,
        attachments = {
            owo_base_barrel_hidden = {
                item = _item_ranged.."/barrels/autogun_rifle_barrel_ak_02",
                fix = {
                    disable_in_ui = false,
                    hide = {
                        mesh = return_all_numbers_for_hide() -- KILL THEM ALL
                    },
                },
                children = {
                    -- Range select
                    owo_real_barrel = {
                        item = _item_ranged.."/barrel/owo_kalashnikov_barrel_helper_barrel_squish",
                        fix = {
                            offset = {
                                node = 1,
                                position = vector3_box(0.0, 0.0, 0.0),
                                rotation = vector3_box(0.0, 0, 0.0),
                                scale = vector3_box(1, 0.6, 1),
                            },
                        },
                    },
                }
            },
            
        },
    })

    -- Making list of all attachments global
    if all_these_attachments then
        mod.all_owo_kalashnikov_barrel_names = all_these_attachments
    end

    return table_to_return

end
