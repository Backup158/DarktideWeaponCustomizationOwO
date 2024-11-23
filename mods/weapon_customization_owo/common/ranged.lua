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
-- #############################
-- MUZZLE
mod.wc.add_custom_attachments.muzzle2 = "muzzle2List"
mod.wc.muzzle2List = {
	"owo_suppressor_helper_empty",
	"owo_suppressor_helper_01",
	"owo_suppressor_helper_02",
	"owo_condom_helper_empty",
	"owo_condom_helper_01",
}
-- BARREL
mod.wc.add_custom_attachments.owobarrelex = "owobarrelexList"
mod.wc.owobarrelexList = {
	"owo_revolver_shotgun_barrel_empty",
	"owo_revolver_shotgun_barrel_01",
	"owo_revolver_shotgun_barrel_04",
	"owo_revolver_shotgun_barrel_05",
	"owo_revolver_shotgun_barrel_06",
	"owo_revolver_shotgun_barrel_08",
	"owo_revolver_shotgun_barrel_09",
}
mod.wc.add_custom_attachments.barrelac = "barrelacList"
mod.wc.barrelacList = {
	"owo_scab_gunner_barrelac_empty",
	"owo_scab_gunner_barrelac_01"
}
mod.wc.add_custom_attachments.barrelac1 = "barrelac1List"
mod.wc.barrelac1List = {
	"owo_wood_krieg_empty",
	"owo_wood_krieg_ac1_01",
}
mod.wc.add_custom_attachments.barrelshroud = "barrelshroudList"
mod.wc.barrelshroudList = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroud_01",
	"owo_m16_empty",
	"owo_m16_barrelshroud_a1",
	"owo_m16_barrelshroud_a1_02",
	"owo_m16_barrelshroud_a2",
	"owo_m16_barrelshroud_t_a1",
	"owo_m16_barrelshroud_t_a1_02",
	"owo_m16_barrelshroud_t_a2",
	"owo_m16_barrelshroud_n_a1",
	"owo_m16_barrelshroud_n_a1_02",
	"owo_m16_barrelshroud_n_a2",
	"owo_bistol_shotgun_barrel_short_empty", 
	"owo_bistol_shotgun_barrel_short_01",
	"owo_bistol_shotgun_barrel_short_04",
	"owo_bistol_shotgun_barrel_short_05",
	"owo_bistol_shotgun_barrel_short_06",
	"owo_bistol_shotgun_barrel_short_08",
	"owo_bistol_shotgun_barrel_short_09",
}
--[[mod.wc.add_custom_attachments.barrelshroudac = "barrelshroudacList"
mod.wc.barrelshroudacList = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroudac_01"
}]]
mod.wc.add_custom_attachments.barrelshroudac2 = "barrelshroudac2List"
mod.wc.barrelshroudac2List = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroudac2_01",
	"owo_m16_empty",
	"owo_m16_barrelshroudac2_01",
}
mod.wc.add_custom_attachments.barrelshroudac3 = "barrelshroudac3List"
mod.wc.barrelshroudac3List = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroudac3_01",
	"owo_m16_empty",
	"owo_m16_barrelshroudac3_a1",
}
mod.wc.add_custom_attachments.barrelshroudac4 = "barrelshroudac4List"
mod.wc.barrelshroudac4List = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroudac4_01",
	"owo_m16_sight_empty",
	"owo_m16_sight_helper_04",
}
mod.wc.add_custom_attachments.barrelshroudac5 = "barrelshroudac5List"
mod.wc.barrelshroudac5List = {
	"owo_m16_sight_empty",
	"owo_m16_sight_helper_05",
}
mod.wc.add_custom_attachments.barrelshroudac6 = "barrelshroudac6List"
mod.wc.barrelshroudac6List = {
	"owo_m16_sight_empty",
	"owo_m16_sight_helper_06",
}
-- BAYONET
mod.wc.add_custom_attachments.bayonetac1 = "bayonetac1List"
mod.wc.bayonetac1List = {
	"owo_dreg_bayonet_empty",
	"owo_dreg_bayonet_rear_01",
	"owo_bayonet_empty",
	"owo_bayonet_m7_helper_01",
	"owo_bayonet_seitengewehr_helper_01",
	"owo_underbarrel_gl_empty",
	"owo_m203_helper_01",
}
mod.wc.add_custom_attachments.bayonetac2 = "bayonetac2List"
mod.wc.bayonetac2List = {
	"owo_bayonet_empty",
	"owo_bayonet_m7_helper_00",
	"owo_underbarrel_gl_empty",
	"owo_m203_helper_02",
}
mod.wc.add_custom_attachments.bayonetac3 = "bayonetac3List"
mod.wc.bayonetac3List = {
	"owo_bayonet_empty",
	"owo_dreg_bayonet_rear_01",
	"owo_underbarrel_gl_empty",
	"owo_m203_helper_03",
}
mod.wc.add_custom_attachments.bayonetac4 = "bayonetac4List"
mod.wc.bayonetac4List = {
	"owo_bayonet_empty",
	"owo_bayonet_m7_helper_00",
	"owo_underbarrel_gl_empty",
	"owo_m203_helper_04",
}
-- GRIP
mod.wc.add_custom_attachments.grip2 = "grip2List"
mod.wc.grip2List = {
	"owo_fin_grip2_empty",
	"owo_fin_grip2_01"
}
-- MAGAZINE
mod.wc.add_custom_attachments.owomagazineac1 = "owomagazineac1List"
mod.wc.owomagazineac1List = {
	"owo_jungle_mag_empty",
	"owo_jungle_mag_helper_01"
}
mod.wc.add_custom_attachments.owomagazineac2 = "owomagazineac2List"
mod.wc.owomagazineac2List = {
	"owo_jungle_mag_empty",
	"owo_jungle_mag_connector_f_01"
}
mod.wc.add_custom_attachments.owomagazineac3 = "owomagazineac3List"
mod.wc.owomagazineac3List = {
	"owo_jungle_mag_empty",
	"owo_jungle_mag_connector_b_01"
}
mod.wc.add_custom_attachments.owomagazineac4 = "owomagazineac4List"
mod.wc.owomagazineac4List = {
	"owo_jungle_mag_empty",
	"owo_jungle_mag_connector_l_01"
}
mod.wc.add_custom_attachments.owomagazineac5 = "owomagazineac5List"
mod.wc.owomagazineac5List = {
	"owo_jungle_mag_empty",
	"owo_jungle_mag_connector_r_01"
}
-- SIGHT
mod.wc.add_custom_attachments.owosightac1 = "owosightac1List"
mod.wc.owosightac1List = {
	"owo_holosight_empty",
	"owo_holosight_helper_01",
	"owo_rear_sight_empty",
	"owo_rear_sight_ac1_01",
	"owo_pu_scope_helper_01",
	"owo_m16_sight_helper_01",
}
mod.wc.add_custom_attachments.owosightac2 = "owosightac2List"
mod.wc.owosightac2List = {
	"owo_holosight_empty",
	"owo_holosight_helper_02",
	"owo_rear_sight_empty",
	"owo_rear_sight_ac2_01",
	"owo_pu_scope_helper_02",
	"owo_m16_sight_helper_02",
}
mod.wc.add_custom_attachments.owosightac3 = "owosightac3List"
mod.wc.owosightac3List = {
	"owo_holosight_empty",
	"owo_holosight_helper_03",
	"owo_rear_sight_empty",
	"owo_rear_sight_ac3_01",
	"owo_pu_scope_helper_03",
	"owo_m16_sight_helper_03",
}
mod.wc.add_custom_attachments.owosightac4 = "owosightac4List"
mod.wc.owosightac4List = {
	"owo_holosight_empty",
	"owo_holosight_helper_04",
	"owo_rear_sight_empty",
	"owo_rear_sight_ac4_01",
	"owo_pu_scope_helper_04",
	"owo_m16_sight_helper_04",
}
mod.wc.add_custom_attachments.owosightac5 = "owosightac5List"
mod.wc.owosightac5List = {
	"owo_pu_scope_empty",
	"owo_pu_scope_helper_05",
	"owo_m16_sight_helper_05",
}
mod.wc.add_custom_attachments.owosightac6 = "owosightac6List"
mod.wc.owosightac6List = {
	"owo_pu_scope_empty",
	"owo_pu_scope_helper_06",
	"owo_m16_sight_helper_06",
}
mod.wc.add_custom_attachments.owosightac7 = "owosightac7List"
mod.wc.owosightac7List = {
	"owo_m16_sight_empty",
	"owo_m16_sight_helper_07",
}
-- SIGHT2
--[[
mod.table_append(mod.wc.sights, {
	"owo_holosight_01",
	"owo_holosight_02",
	"owo_holosight_03",
})
mod.table_append(mod.wc.scopes, {
	"lasgun_rifle_elysian_muzzle_01",
})
mod.wc.sniper_zoom_levels.lasgun_rifle_elysian_muzzle_01 = 15
]]
mod.wc.add_custom_attachments.owosight2 = "owosight2List"
mod.wc.owosight2List = {
	"owo_holosight_empty",
	"owo_holosight_sight2_01",
	"owo_pu_scope_riser_01"
}
mod.wc.add_custom_attachments.owosight2ac1 = "owosight2ac1List"
mod.wc.owosight2ac1List = {
	"owo_holosight_empty",
	"owo_holosight_sight2_helper_01",
	--"owo_pu_scope2_helper_01",
}
mod.wc.add_custom_attachments.owosight2ac2 = "owosight2ac2List"
mod.wc.owosight2List = {
	"owo_holosight_empty",
	"owo_holosight_sight2_helper_02",
	--"owo_pu_scope2_helper_02",
}
-- RECEIVER
mod.wc.add_custom_attachments.receiverac1 = "receiverac1List"
mod.wc.receiverac1List = {
	"owo_bolt_empty",
	"owo_bolt_helbore_bolt_01",
	"owo_laspistol_grip_mag_helper_empty",
	"owo_laspistol_grip_mag_helper_01",
}
mod.wc.add_custom_attachments.receiverac2 = "receiverac2List"
mod.wc.receiverac2List = {
	"owo_bolt_empty",
	"owo_bolt_helbore_bolt_02",
	"owo_laspistol_grip_mag_helper_empty",
	"owo_laspistol_grip_mag_helper2_01",
}

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
-- Flashlight/Special: Grip Laser
function mod.owo_grip_laser(variant_id, type)
	mod.inject_attachments_owo(variant_id, "flashlight" or type, {
		{id = "owo_grip_laser_01", name = "OwO Grip Laser (R)"},
		{id = "owo_grip_laser_02", name = "OwO Grip Laser (G)"},
	})

	mod.inject_models(variant_id, {
		owo_grip_laser_01 = {
			--[[ FLASHLIGHT DISCUSSION
			flashlight details found in weapon_customization/scripts/mods/weapon_customization/weapon_attachments/common_ranged.lua in flashlight_data table
			To add laser sight, EWC uses weapon_customization/extensions/laser_pointer_extension.lua
				this does a manual check to see if the flashlight is 'laser_pointer', the ID for the built in laser pointer gras added
					i tried adding a manual check for this one too, but it's not working
				the preview part is handled by weapon_customization/extensions/flashlight_extension.lua
					added a manual check. also didn't work
					Adding an additional entry to the templates DID work, but only for the flashlight light, not the beam
				there also seems to be references in wc/patches/ewapon_templates.lua (CHECK THIS) and wc/weapon_customization_anchors.lua (prob jsut for position)
					ok i checked it. it's just calling the extension
				tried injectign to table above
					mod.table_append(mod.wc.laser_pointers, {
						"owo_grip_laser_01",
					})
				didnt work
			]]
			name = "owo_grip_laser_01",
			model = _item_ranged.."/flashlights/flashlight_05", type = "flashlight", 
			data = { {loc_flashlight_light_cone = 2}, 
				{loc_flashlight_intensity = 2}, 
				{loc_flashlight_battery = 2}
			},
			mesh_move = false, parent = "receiver"
		},
		owo_grip_laser_02 = {
			name = "owo_grip_laser_02",
			model = _item_ranged.."/flashlights/flashlight_05", type = "flashlight", 
			data = { {loc_flashlight_light_cone = 2}, 
				{loc_flashlight_intensity = 2}, 
				{loc_flashlight_battery = 2}
			},
			mesh_move = false, parent = "receiver"
		},
	})
