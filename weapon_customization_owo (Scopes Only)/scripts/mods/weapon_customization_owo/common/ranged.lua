local mod = get_mod("weapon_customization_owo")

-- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

-- #############################
-- WAKEUP
-- GRABABRUSHANDPUTALITTLEMAKEUP
-- HARRYDIDJAPUCHERNAMEINTHE
-- TABLE
--
-- New slots are added with: mod.wc.add_custom_attachments.<slot> = "<slot>s"
--	Where slots is the name of a table containing a list of parts to append to the slot table. This is to follow the same format that the MT Plugin uses (just to keep the code slightly prettier)
--	<slot> + 's'. unless it's a numbered thing, then it's <slot> + 's' + <number> instead of <slot, including number> + 's'
-- Syn followed the same formatting for his new attachments
-- Adding to an existing slot: mod.mt.table_append(mod.wc.<slot>s, { <parts> })
-- 	Slots that already exist in the base mod do not need this. It's handled by the inject_attachments function
-- I'm not gonna follow that format. I will use <slot> + '_list'
-- #############################
-- SIGHT
mod.mt.table_append(mod.wc.sights, {
	"owo_holosight_01_02_z1",
	"owo_holosight_01_02_z2",
	"owo_holosight_01_02ss_z1",
	"owo_holosight_02_02_z1",
	"owo_holosight_02_02_z2",
	"owo_holosight_02_02ss_z1",
	"owo_holosight_02_02ss_z2",
	"owo_acog_sight_01f",
	"owo_acog_sight_01", 
	"owo_acog_sight_01f_z1",
	"owo_acog_sight_01_z1", 
	"owo_acog_sight_02f", 
	"owo_acog_sight_02", 
	"owo_acog_sight_02f_z1", 
	"owo_acog_sight_02_z1",
	"owo_susat_01", 
	"owo_susat_01_z1", 
	"owo_susat_02",
	"owo_susat_02_z1",
})
mod.mt.table_append(mod.wc.scopes, {
	"axe_pommel_01",
	"axe_pommel_02",
	"axe_pommel_03",
	"axe_pommel_04",
	"axe_pommel_05",
	"axe_pommel_06",
})
mod.wc.sniper_zoom_levels.axe_pommel_01 = 50	-- Literally no zoom, same as hipfire.
mod.wc.sniper_zoom_levels.axe_pommel_02 = 40 	-- 1x, this is around default
mod.wc.sniper_zoom_levels.axe_pommel_03 = 33 	-- 1.25x
mod.wc.sniper_zoom_levels.axe_pommel_04 = 27 	-- 1.5x
mod.wc.sniper_zoom_levels.axe_pommel_05 = 22 	-- 1.75x
mod.wc.sniper_zoom_levels.axe_pommel_06 = 20 	-- 2x

