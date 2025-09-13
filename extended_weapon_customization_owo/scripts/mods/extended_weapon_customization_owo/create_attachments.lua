local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box
local vector3_one = vector3.one
local vector3_zero = vector3.zero

local table = table
local table_append = table.append

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
-- PARAM:
--  internal_name: string; name for what attachments these are; "owo_suppressor"
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
-- Create Attachment
-- PARAM:
--  table_to_add_to: table; the one to add to the attachments table in the base mod
--  kitbash_data: table; contains data for a kitbash
--  attachment_name: string; internal name
--  darktide_slot_name: string; slot it goes into
--  is_ranged: bool; if it's for ranged weapons
-- ######

-- ################################
-- Defining Attachment Functions
-- also has a NAME key that gets used for debugging
-- ################################
function mod.owo_suppressor()
    local suppressor_generic_scale = vector3_box(1.2, 1.8, 1.2)
    local suppressor_generic_scale_small = vector3_box(0.85, 1.8, 0.85)
    local suppressor_generic_helper1_rotation = vector3_box(0, 22, 0)
    local suppressor_generic_helper2_rotation = vector3_box(0, 17, 0)
    local suppressor_pbs1_helper1_pos = vector3_box(0, 0.055, 0)
    local suppressor_pbs1_helper1_rot = vector3_box(-90, 0, 0)
    local suppressor_pbs1_helper1_scale = vector3_box(1.3, 1.3, 1.11)
    local suppressor_pbs1_helper1_scale_small = vector3_box(0.95, 0.95, 1.11)
    local suppressor_pbs1_helper2_pos = vector3_box(0, 0.265, 0)
    local suppressor_pbs1_helper2_rot = vector3_box(0, 0, 180)
    local suppressor_pbs1_helper2_scale = vector3_box(0.36, 0.4, 0.36)
    local suppressor_pbs1_helper2_scale_small = vector3_box(0.255, 0.4, 0.24)
    local suppressor_metal_helper1_pos = vector3_box(0, 0.13, 0)
    local suppressor_metal_helper1_rot = vector3_box(-90, 0, 0)
    local suppressor_metal_helper1_scale = vector3_box(1.80, 1.80, 1.5)
    local suppressor_metal_helper1_scale_small = vector3_box(1.1, 1.1, 1.5)
    local suppressor_metal_helper2_pos = vector3_box(0, 0.086, 0)
    local suppressor_metal_helper2_rot = vector3_box(0, 0, 0)
    local suppressor_metal_helper2_scale = vector3_box(1.2, 1.8, 1.2)
    local suppressor_metal_helper2_scale_small = vector3_box(0.655, 1.8, 0.655)
    
    local table_to_return = init_table_to_return("owo_suppressor")


    return table_to_return
    
    {
        name = "owo_suppressor",
        attachments = {
            owo_suppressor_01 = {
                replacement_path = _item_ranged.."/muzzles/owo_suppressor_01",
                --replacement_path = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
            },
            owo_suppressor_02 = {
                replacement_path = _item_ranged.."/muzzles/owo_suppressor_02",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
            },
            owo_suppressor_03 = {
                replacement_path = _item_ranged.."/muzzles/owo_suppressor_03",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
            },
            owo_suppressor_04 = {
                replacement_path = _item_ranged.."/muzzles/owo_suppressor_04",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
            },
            owo_suppressor_05 = {
                replacement_path = _item_ranged.."/muzzles/owo_suppressor_05",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
            },
        },
        fixes = {

        },
        kitbashs = {
            [_item_ranged.."/muzzles/owo_suppressor_01"] = {
                attachments = {
                    owo_suppressor_01 = {
                        --item = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02",
                        item = _item_empty_trinket, -- invisible base
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
                },
                display_name = "loc_owo_suppressor_01",
                description = "loc_description_owo_suppressor_01",
                attach_node = "ap_muzzle_01",
                dev_name = "owo_suppressor_01",
            },
            [_item_ranged.."/muzzles/owo_suppressor_02"] = {
                attachments = {
                    owo_suppressor_02 = {
                        item = _item_empty_trinket, -- invisible base
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
                },
                display_name = "loc_owo_suppressor_02",
                description = "loc_description_owo_suppressor_02",
                attach_node = "ap_muzzle_01",
                dev_name = "owo_suppressor_02",
            },
            -- PBS-1
            [_item_ranged.."/muzzles/owo_suppressor_03"] = {
                attachments = {
                    owo_suppressor_03 = {
                        item = _item_empty_trinket, -- invisible base
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
                },
                display_name = "loc_owo_suppressor_03",
                description = "loc_description_owo_suppressor_03",
                attach_node = "ap_muzzle_01",
                dev_name = "owo_suppressor_03",
            },
            [_item_ranged.."/muzzles/owo_suppressor_04"] = {
                attachments = {
                    owo_suppressor_04 = {
                        item = _item_empty_trinket, -- invisible base
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
                },
                display_name = "loc_owo_suppressor_04",
                description = "loc_description_owo_suppressor_04",
                attach_node = "ap_muzzle_01",
                dev_name = "owo_suppressor_04",
            },
            [_item_ranged.."/muzzles/owo_suppressor_05"] = {
                attachments = {
                    owo_suppressor_05 = {
                        item = _item_empty_trinket, -- invisible base
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
                },
                display_name = "loc_owo_suppressor_05",
                description = "loc_description_owo_suppressor_05",
                attach_node = "ap_muzzle_01",
                dev_name = "owo_suppressor_05",
            },
        }
    }
end