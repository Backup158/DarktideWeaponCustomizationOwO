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
mod.wc.attachment[this_variant].stockac = {} -- MT didn't add this to Helbore yet
mod.wc.attachment[this_variant].stockac2 = {} -- MT didn't add this to Helbore yet
mod.wc.attachment[this_variant].rearmag = {}
mod.wc.attachment[this_variant].muzzle_2 = {} -- MT didn't add this to Helbore yet
mod.wc.attachment[this_variant].barrelshroud = {}	-- Syn didn't add this to Helbore yet
mod.wc.attachment[this_variant].bayonetac1 = {}
mod.wc.attachment[this_variant].bayonetac2 = {}
mod.wc.attachment[this_variant].bayonetac3 = {}
mod.wc.attachment[this_variant].bayonetac4 = {}
mod.wc.attachment[this_variant].bayonetac5 = {}
mod.wc.attachment[this_variant].receiverac1 = {}
mod.wc.attachment[this_variant].receiverac2 = {}
mod.wc.attachment[this_variant].sightac1 = {}
--[[ covered by MT plugin
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
mod.owo_helbore_gripstock_recon(this_variant)
mod.owo_magazine_flat(this_variant)
mod.owo_lasgun_magazine_rear(this_variant)

mod.owo_wood_krieg(this_variant)

mod.owo_suppressor(this_variant)
mod.owo_condom(this_variant)

mod.owo_bayonet(this_variant)
mod.owo_underbarrel_gl(this_variant)

mod.owo_bolt_action(this_variant)
mod.owo_helbore_mas49(this_variant)

mod.owo_alt_viewmodel(this_variant)
mod.owo_rear_sight(this_variant)
mod.owo_holosight(this_variant)
mod.owo_telescopic_sight(this_variant)
mod.owo_pu_scope(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
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
	},
	{	dependencies = {"owo_helbore_mas49_01_s",
		},
		receiver = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.69, 1, 1 ) },
	},
	{	dependencies = {"owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s",
		},
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
	{	dependencies = {"owo_autogun_magazine_flat_03"},
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
		muzzle_2 = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },
	},
	{	dependencies = {"owo_suppressor_02"},
		muzzle_2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2 ) },
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
	-- Barrel: WOODEN HELBORE
	-- ######
	{	dependencies = {"owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03",
		},
		barrel = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		barrelshroud = {offset = true, position = vector3_box(0, 0.19, -0.001), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.78, 0.6, 1.188 ) },
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
	-- 	Helbores
	-- 		Ultra shorty flintlock helbore
	{   dependencies = {"owo_bayonet_m7_01",
			"barrel_19",
		},
		bayonet = {offset = true, position = vector3_box(0, 0.335, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
	},
	--		Short helbore barrels
	{   dependencies = {"owo_bayonet_m7_01",
			"barrel_09|barel_12|barrel_13",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.415, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	-- 		Medium Helbore barrels
	{   dependencies = {"owo_bayonet_m7_01",
			"barrel_11|owo_wood_krieg_02",
		},
		bayonet = {offset = true, position = vector3_box(0, 0.435, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
	},
	-- 		Regular long Helbore barrels
	{   dependencies = {"owo_bayonet_m7_01",
			"barrel_10|barrel_12|barrel_13|barrel_20|owo_wood_krieg_01|owo_wood_krieg_03|hlasgun_barrel_05b",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.566, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	-- Infantry Lasgun Barrels
	-- 		Short Lasgun
	{   dependencies = {"owo_bayonet_m7_01",
			"barrel_03",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.25, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	--		Medium/Long iLas
	{   dependencies = {"owo_bayonet_m7_01",
			"barrel_01|barrel_02|barrel_04|barrel_05|barrel_06|barrel_07|barrel_08|barrel_021",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.336, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	-- Recon
	{   dependencies = {"owo_bayonet_m7_01",
			"barrel_014|barrel_015|barrel_016|barrel_017|barrel_018",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.235, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	--	Default case
    {   dependencies = {"owo_bayonet_m7_01"},
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = {"owo_bayonet_m7_01"},
        bayonetac1 = {offset = true, position = vector3_box(0, 0.002, -0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        bayonetac2 = {offset = true, position = vector3_box(0, -0.012, -0.002), rotation = vector3_box(0, 90, 180), scale = vector3_box(0.25, 0.825, 0.25) },
    },
	-- Seitengewehr 98
	-- 	Helbores
	-- 		Ultra shorty flintlock helbore
	{   dependencies = {"owo_bayonet_seitengewehr",
			"barrel_19",
		},
		bayonet = {offset = true, position = vector3_box(0, 0.335, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
	},
	--		Short helbore barrels
	{   dependencies = {"owo_bayonet_seitengewehr",
			"barrel_09|barel_12|barrel_13",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.415, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	-- 		Medium Helbore barrels
	{   dependencies = {"owo_bayonet_seitengewehr",
			"barrel_11|owo_wood_krieg_02",
		},
		bayonet = {offset = true, position = vector3_box(0, 0.435, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
	},
	-- 		Regular long Helbore barrels
	{   dependencies = {"owo_bayonet_seitengewehr",
			"barrel_10|barrel_12|barrel_13|barrel_20|owo_wood_krieg_01|owo_wood_krieg_03|hlasgun_barrel_05b",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.575, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	-- Infantry Lasgun Barrels
	-- 		Short Lasgun
	{   dependencies = {"owo_bayonet_seitengewehr",
			"barrel_03",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.25, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	--		Medium/Long iLas
	{   dependencies = {"owo_bayonet_seitengewehr",
			"barrel_01|barrel_02|barrel_04|barrel_05|barrel_06|barrel_07|barrel_08|barrel_021",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.326, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
	-- Recon
	{   dependencies = {"owo_bayonet_seitengewehr",
			"barrel_014|barrel_015|barrel_016|barrel_017|barrel_018",
		},
        bayonet = {offset = true, position = vector3_box(0, 0.235, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
    {   dependencies = {"owo_bayonet_seitengewehr"},
        bayonet = {offset = true, position = vector3_box(0, 0.575, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
    {   dependencies = {"owo_bayonet_seitengewehr"},
        bayonetac1 = {offset = true, position = vector3_box(0, 0.002, -0.036), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.46, 0.25) },
        bayonetac2 = {offset = true, position = vector3_box(0, 0, -0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.6, 0.2) },
    },
	-- Épée baïonnette modèle 1886 Lebel
	{   dependencies = {"owo_bayonet_epee",
            "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
    {   dependencies = {"owo_bayonet_epee"},
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
    {   dependencies = {"owo_bayonet_epee"},
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
	{	dependencies = {"owo_gp25"},
        bayonet =       {offset = true, position = vector3_box(0, -0.072, -0.112), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies = {"owo_gp25"},
        bayonetac1 =    {offset = true, position = vector3_box(0, -0.022, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.875, 1, 0.875 ) },
        bayonetac2 =    {offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(90, 0, 180), scale = vector3_box(1.1, 1.1, 1.3 ) },
        bayonetac3 =    {offset = true, position = vector3_box(0, 0.06, 0.03), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 0.566, 0.21 ) },
        bayonetac4 =    {offset = true, position = vector3_box(0, 0.142, 0.004), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.0, 0.6, 0.35 ) },
        bayonetac5 =    {offset = true, position = vector3_box(0, 0.158, -0.012), rotation = vector3_box(-173, 0, 0), scale = vector3_box(0.6, 0.7, 0.7 ) },
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
	-- Sight: REAR APERTURE SIGHTS
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
		sightac1 = {offset = true, position = vector3_box(0, 0.044, -0.086), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.05, 0.3, 0.1 ) },
		sightac2 = {offset = true, position = vector3_box(0, 0.044, 0.094), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.05, 0.3, 0.1 ) },
		sightac3 = {offset = true, position = vector3_box(-0.012, 0.012, -0.088), rotation = vector3_box(0, 90, -90), scale = vector3_box(0.55, 0.7, 0.42 ) },
		sightac4 = {offset = true, position = vector3_box(-0.012, 0.012, 0.088), rotation = vector3_box(0, 90, 90), scale = vector3_box(0.55, 0.7, 0.42 ) },
	},
	-- MAS49 irons
	{	dependencies = {"owo_rear_sight_o_00|owo_rear_sight_o_01|owo_rear_sight_o_02|owo_rear_sight_o_03",},
		no_scope_offset =   { position = vector3_box(0, 0, -0.0062), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { position = vector3_box(0, 0, -0.0062), rotation = vector3_box(0, 0, 0)},
		sight = {offset = true, position = vector3_box(0, 0.004, 0.1158), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
		sightac1 = {offset = true, position = vector3_box(-0.044, 0.006, 0.002), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.1, 1.8 ) },
	},
	{	dependencies = {"owo_rear_sight_o_00|owo_rear_sight_o_03",},
		sightac5 = {offset = true, position = vector3_box(0, -0.042, 0.1), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.42, 1.11 ) },
		--sightac6 = {hide_mesh = {	{"sightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
	},
	{	dependencies = {"owo_rear_sight_o_01|owo_rear_sight_o_02",},
		sightac5 = {offset = true, position = vector3_box(0.012, -0.042, 0.232), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.44, 1.85, 2.82 ) },
		sightac6 = {offset = true, position = vector3_box(-0.022, -0.028, -0.072), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.08, 0.042, 0.24 ) },
	},
	{	dependencies = {"owo_rear_sight_o_00|owo_rear_sight_o_01",},
		sightac2 = {offset = true, position = vector3_box(-0.044, 0.006, 0.002), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.1, 1.8 ) },
		sightac3 = {offset = true, position = vector3_box(-0.012, 0.012, -0.088), rotation = vector3_box(0, 90, -90), scale = vector3_box(0.55, 0.7, 0.3 ) },
		sightac4 = {offset = true, position = vector3_box(-0.012, 0.012, 0.088), rotation = vector3_box(0, 90, 90), scale = vector3_box(0.55, 0.7, 0.3 ) },
	},
	--	MAS49/56
	{	dependencies = {"owo_rear_sight_o_02|owo_rear_sight_o_03",},
		--sightac2 = {hide_mesh = {	{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
		sightac3 = {offset = true, position = vector3_box(-0.026, 0.002, 0.054), rotation = vector3_box(0, 0, -90), scale = vector3_box(1.35, 0.23, 0.66 ) },
		sightac4 = {offset = true, position = vector3_box(-0.026, 0.002, -0.054), rotation = vector3_box(180, 0, -90), scale = vector3_box(1.35, 0.23, 0.66 ) },
	},
	
	-- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    -- EOTech
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_03" },
        sightac1 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac2 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =       { offset = true, position  = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
    },
    {   dependencies = { "owo_holosight_01_01" },
        sight =             { offset = true, position  = vector3_box(0, 0.03, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies = { "owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_03" },
        sight =             { offset = true, position  = vector3_box(0, 0.1, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
	
		sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
	},
    {   dependencies = { "owo_holosight_01_02_z1|owo_holosight_01_02_z2" },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0, -0.154, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0, -0.0162, 0.034), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    
        lens =              {offset = false, parent = "sight", position = vector3_box(0, -0.048, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 1}},
	    lens_2 =            {offset = false, parent = "sight", position = vector3_box(0, -0.12, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 2}},
	},
    {   dependencies = { "owo_holosight_01_03" },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0.042, -0.154, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    
        lens =              {offset = false, parent = "sight", position = vector3_box(0.042, -0.048, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.52), data = {lens = 1}},
	    lens_2 =            {offset = false, parent = "sight", position = vector3_box(0.042, -0.12, 0.01), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.52), data = {lens = 2}},
	},
    --  Aligning sights to crosshair
	{   dependencies = { "owo_holosight_01_01|owo_holosight_01_02_z1|owo_holosight_01_02_z2"},
        scope_offset =      { position = vector3_box(0, -0.0001, -0.0373), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    {   dependencies = { "owo_holosight_01_03"},
        scope_offset =      { position = vector3_box(0, -0.0001, -0.0373), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },

	-- ######
    -- Sight: Telescopic Sights
    -- ######
	--  -------------------------------------------
    -- 	Trijicon ACOG
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
	{   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top" },
        sight =             { offset = true, position  = vector3_box(0, 0.078, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },

		lens =              { offset = false, parent = "sight", position = vector3_box(0, 0.032, 0.0325), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0, -0.099, 0.0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =           { offset = true, position  = vector3_box(0, -0.066, 0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
	{   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight =             { offset = true, position  = vector3_box(0, 0.1, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },

		lens =              { offset = false, parent = "sight", position = vector3_box(0, 0.032, 0.0325), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0, -0.099, 0.0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =           { offset = true, position  = vector3_box(0, 0.072, 0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --  ACOG with RMR on top
    {   dependencies = { "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight_secondary =       { offset = true, position  = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
	--  -------------------------------------------
    --  SUSAT
	--  -------------------------------------------
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight =             { offset = true, position  = vector3_box(0, 0.01, 0.160), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        -- cylinder thing
        sightac1 =       { offset = true, position  = vector3_box(0, 0.096, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.6, 1.47, 1.27), data = {sightac1 = 1} },
        -- Rear
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
    -- SUSAT with red dot
    {   dependencies = { "owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
            sight_secondary =     { offset = true, position  = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
	--  -------------------------------------------
    --  Aligning sights to crosshair
	--  -------------------------------------------
	--      Aiming with main sight
    --          Backwards
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1" },
        scope_offset =      { position = vector3_box(0, -0.0001, -0.0435), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --          Forwards (Default)
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1" },
        scope_offset =      { position = vector3_box(0, -0.0001, -0.0435), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
	{   dependencies = { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1" },
        scope_offset =      { position = vector3_box(0, -0.0001, -0.0405), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --      Aiming with RMR on ACOG
    {   dependencies = { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.1175), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },
    --      Aiming with RMR on SUSAT
    {   dependencies = { "owo_susat_02_top" },
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.1035), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },

	-- ######
	-- Sight: SOVIET PU SCOPE
	-- ######
	{	dependencies = {"owo_pu_scope_01|owo_pu_scope_02",},
		no_scope_offset =   { position = vector3_box(0, -0.002, -0.0467), rotation = vector3_box(0, 0, 0), lense_transparency = true},
		scope_offset =      { position = vector3_box(0, -0.002, -0.0467), rotation = vector3_box(0, 0, 0), lense_transparency = true},

		lens =              {offset = false, parent = "sight", position = vector3_box(0, 0.162, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 1}},
	    lens_2 =            {offset = false, parent = "sight", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},

		sight = 	  {offset = true, position = vector3_box(0, -0.002, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
		sightac1 = {offset = true, position = vector3_box(0, 0.192 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
		-- Crosshair
		sightac2 = {offset = true, position = vector3_box(0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
		sightac3 = {offset = true, position = vector3_box(-0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
		sightac4 = {offset = true, position = vector3_box(0, 0.08, -0.031), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.25, 0.1 ) },
		-- Knobs
		sightac5 = {offset = true, position = vector3_box(0, 0.13, 0.03), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.5, 0.5, 0.2 ) },
		sightac6 = {offset = true, position = vector3_box(0.03, 0.095, 0), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.5, 0.5, 0.2 ) },
	},
	-- Riser alignment
	{	dependencies = {"owo_pu_scope_01",},
		sight_secondary = {offset = true, position = vector3_box(0, 0.104, 0.1), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
	},
	{	dependencies = {"owo_pu_scope_02",},
		sight_secondary = {offset = true, position = vector3_box(0, 0.064, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.67, 0.4, 0.5 ) },
	},

	-- #########################
	-- Hiding unused helpers
	-- #########################
	-- Gripstock
	{	dependencies = {"owo_gripstock_grip_01a"},
		stockac = {hide_mesh = {	{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
	},
	-- Muzzle
	{	dependencies = {"owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03|owo_suppressor_helper_04|owo_condom_helper_01"},
		muzzle_2 = { hide_mesh = {     {"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Rear Mag
	{	dependencies = {"owo_lasgun_magazine_rear_child_01"},
		rearmag = {hide_mesh = {     {"rearmag", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Barrels
	{	dependencies = {"owo_wood_krieg_ac1_01",},
		barrelshroud = {hide_mesh = {     {"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Bayonet
	{	dependencies = {"owo_dreg_bayonet_rear_01|owo_bayonet_m7_helper_01|owo_bayonet_seitengewehr_helper_01|owo_bayonet_epee_helper_01|owo_m203_helper_01|owo_gp25_helper_01"},
        bayonetac1 = {hide_mesh = {     {"bayonetac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_bayonet_m7_helper_02|owo_bayonet_seitengewehr_helper_02|owo_bayonet_epee_helper_02|owo_m203_helper_02|owo_gp25_helper_02"},
        bayonetac2 = {hide_mesh = {     {"bayonetac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_m203_helper_03|owo_gp25_helper_03"},
        bayonetac3 = {hide_mesh = {     {"bayonetac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_m203_helper_04|owo_gp25_helper_04"},
        bayonetac4 = {hide_mesh = {     {"bayonetac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
	{	dependencies = {"owo_gp25_helper_05"},
		bayonetac5 = {hide_mesh = {     {"bayonetac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Receivers
	{	dependencies = {"owo_bolt_helbore_bolt_01|owo_helbore_mas49_ass"},
		receiverac1 = {hide_mesh = {     {"receiverac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	{	dependencies = {"owo_bolt_helbore_bolt_02|owo_helbore_mas49_knob"},
		receiverac2 = {hide_mesh = {     {"receiverac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Sights
	{   dependencies = {"owo_rear_sight_ac1_01|owo_rear_sight_ac1_02|owo_holosight_helper_01|owo_rear_sight_ac1_01|owo_pu_scope_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01"},
        sightac1 = { hide_mesh = {{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_rear_sight_ac2_01|owo_rear_sight_ac2_02|owo_rear_sight_ac2_03|owo_holosight_helper_02|owo_rear_sight_ac2_01|owo_rear_sight_ac2_02|owo_rear_sight_ac2_03|owo_pu_scope_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01"},
        sightac2 = { hide_mesh = {{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_rear_sight_ac3_01|owo_holosight_helper_03|owo_rear_sight_ac3_01|owo_pu_scope_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01"},
        sightac3 = { hide_mesh = {{"sightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_rear_sight_ac4_01|owo_holosight_helper_04|owo_rear_sight_ac4_01|owo_pu_scope_helper_04|owo_acog_sight_helper_04"},
        sightac4 = { hide_mesh = {{"sightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac5_01|owo_rear_sight_ac5_01|owo_pu_scope_helper_05|owo_acog_sight_helper_05|owo_susat_ac5_01"},
        sightac5 = { hide_mesh = {{"sightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac6_01|owo_rear_sight_ac6_01|owo_pu_scope_helper_06|owo_acog_sight_helper_06|owo_susat_ac6_01"},
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
