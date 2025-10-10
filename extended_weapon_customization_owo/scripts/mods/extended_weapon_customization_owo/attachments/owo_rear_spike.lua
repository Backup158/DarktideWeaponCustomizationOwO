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
function mod.owo_rear_spike(given_slot, given_attachment_node)
    local current_attachment_node = given_attachment_node or "ap_head_01"
    local current_slot = given_slot or "head_rear"

    local attachment_group_name = "owo_rear_spike"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    local spike_01 = attachment_group_prefix.."01"
    create_an_attachment(table_to_return, spike_01,
        -- Attachment
        {   replacement_path = _item_melee.."/head_rears/"..spike_01,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        nil,
        --[[
        -- Causes backend error????
        {   
            attachment_slot = current_slot,
            requirements = {
                stock = {
                    has = spike_01,
                },
            },
            fix = {
                node = 1,
                offset = {
                    position = vector3_box(0.0, 0.0, 0.0),
                    rotation =  vector3_box(0, 0, 0),
                    scale = vector3_box(1.0, 1.0, 1.0),
                },
            },
        },]]
        -- Kitbash
        {   base_unit = "content/weapons/player/melee/axe/attachments/head_03/head_03"
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        current_attachment_node
    )
    local spike_02 = attachment_group_prefix.."02"
    create_an_attachment(table_to_return, spike_02,
        -- Attachment
        {   replacement_path = _item_melee.."/head_rears/"..spike_02,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        nil,
        --[[
        -- Causes backend error????
        {   
            attachment_slot = current_slot,
            requirements = {
                stock = {
                    has = spike_01,
                },
            },
            fix = {
                node = 1,
                offset = {
                    position = vector3_box(0.0, 0.0, 0.0),
                    rotation =  vector3_box(0, 0, 0),
                    scale = vector3_box(1.0, 1.0, 1.0),
                },
            },
        },]]
        -- Kitbash
        {   base_unit = "content/weapons/player/melee/axe/attachments/head_04/head_04"
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        current_attachment_node
    )

    table_to_return.attachment_slots["head_rear"] = {
        parent_slot = current_slot,
        default_path = _item_empty_trinket,
        --[[
        fix = {
            offset = {
                node = 1,
                position = vector3_box(0, 0, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
            },
        },
        ]]
    }
    

    return table_to_return

end