mod.wc.add_custom_attachments.sightac1 = "sightac1_list"
mod.wc.sightac1_list = {
	"owo_holosight_empty_01",
	"owo_holosight_helper_01",
	"owo_rear_sight_empty_01",
	"owo_rear_sight_ac1_01",
	"owo_pu_scope_helper_01",
	"owo_m16_sight_helper_01",
	"owo_acog_sight_helper_01",
	"owo_susat_ac1_01",
	"owo_rear_sight_ak_empty_01",
	"owo_rear_sight_ak_ac1_01",
}
--[[ sightac 2-4 covered by MT. it uses sightac for sightac1 but i hate that naming system so fuck that
mod.wc.add_custom_attachments.sightac2 = "sightac2s"
mod.wc.sightac2s = {
	"owo_holosight_empty_02",
	"owo_holosight_helper_02",
	"owo_rear_sight_empty_02",
	"owo_rear_sight_ac2_01",
	"owo_rear_sight_ac2_02",
	"owo_rear_sight_ac2_03",
	"owo_pu_scope_helper_02",
	"owo_m16_sight_helper_02",
	"owo_acog_sight_helper_02",
	"owo_susat_ac2_01",
}
mod.wc.add_custom_attachments.sightac3 = "sightac3s"
mod.wc.sightac3s = {
	"owo_holosight_empty_03",
	"owo_holosight_helper_03",
	"owo_rear_sight_empty_03",
	"owo_rear_sight_ac3_01",
	"owo_pu_scope_helper_03",
	"owo_m16_sight_helper_03",
	"owo_acog_sight_helper_03",
	"owo_susat_ac3_01",
}
mod.wc.add_custom_attachments.sightac4 = "sightac4s"
mod.wc.sightac4s = {
	"owo_holosight_empty_04",
	"owo_holosight_helper_04",
	"owo_rear_sight_empty_04",
	"owo_rear_sight_ac4_01",
	"owo_pu_scope_helper_04",
	"owo_m16_sight_helper_04",
	"owo_acog_sight_helper_04", -- SUSAT reuses this
}
]]
-- In the MT Plugin, these tables are sightacs#, instead of sightac#s
mod.mt.table_append(mod.wc.sightacs2, {
	"owo_holosight_empty_02",
	"owo_holosight_helper_02",
	"owo_rear_sight_empty_02",
	"owo_rear_sight_ac2_01",
	"owo_rear_sight_ac2_02",
	"owo_rear_sight_ac2_03",
	"owo_pu_scope_helper_02",
	"owo_m16_sight_helper_02",
	"owo_acog_sight_helper_02",
	"owo_susat_ac2_01",
	"owo_rear_sight_ak_empty_02",
	"owo_rear_sight_ak_ac2_01",
})
mod.mt.table_append(mod.wc.sightacs3, {
	"owo_holosight_empty_03",
	"owo_holosight_helper_03",
	"owo_rear_sight_empty_03",
	"owo_rear_sight_ac3_01",
	"owo_pu_scope_helper_03",
	"owo_m16_sight_helper_03",
	"owo_acog_sight_helper_03",
	"owo_susat_ac3_01",
})
mod.mt.table_append(mod.wc.sightacs4, {
	"owo_holosight_empty_04",
	"owo_holosight_helper_04",
	"owo_rear_sight_empty_04",
	"owo_rear_sight_ac4_01",
	"owo_pu_scope_helper_04",
	"owo_m16_sight_helper_04",
	"owo_acog_sight_helper_04", -- SUSAT reuses this
})
mod.wc.add_custom_attachments.sightac5 = "sightac5_list"
mod.wc.sightac5_list = {
	"owo_rear_sight_empty_05",
	"owo_rear_sight_ac5_01",
	"owo_pu_scope_empty_05",
	"owo_pu_scope_helper_05",
	"owo_m16_sight_helper_05",
	"owo_acog_sight_helper_05",
	"owo_susat_ac5_01",
}
mod.wc.add_custom_attachments.sightac6 = "sightac6_list"
mod.wc.sightac6_list = {
	"owo_rear_sight_empty_06",
	"owo_rear_sight_ac6_01",
	"owo_pu_scope_empty_06",
	"owo_pu_scope_helper_06",
	"owo_m16_sight_helper_06",
	"owo_acog_sight_helper_06",
	"owo_susat_ac7_01",
}
mod.wc.add_custom_attachments.sightac7 = "sightac7_list"
mod.wc.sightac7_list = {
	"owo_m16_sight_empty_07",
	"owo_m16_sight_helper_07",
	"owo_acog_sight_helper_07",
}
-- SIGHT_2
mod.mt.table_append(mod.wc.reflex_sights, { 	-- For some reason this is what sight_2 is called
	"owo_alt_viewmodel_empty",
	"owo_alt_viewmodel_01",
	"owo_alt_viewmodel_02",
	"owo_alt_viewmodel_03",
	"owo_alt_viewmodel_04",
	"owo_alt_viewmodel_05",
})
mod.wc.add_custom_attachments.sight_secondary = "sight_secondary_list"
mod.wc.sight_secondary_list = {
	"owo_holosight_empty2",
	"owo_holosight_sight_secondary_01",
	"owo_pu_scope_riser_01"
}
mod.wc.add_custom_attachments.sight_secondary_ac1 = "sight_secondary_ac1_list"
mod.wc.sight_secondary_ac1_list = {
	"owo_holosight_empty2_01",
	"owo_holosight_sight_secondary_helper_01",
	--"owo_pu_scope2_helper_01",
}
mod.wc.add_custom_attachments.sight_secondary_ac2 = "sight_secondary_ac2_list"
mod.wc.sight_secondary_ac2_list = {
	"owo_holosight_empty2_02",
	"owo_holosight_sight_secondary_helper_02",
	--"owo_pu_scope2_helper_02",
}

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
-- Sight: Rear sights with flip up. Ladder Aperture Sights
--	Helbore style only
function mod.owo_rear_sight(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight" or type, {
		{id = "owo_rear_sight_01", name = "OwO Aperture Sights, U Notch"},
		{id = "owo_rear_sight_02", name = "OwO Aperture, U Notch (Up)"},
		{id = "owo_rear_sight_o_00", name = "OwO _n_"},
		{id = "owo_rear_sight_o_01", name = "OwO _n_ (thicc)"},
		{id = "owo_rear_sight_o_02", name = "OwO MAS49/56 Irons"},
		{id = "owo_rear_sight_o_03", name = "OwO MAS49 (starving)"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1" or type, {
		{id = "owo_rear_sight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac1_01", name = "Flip sight range select 1", no_randomize = true},
		{id = "owo_rear_sight_ac1_02", name = "MAS49 Peep 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2" or type, {
		{id = "owo_rear_sight_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac2_01", name = "Flip sight range select 2", no_randomize = true},
		{id = "owo_rear_sight_ac2_02", name = "MAS49 Peep 2", no_randomize = true},
		{id = "owo_rear_sight_ac2_03", name = "MAS49/56 Feet", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3" or type, {
		{id = "owo_rear_sight_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac3_01", name = "Rear Aperture 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4" or type, {
		{id = "owo_rear_sight_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac4_01", name = "Rear Aperture 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5" or type, {
		{id = "owo_rear_sight_empty_05", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac5_01", name = "MAS49 sight seat", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6" or type, {
		{id = "owo_rear_sight_empty_06", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac6_01", name = "MAS49 bulge", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- the base sight is the ladder
		owo_rear_sight_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_01", sightac2 = "owo_rear_sight_ac2_01",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
			}
		},
		owo_rear_sight_02 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_01", sightac2 = "owo_rear_sight_ac2_01",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
			}
		},
		-- mas sight
		owo_rear_sight_o_00 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_02", sightac2 = "owo_rear_sight_ac2_02",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
				sightac5 = "owo_rear_sight_ac5_01", sightac6 = "owo_rear_sight_empty",
			}
		},
		owo_rear_sight_o_01 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_02", sightac2 = "owo_rear_sight_ac2_02",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
				sightac5 = "owo_rear_sight_ac5_01", sightac6 = "owo_rear_sight_ac6_01",
			}
		},
		-- mas 49/56
		owo_rear_sight_o_02 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_02", sightac2 = "owo_rear_sight_empty",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
				sightac5 = "owo_rear_sight_ac5_01", sightac6 = "owo_rear_sight_ac6_01",
			}
		},
		owo_rear_sight_o_03 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_02", sightac2 = "owo_rear_sight_empty",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
				sightac5 = "owo_rear_sight_ac5_01", sightac6 = "owo_rear_sight_empty",
			}
		},
		-- ### Helper Parts ###
		-- ac1
		-- 	ladder sight select
		owo_rear_sight_ac1_01 = {
			model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_02", type = "sightac1", 
			mesh_move = false, parent = "sight",
		},
		-- 	mas peep
		owo_rear_sight_ac1_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "sightac1", 
			mesh_move = false, parent = "sight",
		},
		-- ac2
		-- 	ladder sight select
		owo_rear_sight_ac2_01 = {
			model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_02", type = "sightac2", 
			mesh_move = false, parent = "sight",
		},
		-- 	mas peep
		owo_rear_sight_ac2_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac2", 
			mesh_move = false, parent = "sight",
		},
		-- 	mas 49/56 bulgey wulgey (fake)
		owo_rear_sight_ac2_03 = {
			model = _item_melee.."/heads/power_maul_head_03", type = "sightac2", 
			mesh_move = false, parent = "sight",
		},
		-- ac3
		owo_rear_sight_ac3_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "sightac3", 
			mesh_move = false, parent = "sight",
		},
		-- ac4
		owo_rear_sight_ac4_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "sightac4", 
			mesh_move = false, parent = "sight",
		},
		-- ac5
		-- 	mas seat/feet
		owo_rear_sight_ac5_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "sightac5", 
			mesh_move = false, parent = "sight",
		},
		-- ac6
		-- 	mas bulgey wulgey (real)
		owo_rear_sight_ac6_01 = {
			model = _item_melee.."/heads/power_maul_head_03", type = "sightac6", 
			mesh_move = false, parent = "sight",
		},
		-- ### Empty ###
		owo_rear_sight_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_empty_05 = {
			model = "", type = "sightac5", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_empty_06 = {
			model = "", type = "sightac6", 
			mesh_move = false, parent = "sight"
		},
	})
