local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local pairs = pairs
--local string = string
local table = table
local table_insert = table.insert
local table_clone = table.clone
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
-- Helper Functions
-- ################################
-- ######
-- Initialize Table to Return
-- DESCRIPTION: Use in a function for defining a group of attachments. This is to create the table that will have attachments added to it, before it finally sends back a table of attachments, which will finally be put into the table that gets copied back into the base mod. Creates an internal name for debugging purposes
-- PARAMETERS:
--  internal_name: string; name for what attachments these are; "owo_suppressor"
-- RETURN: N/A
-- ######
function mod.init_table_to_return(internal_name)
    return {
        name = internal_name or "owo_UNKNOWN",
        attachments = {

        },
        fixes = {

        },
        kitbashs = {

        },
    }
end

-- ######
-- Create an Attachment
-- DESCRIPTION: Use in a function for defining a group of attachments. The attachment definition function initializes a table, then this function adds an attachment (and optionally fixes and/or a kitbash) to it. The main thing is to avoid having to copypaste the name so many times, even though this is less performant
--  kitbash key name is your item's name (in the replacement_path). using an existing one crashes, and if it just doesn't match the masteritems goes nuts in the console log
-- PARAMETERS:
--  table_to_add_to: table; the one to add to the attachments table in the base mod
--  internal_name: string; attachment name used internally
--  attachment_data: table; contains data for an attachment
--  fixes_data: table; contains data for any fixes
--  kitbash_data: table; contains data for a kitbash
--  attachment_point: string; attachment point for the given kitbash
-- RETURN: N/A
-- ######
function mod.create_an_attachment(table_to_add_to, internal_name, attachment_data, fixes_data, kitbash_data, attachment_point)
    table_to_add_to.attachments[internal_name] = table_clone(attachment_data)
    if fixes_data then
        table_merge_recursive(table_to_add_to.fixes, fixes_data)
    end
    if kitbash_data then
        -- Allows VFX to play, if it's a muzzle/barrel
        --  disable_vfx_spawner_exclusion
        if (attachment_point == "ap_muzzle_01") or (attachment_point == "ap_barrel_01") then
            have_vfx = true
        else
            have_vfx = false
        end
        -- create kitbash table to send back
        table_to_add_to.kitbashs[attachment_data.replacement_path] = {
            attachments = { [internal_name] = table_clone(kitbash_data) },
            display_name = "loc_"..internal_name,
            description = "loc_description_"..internal_name,
            attach_node = attachment_point,
            dev_name = internal_name,
            disable_vfx_spawner_exclusion = have_vfx
        }
    end
end

