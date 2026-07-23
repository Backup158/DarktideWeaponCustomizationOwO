local mod = get_mod("extended_weapon_customization_owo")
-- ###################################################################
-- RECON LASGUN
-- ###################################################################

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
-- Attachment Names for Fixes
-- ################################
local all_infantry_autogun_receivers = mod.all_infantry_autogun_receivers
local all_braced_autogun_receivers = mod.all_braced_autogun_receivers
local all_headhunter_autogun_receivers = mod.all_headhunter_autogun_receivers
local all_recon_lasgun_receivers = mod.all_recon_lasgun_receivers

local all_owo_sight_reticle_names = mod.all_owo_sight_reticle_names
local all_holographic_sights_names = mod.all_holographic_sights_names

local syn_ma5_extensions = mod.syn_ma5_extensions
local syn_ma5_compact_extensions = mod.syn_ma5_compact_extensions
local syn_ma5_classic_extensions = mod.syn_ma5_classic_extensions
local syn_ma5_compact_classic = mod.syn_ma5_compact_classic
local syn_all_ma5_extensions = mod.syn_all_ma5_extensions
local syn_recon_extensions = mod.syn_recon_extensions
local syn_all_receiver_extensions = mod.syn_all_receiver_extensions
local syn_hellgun_receivers = mod.syn_hellgun_receivers

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################
local these_fixes = {
    -- ----------------------
    -- Stocks
    -- ----------------------
    -- Tactical Stocks
    --  Seems good with default
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
            receiver = {
                missing = "query:lasgun_p3_m1,receiver,extended_weapon_customization_syn_edits",
            },
        },
        fix = {
            attach = {
                rail = "lasgun_rifle_rail_01",
            },
            offset = {
                position = vector3_box(0, 0, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    --  Rail for low syn receivers
    {   attachment_slot = "rail",
        requirements = {
            sight = {
                has = all_holographic_sights_names.all,
            },
            receiver = {
                has = "query:lasgun_p3_m1,receiver,extended_weapon_customization_syn_edits",
            },
            syn_receiver_extension = {
                missing = "query:lasgun_p3_m1,syn_receiver_extension,extended_weapon_customization_syn_edits",
            },
        },
        fix = {
            attach = {
                rail = "lasgun_rifle_rail_01",
            },
            offset = {
                position = vector3_box(0, -0.016, -0.052),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    -- Holographic Sights
    --  Actual Position
    --[[
    {   attachment_slot = "sight",
        requirements = {
            sight = {
                has = all_holographic_sights_names.eotech,
            },
            receiver = {
                -- missing = "query:lasgun_p3_m1,receiver,extended_weapon_customization_syn_edits",
                has = all_recon_lasgun_receivers,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.04, 0),
            },
        },
    },
    ]]
    --  Reticle Positioning
    {   attachment_slot = "sight_reticle",
        requirements = {
            sight = {
                has = all_holographic_sights_names.eotech,
            },
            sight_reticle = {
                has = all_owo_sight_reticle_names,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0, -0.016, 0.01),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
            },
        },
    },
    --  Sight Alignment
    {   attachment_slot = "sight_offset",
        requirements = {
            sight = {
                -- has = "query:autogun_p1_m1,sight,extended_weapon_customization_owo",
                -- has = "owo_holographic_sight_eotech",
                has = all_holographic_sights_names.eotech,
            },
            receiver = {
                -- missing = "query:lasgun_p3_m1,receiver,extended_weapon_customization_syn_edits",
                has = all_recon_lasgun_receivers,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0002, 0.0, -0.036),
            },
        },
    },
    --  Compatibility with Syn's iLas Receivers
    {   attachment_slot = "sight_offset",
        requirements = {
            sight = {
                -- has = "query:autogun_p1_m1,sight,extended_weapon_customization_owo",
                -- has = "owo_holographic_sight_eotech",
                has = all_holographic_sights_names.eotech,
            },
            receiver = {
                -- has = "query:lasgun_p3_m1,receiver,extended_weapon_customization_syn_edits",
                has = syn_hellgun_receivers,
            },
            syn_receiver_extension = {
                -- missing = "query:lasgun_p3_m1,syn_receiver_extension,extended_weapon_customization_syn_edits",
                missing = syn_all_receiver_extensions,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0.0002, 0.0, 0.045),
            },
        },
    },
    --  Sight is only lower if it uses an iLas body WITHOUT an extension
    {   attachment_slot = "sight",
        requirements = {
            sight = {
                -- has = "query:autogun_p1_m1,sight,extended_weapon_customization_owo",
                -- has = "owo_holographic_sight_eotech",
                has = all_holographic_sights_names.eotech,
            },
            receiver = {
                --has = "query:lasgun_p3_m1,receiver,extended_weapon_customization_syn_edits",
                has = syn_hellgun_receivers,
            },
            syn_receiver_extension = {
                -- missing = "query:lasgun_p3_m1,syn_receiver_extension,extended_weapon_customization_syn_edits",
                missing = syn_all_receiver_extensions,
            },
        },
        fix = {
            offset = {
                position = vector3_box(0, 0.0, -0.055),
            },
        },
    },
}

local custom_attachments = {
    sight = {
        parent_slot = "receiver",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0, 0.04, 0),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    },
    sight_reticle = {
        parent_slot = "sight",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0, 0.0, 0),
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