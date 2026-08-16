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
local _item_empty = "content/characters/empty_item/empty_item"

-- ################################
-- Some Variables for Common Attachments
-- ################################
-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment

local apply_two_dimensional_transformation_to_vector = mod.apply_two_dimensional_transformation_to_vector
local localize_single_attachment_with_table = mod.localize_single_attachment_with_table
local return_all_numbers_for_hide = mod.return_all_numbers_for_hide
local for_all_weapon_models = mod.for_all_weapon_models

local localize_attachment_triple_threat = mod.localize_attachment_triple_threat

-- ################################
-- Attachment
-- ################################
function mod.owo_kalashnikov_barrel(given_slot, given_attachment_node)
    local current_slot = given_slot or "barrel"
    local current_attachment_node = given_attachment_node or "ap_barrel_01"

    local attachment_group_name = "owo_kalashnikov_barrel"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names if this is the first time
    local all_these_attachments = nil
    local list_of_names_to_use
    if not mod.all_owo_kalashnikov_barrel_names then
        all_these_attachments = {}
        list_of_names_to_use = all_these_attachments
    else
        list_of_names_to_use = mod.all_owo_kalashnikov_barrel_names
    end

    local function owo_kalashnikov_barrel_helper(name_suffix, number_as_string, fixes, kitbashs, table_to_insert_to)
        local shortname = attachment_group_prefix..name_suffix.."_"..number_as_string
        create_an_attachment(table_to_return, shortname,
            -- Attachment
            {   replacement_path = _item_ranged.."/barrels/"..shortname,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                custom_selection_group = attachment_group_name,
                randomization_requirement = "mod_option_modern_barrel_randomization",
            },
            -- Fixes
            fixes,
            -- Kitbash
            kitbashs,
            -- Attachment Node
            current_attachment_node
        )
        -- Adding name to this group's list
        if all_these_attachments then
            table_to_insert_to[name_suffix] = table_to_insert_to[name_suffix] or {}
            table_insert(table_to_insert_to[name_suffix], shortname)
        end
        
        localize_attachment_triple_threat(attachment_group_name, name_suffix, number_as_string)
    end

    -- Creating helper attachments
    --create_kitbash_full_item(table_to_return, _item_ranged.."/barrels/owo_kalashnikov_barrel_base_to_hide", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/barrel_02/barrel_02", current_attachment_node)
    local owo_kalash_kitbash_item_string_prefix = _item_ranged.."/barrels/owo_kalashnikov_barrel_helper_barrel_"
    
    -- Short: This one is slightly longer than the other shorts
    list_of_names_to_use.type1 = list_of_names_to_use.type1 or {}
    local type1_short_distance = 0.202
    local type1_super_short_distance = 0.134
    for_all_weapon_models(8, {3, 4}, function(number_as_string)
        local owo_kitbash_helper_address = owo_kalash_kitbash_item_string_prefix.."squish_"..number_as_string
        create_kitbash_full_item(table_to_return, owo_kitbash_helper_address, nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/barrel_"..number_as_string.."/barrel_"..number_as_string, current_attachment_node)
        owo_kalashnikov_barrel_helper("short", number_as_string, nil,
        {
            base_unit = "content/weapons/player/ranged/lasgun_rifle_krieg/attachments/barrel_07/barrel_07",
            attachments = {
                owo_barrel_we_actually_see = {
                    item = owo_kitbash_helper_address,
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, -1 * type1_short_distance, 0.0),
                            rotation = vector3_box(0.0, 0, 0.0),
                            scale = vector3_box(1, 0.8, 1),
                        },
                    },
                },
            },
        }, list_of_names_to_use.type1)
        owo_kalashnikov_barrel_helper("super_short", number_as_string, nil, 
        {
            base_unit = "content/weapons/player/ranged/lasgun_rifle_krieg/attachments/barrel_07/barrel_07",
            attachments = {
                owo_barrel_we_actually_see = {
                    item = owo_kitbash_helper_address,
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, -1 * type1_super_short_distance, 0.0),
                            rotation = vector3_box(0.0, 0, 0.0),
                            scale = vector3_box(1, 0.57, 1),
                        },
                    },
                },
            },
        }, list_of_names_to_use.type1)
    end)

    -- Type 2: Long Barrels (3 and 4 but the bag on 4 looks wrong
    list_of_names_to_use.type2 = list_of_names_to_use.type2 or {}
    local type2_short_distance = 0.268
    local type2_super_short_distance = 0.2
    create_kitbash_full_item(table_to_return, owo_kalash_kitbash_item_string_prefix.."squish_03", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/barrel_03/barrel_03", current_attachment_node)
    owo_kalashnikov_barrel_helper("short", "03", nil, 
    {
        base_unit = "content/weapons/player/ranged/lasgun_rifle_krieg/attachments/barrel_07/barrel_07",
        attachments = {
            owo_barrel_we_actually_see = {
                item = _item_ranged.."/barrels/owo_kalashnikov_barrel_helper_barrel_squish_03",
                fix = {
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, -1 * type2_short_distance, 0.0),
                        rotation = vector3_box(0.0, 0, 0.0),
                        scale = vector3_box(1, 0.6, 1),
                    },
                },
            },
            
        },
    }, list_of_names_to_use.type2)
    owo_kalashnikov_barrel_helper("super_short", "03", nil, 
    {
        base_unit = "content/weapons/player/ranged/lasgun_rifle_krieg/attachments/barrel_07/barrel_07",
        attachments = {
            owo_barrel_we_actually_see = {
                item = owo_kalash_kitbash_item_string_prefix.."squish_03",
                fix = {
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, -1 * type2_super_short_distance, 0.0),
                        rotation = vector3_box(0.0, 0, 0.0),
                        scale = vector3_box(1, 0.5, 1),
                    },
                },
            },
            
        },
    }, list_of_names_to_use.type2)

    -- Making list of all attachments global
    if all_these_attachments then
        mod.all_owo_kalashnikov_barrel_names = {}
        mod.all_owo_kalashnikov_barrel_names.type1 = mod.all_owo_kalashnikov_barrel_names.type1 or {}
        mod.all_owo_kalashnikov_barrel_names.type1.short = mod.create_requirements_string_from_names_table(all_these_attachments.type1.short)
        mod.all_owo_kalashnikov_barrel_names.type1.super_short = mod.create_requirements_string_from_names_table(all_these_attachments.type1.super_short)
        mod.all_owo_kalashnikov_barrel_names.type1.all = mod.create_requirements_string_from_names_table(mod.all_owo_kalashnikov_barrel_names.type1)
        mod.all_owo_kalashnikov_barrel_names.type2 = mod.all_owo_kalashnikov_barrel_names.type2 or {}
        mod.all_owo_kalashnikov_barrel_names.type2.short = mod.create_requirements_string_from_names_table(all_these_attachments.type2.short)
        mod.all_owo_kalashnikov_barrel_names.type2.super_short = mod.create_requirements_string_from_names_table(all_these_attachments.type2.super_short)
        mod.all_owo_kalashnikov_barrel_names.type2.all = mod.create_requirements_string_from_names_table(mod.all_owo_kalashnikov_barrel_names.type2)
        mod.all_owo_kalashnikov_barrel_names.all = mod.all_owo_kalashnikov_barrel_names.type1.all.."|"..mod.all_owo_kalashnikov_barrel_names.type2.all
        --table.dump(all_these_attachments, "uwu all these attachments kalashnikov", 15)
        --table.dump(mod.all_owo_kalashnikov_barrel_names, "uwu global var these attachments kalashnikov", 15)
    end

    -- These fixes are used by multiple barrels
    -- Bayonet
    --  Since the real underlying barrel is just a tube, the bayonet is just sitting there
    --  This moves it forwards and down so it'd fit the barrel we actually see
    table_insert(table_to_return.fixes, 
        {
            attachment_slot = "bayonet",
            requirements = {
                barrel = {
                    has = mod.all_owo_kalashnikov_barrel_names.all,
                },
            },
            fix = {
                offset = {
                    position = vector3_box(0.0, 0.085, -0.045),
                },
            },
        }
    )
    -- Barrel
    --  Type 1 (Shorter)
    table_insert(table_to_return.fixes, 
    {
        attachment_slot = "barrel",
        requirements = {
            barrel = {
                has = mod.all_owo_kalashnikov_barrel_names.type1.short,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, type1_short_distance, -0.03),
            },
        },
    })
    table_insert(table_to_return.fixes, 
    {
        attachment_slot = "barrel",
        requirements = {
            barrel = {
                has = mod.all_owo_kalashnikov_barrel_names.type1.super_short,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, type1_super_short_distance, -0.03),
            },
        },
    })
    --  Type 2 (Longer)
    table_insert(table_to_return.fixes, 
    {
        attachment_slot = "barrel",
        requirements = {
            barrel = {
                has = mod.all_owo_kalashnikov_barrel_names.type2.short,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, type2_short_distance, -0.03),
            },
        },
    })
    table_insert(table_to_return.fixes, 
    {
        attachment_slot = "barrel",
        requirements = {
            barrel = {
                has = mod.all_owo_kalashnikov_barrel_names.type2.super_short,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, type2_super_short_distance, -0.03),
            },
        },
    })

    --table.dump(table_to_return.fixes, "uwu fixes from kalashnikov", 15)

    return table_to_return

end
