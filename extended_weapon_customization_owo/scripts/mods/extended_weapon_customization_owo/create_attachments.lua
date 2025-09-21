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
local function init_table_to_return(internal_name)
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
local function create_an_attachment(table_to_add_to, internal_name, attachment_data, fixes_data, kitbash_data, attachment_point)
    table_to_add_to.attachments[internal_name] = table_clone(attachment_data)
    if fixes_data then
        for _, fix in pairs(fixes_data) do
            table_insert(table_to_add_to.fixes, fix)
        end
    end
    if kitbash_data then
        -- Allows VFX to play, if it's a muzzle
        --  disable_vfx_spawner_exclusion
        if attachment_point == "ap_muzzle_01" then
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

-- ################################
-- Some Variables for Common Attachments
-- ################################
local infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_ml01"
local braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_ml01"
local vigilant_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
local infantry_lasgun_receivers = "lasgun_rifle_receiver_01|lasgun_rifle_receiver_02|lasgun_rifle_receiver_03|lasgun_rifle_receiver_ml01"
local helbore_lasgun_receivers = "lasgun_rifle_krieg_receiver_01|lasgun_rifle_krieg_receiver_02|lasgun_krieg_rifle_receiver_03|lasgun_rifle_krieg_receiver_04|lasgun_rifle_krieg_receiver_05|lasgun_krieg_rifle_receiver_06|lasgun_rifle_krieg_receiver_ml01"
local recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_elysian_rifle_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_elysian_rifle_receiver_06|lasgun_elysian_rifle_receiver_07|lasgun_rifle_elysian_receiver_ml01"

-- ################################
-- Defining Attachment Functions
-- ################################
function mod.owo_suppressor()
    local table_to_return = init_table_to_return("owo_suppressor")

    -- Double Cans
    local suppressor_generic_sca = vector3_box(1.2, 1.8, 1.2)
    local suppressor_generic_sca_slim = vector3_box(0.85, 1.8, 0.85)
    local suppressor_generic_ac1_rot1 = vector3_box(0, 22, 0)
    local suppressor_generic_ac1_rot2 = vector3_box(0, 17, 0)
    create_an_attachment(table_to_return, "owo_suppressor_01",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_01",
            --replacement_path = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02",
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0.0, 0.0),
                            rotation = vector3_box(0, 0, 0),
                            scale = suppressor_generic_sca,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0.0, 0.0),
                            rotation = suppressor_generic_ac1_rot1,
                            scale = suppressor_generic_sca,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_02",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_02",
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0.0, 0.0),
                            rotation = vector3_box(0, 0, 0),
                            scale = suppressor_generic_sca,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0.0, 0.0),
                            rotation = suppressor_generic_ac1_rot2,
                            scale = suppressor_generic_sca,
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
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = suppressor_generic_sca_slim,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = suppressor_generic_ac1_rot1,
                            scale = suppressor_generic_sca_slim,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    create_an_attachment(table_to_return, "owo_suppressor_02_slim",
        {   replacement_path = _item_ranged.."/muzzles/owo_suppressor_02_slim",
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0.0, 0.0, 0.0),
                            rotation = vector3_box(0.0, 0.0, 0.0),
                            scale = suppressor_generic_sca_slim,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0.0, 0.0),
                            rotation = suppressor_generic_ac1_rot2,
                            scale = suppressor_generic_sca_slim,
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
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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

function mod.owo_tactical_stock()
    local attachment_group_name = "owo_tactical_stock"
    local attachment_group_prefix = attachment_group_name.."_-_"
    local table_to_return = init_table_to_return(attachment_group_name)

    -- Skeletal Stock
    local skeletal_stock = attachment_group_prefix.."skeletal"
    create_an_attachment(table_to_return, skeletal_stock,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..skeletal_stock,
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
                    offset = {
                        position = vector3_box(0.0, 0.02, 0.1),
                        scale = vector3_box(1, 1.95, 1),
                    },
                },
            },
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
        "ap_stock_01"
    )
    -- Telescoping Stock
    local telescoping_stock = attachment_group_prefix.."telescoping_(Pushed-in)"
    create_an_attachment(table_to_return, telescoping_stock,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..telescoping_stock,
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
        },
        -- Fixes
        {
            -- Infantry Autogun
            
            --{   attachment_slot = "stock",
            --    requirements = {
            --        stock = {
            --            has = telescoping_stock,
            --        },
            --        receiver = {
            --            has = infantry_autogun_receivers,
            --        },
            --    },
            --    fix = {
            --        offset = {
            --            position = vector3_box(0.0, 0.2, 0.024),
            --        },
            --    },
            --},
            -- Infantry Lasgun
            {   attachment_slot = "stock",
                requirements = {
                    stock = {
                        has = telescoping_stock,
                    },
                    receiver = {
                        has = infantry_lasgun_receivers,
                    },
                },
                fix = {
                    offset = {
                        position = vector3_box(0.0, 0.12, 0.012),
                       --position = vector3_box(0.0, 0.0, -0.005),
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
        },
        -- Kitbash
        {   item = _item_ranged.."/stocks/autogun_rifle_ak_stock_05",
            -- item = _item_empty_trinket, -- invisible base
            fix = {
                disable_in_ui = false,
                offset = {
                    node = 1,
                    position = vector3_box(0.0, 0.12, 0.015),
                    rotation = vector3_box(0, 0.035, 0),
                    scale = vector3_box(1, 1.0, 1),
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        "ap_stock_01"
    )
    -- Folded (Natural)
    local folded_stock_n_1 = attachment_group_prefix.."folded_01_(Natural_-_Left)"
    create_an_attachment(table_to_return, folded_stock_n_1,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..folded_stock_n_1,
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
                    position = vector3_box(-0.012, -0.108, 0.064),
                    rotation = vector3_box(0, 0, -176),
                    scale = vector3_box(1, 1.0, 1),
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        "ap_stock_01"
    )
    local folded_stock_n_m = attachment_group_prefix.."folded_M_(Natural_-_Left)"
    create_an_attachment(table_to_return, folded_stock_n_m,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..folded_stock_n_m,
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
                    position = vector3_box(0.0, -0.108, 0.012),
                    rotation = vector3_box(0, 0, -176),
                    scale = vector3_box(1, 1.0, 1),
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        "ap_stock_01"
    )
    local folded_stock_n_u = attachment_group_prefix.."folded_03_(Natural_-_Under)"
    create_an_attachment(table_to_return, folded_stock_n_u,
        -- Attachment
        {   replacement_path = _item_ranged.."/stocks/"..folded_stock_n_u,
            icon_render_unit_rotation_offset = {90, 0, 30},
            icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
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
                    position = vector3_box(0.0, -0.112, 0.0625),
                    rotation = vector3_box(174, 0, 0),
                    scale = vector3_box(2.52, 1.3, 1),
                },
            },
        },
        -- ATTACHMENT NODE 
        -- DON'T FORGET THIS
        "ap_stock_01"
    )

    return table_to_return

end