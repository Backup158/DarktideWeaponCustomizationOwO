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

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_helbore_gripstock_recon(this_variant)
mod.owo_lasgun_magazine_flat(this_variant)
mod.owo_lasgun_magazine_rear(this_variant)
mod.owo_suppressor(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
	-- Straight Grip and Recon Stock
	{	dependencies = {"owo_gripstock_recon_01"},
		stock = {
			offset = true, 
			position = vector3_box(0, -0.04, 0.065),
			scale = vector3_box(1, 1.15, 0.85)
		},
		stockac = {
			offset = true, 
			position = vector3_box(0, 0.02, 0),
			scale = vector3_box(1, 1, 1)
		}
	},
	-- Magazine: Flat
	{	dependencies = {"owo_lasgun_magazine_flat"},
		magazine = {
			offset = true,
			scale = vector3_box(1, 1, 0.5)
		}
	},

	-- Magazine: Rear
	{	dependencies = {
			"owo_lasgun_magazine_rear_01",
			"owo_gripstock_recon_01"
		},
		magazine = {
			offset = true, 
			position = vector3_box(.0, .0, 0), 
			rotation = vector3_box(0, 0, 0), 
			scale = vector3_box(1, 1, 0.7)
		},
		rearmag = {
			offset = true, 
			position = vector3_box(.0, -0.255, 0.035), 
			rotation = vector3_box(0, 0, 0), 
			scale = vector3_box(1, 1, 1), 
		}
	},
	--		Magazine: Rear when there's no recon stock
	{	dependencies = {
		"owo_lasgun_magazine_rear_01"
		},
		magazine = {
			offset = true, 
			position = vector3_box(.0, .0, 0), 
			rotation = vector3_box(0, 0, 0), 
			scale = vector3_box(1, 1, 0.7)
		},
		rearmag = {
			offset = true, 
			position = vector3_box(.0, -0.23, 0.035), 
			rotation = vector3_box(0, 0, 0), 
			scale = vector3_box(0, 0, 0)
		}
	},

	{	dependencies = {
			"owo_suppressor_01|owo_suppressor_02"
		},
		muzzle = {
			offset = true, 
			position = vector3_box(0, 0, 0), 
			rotation = vector3_box(0, 0, 0), 
			scale = vector3_box(1, 1, 1)
		},
	}
})
