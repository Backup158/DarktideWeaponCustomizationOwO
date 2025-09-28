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
local render_unit_rot_profile_left = mod.render_unit_rot_sword_blade
local render_cam_pos_profile_left = mod.render_cam_pos_sword_blade

local create_an_attachment = mod.create_an_attachment
local for_all_weapon_models = mod.for_all_weapon_models

-- ################################
-- Attachment
-- ################################
function mod.owo_slim_blade(given_slot_name, given_attachment_node)
    local current_slot_name = given_slot_name or "blade"
    local current_attachment_node = given_attachment_node or "ap_blade_01"

    local attachment_group_name = "owo_slim_blade"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    local flat_psword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_psword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_psword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_psword_g_scl = vector3_box(0.5, 0.65, 1.0)
    local flat_dclaw_scl = vector3_box(0.5, 1.0, 1.0)
    local flat_dclaw_g_scl = vector3_box(0.6, 1.0, 1.0)
    local slim_dclaw_scl = vector3_box(0.5, 0.65, 1.0)
    local slim_dclaw_g_scl = vector3_box(0.6, 0.65, 1.0)
    local grip_scale = vector3_box(0.5, 1.0, 1.0)
    -- ------------------
    -- Power Sword Blades
    -- ------------------
    -- Flat PSword
    for_all_weapon_models(7, {4}, function(number_string)
        local flat_psword = attachment_group_prefix.."flat_psword_"..number_string
        create_an_attachment(table_to_return, flat_psword,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..flat_psword,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            nil,
            -- Kitbash
            {   item = _item_melee.."/blades/power_sword_blade_"..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = flat_psword_scl
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end)
    -- Flat PSword (Grip)
    for_all_weapon_models(7, {4}, function(number_string)
        local flat_psword = attachment_group_prefix.."flat_psword_g_"..number_string
        create_an_attachment(table_to_return, flat_psword,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..flat_psword,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            {
                -- Making grip smaller
                {   attachment_slot = "grip",
                    requirements = {
                        current_slot_name = {
                            has = flat_psword,
                        },
                        grip = {
                            -- not empty
                            missing = "empty",
                        },
                    },
                    fix = {
                        offset = {
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = grip_scale
                        },
                    },
                },
            },
            -- Kitbash
            {   item = _item_melee.."/blades/power_sword_blade_"..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = flat_psword_g_scl
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end)
    -- Slim PSword
    for_all_weapon_models(7, {4}, function(number_string)
        local slim_psword = attachment_group_prefix.."slim_psword_"..number_string
        create_an_attachment(table_to_return, slim_psword,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..slim_psword,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            nil,
            -- Kitbash
            {   item = _item_melee.."/blades/power_sword_blade_"..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = slim_psword_scl
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end)
    -- Slim PSword (Grip)
    for_all_weapon_models(7, {4}, function(number_string)
        local flat_psword = attachment_group_prefix.."flat_psword_g_"..number_string
        create_an_attachment(table_to_return, flat_psword,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..flat_psword,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            {
                -- Making grip smaller
                {   attachment_slot = "grip",
                    requirements = {
                        current_slot_name = {
                            has = flat_psword,
                        },
                        grip = {
                            -- not empty
                            missing = "empty",
                        },
                    },
                    fix = {
                        offset = {
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = grip_scale
                        },
                    },
                },
            },
            -- Kitbash
            {   item = _item_melee.."/blades/power_sword_blade_"..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = slim_psword_g_scl
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end)
    -- ------------------
    -- "Devil's Claw" Blades
    -- ------------------
    -- Flat dclaw
    for_all_weapon_models(8, nil, function(number_string)
        local flat_dclaw = attachment_group_prefix.."flat_dclaw_"..number_string
        create_an_attachment(table_to_return, flat_dclaw,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..flat_dclaw,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            nil,
            -- Kitbash
            {   item = _item_melee.."/blades/combat_sword_blade_"..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = flat_dclaw_scl
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end)
    -- Flat dclaw (Grip)
    for_all_weapon_models(8, nil, function(number_string)
        local flat_dclaw = attachment_group_prefix.."flat_dclaw_g_"..number_string
        create_an_attachment(table_to_return, flat_dclaw,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..flat_dclaw,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            {
                -- Making grip smaller
                {   attachment_slot = "grip",
                    requirements = {
                        current_slot_name = {
                            has = flat_dclaw,
                        },
                        grip = {
                            -- not empty
                            missing = "empty",
                        },
                    },
                    fix = {
                        offset = {
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = grip_scale
                        },
                    },
                },
            },
            -- Kitbash
            {   item = _item_melee.."/blades/combat_sword_blade_"..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = flat_dclaw_g_scl
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end)
    -- Slim dclaw
    for_all_weapon_models(8, nil, function(number_string)
        local slim_dclaw = attachment_group_prefix.."slim_dclaw_"..number_string
        create_an_attachment(table_to_return, slim_dclaw,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..slim_dclaw,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            nil,
            -- Kitbash
            {   item = _item_melee.."/blades/combat_sword_blade_"..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = slim_dclaw_scl
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end)
    -- Slim dclaw (Grip)
    for_all_weapon_models(8, nil, function(number_string)
        local flat_dclaw = attachment_group_prefix.."flat_dclaw_g_"..number_string
        create_an_attachment(table_to_return, flat_dclaw,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..flat_dclaw,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            {
                -- Making grip smaller
                {   attachment_slot = "grip",
                    requirements = {
                        current_slot_name = {
                            has = flat_dclaw,
                        },
                        grip = {
                            -- not empty
                            missing = "empty",
                        },
                    },
                    fix = {
                        offset = {
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = grip_scale
                        },
                    },
                },
            },
            -- Kitbash
            {   item = _item_melee.."/blades/combat_sword_blade_"..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = slim_dclaw_g_scl
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end)
    
    return table_to_return

end