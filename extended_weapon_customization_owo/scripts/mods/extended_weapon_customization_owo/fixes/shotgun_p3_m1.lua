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

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################
local shared_fix_tables = mod.shared_fix_tables

local all_infantry_autogun_receivers = mod.all_infantry_autogun_receivers
local all_braced_autogun_receivers = mod.all_braced_autogun_receivers
local all_headhunter_autogun_receivers = mod.all_headhunter_autogun_receivers

local all_owo_sight_reticle_names = mod.all_owo_sight_reticle_names
local all_holographic_sights_names = mod.all_holographic_sights_names

local syn_ma5_extensions = mod.syn_ma5_extensions
local syn_ma5_compact_extensions = mod.syn_ma5_compact_extensions
local syn_ma5_classic_extensions = mod.syn_ma5_classic_extensions
local syn_ma5_compact_classic = mod.syn_ma5_compact_classic
local syn_all_ma5_extensions = mod.syn_all_ma5_extensions
local syn_recon_extensions = mod.syn_recon_extensions
local syn_all_receiver_extensions = mod.syn_all_receiver_extensions

local folded_stock_n_l_pos = vector3_box(-0.015, -0.12, 0.075)
local folded_stock_n_l_rot = vector3_box(0, 0, -174)

local short_arbites_barrels = mod.syn_arbites_shotgun_short_barrels
local combat_shotgun_slightly_shorter_barrels = mod.combat_shotgun_slightly_shorter_barrels
local combat_shotgun_normal_barrels = mod.combat_shotgun_normal_barrels
local combat_shotgun_long_barrels = mod.combat_shotgun_long_barrels
local pump_action_shotgun_normal_barrels = mod.pump_action_shotgun_normal_barrels
local pump_action_shotgun_long_barrels = mod.pump_action_shotgun_long_barrels

--local any_owo_suppressors = mod.all_owo_suppressor_names.muzzle
local owo_tactical_flashlight = mod.all_owo_tactical_flashlight.tactical_light

