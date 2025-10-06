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
--local infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_ml01"
--local braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_ml01"
--local vigilant_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
--local infantry_lasgun_receivers = "lasgun_rifle_receiver_01|lasgun_rifle_receiver_02|lasgun_rifle_receiver_03|lasgun_rifle_receiver_ml01"
--local helbore_lasgun_receivers = "lasgun_rifle_krieg_receiver_01|lasgun_rifle_krieg_receiver_02|lasgun_krieg_rifle_receiver_03|lasgun_rifle_krieg_receiver_04|lasgun_rifle_krieg_receiver_05|lasgun_krieg_rifle_receiver_06|lasgun_rifle_krieg_receiver_ml01"
--local recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_elysian_rifle_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_elysian_rifle_receiver_06|lasgun_elysian_rifle_receiver_07|lasgun_rifle_elysian_receiver_ml01"

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_an_attachment = mod.create_an_attachment

-- ################################
-- Attachment
-- ################################
function mod.owo_iron_sight(given_attachment_node)
    local current_attachment_node = given_attachment_node or "ap_sight_01"
    local attachment_group_name = "owo_iron_sight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    local shortname = attachment_group_prefix.."kalashnikov"
    create_an_attachment(table_to_return, shortname,
        -- Attachment
        {   replacement_path = _item_ranged.."/sights/"..shortname,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        nil,
        -- Kitbash
        {   item = _item_ranged.."/sights/autogun_rifle_sight_01",
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, 0.24, 0.0),
                    rotation = vector3_box(0.0, 0.0, 0.0),
                    scale = vector3_box(1.0, 1.0, 1.0)
                },
            },
            children = {
                -- Range select
                sight_ac1 = {
                    item = _item_melee.."/grips/hatchet_grip_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(-0.004, -0.06, 0.01),
                            rotation = vector3_box(0.0, 90, 0.0),
                            scale = vector3_box(0.36, 0.36, 0.25),
                        },
                    },
                },
                sight_ac2 = {
                    item = _item_melee.."/grips/hatchet_grip_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.022, -0.06, 0.01),
                            rotation = vector3_box(0.0, 90, 0.0),
                            scale = vector3_box(0.32, 0.32, 0.06),
                        },
                    },
                },
                -- Rear sight (making that v notch)
                sight_ac3 = {
                    item = _item_ranged.."/stocks/autogun_rifle_ak_stock_01",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.009, -0.07, 0.0226),
                            rotation = vector3_box(90.0, 90.0, 0.0),
                            scale = vector3_box(0.23, 0.047, 0.22),
                        },
                    },
                },
                sight_ac4 = {
                    item = _item_ranged.."/stocks/autogun_rifle_ak_stock_01",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(-0.009, -0.07, 0.0226),
                            rotation = vector3_box(90.0, -90.0, 0.0),
                            scale = vector3_box(0.23, 0.047, 0.22),
                        },
                    },
                },
                -- rear butt
                sight_ac5 = {
                    item = _item_ranged.."/stocks/autogun_rifle_ak_stock_01",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.008, -0.01, 0.003),
                            rotation = vector3_box(-145, 90, 145),
                            scale = vector3_box(0.23, 0.24, 0.25),
                        },
                    },
                },
                -- Dust cover
                sight_ac6 = {
                    item = _item_ranged.."/stocks/autogun_rifle_ak_stock_02",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.0, -0.022),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = vector3_box(0.75, 1.4, 1.0),
                        },
                    },
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        current_attachment_node
    )

    return table_to_return

end
