local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box
local type = type

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

    local grip_scale = vector3_box(0.5, 1.0, 1.0)

    local function slim_blade_attach_helper(number_string, name_to_use, base_item_address, scales_table)
        local slim_blade_name = attachment_group_prefix..name_to_use..number_string
        local fixes_to_add = nil
        if type(scales_table) == "table" and scales_table[2] then
            -- this is going to be so ass to look at :wilted_rose:
            fixes_to_add = {
                -- Making grip smaller
                {   attachment_slot = "grip",
                    requirements = {
                        [current_slot_name] = {
                            has = slim_blade_name,
                        },
                        grip = {
                            --has = "power_sword_grip_01|power_sword_grip_02|power_sword_grip_03|power_sword_grip_04|power_sword_grip_05|power_sword_grip_06|power_sword_grip_ml01"
                            missing = "empty",
                        },
                    },
                    fix = {
                        disable_in_ui = false,
                        offset = {
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = scales_table[2]
                        },
                    },
                },
            }
        end
        local blade_scale = vector3_box(0.5, 1.0, 1.0)
        -- safety for if i fuck up calling it
        if scales_table then
            if (type(scales_table) == "table" and scales_table[1]) then
                blade_scale = scales_table[1]
            else
                blade_scale = scales_table -- in case i get lazy and don tmake it a table
            end
        end
        create_an_attachment(table_to_return, slim_blade_name,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..slim_blade_name,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
            },
            -- Fixes
            fixes_to_add,
            -- Kitbash
            {   item = base_item_address..number_string,
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.0, 0.0),
                        rotation = vector3_box(0.0, 0.0, 0.0),
                        scale = blade_scale
                    },
                },
                children = {
                    
                },
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end
    -- ------------------
    -- Power Sword Blades
    -- ------------------
    local flat_psword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_psword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_psword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_psword_g_scl = vector3_box(0.5, 0.65, 1.0)
    -- Flat PSword
    for_all_weapon_models(7, {4}, function(number_string)
        slim_blade_attach_helper(number_string, "flat_psword_", _item_melee.."/blades/power_sword_blade_", flat_psword_scl)
    end)
    -- Flat PSword (Grip)
    for_all_weapon_models(7, {4}, function(number_string)
        slim_blade_attach_helper(number_string, "flat_psword_g_", _item_melee.."/blades/power_sword_blade_", {flat_psword_g_scl, grip_scale})
    end)
    -- Slim PSword
    for_all_weapon_models(7, {4}, function(number_string)
        slim_blade_attach_helper(number_string, "slim_psword_", _item_melee.."/blades/power_sword_blade_", slim_psword_scl)
    end)
    -- Slim PSword (Grip)
    for_all_weapon_models(7, {4}, function(number_string)
        slim_blade_attach_helper(number_string, "slim_psword_g_", _item_melee.."/blades/power_sword_blade_", {slim_psword_g_scl, grip_scale})
    end)
    -- ------------------
    -- "Devil's Claw" Blades
    -- ------------------
    local flat_dclaw_scl = vector3_box(0.5, 1.0, 1.0)
    local flat_dclaw_g_scl = vector3_box(0.6, 1.0, 1.0)
    local slim_dclaw_scl = vector3_box(0.5, 0.65, 1.0)
    local slim_dclaw_g_scl = vector3_box(0.6, 0.65, 1.0)
    -- Flat dclaw
    for_all_weapon_models(7, nil, function(number_string)
        slim_blade_attach_helper(number_string, "flat_dclaw_", _item_melee.."/blades/combat_sword_blade_", flat_dclaw_scl)
    end)
    -- Flat dclaw (Grip)
    for_all_weapon_models(7, nil, function(number_string)
        slim_blade_attach_helper(number_string, "flat_dclaw_g_", _item_melee.."/blades/combat_sword_blade_", {flat_dclaw_g_scl, grip_scale})
    end)
    -- Slim dclaw
    for_all_weapon_models(7, nil, function(number_string)
        slim_blade_attach_helper(number_string, "slim_dclaw_", _item_melee.."/blades/combat_sword_blade_", slim_dclaw_scl)
    end)
    -- Slim dclaw (Grip)
    for_all_weapon_models(7, nil, function(number_string)
        slim_blade_attach_helper(number_string, "slim_dclaw_g_", _item_melee.."/blades/combat_sword_blade_", {slim_dclaw_g_scl, grip_scale})
    end)
    -- ------------------
    -- Heavy Sword
    -- ------------------
    local flat_hsword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_hsword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_hsword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_hsword_g_scl = vector3_box(0.5, 0.65, 1.0)
    -- Flat hsword
    for_all_weapon_models(6, nil, function(number_string)
        slim_blade_attach_helper(number_string, "flat_hsword_", _item_melee.."/blades/falchion_blade_", flat_hsword_scl)
    end)
    -- Flat hsword (Grip)
    for_all_weapon_models(6, nil, function(number_string)
        slim_blade_attach_helper(number_string, "flat_hsword_g_", _item_melee.."/blades/falchion_blade_", {flat_hsword_g_scl, grip_scale})
    end)
    -- Slim hsword
    for_all_weapon_models(6, nil, function(number_string)
        slim_blade_attach_helper(number_string, "slim_hsword_", _item_melee.."/blades/falchion_blade_", slim_hsword_scl)
    end)
    -- Slim hsword (Grip)
    for_all_weapon_models(6, nil, function(number_string)
        slim_blade_attach_helper(number_string, "slim_hsword_g_", _item_melee.."/blades/falchion_blade_", {slim_hsword_g_scl, grip_scale})
    end)
    
    --table.dump(table_to_return.fixes, "slim fixes", 6)
    return table_to_return

end