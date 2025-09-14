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
    local table_to_return = init_table_to_return("KITBASH_ITEM")

    create_an_attachment(table_to_return, "LALALALALA_NAME",
        -- Attachment
        {   replacement_path = _item_ranged.."/muzzles/LALALALALA_NAME",
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
function mod.NORMAL_ITEM()
    local table_to_return = init_table_to_return("NORMAL_ITEM")

    create_an_attachment(table_to_return, "LALALALALA_NAME",
        -- Attachment
        {   replacement_path = _item_ranged.."/muzzles/LALALALALA_NAME",
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
        },
        -- Fixes
        nil,
        -- Kitbash
        nil,
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        nil
    )

    return table_to_return

end