end

-- Sight: Kalashnikov Rear Sights
--	I made 1 and 2 before noticing thte range select was already a part in game lmfao
function mod.owo_rear_sight_ak(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight" or type, {
		{id = "owo_rear_sight_ak_01", name = "OwO AK Irons"},
		{id = "owo_rear_sight_ak_02", name = "OwO AK Irons w/ Dust Cover"},
		{id = "owo_rear_sight_ak_03", name = "OwO AK Scuffed Irons"},
		{id = "owo_rear_sight_ak_04", name = "OwO AK Scuffed Irons2"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1" or type, {
		{id = "owo_rear_sight_ak_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ak_ac1_01", name = "AK Range select 1", no_randomize = true},
		{id = "owo_rear_sight_ak_ac1_02", name = "AK Range select 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2" or type, {
		{id = "owo_rear_sight_ak_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ak_ac2_01", name = "AK Range select 2", no_randomize = true},
		{id = "owo_rear_sight_ak_ac2_02", name = "AK Range select 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3" or type, {
		{id = "owo_rear_sight_ak_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ak_ac3_01", name = "Rear Aperture 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4" or type, {
		{id = "owo_rear_sight_ak_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ak_ac4_01", name = "Rear Aperture 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5" or type, {
		{id = "owo_rear_sight_ak_empty_05", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ak_ac5_01", name = "AK Bottom notch", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6" or type, {
		{id = "owo_rear_sight_ak_empty_06", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ak_ac6_01", name = "AK Dust Cover", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- Avtomat Kalashnikov
		--	Using the elevation ladder ALREADY IN THE GAME
		owo_rear_sight_ak_01 = {
			model = _item_ranged.."/sights/autogun_rifle_sight_01", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ak_ac1_02", sightac2 = "owo_rear_sight_ak_ac2_02",
				sightac3 = "owo_rear_sight_ak_ac3_01", sightac4 = "owo_rear_sight_ak_ac4_01",
				sightac5 = "owo_rear_sight_ak_ac5_01",
			},
			hide_mesh = {
				{"sight", 2,3,4,5,6} -- one of these is the front rail lol
			},
		},
		owo_rear_sight_ak_02 = {
			model = _item_ranged.."/sights/autogun_rifle_sight_01", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ak_ac1_02", sightac2 = "owo_rear_sight_ak_ac2_02",
				sightac3 = "owo_rear_sight_ak_ac3_01", sightac4 = "owo_rear_sight_ak_ac4_01",
				sightac5 = "owo_rear_sight_ak_ac5_01", sightac6 = "owo_rear_sight_ak_ac6_01",
			},
			hide_mesh = {
				{"sight", 2,3,4,5,6} -- one of these is the front rail lol
			},
		},
		--	Ladder for the elevation
		owo_rear_sight_ak_03 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ak_ac1_01", sightac2 = "owo_rear_sight_ak_ac2_01",
				sightac3 = "owo_rear_sight_ak_ac3_01", sightac4 = "owo_rear_sight_ak_ac4_01",
				sightac5 = "owo_rear_sight_ak_ac5_01",
			}
		},
		owo_rear_sight_ak_04 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { sightac1 = "owo_rear_sight_ak_ac1_01", sightac2 = "owo_rear_sight_ak_ac2_01",
				sightac3 = "owo_rear_sight_ak_ac3_01", sightac4 = "owo_rear_sight_ak_ac4_01",
				sightac5 = "owo_rear_sight_ak_ac5_01", sightac6 = "owo_rear_sight_ak_ac6_01",
			}
		},
		-- ### Helper Parts ###
		-- ac1
		--	AK range select
		owo_rear_sight_ak_ac1_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sightac1", 
			mesh_move = false, parent = "sight",
		},
		owo_rear_sight_ak_ac1_02 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "sightac1", 
			mesh_move = false, parent = "sight",
		},
		-- ac2
		--	AK range select
		owo_rear_sight_ak_ac2_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sightac2", 
			mesh_move = false, parent = "sight",
		},
		owo_rear_sight_ak_ac2_02 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "sightac2", 
			mesh_move = false, parent = "sight",
		},
		-- ac3
		--	AK iron notch
		owo_rear_sight_ak_ac3_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "sightac3", 
			mesh_move = false, parent = "sight",
		},
		-- ac4
		--	AK iron notch
		owo_rear_sight_ak_ac4_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "sightac4", 
			mesh_move = false, parent = "sight",
		},
		-- ac5
		--	ak rear butt
		owo_rear_sight_ak_ac5_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "sightac5", 
			mesh_move = false, parent = "sight",
		},
		-- ac6
		--	ak dust cover
		owo_rear_sight_ak_ac6_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = "sightac6", 
			mesh_move = false, parent = "sight",
		},
		-- ### Empty ###
		owo_rear_sight_ak_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_ak_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_ak_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_ak_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_ak_empty_05 = {
			model = "", type = "sightac5", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_ak_empty_06 = {
			model = "", type = "sightac6", 
			mesh_move = false, parent = "sight"
		},
	})
