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
mod.wc.attachment[this_variant].muzzle2 = {}
mod.wc.attachment[this_variant].barrelac = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_lasgun_magazine_flat(this_variant)
mod.owo_suppressor(this_variant)
mod.owo_scab_gunner_muzzle(this_variant)
mod.owo_scab_gunner_barrel(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
	-- ######
	-- Magazine: FLAT LASGUN
	-- ######
	{	dependencies = {
			"owo_lasgun_magazine_flat"
		},
		magazine = {
			offset = true,
			position = vector3_box(0, 0, -0.02),
			scale = vector3_box(1, 1, 0.5)
		}
	},

	-- ######
	-- Muzzle: SUPPRESSOR
	-- ######
	{	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
		muzzle = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2)},
	},
	{	dependencies = {"owo_suppressor_01"},
		muzzle2 = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2)},	
	},
	{	dependencies = {"owo_suppressor_02"},
		muzzle2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2)}
	},
	-- Hiding helpers when not equipped
	{	dependencies = {"!owo_suppressor_01", 
			"!owo_suppressor_02"
		},
		muzzle2 = {hide_mesh = {
				{"muzzle2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			}
		},
	},
	-- the skinny bayonet. sits on muzzle
	{	dependencies = {"owo_suppressor_01|owo_suppressor_02",
			"autogun_bayonet_03"
		},
		bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85)
		},
	},

	-- ######
	-- SCAB GUNNER MUZZLE
	-- ######
	{	dependencies = {
			"owo_scab_gunner_muzzle_01",
			"!owo_scab_gunner_barrel_01"
		},
		muzzle = {
			offset = true, 
			position = vector3_box(0, -0.025, -0.03), 
			rotation = vector3_box(0, 0, 0), 
			scale = vector3_box(1, 1, 1.76)
		},
	},
	{	dependencies = {
			"owo_scab_gunner_muzzle_01",
			"owo_scab_gunner_barrel_01"
		},
		muzzle = {
			offset = true, 
			position = vector3_box(0, 0.033, -0.02), 
			rotation = vector3_box(0, 0, 0), 
			scale = vector3_box(1, 1, 1.76)
		},
	},

	-- ######
	-- SCAB GUNNER BARREL
	-- ######
	{	dependencies = {
			"owo_scab_gunner_barrel_01",
		},
		barrel = {
			offset = true, 
			position = vector3_box(0, -0.08, 0), 
			rotation = vector3_box(0, 0, 0), 
			scale = vector3_box(1, 1, 1)
		},
		barrelac = {
			offset = true, 
			position = vector3_box(0, 0.11, -0.018), 
			rotation = vector3_box(-90, 0, 0), 
			scale = vector3_box(1, 0.885, 1.5)
		},
	},
	-- Hiding Unused
	{	dependencies = {
			"!owo_scab_gunner_barrel_01"
		},
		barrelac = {
			hide_mesh = {
				{"barrelac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			}
		},
	},
})
