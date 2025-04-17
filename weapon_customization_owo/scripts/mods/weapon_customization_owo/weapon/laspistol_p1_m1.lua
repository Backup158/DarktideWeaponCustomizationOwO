local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "laspistol_p1_m1" -- Laspistols

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].muzzle_2 = {} -- MT and Syn didn't add this to laspistol yet
mod.wc.attachment[this_variant].receiverac1 = {}
mod.wc.attachment[this_variant].receiverac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_grip_laser(this_variant, "flashlight")
mod.owo_magazine_flat(this_variant)
mod.owo_suppressor(this_variant, "muzzle")
mod.owo_laspistol_grip_mag(this_variant)

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
    -- ######
	-- Sight_2: Alt Viewmodels
	-- ######
    --  Doom
    {   dependencies =      { "owo_alt_viewmodel_01" },
        scope_offset =      { offset = true, position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0), },
    },
    {   dependencies =      { "owo_alt_viewmodel_02" },
        scope_offset =      { offset = true, position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
    },
    {   dependencies =      { "owo_alt_viewmodel_03" },
        scope_offset =      { offset = true, position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
    },
    -- CS:S
    {   dependencies =      { "owo_alt_viewmodel_04" },
        scope_offset =      { offset = true, position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
    },
    -- Hipfire
    {   dependencies =      { "owo_alt_viewmodel_05" },
        scope_offset =      { offset = true, position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
    },
    -- Point Shooting
    {   dependencies =      { "owo_alt_viewmodel_06" },
        scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0), },
        no_scope_offset =   { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0), },
    },

    -- ######
	-- Muzzle: SUPPRESSOR
	-- ######
	{	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
        muzzle = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },
    },
    {	dependencies = {"owo_suppressor_01"},
        muzzle_2 = { offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle_2 = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2 ) }
    },
    {	dependencies = { "owo_suppressor_03"},
        muzzle = { offset = true,   position = vector3_box(0, 0.5, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
        muzzle_2 = { offset = true,   position = vector3_box(0, 0.3, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
    },
    {	dependencies = { "owo_suppressor_04|owo_suppressor_05"},
        muzzle = { offset = true,   position = vector3_box(0, 0.072, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
        muzzle_2 = { offset = true,   position = vector3_box(0, 0.52, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.80, 1.80, 1.5) },
    },
    -- the skinny bayonet. sits on muzzle
    {	dependencies = {"owo_suppressor_01|owo_suppressor_02", 
            "autogun_bayonet_03"
        },
        bayonet = { offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85 ) },
    },
    -- ######
	-- Magazine: FLAT MAG
	-- ######
    {   dependencies =  { "owo_lasgun_magazine_flat_01" },
        magazine =      { offset = true, scale = vector3_box(1, 1, 0.5)},
    },
    {   dependencies =  { "owo_autogun_magazine_flat_03" },
        magazine =      { offset = true, rotation = vector3_box(14, 0, 0), scale = vector3_box(1, 1, 0.45), hide_mesh = {{"magazine", 1,2,3,4,5,6,7,8,9,10}}, },
    },

    -- ######
    -- Receiver: Grip Mag
    -- ######
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03"},
        receiver = { offset = true, position = vector3_box(0, 0, 0.050), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        -- None of my transformations are working im gonna kill someone
        -- and receiverac1 is stealing mag anims lmaoooo
        -- SETTING OFFSET TO FALSE FIXED IT. lets this take over from default? it would stretch this time but wouldn't move (unlike shotgun which didn't stretch either)
        receiverac1 = { offset = false, position = vector3_box(0, 0.136, 0.022), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.3, 2.33, 0.38)},
        -- trigger already aligned. reuse as hammer? on a las weapon lmao
        -- receiverac2 = { offset = true, position = vector3_box(0, -0.04, -0.07), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.2, 0.2, 0.033)},
        receiverac2 = {hide_mesh = { 	{"receiverac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
        magazine = { offset = true, position = vector3_box(0, -0.115, -0.031), rotation = vector3_box(-30, 0, 0), scale = vector3_box(0.85, 0.5, 1)},
        grip = { offset = true,position = vector3_box(0, 0.0, -0.050), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.7, 1, 1)},
    },
    --  MT Irons
    -- offsets are already set, so these just get overwritten unless this goes before them in the load order
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
            "lasgun_sight_01",
        },
        --no_scope_offset = { offset = true, position = vector3_box(-0.058, -0.5, -0.063), rotation = vector3_box(0, 29, 0)},
        no_scope_offset = { offset = true, position = vector3_box(-0.055, -0.5, -0.063), rotation = vector3_box(0, 29, 0)},
    },
    -- Syn's aquilon scope alignment
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
            "aquilon_scope_01|aquilon_scope_01a|aquilon_scope_02|aquilon_scope_02a"
        },
        scope_offset = { offset = true, position = vector3_box(-0.035, -0.5, -0.053), rotation = vector3_box(0, 29, 0), aim_scale = -0.13, lense_transparency = true },
    },
    -- other sights
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
        },
        -- rotated to be straight in first person
        no_scope_offset = { offset = false, position = vector3_box(-0.035, -0.5, -0.10), rotation = vector3_box(0, 29, 0)},
        scope_offset = { offset = false, position = vector3_box(-0.035, -0.5, -0.10), rotation = vector3_box(0, 29, 0), aim_scale = -0.13, lense_transparency = true },
    },
    -- Flashlights
    --      Trigger flashlights
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
            "owo_grip_laser_01|owo_grip_laser_02"
        },
        flashlight = { offset = true,  position = vector3_box(-0.024, 0.072, -0.057), scale = vector3_box(0.75, 0.425, 0.588)},
    },
    --      Normal flashlights
    {   dependencies = {"owo_laspistol_grip_mag_01|owo_laspistol_grip_mag_02|owo_laspistol_grip_mag_03",
        },
        flashlight = { offset = true,  position = vector3_box(-0.064, -0.112, -0.119), scale = vector3_box(1, 1, 1)},
    },
    
    
    -- ######
	-- Flashlight: LASER GRIP
	-- ######
    {   dependencies = {"owo_grip_laser_01|owo_grip_laser_02"},
        flashlight = { offset = true,  position = vector3_box(-0.064, -0.112, -0.119), scale = vector3_box(0.75, 0.425, 0.588)},
    },

    -- #########################
	-- Hiding unused helpers
	-- #########################
    -- Muzzles
    {	dependencies = {"owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03|owo_suppressor_helper_04|owo_condom_helper_01"},
        muzzle_2 = {automatic_equip = { muzzle_2 = "owo_suppressor_helper_empty" }, hide_mesh = {{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, },
    },
    -- Receivers
    {	dependencies = {"owo_laspistol_grip_mag_helper_01"},
        receiverac1 = {automatic_equip = { receiverac1="owo_laspistol_grip_mag_helper_empty" }, hide_mesh = {{"receiverac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_laspistol_grip_mag_helper2_01"},
        receiverac2 = {automatic_equip = { receiverac2="owo_laspistol_grip_mag_helper2_empty" },hide_mesh = {{"receiverac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
