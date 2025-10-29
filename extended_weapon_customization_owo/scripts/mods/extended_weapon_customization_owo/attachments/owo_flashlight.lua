local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box
local pairs = pairs
local table = table
local table_insert = table.insert
local table_clone = table.clone
--local string = string
--local string_regex_sub = string.gsub
--local string_upper = string.upper

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
--local _item_melee = _item.."/melee"
--local _item_empty_trinket = _item.."/trinkets/unused_trinket"
--local _item_minion = "content/items/weapons/minions"

-- ################################
-- Some Variables for Common Attachments
-- ################################

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment
local for_all_weapon_models = mod.for_all_weapon_models

local flashlight_colors = mod.flashlight_colors
local flashlight_intensities = mod.flashlight_intensities

-- ################################
-- Attachment
-- ################################
local function kitbash_flashlight_help(table_to_return, attachment_name, attachment_group_prefix, color, template_suffix, table_of_children_and_fixes, custom_attachment_node)

    create_an_attachment(table_to_return, attachment_name,
        -- Attachment
        {   replacement_path = _item_ranged.."/flashlights/"..attachment_name,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
            flashlight_template = "owo_"..color.."_flashlight_"..template_suffix,
            custom_selection_group = attachment_group_prefix..color.."_"..template_suffix,
        },
        -- Fixes
        --nil,
        {
            {
                attachment_slot = "flashlight",
                requirements = {
                    flashlight = {
                        has = attachment_name,
                    },
                },
                fix = {
                    node = 1,
                    offset = {
                        position = table_of_children_and_fixes.base_position or vector3_box(0.0, 0.0, 0.0),
                        rotation =  vector3_box(0, 0, 0),
                        scale = vector3_box(1.0, 1.0, 1.0),
                    },
                },
            }
        },
        -- Kitbash
        {
            base_unit = "content/weapons/player/attachments/flashlights/flashlight_01/flashlight_01",
            --item = _item_ranged.."/flashlights/flashlight_01",
            --[[
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = table_of_children_and_fixes.base_position or vector3_box(0, 0, 0),
                    rotation = vector3_box(0.0, 0.0, 0.0),
                    scale = vector3_box(1.0, 1.0, 1.0)
                },
            },
            children = table_clone(table_of_children_and_fixes.children),
            ]]
            attachments = {
                zzz_shared_material_overrides = {
                    item = "",
                    children = table_of_children_and_fixes.children,
                },
            }
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        custom_attachment_node or "ap_flashlight_01"
    )
end