end

-- Muzzle: Suppressor
function mod.owo_suppressor(variant_id, type)
	mod.inject_attachments_owo(variant_id, "muzzle" or type, {
		{id = "owo_suppressor_01", name = "OwO Suppressor 1"},
		{id = "owo_suppressor_02", name = "OwO Suppressor 2"}
	})
	mod.inject_attachments_owo(variant_id, "muzzle2" or type, {
		{id = "owo_suppressor_helper_empty", name = "OwO Suppressor'vesa Empty", no_randomize = true},
		{id = "owo_suppressor_helper_01", name = "OwO Suppressor'vesa 1", no_randomize = true},
		{id = "owo_suppressor_helper_02", name = "OwO Suppressor'vesa 2", no_randomize = true}
	})

	mod.inject_models(variant_id, {
		owo_suppressor_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle2 = "owo_suppressor_helper_01"
			}
		},
		owo_suppressor_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle2 = "owo_suppressor_helper_02"
			}
		},
		owo_suppressor_helper_empty = {
			model = "", type = "muzzle2", mesh_move = false, parent = "barrel"
		},
		owo_suppressor_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle2", mesh_move = false, parent = "barrel"
		},
		owo_suppressor_helper_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle2", mesh_move = false, parent = "barrel"
		}
	})
end

-- Muzzle: Lasgun Condom
function mod.owo_condom(variant_id, type)
	mod.inject_attachments_owo(variant_id, "muzzle" or type, {
		{id = "owo_condom_01", name = "OwO Lasbarrel Condom", no_randomize = true}
	})
	mod.inject_attachments_owo(variant_id, "muzzle2" or type, {
		{id = "owo_condom_helper_empty", name = "Condom'vesa Empty", no_randomize = true},
		{id = "owo_condom_helper_01", name = "OwO Condom'vesa", no_randomize = true}
	})

	mod.inject_models(variant_id, {
		owo_condom_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle2 = "owo_condom_helper_01"
			}
		},
		owo_condom_helper_empty = {
			model = "", type = "muzzle2", mesh_move = false, parent = "barrel"
		},
		owo_condom_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle2", mesh_move = false, parent = "barrel"
		},
	})
end

-- Muzzle: Scab Gunner
--		Recon Lasgun
function mod.owo_scab_gunner_muzzle(variant_id, type)
	mod.inject_attachments_owo(variant_id, "muzzle" or type, {
		{id = "owo_scab_gunner_muzzle_01", name = "OwO Scab Gunner Muzzle 1"},
	})

	mod.inject_models(variant_id, {
		owo_scab_gunner_muzzle_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle", 
			mesh_move = false, parent = "barrel",
		},
	})

end

-- Barrel: Shotgun barrel short
--		Bolt pistol
function mod.owo_bistol_shotgun_barrel_short(variant_id, type)
	--[[
	1,6 dont work, but 2-5 do
		setting offset to false made 1,6 as 2d models not following the gun and no scale
		what the FUCK?
	
	]]
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		--{id = "owo_bistol_sg_base_01", name = "OwO Shotgun Shorty 1"},
		{id = "owo_bistol_sg_base_04", name = "OwO Shotgun Shorty 1 (4)"},
		{id = "owo_bistol_sg_base_05", name = "OwO Shotgun Shorty 2 (5)"},
		{id = "owo_bistol_sg_base_06", name = "OwO Shotgun Shorty 3 (6)"},
		{id = "owo_bistol_sg_base_08", name = "OwO Shotgun Shorty 4 (8)"},
		--{id = "owo_bistol_sg_base_09", name = "OwO Shotgun Shorty 6"},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroud" or type, {
		{id = "owo_bistol_shotgun_barrel_short_empty", name = "Empty Barrel Shroud", no_randomize = true},
		--{id = "owo_bistol_shotgun_barrel_short_01", name = "OwO Shotgun Shorty 1", no_randomize = true},
		{id = "owo_bistol_shotgun_barrel_short_04", name = "OwO Shotgun Shorty 2", no_randomize = true},
		{id = "owo_bistol_shotgun_barrel_short_05", name = "OwO Shotgun Shorty 3", no_randomize = true},
		{id = "owo_bistol_shotgun_barrel_short_06", name = "OwO Shotgun Shorty 4", no_randomize = true},
		{id = "owo_bistol_shotgun_barrel_short_08", name = "OwO Shotgun Shorty 5", no_randomize = true},
		--{id = "owo_bistol_shotgun_barrel_short_09", name = "OwO Shotgun Shorty 6", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		--[[owo_bistol_sg_base_01 = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_01",
			}
		}, 
		]]
		owo_bistol_sg_base_04 = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_04",
			}
		}, 
		owo_bistol_sg_base_05 = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_05",
			}
		}, 
		owo_bistol_sg_base_06 = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_06",
			}
		}, 
		owo_bistol_sg_base_08 = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_08",
			}
		}, 
		--[[owo_bistol_sg_base_09 = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_09",
			}
		}, 
		]]
		owo_bistol_shotgun_barrel_short_empty = {
			model = "", type = "barrelshroud", parent = "barrel"
		},
		--[[owo_bistol_shotgun_barrel_short_01 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_01", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		},
		]]
		owo_bistol_shotgun_barrel_short_04 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_04", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		},
		owo_bistol_shotgun_barrel_short_05 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_05", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		},
		owo_bistol_shotgun_barrel_short_06 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_06", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		},
		owo_bistol_shotgun_barrel_short_08 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_08", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		},
		--[[owo_bistol_shotgun_barrel_short_09 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_09", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		}
		]]
	})
