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
mod.wc.attachment[this_variant].muzzle_2 = {} -- MT and Syn didn't add this to Recons yet
mod.wc.attachment[this_variant].barrelac = {}
mod.wc.attachment[this_variant].bayonetac1 = {}
mod.wc.attachment[this_variant].bayonetac2 = {}
mod.wc.attachment[this_variant].bayonetac3 = {}
mod.wc.attachment[this_variant].bayonetac4 = {}
mod.wc.attachment[this_variant].bayonetac5 = {}
mod.wc.attachment[this_variant].bayonetac6 = {}
mod.wc.attachment[this_variant].bayonetac7 = {}
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
mod.owo_underbarrel_shotgun(this_variant, "bayonet")
mod.owo_condom(this_variant)

mod.owo_alt_viewmodel(this_variant)
mod.owo_holosight(this_variant, "sight")
mod.owo_telescopic_sight(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {

	-- ######
	-- Magazine: FLAT LASGUN
	-- ######
	-- trying to align with syn's aquilon barrel
	{	dependencies = { "owo_lasgun_magazine_flat_01", 
			"volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03"
		},
		magazine = { offset = true, position = vector3_box(0, 0.05, 0.03), scale = vector3_box(1, 1, 0.5)},
	},
    {	dependencies = { "owo_lasgun_magazine_flat_01"},
		magazine = { offset = true, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.75)},
	},

	-- ######
	-- Muzzle: SUPPRESSOR
	-- ######
    {	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
        muzzle = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2) },
    },
    {	dependencies = {"owo_suppressor_01"},
        muzzle_2 = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle_2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2) }
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
        bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85) },
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
	-- Bayonet: UNDERBARREL SHOTGUN
	-- ######
    -- Masterkey
    --  Recon Receivers
    {	dependencies = {"owo_underbarrel_shotgun_01",
            "receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
        },
        -- Shotgun body
        bayonet =       {offset = true, position = vector3_box(0, -0.0628, -0.184), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        -- Connector, shorter because of hand rest position
        bayonetac6 =    {offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 0.82, 1.0 ) },
    },
    --  Not recon, Syn's Kantrael bodies (uses the same positioning as lasgun_p1_m1 because they're iLas bodies)
    {	dependencies = {"owo_underbarrel_shotgun_01",
        },
        -- Shotgun body
        bayonet =       {offset = true, position = vector3_box(0, -0.0708, -0.11), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        -- Connector
        bayonetac6 =    {offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.6, 1.0 ) },
    },
	{	dependencies = {"owo_underbarrel_shotgun_01"},
        -- Shotgun tube
        bayonetac1 =    {offset = true, position = vector3_box(0, 0.613, 0), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.2, 1, 1.2 ) },
        -- Shotgun barrel 2
        bayonetac2 =    {offset = true, position = vector3_box(0, 0.01, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Shotgun tube middle extension
        bayonetac3 =    {offset = true, position = vector3_box(0, 0.42, -0.05), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    {offset = true, position = vector3_box(0, 0.036, -0.088), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 0.85 ) },
        -- Shotgun Trap
        bayonetac5 =    {offset = true, position = vector3_box(0, 0.06, -0.0818), rotation = vector3_box(-90, 0, -84), scale = vector3_box(0.135, 0.25, 0.365 ) },
        -- Pump
        bayonetac7 =    {offset = true, position = vector3_box(0, 0.46, -0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.95, 0.7, 0.85 ) },
    },
    -- M26-MASS
    --  Recon Receivers
    {	dependencies = {"owo_underbarrel_shotgun_02",
            "receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
        },
        -- Receiver
        bayonet =       {offset = true, position = vector3_box(0, -0.01, -0.21), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    --  Not recon body
    {	dependencies = {"owo_underbarrel_shotgun_02"},
        -- Receiver
        bayonet =       {offset = true, position = vector3_box(0, -0.002, -0.148), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    {	dependencies = {"owo_underbarrel_shotgun_02"},
        -- Mag
        bayonetac1 =    {offset = true, position = vector3_box(0, -0.015, -0.079), rotation = vector3_box(15, 0, 0), scale = vector3_box(1, 1.2, 1 ) },
        -- Barrel
        bayonetac2 =    {offset = true, position = vector3_box(0, -0.02, 0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Muzzle
        bayonetac3 =    {offset = true, position = vector3_box(0, 0.36, 0.086), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    {offset = true, position = vector3_box(0, -0.044, -0.026), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 1.085 ) },
        -- Front Connector is too far up on these short ass guns
        bayonetac5 =    {offset = true, position = vector3_box(0, 0.246, 0.082), rotation = vector3_box(-180, -90, 90), scale = vector3_box(0.75, 0.95, 0.335 ), hide_mesh = {{"bayonetac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        -- Connector
        bayonetac6 =    {offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.0 ) },
    },

    -- ######
	-- Sight_2: Alt Viewmodels
	-- ######
    --  Doom
    {   dependencies = { "owo_alt_viewmodel_01" },
        scope_offset =      { position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0)},
        no_scope_offset =      { position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0)},
    },
    {   dependencies = { "owo_alt_viewmodel_02" },
        scope_offset =      { position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0)},
        no_scope_offset =      { position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0)},
    },
    {   dependencies = { "owo_alt_viewmodel_03" },
        scope_offset =      { position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0)},
        no_scope_offset =      { position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0)},
    },
    -- CS:S
    {   dependencies = { "owo_alt_viewmodel_04" },
        scope_offset =      { position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0)},
        no_scope_offset =      { position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0)},
    },
    -- Hipfire
    {   dependencies = { "owo_alt_viewmodel_05" },
        scope_offset =      { position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0)},
        no_scope_offset =      { position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0)},
    },
    -- Point Shooting
    {   dependencies = { "owo_alt_viewmodel_06" },
        scope_offset =          { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0), lense_transparency = false},
        no_scope_offset =       { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0), lense_transparency = false},
    },

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  -------------------------------------------
    --  EOTech
    --  -------------------------------------------
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03" },
        sightac1 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac2 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =       { offset = true, position  = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
    },
    --  with, then without recon carry handle
    {   dependencies = { "owo_holosight_01_01",
        "receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
    },
    sight =             { offset = true, position  = vector3_box(0, 0.032, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
    sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    {   dependencies = { "owo_holosight_01_01",
		},
        sight =             { offset = true, position  = vector3_box(0, 0, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies = { "owo_holosight_01_02|owo_holosight_01_03",
            "receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
        },
        sight =             { offset = true, position  = vector3_box(0, 0.05, 0.174), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    {   dependencies = { "owo_holosight_01_02|owo_holosight_01_03",
        },
        sight =             { offset = true, position  = vector3_box(0, 0.05, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    {   dependencies = { "owo_holosight_01_02" },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0, -0.15, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0, -0.0162, 0.03), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    {   dependencies = { "owo_holosight_01_03" },
        sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0.042, -0.15, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    --      Recon Receiver
	{   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03|owo_holosight_02_01|owo_holosight_02_02|owo_holosight_02_03",
			"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        scope_offset =      { position = vector3_box(0, -0.0007, -0.0293), rotation = vector3_box(0, 0, 0)},
    },
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03|owo_holosight_02_01|owo_holosight_02_02|owo_holosight_02_03",
			-- "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03|volley_lasgun_receiver_03b",
		},
        scope_offset =      { position = vector3_box(0, -0.0004, 0.0305), rotation = vector3_box(0, 0, 0)},
    },

	-- ######
    -- Sight: Telescopic Sights
    -- ######
    --  -------------------------------------------
    -- Trijicon ACOG
    --  -------------------------------------------
    --  ACOG only
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sightac1 =       { offset = true, position  = vector3_box(0, -0.022, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        sightac2 =       { offset = true, position  = vector3_box(0, -0.132, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.064, 0.032), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Base
        sightac4 =       { offset = true, position  = vector3_box(0, -0.018, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Knobs
        sightac5 =       { offset = true, position  = vector3_box(0, -0.01, 0.061), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.45, 0.68, 0.24) },
        sightac6 =       { offset = true, position  = vector3_box(0.028, -0.014, 0.034), rotation = vector3_box(-180, -90, -180), scale = vector3_box(0.45, 0.45, 0.12) },
        -- Cable
        sightac7 =       { offset = true, position  = vector3_box(0, -0.018, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.515, 0.195, 0.525) },
    },
    --      Syn's Hellgun Receivers
	{   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top",
            "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b",
        },
        sight =             { offset = true, position  = vector3_box(0, 0.046, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        },
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top",
            "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b",
        },
        sight =             { offset = true, position  = vector3_box(0, 0.108, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Else: Recon Body
    --          Recon rail already put acog forwards
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top",
			--"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.138, 0.19), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Sight 2 Adjustment
    --          For whatever fucking reason, the recon body won't apply position transformations to sight_2
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top",
            "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b"
        },
        lens =              {offset = true, parent = "sight", position = vector3_box(0, 0.064, 0.0345), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =            {offset = true, parent = "sight", position = vector3_box(0, -0.052, 0.0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =           { offset = true, position  = vector3_box(0, 0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top",
            "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b"
        },
        lens =              {offset = true, parent = "sight", position = vector3_box(0, 0.138, 0.0345), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =            {offset = true, parent = "sight", position = vector3_box(0, 0.015, 0.0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =           { offset = true, position  = vector3_box(0, 0.072, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top",
            --"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
        },
        lens =              {offset = true, parent = "sight", position = vector3_box(0, 0.156, 0.2195), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =            {offset = true, parent = "sight", position = vector3_box(0, 0.038, 0.2195), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =           { offset = false, position  = vector3_box(0, 0.092, 0.188), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --  ACOG with RMR on top
    {   dependencies = { "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top" },
        sight_secondary =       { offset = true, position  = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  SUSAT
    --  -------------------------------------------
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_02|owo_susat_02_top" },
        -- cylinder thing
        --sightac1 =       { offset = true, position  = vector3_box(0, 0.096, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.6, 1.47, 1.27), data = {lens = 1} },
        sightac1 =       { offset = true, position  = vector3_box(0, 0.096, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.6, 1.47, 1.27)},
        -- Rear
        --  One is sliiightly further back to prevent z-fighting
        sightac2 =       { offset = true, position  = vector3_box(0, -0.0081, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        sightac3 =       { offset = true, position  = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        -- Base
        sightac4 =       { offset = true, position  = vector3_box(0, 0.07, -0.036), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Reticle
        sightac5 =       { offset = true, position  = vector3_box(-0.0028, 0.066, -0.026), rotation = vector3_box(0, 6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        sightac6 =       { offset = true, position  = vector3_box(0.0028, 0.066, -0.026), rotation = vector3_box(0, -6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        sightac7 =       { offset = true, position  = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0) },

        lens =              {offset = false, parent = "sightac7", position = vector3_box(0, 0.096, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.3, 0.85), data = {lens = 1}},
	    lens_2 =            {offset = false, parent = "sightac7", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    --      Syn's Hellgun Receivers
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_02|owo_susat_02_top",
            "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b",
		},
        sight =             { offset = true, position  = vector3_box(0, 0.006, 0.163), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Else: Recon Receivers
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_02|owo_susat_02_top",
            --"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
        },
        sight =             { offset = true, position  = vector3_box(0, 0.016, 0.221), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --  SUSAT with red dot
    {   dependencies = { "owo_susat_02|owo_susat_02_top" },
        sight_secondary =     { offset = true, position  = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    --  Aiming with Main Sight
    --      Syn's Hellgun Receivers
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_susat_01|owo_susat_02|owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1",
			"volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b",
		},
        scope_offset =      { position = vector3_box(0, -0.03, 0.024), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --      Else: Recon Receiver
	{   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_susat_01|owo_susat_02|owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top",
			--"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        scope_offset =      { position = vector3_box(0, 0.02, -0.034), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --  Aiming with RMR
    --      Syn's Hellgun Receivers
    --          ACOG
    {   dependencies = { "owo_acog_sight_02_top",
			"volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b",
		},
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.05), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },
    --          SUSAT
    {   dependencies = { "owo_susat_02_top",
            "volley_lasgun_receiver_01|volley_lasgun_receiver_02|volley_lasgun_receiver_03|volley_lasgun_receiver_01b|volley_lasgun_receiver_02b|volley_lasgun_receiver_03b",
		},
        scope_offset =      { position = vector3_box(0, 0.2, -0.0385), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },
    --      Else: Recon Receiver
    --          ACOG
	{   dependencies = { "owo_acog_sight_02_top",
			--"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.11), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },
    --          SUSAT
    {   dependencies = { "owo_susat_02_top",
			--"receiver_01|receiver_02|receiver_03|receiver_04|receiver_05|receiver_06|receiver_07",
		},
        scope_offset =      { position = vector3_box(0.0002, 0.3, -0.097), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },
    
    -- ######
	-- Sight: SOVIET PU SCOPE
	-- ######
	{	dependencies = {"owo_pu_scope_01|owo_pu_scope_02"},
        no_scope_offset =   { position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0)},
        scope_offset =      { position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0)},
        sight = 	  {offset = true, position = vector3_box(0, -0.09, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        sightac1 = {offset = true, position = vector3_box(0, 0.106 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        -- Crosshair
        sightac2 = {offset = true, position = vector3_box(0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
        sightac3 = {offset = true, position = vector3_box(-0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
        sightac4 = {offset = true, position = vector3_box(0, 0.08, -0.031), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.25, 0.1 ) },
        -- Knobs
        sightac5 = {offset = true, position = vector3_box(0, 0.13, 0.03), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.5, 0.5, 0.2 ) },
        sightac6 = {offset = true, position = vector3_box(0.03, 0.095, 0), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.5, 0.5, 0.2 ) },
    },
    -- Riser alightment
    {	dependencies = {"owo_pu_scope_01"},
        sight_secondary = {offset = true, position = vector3_box(0, 0.016, 0.1), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
    {	dependencies = {"owo_pu_scope_02"},
        sight_secondary = {offset = true, position = vector3_box(0, -0.036, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },

	-- #########################
	-- Hiding unused helpers
	-- #########################
	{	dependencies = { "owo_scab_gunner_barrelac_01"},
		barrelshroud = { hide_mesh = { 	{"barrelac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	{	dependencies = {"owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03|owo_suppressor_helper_04|owo_condom_helper_01"},
		muzzle_2 = {hide_mesh = {{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
	},
    -- Bayonet
    {	dependencies = {"owo_dreg_bayonet_rear_01|owo_bayonet_m7_helper_01|owo_bayonet_seitengewehr_helper_01|owo_bayonet_epee_helper_01|owo_m203_helper_01|owo_gp25_helper_01|owo_underbarrel_shotgun_helper_01|owo_underbarrel_shotgun_helper_01_02"},
        bayonetac1 = {hide_mesh = {     {"bayonetac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_bayonet_m7_helper_02|owo_bayonet_seitengewehr_helper_02|owo_bayonet_epee_helper_02|owo_m203_helper_02|owo_gp25_helper_02|owo_underbarrel_shotgun_helper_02|owo_underbarrel_shotgun_helper_02_02"},
        bayonetac2 = {hide_mesh = {     {"bayonetac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_m203_helper_03|owo_gp25_helper_03|owo_underbarrel_shotgun_helper_03|owo_underbarrel_shotgun_helper_03_02"},
        bayonetac3 = {hide_mesh = {     {"bayonetac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_m203_helper_04|owo_gp25_helper_05|owo_underbarrel_shotgun_helper_04|owo_underbarrel_shotgun_helper_04_02"},
        bayonetac4 = {hide_mesh = {     {"bayonetac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_gp25_helper_05|owo_underbarrel_shotgun_helper_05|owo_underbarrel_shotgun_helper_05_02"},
        bayonetac5 = {hide_mesh = {     {"bayonetac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_underbarrel_shotgun_helper_06|owo_underbarrel_shotgun_helper_06_02"},
        bayonetac6 = {hide_mesh = {     {"bayonetac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_underbarrel_shotgun_helper_07"},
        bayonetac7 = {hide_mesh = {     {"bayonetac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
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
    {   dependencies = { "owo_acog_sight_helper_07|owo_susat_ac7_01"},
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