-- ######
-- for use with hide { mesh = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }
-- ######
function mod.return_all_numbers_for_hide()
    return {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
end

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
mod.render_unit_rot_profile_left = {90, 0, 30}
mod.render_cam_pos_profile_left = {-0.2, -1.75, 0.15}

-- ################################
-- Defining Attachment Functions
-- ################################
local load_mod_file = mod.load_mod_file
local create_an_attachment = mod.create_an_attachment
function mod.probe_for_node(given_attachment_node)
    local attachment_node = given_attachment_node or "ap_stock_01"
    local attachment_group_name = "owo_TEST_ITEM"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    for i = 1, 15 do
        local test_weapon_id = attachment_group_prefix..tostring(i)
        create_an_attachment(table_to_return, test_weapon_id,
            -- Attachment
            {   replacement_path = _item_ranged.."/stocks/"..test_weapon_id,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            nil,
            -- Kitbash
            {   item = _item_ranged.."/stocks/autogun_rifle_ak_stock_02",
                -- item = _item_empty_trinket, -- invisible base
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = i,
                        position = vector3_box(0.0, 0.2, 0.8),
                        rotation = vector3_box(0, 0, 0),
                        scale = vector3_box(1, 1.95, 1),
                    },
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            attachment_node
        )
    end

    return table_to_return
end

load_mod_file("attachments/owo_suppressor")

function mod.owo_tactical_stock(given_attachment_node)
    local attachment_node = given_attachment_node or "ap_stock_01"
    local attachment_group_name = "owo_tactical_stock"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Skeletal Stock
    local skeletal_stock = attachment_group_prefix.."skeletal"
    create_an_attachment(table_to_return, skeletal_stock,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..skeletal_stock,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        {
            -- Infantry Autogun
            {   attachment_slot = "stock",
                requirements = {
                    stock = {
                        has = skeletal_stock,
                    },
                    receiver = {
                        has = infantry_autogun_receivers,
                    },
                },
                fix = {
                    offset = {
                        position = vector3_box(0.0, 0.2, 0.024),
                        scale = vector3_box(1, 1.95, 1),
                    },
                },
            },
            {   attachment_slot = "stock",
                requirements = {
                    stock = {
                        has = skeletal_stock,
                    },
                    receiver = {
                        has = helbore_lasgun_receivers,
                    },
                },
                fix = {
                    node = 3,
                    offset = {
                        position = vector3_box(0.0, -0.02, 1.3),
                        rotation = vector3_box(0, 0, 0),
                        scale = vector3_box(1, 1.95, 1),
                    },
                },
            },
            -- Filling in for Helbore
            {   attachment_slot = "stock_ac1",
                requirements = {
                    stock = {
                        has = skeletal_stock,
                    },
                    receiver = {
                        has = helbore_lasgun_receivers,
                    },
                },
                fix = {
                    offset = {
                        position = vector3_box(0.0, 0.0, -0.02),
                        rotation = vector3_box(0, 0, 0),
                        scale = vector3_box(0.35, 0.5, 0.65),
                    },
                },
            },
        },
        -- Kitbash
        {   item = _item_ranged.."/stocks/autogun_rifle_ak_stock_02",
            -- item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, 0.2, 0.01),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1.95, 1),
                },
            },
            children = {
                -- Fills in the Helbore. disable otherwise
                stock_ac1 = {
                    item = _item_melee.."/heads/thunder_hammer_head_04",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0, 0, 0),
                            scale = vector3_box(0.0, 0.0, 0.0),
                        },
                    },
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        attachment_node
    )
    -- Telescoping Stock
    local telescoping_stock = attachment_group_prefix.."telescoping_in"
    create_an_attachment(table_to_return, telescoping_stock,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..telescoping_stock,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        {
            -- Infantry Autogun
            {   attachment_slot = "stock",
                requirements = {
                    stock = {
                        has = telescoping_stock,
                    },
                    receiver = {
                        has = infantry_autogun_receivers,
                    },
                },
                fix = {
                    offset = {
                        position = vector3_box(0.0, 0.12, 0.015),
                    },
                },
            },
            --{   attachment_slot = "stock",
            --    requirements = {
            --        stock = {
            --            has = telescoping_stock,
            --        },
            --        receiver = {
            --            has = helbore_lasgun_receivers,
            --        },
            --    },
            --    fix = {
            --        offset = {
            --            position = vector3_box(0.0, 0.1, 0.02),
            --        },
            --    },
            --},
            -- Filling in for Helbore
            {   attachment_slot = "stock_ac1",
                requirements = {
                    stock = {
                        has = telescoping_stock,
                    },
                    receiver = {
                        has = helbore_lasgun_receivers,
                    },
                },
                fix = {
                    offset = {
                        position = vector3_box(0.0, 0.0, -0.02),
                        rotation = vector3_box(0, 0, 0),
                        scale = vector3_box(0.35, 0.5, 0.65),
                    },
                },
            },
        },
        -- Kitbash
        {   item = _item_ranged.."/stocks/autogun_rifle_ak_stock_05",
            -- item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, 0.12, 0.0),
                    rotation = vector3_box(0, 0.035, 0),
                    scale = vector3_box(1, 1.0, 1),
                },
            },
            children = {
                -- Fills in the Helbore. disable otherwise
                stock_ac1 = {
                    item = _item_melee.."/heads/thunder_hammer_head_04",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0, 0, 0),
                            scale = vector3_box(0.0, 0.0, 0.0),
                        },
                    },
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        attachment_node
    )
    -- Folded (Natural)
    local folded_stock_n_l_pos = vector3_box(0.0, -0.05, 0.0)
    local folded_stock_n_l_rot = vector3_box(0, 0, -176)
    local folded_stock_n_1 = attachment_group_prefix.."folded_n_1"
    create_an_attachment(table_to_return, folded_stock_n_1,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..folded_stock_n_1,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        nil,
        -- Kitbash
        {   item = _item_ranged.."/stocks/autogun_rifle_killshot_stock_01",
            -- item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = folded_stock_n_l_pos,
                    rotation = folded_stock_n_l_rot,
                    scale = vector3_box(1, 1.0, 1),
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        attachment_node
    )
    local folded_stock_n_m = attachment_group_prefix.."folded_n_m"
    create_an_attachment(table_to_return, folded_stock_n_m,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..folded_stock_n_m,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        nil,
        -- Kitbash
        {   item = _item_ranged.."/stocks/autogun_rifle_killshot_stock_ml01",
            -- item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = folded_stock_n_l_pos,
                    rotation = folded_stock_n_l_rot,
                    scale = vector3_box(1, 1.0, 1),
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        attachment_node
    )
    local folded_stock_n_u = attachment_group_prefix.."folded_n_u"
    create_an_attachment(table_to_return, folded_stock_n_u,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..folded_stock_n_u,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        -- Fixes
        nil,
        -- Kitbash
        {   item = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02",
            -- item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, -0.03, 0.0),
                    rotation = vector3_box(174, 0, 0),
                    scale = vector3_box(2.52, 1.3, 1),
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        attachment_node
    )

    return table_to_return

end

function mod.owo_flashlight()
    local attachment_group_name = "owo_flashlight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    local owo_green_flashlight = attachment_group_prefix.."green_01"
    create_an_attachment(table_to_return, owo_green_flashlight,
        -- Attachment
        {   replacement_path = _item_ranged.."/flashlights/"..owo_green_flashlight,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
            flashlight_template = "green_flashlight_01",
        },
        -- Fixes
        nil,
        -- Kitbash
        {   item = _item_ranged.."/flashlights/flashlight_05", 
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

            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        "ap_flashlight_01"
    )

    return table_to_return

end