end

-- Barrelex: Shotgun barrel extension
--		Revolver
function mod.owo_revolver_shotgun_barrel(variant_id, type)
	--[[ You may be wondering why I did this instead of just directly adding it to Barrel Extensions
		because they just wouldn't show up for some reason
		maybe i need to redeclare the slot under the barrelexList

		And why it's not barrelex, because that wouldn't respect my transformations?!?!?!??!
		NVM EVEN A CUSTOM ONE ISN"T RESPEDTEDD FUCK THIS

		
	]]
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		--{id = "owo_revolver_shotgun_barrel_base_01", name = "OwO Shotgun Barrel 1 (1)"},
		{id = "owo_revolver_shotgun_barrel_base_04", name = "OwO Shotgun Barrel 1 (4)"},
		{id = "owo_revolver_shotgun_barrel_base_05", name = "OwO Shotgun Barrel 2 (5)"},
		{id = "owo_revolver_shotgun_barrel_base_06", name = "OwO Shotgun Barrel 3 (6)"},
		-- barrel 7 with the skulls is too squished
		{id = "owo_revolver_shotgun_barrel_base_08", name = "OwO Shotgun Barrel 4 (8)"},
		--{id = "owo_revolver_shotgun_barrel_base_09", name = "OwO Shotgun Barrel 6 (9)"},
	})
	mod.inject_attachments_owo(variant_id, "owobarrelex" or type, {
		{id = "owo_revolver_shotgun_barrel_empty", name = "Empty Barrelex"},
		{id = "owo_revolver_shotgun_barrel_01", name = "OwO Shotgun Barrel 1 (1)"},
		{id = "owo_revolver_shotgun_barrel_04", name = "OwO Shotgun Barrel 2 (4)"},
		{id = "owo_revolver_shotgun_barrel_05", name = "OwO Shotgun Barrel 3 (5)"},
		{id = "owo_revolver_shotgun_barrel_06", name = "OwO Shotgun Barrel 4 (6)"},
		-- barrel 7 with the skulls is too squished
		{id = "owo_revolver_shotgun_barrel_08", name = "OwO Shotgun Barrel 5 (8)"},
		{id = "owo_revolver_shotgun_barrel_09", name = "OwO Shotgun Barrel 6 (9)"},
	})

	mod.inject_models(variant_id, {
		owo_revolver_shotgun_barrel_base_01 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {owobarrelex = "owo_revolver_shotgun_barrel_01"},
		},
		owo_revolver_shotgun_barrel_base_04 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {owobarrelex = "owo_revolver_shotgun_barrel_04"},
		},
		owo_revolver_shotgun_barrel_base_05 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {owobarrelex = "owo_revolver_shotgun_barrel_05"},
		},
		owo_revolver_shotgun_barrel_base_06 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {owobarrelex = "owo_revolver_shotgun_barrel_06"},
		},
		owo_revolver_shotgun_barrel_base_08 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {owobarrelex = "owo_revolver_shotgun_barrel_08"},
		},
		owo_revolver_shotgun_barrel_base_09 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {owobarrelex = "owo_revolver_shotgun_barrel_09"},
		},
		owo_revolver_shotgun_barrel_empty = {
			model = "", type = "barrelex", parent = "barrel"
		},
		owo_revolver_shotgun_barrel_01 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_01", type = "owobarrelex", parent = "barrel"
		},
		owo_revolver_shotgun_barrel_04 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_04", type = "owobarrelex", parent = "barrel"
		},
		owo_revolver_shotgun_barrel_05 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_05", type = "owobarrelex", parent = "barrel"
		},
		owo_revolver_shotgun_barrel_06 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_06", type = "owobarrelex", parent = "barrel"
		},
		owo_revolver_shotgun_barrel_08 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_08", type = "owobarrelex", parent = "barrel"
		},
		owo_revolver_shotgun_barrel_09 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_09", type = "owobarrelex", parent = "barrel"
		},
	})
end

-- Barrel: Dreg Gunner barrel
--		Brauto/Iag
function mod.owo_dreg_gunner_barrel(variant_id, type)
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		{id = "owo_dreg_barrel_01", name = "OwO Dreg Gunner Barrel"},

	})
	mod.inject_attachments_owo(variant_id, "barrelshroud", {
		{id = "owo_dreg_shroud_empty", name = "Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_shroud_01", name = "OwO Dreg Shroud", no_randomize = true},
	})
	--[[mod.inject_attachments_owo(variant_id, "barrelshroudac", {
		{id = "owo_dreg_shroud_empty", name = "Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_shroudac_01", name = "OwO Dreg Shroud Ac", no_randomize = true},
	})]]
	mod.inject_attachments_owo(variant_id, "barrelshroudac2", {
		{id = "owo_dreg_shroud_empty", name = "Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_shroudac2_01", name = "OwO Dreg Shroud Ac2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac3", {
		{id = "owo_dreg_shroud_empty", name = "Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_shroudac3_01", name = "OwO Dreg Shroud Ac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac4", {
		{id = "owo_dreg_shroud_empty", name = "Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_shroudac4_01", name = "OwO Dreg Shroud Ac4", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- thanks syn for the exitus barrel
		owo_dreg_barrel_01 = {
			model = _item_ranged.."/barrels/stubgun_ogryn_barrel_02", type = "barrel", 
			mesh_move = false, parent = 'receiver', 
			automatic_equip = {
				barrelshroud= "owo_dreg_shroud_01", 
				barrelshroudac= "owo_dreg_shroudac_01", 
				barrelshroudac2= "owo_dreg_shroudac2_01",
				barrelshroudac3= "owo_dreg_shroudac3_01",
				barrelshroudac4= "owo_dreg_shroudac4_01"
			}
		},
		owo_dreg_shroud_01 = {
			model = _item_ranged.."/barrels/stubgun_ogryn_barrel_01", type = "barrelshroud", 
			mesh_move = false, parent = 'receiver'
		},
		--[[owo_dreg_shroudac_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_01", type = "barrelshroudac", 
			mesh_move = false, parent = 'receiver'
		},]]
		owo_dreg_shroudac2_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_02", type = "barrelshroudac2", 
			mesh_move = false, parent = 'barrel'
		},
		owo_dreg_shroudac3_01 = {
			model = _item_ranged.."/underbarrels/boltgun_rifle_underbarrel_03", type = "barrelshroudac3", 
			mesh_move = false, parent = 'barrel'
		},
		owo_dreg_shroudac4_01 = {
			model = _item_ranged.."/underbarrels/shotgun_rifle_underbarrel_04", type = "barrelshroudac4", 
			mesh_move = false, parent = 'barrel'
		},
		owo_dreg_shroud_empty = {
			model = "", type = "barrelshroudac", 
			mesh_move = false, parent = 'receiver'
		},
	})
end

-- Barrel: Scab Gunner
--		Recon Lasgun
function mod.owo_scab_gunner_barrel(variant_id, type)
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		{id = "owo_scab_gunner_barrel_01", name = "OwO Scab Gunner Barrel 1"},
	})
	mod.inject_attachments_owo(variant_id, "barrelac" or type, {
		{id = "owo_scab_gunner_barrelac_empty", name = "OwO Scab Gunner Barrel empty"},
		{id = "owo_scab_gunner_barrelac_01", name = "OwO Scab Gunner Barrel'vesa 1"},
	})

	mod.inject_models(variant_id, {
		owo_scab_gunner_barrel_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				barrelac = "owo_scab_gunner_barrelac_01"
			}
		},
		owo_scab_gunner_barrelac_empty = {
			model = "", type = "barrelac", 
			mesh_move = false, parent = "barrel"
		},
		owo_scab_gunner_barrelac_01 = {
			model = _item_melee.."/grips/combat_sword_grip_03", type = "barrelac", 
			mesh_move = false, parent = "barrel"
		},
	})

