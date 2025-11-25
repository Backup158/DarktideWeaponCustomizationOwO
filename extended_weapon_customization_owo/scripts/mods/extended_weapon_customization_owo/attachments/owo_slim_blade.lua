local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box
local type = type
local table = table
local table_insert = table.insert
local string = string
local string_regex_sub = string.gsub

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
local create_group_indicator = mod.create_group_indicator

local families_and_damage_types = { 
    ["psword"] = {
        damage_type = "metal_slashing_medium",
        real_name = "powersword_p1_m1",
    }, 
    ["pfalchion"] = {
        damage_type = "metal_slashing_medium",
        real_name = "powersword_p2_m1",
    }, 
    ["2h_psword"] = {
        damage_type = "metal_slashing_heavy",
        real_name = "powersword_2h_p1_m1",
    }, 
    ["2h_psword_short"] = {
        damage_type = "metal_slashing_heavy",
        real_name = "powersword_2h_p1_m1",
    }, 
    ["fsword"] = {
        damage_type = "metal_slashing_light",
        real_name = "forcesword_p1_m1",
    }, 
    ["2h_fsword"] = {
        damage_type = "metal_slashing_light",
        real_name = "forcesword_2h_p1_m1",
    }, 
    ["2h_fsword_short"] = {
        damage_type = "metal_slashing_light",
        real_name = "forcesword_2h_p1_m1",
    }, 
    ["dclaw"] = {
        damage_type = "metal_slashing_light",
        real_name = "combatsword_p1_m1",
    }, 
    ["hsword"] = {
        damage_type = "metal_slashing_light",
        real_name = "combatsword_p2_m1",
    },  
}

-- ################################
-- Attachment
-- ################################
function mod.owo_slim_blade_indicator(given_slot_name)
    local current_slot_name = given_slot_name or "blade"
    local current_attachment_node = "ap_blade_01"

    local attachment_group_name = "owo_slim_blade"
    local attachment_indicator_name = attachment_group_name.."_indicator"
    local table_to_return = mod.init_table_to_return(attachment_indicator_name)

    for i, _ in pairs(families_and_damage_types) do
        local indicator_address = _item_melee.."/blades/owo_indicator_blade_slim_blade_"..i
        --create_group_indicator(table_to_return, indicator_address, current_attachment_node, current_slot_name)
        create_an_attachment(table_to_return, indicator_address,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..indicator_address,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                damage_type = damage_type,
                custom_selection_group = selection_group,
            },
            -- Fixes
            nil,
            -- Kitbash
            {   --base_unit = indicator_address,
                base_unit = "content/characters/empty_item/empty_item",
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )
    end

    return table_to_return
end

