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
local create_kitbash_full_item = mod.create_kitbash_full_item

function mod.KITBASH_ITEM(given_slot, given_attachment_node)
    local current_slot = given_slot or "muzzle"
    local current_attachment_node = given_attachment_node or "ap_muzzle_01"

    local attachment_group_name = "KITBASH_ITEM"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = init_table_to_return(attachment_group_name)

    local shortname = attachment_group_prefix.."NAME"
    create_an_attachment(table_to_return, shortname,
        -- Attachment
        {   replacement_path = _item_ranged.."/muzzles/"..shortname,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
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
        current_attachment_node
    )

    -- adding helpers
    create_kitbash_full_item(table_to_return, REPLACEMENT_PATH, nil, MASTER_ITEMS_BASE_UNIT, current_attachment_node)

    return table_to_return

end

-- For normal
function mod.NORMAL_ITEM(given_slot, given_attachment_node)
    local current_slot = given_slot or "muzzle"
    local current_attachment_node = given_attachment_node or "ap_muzzle_01"

    local attachment_group_name = "owo_NORMAL_ITEM"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = init_table_to_return("NORMAL_ITEM")

    local shortname = attachment_group_prefix.."LALALALALA_NAME"
    create_an_attachment(table_to_return, shortname,
        -- Attachment
        {   replacement_path = _item_ranged.."/muzzles/"..shortname,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        {   
            attachment_slot = current_slot,
            requirements = {
                stock = {
                    has = shortname,
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