end

-- Barrel: M16 barrels
-- 		Autoguns
-- 		I stole this from Syn's Aquilon Barrel (barrel and shroud are near identical lmao)
function mod.owo_m16_barrel(variant_id, type)
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		{id = "owo_m16_barrel_a1", name = "OwO M16a1 Barrel 1"},
		{id = "owo_m16_barrel_a1_02", name = "OwO M16a1 Barrel 2"},
		{id = "owo_m16_barrel_a2", name = "OwO M16a2 Barrel"},
		{id = "owo_m16_barrel_t_a1", name = "OwO M16a1 Barrel (Tall Post) 1"},
		{id = "owo_m16_barrel_t_a1_02", name = "OwO M16a1 Barrel (Tall Post) 2"},
		{id = "owo_m16_barrel_t_a2", name = "OwO M16a2 Barrel (Tall Post)"},
		{id = "owo_m16_barrel_n_a1", name = "OwO M16a1 Barrel (No Post) 1"},
		{id = "owo_m16_barrel_n_a1_02", name = "OwO M16a1 Barrel (No Post) 2"},
		{id = "owo_m16_barrel_n_a2", name = "OwO M16a2 Barrel (No Post)"},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroud" or type, {
		{id = "owo_m16_empty", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroud_a1", name = "OwO M16a1 Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroud_a1_02", name = "OwO M16a2 Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroud_a2", name = "OwO M16a2 Barrel Shroud", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac2" or type, {
		{id = "owo_m16_empty", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac2_01", name = "OwO M16 Front Sight shroudac", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac3" or type, {
		{id = "owo_m16_empty", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac3_a1", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac4" or type, {
		{id = "owo_m16_empty", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac4_01", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac5" or type, {
		{id = "owo_m16_empty", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac5_01", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac6" or type, {
		{id = "owo_m16_empty", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac6_01", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_m16_barrel_a1 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a1",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
				barrelshroudac3 = "owo_m16_barrelshroudac3_a1",
				barrelshroudac4 = "owo_m16_barrelshroudac4_01", barrelshroudac5 = "owo_m16_barrelshroudac5_01", barrelshroudac6 = "owo_m16_barrelshroudac6_01",
			}
		},
		owo_m16_barrel_a2 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a2",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
				barrelshroudac4 = "owo_m16_barrelshroudac4_01", barrelshroudac5 = "owo_m16_barrelshroudac5_01", barrelshroudac6 = "owo_m16_barrelshroudac6_01",
			}
		},
		owo_m16_barrel_a1_02 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a1_02",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
				barrelshroudac4 = "owo_m16_barrelshroudac4_01", barrelshroudac5 = "owo_m16_barrelshroudac5_01", barrelshroudac6 = "owo_m16_barrelshroudac6_01",
			}
		},
		owo_m16_barrel_t_a1 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a1",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
				barrelshroudac3 = "owo_m16_barrelshroudac3_a1",
				barrelshroudac4 = "owo_m16_barrelshroudac4_01", barrelshroudac5 = "owo_m16_barrelshroudac5_01", barrelshroudac6 = "owo_m16_barrelshroudac6_01",
			}
		},
		owo_m16_barrel_t_a2 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a2",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
				barrelshroudac4 = "owo_m16_barrelshroudac4_01", barrelshroudac5 = "owo_m16_barrelshroudac5_01", barrelshroudac6 = "owo_m16_barrelshroudac6_01",
			}
		},
		owo_m16_barrel_t_a1_02 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a1_02",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
				barrelshroudac4 = "owo_m16_barrelshroudac4_01", barrelshroudac5 = "owo_m16_barrelshroudac5_01", barrelshroudac6 = "owo_m16_barrelshroudac6_01",
			}
		},
		owo_m16_barrel_n_a1 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver", hide_mesh = {{'barrelshroudac2', 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}},
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a1",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
				barrelshroudac3 = "owo_m16_barrelshroudac3_a1"
			}
		},
		owo_m16_barrel_n_a2 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver", hide_mesh = {{'barrelshroudac2', 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}},
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a2",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
			}
		},
		owo_m16_barrel_n_a1_02 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver", hide_mesh = {{'barrelshroudac2', 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}},
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a1_02",
				barrelshroudac2 = "owo_m16_barrelshroudac2_01",
			}
		},
		owo_m16_empty = {
			model = "", type = "barrelshroud", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_barrelshroud_a1 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "barrelshroud", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_barrelshroud_a2 = {
			model = _item_melee.."/grips/hatchet_grip_04", type = "barrelshroud", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_barrelshroud_a1_02 = {
			model = _item_melee.."/grips/hatchet_grip_05", type = "barrelshroud", 
			mesh_move = false, parent = "receiver"
		},
		-- Front Post
		owo_m16_barrelshroudac2_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = "barrelshroudac2", 
			mesh_move = false, parent = "receiver"
		},
		-- helper a1 grip
		owo_m16_barrelshroudac3_a1 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "barrelshroudac3", 
			mesh_move = false, parent = "receiver"
		},
		-- Front Post Sights
		-- middle then sides
		owo_m16_barrelshroudac4_01 = {
			-- why tf is it like this???
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "barrelshroudac4", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_barrelshroudac5_01 = {
			model = "content/items/weapons/player/melee/blades/sabre_blade_01", type = "barrelshroudac5", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_barrelshroudac6_01 = {
			model = "content/items/weapons/player/melee/blades/sabre_blade_01", type = "barrelshroudac6", 
			mesh_move = false, parent = "receiver"
		},
	})

end

-- Barrel: Wooden Helbore
function mod.owo_wood_krieg(variant_id, type)
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		{id = "owo_wood_krieg_01", name = "OwO Wooden Helbore 1 (2)"},
		{id = "owo_wood_krieg_02", name = "OwO Wooden Helbore 2 (3)"},
		{id = "owo_wood_krieg_03", name = "OwO Wooden Helbore 3 (7)"},
	})
	mod.inject_attachments_owo(variant_id, "barrelac1" or type, {
		{id = "owo_wood_krieg_empty", name = "Empty Barrel", no_randomize = true},
		{id = "owo_wood_krieg_ac1_01", name = "OwO Wooden Helbore ac1 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_wood_krieg_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_02", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelac1 = "owo_wood_krieg_ac1_01", }
		},
		owo_wood_krieg_02 = {
			model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_04", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelac1 = "owo_wood_krieg_ac1_01", }
		},
		owo_wood_krieg_03 = {
			model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_ml01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelac1 = "owo_wood_krieg_ac1_01", }
		},
		owo_wood_krieg_empty = {
			model = "", type = "barrelac1", 
			mesh_move = false, parent = "barrel"
		},
		owo_wood_krieg_ac1_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = "barrelac1", 
			mesh_move = false, parent = "barrel",
		},
	})

end

