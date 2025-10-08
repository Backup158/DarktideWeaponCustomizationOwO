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

local create_an_attachment = mod.create_an_attachment

-- ################################
-- Attachment
-- ################################
function mod.owo_mag()
    local attachment_group_name = "owo_mag"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    local shortname = attachment_group_prefix.."ak_extended"
    create_an_attachment(table_to_return, shortname,
        -- Attachment
        {   replacement_path = _item_ranged.."/magazines/"..shortname,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        {
            {   
                attachment_slot = "magazine",
                requirements = {
                    stock = {
                        has = shortname,
                    },
                },
                fix = {
                    node = 1,
                    offset = {
                        position = vector3_box(0.0, -0.015, -0.03),
                        rotation = vector3_box(15, 0, 0.0),
                        scale = vector3_box(1.0, 0.9, 1.1)
                    },
                },
            },
        },
        -- Kitbash
        {   base_unit = "content/weapons/player/ranged/autogun_rifle_ak/attachments/magazine_01/magazine_01",
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        "ap_magazine_01"
    )

    return table_to_return

end