local custom_fixes = {
    -- Tactical Stocks
    --[[
        {   attachment_slot = "stock",
            requirements = {
                stock = {
                    has = "owo_tactical_stock_skeletal",
                },
            },
            fix = {
                offset = {
                    node = 1,
                    position = vector3_box(0, -0.071, 0.075),
                    scale = vector3_box(1.25, 1.1, 1.25),
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
                    node = 1,
                    position = vector3_box(0, -0.075, 0.065),
                    scale = vector3_box(1.25, 1.25, 1.25),
                },
            },
        },
        {   attachment_slot = "stock",
            requirements = {
                stock = {
                    has = "owo_tactical_stock_folded_n_1",
                },
            },
            fix = {
                offset = {
                    node = 1,
                    position = folded_stock_n_l_pos,
                    rotation = folded_stock_n_l_rot,
                    scale = vector3_box(1.25, 1.25, 1.25),
                },
            },
        },
        {   attachment_slot = "stock",
            requirements = {
                stock = {
                    has = "owo_tactical_stock_folded_n_m",
                },
            },
            fix = {
                offset = {
                    node = 1,
                    position = folded_stock_n_l_pos,
                    rotation = folded_stock_n_l_rot,
                    scale = vector3_box(1.25, 1.25, 1.25),
                },
            },
        },
        {   attachment_slot = "stock",
            requirements = {
                stock = {
                    has = "owo_tactical_stock_folded_n_u",
                },
            },
            fix = {
                offset = {
                    node = 1,
                    position = vector3_box(0, -0.13, 0.065),
                    rotation = vector3_box(174, 0, 0),
                    scale = vector3_box(3.3, 1.7, 1.25),
                },
            },
        },
        ]]
    -- ----------------------
    -- Flashlights
    -- ----------------------
    {   attachment_slot = "flashlight",
        requirements = {
            flashlight = {
                has = owo_tactical_flashlight,
            },
            barrel = {
                has = pump_action_shotgun_normal_barrels.."|"..pump_action_shotgun_long_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.126, 0.0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    -- ----------------------
    -- Muzzles
    -- ----------------------
    -- The barrel does not have ap_muzzle_01 :)
    -- -----------
    -- Suppressors
    -- -----------
    {   attachment_slot = "muzzle",
        requirements = {
            muzzle = {
                has = "query:shotgun_p3_m1,muzzle,extended_weapon_customization_owo",
            },
            barrel = {
                has = pump_action_shotgun_normal_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.762, 0.0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    {   attachment_slot = "muzzle",
        requirements = {
            muzzle = {
                has = "query:shotgun_p3_m1,muzzle,extended_weapon_customization_owo",
            },
            barrel = {
                has = pump_action_shotgun_long_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.804, 0.0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    -- Syn Arbites Barrels
    --[[
    {   attachment_slot = "muzzle",
        requirements = {
            muzzle = {
                has = "query:shotgun_p3_m1,muzzle,extended_weapon_customization_owo",
                -- has = any_owo_suppressors,
            },
            barrel = {
                has = short_arbites_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.41, 0.01),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    ]]
    --  EWC BA Combat Shotgun
    {   attachment_slot = "muzzle",
        requirements = {
            muzzle = {
                has = "query:shotgun_p3_m1,muzzle,extended_weapon_customization_owo",
                -- has = any_owo_suppressors,
            },
            barrel = {
                has = combat_shotgun_normal_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.494, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    {   attachment_slot = "muzzle",
        requirements = {
            muzzle = {
                has = "query:shotgun_p3_m1,muzzle,extended_weapon_customization_owo",
                -- has = any_owo_suppressors,
            },
            barrel = {
                has = combat_shotgun_slightly_shorter_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.464, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    {   attachment_slot = "muzzle",
        requirements = {
            muzzle = {
                has = "query:shotgun_p3_m1,muzzle,extended_weapon_customization_owo",
                -- has = any_owo_suppressors,
            },
            barrel = {
                has = combat_shotgun_long_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.69, 0.0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    -- ----------------------
    -- Bayonets
    -- ----------------------
    {   attachment_slot = "bayonet",
        requirements = {
            bayonet = {
                has = "query:shotgun_p3_m1,bayonet,extended_weapon_customization_owo",
            },
            barrel = {
                has = pump_action_shotgun_normal_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.744, -0.058),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    {   attachment_slot = "bayonet",
        requirements = {
            bayonet = {
                has = "query:shotgun_p3_m1,bayonet,extended_weapon_customization_owo",
            },
            barrel = {
                has = pump_action_shotgun_long_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.764, -0.058),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    -- Syn Arbites Barrels
    --[[
    {   attachment_slot = "bayonet",
        requirements = {
            bayonet = {
                has = "query:shotgun_p3_m1,bayonet,extended_weapon_customization_owo",
            },
            barrel = {
                has = short_arbites_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.41, 0.01),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    ]]
    --  EWC BA Combat Shotgun
    {   attachment_slot = "bayonet",
        requirements = {
            bayonet = {
                has = "query:shotgun_p3_m1,bayonet,extended_weapon_customization_owo",
            },
            barrel = {
                has = combat_shotgun_normal_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.512, -0.038),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    {   attachment_slot = "bayonet",
        requirements = {
            bayonet = {
                has = "query:shotgun_p3_m1,bayonet,extended_weapon_customization_owo",
            },
            barrel = {
                has = combat_shotgun_slightly_shorter_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.476, -0.038),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    {   attachment_slot = "bayonet",
        requirements = {
            bayonet = {
                has = "query:shotgun_p3_m1,bayonet,extended_weapon_customization_owo",
            },
            barrel = {
                has = combat_shotgun_long_barrels,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.706, -0.054),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    -- -----------
    -- Holographic Sights
    -- -----------
    {   attachment_slot = "sight_2",
        requirements = {
            -- sight = {
            --  missing = "sight_01", -- Whatever the default sights are
            --},
            sight_2 = {
                has = all_holographic_sights_names.eotech,
            },
            syn_receiver_extension = {
                missing = "query:shotgun_p3_m1,syn_receiver_extension,extended_weapon_customization_syn_edits",
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, -0.048, 0.022),
            },
        },
    },
    --  Sight Alignment
    {   attachment_slot = "sight_offset",
        requirements = {
            -- sight = {
            --  missing = "sight_01", -- Whatever the default sights are
            --},
            sight_2 = {
                has = all_holographic_sights_names.eotech,
            },
            syn_receiver_extension = {
                missing = "query:shotgun_p3_m1,syn_receiver_extension,extended_weapon_customization_syn_edits",
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0002, 0.0, -0.028),
            },
        },
    },
    --  Reticle Alignment
    {   attachment_slot = "sight_reticle",
        requirements = {
            sight_2 = {
                has = all_holographic_sights_names.eotech,
            },
            sight_reticle = {
                has = all_owo_sight_reticle_names,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, -0.016, 0.01435),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
            },
        },
    },
    --  Compatibility with Syn's Receiver Extensions
    --[[
    {   attachment_slot = "sight_offset",
        requirements = {
            sight = {
                has = all_holographic_sights_names.eotech,
            },
            syn_receiver_extension = {
                has = syn_all_receiver_extensions,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, -0.065),
            },
        },
    },
    --      MA5
    {   attachment_slot = "sight_2",
        requirements = {
            sight_2 = {
                has = all_holographic_sights_names.eotech,
            },
            syn_receiver_extension = {
                has = syn_all_ma5_extensions,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.158, 0.05),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
            },
        },
    },
    --      Recon
    {   attachment_slot = "sight_2",
        requirements = {
            sight_2 = {
                has = all_holographic_sights_names.eotech,
            },
            syn_receiver_extension = {
                has = syn_recon_extensions,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, 0.0, 0.05),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
            },
        },
    },
    ]]
}

local custom_attachments = {
    bayonet = {
        parent_slot = "barrel",
        default_path = _item_empty_trinket,
    },
    muzzle = {
        parent_slot = "barrel",
        default_path = _item_empty_trinket,
        --[[
        fix = {
            offset = {
                --position = vector3_box(0, 0.5, 0),
                position = vector3_box(0, 0, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = "ap_muzzle_01",
            },
        },
        ]]
    },
    barrel_foreskin = {
        parent_slot = "barrel",
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
    sight_2 = {
        parent_slot = "sight",
        default_path = _item_empty_trinket,
    },
    sight_reticle = mod.shared_fix_tables["default_attachment_sight_reticle_for_2"],
}

return {
    fixes = custom_fixes,
    attachment_slots = custom_attachments,
}