function mod.owo_flashlight()
    local attachment_group_name = "owo_flashlight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)
    
    -- Kitbash helper items
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac1_1", nil, "content/weapons/player/melee/combat_knife/attachments/grip_01/grip_01", "ap_flashlight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac1_2", nil, "content/weapons/player/melee/combat_sword/attachments/grip_05/grip_05", "ap_flashlight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac1_3", nil, "content/weapons/player/melee/combat_knife/attachments/grip_04/grip_04", "ap_flashlight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac2_1", nil, "content/weapons/player/ranged/autogun_rifle/attachments/stock_03/stock_03", "ap_flashlight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac2_2", nil, "content/weapons/player/ranged/autogun_pistol/attachments/muzzle_01/muzzle_01", "ap_flashlight_01")

    local mp5_light_base_pos = vector3_box(0.0, 0.244, 0.33)

    for color, _ in pairs(flashlight_colors) do
        for template_suffix, _ in pairs(flashlight_intensities) do
            -- ---------------
            -- Tactical Light
            -- ---------------
            local owo_tactical_light_01 = attachment_group_prefix..color.."_"..template_suffix.."_tactical_light_01"
            kitbash_flashlight_help(table_to_return, owo_tactical_light_01, attachment_group_prefix, color, template_suffix, {
                base_position = vector3_box(0.016, 0.202, 0.05),
                children = {
                    flashlight_ac1 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac1_3",
                        fix = {
                            offset = {
                                node = 1,
                                position = vector3_box(0.058, -0.128, -0.014),
                                rotation = vector3_box(-90.0, 0.0, 0.0),
                                scale = vector3_box(1.75, 1.6, 1.75),
                            },
                        },
                    },
                    flashlight_ac2 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac2_2",
                        fix = {
                            offset = {
                                node = 1,
                                position = vector3_box(0.058, -0.18, -0.014),
                                rotation = vector3_box(0.0, -70, 0.0),
                                scale = vector3_box(1.15, 0.5, 1.15),
                            },
                        },
                    },
                },
            })
            -- ---------------
            -- MP5 Light
            -- ---------------
            local owo_mp5_light_01 = attachment_group_prefix..color.."_"..template_suffix.."_mp5_light_01"
            kitbash_flashlight_help(table_to_return, owo_mp5_light_01, attachment_group_prefix, color, template_suffix, {
                base_position = mp5_light_base_pos,
                children = {
                    flashlight_ac1 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac1_1",
                        fix = {
                            offset = {
                                node = 1,
                                position = vector3_box(0.058, -0.128, -0.014),
                                rotation = vector3_box(-90.0, 0.0, 0.0),
                                scale = vector3_box(1.95, 1.6, 1.75),
                            },
                        },
                    },
                    flashlight_ac2 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac2_1",
                        fix = {
                            offset = {
                                node = 1,
                                position = vector3_box(0.058, -0.13, -0.014),
                                rotation = vector3_box(-90, 0, -180),
                                scale = vector3_box(1.0, 0.45, 1.0),
                            },
                        },
                    },
                }
            }, "ap_receiver_01")
            local owo_mp5_light_02 = attachment_group_prefix..color.."_"..template_suffix.."_mp5_light_02"
            kitbash_flashlight_help(table_to_return, owo_mp5_light_02, attachment_group_prefix, color, template_suffix, {
                base_position = mp5_light_base_pos,
                children = {
                    flashlight_ac1 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac1_2",
                        fix = {
                            offset = {
                                node = 1,
                                position = vector3_box(0.058, -0.108, -0.012),
                                rotation = vector3_box(-90, 0, 180),
                                scale = vector3_box(0.80, 0.80, 1.0),
                            },
                        },
                    },
                    flashlight_ac2 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac2_1",
                        fix = {
                            offset = {
                                node = 1,
                                position = vector3_box(0.058, -0.13, -0.014),
                                rotation = vector3_box(-90, 0, -180),
                                scale = vector3_box(1.0, 0.45, 1.0),
                            },
                        },
                    },
                }
            }, "ap_receiver_01")
            -- ---------------
            -- Normal Colored Lights
            -- 1 for each physical model
            -- ---------------
            local colored_flashlight_group_name = attachment_group_prefix..color.."_"..template_suffix
            for_all_weapon_models(5, {"ml01"}, function(i)
                -- ex owo_flashlight_blue_narrow_01
                local owo_colored_flashlight = colored_flashlight_group_name.."_"..i
                create_an_attachment(table_to_return, owo_colored_flashlight,
                    -- Attachment
                    {   replacement_path = _item_ranged.."/flashlights/"..owo_colored_flashlight,
                        icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                        icon_render_camera_position_offset = render_cam_pos_profile_left,
                        flashlight_template = "owo_"..color.."_flashlight_"..template_suffix,
                        custom_selection_group = colored_flashlight_group_name,
                    },
                    -- Fixes
                    nil,
                    -- Kitbash
                    {
                        base_unit = "content/weapons/player/attachments/flashlights/flashlight_"..i.."/flashlight_"..i
                    },
                    -- ATTACHMENT NODE 
                    -- DON'T FORGET THIS
                    "ap_flashlight_01"
                )
            end)

            -- Create localization
            mod:add_global_localize_strings({
                ["loc_ewc_"..colored_flashlight_group_name] = {
                    en = "OwO - Flashlight: "..color..", "..template_suffix,
                },
            })
        end
    end
    

    return table_to_return

end