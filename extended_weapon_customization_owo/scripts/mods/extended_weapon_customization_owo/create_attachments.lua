local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box
local vector3_one = vector3.one
local vector3_zero = vector3.zero

local pairs = pairs
--local string = string
local table = table
local table_append = table.append
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
-- DESCRIPTION: Use in a function for defining a group of attachments. This is to create the table that will have attachments added to it, before it finally sends back a table of attachments, which will finally be put into the table that gets copied back into the base mod
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
-- PARAMETERS:
--  table_to_add_to: table; the one to add to the attachments table in the base mod
--  internal_name: string; attachment name used internally
--  attachment_data: table; contains data for an attachment
--  fixes_data: table; contains data for any fixes
--  kitbash_data: table; contains data for a kitbash
--  attachment_point: string; attachment point for the given kitbash
-- ######
local function create_an_attachment(table_to_add_to, internal_name, attachment_data, fixes_data, kitbash_data, attachment_point)
    table_to_add_to.attachments[internal_name] = table_clone(attachment_data)
    if fixes_data then
        for _, fix in pairs(fixes_data) do
            table_append(table_to_add_to.fixes, fix)
        end
    end
    if kitbash_data then
        table_to_add_to.kitbashs[attachment_data.replacement_path] = {
            attachments = { [internal_name] = table_clone(kitbash_data) },
            display_name = "loc_"..internal_name,
            description = "loc_description_"..internal_name,
            attach_node = attachment_point,
            dev_name = internal_name,
        }
    end
end

-- ################################
-- Defining Attachment Functions
-- ################################
function mod.owo_suppressor()    
    local table_to_return = init_table_to_return("owo_suppressor")

    -- Double Cans
    local suppressor_generic_scale = vector3_box(1.2, 1.8, 1.2)
    local suppressor_generic_scale_small = vector3_box(0.85, 1.8, 0.85)
    local suppressor_generic_helper1_rotation = vector3_box(0, 22, 0)
    local suppressor_generic_helper2_rotation = vector3_box(0, 17, 0)
    local suppressor_pbs1_helper1_pos = vector3_box(0, 0.055, 0)
    local suppressor_pbs1_helper1_rot = vector3_box(-90, 0, 0)
    local suppressor_pbs1_helper1_scale = vector3_box(1.3, 1.3, 1.11)
    local suppressor_pbs1_helper1_scale_small = vector3_box(0.95, 0.95, 1.11)
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
                            scale = suppressor_generic_scale,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0.0, 0.0),
                            rotation = suppressor_generic_helper1_rotation,
                            scale = suppressor_generic_scale,
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
                            scale = suppressor_generic_scale,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0.0, 0.0),
                            rotation = suppressor_generic_helper2_rotation,
                            scale = suppressor_generic_scale,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    -- PBS-1
    local suppressor_pbs1_helper2_pos = vector3_box(0, 0.265, 0)
    local suppressor_pbs1_helper2_rot = vector3_box(0, 0, 180)
    local suppressor_pbs1_helper2_scale = vector3_box(0.36, 0.4, 0.36)
    local suppressor_pbs1_helper2_scale_small = vector3_box(0.255, 0.4, 0.24)
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
                            position = suppressor_pbs1_helper1_pos,
                            rotation = suppressor_pbs1_helper1_rot,
                            scale = suppressor_pbs1_helper1_scale,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/barrels/rippergun_rifle_barrel_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_pbs1_helper2_pos,
                            rotation = suppressor_pbs1_helper2_rot,
                            scale = suppressor_pbs1_helper2_scale,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )
    -- Big Metal Suppressor
    local suppressor_metal_helper1_pos = vector3_box(0, 0.13, 0)
    local suppressor_metal_helper1_rot = vector3_box(-90, 0, 0)
    local suppressor_metal_helper1_scale = vector3_box(1.80, 1.80, 1.5)
    local suppressor_metal_helper1_scale_small = vector3_box(1.1, 1.1, 1.5)
    local suppressor_metal_helper2_pos = vector3_box(0, 0.086, 0)
    local suppressor_metal_helper2_rot = vector3_box(0, 0, 0)
    local suppressor_metal_helper2_scale = vector3_box(1.2, 1.8, 1.2)
    local suppressor_metal_helper2_scale_small = vector3_box(0.655, 1.8, 0.655)
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
                            position = suppressor_metal_helper1_pos,
                            rotation = suppressor_metal_helper1_rot,
                            scale = suppressor_metal_helper1_scale,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_metal_helper2_pos,
                            rotation = suppressor_metal_helper2_rot,
                            scale = suppressor_metal_helper2_scale,
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
                            position = suppressor_metal_helper1_pos,
                            rotation = suppressor_metal_helper1_rot,
                            scale = suppressor_metal_helper1_scale,
                        },
                    },
                },
                muzzle_ac2 = {
                    item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05",
                    fix = {
                        offset = {
                            node = 1,
                            position = suppressor_metal_helper2_pos,
                            rotation = suppressor_metal_helper2_rot,
                            scale = suppressor_metal_helper2_scale,
                        },
                    },
                },
            },
        },
        "ap_muzzle_01"
    )

    return table_to_return

end