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
mod.wc.attachment[this_variant].bayonet2 = {}
mod.wc.attachment[this_variant].bayonet3 = {}
mod.wc.attachment[this_variant].receiverac1 = {}
mod.wc.attachment[this_variant].receiverac2 = {}
mod.wc.attachment[this_variant].owosightac1 = {}
mod.wc.attachment[this_variant].owosightac2 = {}
mod.wc.attachment[this_variant].owosightac3 = {}
mod.wc.attachment[this_variant].owosightac4 = {}

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

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
	-- ######
	-- Straight Grip and Recon Stock
	-- ######
	{	dependencies = {"owo_gripstock_recon_01|owo_gripstock_recon_02|owo_gripstock_recon_03"},
		stock = {offset = true, position = vector3_box(0, -0.04, 0.065), scale = vector3_box(1, 1.15, 0.85 ) },
		stockac = {offset = true, position = vector3_box(0, 0.02, 0),scale = vector3_box(1, 1, 1 ) },
	},

	-- ######
	-- Magazine: Flat
	-- ######
	{	dependencies = {"owo_lasgun_magazine_flat"},
		magazine = {offset = true,scale = vector3_box(1, 1, 0.5 ) },
	},

	-- ######
	-- Magazine: Rear
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
	-- Muzzle: Suppressor
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
	-- Muzzle: Condom
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
    -- Bayonet: M7
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
        bayonet2 = {offset = true, position = vector3_box(0, 0.002, -0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        bayonet3 = {offset = true, position = vector3_box(0, -0.012, -0.002), rotation = vector3_box(0, 90, 180), scale = vector3_box(0.25, 0.825, 0.25) },
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
        bayonet2 = {offset = true, position = vector3_box(0, 0.002, -0.036), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.46, 0.25) },
        bayonet3 = {offset = true, position = vector3_box(0, 0, -0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.6, 0.2) },
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
        bayonet2 = {offset = true, position = vector3_box(0, 0.025, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.1, 1.35, 0.6) },
        bayonet3 = {offset = true, position = vector3_box(0, 0.06, 0.014), rotation = vector3_box(180, 0, 180), scale = vector3_box(0.25, 0.09, 0.245) },
    },

	-- ######
	-- Barrel: Wood
	-- ######
	{	dependencies = {"owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03",
		},
		barrel = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		barrelac1 = {offset = true, position = vector3_box(0, 0.19, -0.001), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.78, 0.6, 1.188 ) },
	},
	-- Regular Helbore bayonets (barrel parent)
	{   dependencies = {"owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = {offset = true,   position = vector3_box(0, 0.564, -0.058),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) }
    },

	-- ######
	-- Receiver: Bolt Action
	-- ######
	{	dependencies = {"owo_bolt_helbore_01|owo_bolt_helbore_02|owo_bolt_helbore_03|owo_bolt_helbore_04|owo_bolt_helbore_05",
		},
		receiver = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		receiverac1 = {offset = true, position = vector3_box(0.025, -0.02, 0.1), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.55, 0.45, 0.55 ) },
		receiverac2 = {offset = true, position = vector3_box(0, 0.028, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.6, 0.6, 1 ) },
	},

	-- ######
	-- Sight: Rear Sight Flip ups
	-- ######
	{	dependencies = {"owo_rear_sight_01",},
		no_scope_offset =   { position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
		sight = {offset = true, position = vector3_box(0, 0.012, 0.125), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
	},
	{	dependencies = {"owo_rear_sight_02",},
		no_scope_offset =   { position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
		scope_offset =      { position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0)},
		sight = {offset = true, position = vector3_box(0, 0.012, 0.125), rotation = vector3_box(-45, 90, 135), scale = vector3_box(0.23, 0.5, 0.1 ) },
	},
	{	dependencies = {"owo_rear_sight_01|owo_rear_sight_02",},
		owosightac1 = {offset = true, position = vector3_box(0.00000013, 0.044, -0.09), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.05, 0.3, 0.1 ) },
		owosightac2 = {offset = true, position = vector3_box(-0.000000255, 0.044, -0.09), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.05, 0.3, 0.1 ) },
		owosightac3 = {offset = true, position = vector3_box(-0.012, 0.06, -0.002), rotation = vector3_box(0, 90, -90), scale = vector3_box(0.55, 0.48, 0.42 ) },
		owosightac4 = {offset = true, position = vector3_box(-0.012, 0.06, 0.002), rotation = vector3_box(0, 90, 90), scale = vector3_box(0.55, 0.48, 0.42 ) },
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
	{	dependencies = {"!owo_m7_bayonet_01", "!owo_bayonet_seitengewehr", "!owo_bayonet_03",},
		bayonet2 = {hide_mesh = {     {"bayonet2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		bayonet3 = {hide_mesh = {     {"bayonet3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Receivers
	{	dependencies = {"!owo_bolt_helbore_01", "!owo_bolt_helbore_02", "!owo_bolt_helbore_03", "!owo_bolt_helbore_04", "!owo_bolt_helbore_05",},
		receiverac1 = {hide_mesh = {     {"receiverac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		receiverac2 = {hide_mesh = {     {"receiverac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	-- Sights
	{	dependencies = {"!owo_rear_sight_01", "!owo_rear_sight_02"},
		owosightac1 = {hide_mesh = {     {"owosightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosightac2 = {hide_mesh = {     {"owosightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosightac3 = {hide_mesh = {     {"owosightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
		owosightac4 = {hide_mesh = {     {"owosightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	}
})
