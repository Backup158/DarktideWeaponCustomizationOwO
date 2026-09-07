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
--local infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_ml01"
--local braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_ml01"
--local vigilant_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
--local infantry_lasgun_receivers = "lasgun_rifle_receiver_01|lasgun_rifle_receiver_02|lasgun_rifle_receiver_03|lasgun_rifle_receiver_ml01"
--local helbore_lasgun_receivers = "lasgun_rifle_krieg_receiver_01|lasgun_rifle_krieg_receiver_02|lasgun_krieg_rifle_receiver_03|lasgun_rifle_krieg_receiver_04|lasgun_rifle_krieg_receiver_05|lasgun_krieg_rifle_receiver_06|lasgun_rifle_krieg_receiver_ml01"
--local recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_elysian_rifle_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_elysian_rifle_receiver_06|lasgun_elysian_rifle_receiver_07|lasgun_rifle_elysian_receiver_ml01"

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment

local localize_attachment_triple_threat = mod.localize_attachment_triple_threat

-- ################################
-- Attachment
-- ################################
function mod.owo_iron_sight(given_attachment_node)
    local current_attachment_node = given_attachment_node or "ap_sight_01"
    local attachment_group_name = "owo_iron_sight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Kitbash helper items
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_iron_sight_ak_ac1", nil, "content/weapons/player/melee/hatchet/attachments/grip_03/grip_03", "ap_sight_01")
    --create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_iron_sight_ak_ac2", nil, "content/weapons/player/melee/hatchet/attachments/grip_03/grip_03", "ap_sight_01")
    --create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_iron_sight_ak_ac3", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/stock_01/stock_01", "ap_sight_01")
    --create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_iron_sight_ak_ac4", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/stock_01/stock_01", "ap_sight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_iron_sight_ak_ac5", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/stock_01/stock_01", "ap_sight_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/sights/owo_iron_sight_ak_ac6", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/stock_02/stock_02", "ap_sight_01")
    

    local ak_irons = attachment_group_prefix.."kalashnikov"
    create_an_attachment(table_to_return, ak_irons,
        -- Attachment
        {   replacement_path = _item_ranged.."/sights/"..ak_irons,
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
            custom_selection_group = "extended_weapon_customization_owo",
            randomization_requirement = "mod_option_iron_sight_randomization",
        },
        -- Fixes
        {
            {
                attachment_slot = "sight_offset",
                requirements = {
                    sight = { has = ak_irons },
                },
                fix = {
                    offset = { position = vector3_box(0.0, -0.01, 0.0105) },
                },
            }
        },
        -- Kitbash
        {   --[[
            item = _item_ranged.."/sights/autogun_rifle_sight_01",
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, 0.245, -0.006),
                    rotation = vector3_box(0.0, 0.0, 0.0),
                    scale = vector3_box(1.0, 1.0, 1.0)
                },
                hide = {
                    mesh = {2,3,4,5,6} -- one of these is the front rail lol
                },
            },
            children = {
                -- Range select
                sight_ac1 = {
                    item = _item_ranged.."/sights/owo_iron_sight_ak_ac1",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(-0.004, -0.06, 0.01),
                            rotation = vector3_box(0.0, 90, 0.0),
                            scale = vector3_box(0.36, 0.36, 0.25),
                        },
                    },
                },
                sight_ac2 = {
                    item = _item_ranged.."/sights/owo_iron_sight_ak_ac1",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.022, -0.06, 0.01),
                            rotation = vector3_box(0.0, 90, 0.0),
                            scale = vector3_box(0.32, 0.32, 0.06),
                        },
                    },
                },
                -- Rear sight (making that v notch)
                sight_ac3 = {
                    item = _item_ranged.."/sights/owo_iron_sight_ak_ac5",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.009, -0.07, 0.021),
                            rotation = vector3_box(90.0, 90.0, 0.0),
                            scale = vector3_box(0.23, 0.047, 0.22),
                        },
                    },
                },
                sight_ac4 = {
                    item = _item_ranged.."/sights/owo_iron_sight_ak_ac5",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(-0.009, -0.07, 0.021),
                            rotation = vector3_box(90.0, -90.0, 0.0),
                            scale = vector3_box(0.23, 0.047, 0.22),
                        },
                    },
                },
                -- rear butt
                sight_ac5 = {
                    item = _item_ranged.."/sights/owo_iron_sight_ak_ac5",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.008, -0.022, 0.003),
                            rotation = vector3_box(-145, 90, 145),
                            scale = vector3_box(0.23, 0.24, 0.25),
                        },
                    },
                },
                -- Dust cover
                sight_ac6 = {
                    item = _item_ranged.."/sights/owo_iron_sight_ak_ac6",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.0, -0.014),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = vector3_box(0.85, 1.42, 0.8),
                        },
                    },
                },
            },
            ]]
            base_unit = _item_empty,
            attachments = {
                owo_base_sight = {
                    item = _item_ranged.."/sights/autogun_rifle_sight_01",
                    fix = {
                        disable_in_ui = false,
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.245, -0.004),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = vector3_box(1.0, 1.0, 1.0)
                        },
                        hide = {
                            mesh = {2,3,4,5,6} -- one of these is the front rail lol
                        },
                    },
                    children = {
                        -- Range select
                        sight_ac1 = {
                            item = _item_ranged.."/sights/owo_iron_sight_ak_ac1",
                            fix = {
                                offset = {
                                    node = 1,
                                    position = vector3_box(-0.004, -0.06, 0.01),
                                    rotation = vector3_box(0.0, 90, 0.0),
                                    scale = vector3_box(0.36, 0.36, 0.25),
                                },
                            },
                        },
                        sight_ac2 = {
                            item = _item_ranged.."/sights/owo_iron_sight_ak_ac1",
                            fix = {
                                offset = {
                                    node = 1,
                                    position = vector3_box(0.022, -0.06, 0.01),
                                    rotation = vector3_box(0.0, 90, 0.0),
                                    scale = vector3_box(0.32, 0.32, 0.06),
                                },
                            },
                        },
                        -- Rear sight (making that v notch)
                        sight_ac3 = {
                            item = _item_ranged.."/sights/owo_iron_sight_ak_ac5",
                            fix = {
                                offset = {
                                    node = 1,
                                    position = vector3_box(0.009, -0.07, 0.021),
                                    rotation = vector3_box(90.0, 90.0, 0.0),
                                    scale = vector3_box(0.23, 0.047, 0.22),
                                },
                            },
                        },
                        sight_ac4 = {
                            item = _item_ranged.."/sights/owo_iron_sight_ak_ac5",
                            fix = {
                                offset = {
                                    node = 1,
                                    position = vector3_box(-0.009, -0.07, 0.021),
                                    rotation = vector3_box(90.0, -90.0, 0.0),
                                    scale = vector3_box(0.23, 0.047, 0.22),
                                },
                            },
                        },
                        -- rear butt
                        sight_ac5 = {
                            item = _item_ranged.."/sights/owo_iron_sight_ak_ac5",
                            fix = {
                                offset = {
                                    node = 1,
                                    position = vector3_box(0.008, -0.022, 0.003),
                                    rotation = vector3_box(-145, 90, 145),
                                    scale = vector3_box(0.23, 0.24, 0.25),
                                },
                            },
                        },
                        -- Dust cover
                        sight_ac6 = {
                            item = _item_ranged.."/sights/owo_iron_sight_ak_ac6",
                            fix = {
                                offset = {
                                    node = 1,
                                    position = vector3_box(0.0, 0.0, -0.014),
                                    rotation = vector3_box(0.0, 0.0, 0.0),
                                    scale = vector3_box(0.85, 1.42, 0.8),
                                },
                            },
                        },
                    }
                },
                
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        current_attachment_node
    )

    return table_to_return

