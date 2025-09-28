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
local infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_ml01"
local braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_ml01"
local vigilant_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
local infantry_lasgun_receivers = "lasgun_rifle_receiver_01|lasgun_rifle_receiver_02|lasgun_rifle_receiver_03|lasgun_rifle_receiver_ml01"
local helbore_lasgun_receivers = "lasgun_rifle_krieg_receiver_01|lasgun_rifle_krieg_receiver_02|lasgun_krieg_rifle_receiver_03|lasgun_rifle_krieg_receiver_04|lasgun_rifle_krieg_receiver_05|lasgun_krieg_rifle_receiver_06|lasgun_rifle_krieg_receiver_ml01"
local recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_elysian_rifle_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_elysian_rifle_receiver_06|lasgun_elysian_rifle_receiver_07|lasgun_rifle_elysian_receiver_ml01"

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_an_attachment = mod.create_an_attachment

-- ################################
-- Attachment
-- ################################
function mod.owo_suppressor()
    local table_to_return = mod.init_table_to_return("owo_suppressor")

    -- Double Cans
    local suppressor_double_pos_base = vector3_box(0, 0.0, 0.0)
    local suppressor_double_pos_ac = vector3_box(0, 0.0, 0.0)
    local suppressor_double_sca = vector3_box(1.2, 1.8, 1.2)
    local suppressor_double_sca_slim = vector3_box(0.85, 1.8, 0.85)
    local suppressor_double_ac1_rot1 = vector3_box(0, 22, 0)
    local suppressor_double_ac1_rot2 = vector3_box(0, 17, 0)
    create_an_attachment(table_to_return, "owo_suppressor_01",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_01",
            --replacement_path = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = suppressor_double_pos_base,
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_double_pos_ac,
                            rotation = vector3_box(0, 0, 0),
                            scale = suppressor_double_sca,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_double_pos_ac,
                            rotation = suppressor_double_ac1_rot1,
                            scale = suppressor_double_sca,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_02",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_02",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = suppressor_double_pos_base,
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_double_pos_ac,
                            rotation = vector3_box(0, 0, 0),
                            scale = suppressor_double_sca,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_double_pos_ac,
                            rotation = suppressor_double_ac1_rot2,
                            scale = suppressor_double_sca,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_01_slim",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_01_slim",
            --replacement_path = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = suppressor_double_pos_base,
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_double_pos_ac,
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = suppressor_double_sca_slim,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_double_pos_ac,
                            rotation = suppressor_double_ac1_rot1,
                            scale = suppressor_double_sca_slim,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_02_slim",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_02_slim",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = suppressor_double_pos_base,
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_double_pos_ac,
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = suppressor_double_sca_slim,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_double_pos_ac,
                            rotation = suppressor_double_ac1_rot2,
                            scale = suppressor_double_sca_slim,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    -- PBS-1
    local suppressor_pbs1_ac1_pos = vector3_box(0, 0.055, 0)
    local suppressor_pbs1_ac1_rot = vector3_box(-90, 0, 0)
    local suppressor_pbs1_ac1_sca = vector3_box(1.3, 1.3, 1.11)
    local suppressor_pbs1_ac1_sca_slim = vector3_box(0.95, 0.95, 1.11)
    local suppressor_pbs1_ac2_pos = vector3_box(0, 0.265, 0)
    local suppressor_pbs1_ac2_rot = vector3_box(0, 0, 180)
    local suppressor_pbs1_ac2_sca = vector3_box(0.36, 0.4, 0.36)
    local suppressor_pbs1_ac2_sca_slim = vector3_box(0.255, 0.4, 0.24)
    create_an_attachment(table_to_return, "owo_suppressor_03",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_03",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = vector3_box(0, 0, 0.0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_melee.."/pommels/axe_pommel_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_pbs1_ac1_pos,
                            rotation = suppressor_pbs1_ac1_rot,
                            scale = suppressor_pbs1_ac1_sca,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/barrels/rippergun_rifle_barrel_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_pbs1_ac2_pos,
                            rotation = suppressor_pbs1_ac2_rot,
                            scale = suppressor_pbs1_ac2_sca,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_03_slim",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_03_slim",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = vector3_box(0, 0, 0.0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_melee.."/pommels/axe_pommel_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_pbs1_ac1_pos,
                            rotation = suppressor_pbs1_ac1_rot,
                            scale = suppressor_pbs1_ac1_sca_slim,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/barrels/rippergun_rifle_barrel_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_pbs1_ac2_pos,
                            rotation = suppressor_pbs1_ac2_rot,
                            scale = suppressor_pbs1_ac2_sca_slim,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    -- Big Metal Suppressor
    local suppressor_metal_ac1_pos = vector3_box(0, 0.13, 0)
    local suppressor_metal_ac1_rot = vector3_box(-90, 0, 0)
    local suppressor_metal_ac1_sca = vector3_box(1.80, 1.80, 1.5)
    local suppressor_metal_ac1_sca_slim = vector3_box(1.1, 1.1, 1.5)
    local suppressor_metal_ac2_pos = vector3_box(0, 0.086, 0)
    local suppressor_metal_ac2_pos2 = vector3_box(0, 0.080, 0)
    local suppressor_metal_ac2_rot = vector3_box(0, 0, 0)
    local suppressor_metal_ac2_sca = vector3_box(1.2, 1.8, 1.2)
    local suppressor_metal_ac2_sca_slim = vector3_box(0.655, 1.8, 0.655)
    create_an_attachment(table_to_return, "owo_suppressor_04",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_04",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = vector3_box(0, 0, 0.0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_melee.."/grips/hatchet_grip_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_metal_ac1_pos,
                            rotation = suppressor_metal_ac1_rot,
                            scale = suppressor_metal_ac1_sca,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_metal_ac2_pos,
                            rotation = suppressor_metal_ac2_rot,
                            scale = suppressor_metal_ac2_sca,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_04_slim",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_04_slim",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = vector3_box(0, 0, 0.0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_melee.."/grips/hatchet_grip_03",
                    fix = {
                        offset = {
                            node = 1,
                            position =  suppressor_metal_ac1_pos,
                            rotation =  suppressor_metal_ac1_rot,
                            scale =     suppressor_metal_ac1_sca_slim,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position =  suppressor_metal_ac2_pos,
                            rotation =  suppressor_metal_ac2_rot,
                            scale =     suppressor_metal_ac2_sca_slim,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_05",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_05",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = vector3_box(0, 0, 0.0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_melee.."/grips/hatchet_grip_03",
                    fix = {
                        offset = {
                            node = 1,
                            position =  suppressor_metal_ac1_pos,
                            rotation =  suppressor_metal_ac1_rot,
                            scale =     suppressor_metal_ac1_sca,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_muzzle_02",
                    fix = {
                        offset = {
                            node = 1,
                            position =  suppressor_metal_ac2_pos2,
                            rotation =  suppressor_metal_ac2_rot,
                            scale =     suppressor_metal_ac2_sca,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_05_slim",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_05_slim",
            icon_render_unit_rotation_offset = render_unit_rot_profile_left,
            icon_render_camera_position_offset = render_cam_pos_profile_left,
        },
        nil,
        {   item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = true,
                offset = {
                    node = 1,
                    position = vector3_box(0, 0, 0.0),
                    rotation = vector3_box(0, 0, 0),
                    scale = vector3_box(1, 1, 1),
                },
            },
            children = {
                muzzle_ac1 = {
                    item = _item_melee.."/grips/hatchet_grip_03",
                    fix = {
                        offset = {
                            node = 1,
                            position =  suppressor_metal_ac1_pos,
                            rotation =  suppressor_metal_ac1_rot,
                            scale =     suppressor_metal_ac1_sca_slim,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_muzzle_02",
                    fix = {
                        offset = {
                            node = 1,
                            position =  suppressor_metal_ac2_pos2,
                            rotation =  suppressor_metal_ac2_rot,
                            scale =     suppressor_metal_ac2_sca_slim,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )

    return table_to_return

end