-- Bayonet: Dreg Gunner bayonet
--		Brauto/Iag
function mod.owo_dreg_gunner_bayonet(variant_id, type)
	mod.inject_attachments_owo(variant_id, "bayonet" or type, {
		{id = "owo_dreg_bayonet_empty", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_dreg_bayonet_01", name = "OwO Dreg Gunner Bayonet"},

	})
	mod.inject_attachments_owo(variant_id, "bayonetac1", {
		{id = "owo_dreg_bayonet_empty", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_dreg_bayonet_rear_01", name = "OwO Dreg Shroud", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_dreg_bayonet_01 = {
			model = _item_melee.."/blades/combat_blade_blade_03", type = "bayonet", 
			mesh_move = false, parent = 'barrel', 
			automatic_equip = {
				bayonetac1 = "owo_dreg_bayonet_rear_01"
			}
		},
		owo_dreg_bayonet_empty = {
			model = "", type = "bayonetac1", 
			mesh_move = false, parent = 'barrel'
		},
		owo_dreg_bayonet_rear_01 = {
			model = _item_melee.."/blades/combat_blade_blade_05", type = "bayonetac1", 
			mesh_move = false, parent = 'barrel'
		}
	})
end

-- Bayonet: M7, Seitengewehr 98 (Butcher's Blade), Épée Baïonnette 1886
--		Autoguns, Helbores
function mod.owo_bayonet(variant_id, type)
	mod.inject_attachments_owo(variant_id, "bayonet" or type, {
		{id = "owo_bayonet_m7_01", name = "OwO M7 Bayonet"},
		{id = "owo_bayonet_seitengewehr", name = "OwO Seitengewehr 98"},
		{id = "owo_bayonet_03", name = "OwO Épée Baïonnette 1886"},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac1" or type, {
		{id = "owo_bayonet_empty", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_bayonet_m7_helper_01", name = "M7 Bayonet Grip", no_randomize = true},
		{id = "owo_bayonet_seitengewehr_helper_01", name = "Seitengewehr Grip", no_randomize = true},
		{id = "owo_bayonet_03_helper_01", name = "Epee Grip", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac2" or type, {
		{id = "owo_bayonet_empty", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_bayonet_m7_helper_00", name = "M7 Bayonet Lug", no_randomize = true},
		{id = "owo_bayonet_seitengewehr_helper_02", name = "Seitengewehr Grip bulge", no_randomize = true},
		{id = "owo_bayonet_03_helper_02", name = "Epee loop d'loop", no_randomize = true},
	})
	
	mod.inject_models(variant_id, {
		owo_bayonet_m7_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_bayonet_m7_helper_01",
				bayonetac2 = "owo_bayonet_m7_helper_00"
			}
		},
		owo_bayonet_seitengewehr = {
			model = _item_melee.."/blades/combat_knife_blade_01", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_bayonet_seitengewehr_helper_01",
				bayonetac2 = "owo_bayonet_seitengewehr_helper_02"
			}
		},
		owo_bayonet_03 = {
			model = _item_ranged.."/bayonets/bayonet_03", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_bayonet_03_helper_01",
				bayonetac2 = "owo_bayonet_03_helper_02"
			}
		},
		owo_bayonet_empty = {
			model = "", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		owo_bayonet_m7_helper_01 = {
			model = _item_melee.."/grips/combat_knife_grip_03", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet",
		},
		owo_bayonet_seitengewehr_helper_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet",
		},
		owo_bayonet_03_helper_01 = {
			model = _item_melee.."/grips/combat_knife_grip_02", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet",
		},
		-- Bayonet lug
		owo_bayonet_m7_helper_00 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet",
		},
		owo_bayonet_seitengewehr_helper_02 = {
			model = _item_melee.."/grips/2h_chain_sword_grip_02", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet",
		},
		owo_bayonet_03_helper_02 = {
			model = _item_melee.."/heads/hatchet_head_03", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet",
		},
	})
end

-- Bayonet: Underbarrel Grenade Launcher
function mod.owo_underbarrel_gl(variant_id, type)
	mod.inject_attachments_owo(variant_id, "bayonet" or type, {
		{id = "owo_m203", name = "OwO M203 Grenade Launcher"},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac1" or type, {
		{id = "owo_underbarrel_gl_empty", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_01", name = "OwO M203 ac1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac2" or type, {
		{id = "owo_underbarrel_gl_empty", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_02", name = "OwO M203 ac2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac3" or type, {
		{id = "owo_underbarrel_gl_empty", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_03", name = "OwO M203 ac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac4" or type, {
		{id = "owo_underbarrel_gl_empty", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_04", name = "OwO M203 ac4", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_m203 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_m203_helper_01", bayonetac2 = "owo_m203_helper_02", 
				bayonetac3 = "owo_m203_helper_03", bayonetac4 = "owo_m203_helper_04", 
			}
		},
		owo_underbarrel_gl_empty = {
			model = "", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		owo_m203_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_02", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		owo_m203_helper_02 = {
			model = _item_melee.."/grips/combat_knife_grip_03", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet"
		},
		owo_m203_helper_03 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "bayonetac3", 
			mesh_move = false, parent = "bayonet"
		},
		owo_m203_helper_04 = {
			model = _item_ranged.."/recievers/shotgun_double_barrel_receiver_01", type = "bayonetac4", 
			mesh_move = false, parent = "bayonet"
		},
	})
end

-- Receiver: Vertically challenged California Bolter
--		Grip: Already included in MT Plugin or use fin grip with stock
--		Bolter
--[[ Cannot contain:     
	Pistol grip that protrudes conspicuously beneath the action of the weapon
    Thumbhole stock
    Folding or telescoping stock
    Grenade or flare launcher
    Flash suppressor
    Forward pistol grip 
	California Penal Code § 32310 PC 
		“large-capacity magazine” means any ammunition-feeding device with the capacity to hold more than 10 rounds
	SBR
		A semiautomatic, centerfire rifle that has an overall length of less than 30 inches
]]
function mod.owo_california_bolter(variant_id, type)
	mod.inject_attachments_owo(variant_id, "receiver" or type, {
		{id = "owo_california_bolter_01", name = "OwO California Bolter 1"},
		{id = "owo_california_bolter_02", name = "OwO California Bolter 2"},
		{id = "owo_california_bolter_03", name = "OwO California Bolter 3"},
		{id = "owo_california_bolter_04", name = "OwO California Bolter 4"},
		{id = "owo_california_bolter_05", name = "OwO California Bolter 5"},
		{id = "owo_california_bolter_06", name = "OwO California Bolter 6"},
		{id = "owo_california_bolter_07", name = "OwO California Bolter 7"},
		{id = "owo_california_bolter_08", name = "OwO California Bolter 8"},
	})
	-- 1-7
	mod.inject_models(variant_id, {
		owo_california_bolter_01 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_01", type = "receiver", 
			mesh_move = false
			--[[
			, no_support = {
				-- Thumbhole, Folding, and Telescoping Stocks
				"syn_thumbgun_stock_01",	-- syn thumbhole
				"syn_thumbgun_stock_02",
				"syn_thumbgun_stock_03",
				"syn_thumbgun_stock_04",
				"syn_thumbgun_stock_05",
				-- infantry autogun 4
				-- brauto 1-3, 5-8
				-- headhunter 1,3
				"xl_autogun_rifle_stock_04",	-- syn xl iag
				"xl_autogun_rifle_stock_05",	-- syn xl brauto
				"xl_autogun_rifle_stock_06",
				"xl_autogun_rifle_stock_07",
				"xl_autogun_rifle_stock_12",
				"xl_autogun_rifle_stock_13",
				"xl_autogun_rifle_stock_14",
				"xl_autogun_rifle_stock_08",	-- syn xl headhunter
				"xl_autogun_rifle_stock_16",
			}]]
		},
		owo_california_bolter_02 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_02", type = "receiver", 
			mesh_move = false
		},
		owo_california_bolter_03 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_03", type = "receiver", 
			mesh_move = false
		},
		owo_california_bolter_04 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_04", type = "receiver", 
			mesh_move = false
		},
		owo_california_bolter_05 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_05", type = "receiver", 
			mesh_move = false
		},
		owo_california_bolter_06 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_06", type = "receiver", 
			mesh_move = false
		},
		owo_california_bolter_07 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_07", type = "receiver", 
			mesh_move = false
		},
		owo_california_bolter_08 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_08", type = "receiver", 
			mesh_move = false
		}
	})
end

-- Receiver: Helbore Bolt Action
function mod.owo_bolt_action(variant_id, type)
	mod.inject_attachments_owo(variant_id, "receiver" or type, {
		{id = "owo_bolt_helbore_01", name = "OwO Helbore Bolt Action 1"},
		{id = "owo_bolt_helbore_02", name = "OwO Helbore Bolt Action 2"},
		{id = "owo_bolt_helbore_03", name = "OwO Helbore Bolt Action 3"},
		{id = "owo_bolt_helbore_04", name = "OwO Helbore Bolt Action 4"},
		{id = "owo_bolt_helbore_05", name = "OwO Helbore Bolt Action 5"},
	})
	mod.inject_attachments_owo(variant_id, "receiverac1" or type, {
		{id = "owo_bolt_empty", name = "receiverac1 empty", no_randomize = true},
		{id = "owo_bolt_helbore_bolt_01", name = "OwO bolt action bolt", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "receiverac2" or type, {
		{id = "owo_bolt_empty", name = "receiverac1 empty", no_randomize = true},
		{id = "owo_bolt_helbore_bolt_02", name = "OwO bolt action bolt shaft", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_bolt_helbore_01 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_01", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_bolt_helbore_bolt_01", receiverac2 = "owo_bolt_helbore_bolt_02"}
		},
		owo_bolt_helbore_02 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_02", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_bolt_helbore_bolt_01", receiverac2 = "owo_bolt_helbore_bolt_02"}
		},
		-- WHY IS THERE NO 3
		owo_bolt_helbore_03 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_04", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_bolt_helbore_bolt_01", receiverac2 = "owo_bolt_helbore_bolt_02"}
		},
		owo_bolt_helbore_04 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_05", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_bolt_helbore_bolt_01", receiverac2 = "owo_bolt_helbore_bolt_02"}
		},
		owo_bolt_helbore_05 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_ml01", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_bolt_helbore_bolt_01", receiverac2 = "owo_bolt_helbore_bolt_02"}
		},
		owo_bolt_empty = {
			model = "", type = "receiverac1", 
			mesh_move = false, parent = "receiver"
		},
		-- grippy part
		owo_bolt_helbore_bolt_01 = {
			model = _item_melee.."/grips/combat_knife_grip_07", type = "receiverac1", 
			mesh_move = false, parent = "receiver"
		},
		-- the shaft
		owo_bolt_helbore_bolt_02 = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = "receiverac2", 
			mesh_move = false, parent = "receiver"
		},
	})