end

function mod.owo_laspistol_iron(given_attachment_node)
    local current_attachment_node = given_attachment_node or "ap_sight_01"

    local attachment_group_name = "owo_iron_sight"
    local attachment_group_prefix = attachment_group_name.."_"
    local table_to_return = mod.init_table_to_return(attachment_group_name)

    -- Logging all names if this is the first time
    local all_these_attachments = nil
    if not mod.all_laspistol_iron_names then
        all_these_attachments = {}
    end

    local function laspistol_helper(name_suffix, fixes, kitbashes, group_name)
        local shortname = attachment_group_prefix..name_suffix
        create_an_attachment(table_to_return, shortname,
            -- Attachment
            {   replacement_path = _item_ranged.."/sights/"..shortname,
                icon_render_unit_rotation_offset = render_unit_rot_profile_left,
                icon_render_camera_position_offset = render_cam_pos_profile_left,
                custom_selection_group = "extended_weapon_customization_owo",
            },
            -- Fixes
            fixes,
            -- Kitbash
            kitbashes,
            -- Attachment Node
            current_attachment_node
        )
        -- Adding name to this group's list
        if all_these_attachments then
            all_these_attachments.all = all_these_attachments.all or {}
            table_insert(all_these_attachments.all, shortname)
        end
        localize_attachment_triple_threat(attachment_group_name, name_suffix, nil)
    end

    local function laspistol_call_helper_and_rail(name_suffix, fixes, kitbashes)
        local group_name = attachment_group_prefix..name_suffix
        laspistol_helper(name_suffix, fixes, kitbashes, group_name)
        laspistol_helper(name_suffix.."_with_rail", fixes, kitbashes, group_name)
        if all_these_attachments then
            all_these_attachments.rail = all_these_attachments.rail or {}
            table_insert(all_these_attachments.rail, attachment_group_prefix..name_suffix.."_with_rail")
        end

        laspistol_helper(name_suffix.."_jank", fixes, kitbashes, group_name)
        laspistol_helper(name_suffix.."_jank_with_rail", fixes, kitbashes, group_name)
        if all_these_attachments then
            all_these_attachments.jank = all_these_attachments.jank or {}
            table_insert(all_these_attachments.jank, attachment_group_prefix..name_suffix.."_jank")
            table_insert(all_these_attachments.jank, attachment_group_prefix..name_suffix.."_jank_with_rail")
            all_these_attachments.rail = all_these_attachments.rail or {}
            table_insert(all_these_attachments.rail, attachment_group_prefix..name_suffix.."_jank_with_rail")
        end
    end

    -- create_kitbash_full_item(table_to_return, attachment_group_prefix.."_vesa_laspistol_night", nil, "content/weapons/player/ranged/plasma_rifle/attachments/barrel_01/barrel_01", "ap_sight_01")
    create_kitbash_full_item(table_to_return, attachment_group_prefix.."_vesa_laspistol_night_arc", nil, "content/weapons/player/ranged/arc_rifle/attachments/underbarrel_01/underbarrel_01", "ap_sight_01")

    laspistol_call_helper_and_rail("laspistol_iron", nil, {   
        base_unit = _item_empty, -- invisible base
    })
    laspistol_call_helper_and_rail("laspistol_iron_night", nil, {   
        base_unit = _item_empty, -- invisible base
        attachments = {
            --[[
            owo_sight_ac1 = {
                item = attachment_group_prefix.."_vesa_laspistol_night",
                fix = {
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.167, -0.014),
                        rotation = vector3_box(90.0, 0.0, -180.0),
                        scale = vector3_box(0.04, 0.03, 0.03),
                    },
                },
            },
            ]]
            owo_sight_ac1 = {
                item = attachment_group_prefix.."_vesa_laspistol_night_arc",
                fix = {
                    offset = {
                        node = 1,
                        position = vector3_box(0.0, 0.166, -0.027),
                        rotation = vector3_box(90.0, 0.0, 0.0),
                        scale = vector3_box(0.045, 0.03, 0.03),
                    },
                },
            },
        },
    })

    -- Making list of all attachments global
    if all_these_attachments then
        mod.shallow_create_all_requirements_string_in_table(all_these_attachments)
        mod.all_laspistol_iron_names = all_these_attachments
    end

    -- This is the point to insert fixes that apply to all the parts
    --  Adding rail to railed ones
    table_insert(table_to_return.fixes, {
        attachment_slot = "rail",
        requirements = {
            sight = {
                has = mod.all_laspistol_iron_names.rail,
            },
            rail = {
                missing = "lasgun_pistol_rail_01",
            },
        },
        fix = {
            attach = {
                rail = "lasgun_pistol_rail_01",
            },
        },
    })
    -- Removing rails for unravished
    table_insert(table_to_return.fixes, {
        attachment_slot = "rail",
        requirements = {
            sight = {
                has = mod.all_laspistol_iron_names.all,
                missing = mod.all_laspistol_iron_names.rail,
            },
            rail = {
                missing = "owo_invisible_lasgun_pistol_rail_empty",
            },
        },
        fix = {
            attach = {
                rail = "owo_invisible_lasgun_pistol_rail_empty",
            },
        },
    })

    return table_to_return

end