function mod.owo_slim_blade(given_slot_name, given_attachment_node)
    local current_slot_name = given_slot_name or "blade"
    -- local current_attachment_node = given_attachment_node or "ap_blade_01"
    -- everything uses blade, even when the slot is body
    local current_attachment_node = "ap_blade_01"

    local attachment_group_name = "owo_slim_blade"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    local grip_scale = vector3_box(0.5, 1.0, 1.0)

    -- Logging all names
    local all_attachment_names = nil
    if not mod.all_slim_blade_names then
        all_attachment_names = {}
    end

    local function slim_blade_attach_helper(attachment_data, scales_table)
        local number_string = attachment_data.number_string
        local name_to_use = attachment_data.name_to_use
        local base_item_address = attachment_data.base_item_address
        local damage_type = attachment_data.damage_type

        local slim_blade_name = attachment_group_prefix..name_to_use.."_"..number_string
        local fixes_to_add = {}

        -- Adding Fixes     
        --      Blade sizes
        local blade_pos
        local blade_rot
        local blade_scl
        -- safety for if i fuck up calling it
        if scales_table then
            if (type(scales_table) == "table") then
                blade_pos = scales_table.pos
                blade_rot = scales_table.rot
                blade_scl = scales_table.scl
            else
                blade_scl = scales_table -- in case i get lazy and don't make it a table
            end
        end
        table_insert(fixes_to_add, {   
            attachment_slot = current_slot_name,
            requirements = {
                [current_slot_name] = {
                    has = slim_blade_name,
                },
            },
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = blade_pos or vector3_box(0.0, 0.0, 0.0),
                    rotation = blade_rot or vector3_box(0.0, 0.0, 0.0),
                    scale = blade_scl or vector3_box(0.5,1,1),
                },
            },
        })

        --      Grip resizing
        if scales_table and type(scales_table) == "table" and scales_table.grip_scl then
            -- this is going to be so ass to look at :wilted_rose:
            table_insert(fixes_to_add, 
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
                            scale = scales_table.grip_scl
                        },
                    },
                }
            )
        end

        local selection_group = attachment_group_name.."_"..name_to_use
        create_an_attachment(table_to_return, slim_blade_name,
            -- Attachment
            {   replacement_path = _item_melee.."/blades/"..slim_blade_name,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                damage_type = damage_type,
                custom_selection_group = selection_group,
            },
            -- Fixes
            fixes_to_add,
            -- Kitbash
            {   base_unit = string_regex_sub(base_item_address, "01", number_string),
                --[
                --base_unit = "content/characters/empty_item/empty_item",
                attachments = {
                    zzz_shared_material_overrides = {
                        item = "",
                        children = {},
                    },
                    base = {
                        --item = string_regex_sub(base_item_address, "01", number_string),
                        item = "content/characters/empty_item/empty_item",
                        children = {
                            blade_indicator = {
                                item = _item_melee.."/blades/owo_indicator_blade_slim_blade_"..name_to_use,
                            }
                        }
                    }
                }
                --]]
            },
            -- ATTACHMENT NODE 
            -- DON'T FORGET THIS
            current_attachment_node
        )

        if all_attachment_names then
            if not all_attachment_names[selection_group] then
                all_attachment_names[selection_group] = {}
            end
            table_insert(all_attachment_names[selection_group], name_to_use)
        end
    end
    -- Calls the above for all the variants
    local function slim_blade_variant_helper(amount_of_models, table_of_models_to_skip, base_name, model_base_path, table_of_all_transformations)
        local calculated_damage_type = ("owo_"..families_and_damage_types[base_name].damage_type.."_"..families_and_damage_types[base_name].real_name) or "metal_slashing_medium"
        
        -- Flat
        for_all_weapon_models(amount_of_models, table_of_models_to_skip, function(number_string)
            slim_blade_attach_helper({
                number_string = number_string, 
                name_to_use = "flat_"..base_name, 
                base_item_address = model_base_path,
                damage_type = calculated_damage_type,
            }, {
                pos = table_of_all_transformations.pos,
                scl = table_of_all_transformations.flat_scale,
            })
        end)
        -- Flat (Grip)
        for_all_weapon_models(amount_of_models, table_of_models_to_skip, function(number_string)
            slim_blade_attach_helper({
                number_string = number_string, 
                name_to_use = "flat_"..base_name.."_g", 
                base_item_address = model_base_path,
                damage_type = calculated_damage_type,
            }, {
                pos = table_of_all_transformations.pos,
                scl = table_of_all_transformations.flat_g_scale, 
                grip_scl = grip_scale
            })
        end)
        -- Slim
        for_all_weapon_models(amount_of_models, table_of_models_to_skip, function(number_string)
            slim_blade_attach_helper({
                number_string = number_string, 
                name_to_use = "slim_"..base_name, 
                base_item_address = model_base_path,
                damage_type = calculated_damage_type,
            }, {
                pos = table_of_all_transformations.pos,
                scl = table_of_all_transformations.slim_scale,
            })
        end)
        -- Slim (Grip)
        for_all_weapon_models(amount_of_models, table_of_models_to_skip, function(number_string)
            slim_blade_attach_helper({
                number_string = number_string, 
                name_to_use = "slim_"..base_name.."_g", 
                base_item_address = model_base_path,
                damage_type = calculated_damage_type,
            }, {
                pos = table_of_all_transformations.pos,
                scl = table_of_all_transformations.slim_g_scale, 
                grip_scl = grip_scale,
            })
        end)
    end
    -- ------------------
    -- Power Sword Blades
    -- ------------------
    local flat_psword_scl = vector3_box(0.35, 1.0, 1.0)
    local flat_psword_g_scl = vector3_box(0.5, 1.0, 1.0)
    local slim_psword_scl = vector3_box(0.35, 0.65, 1.0)
    local slim_psword_g_scl = vector3_box(0.5, 0.65, 1.0)
    slim_blade_variant_helper(7, {4}, "psword", "content/weapons/player/melee/power_sword/attachments/blade_01/blade_01", {
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
    slim_blade_variant_helper(2, nil, "pfalchion", "content/weapons/player/melee/power_falchion/attachments/blade_01/blade_01", {
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
    slim_blade_variant_helper(3, nil, "2h_psword", "content/weapons/player/melee/2h_power_sword/attachments/blade_01/blade_01", {
        --pos = vector3_box(0, 0.0, 0.065),
        flat_scale = flat_2h_psword_scl,
        flat_g_scale = flat_2h_psword_g_scl,
        slim_scale = slim_2h_psword_scl,
        slim_g_scale = slim_2h_psword_g_scl,
    })
    -- Short variants
    local flat_2h_psword_short_scl = vector3_box(0.35, 1.0, 0.75)
    local slim_2h_psword_short_scl = vector3_box(0.35, 0.65, 0.75)
    slim_blade_variant_helper(3, nil, "2h_psword_short", "content/weapons/player/melee/2h_power_sword/attachments/blade_01/blade_01", {
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
    slim_blade_variant_helper(5, nil, "fsword", "content/weapons/player/melee/force_sword/attachments/blade_01/blade_01", {
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
    slim_blade_variant_helper(5, nil, "2h_fsword", "content/weapons/player/melee/2h_force_sword/attachments/blade_01/blade_01", {
        flat_scale = flat_2h_fsword_scl,
        flat_g_scale = flat_2h_fsword_g_scl,
        slim_scale = slim_2h_fsword_scl,
        slim_g_scale = slim_2h_fsword_g_scl,
    })
    -- Short variants
    local flat_2h_fsword_short_scl = vector3_box(0.35, 1.0, 0.8)
    local slim_2h_fsword_short_scl = vector3_box(0.35, 0.65, 0.8)
    slim_blade_variant_helper(5, nil, "2h_fsword_short", "content/weapons/player/melee/2h_force_sword/attachments/blade_01/blade_01", {
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
    slim_blade_variant_helper(7, nil, "dclaw", "content/weapons/player/melee/combat_sword/attachments/blade_01/blade_01", {
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
    slim_blade_variant_helper(6, nil, "hsword", "content/weapons/player/melee/falchion/attachments/blade_01/blade_01", {
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
    table.dump(table_to_return, "slim blades ALLLL", 6)
    return table_to_return

end