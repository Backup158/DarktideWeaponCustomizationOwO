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
local infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_ml01"
local braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_ml01"
local vigilant_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
local infantry_lasgun_receivers = "lasgun_rifle_receiver_01|lasgun_rifle_receiver_02|lasgun_rifle_receiver_03|lasgun_rifle_receiver_ml01"
local helbore_lasgun_receivers = "lasgun_rifle_krieg_receiver_01|lasgun_rifle_krieg_receiver_02|lasgun_krieg_rifle_receiver_03|lasgun_rifle_krieg_receiver_04|lasgun_rifle_krieg_receiver_05|lasgun_krieg_rifle_receiver_06|lasgun_rifle_krieg_receiver_ml01"
local recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_elysian_rifle_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_elysian_rifle_receiver_06|lasgun_elysian_rifle_receiver_07|lasgun_rifle_elysian_receiver_ml01"

-- Camera Angles for Preview
local render_unit_rot_profile_left = mod.render_unit_rot_profile_left
local render_cam_pos_profile_left = mod.render_cam_pos_profile_left

local create_kitbash_full_item = mod.create_kitbash_full_item
local create_an_attachment = mod.create_an_attachment

-- ################################
-- Attachment
-- ################################
function mod.owo_suppressor()
    local table_to_return = mod.init_table_to_return("owo_suppressor")

    local function create_suppressor(name, model_table, transformations_table, custom_selection)
        local model_to_use = nil
        if type(model_table) == "table" then
            if not model_table.ac1 then
                mod:error("no ac1 for "..name)
            end
            if not model_table.ac2 then
                mod:error("no ac2 for "..name)
            end
        else
            model_to_use = model_table
        end

        create_an_attachment(table_to_return, name,
            {   replacement_path = _item_ranged.."/muzzles/"..name,
                icon_render_unit_rotation_offset = transformations_table.icon_rot,
                icon_render_camera_position_offset = transformations_table.icon_pos,
                custom_selection_group = custom_selection or "owo_suppressor",
            },
            nil,
            {   item = model_table.base or _item_empty_trinket, -- invisible base
                fix = {
                    disable_in_ui = false,
                    offset = {
                        node = 1,
                        position = transformations_table.pos or vector3_box(0, 0, 0),
                        rotation = vector3_box(0, 0, 0),
                        scale = vector3_box(1, 1, 1),
                    },
                    --[[
                    hide = {
                        -- NOT: 1 (crash)
                        -- NOT: 2 (doesn't change anything)
                        mesh = {2},
                    },]]
                },
                children = {
                    muzzle_ac1 = {
                        item = model_to_use or model_table.ac1,
                        fix = {
                            offset = {
                                node = 1,
                                position = transformations_table.ac_pos or transformations_table.ac1_pos or vector3_box(0, 0, 0),
                                rotation = transformations_table.ac_rot or transformations_table.ac1_rot or vector3_box(0, 0, 0),
                                scale = transformations_table.ac_sca or transformations_table.ac1_sca or vector3_box(1, 1, 1),
                            },
                        },
                    },
                    muzzle_ac2 = {
                        item = model_to_use or model_table.ac2,
                        fix = {
                            offset = {
                                node = 1,
                                position = transformations_table.ac_pos or transformations_table.ac2_pos or vector3_box(0, 0, 0),
                                rotation = transformations_table.ac_rot or transformations_table.ac2_rot or vector3_box(0, 0, 0),
                                scale = transformations_table.ac_sca or transformations_table.ac2_sca or vector3_box(1, 1, 1),
                            },
                        },
                    },
                },
            },
            "ap_muzzle_01"
        )
    end
    local function create_suppressor_and_slim(name, model_table, transformations_table)
        local table_to_send = {
            icon_rot = render_unit_rot_profile_left,
            icon_pos = render_cam_pos_profile_left,
            pos = transformations_table.pos,
            ac_pos = transformations_table.ac_pos,
            ac1_pos = transformations_table.ac1_pos,
            ac2_pos = transformations_table.ac2_pos,
            ac_rot = transformations_table.ac_rot,
            ac1_rot = transformations_table.ac1_rot,
            ac2_rot = transformations_table.ac2_rot,
            ac_sca = transformations_table.ac_sca,
            ac1_sca = transformations_table.ac1_sca,
            ac2_sca = transformations_table.ac2_sca,
        }
        create_suppressor(name, model_table, table_to_send)

        -- destructively changes table, since we won't be needing it again
        table_to_send.ac_sca = transformations_table.ac_sca_slim
        table_to_send.ac1_sca = transformations_table.ac1_sca_slim
        table_to_send.ac2_sca = transformations_table.ac2_sca_slim
        create_suppressor(name.."_slim", model_table, table_to_send, "owo_suppressor_slim")
    end

    -- --------------------------------
    -- Creating helpers as full items
    -- --------------------------------
    -- double cans
    create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/supp_ac_ak_muzzle_03", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/muzzle_03/muzzle_03", "ap_muzzle_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/supp_ac_ak_muzzle_05", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/muzzle_05/muzzle_05", "ap_muzzle_01")
    -- pbs
    create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/pbs_ac1", nil, "content/weapons/player/melee/axe/attachments/pommel_03/pommel_03", "ap_muzzle_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/pbs_ac2", nil, "content/weapons/player/ranged/rippergun_rifle/attachments/barrel_03/barrel_03", "ap_muzzle_01")
    -- metal
    create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/supp_ac_hatchet_grip_03", nil, "content/weapons/player/melee/hatchet/attachments/grip_03/grip_03", "ap_muzzle_01")
    --create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/pbs_ac2", nil, "content/weapons/player/ranged/rippergun_rifle/attachments/barrel_03/barrel_03", "ap_muzzle_01")
    create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/supp_ac_ak_muzzle_02", nil, "content/weapons/player/ranged/autogun_rifle_ak/attachments/muzzle_02/muzzle_02", "ap_muzzle_01")
    -- chrome
    create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/chigurh_ac1", nil, "content/weapons/player/ranged/rippergun_rifle/attachments/barrel_01/barrel_01", "ap_muzzle_01")
    -- jungle
    create_kitbash_full_item(table_to_return, _item_ranged.."/muzzles/jungle_ac1", nil, "content/weapons/player/melee/combat_blade/attachments/handle_08/handle_08", "ap_muzzle_01")

    -- --------------------------------
    -- Full attachment
    -- --------------------------------
    -- Double Cans
    local suppressor_double_pos_base = vector3_box(0, 0.0, 0.0)
    local suppressor_double_pos_ac = vector3_box(0, 0.0, 0.0)
    local suppressor_double_sca = vector3_box(1.2, 1.8, 1.2)
    local suppressor_double_sca_slim = vector3_box(0.85, 1.8, 0.85)
    local suppressor_double_ac2_rot1 = vector3_box(0, 22, 0)
    local suppressor_double_ac2_rot2 = vector3_box(0, 17, 0)
    create_suppressor_and_slim("owo_suppressor_01", _item_ranged.."/muzzles/supp_ac_ak_muzzle_03", {
        icon_rot = render_unit_rot_profile_left,
        icon_pos = render_cam_pos_profile_left,
        pos = suppressor_double_pos_base,
        ac_pos = suppressor_double_pos_ac,
        ac2_rot = suppressor_double_ac2_rot1,
        ac_sca = suppressor_double_sca,
        ac_sca_slim = suppressor_double_sca_slim,
    })
    create_suppressor_and_slim("owo_suppressor_02", _item_ranged.."/muzzles/supp_ac_ak_muzzle_05", {
        icon_rot = render_unit_rot_profile_left,
        icon_pos = render_cam_pos_profile_left,
        pos = suppressor_double_pos_base,
        ac_pos = suppressor_double_pos_ac,
        ac2_rot = suppressor_double_ac2_rot2,
        ac_sca = suppressor_double_sca,
        ac_sca_slim = suppressor_double_sca_slim,
    })

    -- PBS-1
    local suppressor_pbs1_ac1_pos = vector3_box(0, 0.055, 0)
    local suppressor_pbs1_ac1_rot = vector3_box(-90, 0, 0)
    local suppressor_pbs1_ac1_sca = vector3_box(1.3, 1.3, 1.11)
    local suppressor_pbs1_ac1_sca_slim = vector3_box(0.95, 0.95, 1.11)
    local suppressor_pbs1_ac2_pos = vector3_box(0, 0.265, 0)
    local suppressor_pbs1_ac2_rot = vector3_box(0, 0, 180)
    local suppressor_pbs1_ac2_sca = vector3_box(0.36, 0.4, 0.36)
    local suppressor_pbs1_ac2_sca_slim = vector3_box(0.255, 0.4, 0.24)
    create_suppressor_and_slim("owo_suppressor_03", 
        {
            base = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
            ac1 = _item_ranged.."/muzzles/pbs_ac1",
            ac2 = _item_ranged.."/muzzles/pbs_ac2",
        }, 
        {
            icon_rot = render_unit_rot_profile_left,
            icon_pos = render_cam_pos_profile_left,
            ac1_pos = suppressor_pbs1_ac1_pos,
            ac1_rot = suppressor_pbs1_ac1_rot,
            ac1_sca = suppressor_pbs1_ac1_sca,
            ac1_sca_slim = suppressor_pbs1_ac1_sca_slim,
            ac2_pos = suppressor_pbs1_ac2_pos,
            ac2_rot = suppressor_pbs1_ac2_rot,
            ac2_sca = suppressor_pbs1_ac2_sca,
            ac2_sca_slim = suppressor_pbs1_ac2_sca_slim,
        }
    )
    -- Big Metal Suppressor
    local suppressor_metal_ac1_pos = vector3_box(0, 0.13, 0)
    local suppressor_metal_ac1_rot = vector3_box(-90, 0, 0)
    local suppressor_metal_ac1_sca = vector3_box(1.80, 1.80, 1.5)
    local suppressor_metal_ac1_sca_slim = vector3_box(1.1, 1.1, 1.5)
    local suppressor_metal_ac2_pos = vector3_box(0, 0.086, 0)
    local suppressor_metal_ac2_pos2 = vector3_box(0, 0.13, 0)
    local suppressor_metal_ac2_rot = vector3_box(0, 0, 0)
    local suppressor_metal_ac2_sca = vector3_box(1.2, 1.8, 1.2)
    local suppressor_metal_ac2_sca_slim = vector3_box(0.655, 1.8, 0.655)
    create_suppressor_and_slim("owo_suppressor_04", 
        {
            ac1 = _item_ranged.."/muzzles/supp_ac_hatchet_grip_03",
            ac2 = _item_ranged.."/muzzles/supp_ac_ak_muzzle_03",
        }, 
        {
            icon_rot = render_unit_rot_profile_left,
            icon_pos = render_cam_pos_profile_left,
            ac1_pos = suppressor_metal_ac1_pos,
            ac1_rot = suppressor_metal_ac1_rot,
            ac1_sca = suppressor_metal_ac1_sca,
            ac1_sca_slim = suppressor_metal_ac1_sca_slim,
            ac2_pos = suppressor_metal_ac2_pos,
            ac2_rot = suppressor_metal_ac2_rot,
            ac2_sca = suppressor_metal_ac2_sca,
            ac2_sca_slim = suppressor_metal_ac2_sca_slim,
        }
    )
    create_suppressor_and_slim("owo_suppressor_05", 
        {
            ac1 = _item_ranged.."/muzzles/supp_ac_hatchet_grip_03",
            ac2 = _item_ranged.."/muzzles/supp_ac_ak_muzzle_02",
        }, 
        {
            icon_rot = render_unit_rot_profile_left,
            icon_pos = render_cam_pos_profile_left,
            ac1_pos = suppressor_metal_ac1_pos,
            ac1_rot = suppressor_metal_ac1_rot,
            ac1_sca = suppressor_metal_ac1_sca,
            ac1_sca_slim = suppressor_metal_ac1_sca_slim,
            ac2_pos = suppressor_metal_ac2_pos2,
            ac2_rot = suppressor_metal_ac2_rot,
            ac2_sca = suppressor_metal_ac2_sca,
            ac2_sca_slim = suppressor_metal_ac2_sca_slim,
        }
    )
    -- Chrome
    --  reusing some pbs 1 parts
    --[[
    local chrome_ac1_sca = vector3_box(0.35, 0.4, 0.35)
    local chrome_ac2_sca = vector3_box(0.26, 0.4, 0.26)
    create_suppressor_and_slim("owo_suppressor_chrome_01", {
            base = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
            ac1 = _item_ranged.."/muzzles/chigurh_ac1",
            ac2 = _item_ranged.."/muzzles/pbs_ac2",
        }, 
        {
            icon_rot = render_unit_rot_profile_left,
            icon_pos = render_cam_pos_profile_left,
            ac_pos = vector3_box(0, 0.1, 0),
            ac_rot = suppressor_pbs1_ac2_rot,
            ac1_sca = chrome_ac1_sca,
            ac2_sca = chrome_ac2_sca,
            ac1_sca_slim = chrome_ac1_sca_slim,
            ac2_sca_slim = chrome_ac2_sca_slim,
        }
    )
    create_suppressor("owo_suppressor_chrome_chigurh", {
            base = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
            ac1 = _item_ranged.."/muzzles/chigurh_ac1",
            ac2 = _item_ranged.."/muzzles/pbs_ac2",
        }, 
        {
            icon_rot = render_unit_rot_profile_left,
            icon_pos = render_cam_pos_profile_left,
            ac_pos = vector3_box(0, 0.1, 0),
            ac_rot = vector3_box(0, 0, 0),
            ac1_sca = chrome_ac1_sca,
            ac2_sca = chrome_ac2_sca,
            ac1_sca_slim = chrome_ac1_sca_slim,
            ac2_sca_slim = chrome_ac2_sca_slim,
        }
    )
    ]]
    -- Jungle
    -- Reusing Heavy metal
    local suppressor_jungle_ac1_pos = vector3_box(0, 0.144, 0.002)
    local suppressor_jungle_ac1_rot = vector3_box(-90, 0, 0)
    local suppressor_jungle_ac1_sca = vector3_box(0.77, 0.6, 1.1)
    local suppressor_jungle_ac2_pos = vector3_box(0, 0.144, 0)
    --local suppressor_jungle_ac1_sca_slim = vector3_box(1.1, 1.1, 1.1)
    create_suppressor("owo_suppressor_jungle", 
        {
            ac1 = _item_ranged.."/muzzles/jungle_ac1",
            ac2 = _item_ranged.."/muzzles/supp_ac_ak_muzzle_02",
        }, 
        {
            icon_rot = render_unit_rot_profile_left,
            icon_pos = render_cam_pos_profile_left,
            ac1_pos = suppressor_jungle_ac1_pos,
            ac1_rot = suppressor_jungle_ac1_rot,
            ac1_sca = suppressor_jungle_ac1_sca,
            --ac1_sca_slim = suppressor_jungle_ac1_sca_slim,
            ac2_pos = suppressor_jungle_ac2_pos,
            ac2_rot = suppressor_metal_ac2_rot,
            ac2_sca = suppressor_metal_ac2_sca,
            --ac2_sca_slim = suppressor_metal_ac2_sca_slim,
        }
    )
   
    return table_to_return

end