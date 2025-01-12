local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "lasgun_p1_m1" -- Infantry Lasgun

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].muzzle_2 = {} -- MT and Syn didn't add this to iLas yet
mod.wc.attachment[this_variant].barrelac = {}
mod.wc.attachment[this_variant].sightac1 = {}
--[[ Covered by MT Plugin 
mod.wc.attachment[this_variant].sightac2 = {}
mod.wc.attachment[this_variant].sightac3 = {}
mod.wc.attachment[this_variant].sightac4 = {}
]]
mod.wc.attachment[this_variant].sightac5 = {}
mod.wc.attachment[this_variant].sightac6 = {}
mod.wc.attachment[this_variant].sightac7 = {}
mod.wc.attachment[this_variant].sight_secondary = {}
mod.wc.attachment[this_variant].sight_secondary_ac1 = {}
mod.wc.attachment[this_variant].sight_secondary_ac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_magazine_flat(this_variant)
mod.owo_suppressor(this_variant)
mod.owo_scab_gunner_muzzle(this_variant)
mod.owo_scab_gunner_barrel(this_variant)
mod.owo_condom(this_variant)
mod.owo_holosight(this_variant, "sight")
mod.owo_telescopic_sight(this_variant, "sight")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
	-- ######
	-- Magazine: FLAT LASGUN
	-- ######
	{	dependencies = { "owo_lasgun_magazine_flat_01"},
		magazine = { offset = true, position = vector3_box(0, 0, -0.02), scale = vector3_box(1, 1, 0.5 ) },
	},
	{	dependencies = { "owo_autogun_magazine_flat_03"},
		magazine = { offset = true, scale = vector3_box(1, 1, 0.6 ) },
	},

	-- ######
	-- Muzzle: SUPPRESSOR
	-- ######
	{	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
		muzzle = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },
	},
	{	dependencies = {"owo_suppressor_01"},
		muzzle_2 = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },	
	},
	{	dependencies = {"owo_suppressor_02"},
		muzzle_2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2 ) }
	},
	-- the skinny bayonet. sits on muzzle
	{	dependencies = {"owo_suppressor_01|owo_suppressor_02", 
			"autogun_bayonet_03"
		},
		bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85 ) },
	},

	-- ######
	-- Muzzle: CONDOM
	-- ######
	{	dependencies = {"owo_condom_01"},
		muzzle = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.64, 1.344, 0.64 ) },
		muzzle_2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 22, 0), scale = vector3_box(0.64, 1.344, 0.64 ) },
	},
	-- the skinny bayonet. sits on muzzle
	{	dependencies = {"owo_condom_01",
			"autogun_bayonet_03"
		},
		bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.1, 0.66, 1.1 ) },
	},

	-- ######
	-- SCAB GUNNER MUZZLE
	-- ######
	{	dependencies = { "owo_scab_gunner_muzzle_01", 
			"owo_scab_gunner_barrel_01"
		},
		muzzle = { offset = true,  position = vector3_box(0, 0.033, -0.02),  rotation = vector3_box(0, 0, 0),  scale = vector3_box(1, 1, 1.76 ) },
	},
	{	dependencies = { "owo_scab_gunner_muzzle_01", 
			"!owo_scab_gunner_barrel_01"
		},
		muzzle = { offset = true,  position = vector3_box(0, -0.025, -0.03),  rotation = vector3_box(0, 0, 0),  scale = vector3_box(1, 1, 1.76 ) },
	},

	-- ######
	-- SCAB GUNNER BARREL
	-- ######
	{	dependencies = { "owo_scab_gunner_barrel_01"},
		barrel = { offset = true,  position = vector3_box(0, -0.08, 0),  rotation = vector3_box(0, 0, 0),  scale = vector3_box(1, 1, 1 ) },
		barrelac = { offset = true,  position = vector3_box(0, 0.11, -0.018),  rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1, 0.885, 1.5 ) },
	},

	-- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    -- EOTech
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03|owo_holosight_01_01_ps|owo_holosight_01_02_ps|owo_holosight_01_03_ps" },
        sightac1 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac2 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =       { offset = true, position  = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
    },
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_01_ps",
		},
        sight =             { offset = true, parent = "rail", position  = vector3_box(0, 0, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies = { "owo_holosight_01_02|owo_holosight_01_03|owo_holosight_01_02_ps|owo_holosight_01_03_ps",
        },
        sight =             { offset = true, position  = vector3_box(0, 0.05, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    {   dependencies = { "owo_holosight_01_02|owo_holosight_01_02_ps" },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0, -0.15, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0, -0.0162, 0.03), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    {   dependencies = { "owo_holosight_01_03|owo_holosight_01_03_ps" },
        sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0.042, -0.15, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    --  Aligning sights to crosshair
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03|owo_holosight_02_01|owo_holosight_02_02|owo_holosight_02_03",
		},
        scope_offset =      { position = vector3_box(0, -0.0004, -0.004), rotation = vector3_box(0, 0, 0)},
    },
    --      Point shooting
    {   dependencies = { "owo_holosight_01_01_ps|owo_holosight_01_02_ps|owo_holosight_01_03_ps" },
        scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0)},
    },

	-- ######
    -- Sight: Telescopic Sights
    -- ######
    -- Trijicon ACOG
    --  ACOG only
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_ps|owo_acog_sight_02_01|owo_acog_sight_02_02|owo_acog_sight_02_ps" },
		sight =             { offset = true, position  = vector3_box(0, 0.046, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sightac1 =       { offset = true, position  = vector3_box(0, -0.022, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        sightac2 =       { offset = true, position  = vector3_box(0, -0.128, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.064, 0.032), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Base
        sightac4 =       { offset = true, position  = vector3_box(0, -0.018, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Knobs
        sightac5 =       { offset = true, position  = vector3_box(0, -0.01, 0.061), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.45, 0.68, 0.24) },
        sightac6 =       { offset = true, position  = vector3_box(0.028, -0.014, 0.034), rotation = vector3_box(-180, -90, -180), scale = vector3_box(0.45, 0.45, 0.12) },
        -- Cable
        sightac7 =       { offset = true, position  = vector3_box(0, -0.018, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.515, 0.195, 0.525) },
    },
    --  ACOG with RMR on top
    {   dependencies = { "owo_acog_sight_02_01|owo_acog_sight_02_02|owo_acog_sight_02_ps" },
        sight_secondary =       { offset = true, position  = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  SUSAT
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_02_01|owo_susat_02_02|owo_susat_02_ps" },
        -- cylinder thing
        sightac1 =       { offset = true, position  = vector3_box(0, 0.096, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.6, 1.47, 1.27), data = {sightac1 = 1} },
        -- Rear
        sightac2 =       { offset = true, position  = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        sightac3 =       { offset = true, position  = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        -- Base
        sightac4 =       { offset = true, position  = vector3_box(0, 0.07, -0.036), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Reticle
        sightac5 =       { offset = true, position  = vector3_box(-0.0028, 0.066, -0.026), rotation = vector3_box(0, 6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        sightac6 =       { offset = true, position  = vector3_box(0.0028, 0.066, -0.026), rotation = vector3_box(0, -6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
    },
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_02_01|owo_susat_02_02|owo_susat_02_ps",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.006, 0.163), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --  SUSAT with red dot
    {   dependencies = { "owo_susat_02_01|owo_susat_02_02|owo_susat_02_ps" },
            sight_secondary =     { offset = true, position  = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  Aligning sights to crosshair
    --      Aiming with ACOG
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_02_01|owo_susat_02_01",
		},
        scope_offset =      { position = vector3_box(0, 0.04, 0.00), rotation = vector3_box(0, 0, 0)},
    },
    --      Aiming with RMR
    {   dependencies = { "owo_acog_sight_02_02",
		},
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.074), rotation = vector3_box(0, 0, 0)},
    },
    {   dependencies = { "owo_susat_02_02",
		},
        scope_offset =      { position = vector3_box(0.0002, 0.3, -0.063), rotation = vector3_box(0, 0, 0)},
    },

    --      Point shooting
    {   dependencies = { "owo_acog_sight_01_ps|owo_acog_sight_02_ps|owo_susat_02_ps" },
        scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0)},
    },

	-- #########################
	-- Hiding unused helpers
	-- #########################
	-- Barrels
	{	dependencies = { "owo_scab_gunner_barrelac_01"},
		barrelac = { hide_mesh = { 	{"barrelac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Muzzles
	{	dependencies = {"owo_suppressor_helper_01|owo_suppressor_helper_02|owo_condom_helper_01"},
		muzzle_2 = {hide_mesh = { 	{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Sights
	{   dependencies = {"owo_holosight_helper_01|owo_pu_scope_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01"},
        sightac1 = { hide_mesh = {{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_02|owo_pu_scope_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01"},
        sightac2 = { hide_mesh = {{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_03|owo_pu_scope_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01"},
        sightac3 = { hide_mesh = {{"sightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_04|owo_pu_scope_helper_04|owo_acog_sight_helper_04"},
        sightac4 = { hide_mesh = {{"sightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac5_01|owo_pu_scope_helper_05|owo_acog_sight_helper_05|owo_susat_ac5_01"},
        sightac5 = { hide_mesh = {{"sightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac6_01|owo_pu_scope_helper_06|owo_acog_sight_helper_06|owo_susat_ac6_01"},
        sightac6 = { hide_mesh = {{"sightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_acog_sight_helper_07"},
        sightac7 = { hide_mesh = {{"sightac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_01|owo_acog_sight_sight_secondary_01|owo_pu_scope_riser_01"},
        sight_secondary = { hide_mesh = {{"sight_secondary", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_01"},
        sight_secondary_ac1 = { hide_mesh = {{"sight_secondary_ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},  
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_02"},
        sight_secondary_ac2 = { hide_mesh = {{"sight_secondary_ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
