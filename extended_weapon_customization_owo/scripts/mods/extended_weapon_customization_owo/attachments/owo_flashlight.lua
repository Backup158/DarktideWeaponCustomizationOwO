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
local _item_empty = "content/characters/empty_item/empty_item"

-- ################################
-- Some Variables for Common Attachments
-- ################################

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment
local for_all_weapon_models = mod.for_all_weapon_models
local number_as_string = mod.number_as_string

local localize_attachment_triple_threat = mod.localize_attachment_triple_threat

local flashlight_colors = mod.flashlight_colors
local flashlight_intensities = mod.flashlight_intensities

-- ################################
-- Attachment
-- ################################
function mod.owo_color_flashlight()
    local attachment_group_name = "owo_flashlight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    for color, _ in pairs(flashlight_colors) do
        for template_suffix, _ in pairs(flashlight_intensities) do
            -- ---------------
            -- Normal Colored Lights
            -- 1 for each physical model
            -- ---------------
            local colored_flashlight_group_name = attachment_group_prefix..color.."_"..template_suffix
            -- 1 per model
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
            -- 1 invisible
            local owo_invis_color_flashlight = colored_flashlight_group_name.."_invisible"
            create_an_attachment(table_to_return, owo_invis_color_flashlight,
                -- Attachment
                {   replacement_path = _item_ranged.."/flashlights/"..owo_invis_color_flashlight,
                    icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                    icon_render_camera_position_offset = render_cam_pos_profile_left,
                    flashlight_template = "owo_"..color.."_flashlight_"..template_suffix,
                    custom_selection_group = colored_flashlight_group_name,
                },
                -- Fixes
                {
                    {   attachment_slot = "flashlight",
                        requirements = {
                            flashlight = {
                                has = owo_invis_color_flashlight,
                            },
                        },
                        fix = {
                            offset = {
                                node = 1,
                                position = vector3_box(0.0, 0.0, 0.0),
                                rotation = vector3_box(0.0, 0.0, 0.0),
                                scale = vector3_box(0.0001, 0.0001, 0.0001),
                            },
                        },
                    }
                },
                -- Kitbash
                {
                    base_unit = "content/weapons/player/attachments/flashlights/flashlight_01/flashlight_01",
                },
                -- ATTACHMENT NODE 
                -- DON'T FORGET THIS
                "ap_flashlight_01"
            )

            -- Create localization for slot
            mod:add_global_localize_strings({
                ["loc_ewc_"..colored_flashlight_group_name] = {
                    en = "OwO - Flashlight: "..color..", "..template_suffix,
                },
            })
        end
    end

    return table_to_return

end

function mod.owo_tactical_flashlight()
    local attachment_group_name = "owo_flashlight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)
    
    -- Logging all names if this is the first time
    local all_these_attachments = nil
    if not mod.all_owo_tactical_flashlight then
        all_these_attachments = {}
    end

    local function kitbash_flashlight_help(table_to_return, attachment_group_prefix, color, template_suffix, name_suffix, number_as_string, table_of_children_and_fixes, custom_attachment_node)
        local attachment_name = attachment_group_prefix..color.."_"..template_suffix.."_"..name_suffix.."_"..number_as_string
        create_an_attachment(table_to_return, attachment_name,
            -- Attachment
            {   replacement_path = _item_ranged.."/flashlights/"..attachment_name,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                flashlight_template = "owo_"..color.."_flashlight_"..template_suffix,
                custom_selection_group = attachment_group_prefix..color.."_"..template_suffix,
                randomization_requirement = "mod_option_flashlight_randomization",
            },
            -- Fixes
            nil,
            -- Kitbash
            --  There are some routes I can take: 
            --      base_unit empty with all children (messes up flashlight_template color)
            --      base_unit flashlight_01 with attachments and position set in fixes (induces the Lottery)
            --      the forbidden middle path, shoving a real base unit inside the anus lmao (this looks like ass)
            --          (then hiding the real base unit with fixes)
            --          then plugin authors can move it by shifting owo_flashlight_base
            --  OR
            --  I just use the default position and move it as needed
            --  yknow, like every other normal attachment
            {
                base_unit = "content/weapons/player/attachments/flashlights/flashlight_01/flashlight_01",
                attachments = table_clone(table_of_children_and_fixes.children),
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            custom_attachment_node or "ap_flashlight_01"
        )

        -- Adding name to this group's list
        if all_these_attachments then
            all_these_attachments[name_suffix] = all_these_attachments[name_suffix] or {}
            table_insert(all_these_attachments[name_suffix], attachment_name)
        end
        
        localize_attachment_triple_threat(attachment_group_name, name_suffix, number_as_string)
    end

    -- Kitbash helper items
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac1_grip1", nil, "content/weapons/player/melee/combat_knife/attachments/grip_01/grip_01", "ap_flashlight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac1_dclaw_grip5", nil, "content/weapons/player/melee/combat_sword/attachments/grip_05/grip_05", "ap_flashlight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac1_grip4", nil, "content/weapons/player/melee/combat_knife/attachments/grip_04/grip_04", "ap_flashlight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac2_attacher_stock3", nil, "content/weapons/player/ranged/autogun_rifle/attachments/stock_03/stock_03", "ap_flashlight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/flashlights/owo_flashlight_ac2_attacher_ap_muzzle1", nil, "content/weapons/player/ranged/autogun_pistol/attachments/muzzle_01/muzzle_01", "ap_flashlight_01")

    --local mp5_light_base_pos = vector3_box(0.0, 0.244, 0.33)
    local mp5_light_base_pos = vector3_box(-0.058, -0.178, 0.14)

    for color, _ in pairs(flashlight_colors) do
        for template_suffix, _ in pairs(flashlight_intensities) do
            -- ---------------
            -- Tactical Light
            -- ---------------
            kitbash_flashlight_help(table_to_return, attachment_group_prefix, color, template_suffix, "tactical_light", "01", {
                base_position = vector3_box(0.0, 0.102, 0.0),
                children = {
                    flashlight_ac1 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac1_grip4",
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
                        item = _item_ranged.."/flashlights/owo_flashlight_ac2_attacher_ap_muzzle1",
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
            kitbash_flashlight_help(table_to_return, attachment_group_prefix, color, template_suffix, "mp5_light", "01", {
                base_position = mp5_light_base_pos,
                children = {
                    flashlight_ac1 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac1_grip1",
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
                        item = _item_ranged.."/flashlights/owo_flashlight_ac2_attacher_stock3",
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
            }, "ap_sight_01")
            kitbash_flashlight_help(table_to_return, attachment_group_prefix, color, template_suffix, "mp5_light", "02", {
                base_position = mp5_light_base_pos,
                children = {
                    flashlight_ac1 = {
                        item = _item_ranged.."/flashlights/owo_flashlight_ac1_dclaw_grip5",
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
                        item = _item_ranged.."/flashlights/owo_flashlight_ac2_attacher_stock3",
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
            }, "ap_sight_01")
        end
    end

    -- Making list of all attachments global
    mod.transfer_local_table_of_attachments_to_global(all_these_attachments, "all_owo_tactical_flashlight")
    

    return table_to_return
end