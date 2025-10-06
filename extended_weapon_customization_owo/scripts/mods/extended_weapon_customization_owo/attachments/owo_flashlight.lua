local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
--local vector3 = Vector3
--local vector3_box = Vector3Box
local pairs = pairs
--local table = table
--local table_insert = table.insert
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

local create_an_attachment = mod.create_an_attachment
local for_all_weapon_models = mod.for_all_weapon_models

-- ################################
-- Attachment
-- ################################
function mod.owo_flashlight()
    local attachment_group_name = "owo_flashlight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)
    
    local flashlight_colors = mod.flashlight_colors
    local flashlight_intensities = mod.flashlight_intensities

    for color, _ in pairs(flashlight_colors) do
        for template_suffix, _ in pairs(flashlight_intensities) do
            -- 1 for each physical model
            for_all_weapon_models(5, {"ml01"}, function(i)
                -- ex owo_flashlight_blue_narrow_01
                local owo_colored_flashlight = attachment_group_prefix..color.."_"..template_suffix.."_"..i
                create_an_attachment(table_to_return, owo_colored_flashlight,
                    -- Attachment
                    {   replacement_path = _item_ranged.."/flashlights/"..owo_colored_flashlight,
                        icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                        icon_render_camera_position_offset = render_cam_pos_profile_left,
                        flashlight_template = "owo_"..color.."_flashlight_"..template_suffix,
                        custom_selection_group = attachment_group_prefix..color.."_"..template_suffix,
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
                ["loc_ewc_"..attachment_group_prefix..color.."_"..template_suffix] = {
                    en = "OwO Flashlight "..color.." "..template_suffix,
                },
            })
        end
    end
    

    return table_to_return

end