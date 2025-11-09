local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local table = table
local table_insert = table.insert

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

local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment

-- ################################
-- Attachment
-- ################################
function mod.owo_holographic_sight(given_slot, given_attachment_node)
    local current_slot = given_slot or "sight"
    local current_attachment_node = given_attachment_node or "ap_sight_01"

    local attachment_group_name = "owo_holographic_sight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names
    local first_time_setup = false
    local all_attachment_names = nil
    if not mod.all_holographic_sights_names then
        first_time_setup = true
        all_attachment_names = {}
    end

    -- adding helpers
    create_kitbash_full_item(table_to_return, REPLACEMENT_PATH, nil, MASTER_ITEMS_BASE_UNIT, current_attachment_node)

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
                disable_in_ui = false,
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

    return table_to_return

end
