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
local infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_ml01"
local braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_ml01"
local vigilant_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
local infantry_lasgun_receivers = "lasgun_rifle_receiver_01|lasgun_rifle_receiver_02|lasgun_rifle_receiver_03|lasgun_rifle_receiver_ml01"
local helbore_lasgun_receivers = "lasgun_rifle_krieg_receiver_01|lasgun_rifle_krieg_receiver_02|lasgun_krieg_rifle_receiver_03|lasgun_rifle_krieg_receiver_04|lasgun_rifle_krieg_receiver_05|lasgun_krieg_rifle_receiver_06|lasgun_rifle_krieg_receiver_ml01"
local recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_elysian_rifle_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_elysian_rifle_receiver_06|lasgun_elysian_rifle_receiver_07|lasgun_rifle_elysian_receiver_ml01"

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment

-- ################################
-- Attachment
-- ################################
function mod.owo_tactical_stock(given_attachment_node)
    local attachment_node = given_attachment_node or "ap_stock_01"
    local attachment_group_name = "owo_tactical_stock"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names if this is the first time
    local all_these_attachments = nil
    if not mod.all_tactical_stock_names then
        all_these_attachments = {}
    end

    local function tactical_stock_helper(name, model_unit_thing, fix_pos, fix_rot, fix_scl)
        create_an_attachment(table_to_return, name,
            -- Attachment
            {   replacement_path = _item_ranged.."/stocks/"..name,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            {
                {   
                    attachment_slot = "stock",
                    requirements = {
                        stock = {
                            has = name,
                        },
                    },
                    fix = {
                        offset = {
                            node = 1,
                            position = fix_pos or vector3_box(0,0,0),
                            rotation = fix_rot or vector3_box(0,0,0),
                            scale = fix_scl or vector3_box(1,1,1),
                        },
                    },
                },
            },
            -- Kitbash
            {   base_unit = model_unit_thing,
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            attachment_node
        )
        -- Adding name to list of suppressors
        if all_these_attachments then
            table_insert(all_these_attachments, name)
        end
    end

    -- Skeletal Stock
    local skeletal_stock = attachment_group_prefix.."skeletal"
    tactical_stock_helper(skeletal_stock, "content/weapons/player/ranged/autogun_rifle_ak/attachments/stock_02/stock_02", vector3_box(0.0, 0.2, 0.01), vector3_box(0, 0, 0), vector3_box(1, 1.95, 1))

    -- Telescoping Stock
    local telescoping_stock = attachment_group_prefix.."telescoping_in"
    tactical_stock_helper(telescoping_stock, "content/weapons/player/ranged/autogun_rifle_ak/attachments/stock_05/stock_05", vector3_box(0.0, 0.12, 0.0), vector3_box(0, 0, 0), vector3_box(1, 1.0, 1))

    -- Folded (Natural)
    local folded_stock_n_l_pos = vector3_box(0.0, -0.05, 0.0)
    local folded_stock_n_l_rot = vector3_box(0, 0, -176)
    local folded_stock_n_1 = attachment_group_prefix.."folded_n_1"
    local folded_stock_n_m = attachment_group_prefix.."folded_n_m"
    tactical_stock_helper(folded_stock_n_1, "content/weapons/player/ranged/autogun_rifle_killshot/attachments/stock_01/stock_01", folded_stock_n_l_pos, folded_stock_n_l_rot, nil)
    tactical_stock_helper(folded_stock_n_m, "content/weapons/player/ranged/autogun_rifle_killshot/attachments/stock_ml01/stock_ml01", folded_stock_n_l_pos, folded_stock_n_l_rot, nil)

    local folded_stock_n_u = attachment_group_prefix.."folded_n_u"
    tactical_stock_helper(folded_stock_n_u, "content/weapons/player/ranged/autogun_rifle_killshot/attachments/stock_02/stock_02", vector3_box(0.0, -0.03, 0.0), vector3_box(174, 0, 0), vector3_box(2.52, 1.3, 1))

    -- Full Item
    create_kitbash_full_item(table_to_return, _item_melee.."/heads/owo_stock_fill_hammer_head_04", nil, "content/weapons/player/melee/thunder_hammer/attachments/head_04/head_04", attachment_node)

    -- Making list of all attachments global
    if all_these_attachments then
        mod.all_tactical_stock_names = all_these_attachments
    end

    return table_to_return

end