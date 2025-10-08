-- function Comment

-- ######
-- Name
-- DESCRIPTION:
-- PARAMETERS: 
-- RETURN: N/A
-- ######

-- ##############################
-- TEMPLATES FOR CREATING ATTACHMENTS
-- ##############################
-- For kitbashes
function mod.KITBASH_ITEM()
    local attachment_group_name = "KITBASH_ITEM"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = init_table_to_return(attachment_group_name)

    create_an_attachment(table_to_return, attachment_group_prefix.."NAME",
        -- Attachment
        {   replacement_path = _item_ranged.."/muzzles/"..attachment_group_prefix.."NAME",
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
        },
        -- Fixes
        nil,
        -- Kitbash
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, 0.0, 0.0),
                    rotation = vector3_box(0.0, 0.0, 0.0),
                    scale = vector3_box(1.0, 1.0, 1.0)
                },
            },
            children = {
                CHILD_SLOT_NAME = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = vector3_box(1.0, 1.0, 1.0),
                        },
                    },
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        "ap_muzzle_01"
    )

    return table_to_return

end

-- For normal
function mod.NORMAL_ITEM(given_attachment_node)
    local current_attachment_node = given_attachment_node or "ap_muzzle_01"

    local table_to_return = init_table_to_return("NORMAL_ITEM")

    create_an_attachment(table_to_return, "LALALALALA_NAME",
        -- Attachment
        {   replacement_path = _item_ranged.."/muzzles/LALALALALA_NAME",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        {   
            attachment_slot = "muzzles",
            requirements = {
                stock = {
                    has = folded_stock_n_1,
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
        },
        -- Kitbash
        {   base_unit = FROM_MASTER_ITEMS_EXTRACTION
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS (nil for completely new item)
        current_attachment_node
    )

    return table_to_return

end