end

-- Receiver: Pistol Grip Mag
function mod.owo_laspistol_grip_mag(variant_id)
	mod.inject_attachments_owo(variant_id, "receiver", {
		{id = "owo_laspistol_grip_mag_01", name = "OwO Pistol Receiver 1"},
		{id = "owo_laspistol_grip_mag_02", name = "OwO Pistol Receiver 2"},
		{id = "owo_laspistol_grip_mag_03", name = "OwO Pistol Receiver 3 (M)"},
	})
	mod.inject_attachments_owo(variant_id, "receiverac1", {
		{id = "owo_laspistol_grip_mag_helper_empty", name = "Empty Receiverac1"},
		{id = "owo_laspistol_grip_mag_helper_01", name = "OwO Pistol Receiverac"},
	})
	mod.inject_attachments_owo(variant_id, "receiverac2", {
		{id = "owo_laspistol_grip_mag_helper_empty", name = "Empty Receiverac2"},
		{id = "owo_laspistol_grip_mag_helper2_01", name = "OwO Pistol Trigger"},
	})

	mod.inject_models(variant_id, {
		owo_laspistol_grip_mag_01 = {
			model = _item_ranged.."/recievers/lasgun_rifle_receiver_01", type = "receiver", mesh_move = false,
			automatic_equip = {
				receiverac1 = "owo_laspistol_grip_mag_helper_01", receiverac2 = "owo_laspistol_grip_mag_helper2_01"
			}
		},
		owo_laspistol_grip_mag_02 = {
			model = _item_ranged.."/recievers/lasgun_rifle_receiver_02", type = "receiver", mesh_move = false,
			automatic_equip = {
				receiverac1 = "owo_laspistol_grip_mag_helper_01", receiverac2 = "owo_laspistol_grip_mag_helper2_01"
			}
		},
		owo_laspistol_grip_mag_03 = {
			model = _item_ranged.."/recievers/lasgun_rifle_receiver_0ml01", type = "receiver", mesh_move = false,
			automatic_equip = {
				receiverac1 = "owo_laspistol_grip_mag_helper_01", receiverac2 = "owo_laspistol_grip_mag_helper2_01"
			}
		},
		owo_laspistol_grip_mag_helper_empty = {
			model = "", type = "receiverac1", parent = "receiver", mesh_move = false,
		},
		owo_laspistol_grip_mag_helper_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "receiverac1", parent = "receiver", mesh_move = false,
		},
		owo_laspistol_grip_mag_helper2_01 = {
			model = "content/items/weapons/player/melee/blades/sabre_blade_01", type = "receiverac2", parent = "receiver", mesh_move = false,
		},
	})
end

-- Grip: Fin Grip
--		Autoguns
function mod.owo_fin_grip(variant_id, type)
	mod.inject_attachments_owo(variant_id, "grip" or type, {
		{id = "owo_fin_grip_01", name = "OwO Fin Grip 1"},
	})
	mod.inject_attachments_owo(variant_id, "grip2" or type, {
		{id = "owo_fin_grip2_empty", name = "OwO Fin Grip empty", no_randomize = true},
		{id = "owo_fin_grip2_01", name = "OwO Fin Grip'vesa 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_fin_grip_01 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_01", type = "grip", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				grip2 = "owo_fin_grip2_01"
			}
		},
		owo_fin_grip2_empty = {
			model = "", type = "grip2", 
			mesh_move = false, parent = "receiver"
		},
		owo_fin_grip2_01 = {
			model = _item_melee.."/blades/combat_blade_blade_02", type = "grip2", 
			mesh_move = false, parent = "receiver"
		},
	})
end

-- Stock: Straight Grip and Recon Stock
--		Helbores
function mod.owo_helbore_gripstock_recon(variant_id,type)
	mod.inject_attachments_owo(variant_id, "stock" or type, {
		{id = "owo_gripstock_recon_01", name = "OwO StraightGrip Recon 1"},
		{id = "owo_gripstock_recon_02", name = "OwO StraightGrip Recon 2"},
		{id = "owo_gripstock_recon_03", name = "OwO StraightGrip Recon 3"},
	})
	mod.inject_attachments_owo(variant_id, "stockac" or type, {
		{id = "owo_gripstock_grip_01a",  name = "OwO StraightGrip stockac", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- stock
	    owo_gripstock_recon_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_elysian_stock_01", type = "stock", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0),
			automatic_equip = {
				stockac = "owo_gripstock_grip_01a"

			}
		},
		owo_gripstock_recon_02 = {
			model = _item_ranged.."/stocks/lasgun_rifle_elysian_stock_02", type = "stock", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0),
			automatic_equip = {
				stockac = "owo_gripstock_grip_01a"

			}
		},
		owo_gripstock_recon_03 = {
			model = _item_ranged.."/stocks/lasgun_rifle_elysian_stock_03", type = "stock", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0),
			automatic_equip = {
				stockac = "owo_gripstock_grip_01a"

			}
		},
		-- grip
		owo_gripstock_grip_01a = {
			model = _item_ranged.."/recievers/stubgun_pistol_receiver_02", type = "stockac", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0)
		},
	})
end

-- Sight: EOTech
--		Autoguns
function mod.owo_holosight(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight" or type, {
		{id = "owo_holosight_03_01", name = "OwO EOTech"},
		{id = "owo_holosight_03_02", name = "OwO EOTech + Magnifier"},
		{id = "owo_holosight_03_03", name = "OwO EOTech + Magnifier (Side)"},
		{id = "owo_holosight_01_01", name = "OwO EOTech (Fat)"},
		{id = "owo_holosight_01_02", name = "OwO EOTech (Fat) + Magn"},
		{id = "owo_holosight_01_03", name = "OwO EOTech (Fat) + Magn (Side)"},
		{id = "owo_holosight_02_01", name = "OwO EOTech (Tall)"},
		{id = "owo_holosight_02_02", name = "OwO EOTech (Tall) + Magn"},
		{id = "owo_holosight_02_03", name = "OwO EOTech (Tall) + Magn (Side)"},
	})
	mod.inject_attachments_owo(variant_id, "owosightac1" or type, {
		{id = "owo_holosight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_helper_01", name = "OwO EOTech'vesa sight container 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac2" or type, {
		{id = "owo_holosight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_helper_02", name = "OwO EOTech'vesa sight container 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac3" or type, {
		{id = "owo_holosight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_helper_03", name = "OwO EOTech'vesa base bulge", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac4" or type, {
		{id = "owo_holosight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_helper_04", name = "OwO EOTech'vesa base", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosight2" or type, {
		{id = "owo_holosight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_sight2_01", name = "OwO EOTech Magnifier Stand", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosight2ac1" or type, {
		{id = "owo_holosight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_sight2_helper_01", name = "OwO EOTech Magnifier 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosight2ac2" or type, {
		{id = "owo_holosight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_holosight_sight2_helper_02", name = "OwO EOTech Magnifier 2", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_holosight_01_01 = {
			model = _item_ranged.."/sights/reflex_sight_01", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
			}
		},
		owo_holosight_01_02 = {
			model = _item_ranged.."/sights/reflex_sight_01", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
				owosight2 = "owo_holosight_sight2_01", owosight2ac1 = "owo_holosight_sight2_helper_01", owosight2ac2 = "owo_holosight_sight2_helper_02"
			}
		},
		owo_holosight_01_03 = {
			model = _item_ranged.."/sights/reflex_sight_01", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
				owosight2 = "owo_holosight_sight2_01", owosight2ac1 = "owo_holosight_sight2_helper_01", owosight2ac2 = "owo_holosight_sight2_helper_02"
			}
		},
		owo_holosight_02_01 = {
			model = _item_ranged.."/sights/reflex_sight_02", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
			}
		},
		owo_holosight_02_02 = {
			model = _item_ranged.."/sights/reflex_sight_02", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
				owosight2 = "owo_holosight_sight2_01", owosight2ac1 = "owo_holosight_sight2_helper_01", owosight2ac2 = "owo_holosight_sight2_helper_02"
			}
		},
		owo_holosight_02_03 = {
			model = _item_ranged.."/sights/reflex_sight_02", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
				owosight2 = "owo_holosight_sight2_01", owosight2ac1 = "owo_holosight_sight2_helper_01", owosight2ac2 = "owo_holosight_sight2_helper_02"
			}
		},
		owo_holosight_03_01 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
			}
		},
		owo_holosight_03_02 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
				owosight2 = "owo_holosight_sight2_01", owosight2ac1 = "owo_holosight_sight2_helper_01", owosight2ac2 = "owo_holosight_sight2_helper_02"
			}
		},
		owo_holosight_03_03 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = "sight", 
			mesh_move = false, parent = "",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_holosight_helper_01", owosightac2 = "owo_holosight_helper_02", 
				owosightac3 = "owo_holosight_helper_03", owosightac4 = "owo_holosight_helper_04",
				owosight2 = "owo_holosight_sight2_01", owosight2ac1 = "owo_holosight_sight2_helper_01", owosight2ac2 = "owo_holosight_sight2_helper_02"
			}
		},
		owo_holosight_empty = {
			model = "", type = "owosightac1", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_helper_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "owosightac1", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_helper_02 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "owosightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_helper_03 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "owosightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_holosight_helper_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "owosightac4",
			mesh_move = false, parent = "sight"
		},
		owo_holosight_sight2_01 = {
			model = _item_melee.."/grips/2h_chain_sword_grip_01", type = "owosight2",
			mesh_move = false, parent = "sight"
		},
		owo_holosight_sight2_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "owosight2ac1",
			mesh_move = false, parent = "sight"
		},
		owo_holosight_sight2_helper_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "owosight2ac2",
			mesh_move = false, parent = "sight"
		},
	})
