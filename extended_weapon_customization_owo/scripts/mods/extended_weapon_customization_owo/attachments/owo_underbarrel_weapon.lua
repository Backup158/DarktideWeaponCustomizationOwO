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
function mod.owo_underbarrel_weapon_veteran_guardsman_laspistol(given_slot, given_attachment_node)
    local current_slot = given_slot or "owo_underbarrel_weapon"
    local current_attachment_node = given_attachment_node or "ap_barrel_01"

    local attachment_group_name = "owo_underbarrel_weapon_veteran_guardsman_laspistol"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names if this is the first time
    local all_these_attachments = nil
    if not mod.all_owo_underbarrel_weapon_veteran_guardsman_laspistol_names then
        all_these_attachments = {}
    end

    -- Bolt Pistol attachment
    for_all_weapon_models(2, {"ml01"}, function(number_as_string)
        -- adding helpers
        local owo_kitbash_base_bolt_pistol = _item_ranged.."/underbarrels/owo_underbarrel_weapon_vesa_bolt_pistol_"..number_as_string
        create_kitbash_full_item(table_to_return, owo_kitbash_base_bolt_pistol, nil, "content/weapons/player/ranged/bolt_pistol/attachments/receiver_"..number_as_string.."/receiver_"..number_as_string, current_attachment_node)
        create_kitbash_full_item(table_to_return, owo_kitbash_base_bolt_pistol.."_grip", nil, "content/weapons/player/ranged/bolt_pistol/attachments/grip_"..number_as_string.."/grip_"..number_as_string, current_attachment_node)
        create_kitbash_full_item(table_to_return, owo_kitbash_base_bolt_pistol.."_magazine", nil, "content/weapons/player/ranged/bolt_pistol/attachments/magazine_"..number_as_string.."/magazine_"..number_as_string, current_attachment_node)
        create_kitbash_full_item(table_to_return, owo_kitbash_base_bolt_pistol.."_barrel", nil, "content/weapons/player/ranged/bolt_pistol/attachments/barrel_"..number_as_string.."/barrel_"..number_as_string, current_attachment_node)

        local name_suffix = "bolt_pistol_"..number_as_string
        local shortname = attachment_group_prefix..name_suffix
        create_an_attachment(table_to_return, shortname,
            -- Attachment
            {   replacement_path = _item_ranged.."/underbarrels/"..shortname,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                custom_selection_group = "extended_weapon_customization_owo",
                randomization_requirement = "mod_option_underbarrel_laspistol_randomization",
            },
            -- Fixes
            nil,
            -- Kitbash
            {   base_unit = _item_empty, -- invisible base
                attachments = {
                    owo_underbarrel_weapon_receiver = {
                        item = owo_kitbash_base_bolt_pistol,
                        fix = {
                            disable_in_ui = false,
                            offset = {
                                node = 1,
                                position = vector3_box(0.0, 0.0, 0.0),
                                rotation = vector3_box(0.0, 0.0, 0.0),
                                scale = vector3_box(0.8, 0.55, 0.6)
                            },
                        },
                        children = {
                            owo_underbarrel_weapon_grip = {
                                item = owo_kitbash_base_bolt_pistol.."_grip",
                                fix = {
                                    offset = {
                                        node = 3,
                                        position = vector3_box(0.0, 0.0, 0.0),
                                        rotation = vector3_box(0.0, 0, 0.0),
                                        scale = vector3_box(1.0, 1.0, 1.0),
                                    },
                                },
                            },
                            owo_underbarrel_weapon_magazine = {
                                item = owo_kitbash_base_bolt_pistol.."_magazine",
                                fix = {
                                    offset = {
                                        node = 3,
                                        position = vector3_box(0.0, -0.08, -0.02),
                                        rotation = vector3_box(0.0, 0, 0.0),
                                        scale = vector3_box(1.0, 1.0, 1.0),
                                    },
                                },
                            },
                            owo_underbarrel_weapon_barrel = {
                                item = owo_kitbash_base_bolt_pistol.."_barrel",
                                fix = {
                                    offset = {
                                        node = 1,
                                        position = vector3_box(0.0, -0.1, -0.036),
                                        rotation = vector3_box(0.0, 0, 0.0),
                                        scale = vector3_box(1.0, 1.3, 1.0),
                                    },
                                },
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

    -- Plasma Pistol attachment
    local owo_kitbash_base_plasma_pistol_prefix = _item_ranged.."/underbarrels/owo_underbarrel_weapon_vesa_plasma_pistol_"
    create_kitbash_full_item(table_to_return, owo_kitbash_base_plasma_pistol_prefix.."_grip", nil, "content/weapons/player/ranged/plasma_rifle/attachments/grip_01/grip_01", current_attachment_node)
    create_kitbash_full_item(table_to_return, owo_kitbash_base_plasma_pistol_prefix.."_magazine", nil, "content/weapons/player/ranged/plasma_rifle/attachments/magazine_01/magazine_01", current_attachment_node)
    for_all_weapon_models(3, nil, function(number_as_string)
        -- adding helpers
        local owo_kitbash_base_plasma_pistol = owo_kitbash_base_plasma_pistol_prefix..number_as_string
        create_kitbash_full_item(table_to_return, owo_kitbash_base_plasma_pistol, nil, "content/weapons/player/ranged/plasma_rifle/attachments/receiver_"..number_as_string.."/receiver_"..number_as_string, current_attachment_node)

        -- Now making one for each barrel
        for_all_weapon_models(8, nil, function(second_number_as_string)
            create_kitbash_full_item(table_to_return, owo_kitbash_base_plasma_pistol.."_barrel_"..second_number_as_string, nil, "content/weapons/player/ranged/plasma_rifle/attachments/barrel_"..second_number_as_string.."/barrel_"..second_number_as_string, current_attachment_node)
            create_kitbash_full_item(table_to_return, owo_kitbash_base_plasma_pistol.."_stock_"..second_number_as_string, nil, "content/weapons/player/ranged/plasma_rifle/attachments/stock_"..second_number_as_string.."/stock_"..second_number_as_string, current_attachment_node)

            local name_suffix = "plasma_pistol_"..number_as_string.."_"..second_number_as_string
            local shortname = attachment_group_prefix..name_suffix
            create_an_attachment(table_to_return, shortname,
                -- Attachment
                {   replacement_path = _item_ranged.."/underbarrels/"..shortname,
                    icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                    icon_render_camera_position_offset = render_cam_pos_profile_left,
                    custom_selection_group = "extended_weapon_customization_owo",
                    randomization_requirement = "mod_option_underbarrel_laspistol_randomization",
                },
                -- Fixes
                nil,
                -- Kitbash
                {   base_unit = _item_empty, -- invisible base
                    attachments = {
                        owo_underbarrel_weapon_receiver = {
                            item = owo_kitbash_base_plasma_pistol,
                            fix = {
                                disable_in_ui = false,
                                offset = {
                                    node = 1,
                                    position = vector3_box(0.0, 0.0, 0.0),
                                    rotation = vector3_box(0.0, 0.0, 0.0),
                                    scale = vector3_box(0.6, 0.5, 0.69)
                                },
                            },
                            children = {
                                owo_underbarrel_weapon_grip = {
                                    item = owo_kitbash_base_plasma_pistol_prefix.."_grip",
                                    fix = {
                                        offset = {
                                            node = 1,
                                            position = vector3_box(0.0, 0.0, -0.04),
                                            rotation = vector3_box(0.0, 0, 0.0),
                                            scale = vector3_box(1.0, 1.0, 1.0),
                                        },
                                    },
                                },
                                owo_underbarrel_weapon_magazine = {
                                    item = owo_kitbash_base_plasma_pistol_prefix.."_magazine",
                                    fix = {
                                        offset = {
                                            node = 1,
                                            position = vector3_box(0.0, 0.042, -0.08),
                                            rotation = vector3_box(0.0, 0, 0.0),
                                            scale = vector3_box(1.0, 1.0, 0.69),
                                        },
                                    },
                                },
                                owo_underbarrel_weapon_barrel = {
                                    item = owo_kitbash_base_plasma_pistol.."_barrel_"..second_number_as_string,
                                    fix = {
                                        offset = {
                                            node = 1,
                                            position = vector3_box(0.0, 0.0, 0.0),
                                            rotation = vector3_box(0.0, 0, 0.0),
                                            scale = vector3_box(1.0, 0.85, 1.0),
                                        },
                                    },
                                },
                                owo_underbarrel_weapon_stock = {
                                    item = owo_kitbash_base_plasma_pistol.."_stock_"..second_number_as_string,
                                    fix = {
                                        offset = {
                                            node = 1,
                                            position = vector3_box(0.0, -0.1, 0.04),
                                            rotation = vector3_box(45.0, 0, 0.0),
                                            scale = vector3_box(1.0, 1.0, 1.0),
                                        },
                                    },
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
            localize_attachment_triple_threat(attachment_group_name, name_suffix, number_as_string.."_"..second_number_as_string)
        end)
    end)
   
    -- Making list of all attachments global
    if all_these_attachments then
        mod.all_owo_underbarrel_weapon_veteran_guardsman_laspistol_names = mod.create_requirements_string_from_names_table(all_these_attachments)
    end

    -- This is the point to insert fixes that apply to all the parts

    return table_to_return

end
