local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local table = table
local table_insert = table.insert
local table_merge_recursive = table.merge_recursive

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
local function generate_holographic_variant(table_to_return, attachment_group_name, broad_name, suffix_name, table_of_children_with_fixes, child_fix_multiplier)
    local shortname = attachment_group_name.."_"..broad_name..suffix_name
    local children_table = table_merge_recursive(
        {
            sight_base = {
                item = _item_ranged.."/sights/owo_holosight_base2",
                fix = {
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = vector3_box(1.0, 1.0, 1.3)
                    },
                    hide = {
                        mesh = {1}, -- Hide reticle
                    }
                },
            },
            sight_group_indicator = {
                item = _item_ranged.."/sights/owo_indicator_sight_"..broad_name,
                fix = {
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = vector3_box(1.0, 1.0, 1.0)
                    },
                },
            },
        },
        table_of_children_with_fixes
    )
    if type(child_fix_multiplier) == "table" then
        mod:echo("pound sand")
    end

    create_an_attachment(table_to_return, shortname,
        -- Attachment
        {   replacement_path = _item_ranged.."/sights/"..shortname,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
            custom_selection_group = "owo_holographic_sight_"..broad_name,
        },
        -- Fixes
        nil,
        -- Kitbash
        {   item = _item_ranged.."/sights/owo_holosight_base",
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, 0.0, 0.0),
                    rotation = vector3_box(0.0, 0.0, 0.0),
                    scale = vector3_box(1.0, 1.0, 1.0)
                },
                hide = {
                    mesh = {1,5}, -- Hide reticle
                }
            },
            children = children_table,
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        current_attachment_node
    )
    -- Adding name to list of suppressors
    if all_attachment_names then
        table_insert(all_attachment_names, shortname)
    end
end

local function create_all_holographic_variants(table_to_return, attachment_group_name, unique_name, table_of_children_with_fixes)
    generate_holographic_variant(table_to_return, attachment_group_name, unique_name, "", table_of_children_with_fixes)
    local short_scale = vector3_box(1, 0.85, 1)
    generate_holographic_variant(table_to_return, attachment_group_name, unique_name, "_short", table_of_children_with_fixes, {
        sight_ac1 = {
            fix = {
                offset = {
                    scale = short_scale
                }
            }
        },
        sight_ac2 = {
            fix = {
                offset = {
                    scale = short_scale
                }
            }
        }
    })
end

function mod.owo_holographic_sight(given_slot, given_attachment_node)
    local current_slot = given_slot or "sight"
    local current_attachment_node = given_attachment_node or "ap_sight_01"

    local attachment_group_name = "owo_holographic_sight"
    local table_to_return = mod.init_table_to_return(attachment_group_name)
--[[
    -- Logging all names
    local all_attachment_names = nil
    if not mod.all_holographic_sights_names then
        all_attachment_names = {}
    end
]]
    -- adding helpers
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_holosight_base", nil, "content/weapons/player/attachments/sights/sight_reflex_03/sight_reflex_03", current_attachment_node)
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_holosight_base2", nil, "content/weapons/player/attachments/sights/sight_reflex_03/sight_reflex_03", current_attachment_node)
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_eotech_housing_chainsword", nil, "content/weapons/player/melee/chain_sword/attachments/grip_06/grip_06", current_attachment_node)
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_eotech_front_seat_tip", nil, "content/weapons/player/melee/hatchet/attachments/grip_03/grip_03", current_attachment_node)
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_vortex_housing_foreskin", nil, "content/weapons/player/ranged/lasgun_pistol/attachments/muzzle_03/muzzle_03", current_attachment_node)
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_eotech_front_seat", nil, "content/weapons/player/melee/combat_blade/attachments/handle_04/handle_04", current_attachment_node)
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_indicator_sight_eotech", nil, "content/characters/empty_item/empty_item", current_attachment_node)
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_indicator_sight_vortex", nil, "content/characters/empty_item/empty_item", current_attachment_node)
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_indicator_sight_dot", nil, "content/characters/empty_item/empty_item", current_attachment_node)

    -- ---------------
    -- EOTech HWS (Holographic Weapon Sight)
    -- ---------------
    local eotech_housing_pos = vector3_box(0.00, 0.018, 0.018)
    local eotech_housing_rot = vector3_box(180, 90, -90)
    local eotech_housing_scl = vector3_box(1.25, 0.366 * 1.3, 0.256)
    create_all_holographic_variants(table_to_return, attachment_group_name, "eotech", {
        sight_ac1 = {
            item = _item_ranged.."/sights/owo_eotech_housing_chainsword",
            fix = {
                offset = {
                    node = 1,
                    position = eotech_housing_pos,
                    rotation = eotech_housing_rot,
                    scale = eotech_housing_scl,
                },
            },
        },
        sight_ac2 = {
            item = _item_ranged.."/sights/owo_eotech_housing_chainsword",
            fix = {
                offset = {
                    node = 1,
                    position = eotech_housing_pos,
                    rotation = vector3_box(90, -90, 0),
                    scale = eotech_housing_scl,
                },
            },
        },
        sight_ac3 = {
            item = _item_ranged.."/sights/owo_eotech_front_seat_tip",
            fix = {
                offset = {
                    node = 1,
                    position = vector3_box(0, 0.088, 0.01),
                    rotation = eotech_housing_rot,
                    --scale = vector3_box(1.1, 0.57, 0.154),
                    scale = vector3_box(1.1, 0.57 * 1.3, 0.154),
                },
            },
        },
        sight_ac4 = {
            item = _item_ranged.."/sights/owo_eotech_front_seat",
            fix = {
                offset = {
                    node = 1,
                    position = vector3_box(0, 0.034, 0.008),
                    rotation = vector3_box(90, 0, -180),
                    --scale = vector3_box(0.42, 0.24, 0.314),
                    scale = vector3_box(0.42, 0.24 * 1.3, 0.314),
                },
            },
        },
    })

    -- ---------------
    -- Vortex Razor AMG UH-1
    -- ---------------

    if all_attachment_names then
        mod.all_holographic_sights_names = all_attachment_names
    end

    return table_to_return

end
