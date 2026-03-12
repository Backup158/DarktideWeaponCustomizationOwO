local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local create_requirements_string_from_names_table = mod.create_requirements_string_from_names_table

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

-- ################################
-- Attachment Names for Fixes
-- ################################
local combined_sight_reticle_names = mod.combined_sight_reticle_names
local all_holographic_sights_names = mod.all_holographic_sights_names
local syn_ma5_extensions = mod.syn_ma5_extensions
local syn_ma5_compact_extensions = mod.syn_ma5_compact_extensions
local syn_ma5_classic_extensions = mod.syn_ma5_classic_extensions
local syn_ma5_compact_classic = mod.syn_ma5_compact_classic
local syn_all_ma5_extensions = mod.syn_all_ma5_extensions
local syn_recon_extensions = mod.syn_recon_extensions

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################
local these_fixes = {
    -- ----------------------
    -- Stocks
    -- ----------------------
    -- Tactical Stocks
    {   attachment_slot = "stock",
        requirements = {
            stock = {
                has = "owo_tactical_stock_skeletal",
            },
        },
        fix = {
            offset = {
                -- position = vector3_box(0.0, 0.0, 0.01),
                position = vector3_box(0.0, 0.2, 0.02),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1.95, 1),
            },
        },
    },
    {   attachment_slot = "stock",
        requirements = {
            stock = {
                has = "owo_tactical_stock_telescoping_in",
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
    },
    -- ----------------------
    -- Sights
    -- ----------------------
    -- Rails
    --  Removes rail for AK Irons
    {   attachment_slot = "rail",
        requirements = {
            sight = {
                has = "owo_iron_sight_kalashnikov",
            },
        },
        fix = {
            attach = {
                rail = _item_empty_trinket,
            },
        },
    },
    --  Attaches rail for Holosight and telescopic
    {   attachment_slot = "rail",
        requirements = {
            sight = {
                has = all_holographic_sights_names.all,
            },
        },
        fix = {
            attach = {
                rail = "lasgun_rifle_rail_01",
            },
            offset = {
                position = vector3_box(0, -.05, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    -- Holographic Sights
    {   attachment_slot = "sight_offset",
        requirements = {
            sight = {
                -- has = "query:autogun_p1_m1,sight,extended_weapon_customization_owo",
                -- has = "owo_holographic_sight_eotech",
                has = all_holographic_sights_names.eotech,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, -0.02),
            },
        },
    },
    --  Compatibility with Syn's Receiver Extensions
    {   attachment_slot = "sight_offset",
        requirements = {
            sight = {
                has = all_holographic_sights_names.eotech,
            },
            syn_receiver_extension = {
                has = syn_all_ma5_extensions.."|"..syn_recon_extensions,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, -0.05),
            },
        },
    },
    --      MA5
    {   attachment_slot = "sight",
        requirements = {
            sight = {
                has = all_holographic_sights_names.eotech,
            },
            syn_receiver_extension = {
                has = syn_all_ma5_extensions,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.158, 0.05),
            },
        },
    },
    --      Recon
    {   attachment_slot = "sight",
        requirements = {
            sight = {
                has = all_holographic_sights_names.eotech,
            },
            syn_receiver_extension = {
                has = syn_recon_extensions,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, 0.05),
            },
        },
    },
    --[[
    {   attachment_slot = "sight_offset",
        requirements = {
            sight_group_indicator = {
                has = "owo_indicator_sight_eotech",
            },
        },
        fix = {
            offset = {
                -- position = vector3_box(0.0, 0.12, 0.015),
                position = vector3_box(0.0, 0.0, -0.02),
                rotation = vector3_box(0, 0.0, 0),
                scale = vector3_box(1, 1.0, 1),
            },
        },
    },
    -- Sight Reticles
    {   attachment_slot = "sight_reticle",
        requirements = {
            sight_group_indicator = {
                has = "owo_indicator_sight_eotech",
            },
            sight_reticle = {
                has = combined_sight_reticle_names,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, 0.01),
                rotation = vector3_box(0, 0.0, 0),
                scale = vector3_box(1, 1.0, 1),
            },
            -- hide = {
            --     mesh = {5,6},
            -- },
        },
    },
    ]]
}

local custom_attachments = {
    sight_reticle = {
        parent_slot = "sight",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0, 0, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    barrel_foreskin = {
        parent_slot = "barrel",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0, -0.3, 0), -- what a shitty way of doing this. but i'm NOT crawling through all the viable nodes
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
}

return {
    fixes = these_fixes,
    attachment_slots = custom_attachments,
}