end

-- Sight: Rear sights with flip up. Ladder Aperture Sights
function mod.owo_rear_sight(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight" or type, {
		{id = "owo_rear_sight_01", name = "OwO Aperture Sight - Lebel (Down)"},
		{id = "owo_rear_sight_02", name = "OwO Aperture Sight - Lebel (Up)"},
	})
	mod.inject_attachments_owo(variant_id, "owosightac1" or type, {
		{id = "owo_rear_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac1_01", name = "Flip sight range select 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac2" or type, {
		{id = "owo_rear_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac2_01", name = "Flip sight range select 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac3" or type, {
		{id = "owo_rear_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac3_01", name = "Flip Sight 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac4" or type, {
		{id = "owo_rear_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac4_01", name = "Flip Sight 2", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_rear_sight_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owosightac1 = "owo_rear_sight_ac1_01", owosightac2 = "owo_rear_sight_ac2_01",
				owosightac3 = "owo_rear_sight_ac3_01", owosightac4 = "owo_rear_sight_ac4_01",
			}
		},
		owo_rear_sight_02 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owosightac1 = "owo_rear_sight_ac1_01", owosightac2 = "owo_rear_sight_ac2_01",
			owosightac3 = "owo_rear_sight_ac3_01", owosightac4 = "owo_rear_sight_ac4_01",
		}
		},
		owo_rear_sight_empty = {
			model = "", type = "owosightac1", 
			mesh_move = false, parent = "sight"
		},
		owo_rear_sight_ac1_01 = {
			model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_02", type = "owosightac1", 
			mesh_move = false, parent = "sight",
		},
		owo_rear_sight_ac2_01 = {
			model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_02", type = "owosightac2", 
			mesh_move = false, parent = "sight",
		},
		owo_rear_sight_ac3_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "owosightac3", 
			mesh_move = false, parent = "sight",
		},
		owo_rear_sight_ac4_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "owosightac4", 
			mesh_move = false, parent = "sight",
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
	mod.inject_attachments_owo(variant_id, "owosightac1" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_01", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac2" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_02", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac3" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_03", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac4" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_04", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac5" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_05", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac6" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_06", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosight2" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_riser_01", name = "PU Scope Riser", no_randomize = true},
	})
	--[[mod.inject_attachments_owo(variant_id, "owosight2ac1" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope"},
		{id = "owo_pu_scope2_helper_01", name = "PU Scope Riser'vesa"},
	})
	mod.inject_attachments_owo(variant_id, "owosight2ac2" or type, {
		{id = "owo_pu_scope_empty", name = "Empty Scope"},
		{id = "owo_pu_scope2_helper_02", name = "PU Scope Riser'vesa"},
	})]]

	mod.inject_models(variant_id, {
		owo_pu_scope_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_pu_scope_helper_01", owosightac2 = "owo_pu_scope_helper_02",
				owosightac3 = "owo_pu_scope_helper_03", owosightac4 = "owo_pu_scope_helper_04",
				owosightac5 = "owo_pu_scope_helper_05", owosightac6 = "owo_pu_scope_helper_06",
				owosight2 = "owo_pu_scope_riser_01"
			}
		},
		owo_pu_scope_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sight", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default",
				owosightac1 = "owo_pu_scope_helper_01", owosightac2 = "owo_pu_scope_helper_02",
				owosightac3 = "owo_pu_scope_helper_03", owosightac4 = "owo_pu_scope_helper_04",
				owosightac5 = "owo_pu_scope_helper_05", owosightac6 = "owo_pu_scope_helper_06",
				owosight2 = "owo_pu_scope_riser_01"
			}
		},
		owo_pu_scope_empty = {
			model = "", type = "owosightac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_pu_scope_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "owosightac1", 
			mesh_move = false, parent = "receiver"
		},
		-- Crosshair
		owo_pu_scope_helper_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "owosightac2", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_helper_03 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "owosightac3", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_helper_04 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owosightac4", 
			mesh_move = false, parent = "sight"
		},
		-- Knobs
		owo_pu_scope_helper_05 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "owosightac5", 
			mesh_move = false, parent = "sight"
		},
		owo_pu_scope_helper_06 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "owosightac6", 
			mesh_move = false, parent = "sight"
		},
		-- Riser
		owo_pu_scope_riser_01 = {
			model = _item_melee.."/grips/falchion_grip_03", type = "owosight2", 
			mesh_move = false, parent = "receiver",
			--automatic_equip = { owosight2ac1 = "owo_pu_scope2_helper_01", owosight2ac2 = "owo_pu_scope2_helper_02",}
		},
		--[[ Too thick
		owo_pu_scope2_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "owosight2ac1", 
			mesh_move = false, parent = "sight",
		},
		owo_pu_scope2_helper_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "owosight2ac2", 
			mesh_move = false, parent = "sight",
		},]]
	})
	
end

