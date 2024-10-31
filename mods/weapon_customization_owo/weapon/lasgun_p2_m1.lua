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
mod.wc.attachment[this_variant].stockac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
-- Straight Grip and Recon Stock
mod.owo_helbore_gripstock_recon_01(this_variant)
-- Flat Mag
mod.owo_lasgun_magazine_01_flat(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
	-- Straight Grip and Recon Stock
	{	dependencies = {"owo_gripstock_recon_01"},
		stock = {
			offset = true, 
			position = vector3_box(0, 0, 0.05)
		},
		stockac = {
			offset = true, 
			position = vector3_box(0, 0.02, 0),
			scale = vector3_box(1, 0.8, 1)
		},
		stockac2 = {
			offset = true, 
			position = vector3_box(0, -1, 0)
		}
	},
	-- Magazine: Flat
	{	dependencies = {"owo_lasgun_magazine_flat"},
		magazine = {
			offset = true,
			scale = vector3_box(1, 1, 0.5)
		}
	},
})
