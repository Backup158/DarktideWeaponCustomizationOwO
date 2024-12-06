local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "lasgun_p2_m1" -- Helbore Lasgun

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].stockac = {}
--mod.wc.attachment[this_variant].stockac2 = {}
-- mod.wc.attachment[this_variant].stockac3 = {}
mod.wc.attachment[this_variant].rearmag = {}
mod.wc.attachment[this_variant].muzzle2 = {}
mod.wc.attachment[this_variant].barrelac1 = {}
mod.wc.attachment[this_variant].bayonetac1 = {}
mod.wc.attachment[this_variant].bayonetac2 = {}
mod.wc.attachment[this_variant].bayonetac3 = {}
mod.wc.attachment[this_variant].bayonetac4 = {}
mod.wc.attachment[this_variant].receiverac1 = {}
mod.wc.attachment[this_variant].receiverac2 = {}
mod.wc.attachment[this_variant].owosightac1 = {}
mod.wc.attachment[this_variant].owosightac2 = {}
mod.wc.attachment[this_variant].owosightac3 = {}
mod.wc.attachment[this_variant].owosightac4 = {}
mod.wc.attachment[this_variant].owosightac5 = {}
mod.wc.attachment[this_variant].owosightac6 = {}
mod.wc.attachment[this_variant].owosight2 = {}
mod.wc.attachment[this_variant].owosight2ac1 = {}
mod.wc.attachment[this_variant].owosight2ac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_helbore_gripstock_recon(this_variant)
mod.owo_lasgun_magazine_flat(this_variant)
mod.owo_lasgun_magazine_rear(this_variant)
mod.owo_suppressor(this_variant)
mod.owo_wood_krieg(this_variant)
mod.owo_bayonet(this_variant)
mod.owo_condom(this_variant)
mod.owo_bolt_action(this_variant)
mod.owo_rear_sight(this_variant)
mod.owo_underbarrel_gl(this_variant)
mod.owo_pu_scope(this_variant)
mod.owo_helbore_mas49(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
	-- ######
	-- Receiver: BOLT ACTION HELBORE
	-- ######
	{	dependencies = {"owo_bolt_helbore_01|owo_bolt_helbore_02|owo_bolt_helbore_03|owo_bolt_helbore_04|owo_bolt_helbore_05",
		},
		receiver = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		receiverac1 = {offset = true, position = vector3_box(0.025, -0.026, 0.1), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.55, 0.45, 0.55 ) },
		receiverac2 = {offset = true, position = vector3_box(0, 0.024, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.6, 0.5, 1 ) },
	},

	-- ######
	-- Receiver: HELBORE MAS-49
	-- ######
	{	dependencies = {"owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05",
		},
		receiver = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		receiverac1 = {offset = true, position = vector3_box(0.031, 0.022, 0.046), rotation = vector3_box(-90, 0, 90), scale = vector3_box(0.518, 0.573, 0.545 ) },
		receiverac2 = {offset = true, position = vector3_box(0.046, 0.18, 0.096), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.755, 0.755, 0.15 ) },
	},

	-- ######
	-- Stock: STRAIGHT GRIP AND RECON STOCK
	-- ######
	{	dependencies = {"owo_gripstock_recon_01|owo_gripstock_recon_02|owo_gripstock_recon_03"},
		stock = {offset = true, position = vector3_box(0, -0.04, 0.065), scale = vector3_box(1, 1.15, 0.85 ) },
		stockac = {offset = true, position = vector3_box(0, 0.02, 0),scale = vector3_box(1, 1, 1 ) },
	},

	-- ######
	-- Magazine: FLAT
	-- ######
	{	dependencies = {"owo_lasgun_magazine_flat_01"},
		magazine = {offset = true,scale = vector3_box(1, 1, 0.5 ) },
	},
	{	dependencies = {"owo_lasgun_magazine_flat_au_02"},
		magazine = {offset = true, scale = vector3_box(1, 1, 0.6 ) },
	},

	-- ######
	-- Magazine: REAR
	-- ######
	{	dependencies = {"owo_lasgun_magazine_rear_01",
			"owo_gripstock_recon_01|owo_gripstock_recon_02|owo_gripstock_recon_03"
		},
		magazine = {offset = true, position = vector3_box(.0, .0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.7 ) },
		rearmag = {offset = true, position = vector3_box(.0, -0.255, 0.035), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), },
	},
	--		Magazine: Rear when there's no recon stock
	{	dependencies = {"owo_lasgun_magazine_rear_01"},
		magazine = {offset = true, position = vector3_box(.0, .0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.7 ) },
		rearmag = {offset = true, position = vector3_box(.0, -0.23, 0.035), rotation = vector3_box(0, 0, 0), scale = vector3_box(0, 0, 0 ) },
	},

	-- ######
	-- Muzzle: SUPPRESSOR
	-- ######
	{	dependencies = {"owo_suppressor_01|owo_suppressor_02"},
		muzzle = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },
	},
	{	dependencies = {"owo_suppressor_01"},
		muzzle2 = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },
	},
	{	dependencies = {"owo_suppressor_02"},
		muzzle2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },
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
		muzzle2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 22, 0), scale = vector3_box(0.64, 1.344, 0.64 ) },
	},
	-- the skinny bayonet. sits on muzzle
	{	dependencies = {"owo_condom_01",
			"autogun_bayonet_03"
		},
		bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.1, 0.66, 1.1 ) },
	},
	
	-- ######
	-- Barrel: WOODEN HELBORE
	-- ######
	{	dependencies = {"owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03",
		},
		barrel = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		barrelac1 = {offset = true, position = vector3_box(0, 0.19, -0.001), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.78, 0.6, 1.188 ) },
	},
	-- Regular Helbore bayonets (barrel parent)
	{   dependencies = {"owo_wood_krieg_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
		bayonet = {offset = true,   position = vector3_box(0, 0.504, -0.03),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },
	-- 	these barrels are shorter
	{   dependencies = {"owo_wood_krieg_02|owo_wood_krieg_03",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = {offset = true,   position = vector3_box(0, 0.428, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },

	-- ######
    -- Bayonet: HISTORICAL PACK
    -- ######
	-- M7
    {   dependencies = {"owo_bayonet_m7_01",
            "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.566, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = {"owo_bayonet_m7_01",
            "!owo_wood_krieg_01","!owo_wood_krieg_02","!owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = {"owo_bayonet_m7_01"},
        bayonetac1 = {offset = true, position = vector3_box(0, 0.002, -0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        bayonetac2 = {offset = true, position = vector3_box(0, -0.012, -0.002), rotation = vector3_box(0, 90, 180), scale = vector3_box(0.25, 0.825, 0.25) },
    },
	-- Seitengewehr 98
	{   dependencies = {"owo_bayonet_seitengewehr",
            "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.575, -0.06), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
    {   dependencies = {"owo_bayonet_seitengewehr",
            "!owo_wood_krieg_01","!owo_wood_krieg_02","!owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.575, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
    {   dependencies = {"owo_bayonet_seitengewehr"},
        bayonetac1 = {offset = true, position = vector3_box(0, 0.002, -0.036), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.46, 0.25) },
        bayonetac2 = {offset = true, position = vector3_box(0, 0, -0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.6, 0.2) },
    },
	-- Épée baïonnette modèle 1886 Lebel
	{   dependencies = {"owo_bayonet_03",
            "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
    {   dependencies = {"owo_bayonet_03",
            "!owo_wood_krieg_01","!owo_wood_krieg_02","!owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
    {   dependencies = {"owo_bayonet_03"},
        bayonetac1 = {offset = true, position = vector3_box(0, 0.025, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.1, 1.35, 0.6) },
        bayonetac2 = {offset = true, position = vector3_box(0, 0.06, 0.014), rotation = vector3_box(180, 0, 180), scale = vector3_box(0.25, 0.09, 0.245) },
    },
	
	-- ######
	-- Bayonet: UNDERBARREL GRENADE LAUNCHER
	-- ######
	{	dependencies = {"owo_m203"},
		bayonet = {offset = true, position = vector3_box(0, -0.172, -0.118), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
		bayonetac1 = {offset = true, position = vector3_box(0, 0.138, 0.), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1, 1 ) },
		bayonetac2 = {offset = true, position = vector3_box(0, -0.046, 0), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.4, 1.4, 0.8 ) },
		bayonetac3 = {offset = true, position = vector3_box(0, 0.06, 0.042), rotation = vector3_box(-180, 0, -180), scale = vector3_box(1, 0.51, 0.51 ) },
		bayonetac4 = {offset = true, position = vector3_box(0, -0.112, -0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.28, 0.69 ) },
	},

	-- ######
	-- Sight: APERTURE SIGHTS
	-- ######
	-- U notch ladder sights
	{	dependencies = {"owo_rear_sight_01",},
		no_scope_offset =   { position = vector3_box(0, 0, -0.01), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { position = vector3_box(0, 0, -0.01), rotation = vector3_box(0, 0, 0)},
		sight = {offset = true, position = vector3_box(0, 0.012, 0.117), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
	},
	--	ladder up
	{	dependencies = {"owo_rear_sight_02",},
		no_scope_offset =   { position = vector3_box(0, 0, -0.02), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { position = vector3_box(0, 0, -0.02), rotation = vector3_box(0, 0, 0)},
		sight = {offset = true, position = vector3_box(0, 0.012, 0.117), rotation = vector3_box(-45, 90, 135), scale = vector3_box(0.23, 0.5, 0.1 ) },
	},
	{	dependencies = {"owo_rear_sight_01|owo_rear_sight_02",},
		owosightac1 = {offset = true, position = vector3_box(0, 0.044, -0.086), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.05, 0.3, 0.1 ) },
		owosightac2 = {offset = true, position = vector3_box(0, 0.044, 0.094), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.05, 0.3, 0.1 ) },
		owosightac3 = {offset = true, position = vector3_box(-0.012, 0.012, -0.088), rotation = vector3_box(0, 90, -90), scale = vector3_box(0.55, 0.7, 0.42 ) },
		owosightac4 = {offset = true, position = vector3_box(-0.012, 0.012, 0.088), rotation = vector3_box(0, 90, 90), scale = vector3_box(0.55, 0.7, 0.42 ) },
	},
	-- MAS49 irons
	{	dependencies = {"owo_rear_sight_o_01|owo_rear_sight_o_02",},
		no_scope_offset =   { position = vector3_box(0, 0, -0.0062), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { position = vector3_box(0, 0, -0.0062), rotation = vector3_box(0, 0, 0)},
		sight = {offset = true, position = vector3_box(0, 0.004, 0.1158), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
		owosightac1 = {offset = true, position = vector3_box(-0.044, 0.006, 0.002), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.1, 1.8 ) },
		owosightac5 = {offset = true, position = vector3_box(0.012, -0.042, 0.232), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.44, 1.85, 2.82 ) },
	},
	{	dependencies = {"owo_rear_sight_o_01",},
		owosightac2 = {offset = true, position = vector3_box(-0.044, 0.006, 0.002), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.1, 1.8 ) },
		owosightac3 = {offset = true, position = vector3_box(-0.012, 0.012, -0.088), rotation = vector3_box(0, 90, -90), scale = vector3_box(0.55, 0.7, 0.3 ) },
		owosightac4 = {offset = true, position = vector3_box(-0.012, 0.012, 0.088), rotation = vector3_box(0, 90, 90), scale = vector3_box(0.55, 0.7, 0.3 ) },
	},
	--	MAS49/56
	{	dependencies = {"owo_rear_sight_o_02",},
		owosightac2 = {offset = true, position = vector3_box(-0.022, -0.028, -0.072), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.08, 0.042, 0.24 ) },
		owosightac3 = {offset = true, position = vector3_box(-0.026, 0.002, 0.054), rotation = vector3_box(0, 0, -90), scale = vector3_box(1.35, 0.23, 0.66 ) },
		owosightac4 = {offset = true, position = vector3_box(-0.026, 0.002, -0.054), rotation = vector3_box(180, 0, -90), scale = vector3_box(1.35, 0.23, 0.66 ) },
	},

	-- ######
	-- Sight: SOVIET PU SCOPE
	-- ######
	{	dependencies = {"owo_pu_scope_01|owo_pu_scope_02",},
		no_scope_offset =   { position = vector3_box(0, -0.002, -0.0467), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { position = vector3_box(0, -0.002, -0.0467), rotation = vector3_box(0, 0, 0)},
		sight = 	  {offset = true, position = vector3_box(0, -0.002, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
		owosightac1 = {offset = true, position = vector3_box(0, 0.192 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
		-- Crosshair
		owosightac2 = {offset = true, position = vector3_box(0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
		owosightac3 = {offset = true, position = vector3_box(-0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
		owosightac4 = {offset = true, position = vector3_box(0, 0.08, -0.031), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.25, 0.1 ) },
		-- Knobs
		owosightac5 = {offset = true, position = vector3_box(0, 0.13, 0.03), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.5, 0.5, 0.2 ) },
		owosightac6 = {offset = true, position = vector3_box(0.03, 0.095, 0), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.5, 0.5, 0.2 ) },
	},
	-- Riser alightment
	{	dependencies = {"owo_pu_scope_01",},
		owosight2 = {offset = true, position = vector3_box(0, 0.104, 0.1), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
	},
	{	dependencies = {"owo_pu_scope_02",},
		owosight2 = {offset = true, position = vector3_box(0, 0.064, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.67, 0.4, 0.5 ) },
	},

	-- #########################
	-- Hiding unused helpers
	-- #########################
	-- Gripstock
	{	dependencies = {"!owo_gripstock_recon_01", "!owo_gripstock_recon_02", "!owo_gripstock_recon_03"},
		stockac = {hide_mesh = {	{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
	},
	-- Muzzle
	{	dependencies = {"!owo_suppressor_01", "!owo_suppressor_02", 
			"!owo_condom_01",
		},
		muzzle2 = { hide_mesh = {     {"muzzle2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Rear Mag
	{	dependencies = {"!owo_lasgun_magazine_rear_01"},
		rearmag = {hide_mesh = {     {"rearmag", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Wood Barrel
	{	dependencies = {"!owo_wood_krieg_01", "!owo_wood_krieg_02", "!owo_wood_krieg_03",},
		barrelac1 = {hide_mesh = {     {"barrelac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Bayonet
	{	dependencies = {"!owo_m7_bayonet_01", "!owo_bayonet_seitengewehr", "!owo_bayonet_03", "!owo_m203"},
		bayonetac1 = {hide_mesh = {     {"bayonetac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		bayonetac2 = {hide_mesh = {     {"bayonetac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	{	dependencies = {"!owo_m203"},
		bayonetac3 = {hide_mesh = {     {"bayonetac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		bayonetac4 = {hide_mesh = {     {"bayonetac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Receivers
	{	dependencies = {"!owo_bolt_helbore_01", "!owo_bolt_helbore_02", "!owo_bolt_helbore_03", "!owo_bolt_helbore_04", "!owo_bolt_helbore_05",
			"!owo_helbore_mas49_01", "!owo_helbore_mas49_02", "!owo_helbore_mas49_03", "!owo_helbore_mas49_05",
		},
		receiverac1 = {hide_mesh = {     {"receiverac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		receiverac2 = {hide_mesh = {     {"receiverac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Sights
	{	dependencies = {"!owo_rear_sight_01", "!owo_rear_sight_02", "!owo_rear_sight_o_01", "!owo_rear_sight_o_02",
			"!owo_pu_scope_01", "!owo_pu_scope_02"
		},
		owosightac1 = {hide_mesh = {     {"owosightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosightac2 = {hide_mesh = {     {"owosightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosightac3 = {hide_mesh = {     {"owosightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosightac4 = {hide_mesh = {     {"owosightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	{	dependencies = {"!owo_rear_sight_o_01", "!owo_rear_sight_o_02",
		},
		owosightac5 = {hide_mesh = {     {"owosightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	{	dependencies = {"!owo_pu_scope_01", "!owo_pu_scope_02"},
		owosightac5 = 	{hide_mesh = {     {"owosightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosightac6 = 	{hide_mesh = {     {"owosightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosight2 = 	{hide_mesh = {     {"owosight2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		--[[owosight2ac1 = 	{hide_mesh = {     {"owosight2ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosight2ac2 = 	{hide_mesh = {     {"owosight2ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		]]
	},
})
