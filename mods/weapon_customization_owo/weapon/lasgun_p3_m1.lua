local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "lasgun_p3_m1" -- Recon Lasgun

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].muzzle2 = {}
mod.wc.attachment[this_variant].barrelac = {}
mod.wc.attachment[this_variant].owosightac1 = {}
mod.wc.attachment[this_variant].owosightac2 = {}
mod.wc.attachment[this_variant].owosightac3 = {}
mod.wc.attachment[this_variant].owosightac4 = {}
mod.wc.attachment[this_variant].owosightac5 = {}
mod.wc.attachment[this_variant].owosightac6 = {}
mod.wc.attachment[this_variant].owosightac7 = {}
mod.wc.attachment[this_variant].owosight2 = {}
mod.wc.attachment[this_variant].owosight2ac1 = {}
mod.wc.attachment[this_variant].owosight2ac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_lasgun_magazine_flat(this_variant)
mod.owo_suppressor(this_variant)
mod.owo_scab_gunner_muzzle(this_variant)
mod.owo_scab_gunner_barrel(this_variant)
mod.owo_condom(this_variant)
mod.owo_holosight(this_variant, "sight")
mod.owo_acog_sight(this_variant, "sight")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {

	-- ######
	-- Magazine: FLAT LASGUN
	-- ######
	{	dependencies = { "owo_lasgun_magazine_flat_01", 
			"!volley_lasgun_receiver_01",
			"!volley_lasgun_receiver_02",
			"!volley_lasgun_receiver_03",
		},
		magazine = { offset = true, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.75)},
	},
	-- trying to align with syn's aquilon barrel
	{	dependencies = { "owo_lasgun_magazine_flat_01", 
			"volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03"
		},
		magazine = { offset = true, position = vector3_box(0, 0.05, 0.03), scale = vector3_box(1, 1, 0.5)},
	},

	-- ######
	-- Muzzle: SUPPRESSOR
	-- ######
    {	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
        muzzle = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2) },
    },
    {	dependencies = {"owo_suppressor_01"},
        muzzle2 = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2) }
    },
    -- the skinny bayonet. sits on muzzle
    {	dependencies = {"owo_suppressor_01|owo_suppressor_02",
            "autogun_bayonet_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85) },
    },

	-- ######
	-- Muzzle: CONDOM
	-- ######
	{	dependencies = {"owo_condom_01"},
		muzzle = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.64, 1.344, 0.64 ) },
		muzzle2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 22, 0), scale = vector3_box(0.64, 1.344, 0.64 ) },
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
			"!owo_scab_gunner_barrel_01"
		},
		muzzle = { offset = true,  position = vector3_box(0, -0.025, -0.03),  rotation = vector3_box(0, 0, 0),  scale = vector3_box(1, 1, 1.76)},
	},
	{	dependencies = { "owo_scab_gunner_muzzle_01", 
			"owo_scab_gunner_barrel_01"
		},
		muzzle = { offset = true,  position = vector3_box(0, 0.033, -0.02),  rotation = vector3_box(0, 0, 0),  scale = vector3_box(1, 1, 1.76)},
	},

	-- ######
	-- SCAB GUNNER BARREL
	-- ######
	{	dependencies = { "owo_scab_gunner_barrel_01", 
			"!volley_lasgun_receiver_01",
			"!volley_lasgun_receiver_02",
			"!volley_lasgun_receiver_01b",
			"!volley_lasgun_receiver_02b",
			"!volley_lasgun_receiver_03",
			"!volley_lasgun_receiver_03b"
		},
		barrel = { offset = true,  position = vector3_box(0, -0.08, 0),  rotation = vector3_box(0, 0, 0),  scale = vector3_box(1, 1, 1)},
		barrelac = { offset = true,  position = vector3_box(0, 0.11, -0.018),  rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1, 0.885, 1.5)},
	},
	{	dependencies = { "owo_scab_gunner_barrel_01", 
			"volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b"
		},
		-- kantrael receiver already edits this, so this part doesn't work
		barrel = { offset = false,  parent = "receiver",  position = vector3_box(0, 0.16, 0.079),  rotation = vector3_box(0, 0, 0),  scale = vector3_box(1.05, 1.5, 1.)},
		barrelac = { offset = true,  position = vector3_box(0, 0.11, -0.018),  rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1, 0.885, 1.5)},
	},

	-- ######
    -- Sight: EOTech
    -- ######
    -- Fat EOTech
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03" },
        owosightac1 =       { offset = true, position  = vector3_box(0, 0.042, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.526, 0.258) },
        owosightac2 =       { offset = true, position  = vector3_box(0, 0.042, 0.01), rotation = vector3_box(90, -90, 0), scale = vector3_box(0.95, 0.526, 0.258) },
        owosightac3 =       { offset = true, position  = vector3_box(-0.003, 0.088, 0.008), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.204) },
        owosightac4 =       { offset = true, position  = vector3_box(0, 0.052, 0.004), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.45, 0.28, 0.24) },
    },
    {   dependencies = { "owo_holosight_01_01",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        sight =             { offset = true, position  = vector3_box(0, 0, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
    },
	--	with the recon carryhandle
	-- +0, +0.032, +0.06
	{   dependencies = { "owo_holosight_01_01",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.032, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
    },
    {   dependencies = { "owo_holosight_01_02|owo_holosight_01_03",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.05, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        owosight2 =         { offset = true, position  = vector3_box(0, -0.02, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
    },
	{   dependencies = { "owo_holosight_01_02|owo_holosight_01_03",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.082, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        owosight2 =         { offset = true, position  = vector3_box(0, 0.062, 0.074), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
    },
    {   dependencies = { "owo_holosight_01_02",},
        owosight2ac1 =      { offset = true, position  = vector3_box(0, -0.126, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.89) },
        owosight2ac2 =      { offset = true, position  = vector3_box(0, 0.007, 0.03), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.89) },
    },
    {   dependencies = { "owo_holosight_01_03" },
        owosight2ac1 =      { offset = true, position  = vector3_box(0.056, -0.126, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.89) },
        owosight2ac2 =      { offset = true, position  = vector3_box(0.056, 0.007, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.89) },
    },
    -- Tall EOTech
    {   dependencies = { "owo_holosight_02_01|owo_holosight_02_02|owo_holosight_02_03" },
        owosightac1 =       { offset = true, position  = vector3_box(0, 0.032, 0.014), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.39, 0.186) },
        owosightac2 =       { offset = true, position  = vector3_box(0, 0.032, 0.014), rotation = vector3_box(90, -90, 0), scale = vector3_box(0.95, 0.39, 0.186) },
        owosightac3 =       { offset = true, position  = vector3_box(-0.003, 0.086, 0.013), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.204) },
        owosightac4 =       { offset = true, position  = vector3_box(0, 0.054, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.45, 0.28, 0.192) },
    },
    {   dependencies = { "owo_holosight_02_01", 
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        sight =             { offset = true, position  = vector3_box(0, 0, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
    },
	{   dependencies = { "owo_holosight_02_01", 
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.032, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
    },
    {   dependencies = { "owo_holosight_02_02|owo_holosight_02_03",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.05, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        owosight2 =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
    },
	{   dependencies = { "owo_holosight_02_02|owo_holosight_02_03",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.082, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        owosight2 =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
    },
    {   dependencies = { "owo_holosight_02_02" },
        owosight2ac1 =      { offset = true, position  = vector3_box(0, -0.15, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        owosight2ac2 =      { offset = true, position  = vector3_box(0, -0.0162, 0.03), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    {   dependencies = { "owo_holosight_02_03" },
        owosight2ac1 =      { offset = true, position  = vector3_box(0.042, -0.15, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        owosight2ac2 =      { offset = true, position  = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    -- Normal EOTech
    {   dependencies = { "owo_holosight_03_01|owo_holosight_03_02|owo_holosight_03_03|owo_holosight_03_01_ps|owo_holosight_03_02_ps|owo_holosight_03_03_ps" },
        owosightac1 =       { offset = true, position  = vector3_box(0.00, 0.012, 0.014), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.39, 0.286) },
        owosightac2 =       { offset = true, position  = vector3_box(0.00, 0.012, 0.014), rotation = vector3_box(90, -90, 0), scale = vector3_box(0.95, 0.39, 0.286) },
        owosightac3 =       { offset = true, position  = vector3_box(-0.003, 0.046, 0.014), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        owosightac4 =       { offset = true, position  = vector3_box(0, 0.05, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.28, 0.192) },
    },
    {   dependencies = { "owo_holosight_03_01|owo_holosight_03_01_ps",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
    },
	{   dependencies = { "owo_holosight_03_01|owo_holosight_03_01_ps",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.032, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies = { "owo_holosight_03_02|owo_holosight_03_03|owo_holosight_03_02_ps|owo_holosight_03_03_ps",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.05, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        owosight2 =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
    },
	{   dependencies = { "owo_holosight_03_02|owo_holosight_03_03|owo_holosight_03_02_ps|owo_holosight_03_03_ps",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.082, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        owosight2 =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
    },
    {   dependencies = { "owo_holosight_03_02|owo_holosight_03_02_ps" },
        owosight2ac1 =      { offset = true, position  = vector3_box(0, -0.15, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        owosight2ac2 =      { offset = true, position  = vector3_box(0, -0.0162, 0.03), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    {   dependencies = { "owo_holosight_03_03|owo_holosight_03_03_ps" },
        owosight2 =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        owosight2ac1 =      { offset = true, position  = vector3_box(0.042, -0.15, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        owosight2ac2 =      { offset = true, position  = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    --  Aligning sights to crosshair
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03|owo_holosight_02_01|owo_holosight_02_02|owo_holosight_02_03|owo_holosight_03_01|owo_holosight_03_02|owo_holosight_03_03",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        scope_offset =      { position = vector3_box(0, -0.0004, 0.0305), rotation = vector3_box(0, 0, 0)},
    },
	{   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03|owo_holosight_02_01|owo_holosight_02_02|owo_holosight_02_03|owo_holosight_03_01|owo_holosight_03_02|owo_holosight_03_03",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        scope_offset =      { position = vector3_box(0, -0.0007, -0.0293), rotation = vector3_box(0, 0, 0)},
    },
    --      Point shooting
    {   dependencies = { "owo_holosight_03_01_ps|owo_holosight_03_02_ps|owo_holosight_03_03_ps" },
        scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0)},
    },

	-- ######
    -- Sight: Trijicon ACOG
    -- ######
    -- ACOG only
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_ps|owo_acog_sight_02_01|owo_acog_sight_02_02|owo_acog_sight_02_ps" },
        owosightac1 =       { offset = true, position  = vector3_box(0, -0.022, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        owosightac2 =       { offset = true, position  = vector3_box(0, -0.128, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        owosightac3 =       { offset = true, position  = vector3_box(0, 0.064, 0.032), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Base
        owosightac4 =       { offset = true, position  = vector3_box(0, -0.018, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Knobs
        owosightac5 =       { offset = true, position  = vector3_box(0, -0.01, 0.061), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.45, 0.68, 0.24) },
        owosightac6 =       { offset = true, position  = vector3_box(0.028, -0.014, 0.034), rotation = vector3_box(-180, -90, -180), scale = vector3_box(0.45, 0.45, 0.12) },
        -- Cable
        owosightac7 =       { offset = true, position  = vector3_box(0, -0.018, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.515, 0.195, 0.525) },
    },
	{   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_ps|owo_acog_sight_02_01|owo_acog_sight_02_02|owo_acog_sight_02_ps",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.046, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	{   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_ps|owo_acog_sight_02_01|owo_acog_sight_02_02|owo_acog_sight_02_ps",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.138, 0.19), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    -- ACOG with RMR on top
    {   dependencies = { "owo_acog_sight_02_01|owo_acog_sight_02_02|owo_acog_sight_02_ps" },
        owosight2 =       { offset = true, position  = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  Aligning sights to crosshair
    --      Aiming with ACOG
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_02_01",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        scope_offset =      { position = vector3_box(0, 0.04, 0.024), rotation = vector3_box(0, 0, 0)},
    },
	{   dependencies = { "owo_acog_sight_01|owo_acog_sight_02_01",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        scope_offset =      { position = vector3_box(0, 0.02, -0.034), rotation = vector3_box(0, 0, 0)},
    },
    --      Aiming with RMR
    {   dependencies = { "owo_acog_sight_02_02",
			"!receiver_01", "!receiver_02", "!receiver_03", "!receiver_04", "!receiver_05", "!receiver_06", "!receiver_07",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.05), rotation = vector3_box(0, 0, 0)},
    },
	{   dependencies = { "owo_acog_sight_02_02",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.064), rotation = vector3_box(0, 0, 0)},
    },
    --      Point shooting
    {   dependencies = { "owo_acog_sight_01_ps|owo_acog_sight_02_ps" },
        scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0)},
    },
	
	-- #########################
	-- Hiding unused helpers
	-- #########################
	{	dependencies = { "!owo_scab_gunner_barrel_01"},
		barrelac = { hide_mesh = { 	{"barrelac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	{	dependencies = {"!owo_suppressor_01",  "!owo_suppressor_02", 
			"!owo_condom_01"
		},
		muzzle2 = {hide_mesh = {{"muzzle2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
	},
	-- Sights
	{   dependencies = {"!owo_holosight_01_01", "!owo_holosight_01_02", "!owo_holosight_01_03",
            "!owo_holosight_02_01", "!owo_holosight_02_02", "!owo_holosight_02_03",
            "!owo_holosight_03_01", "!owo_holosight_03_02", "!owo_holosight_03_03",
            "!owo_holosight_03_01_ps", "!owo_holosight_03_02_ps", "!owo_holosight_03_03_ps",
            "!owo_acog_sight_01", "!owo_acog_sight_01_ps",
            "!owo_acog_sight_02_01", "!owo_acog_sight_02_02", "!owo_acog_sight_02_ps",
        },
        owosightac1 = { hide_mesh = {{"owosightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosightac2 = { hide_mesh = {{"owosightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosightac3 = { hide_mesh = {{"owosightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosightac4 = { hide_mesh = {{"owosightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "!owo_holosight_01_02", "!owo_holosight_01_03",
            "!owo_holosight_02_02", "!owo_holosight_02_03",
            "!owo_holosight_03_02", "!owo_holosight_03_03",
            "!owo_holosight_03_02_ps", "!owo_holosight_03_03_ps",
            "!owo_acog_sight_02_01", "!owo_acog_sight_02_02", "!owo_acog_sight_02_ps",
        },
        owosight2 = { hide_mesh = {{"owosight2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
	{   dependencies = { "!owo_holosight_01_02", "!owo_holosight_01_03",
            "!owo_holosight_02_02", "!owo_holosight_02_03",
            "!owo_holosight_03_02", "!owo_holosight_03_03",
            "!owo_holosight_03_02_ps", "!owo_holosight_03_03_ps",
        },
        owosight2ac1 = { hide_mesh = {{"owosight2ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosight2ac2 = { hide_mesh = {{"owosight2ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