end

-- Sight: M16 Carry Handle
function mod.owo_m16_sight(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight", {
		{id = "owo_m16_sight_01", name = "OwO M16 Carry Sight"},
		{id = "owo_m16_sight_02", name = "OwO M16 Carry Sight (No Rear Elevation Wheel)"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1", {
		{id = "owo_m16_sight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_01", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2", {
		{id = "owo_m16_sight_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_02", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3", {
		{id = "owo_m16_sight_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_03", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4", {
		{id = "owo_m16_sight_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_04", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5", {
		{id = "owo_m16_sight_empty_05", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_05", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6", {
		{id = "owo_m16_sight_empty_06", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_06", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac7", {
		{id = "owo_m16_sight_empty_07", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_07", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_m16_sight_01  = {
			model = _item_ranged.."/recievers/lasgun_rifle_elysian_receiver_01", type = "sight", 
			mesh_move = false, parent = 'receiver', hide_mesh = {{"sight", 1}}, -- hiding the stock. I stole this from MT
			automatic_equip = { sightac1 = "owo_m16_sight_helper_01", sightac2 = "owo_m16_sight_helper_02", 
				sightac3 = "owo_m16_sight_helper_03", 
				sightac4 = "owo_m16_sight_helper_04", sightac5 = "owo_m16_sight_helper_05", 
				sightac6 = "owo_m16_sight_helper_06", sightac7 = "owo_m16_sight_helper_07", 
			}
		},
		owo_m16_sight_02  = {
			model = _item_ranged.."/recievers/lasgun_rifle_elysian_receiver_02", type = "sight", 
			mesh_move = false, parent = 'receiver', hide_mesh = {{"sight", 5}},
			automatic_equip = { sightac1 = "owo_m16_sight_helper_01", sightac2 = "owo_m16_sight_helper_02", 
				sightac3 = "owo_m16_sight_helper_03", 
				sightac4 = "owo_m16_sight_helper_04", sightac5 = "owo_m16_sight_helper_05", 
				sightac6 = "owo_m16_sight_helper_06", sightac7 = "owo_m16_sight_empty_07", 
			}
		},
		-- ### Helper Parts ###
		-- Carry handle side rails
		owo_m16_sight_helper_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = 'sightac1',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_helper_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = 'sightac2',
			mesh_move = false, parent = 'sight'
		},
		-- Rear sight aperture
		owo_m16_sight_helper_03 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = 'sightac3',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_helper_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = 'sightac4',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_helper_05 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = 'sightac5',
			mesh_move = false, parent = 'sight'
		},
		-- Windage Knob
		owo_m16_sight_helper_06 = {
			model = _item_melee.."/heads/human_power_maul_head_05", type = 'sightac6',
			mesh_move = false, parent = 'sight'
		},
		-- Rear Elevation Knob
		-- seems to be a newer addition on a2+
		owo_m16_sight_helper_07 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = 'sightac7',
			mesh_move = false, parent = 'sight'
		},
		-- ### Empty ###
		owo_m16_sight_empty_01 = {
			model = "", type = 'sightac1',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_empty_02 = {
			model = "", type = 'sightac2',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_empty_03 = {
			model = "", type = 'sightac3',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_empty_04 = {
			model = "", type = 'sightac4',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_empty_05 = {
			model = "", type = 'sightac5',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_empty_06 = {
			model = "", type = 'sightac6',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_empty_07 = {
			model = "", type = 'sightac7',
			mesh_move = false, parent = 'sight'
		},
		
	})
end

-- Sight: Holographic Sights + Magnifiers
--		EOTech HWS (Holographic Weapon Sight)
--		Vortex Razor AMG UH-1
function mod.owo_holosight(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight" or type, {
		{id = "owo_holosight_01_01", name = "OwO EOTech"},
		{id = "owo_holosight_01_02_z1", name = "OwO EOTech+Magnifier (1.25x)"},
		{id = "owo_holosight_01_02_z2", name = "OwO EOTech+Magnifier (1.75x)"},
		{id = "owo_holosight_01_03", name = "OwO EOTech+Magnifier (Side)"},
		{id = "owo_holosight_01_01ss", name = "OwO EOTech (Short)"},
		{id = "owo_holosight_01_02ss_z1", name = "OwO EOTech + M (Short, 1.25x)"},
		{id = "owo_holosight_01_02ss_z2", name = "OwO EOTech + M (Short, 1.75x)"},
		{id = "owo_holosight_01_03ss", name = "OwO EOTech + M/s (Short)"},
		{id = "owo_holosight_02_01", name = "OwO Razor Sight"},
		{id = "owo_holosight_02_02_z1", name = "OwO Razor + M (1.25x)"},
		{id = "owo_holosight_02_02_z2", name = "OwO Razor + M (1.75x)"},
		{id = "owo_holosight_02_03", name = "OwO Razor + M/s"},
		{id = "owo_holosight_02_01ss", name = "OwO Razor (Short)"},
		{id = "owo_holosight_02_02ss_z1", name = "OwO Razor + M (Short, 1.25x)"},
		{id = "owo_holosight_02_02ss_z2", name = "OwO Razor + M (Short, 1.75x)"},
		{id = "owo_holosight_02_03ss", name = "OwO Razor + M/s (Short)"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1" or type, {
		{id = "owo_holosight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_helper_01", name = "OwO EOTech'vesa sight container 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2" or type, {
		{id = "owo_holosight_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_helper_02", name = "OwO EOTech'vesa sight container 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3" or type, {
		{id = "owo_holosight_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_helper_03", name = "OwO EOTech'vesa base bulge", no_randomize = true},
		{id = "owo_holosight_helper_03_02", name = "OwO Razor'vesa front scope hood", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4" or type, {
		{id = "owo_holosight_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_helper_04", name = "OwO EOTech'vesa base", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary" or type, {
		{id = "owo_holosight_empty2", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_sight_secondary_01", name = "OwO EOTech Magnifier Stand", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary_ac1" or type, {
		{id = "owo_holosight_empty2_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_sight_secondary_helper_01", name = "OwO EOTech Magnifier 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary_ac2" or type, {
		{id = "owo_holosight_empty2_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_sight_secondary_helper_02", name = "OwO EOTech Magnifier 2", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- EOTech
		-- purposefully did not hide housing. the seating makes up the for skinny centre of the ogryn grip
		owo_holosight_01_01 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03", sightac4 = "owo_holosight_helper_04",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		owo_holosight_01_02_z1 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight",
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holosight_01_02_z2 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight",
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holosight_01_03 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		-- Compact Versions that you can't aim with
		owo_holosight_01_01ss = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		owo_holosight_01_02ss_z1 = {
			--model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		owo_holosight_01_02ss_z2 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		owo_holosight_01_03ss = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		-- Vortex Razor Sight
		owo_holosight_02_01 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03_02", sightac4 = "owo_holosight_helper_04",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		owo_holosight_02_02_z1 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03_02", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holosight_02_02_z2 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03_02", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holosight_02_03 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03_02", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		owo_holosight_02_01ss = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03_02", sightac4 = "owo_holosight_helper_04",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		owo_holosight_02_02ss_z1 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03_02", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holosight_02_02ss_z2 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03_02", sightac4 = "owo_holosight_helper_04",
				sight_secondary = "owo_holosight_sight_secondary_01", sight_secondary_ac1 = "owo_holosight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holosight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holosight_02_03ss = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holosight_helper_01", sightac2 = "owo_holosight_helper_02", 
				sightac3 = "owo_holosight_helper_03_02", sightac4 = "owo_holosight_helper_04",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1}
			},
		},
		-- ### Helper Parts ###
		owo_holosight_helper_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "sightac1", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_helper_02 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_helper_03 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_helper_03_02 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_03", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_helper_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sightac4",
			mesh_move = false, parent = "sight"
		},
		owo_holosight_sight_secondary_01 = {
			model = _item_melee.."/grips/2h_chain_sword_grip_01", type = "sight_secondary",
			mesh_move = false, parent = "sight"
		},
		owo_holosight_sight_secondary_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "sight_secondary_ac1",
			mesh_move = false, parent = "sight"
		},
		owo_holosight_sight_secondary_helper_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "sight_secondary_ac2",
			mesh_move = false, parent = "sight"
		},
		-- ### Empty ###
		owo_holosight_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_empty2 = {
			model = "", type = "sight_secondary", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_empty2_01 = {
			model = "", type = "sight_secondary_ac1", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_empty2_02 = {
			model = "", type = "sight_secondary_ac2", 
			mesh_move = false, parent = "sight"
		},
	})
end

-- Sight: Telescopic Sights
--		Trijicon ACOG (Advanced Combat Optical Gunsight), SUSAT (Small Unit Small Arms, Trilux - L9A1), Night Vision 1 (Sightmark Wraith HD), Night Vision 2 (Sightmark Photon XT)
--		KNOWN BUG: SUSAT on recon/ilas main receiver steals the laser (but not the volleygun)
--			Thief is the ac2/3, ak muzzles in the back
function mod.owo_telescopic_sight(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight" or type, {
		{id = "owo_acog_sight_01f", name = "OwO ACOG (1.25x)"},
		{id = "owo_acog_sight_01", name = "OwO ACOG (Backwards, 1.25x)"},
		{id = "owo_acog_sight_01f_z1", name = "OwO ACOG (1.75x)"},
		{id = "owo_acog_sight_01_z1", name = "OwO ACOG (B, 1.75x)"},
		{id = "owo_acog_sight_02f", name = "OwO ACOG/RMR Combo (1.25x)"},
		{id = "owo_acog_sight_02", name = "OwO ACOG/RMR (B, 1.25x)"},
		{id = "owo_acog_sight_02f_z1", name = "OwO ACOG/RMR (1.75x)"},
		{id = "owo_acog_sight_02_z1", name = "OwO ACOG/RMR (B, 1.75x)"},
		{id = "owo_acog_sight_02f_top", name = "OwO ACOG/RMR (RDS Aim)"},
		{id = "owo_acog_sight_02_top", name = "OwO ACOG/RMR (B, RDS)"},
		{id = "owo_susat_01", name = "OwO SUSAT (1.25x)"},
		{id = "owo_susat_01_z1", name = "OwO SUSAT (1.75x)"},
		{id = "owo_susat_01_ps", name = "OwO SUSAT (Point Shooting)"},
		{id = "owo_susat_02", name = "OwO SUSAT + Red Dot (1.25x)"},
		{id = "owo_susat_02_z1", name = "OwO SUSAT + RDS (1.75x)"},
		{id = "owo_susat_02_top", name = "OwO SUSAT + RDS (RDS Aim)"},
		--{id = "owo_nv_01", name = "OwO Night Vision Scope 1"},
		--{id = "owo_nv_01_ir", name = "OwO Night Vision 1 + Infrared"},
		--{id = "owo_nv_02", name = "OwO Night Vision Scope 2"},
		--{id = "owo_nv_02_ir", name = "OwO Night Vision 2 + IR"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1" or type, {
		{id = "owo_acog_sight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_01", name = "OwO ACOG'vesa sight container 1", no_randomize = true},
		{id = "owo_susat_ac1_01", name = "SUSAT'vesa Cylinder thing", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2" or type, {
		{id = "owo_acog_sight_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_02", name = "OwO ACOG'vesa rear sight container 1", no_randomize = true},
		{id = "owo_susat_ac2_01", name = "SUSAT'vesa rear scope 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3" or type, {
		{id = "owo_acog_sight_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_03", name = "OwO ACOG'vesa rear sight container 2", no_randomize = true},
		{id = "owo_susat_ac3_01", name = "SUSAT'vesa rear scope 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4" or type, {
		{id = "owo_acog_sight_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_04", name = "OwO ACOG'vesa Base", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5" or type, {
		{id = "owo_acog_sight_empty_05", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_05", name = "OwO ACOG'vesa Knob", no_randomize = true},
		{id = "owo_susat_ac5_01", name = "SUSAT'vesa reticle 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6" or type, {
		{id = "owo_acog_sight_empty_06", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_06", name = "OwO ACOG'vesa Knob", no_randomize = true},
		{id = "owo_susat_ac6_01", name = "SUSAT'vesa reticle 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac7" or type, {
		{id = "owo_acog_sight_empty_07", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_07", name = "ACOG'vesa Cable", no_randomize = true},
		{id = "owo_susat_ac7_01", name = "SUSAT'vesa Front Scope 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary" or type, {
		{id = "owo_acog_sight_empty2", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_sight_secondary_01", name = "OwO ACOG RMR", no_randomize = true},
	})
	--[[mod.inject_attachments_owo(variant_id, "sight_secondary_ac1" or type, {
		{id = "owo_acog_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_sight_secondary_helper_01", name = "OwO ACOG Magnifier 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary_ac2" or type, {
		{id = "owo_acog_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_sight_secondary_helper_02", name = "OwO ACOG Magnifier 2", no_randomize = true},
	})]]

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_acog_sight_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_01f = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_01_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_01f_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02f = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02f_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02_top = {
			model = _item_melee.."/pommels/axe_pommel_02", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01", -- sight_secondary_ac1 = "owo_acog_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_acog_sight_sight_secondary_helper_02"
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02f_top = {
			model = _item_melee.."/pommels/axe_pommel_02", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01", -- sight_secondary_ac1 = "owo_acog_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_acog_sight_sight_secondary_helper_02"
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		-- SUSAT
		owo_susat_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_empty", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sightac7 = "owo_susat_ac7_01", sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_01_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_empty", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sightac7 = "owo_susat_ac7_01", sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_01_ps = {
			model = _item_melee.."/pommels/axe_pommel_01", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_susat_ac1_01", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sightac7 = "owo_susat_ac7_01", sight_2 = "owo_alt_viewmodel_06",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_02 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_empty", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sightac7 = "owo_susat_ac7_01", sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_02_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_empty", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sightac7 = "owo_susat_ac7_01", sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_02_top = {
			model = _item_melee.."/pommels/axe_pommel_02", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_susat_ac1_01", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sightac7 = "owo_susat_ac7_01", sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		-- ### Helper Parts ###
		-- AC1
		-- 	ACOG: Front of scope
		owo_acog_sight_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "sightac1", 
			mesh_move = false, parent = "sight"
		},
		-- 	SUSAT: Cylinder thing
		owo_susat_ac1_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sightac1", 
			mesh_move = false, parent = "sightac4"
		},
		-- AC2, 3
		-- 	ACOG: Rear of scope
		owo_acog_sight_helper_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_helper_03 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		--	SUSAT: Rear of scope
		owo_susat_ac2_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "sightac2", 
			--model = "", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_susat_ac3_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "sightac3", 
			--model = "", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		-- AC4
		-- 	Base
		owo_acog_sight_helper_04 = {
			model = _item_melee.."/grips/hatchet_grip_04", type = "sightac4",
			mesh_move = false, parent = "sight"
		},
		-- AC5, 6
		-- 	ACOG: Knobs
		owo_acog_sight_helper_05 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "sightac5",
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_helper_06 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "sightac6",
			mesh_move = false, parent = "sight"
		},
		-- SUSAT: Reticle
		owo_susat_ac5_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "sightac5", 
			mesh_move = false, parent = "sight"
		},
		owo_susat_ac6_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "sightac6", 
			mesh_move = false, parent = "sight"
		},
		-- AC7
		-- Cable
		owo_acog_sight_helper_07 = {
			model = _item_melee.."/full/force_staff_full_01", type = "sightac7",
			mesh_move = false, parent = "sight"
		},
		owo_susat_ac7_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac7",
			mesh_move = false, parent = "sight"
		},
		-- Sight_Secondary
		-- RMR on top
		owo_acog_sight_sight_secondary_01 = {
			model = _item_ranged.."/sights/reflex_sight_02", type = "sight_secondary",
			mesh_move = false, parent = "sight"
		},
		-- ### Empty ###
		owo_acog_sight_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_empty_05 = {
			model = "", type = "sightac5", 
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_empty_06 = {
			model = "", type = "sightac6", 
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_empty_07 = {
			model = "", type = "sightac7", 
			mesh_move = false, parent = "sight"
		},
		owo_acog_sight_empty2 = {
			model = "", type = "sight_secondary", 
			mesh_move = false, parent = "sight"
		},
	})
end

-- Sight: Soviet PU scope
--		Sight rings are too mf fat
function mod.owo_pu_scope(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight" or type, {
		{id = "owo_pu_scope_01", name = "OwO Soviet PU Scope, Riser 1"},
		{id = "owo_pu_scope_02", name = "OwO Soviet PU Scope, Riser 1b"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1" or type, {
		{id = "owo_pu_scope_empty_01", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_01", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2" or type, {
		{id = "owo_pu_scope_empty_02", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_02", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3" or type, {
		{id = "owo_pu_scope_empty_03", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_03", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4" or type, {
		{id = "owo_pu_scope_empty_04", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_04", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5" or type, {
		{id = "owo_pu_scope_empty_05", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_05", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6" or type, {
		{id = "owo_pu_scope_empty_06", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_06", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac7" or type, {
		{id = "owo_pu_scope_empty_07", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_07", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary" or type, {
		{id = "owo_pu_scope_empty2", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_riser_01", name = "PU Scope Riser", no_randomize = true},
	})
	--[[mod.inject_attachments_owo(variant_id, "sight_secondary_ac1" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope"},
		{id = "owo_pu_scope2_helper_01", name = "PU Scope Riser'vesa"},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary_ac2" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope"},
		{id = "owo_pu_scope2_helper_02", name = "PU Scope Riser'vesa"},
	})]]

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_pu_scope_01 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_pu_scope_helper_01", sightac2 = "owo_pu_scope_helper_02",
				sightac3 = "owo_pu_scope_helper_03", sightac4 = "owo_pu_scope_helper_04",
				sightac5 = "owo_pu_scope_helper_05", sightac6 = "owo_pu_scope_helper_06",
				sightac7 = "owo_pu_scope_helper_07",
				sight_secondary = "owo_pu_scope_riser_01", sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}, 
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}, 
			},
		},
		owo_pu_scope_02 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_pu_scope_helper_01", sightac2 = "owo_pu_scope_helper_02",
				sightac3 = "owo_pu_scope_helper_03", sightac4 = "owo_pu_scope_helper_04",
				sightac5 = "owo_pu_scope_helper_05", sightac6 = "owo_pu_scope_helper_06",
				sightac7 = "owo_pu_scope_helper_07",
				sight_secondary = "owo_pu_scope_riser_01", sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- ### Helper Parts ###
		owo_pu_scope_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac1", 
			mesh_move = false, parent = "receiver"
		},
		-- Crosshair
		owo_pu_scope_helper_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_helper_03 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_helper_04 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "sightac4", 
			mesh_move = false, parent = "sight"
		},
		-- Knobs
		owo_pu_scope_helper_05 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "sightac5", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_helper_06 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "sightac6", 
			mesh_move = false, parent = "sight"
		},
		-- Scope again
		owo_pu_scope_helper_07 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac7", 
			mesh_move = false, parent = "sight"
		},
		-- Riser
		owo_pu_scope_riser_01 = {
			model = _item_melee.."/grips/falchion_grip_03", type = "sight_secondary", 
			mesh_move = false, parent = "receiver",
			--automatic_equip = { sight_secondary_ac1 = "owo_pu_scope2_helper_01", sight_secondary_ac2 = "owo_pu_scope2_helper_02",}
		},
		--[[ Too thick
		owo_pu_scope2_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "sight_secondary_ac1", 
			mesh_move = false, parent = "sight",
		},
		owo_pu_scope2_helper_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "sight_secondary_ac2", 
			mesh_move = false, parent = "sight",
		},]]
		-- ### Empty ###
		owo_pu_scope_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_pu_scope_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_empty_05 = {
			model = "", type = "sightac5", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_empty_06 = {
			model = "", type = "sightac6", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_empty_07 = {
			model = "", type = "sightac7", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_empty2 = {
			model = "", type = "sight_secondary", 
			mesh_move = false, parent = "sight"
		},
	})
	
end

-- Sight_2: Reticle only
-- fuck it. i'll just use the ones mt already added and hide the mesh in the weapon classes
--[[function mod.owo_reticle_helper(variant_id)

	-- Adding to existing table, where empty sight is already included
	mod.inject_attachments_owo(variant_id, "sight_2", {
		-- {id = "owo_reticle_helper_empty", name = "Empty sight_2"},
		{id = "owo_reticle_helper_01", name = "Reticle 1 (·)"},
		{id = "owo_reticle_helper_02", name = "Reticle 2 [·]"},
		{id = "owo_reticle_helper_03", name = "Reticle 3 [+]"},
	})

	mod.inject_models(variant_id, {
		--owo_reticle_helper_empty = {
		--	model = "", type = "sight_2", 
		--	parent = "sight"
		--},
		owo_reticle_helper_01 = {
			model = _item_ranged.."/sights/reflex_sight_01", type = "sight_2", 
			parent = "sight", hide_mesh = {{"sight_2", 6}}, -- for some reason this is diff
		},
		owo_reticle_helper_02 = {
			model = _item_ranged.."/sights/reflex_sight_02", type = "sight_2", 
			parent = "sight", hide_mesh = {{"sight_2", 5}}, 
		},
		owo_reticle_helper_03 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight_2", 
			parent = "sight", hide_mesh = {{"sight_2", 5}},
		},
	})
end
]]

-- Sight_2: Alternative viewmodel
-- 	Avoid on flamer_p1_m1 (and prob brauto)
-- 	Instead of using empty mesh, use hidden mesh so children can show up
--	Used for compatibility with Scope lenses (they get parented to sight_2 when sight_1 is hidden)
function mod.owo_alt_viewmodel(variant_id)
	-- Adding to existing table, where empty sight is already included
	mod.inject_attachments_owo(variant_id, "sight_2", {
		{id = "owo_alt_viewmodel_empty", name = "Empty sight_2"},
		-- Fuck renaming
		{id = "owo_alt_viewmodel_06", name = "Point Shooting"},
		{id = "owo_alt_viewmodel_01", name = "Doom Aim (Low)"},
		{id = "owo_alt_viewmodel_02", name = "Doom Aim (Close)"},
		{id = "owo_alt_viewmodel_03", name = "Doom Aim (Low/Close)"},
		{id = "owo_alt_viewmodel_04", name = "CS:S Zoom"},
		{id = "owo_alt_viewmodel_05", name = "Hipfire"},
	})

	mod.inject_models(variant_id, {
		owo_alt_viewmodel_empty = {
			model = "", type = "sight_2", 
			parent = "sight",
		},
		owo_alt_viewmodel_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sight_2", 
			parent = "sight",
			hide_mesh = {
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_alt_viewmodel_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sight_2", 
			parent = "sight",
			hide_mesh = {
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_alt_viewmodel_03 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sight_2", 
			parent = "sight",
			hide_mesh = {
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_alt_viewmodel_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sight_2", 
			parent = "sight",
			hide_mesh = {
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_alt_viewmodel_05 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sight_2", 
			parent = "sight",
			hide_mesh = {
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_alt_viewmodel_06 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sight_2", 
			parent = "sight",
			hide_mesh = {
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
	})
end

--[[
-- #############################################################################################################
-- #############################################################################################################
-- #############################################################################################################
TEMPLATES
mod.wc.add_custom_attachments.KUMQUAT = "KUMQUATs"
mod.wc.KUMQUATs = {
	""
}

function mod.owo_<NAME>(variant_id, type)
	mod.inject_attachments_owo(variant_id, "" or type, {
		{id = "owo_", name = "OwO "},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_ = {
			model = _item_ranged.."", type = "", 
			mesh_move = false, parent = "",
			automatic_equip = {
				 = "",
			},
		},
		-- ### Helper Parts ###
		owo_ = {
			model = , type = "", 
			mesh_move = false, parent = "",
		},
		-- ### Empty ###
		owo_ _empty = {
			model = "", type = "", 
			mesh_move = false, parent = ""
		},
	})
end

mod.mt.inject_fixes(this_variant, {
    {   dependencies = {"owo_",
        },
        grip = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
    },
})
]]