-- Sight: M16 Carry Handle
function mod.owo_m16_sight(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight", {
		{id = "owo_m16_sight_01", name = "OwO M16 Carry Sight"},
		{id = "owo_m16_sight_02", name = "OwO M16 Carry Sight (No Rear Elevation Wheel)"},
	})
	mod.inject_attachments_owo(variant_id, "owosightac1", {
		{id = "owo_m16_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_01", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac2", {
		{id = "owo_m16_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_02", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac3", {
		{id = "owo_m16_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_03", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac4", {
		{id = "owo_m16_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_04", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac5", {
		{id = "owo_m16_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_05", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac6", {
		{id = "owo_m16_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_06", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owosightac7", {
		{id = "owo_m16_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_m16_sight_helper_07", name = "OwO M16 Carry Sight'vesa", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_m16_sight_01  = {
			model = _item_ranged.."/recievers/lasgun_rifle_elysian_receiver_01", type = "sight", 
			mesh_move = false, parent = 'receiver', hide_mesh = {{"sight", 1}}, -- hiding the stock. i stole this from MT
			automatic_equip = { owosightac1 = "owo_m16_sight_helper_01", owosightac2 = "owo_m16_sight_helper_02", 
				owosightac3 = "owo_m16_sight_helper_03", 
				owosightac4 = "owo_m16_sight_helper_04", owosightac5 = "owo_m16_sight_helper_05", 
				owosightac6 = "owo_m16_sight_helper_06", owosightac7 = "owo_m16_sight_helper_07", 
			}
		},
		owo_m16_sight_02  = {
			model = _item_ranged.."/recievers/lasgun_rifle_elysian_receiver_02", type = "sight", 
			mesh_move = false, parent = 'receiver', hide_mesh = {{"sight", 5}},
			automatic_equip = { owosightac1 = "owo_m16_sight_helper_01", owosightac2 = "owo_m16_sight_helper_02", 
				owosightac3 = "owo_m16_sight_helper_03", 
				owosightac4 = "owo_m16_sight_helper_04", owosightac5 = "owo_m16_sight_helper_05", 
				owosightac6 = "owo_m16_sight_helper_06", owosightac7 = "owo_m16_sight_empty", 
			}
		},
		owo_m16_sight_empty = {
			model = "", type = 'owosightac1',
			mesh_move = false, parent = 'sight'
		},
		-- Carry handle side rails
		owo_m16_sight_helper_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = 'owosightac1',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_helper_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = 'owosightac2',
			mesh_move = false, parent = 'sight'
		},
		-- Rear sight aperture
		owo_m16_sight_helper_03 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = 'owosightac3',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_helper_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = 'owosightac4',
			mesh_move = false, parent = 'sight'
		},
		owo_m16_sight_helper_05 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = 'owosightac5',
			mesh_move = false, parent = 'sight'
		},
		-- Windage Knob
		owo_m16_sight_helper_06 = {
			model = _item_melee.."/heads/human_power_maul_head_05", type = 'owosightac6',
			mesh_move = false, parent = 'sight'
		},
		-- Rear Elevation Knob
		-- seems to be a newer addition on a2+
		owo_m16_sight_helper_07 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = 'owosightac7',
			mesh_move = false, parent = 'sight'
		},
	})
end

-- Magazine: Lasgun Flat
function mod.owo_lasgun_magazine_flat(variant_id, type)
	mod.inject_attachments_owo(variant_id, "magazine" or type, {
		{id = "owo_lasgun_magazine_flat_01", name = "OwO Flat Magazine 1"},
	})

	mod.inject_models(variant_id, {
		owo_lasgun_magazine_flat_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "magazine", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0)
		},
	})
end

-- Magazine: Rear Lasgun 
--		For Straight Grip and Recon Stock
-- 		I stole this from Syn
function mod.owo_lasgun_magazine_rear(variant_id, type)
	mod.inject_attachments_owo(variant_id, "magazine" or type, {
		{id = "owo_lasgun_magazine_rear_01", name = "OwO Rear Mag 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "rearmag", {
		{id = "owo_lasgun_magazine_rear_child_01", name = "OwO RearMagChild 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_lasgun_magazine_rear_01 = {
			model = _item_ranged.."/magazines/lasgun_pistol_magazine_01", type = "magazine", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0),
			automatic_equip = {
				rearmag= "owo_lasgun_magazine_rear_child_01"
			}
		},
		owo_lasgun_magazine_rear_child_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "rearmag", mesh_move = false, parent = 'receiver'
		},
	})
end

-- Magazine: Jungle Mags
--		Autoguns
function mod.owo_jungle_mag(variant_id, type)
	mod.inject_attachments_owo(variant_id, "magazine" or type, {
		{id = "owo_jungle_mag_01", name = "OwO Jungle Mag 1"},
		{id = "owo_jungle_mag_02", name = "OwO Jungle Mag 2"},
		{id = "owo_jungle_mag_03", name = "OwO Jungle Mag 3"},
		{id = "owo_jungle_mag_04", name = "OwO Jungle Mag 4"},
		{id = "owo_jungle_mag_01_flip", name = "OwO Jungle Mag 1 (Right)"},
		{id = "owo_jungle_mag_02_flip", name = "OwO Jungle Mag 2 (Right)"},
		{id = "owo_jungle_mag_03_flip", name = "OwO Jungle Mag 3 (Right)"},
		{id = "owo_jungle_mag_04_flip", name = "OwO Jungle Mag 4 (Right)"},
	})
	mod.inject_attachments_owo(variant_id, "owomagazineac1" or type, {
		{id = "owo_jungle_mag_empty", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_helper_01", name = "OwO Jungle Mag'vesa 1", no_randomize = true},
		{id = "owo_jungle_mag_helper_02", name = "OwO Jungle Mag'vesa 2", no_randomize = true},
		{id = "owo_jungle_mag_helper_03", name = "OwO Jungle Mag'vesa 3", no_randomize = true},
		{id = "owo_jungle_mag_helper_04", name = "OwO Jungle Mag'vesa 4", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owomagazineac2" or type, {
		{id = "owo_jungle_mag_empty", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_f_01", name = "OwO Jungle Connector f 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owomagazineac3" or type, {
		{id = "owo_jungle_mag_empty", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_b_01", name = "OwO Jungle Connector b 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owomagazineac4" or type, {
		{id = "owo_jungle_mag_empty", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_l_01", name = "OwO Jungle Connector l 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owomagazineac5" or type, {
		{id = "owo_jungle_mag_empty", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_r_01", name = "OwO Jungle Connector r 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- Main magazine
		owo_jungle_mag_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owomagazineac1 = "owo_jungle_mag_helper_01", owomagazineac2 = "owo_jungle_mag_connector_f_01", 
				owomagazineac3 = "owo_jungle_mag_connector_b_01", owomagazineac4 = "owo_jungle_mag_connector_l_01", owomagazineac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owomagazineac1 = "owo_jungle_mag_helper_02", owomagazineac2 = "owo_jungle_mag_connector_f_01", 
				owomagazineac3 = "owo_jungle_mag_connector_b_01", owomagazineac4 = "owo_jungle_mag_connector_l_01", owomagazineac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owomagazineac1 = "owo_jungle_mag_helper_03", owomagazineac2 = "owo_jungle_mag_connector_f_01", 
				owomagazineac3 = "owo_jungle_mag_connector_b_01", owomagazineac4 = "owo_jungle_mag_connector_l_01", owomagazineac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owomagazineac1 = "owo_jungle_mag_helper_04", owomagazineac2 = "owo_jungle_mag_connector_f_01", 
				owomagazineac3 = "owo_jungle_mag_connector_b_01", owomagazineac4 = "owo_jungle_mag_connector_l_01", owomagazineac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_01_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owomagazineac1 = "owo_jungle_mag_helper_01", owomagazineac2 = "owo_jungle_mag_connector_f_01", 
				owomagazineac3 = "owo_jungle_mag_connector_b_01", owomagazineac4 = "owo_jungle_mag_connector_l_01", owomagazineac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_02_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owomagazineac1 = "owo_jungle_mag_helper_02", owomagazineac2 = "owo_jungle_mag_connector_f_01", 
				owomagazineac3 = "owo_jungle_mag_connector_b_01", owomagazineac4 = "owo_jungle_mag_connector_l_01", owomagazineac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owomagazineac1 = "owo_jungle_mag_helper_03", owomagazineac2 = "owo_jungle_mag_connector_f_01", 
				owomagazineac3 = "owo_jungle_mag_connector_b_01", owomagazineac4 = "owo_jungle_mag_connector_l_01", owomagazineac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owomagazineac1 = "owo_jungle_mag_helper_04", owomagazineac2 = "owo_jungle_mag_connector_f_01", 
				owomagazineac3 = "owo_jungle_mag_connector_b_01", owomagazineac4 = "owo_jungle_mag_connector_l_01", owomagazineac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- Empty
		owo_jungle_mag_empty = {
			model = "", type = "owomagazineac1", 
			mesh_move = false, parent = "receiver"
		},
		-- Backup magazine
		owo_jungle_mag_helper_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "owomagazineac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_helper_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "owomagazineac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_helper_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "owomagazineac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_helper_04 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "owomagazineac1", 
			mesh_move = false, parent = "receiver"
		},
		-- "tape"
		owo_jungle_mag_connector_f_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owomagazineac2", 
			mesh_move = false, parent = "magazine"
		},
		owo_jungle_mag_connector_b_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owomagazineac3", 
			mesh_move = false, parent = "magazine"
		},
		owo_jungle_mag_connector_l_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owomagazineac4", 
			mesh_move = false, parent = "magazine"
		},
		owo_jungle_mag_connector_r_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owomagazineac5", 
			mesh_move = false, parent = "magazine"
		},
	})
end





--[[
TEMPLATES
mod.wc.add_custom_attachments.KUMQUAT = "KUMQUATList"
mod.wc.KUMQUATList = {
	""
}

function mod.owo_NAAAAAME(variant_id, type)
	mod.inject_attachments_owo(variant_id, "" or type, {
		{id = "owo_", name = "OwO "},
	})

	mod.inject_models(variant_id, {
		owo_ = {
			model = _item_ranged.."", type = "", 
			mesh_move = false, parent = "",
			automatic_equip = {
				 = ""
			}
		},
		owo_ _empty = {
			model = "", type = "", 
			mesh_move = false, parent = ""
		},
	})
end

mod.inject_fixes(this_variant, {
    {   dependencies = {
            "owo_"
        },
        grip = {
            offset = true, position = vector3_box(0, 0, 0), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(1, 1, 1)
        }
    }
})
]]