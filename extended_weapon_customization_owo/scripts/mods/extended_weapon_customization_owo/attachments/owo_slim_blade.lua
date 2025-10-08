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
        local slim_blade_name = attachment_group_prefix..name_to_use.."_"..number_string
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
                custom_selection_group = attachment_group_name.."_"..name_to_use,
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
    -- Calls the above for all the variants
    local function slim_blade_variant_helper(amount_of_models, table_of_models_to_skip, base_name, model_base_path, table_of_all_transformations)
        -- Flat
        for_all_weapon_models(amount_of_models, table_of_models_to_skip, function(number_string)
            slim_blade_attach_helper(number_string, "flat_"..base_name, model_base_path, table_of_all_transformations.flat_scale)
        end)
        -- Flat (Grip)
        for_all_weapon_models(amount_of_models, table_of_models_to_skip, function(number_string)
            slim_blade_attach_helper(number_string, "flat_"..base_name.."_g", model_base_path, {table_of_all_transformations.flat_g_scale, grip_scale})
        end)
        -- Slim
        for_all_weapon_models(amount_of_models, table_of_models_to_skip, function(number_string)
            slim_blade_attach_helper(number_string, "slim_"..base_name, model_base_path, table_of_all_transformations.slim_scale)
        end)
        -- Slim (Grip)
        for_all_weapon_models(amount_of_models, table_of_models_to_skip, function(number_string)
            slim_blade_attach_helper(number_string, "slim_"..base_name.."_g", model_base_path, {table_of_all_transformations.slim_g_scale, grip_scale})
        end)
    end
    -- ------------------
    -- Power Sword Blades
    -- ------------------
    local flat_psword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_psword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_psword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_psword_g_scl = vector3_box(0.5, 0.65, 1.0)
    slim_blade_variant_helper(7, {4}, "psword", _item_melee.."/blades/power_sword_blade_", {
        flat_scale = flat_psword_scl,
        flat_g_scale = flat_psword_g_scl,
        slim_scale = slim_psword_scl,
        slim_g_scale = slim_psword_g_scl,
    })
    -- ------------------
    -- Power Falchion
    -- ------------------
    local flat_pfalchion_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_pfalchion_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_pfalchion_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_pfalchion_g_scl = vector3_box(0.5, 0.65, 1.0)
    slim_blade_variant_helper(2, nil, "pfalchion", _item_melee.."/blades/power_falchion_blade_", {
        flat_scale = flat_pfalchion_scl,
        flat_g_scale = flat_pfalchion_g_scl,
        slim_scale = slim_pfalchion_scl,
        slim_g_scale = slim_pfalchion_g_scl,
    })
    -- ------------------
    -- Relic Blade Blades
    -- ------------------
    local flat_2h_psword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_2h_psword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_2h_psword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_2h_psword_g_scl = vector3_box(0.5, 0.65, 1.0)
    slim_blade_variant_helper(3, nil, "2h_psword", _item_melee.."/blades/2h_power_sword_blade_", {
        flat_scale = flat_2h_psword_scl,
        flat_g_scale = flat_2h_psword_g_scl,
        slim_scale = slim_2h_psword_scl,
        slim_g_scale = slim_2h_psword_g_scl,
    })
    -- Short variants
    local flat_2h_psword_short_scl = vector3_box(0.35, 1.0, 0.75)
    local slim_2h_psword_short_scl = vector3_box(0.35, 0.65, 0.75)
    slim_blade_variant_helper(3, nil, "2h_psword_short", _item_melee.."/blades/2h_power_sword_blade_", {
        flat_scale = flat_2h_psword_short_scl,
        flat_g_scale = flat_2h_psword_g_scl,
        slim_scale = slim_2h_psword_scl,
        slim_g_scale = slim_2h_psword_short_scl,
    })
    -- ------------------
    -- Force Sword Blades
    -- ------------------
    local flat_fsword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_fsword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_fsword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_fsword_g_scl = vector3_box(0.5, 0.65, 1.0)
    slim_blade_variant_helper(5, nil, "fsword", _item_melee.."/blades/force_sword_blade_", {
        flat_scale = flat_fsword_scl,
        flat_g_scale = flat_fsword_g_scl,
        slim_scale = slim_fsword_scl,
        slim_g_scale = slim_fsword_g_scl,
    })
    -- ------------------
    -- Force Greatsword Blades
    -- ------------------
    local flat_2h_fsword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_2h_fsword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_2h_fsword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_2h_fsword_g_scl = vector3_box(0.5, 0.65, 1.0)
    slim_blade_variant_helper(5, nil, "2h_fsword", _item_melee.."/blades/2h_force_sword_blade_", {
        flat_scale = flat_2h_fsword_scl,
        flat_g_scale = flat_2h_fsword_g_scl,
        slim_scale = slim_2h_fsword_scl,
        slim_g_scale = slim_2h_fsword_g_scl,
    })
    -- Short variants
    local flat_2h_fsword_short_scl = vector3_box(0.35, 1.0, 0.8)
    local slim_2h_fsword_short_scl = vector3_box(0.35, 0.65, 0.8)
    slim_blade_variant_helper(5, nil, "2h_fsword_short", _item_melee.."/blades/2h_force_sword_blade_", {
        flat_scale = flat_2h_fsword_short_scl,
        flat_g_scale = flat_2h_fsword_g_scl,
        slim_scale = slim_2h_fsword_scl,
        slim_g_scale = slim_2h_fsword_short_scl,
    })
    -- ------------------
    -- "Devil's Claw" Blades
    -- ------------------
    local flat_dclaw_scl = vector3_box(0.5, 1.0, 1.0)
    local flat_dclaw_g_scl = vector3_box(0.6, 1.0, 1.0)
    local slim_dclaw_scl = vector3_box(0.5, 0.65, 1.0)
    local slim_dclaw_g_scl = vector3_box(0.6, 0.65, 1.0)
    slim_blade_variant_helper(7, nil, "dclaw", _item_melee.."/blades/combat_sword_blade_", {
        flat_scale = flat_dclaw_scl,
        flat_g_scale = flat_dclaw_g_scl,
        slim_scale = slim_dclaw_scl,
        slim_g_scale = slim_dclaw_g_scl,
    })
    -- ------------------
    -- Heavy Sword
    -- ------------------
    local flat_hsword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_hsword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_hsword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_hsword_g_scl = vector3_box(0.5, 0.65, 1.0)
    slim_blade_variant_helper(6, nil, "hsword", _item_melee.."/blades/falchion_blade_", {
        flat_scale = flat_hsword_scl,
        flat_g_scale = flat_hsword_g_scl,
        slim_scale = slim_hsword_scl,
        slim_g_scale = slim_hsword_g_scl,
    })
    --[[
    table.insert(table_to_return.fixes, {
        {
            attachment_slot = current_slot_name,
            requirements = {
                [current_slot_name] = {
                    has = attachment_group_prefix..,
                },
            },
            fix = {
                offset = {
                    -- position = vector3_box(0.0, 0.12, 0.015),
                    position = vector3_box(0.0, 0.12, 0.015),
                    rotation = vector3_box(0, 0.035, 0),
                    scale = vector3_box(1, 1.0, 1),
                },
            },
        }
    })]]
    --table.dump(table_to_return.fixes, "slim fixes", 6)
    return table_to_return

end