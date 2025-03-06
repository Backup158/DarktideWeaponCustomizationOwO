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
mod.mt.table_append(mod.wc.laser_pointers, {
	"owo_grip_laser_01",
	"owo_grip_laser_02",
})
-- MUZZLE
mod.mt.table_append(mod.wc.muzzle_2s, {
	"owo_suppressor_helper_empty",
	"owo_suppressor_helper_01",
	"owo_suppressor_helper_02",
	"owo_condom_helper_empty",
	"owo_condom_helper_01",
	"owo_muzzle_brake_helper_01_00",
	"owo_muzzle_brake_helper_01_01",
})
--	gonna be consistent with this even though i prefer muzzleac
mod.wc.add_custom_attachments.muzzle_3 = "muzzle_3_list"
mod.wc.muzzle_3_list = {
	"owo_muzzle_brake_helper_02_00",
	"owo_muzzle_brake_helper_02_01",
}
mod.wc.add_custom_attachments.muzzle_4 = "muzzle_4_list"
mod.wc.muzzle_4_list = {
	"owo_muzzle_brake_helper_03_00",
	"owo_muzzle_brake_helper_03_01",
}
mod.wc.add_custom_attachments.muzzle_5 = "muzzle_5_list"
mod.wc.muzzle_5_list = {
	"owo_muzzle_brake_helper_04_00",
	"owo_muzzle_brake_helper_04_01",
}
-- BARREL
if mod.syn then
	mod.mt.table_append(mod.wc.barrelshrouds, {
		"owo_dreg_shroud_empty",
		"owo_dreg_shroud_01",
		"owo_m16_empty",
		"owo_m16_barrelshroud_a1",
		"owo_m16_barrelshroud_a1_02",
		"owo_m16_barrelshroud_a2",
		"owo_wood_krieg_empty",
		"owo_wood_krieg_ac1_01",
		"owo_revolver_shotgun_barrel_empty",
		"owo_revolver_shotgun_barrel_04",
		"owo_revolver_shotgun_barrel_05",
		"owo_revolver_shotgun_barrel_06",
		"owo_revolver_shotgun_barrel_08",
		"owo_bistol_shotgun_barrel_short_empty", 
		"owo_bistol_shotgun_barrel_short_04",
		"owo_bistol_shotgun_barrel_short_05",
		"owo_bistol_shotgun_barrel_short_06",
		"owo_bistol_shotgun_barrel_short_08",
	})
	mod.mt.table_append(mod.wc.barrelshroudac2s, {
		"owo_dreg_shroud_empty_02",
		"owo_dreg_shroudac2_01",
		"owo_m16_empty_02",
		"owo_m16_barrelshroudac2_01",
	})
	mod.mt.table_append(mod.wc.barrelshroudac3s, {
		"owo_dreg_shroud_empty_03",
		"owo_dreg_shroudac3_01",
		"owo_m16_empty_03",
		"owo_m16_barrelshroudac3_01",
	})
	mod.mt.table_append(mod.wc.barrelshroudac4s, {
		"owo_dreg_shroud_empty_04",
		"owo_dreg_shroudac4_01",
		"owo_m16_empty_04",
		"owo_m16_barrelshroudac4_01",
	})
	mod.mt.table_append(mod.wc.barrelshroudac5s, {
		"owo_m16_empty_05",
		"owo_m16_barrelshroudac5_01",
	})
	mod.mt.table_append(mod.wc.barrelshroudac6s, {
		"owo_m16_empty_06",
		"owo_m16_barrelshroudac6_01",
	})
else 
	mod.wc.add_custom_attachments.barrelshroud = "barrelshrouds"
	mod.wc.barrelshrouds = {
		"owo_revolver_shotgun_barrel_empty",
		--"owo_revolver_shotgun_barrel_01",
		"owo_revolver_shotgun_barrel_04",
		"owo_revolver_shotgun_barrel_05",
		"owo_revolver_shotgun_barrel_06",
		"owo_revolver_shotgun_barrel_08",
		--"owo_revolver_shotgun_barrel_09",
		--"owo_revolver_shotgun_barrel_04_l",
		--"owo_revolver_shotgun_barrel_05_l",
		--"owo_revolver_shotgun_barrel_06_l",
		--"owo_revolver_shotgun_barrel_08_l",
		"owo_dreg_shroud_empty",
		"owo_dreg_shroud_01",
		"owo_wood_krieg_empty",
		"owo_wood_krieg_ac1_01",
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
		-- "owo_bistol_shotgun_barrel_short_01",
		"owo_bistol_shotgun_barrel_short_04",
		"owo_bistol_shotgun_barrel_short_05",
		"owo_bistol_shotgun_barrel_short_06",
		"owo_bistol_shotgun_barrel_short_08",
		-- "owo_bistol_shotgun_barrel_short_09",
	}
	--[[mod.wc.add_custom_attachments.barrelshroudac = "barrelshroudacs"
	mod.wc.barrelshroudacs = {
		"owo_dreg_shroud_empty",
		"owo_dreg_shroudac_01"
	}]]
	mod.wc.add_custom_attachments.barrelshroudac2 = "barrelshroudac2s"
	mod.wc.barrelshroudac2s = {
		"owo_dreg_shroud_empty",
		"owo_dreg_shroudac2_01",
		"owo_m16_empty",
		"owo_m16_barrelshroudac2_01",
	}
	mod.wc.add_custom_attachments.barrelshroudac3 = "barrelshroudac3s"
	mod.wc.barrelshroudac3s = {
		"owo_dreg_shroud_empty",
		"owo_dreg_shroudac3_01",
		"owo_m16_empty",
		"owo_m16_barrelshroudac3_a1",
	}
	mod.wc.add_custom_attachments.barrelshroudac4 = "barrelshroudac4s"
	mod.wc.barrelshroudac4s = {
		"owo_dreg_shroud_empty",
		"owo_dreg_shroudac4_01",
		"owo_m16_sight_empty",
		"owo_m16_sight_helper_04",
	}
	mod.wc.add_custom_attachments.barrelshroudac5 = "barrelshroudac5s"
	mod.wc.barrelshroudac5s = {
		"owo_m16_sight_empty",
		"owo_m16_sight_helper_05",
	}
	mod.wc.add_custom_attachments.barrelshroudac6 = "barrelshroudac6s"
	mod.wc.barrelshroudac6s = {
		"owo_m16_sight_empty",
		"owo_m16_sight_helper_06",
	}
end
-- FOREGRIP
mod.mt.table_append(mod.wc.foregrips, {
	"owo_tactical_foregrip_01",
})
mod.wc.add_custom_attachments.foregripac1 = "foregripac1_list"
mod.wc.foregripac1_list = {
	"owo_tactical_foregrip_ac1_empty",
	"owo_tactical_foregrip_ac1_01",
}
mod.wc.add_custom_attachments.foregripac2 = "foregripac2_list"
mod.wc.foregripac2_list = {
	"owo_tactical_foregrip_ac2_empty",
	"owo_tactical_foregrip_ac2_01",
}
mod.wc.add_custom_attachments.foregripac3 = "foregripac3_list"
mod.wc.foregripac3_list = {
	"owo_tactical_foregrip_ac3_empty",
	"owo_tactical_foregrip_ac3_01",
}
-- BAYONET
mod.wc.add_custom_attachments.bayonetac1 = "bayonetac1_list"
mod.wc.bayonetac1_list = {
	"owo_dreg_bayonet_empty",
	"owo_dreg_bayonet_rear_01",
	"owo_bayonet_empty_01",
	"owo_bayonet_m7_helper_01",
	"owo_bayonet_seitengewehr_helper_01",
	"owo_bayonet_epee_helper_01",
	"owo_underbarrel_gl_empty_01",
	"owo_m203_helper_01",
	"owo_underbarrel_shotgun_helper_01",
	"owo_underbarrel_shotgun_helper_01_02",
}
mod.wc.add_custom_attachments.bayonetac2 = "bayonetac2_list"
mod.wc.bayonetac2_list = {
	"owo_bayonet_empty_02",
	"owo_bayonet_m7_helper_02",
	"owo_bayonet_seitengewehr_helper_01",
	"owo_bayonet_epee_helper_01",
	"owo_underbarrel_gl_empty_02",
	"owo_m203_helper_02",
	"owo_underbarrel_shotgun_helper_02",
	"owo_underbarrel_shotgun_helper_02_02",
}
mod.wc.add_custom_attachments.bayonetac3 = "bayonetac3_list"
mod.wc.bayonetac3_list = {
	"owo_underbarrel_gl_empty_03",
	"owo_m203_helper_03",
	"owo_underbarrel_shotgun_helper_03",
	"owo_underbarrel_shotgun_helper_03_02",
}
mod.wc.add_custom_attachments.bayonetac4 = "bayonetac4_list"
mod.wc.bayonetac4_list = {
	"owo_underbarrel_gl_empty_04",
	"owo_m203_helper_04",
	"owo_underbarrel_shotgun_helper_04",
}
mod.wc.add_custom_attachments.bayonetac5 = "bayonetac5_list"
mod.wc.bayonetac5_list = {
	"owo_underbarrel_shotgun_empty_05",
	"owo_underbarrel_shotgun_helper_05",
	"owo_underbarrel_shotgun_helper_05_02",
	"owo_underbarrel_gl_empty_05",
	"owo_underbarrel_shotgun_helper_05",
}
mod.wc.add_custom_attachments.bayonetac6 = "bayonetac6_list"
mod.wc.bayonetac6_list = {
	"owo_underbarrel_shotgun_empty_06",
	"owo_underbarrel_shotgun_helper_06",
	"owo_underbarrel_shotgun_helper_06_02",
}
mod.wc.add_custom_attachments.bayonetac7 = "bayonetac7_list"
mod.wc.bayonetac7_list = {
	"owo_underbarrel_shotgun_empty_07",
	"owo_underbarrel_shotgun_helper_07",
}
-- GRIP
mod.mt.table_append(mod.wc.gripacs, {
	"owo_fin_grip2_empty",
	"owo_fin_grip2_01",
})
-- MAGAZINE
mod.wc.add_custom_attachments.owo_magac1 = "owo_magac1_list"
mod.wc.owo_magac1_list = {
	"owo_jungle_mag_empty_01",
	"owo_jungle_mag_helper_01",
	"owo_jungle_mag_helper_02",
	"owo_jungle_mag_helper_03",
	"owo_jungle_mag_helper_04",
	"owo_magazine_magpull_helper_01_empty",
	"owo_magazine_magpull_helper_01",
}
mod.wc.add_custom_attachments.owo_magac2 = "owo_magac2_list"
mod.wc.owo_magac2_list = {
	"owo_jungle_mag_empty_02",
	"owo_jungle_mag_connector_f_01",
	"owo_magazine_magpull_helper_02_empty",
	"owo_magazine_magpull_helper_02",
}
mod.wc.add_custom_attachments.owo_magac3 = "owo_magac3_list"
mod.wc.owo_magac3_list = {
	"owo_jungle_mag_empty_03",
	"owo_jungle_mag_connector_b_01",
	"owo_magazine_magpull_helper_03_empty",
	"owo_magazine_magpull_helper_03",
}
mod.wc.add_custom_attachments.owo_magac4 = "owo_magac4_list"
mod.wc.owo_magac4_list = {
	"owo_jungle_mag_empty_04",
	"owo_jungle_mag_connector_l_01",
}
mod.wc.add_custom_attachments.owo_magac5 = "owo_magac5_list"
mod.wc.owo_magac5_list = {
	"owo_jungle_mag_empty_05",
	"owo_jungle_mag_connector_r_01",
}
if mod.syn then
	mod.mt.table_append(mod.wc.rearmags, {
		"owo_lasgun_magazine_rear_child_empty",
		"owo_lasgun_magazine_rear_child_01",
	})
else 
	mod.wc.add_custom_attachments.rearmag = "rearmags"
	mod.wc.rearmags = {
		"owo_lasgun_magazine_rear_child_empty",
		"owo_lasgun_magazine_rear_child_01",
	}
end
-- SIGHT
mod.mt.table_append(mod.wc.sights, {
	"owo_holosight_01_02_z1",
	"owo_holosight_01_02_z2",
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
-- RECEIVER
--[[
mod.wc.add_custom_attachments.receiverac = "receiverac_list"
mod.wc.receiverac_list = {
}

table.insert(mod.wc.attachment_slots, "receiverac")
mod:add_global_localize_strings({
    loc_weapon_cosmetics_customization_receiverac = {
        en = "Receiver Attachment",
	},
})
]]
mod.wc.add_custom_attachments.receiverac1 = "receiverac1_list"
mod.wc.receiverac1_list = {
	"owo_bolt_grip_empty",
	"owo_bolt_helbore_bolt_01",
	"owo_laspistol_grip_mag_helper_empty",
	"owo_laspistol_grip_mag_helper_01",
	"owo_helbore_mas49_ass",
}
mod.wc.add_custom_attachments.receiverac2 = "receiverac2_list"
mod.wc.receiverac2_list = {
	"owo_bolt_shaft_empty",
	"owo_bolt_helbore_bolt_02",
	"owo_laspistol_grip_mag_helper_empty",
	"owo_laspistol_grip_mag_helper2_01",
	"owo_helbore_mas49_knob",
}
-- STOCKS
mod.mt.table_append(mod.wc.stockacs, {
	"owo_gripstock_grip_empty",
	"owo_gripstock_grip_01a",
})

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
-- Flashlight/Special: Grip Laser
function mod.owo_grip_laser(variant_id, type)
	mod.inject_attachments_owo(variant_id, "flashlight" or type, {
		{id = "owo_grip_laser_01", name = "OwO Trigger Guard Laser (R)"},
		{id = "owo_grip_laser_02", name = "OwO Trigger Guard (G)"},
	})

	mod.inject_models(variant_id, {
		owo_grip_laser_01 = {
			--[[ FLASHLIGHT DISCUSSION
			EWC 	= Extended Weapon Customization
			wc 		= weapon_customization

			flashlight details found in wc/scripts/mods/wc/weapon_attachments/common_ranged.lua in flashlight_data table
			To add laser sight, EWC uses wc/extensions/laser_pointer_extension.lua
				this does a manual check to see if the flashlight is 'laser_pointer', the ID for the built in laser pointer gras added
					i tried adding a manual check for this one too, but it's not working
				the preview part is handled by wc/extensions/flashlight_extension.lua
					added a manual check to has_laser_pointer. also didn't work
						function calling for has_laser_pointer also checks if laser is enabled in mod settings
					Adding an additional entry to the templates DID work, but only for the flashlight light (flashlight_templates), not the beam
					flashlight_extension.lua has is_laser_pointer()
							adding checks for this WORKS! but the laser is still red
				there also seems to be references in wc/patches/weapon_templates.lua and wc/weapon_customization_anchors.lua
					1 just calling extension and writing text to ui
					2 specifying position and creates laser_pointer table
					tried injectign to table (above)
						mod.mt.table_append(mod.wc.laser_pointers, {
							"owo_grip_laser_01",
						})
						the table is laser_pointers. the name for the table in anchor is laser_pointer (which will throw errors if you try to use that as the inject)
							trying to inject to a pointer instead of a table
						weird thing is, that table contains flashlight_04 instead of laser_pointer
					3 classes/gear_settings.lua and utilities/weapon_templates.lua reference laser_pointer but it's commented out
						prob before gras implemented the extension file or while testing
				didnt work

				TLDR
				wc/extensions/flashlight_extension.lua
				    can edit existing laser spot_angle to remove flashlight part and keep laser beam
					add your own laser:
						add an entry to that table
						add check for FlashlightExtension.is_laser_pointer
						maybe? add check in mod.has_flashlight
						add check in mod.preview_flashlight
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
		{id = "owo_suppressor_02", name = "OwO Suppressor 2"},
		{id = "owo_suppressor_03", name = "OwO Suppressor 3 (PBS-1)"},
		{id = "owo_suppressor_04", name = "OwO Suppressor 4"},
		{id = "owo_suppressor_05", name = "OwO Suppressor 5"},
	})
	mod.inject_attachments_owo(variant_id, "muzzle_2" or type, {
		{id = "owo_suppressor_helper_empty", name = "muzzle_2 Empty", no_randomize = true},
		{id = "owo_suppressor_helper_01", name = "OwO Suppressor'vesa 1", no_randomize = true},
		{id = "owo_suppressor_helper_02", name = "OwO Suppressor'vesa 2", no_randomize = true},
		{id = "owo_suppressor_helper_03", name = "OwO Suppressor'vesa 3", no_randomize = true},
		{id = "owo_suppressor_helper_04", name = "OwO Suppressor'vesa 4", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ####
		owo_suppressor_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_01"
			}
		},
		owo_suppressor_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_02"
			}
		},
		owo_suppressor_03 = {
			model = _item_ranged.."/barrels/rippergun_rifle_barrel_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_03"
			}
		},
		owo_suppressor_04 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_04"
			}
		},
		owo_suppressor_05 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_04"
			}
		},
		-- ### Empty ###
		owo_suppressor_helper_empty = {
			model = "", type = "muzzle_2", mesh_move = false, parent = "barrel"
		},
		-- ### Helpers ###
		owo_suppressor_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle_2", mesh_move = false, parent = "barrel"
		},
		owo_suppressor_helper_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle_2", mesh_move = false, parent = "barrel"
		},
		owo_suppressor_helper_03 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "muzzle_2", mesh_move = false, parent = "barrel"
		},
		owo_suppressor_helper_04 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "muzzle_2", mesh_move = false, parent = "barrel"
		},
	})
end

-- Muzzle: Lasgun Condom
function mod.owo_condom(variant_id, type)
	mod.inject_attachments_owo(variant_id, "muzzle" or type, {
		{id = "owo_condom_01", name = "OwO Lasbarrel Condom", no_randomize = true}
	})
	mod.inject_attachments_owo(variant_id, "muzzle_2" or type, {
		{id = "owo_condom_helper_empty", name = "Condom'vesa Empty", no_randomize = true},
		{id = "owo_condom_helper_01", name = "OwO Condom'vesa", no_randomize = true}
	})

	mod.inject_models(variant_id, {
		owo_condom_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_condom_helper_01"
			}
		},
		owo_condom_helper_empty = {
			model = "", type = "muzzle_2", mesh_move = false, parent = "barrel"
		},
		owo_condom_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle_2", mesh_move = false, parent = "barrel"
		},
	})
end

-- Muzzle: Muzzle Brake
function mod.owo_muzzle_brake(variant_id, type)
	mod.inject_attachments_owo(variant_id, "muzzle" or type, {
		{id = "owo_muzzle_brake_01", name = "OwO Muzzle Break 50 Cal", no_randomize = true}
	})
	mod.inject_attachments_owo(variant_id, "muzzle_2" or type, {
		{id = "owo_muzzle_brake_helper_01_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_01_01", name = "OwO Muzzle Brake'vesa", no_randomize = true}
	})
	mod.inject_attachments_owo(variant_id, "muzzle_3" or type, {
		{id = "owo_muzzle_brake_helper_02_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_02_01", name = "OwO Muzzle Brake'vesa", no_randomize = true}
	})
	mod.inject_attachments_owo(variant_id, "muzzle_4" or type, {
		{id = "owo_muzzle_brake_helper_03_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_03_01", name = "OwO Muzzle Brake'vesa", no_randomize = true}
	})
	mod.inject_attachments_owo(variant_id, "muzzle_5" or type, {
		{id = "owo_muzzle_brake_helper_04_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_04_01", name = "OwO Muzzle Brake'vesa", no_randomize = true}
	})

	mod.inject_models(variant_id, {
		owo_muzzle_brake_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_killshot_muzzle_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_muzzle_brake_helper_01_01", muzzle_3 = "owo_muzzle_brake_helper_02_01", 
				muzzle_4 = "owo_muzzle_brake_helper_03_01", muzzle_5 = "owo_muzzle_brake_helper_04_01", 
			}
		},
		-- ### Helpers ###
		owo_muzzle_brake_helper_01_00 = {
			model = "", type = "muzzle_2", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_01_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle_2", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_02_00 = {
			model = "", type = "muzzle_3", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_02_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle_3", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_03_00 = {
			model = "", type = "muzzle_4", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_03_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle_4", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_04_00 = {
			model = "", type = "muzzle_5", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_04_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle_5", mesh_move = false, parent = "muzzle"
		},
		--[[owo_muzzle_brake_helper_05_00 = {
			model = "", type = "muzzle_6", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_05_01 = {
			model = _item_ranged.."/underbarrels/shotgun_pump_action_underbarrel_01", type = "muzzle_6", mesh_move = false, parent = "muzzle"
		},]]
	})
end

-- Barrel: Bolt Pistol Shotgun barrel (short)
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
		{id = "owo_bistol_sg_base_04_s", name = "OwO Sg Super Shorty 1 (4)"},
		{id = "owo_bistol_sg_base_05_s", name = "OwO Sg Super Shorty 2 (5)"},
		{id = "owo_bistol_sg_base_06_s", name = "OwO Sg Super Shorty 3 (6)"},
		{id = "owo_bistol_sg_base_08_s", name = "OwO Sg Super Shorty 4 (8)"},
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
		owo_bistol_sg_base_04_s = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_04",
			}
		}, 
		owo_bistol_sg_base_05_s = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_05",
			}
		}, 
		owo_bistol_sg_base_06_s = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_06",
			}
		}, 
		owo_bistol_sg_base_08_s = {
			model = _item_ranged.."/barrels/boltgun_pistol_barrel_01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_bistol_shotgun_barrel_short_08",
			}
		}, 
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
			mesh_move = false, parent = "barrel",
		},
		owo_bistol_shotgun_barrel_short_05 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_05", type = "barrelshroud", 
			mesh_move = false, parent = "barrel",
		},
		owo_bistol_shotgun_barrel_short_06 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_06", type = "barrelshroud", 
			mesh_move = false, parent = "barrel",
		},
		owo_bistol_shotgun_barrel_short_08 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_08", type = "barrelshroud", 
			mesh_move = false, parent = "barrel",
		},
		--[[owo_bistol_shotgun_barrel_short_09 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_09", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		}
		]]
	})
end

-- Barrel: Revolver Shotgun Barrel
function mod.owo_revolver_shotgun_barrel(variant_id, type)
	--[[ what the FUCK is wrong with barrels 1 and 9
	]]
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		--{id = "owo_revolver_shotgun_barrel_base_01", name = "OwO Shotgun Barrel 1 (1)"},
		{id = "owo_revolver_shotgun_barrel_base_04", name = "OwO Shotgun Barrel 1 (4)"},
		{id = "owo_revolver_shotgun_barrel_base_05", name = "OwO Shotgun Barrel 2 (5)"},
		{id = "owo_revolver_shotgun_barrel_base_06", name = "OwO Shotgun Barrel 3 (6)"},
		-- barrel 7 with the skulls is too squished
		{id = "owo_revolver_shotgun_barrel_base_08", name = "OwO Shotgun Barrel 4 (8)"},
		--{id = "owo_revolver_shotgun_barrel_base_09", name = "OwO Shotgun Barrel 6 (9)"},
		--[[{id = "owo_revolver_shotgun_barrel_base_04_l", name = "OwO Shotgun Barrel Long 1 (4)"},
		{id = "owo_revolver_shotgun_barrel_base_05_l", name = "OwO Shotgun Barrel Long 2 (5)"},
		{id = "owo_revolver_shotgun_barrel_base_06_l", name = "OwO Shotgun Barrel Long 3 (6)"},
		{id = "owo_revolver_shotgun_barrel_base_08_l", name = "OwO Shotgun Barrel Long 4 (8)"},
		]]
	})
	mod.inject_attachments_owo(variant_id, "barrelshroud" or type, {
		{id = "owo_revolver_shotgun_barrel_empty", name = "Empty Barrelshroud"},
		--{id = "owo_revolver_shotgun_barrel_01", name = "OwO Shotgun Barrel 1 (1)"},
		{id = "owo_revolver_shotgun_barrel_04", name = "OwO Shotgun Barrel 1 (4)"},
		{id = "owo_revolver_shotgun_barrel_05", name = "OwO Shotgun Barrel 2 (5)"},
		{id = "owo_revolver_shotgun_barrel_06", name = "OwO Shotgun Barrel 3 (6)"},
		-- barrel 7 with the skulls is too squished
		{id = "owo_revolver_shotgun_barrel_08", name = "OwO Shotgun Barrel 4 (8)"},
		--{id = "owo_revolver_shotgun_barrel_09", name = "OwO Shotgun Barrel 6 (9)"},
	})

	mod.inject_models(variant_id, {
		--[[owo_revolver_shotgun_barrel_base_01 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_01"},
		},]]
		owo_revolver_shotgun_barrel_base_04 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", -- parent = "receiver",
			-- this was in wc/weapon_attachments/stub.lua and i thought it'd fix the animation issue but no fuck me im just too desperate
			-- angle = -.5, move = vector3_box(0, -2, 0), remove = vector3_box(0, .1, 0),
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_04"},
		},
		owo_revolver_shotgun_barrel_base_05 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", -- parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_05"},
		},
		owo_revolver_shotgun_barrel_base_06 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", -- parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_06"},
		},
		owo_revolver_shotgun_barrel_base_08 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", -- parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_08"},
		},
		--[[owo_revolver_shotgun_barrel_base_09 = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_09"},
		},]]
		--[[owo_revolver_shotgun_barrel_base_04_l = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_04"},
		},
		owo_revolver_shotgun_barrel_base_05_l = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_05"},
		},
		owo_revolver_shotgun_barrel_base_06_l = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_06"},
		},
		owo_revolver_shotgun_barrel_base_08_l = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_08"},
		},
		]]
		owo_revolver_shotgun_barrel_empty = {
			model = "", type = "barrelshroud", parent = "barrel",
		},
		--[[owo_revolver_shotgun_barrel_01 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_01", type = "barrelshroud", parent = "barrel",
		},]]
		owo_revolver_shotgun_barrel_04 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_04", type = "barrelshroud", parent = "barrel",
		},
		owo_revolver_shotgun_barrel_05 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_05", type = "barrelshroud", parent = "barrel",
		},
		owo_revolver_shotgun_barrel_06 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_06", type = "barrelshroud", parent = "barrel",
		},
		owo_revolver_shotgun_barrel_08 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_08", type = "barrelshroud", parent = "barrel",
		},
		--[[owo_revolver_shotgun_barrel_09 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_09", type = "barrelshroud", parent = "barrel",
		},]]
	})
end

-- Barrel: Dreg Gunner barrel
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
		{id = "owo_dreg_shroud_empty_02", name = "Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_shroudac2_01", name = "OwO Dreg Shroud Ac2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac3", {
		{id = "owo_dreg_shroud_empty_03", name = "Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_shroudac3_01", name = "OwO Dreg Shroud Ac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac4", {
		{id = "owo_dreg_shroud_empty_04", name = "Dreg Shroud Empty", no_randomize = true},
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
				barrelshroudac4= "owo_dreg_shroudac4_01",
			},
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
		owo_dreg_shroud_empty_02 = {
			model = "", type = "barrelshroudac2", 
			mesh_move = false, parent = 'receiver'
		},
		owo_dreg_shroud_empty_03 = {
			model = "", type = "barrelshroudac3", 
			mesh_move = false, parent = 'receiver'
		},
		owo_dreg_shroud_empty_04 = {
			model = "", type = "barrelshroudac4", 
			mesh_move = false, parent = 'receiver'
		},
	})
end

-- Barrel: M16 barrels
-- 		Autoguns
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
		{id = "owo_m16_empty_02", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac2_01", name = "OwO M16 Front Sight shroudac", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac3" or type, {
		{id = "owo_m16_empty_03", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac3_a1", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac4" or type, {
		{id = "owo_m16_empty_04", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac4_01", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac5" or type, {
		{id = "owo_m16_empty_05", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac5_01", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac6" or type, {
		{id = "owo_m16_empty_06", name = "OwO Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac6_01", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Main Parts ###
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
		-- ### Helper Parts ###
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
		-- ### Empty ###
		owo_m16_empty = {
			model = "", type = "barrelshroud", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_empty_02 = {
			model = "", type = "barrelshroudac2", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_empty_03 = {
			model = "", type = "barrelshroudac3", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_empty_04 = {
			model = "", type = "barrelshroudac4", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_empty_05 = {
			model = "", type = "barrelshroudac5", 
			mesh_move = false, parent = "receiver"
		},
		owo_m16_empty_06 = {
			model = "", type = "barrelshroudac6", 
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
	mod.inject_attachments_owo(variant_id, "barrelshroud" or type, {
		{id = "owo_wood_krieg_empty", name = "Empty Barrel", no_randomize = true},
		{id = "owo_wood_krieg_ac1_01", name = "OwO Wooden Helbore ac1 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_wood_krieg_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_02", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_wood_krieg_ac1_01", }
		},
		owo_wood_krieg_02 = {
			model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_04", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_wood_krieg_ac1_01", }
		},
		owo_wood_krieg_03 = {
			model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_ml01", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_wood_krieg_ac1_01", }
		},
		-- ### Helper Parts ###
		owo_wood_krieg_ac1_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = "barrelshroud", 
			mesh_move = false, parent = "barrel",
		},
		-- ### Empty ###
		owo_wood_krieg_empty = {
			model = "", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		},
	})

end

-- Foregrip: Tactical Foregrips
function mod.owo_tactical_foregrip(variant_id, type)
	mod.inject_attachments_owo(variant_id, "foregrip" or type, {
		{id = "owo_tactical_foregrip_01", name = "OwO Angled Foregrip (AFG) 1"},
		{id = "owo_tactical_foregrip_02", name = "OwO AFG 1 Slanted"},
		{id = "owo_tactical_foregrip_03", name = "OwO AFG 2"},
		{id = "owo_tactical_foregrip_04", name = "OwO AFG 3"},
	})
	mod.inject_attachments_owo(variant_id, "foregripac1" or type, {
		{id = "owo_tactical_foregrip_ac1_empty", name = "OwO foregripac1 empty"},
		{id = "owo_tactical_foregrip_ac1_01", name = "OwO AFGac2'vesa 1"},
	})
	mod.inject_attachments_owo(variant_id, "foregripac2" or type, {
		{id = "owo_tactical_foregrip_ac2_empty", name = "OwO foregripac2 empty"},
		{id = "owo_tactical_foregrip_ac2_01", name = "OwO AFGac2'vesa 1"},
	})
	mod.inject_attachments_owo(variant_id, "foregripac3" or type, {
		{id = "owo_tactical_foregrip_ac3_empty", name = "OwO foregripac3 empty"},
		{id = "owo_tactical_foregrip_ac3_01", name = "OwO AFGac3'vesa 1"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_tactical_foregrip_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_foregrip_02 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_foregrip_03 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_foregrip_04 = {
			model = _item_ranged.."/grips/plasma_rifle_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { foregripac1 = "owo_tactical_foregrip_ac1_01", foregripac2 = "owo_tactical_foregrip_ac2_01", 
				foregripac3 = "owo_tactical_foregrip_ac3_01"
			},
		},
		-- ### Helper Parts ###
		-- AC1
		--  magpul afg back part 1
		owo_tactical_foregrip_ac1_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "foregripac1", 
			mesh_move = false, parent = "receiver",
		},
		-- AC2
		-- 	magpul afg back part 2
		owo_tactical_foregrip_ac2_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "foregripac2", 
			mesh_move = false, parent = "receiver",
		},
		-- AC3
		-- 	magpul afg front
		owo_tactical_foregrip_ac3_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "foregripac3", 
			mesh_move = false, parent = "receiver",
		},
		-- ### Empty ###
		owo_tactical_foregrip_ac1_empty = {
			model = "", type = "foregripac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_tactical_foregrip_ac2_empty = {
			model = "", type = "foregripac2", 
			mesh_move = false, parent = "receiver"
		},
		owo_tactical_foregrip_ac3_empty = {
			model = "", type = "foregripac3", 
			mesh_move = false, parent = "receiver"
		},
	})
end

-- Foregrip: Heterosexual Foregrips
function mod.owo_heterosexual_foregrip(variant_id)
	mod.inject_attachments_owo(variant_id, "foregrip", {
		{id = "owo_heterosexual_foregrip_grip_01", name = "OwO Straight Grip (SG) 1"},
		{id = "owo_heterosexual_foregrip_grip_02", name = "OwO SG 2"},
		{id = "owo_heterosexual_foregrip_grip_03", name = "OwO SG 3"},
		{id = "owo_heterosexual_foregrip_grip_04", name = "OwO SG 4"},
		{id = "owo_heterosexual_foregrip_grip_05", name = "OwO SG 5"},
		{id = "owo_heterosexual_foregrip_grip_06", name = "OwO SG 6"},
		{id = "owo_heterosexual_foregrip_grip_07", name = "OwO SG 7"},
		{id = "owo_heterosexual_foregrip_grip_08", name = "OwO SG Brauto 1"},
		{id = "owo_heterosexual_foregrip_grip_09", name = "OwO SG Brauto 2"},
		{id = "owo_heterosexual_foregrip_grip_10", name = "OwO SG Brauto 3"},
		{id = "owo_heterosexual_foregrip_grip_11", name = "OwO SG Brauto 4"},
		{id = "owo_heterosexual_foregrip_grip_12", name = "OwO SG Brauto 5"},
		{id = "owo_heterosexual_foregrip_grip_13", name = "OwO SG HHA"},
		{id = "owo_heterosexual_foregrip_grip_14", name = "OwO StraightGassin Boltussy 1"},
		{id = "owo_heterosexual_foregrip_grip_15", name = "OwO StraightGassin Boltussy 2"},
		{id = "owo_heterosexual_foregrip_grip_16", name = "OwO StraightGassin Boltussy 3"},
		{id = "owo_heterosexual_foregrip_grip_17", name = "OwO StraightGassin Boltussy 4"},
		{id = "owo_heterosexual_foregrip_grip_18", name = "OwO StraightGassin Boltussy 5"},
		{id = "owo_heterosexual_foregrip_grip_19", name = "OwO StraightGassin Boltussy 6"},
		{id = "owo_heterosexual_foregrip_grip_20", name = "OwO StraightGassin Boltussy 7"},
		{id = "owo_heterosexual_foregrip_grip_21", name = "OwO SG LasPee 1"},
		{id = "owo_heterosexual_foregrip_grip_22", name = "OwO SG LasPee 2"},
		{id = "owo_heterosexual_foregrip_grip_23", name = "OwO SG LasPee 3"},
		{id = "owo_heterosexual_foregrip_grip_24", name = "OwO SG LasPee 4"},
		{id = "owo_heterosexual_foregrip_grip_25", name = "OwO SG LasPee 5"},
		{id = "owo_heterosexual_foregrip_grip_26", name = "OwO SG Flamer UTI 1"},
		{id = "owo_heterosexual_foregrip_grip_27", name = "OwO SG Flamer UTI 2"},
		{id = "owo_heterosexual_foregrip_grip_28", name = "OwO SG Flamer UTI 3"},
		{id = "owo_heterosexual_foregrip_grip_29", name = "OwO SG Flamer UTI 4"},
		{id = "owo_heterosexual_foregrip_knife_01", name = "OwO SG Knife 1"},
		{id = "owo_heterosexual_foregrip_knife_02", name = "OwO SG Knife 2"},
		{id = "owo_heterosexual_foregrip_knife_03", name = "OwO SG Knife 3"},
		{id = "owo_heterosexual_foregrip_knife_04", name = "OwO SG Knife 4"},
		{id = "owo_heterosexual_foregrip_knife_05", name = "OwO SG Knife 5"},
		{id = "owo_heterosexual_foregrip_knife_06", name = "OwO SG Knife 6"},
		{id = "owo_heterosexual_foregrip_knife_06_fat", name = "OwO SG Knife 6 (wide)"},
		{id = "owo_heterosexual_foregrip_knife_01s", name = "OwO StubbyG Knife 1"},
		{id = "owo_heterosexual_foregrip_knife_02s", name = "OwO StubbyG Knife 2"},
		{id = "owo_heterosexual_foregrip_knife_03s", name = "OwO StubbyG Knife 3"},
		{id = "owo_heterosexual_foregrip_knife_04s", name = "OwO StubbyG Knife 4"},
		{id = "owo_heterosexual_foregrip_knife_05s", name = "OwO StubbyG Knife 5"},
		{id = "owo_heterosexual_foregrip_knife_06s", name = "OwO StubbyG Knife 6"},
		{id = "owo_heterosexual_foregrip_knife_06s_fat", name = "OwO StubbyG Knife 6 (wide)"},
		{id = "owo_heterosexual_foregrip_01", name = "OwO SG Cleaver 1"},
		{id = "owo_heterosexual_foregrip_02", name = "OwO SG Cleaver 2"},
		{id = "owo_heterosexual_foregrip_03", name = "OwO SG Cleaver 3"},
		{id = "owo_heterosexual_foregrip_04", name = "OwO SG Cleaver 4"},
		{id = "owo_heterosexual_foregrip_05", name = "OwO SG Cleaver 5"},
		{id = "owo_heterosexual_foregrip_06", name = "OwO SG Cleaver 6"},
		{id = "owo_heterosexual_foregrip_07", name = "OwO SG Cleaver 7"},
		{id = "owo_heterosexual_foregrip_08", name = "OwO SG Cleaver 8"},
		{id = "owo_heterosexual_foregrip_09", name = "OwO SG DClaw 1"},
		{id = "owo_heterosexual_foregrip_10", name = "OwO SG DClaw 2"},
		{id = "owo_heterosexual_foregrip_11", name = "OwO SG DClaw 3"},
		{id = "owo_heterosexual_foregrip_12", name = "OwO SG DClaw 4"},
		{id = "owo_heterosexual_foregrip_13", name = "OwO SG DClaw 5"},
		{id = "owo_heterosexual_foregrip_14", name = "OwO SG DClaw 6"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- Grips 
		owo_heterosexual_foregrip_grip_01 = {
			model = _item_ranged.."/grips/grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_02 = {
			model = _item_ranged.."/grips/grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_03 = {
			model = _item_ranged.."/grips/grip_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_04 = {
			model = _item_ranged.."/grips/grip_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_05 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_06 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_07 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_08 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_09 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_10 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_11 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_12 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_13 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_killshot_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_14 = {
			model = _item_ranged.."/grips/boltgun_pistol_grip_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_15 = {
			model = _item_ranged.."/grips/boltgun_pistol_grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_16 = {
			model = _item_ranged.."/grips/boltgun_pistol_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_17 = {
			model = _item_ranged.."/grips/boltgun_rifle_grip_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_18 = {
			model = _item_ranged.."/grips/boltgun_rifle_grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_19 = {
			model = _item_ranged.."/grips/boltgun_rifle_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_20 = {
			model = _item_ranged.."/grips/boltgun_rifle_grip_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_21 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_22 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_23 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_24 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_25 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_26 = {
			model = _item_ranged.."/grips/flamer_rifle_grip_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_27 = {
			model = _item_ranged.."/grips/flamer_rifle_grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_28 = {
			model = _item_ranged.."/grips/flamer_rifle_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_29 = {
			model = _item_ranged.."/grips/flamer_rifle_grip_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		-- Ogryn
		owo_heterosexual_foregrip_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_03 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_05 = {
			model = _item_ranged.."/handles/combat_blade_handle_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_06 = {
			model = _item_ranged.."/handles/combat_blade_handle_06", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_07 = {
			model = _item_ranged.."/handles/combat_blade_handle_07", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_08 = {
			model = _item_ranged.."/handles/combat_blade_handle_08", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		-- Dclaw
		owo_heterosexual_foregrip_09 = {
			model = _item_melee.."/grips/combat_sword_grip_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_10 = {
			model = _item_melee.."/grips/combat_sword_grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_11 = {
			model = _item_melee.."/grips/combat_sword_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_12 = {
			model = _item_melee.."/grips/combat_sword_grip_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_13 = {
			model = _item_melee.."/grips/combat_sword_grip_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_14 = {
			model = _item_melee.."/grips/combat_sword_grip_06", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		-- Knife 
		owo_heterosexual_foregrip_knife_01 = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_02 = {
			model = _item_melee.."/grips/combat_knife_grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_03 = {
			model = _item_melee.."/grips/combat_knife_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_04 = {
			model = _item_melee.."/grips/combat_knife_grip_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_05 = {
			model = _item_melee.."/grips/combat_knife_grip_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_06 = {
			model = _item_melee.."/grips/combat_knife_grip_06", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_06_fat = {
			model = _item_melee.."/grips/combat_knife_grip_06", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_01s = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_02s = {
			model = _item_melee.."/grips/combat_knife_grip_02", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_03s = {
			model = _item_melee.."/grips/combat_knife_grip_03", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_04s = {
			model = _item_melee.."/grips/combat_knife_grip_04", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_05s = {
			model = _item_melee.."/grips/combat_knife_grip_05", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_06s = {
			model = _item_melee.."/grips/combat_knife_grip_06", type = "foregrip", 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_06s_fat = {
			model = _item_melee.."/grips/combat_knife_grip_06", type = "foregrip", 
			mesh_move = false, parent = "receiver",
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
		{id = "owo_dreg_bayonet_empty_01", name = "Empty Bayonetac1", no_randomize = true},
		{id = "owo_dreg_bayonet_rear_01", name = "OwO Dreg Bayonet Hooker Ass", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_dreg_bayonet_01 = {
			model = _item_melee.."/blades/combat_blade_blade_03", type = "bayonet", 
			mesh_move = false, parent = 'barrel', 
			automatic_equip = {
				bayonetac1 = "owo_dreg_bayonet_rear_01"
			}
		},
		-- ### Helper Parts ###
		owo_dreg_bayonet_rear_01 = {
			model = _item_melee.."/blades/combat_blade_blade_05", type = "bayonetac1", 
			mesh_move = false, parent = 'barrel'
		}, 
		-- ### Empty ###
		owo_dreg_bayonet_empty = {
			model = "", type = "bayonet", 
			mesh_move = false, parent = 'barrel'
		},
		owo_dreg_bayonet_empty_01 = {
			model = "", type = "bayonetac1", 
			mesh_move = false, parent = 'barrel'
		},
	})
end

-- Bayonet: M7, Seitengewehr 98 (Butcher's Blade), Épée Baïonnette 1886
--		Autoguns, Helbores
function mod.owo_bayonet(variant_id, type)
	mod.inject_attachments_owo(variant_id, "bayonet" or type, {
		{id = "owo_bayonet_m7_01", name = "OwO M7 Bayonet"},
		{id = "owo_bayonet_seitengewehr", name = "OwO Seitengewehr 98"},
		{id = "owo_bayonet_epee", name = "OwO Épée Baïonnette 1886"},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac1" or type, {
		{id = "owo_bayonet_empty_01", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_bayonet_m7_helper_01", name = "M7 Bayonet Grip", no_randomize = true},
		{id = "owo_bayonet_seitengewehr_helper_01", name = "Seitengewehr Grip", no_randomize = true},
		{id = "owo_bayonet_epee_helper_01", name = "Epee Grip", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac2" or type, {
		{id = "owo_bayonet_empty_02", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_bayonet_m7_helper_02", name = "M7 Bayonet Lug", no_randomize = true},
		{id = "owo_bayonet_seitengewehr_helper_02", name = "Seitengewehr Grip bulge", no_randomize = true},
		{id = "owo_bayonet_epee_helper_02", name = "Epee loop d'loop", no_randomize = true},
	})
	
	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_bayonet_m7_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_bayonet_m7_helper_01",
				bayonetac2 = "owo_bayonet_m7_helper_02"
			}
		},
		owo_bayonet_seitengewehr = {
			model = _item_melee.."/blades/combat_knife_blade_01", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_bayonet_seitengewehr_helper_01",
				bayonetac2 = "owo_bayonet_seitengewehr_helper_02"
			}
		},
		owo_bayonet_epee = {
			model = _item_ranged.."/bayonets/bayonet_03", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_bayonet_epee_helper_01",
				bayonetac2 = "owo_bayonet_epee_helper_02"
			}
		},
		-- ### Helper Parts ###
		owo_bayonet_m7_helper_01 = {
			model = _item_melee.."/grips/combat_knife_grip_03", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet",
		},
		owo_bayonet_seitengewehr_helper_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet",
		},
		owo_bayonet_epee_helper_01 = {
			model = _item_melee.."/grips/combat_knife_grip_02", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet",
		},
		-- Bayonet lug
		owo_bayonet_m7_helper_02 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet",
		},
		owo_bayonet_seitengewehr_helper_02 = {
			model = _item_melee.."/grips/2h_chain_sword_grip_02", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet",
		},
		-- epee loopy
		owo_bayonet_epee_helper_02 = {
			model = _item_melee.."/heads/hatchet_head_03", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet",
		},
		-- ### Empty ###
		owo_bayonet_empty_01 = {
			model = "", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		owo_bayonet_empty_02 = {
			model = "", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet"
		},
		
	})
end

-- Bayonet: Underbarrel Grenade Launcher
function mod.owo_underbarrel_gl(variant_id, type)
	mod.inject_attachments_owo(variant_id, "bayonet" or type, {
		{id = "owo_m203", name = "OwO M203 Grenade Launcher"},
		{id = "owo_gp25", name = "OwO GP-25 Grenade Launcher"},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac1" or type, {
		{id = "owo_underbarrel_gl_empty_01", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_01", name = "OwO M203 ac1", no_randomize = true},
		{id = "owo_gp25_helper_01", name = "OwO GP25 ac1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac2" or type, {
		{id = "owo_underbarrel_gl_empty_02", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_02", name = "OwO M203 ac2", no_randomize = true},
		{id = "owo_gp25_helper_02", name = "OwO GP25 ac2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac3" or type, {
		{id = "owo_underbarrel_gl_empty_03", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_03", name = "OwO M203 ac3", no_randomize = true},
		{id = "owo_gp25_helper_03", name = "OwO GP25 ac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac4" or type, {
		{id = "owo_underbarrel_gl_empty_04", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_04", name = "OwO M203 ac4", no_randomize = true},
		{id = "owo_gp25_helper_04", name = "OwO GP25 ac4", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac5" or type, {
		{id = "owo_underbarrel_gl_empty_05", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_gp25_helper_05", name = "OwO GP25 ac5", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_m203 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_m203_helper_01", bayonetac2 = "owo_m203_helper_02", 
				bayonetac3 = "owo_m203_helper_03", bayonetac4 = "owo_m203_helper_04", 
			}
		},
		owo_gp25 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_m203_helper_01", bayonetac2 = "owo_gp25_helper_02", 
				bayonetac3 = "owo_gp25_helper_03", bayonetac4 = "owo_gp25_helper_04", 
				bayonetac5 = "owo_gp25_helper_05"
			}
		},
		-- ### Helper Parts ###
		-- ac1
		--	Barrel 2
		owo_m203_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_02", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		owo_gp25_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_04", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		-- ac2
		--	Barrel Texture
		owo_m203_helper_02 = {
			model = _item_melee.."/grips/combat_knife_grip_03", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet"
		},
		owo_gp25_helper_02 = {
			model =_item_melee.."/pommels/hatchet_pommel_03", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet"
		},
		-- ac3
		--	attacher
		owo_m203_helper_03 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "bayonetac3", 
			mesh_move = false, parent = "bayonet"
		},
		owo_gp25_helper_03 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = "bayonetac3", 
			mesh_move = false, parent = "bayonet"
		},
		-- ac4
		--	Trigger
		owo_m203_helper_04 = {
			model = _item_ranged.."/recievers/shotgun_double_barrel_receiver_01", type = "bayonetac4", 
			mesh_move = false, parent = "bayonet"
		},
		owo_gp25_helper_04 = {
			model = _item_ranged.."/grips/plasma_rifle_grip_03", type = "bayonetac4", 
			mesh_move = false, parent = "bayonet"
		},
		-- ac5
		--	grip top
		owo_gp25_helper_05 = {
			model = _item_ranged.."/grips/boltgun_pistol_grip_01", type = "bayonetac5", 
			mesh_move = false, parent = "bayonet"
		},
		-- ### Empty ###
		owo_underbarrel_gl_empty_01 = {
			model = "", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_gl_empty_02 = {
			model = "", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_gl_empty_03 = {
			model = "", type = "bayonetac3", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_gl_empty_04 = {
			model = "", type = "bayonetac4", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_gl_empty_05 = {
			model = "", type = "bayonetac5", 
			mesh_move = false, parent = "bayonet"
		},
	})
end

-- Bayonet: Underbarrel Shotgun
--		Knight's Armament Company Masterkey, M26-MASS (Modular Accessory Shotgun System)
function mod.owo_underbarrel_shotgun(variant_id, type)
	mod.inject_attachments_owo(variant_id, "bayonet" or type, {
		{id = "owo_underbarrel_shotgun_01_02", name = "OwO Masterkey"},
		{id = "owo_underbarrel_shotgun_01", name = "OwO Masterkey (THICC)"},
		{id = "owo_underbarrel_shotgun_02", name = "OwO M26-MASS"},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac1" or type, {
		{id = "owo_underbarrel_shotgun_empty_01", name = "Empty Bayonetac1", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_01", name = "OwO Masterkey ac1", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_01_02", name = "OwO MASS ac1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac2" or type, {
		{id = "owo_underbarrel_shotgun_empty_02", name = "Empty Bayonetac2", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_02", name = "OwO Masterkey ac2", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_02_02", name = "OwO MASS ac2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac3" or type, {
		{id = "owo_underbarrel_shotgun_empty_03", name = "Empty Bayonetac3", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_03", name = "OwO Masterkey ac3", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_03_02", name = "OwO MASS ac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac4" or type, {
		{id = "owo_underbarrel_shotgun_empty_04", name = "Empty Bayonetac4", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_04", name = "OwO Masterkey ac4", no_randomize = true}, -- Trigger
	})
	mod.inject_attachments_owo(variant_id, "bayonetac5" or type, {
		{id = "owo_underbarrel_shotgun_empty_05", name = "Empty Bayonetac5", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_05", name = "OwO Masterkey ac5", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_05_02", name = "OwO MASS ac5", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac6" or type, {
		{id = "owo_underbarrel_shotgun_empty_06", name = "Empty Bayonetac6", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_06", name = "OwO Masterkey ac6", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_06_02", name = "OwO MASS ac6", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac7" or type, {
		{id = "owo_underbarrel_shotgun_empty_07", name = "Empty Bayonetac6", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_07", name = "OwO Masterkey ac6", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- 	Shotgun body + barrel guide
		owo_underbarrel_shotgun_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_01", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_underbarrel_shotgun_helper_01", bayonetac2 = "owo_underbarrel_shotgun_helper_02", 
				bayonetac3 = "owo_underbarrel_shotgun_helper_03", bayonetac4 = "owo_underbarrel_shotgun_helper_04", 
				bayonetac5 = "owo_underbarrel_shotgun_helper_05", bayonetac6 = "owo_underbarrel_shotgun_helper_06", 
				bayonetac7 = "owo_underbarrel_shotgun_helper_07", 
			}
		},
		owo_underbarrel_shotgun_01_02 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_01", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_underbarrel_shotgun_helper_01", bayonetac2 = "owo_underbarrel_shotgun_helper_02", 
				bayonetac3 = "owo_underbarrel_shotgun_helper_03", bayonetac4 = "owo_underbarrel_shotgun_helper_04", 
				bayonetac5 = "owo_underbarrel_shotgun_helper_05", bayonetac6 = "owo_underbarrel_shotgun_helper_06", 
				bayonetac7 = "owo_underbarrel_shotgun_helper_07", 
			}
		},
		--	Body
		owo_underbarrel_shotgun_02 = {
			model = _item_ranged.."/recievers/autogun_pistol_receiver_05", type = "bayonet", 
			mesh_move = false, parent = "barrel",
			automatic_equip = { bayonetac1 = "owo_underbarrel_shotgun_helper_01_02", bayonetac2 = "owo_underbarrel_shotgun_helper_02_02", 
				bayonetac3 = "owo_underbarrel_shotgun_helper_03_02", bayonetac4 = "owo_underbarrel_shotgun_helper_04", 
				bayonetac5 = "owo_underbarrel_shotgun_helper_05_02", bayonetac6 = "owo_underbarrel_shotgun_helper_06_02", 
			}
		},
		-- ### Helper Parts ###
		-- Masterkey
		--	Shotgun Tube
		owo_underbarrel_shotgun_helper_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_02", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		--	Shotgun Tube 2
		owo_underbarrel_shotgun_helper_02 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_05", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet"
		},
		--	Shotgun tube extension
		owo_underbarrel_shotgun_helper_03 = {
			--model = _item_melee.."/pommels/axe_pommel_03", type = "bayonetac3", 
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_04", type = "bayonetac3",
			mesh_move = false, parent = "bayonet"
		},
		--	Trigger
		owo_underbarrel_shotgun_helper_04 = {
			model = _item_ranged.."/recievers/shotgun_double_barrel_receiver_01", type = "bayonetac4", 
			mesh_move = false, parent = "bayonet"
		},
		-- 	Shotgun trap
		owo_underbarrel_shotgun_helper_05 = {
			model = _item_melee.."/heads/axe_head_02", type = "bayonetac5", 
			mesh_move = false, parent = "bayonet"
		},
		-- 	Connector
		owo_underbarrel_shotgun_helper_06 = {
			model = _item_ranged.."/underbarrels/boltgun_rifle_underbarrel_01", type = "bayonetac6", 
			mesh_move = false, parent = "bayonet"
		},
		--	Shotgun pump
		owo_underbarrel_shotgun_helper_07 = {
			model = _item_ranged.."/underbarrels/shotgun_pump_action_underbarrel_01", type = "bayonetac7", 
			mesh_move = false, parent = "bayonet"
		},
		-- M26 MASS
		--	Magazine
		owo_underbarrel_shotgun_helper_01_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		--	Barrel
		owo_underbarrel_shotgun_helper_02_02 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet"
		},
		--	Muzzle
		owo_underbarrel_shotgun_helper_03_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "bayonetac3",
			mesh_move = false, parent = "bayonet"
		},
		-- 	Front connector bs
		owo_underbarrel_shotgun_helper_05_02 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = "bayonetac5", 
			mesh_move = false, parent = "bayonet"
		},
		-- 	Connector
		owo_underbarrel_shotgun_helper_06_02 = {
			model = _item_ranged.."/underbarrels/boltgun_rifle_underbarrel_01", type = "bayonetac6", 
			mesh_move = false, parent = "bayonet"
		},
		-- ### Empty ###
		owo_underbarrel_shotgun_empty_01 = {
			model = "", type = "bayonetac1", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_shotgun_empty_02 = {
			model = "", type = "bayonetac2", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_shotgun_empty_03 = {
			model = "", type = "bayonetac3", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_shotgun_empty_04 = {
			model = "", type = "bayonetac4", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_shotgun_empty_05 = {
			model = "", type = "bayonetac5", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_shotgun_empty_06 = {
			model = "", type = "bayonetac6", 
			mesh_move = false, parent = "bayonet"
		},
		owo_underbarrel_shotgun_empty_07 = {
			model = "", type = "bayonetac7", 
			mesh_move = false, parent = "bayonet"
		},
	})
end

-- Receiver: Vertically challenged California Bolter
--		Grip: Already included in MT Plugin or use fin grip with stock
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
		{id = "owo_california_bolter_01", name = "OwO Vertically Challenged Bolter 1"},
		{id = "owo_california_bolter_02", name = "OwO Vertically Challenged Bolter 2"},
		{id = "owo_california_bolter_03", name = "OwO Vertically Challenged Bolter 3"},
		{id = "owo_california_bolter_04", name = "OwO Vertically Challenged Bolter 4"},
		{id = "owo_california_bolter_05", name = "OwO Vertically Challenged Bolter 5"},
		{id = "owo_california_bolter_06", name = "OwO Vertically Challenged Bolter 6"},
		{id = "owo_california_bolter_07", name = "OwO Vertically Challenged Bolter 7"},
		{id = "owo_california_bolter_08", name = "OwO Vertically Challenged Bolter 8"},
	})
	-- 1-7
	mod.inject_models(variant_id, {
		owo_california_bolter_01 = {
			model = _item_ranged.."/recievers/boltgun_rifle_receiver_01", type = "receiver", 
			mesh_move = false
			--[[ this is fucking stupid
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
		{id = "owo_bolt_grip_empty", name = "receiverac1 empty", no_randomize = true},
		{id = "owo_bolt_helbore_bolt_01", name = "OwO bolt action bolt", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "receiverac2" or type, {
		{id = "owo_bolt_shaft_empty", name = "receiverac2 empty", no_randomize = true},
		{id = "owo_bolt_helbore_bolt_02", name = "OwO bolt action bolt shaft", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
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
		owo_bolt_helbore_03 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_04", type = "receiver", -- WHY IS THERE NO 3
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
		-- ### Helper Parts ###
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
		-- ### Empty ###
		owo_bolt_grip_empty = {
			model = "", type = "receiverac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_bolt_shaft_empty = {
			model = "", type = "receiverac2", 
			mesh_move = false, parent = "receiver"
		},
	})
end

-- Receiver: Helbore MAS-49
function mod.owo_helbore_mas49(variant_id, type)
	mod.inject_attachments_owo(variant_id, "receiver" or type, {
		{id = "owo_helbore_mas49_01", name = "OwO Helbore MAS-49 1"},
		{id = "owo_helbore_mas49_02", name = "OwO Helbore MAS-49 2"},
		{id = "owo_helbore_mas49_03", name = "OwO Helbore MAS-49 3"},
		--{id = "owo_helbore_mas49_04", name = "OwO Helbore MAS-49 4"}, -- yeah this musket ass mf ain't workin
		{id = "owo_helbore_mas49_05", name = "OwO Helbore MAS-49 4 (M)"},
		{id = "owo_helbore_mas49_01_s", name = "OwO MAS-49 Slim 1"},
	})
	mod.inject_attachments_owo(variant_id, "receiverac1" or type, {
		{id = "owo_bolt_empty", name = "receiverac1 empty", no_randomize = true},
		{id = "owo_helbore_mas49_ass", name = "OwO MAS-49 Ass", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "receiverac2" or type, {
		{id = "owo_knob_empty", name = "receiverac1 empty", no_randomize = true},
		{id = "owo_helbore_mas49_knob", name = "OwO MAS-49 Knob", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_helbore_mas49_01 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_01", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_helbore_mas49_ass", receiverac2 = "owo_helbore_mas49_knob"}
		},
		owo_helbore_mas49_02 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_02", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_helbore_mas49_ass", receiverac2 = "owo_helbore_mas49_knob"}
		},
		owo_helbore_mas49_03 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_04", type = "receiver", -- WHY IS THERE NO 3
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_helbore_mas49_ass", receiverac2 = "owo_helbore_mas49_knob"}
		},
		--[[owo_helbore_mas49_04 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_05", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_helbore_mas49_ass", receiverac2 = "owo_helbore_mas49_knob"}
		},]]
		owo_helbore_mas49_05 = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_ml01", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_helbore_mas49_ass", receiverac2 = "owo_helbore_mas49_knob"}
		},
		owo_helbore_mas49_01_s = {
			model = _item_ranged.."/recievers/lasgun_rifle_krieg_receiver_01", type = "receiver", 
			mesh_move = false,
			automatic_equip = {receiverac1 = "owo_helbore_mas49_ass", receiverac2 = "owo_helbore_mas49_knob"}
		},
		-- ### Helper Parts ###
		-- makes the ass more shapely
		-- dovetail for optic mount
		owo_helbore_mas49_ass = {
			model = _item_ranged.."/magazines/boltgun_rifle_magazine_02", type = "receiverac1", 
			mesh_move = false, parent = "receiver"
		},
		-- the knob on the right (Cocking)
		owo_helbore_mas49_knob = {
			model = _item_melee.."/grips/power_sword_grip_06", type = "receiverac2", 
			mesh_move = false, parent = "receiver"
		},
		-- ### Empty ###
		owo_bolt_empty = {
			model = "", type = "receiverac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_knob_empty = {
			model = "", type = "receiverac2", 
			mesh_move = false, parent = "receiver"
		},
	})
end

-- Receiver: Pistol Grip Mag
function mod.owo_laspistol_grip_mag(variant_id)
	mod.inject_attachments_owo(variant_id, "receiver", {
		{id = "owo_laspistol_grip_mag_01", name = "OwO Chunky Slide 1"},
		{id = "owo_laspistol_grip_mag_02", name = "OwO Chunky Slide 2"},
		{id = "owo_laspistol_grip_mag_03", name = "OwO Chunky Slide 3 (M)"},
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
function mod.owo_fin_grip(variant_id, type)
	mod.inject_attachments_owo(variant_id, "grip" or type, {
		{id = "owo_fin_grip_01", name = "OwO Fin Grip 1"},
	})
	mod.inject_attachments_owo(variant_id, "gripac" or type, {
		{id = "owo_fin_grip2_empty", name = "OwO Fin Grip empty", no_randomize = true},
		{id = "owo_fin_grip2_01", name = "OwO Fin Grip'vesa 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_fin_grip_01 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_01", type = "grip", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				gripac = "owo_fin_grip2_01",
			},
		},
		-- ### Helper Parts ###
		owo_fin_grip2_01 = {
			model = _item_melee.."/blades/combat_blade_blade_02", type = "gripac", 
			mesh_move = false, parent = "receiver",
		},
		-- ### Empty ###
		owo_fin_grip2_empty = {
			model = "", type = "gripac", 
			mesh_move = false, parent = "receiver",
		},
	})
end

-- Stock: Straight Grip and Recon Stock
function mod.owo_helbore_gripstock_recon(variant_id,type)
	mod.inject_attachments_owo(variant_id, "stock" or type, {
		{id = "owo_gripstock_recon_01", name = "OwO StraightGrip Recon 1"},
		{id = "owo_gripstock_recon_02", name = "OwO StraightGrip Recon 2"},
		{id = "owo_gripstock_recon_03", name = "OwO StraightGrip Recon 3"},
	})
	mod.inject_attachments_owo(variant_id, "stockac" or type, {
		{id = "owo_gripstock_grip_empty",  name = "Empty stockac", no_randomize = true},
		{id = "owo_gripstock_grip_01a",  name = "OwO StraightGrip stockac", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
	    owo_gripstock_recon_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_elysian_stock_01", type = "stock", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0),
			automatic_equip = {
				stockac = "owo_gripstock_grip_01a",
			},
		},
		owo_gripstock_recon_02 = {
			model = _item_ranged.."/stocks/lasgun_rifle_elysian_stock_02", type = "stock", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0),
			automatic_equip = {
				stockac = "owo_gripstock_grip_01a",
			},
		},
		owo_gripstock_recon_03 = {
			model = _item_ranged.."/stocks/lasgun_rifle_elysian_stock_03", type = "stock", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0),
			automatic_equip = {
				stockac = "owo_gripstock_grip_01a",
			},
		},
		-- ### Helper Parts ###
		owo_gripstock_grip_01a = {
			model = _item_ranged.."/recievers/stubgun_pistol_receiver_02", type = "stockac", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0)
		},
		-- ### Empty ###
		owo_gripstock_grip_empty = {
			model = "", type = "stockac", parent = "receiver", 
		},
	})
end

-- Stock: Tactical Stock
function mod.owo_tactical_stock(variant_id, type)
	mod.inject_attachments_owo(variant_id, "stock" or type, {
		{id = "owo_tactical_stock_s_01", name = "OwO Skeletal Stock"},
		{id = "owo_tactical_stock_f_01", name = "OwO Folded 1 (Natural)"},
		{id = "owo_tactical_stock_f_02", name = "OwO Folded 2 (Natural)"},
		{id = "owo_tactical_stock_f_03u", name = "OwO Folded 3 (Natural, Under)"},
		{id = "owo_tactical_stock_01", name = "OwO Folded Stock 1"},
		{id = "owo_tactical_stock_02", name = "OwO Folded Stock 2"},
		{id = "owo_tactical_stock_03", name = "OwO Folded Stock 3"},
		{id = "owo_tactical_stock_04", name = "OwO Folded Stock 4"},
		{id = "owo_tactical_stock_05", name = "OwO Folded Stock 5"},
		{id = "owo_tactical_stock_06", name = "OwO Folded Stock 6"},
		{id = "owo_tactical_stock_07", name = "OwO Folded Stock 7"},
		{id = "owo_tactical_stock_08", name = "OwO Folded Stock 8"},
		{id = "owo_tactical_stock_01l", name = "OwO Folded 1 (Left)"},
		{id = "owo_tactical_stock_02l", name = "OwO Folded 2 (Left)"},
		{id = "owo_tactical_stock_03l", name = "OwO Folded 3 (Left)"},
		{id = "owo_tactical_stock_04l", name = "OwO Folded 4 (Left)"},
		{id = "owo_tactical_stock_05l", name = "OwO Folded 5 (Left)"},
		{id = "owo_tactical_stock_06l", name = "OwO Folded 6 (Left)"},
		{id = "owo_tactical_stock_07l", name = "OwO Folded 7 (Left)"},
		{id = "owo_tactical_stock_08l", name = "OwO Folded 8 (Left)"},
	})
	mod.inject_attachments_owo(variant_id, "stockac" or type, {
		{id = "owo_tactical_stockac_00",  name = "Empty stockac", no_randomize = true},
		{id = "owo_tactical_stockac_01",  name = "Folding stock'vesa", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_tactical_stock_s_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stock_f_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stock_f_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_ml01", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stock_f_03u = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stock_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_03 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_04 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_ml01", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_05 = {
			model = _item_ranged.."/stocks/stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_06 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_07 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_08 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_05", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_01l = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_02l = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_03l = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_04l = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_ml01", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_05l = {
			model = _item_ranged.."/stocks/stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_06l = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_07l = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_08l = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_05", type = "stock", 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		-- ### Helper Parts ###
		owo_tactical_stockac_00 = {
			model = "", type = "stockac", 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stockac_01 = {
			model = _item_melee.."/grips/2h_chain_sword_grip_02", type = "stockac", 
			mesh_move = false, parent = "receiver",
		},
	})
end

-- Stock: Kalashnikov Stock
function mod.owo_kalash_stock(variant_id, type)
	mod.inject_attachments_owo(variant_id, "stock" or type, {
		{id = "owo_kalash_stock_01", name = "OwO Kalashnikov Stock 1"},
		{id = "owo_kalash_stock_02", name = "OwO Kalashnikov Stock 2"},
		{id = "owo_kalash_stock_03", name = "OwO Kalashnikov Stock 3"},
		{id = "owo_kalash_stock_04", name = "OwO Kalashnikov Stock 4"},
		{id = "owo_kalash_stock_05", name = "OwO Kalashnikov Stock 5"},
		{id = "owo_kalash_stock_06", name = "OwO Kalashnikov Stock 6"},
		{id = "owo_kalash_stock_07", name = "OwO Kalashnikov Stock 7"},
		{id = "owo_kalash_stock_08", name = "OwO Kalashnikov Stock (M)"},
		{id = "owo_kalash_stock_h_01", name = "OwO Wooden Kalashnikov 1"},
		{id = "owo_kalash_stock_h_02", name = "OwO Wooden Kalashnikov 2"},
		{id = "owo_kalash_stock_h_03", name = "OwO Wooden Kalashnikov 2"},
		{id = "owo_kalash_stock_01c", name = "OwO Compact Kalashnikov 1"},
		{id = "owo_kalash_stock_02c", name = "OwO Compact Kalashnikov 2"},
		{id = "owo_kalash_stock_03c", name = "OwO Compact Kalashnikov 3"},
		{id = "owo_kalash_stock_04c", name = "OwO Compact Kalashnikov 4"},
		{id = "owo_kalash_stock_05c", name = "OwO Compact Kalashnikov 5"},
		{id = "owo_kalash_stock_06c", name = "OwO Compact Kalashnikov 6"},
		{id = "owo_kalash_stock_07c", name = "OwO Compact Kalashnikov 7"},
		{id = "owo_kalash_stock_08c", name = "OwO Compact Kalashnikov (M)"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_kalash_stock_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_02 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_03", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_03 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_04 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_06", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_05 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_07", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_06 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_08", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_07 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_09", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_08 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_ml01", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		-- Helbore
		owo_kalash_stock_h_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_krieg_stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_h_02 = {
			model = _item_ranged.."/stocks/lasgun_rifle_krieg_stock_02", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_h_03 = {
			model = _item_ranged.."/stocks/lasgun_rifle_krieg_stock_04", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		-- Shotgun Compact
		owo_kalash_stock_01c = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_02c = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_03", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_03c = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_04c = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_06", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_05c = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_07", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_06c = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_08", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_07c = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_09", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
		owo_kalash_stock_08c = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_ml01", type = "stock", 
			mesh_move = false, parent = "receiver",
		},
	})
end

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
function mod.owo_holosight(variant_id, type)
	mod.inject_attachments_owo(variant_id, "sight" or type, {
		{id = "owo_holosight_01_01", name = "OwO EOTech"},
		{id = "owo_holosight_01_02_z1", name = "OwO EOTech+Magnifier (1.25x)"},
		{id = "owo_holosight_01_02_z2", name = "OwO EOTech+Magnifier (1.75x)"},
		{id = "owo_holosight_01_03", name = "OwO EOTech+Magnifier (Side)"},
		{id = "owo_holosight_01_01ss", name = "OwO EOTech (Short)"},
		{id = "owo_holosight_01_02ss", name = "OwO EOTech + M (Short)"},
		{id = "owo_holosight_01_03ss", name = "OwO EOTech + M/s (Short)"},
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
		owo_holosight_01_02ss = {
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
--		Trijicon ACOG (Advanced Combat Optical Gunsight), SUSAT (Small Unit Small Arms, Trilux - L9A1)
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
	})
	mod.inject_attachments_owo(variant_id, "sightac1" or type, {
		{id = "owo_acog_sight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_01", name = "OwO ACOG'vesa sight container 1", no_randomize = true},
		{id = "owo_susat_ac1_01", name = "SUSAT'vesa cylinder thing", no_randomize = true},
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
		-- 	SUSAT: cylinder thing
		owo_susat_ac1_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sightac1", 
			mesh_move = false, parent = "sight"
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

-- Magazine: Flat
--		Lasgun and Autogun mags
--		All done with scaling in the weapon classes
function mod.owo_magazine_flat(variant_id, type)
	mod.inject_attachments_owo(variant_id, "magazine" or type, {
		{id = "owo_lasgun_magazine_flat_01", name = "OwO Flat Mag (Las) 1"},
		{id = "owo_autogun_magazine_flat_03", name = "OwO Flat Mag (Autogun) 3"},
	})

	mod.inject_models(variant_id, {
		owo_lasgun_magazine_flat_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "magazine", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0)
		},
		owo_autogun_magazine_flat_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "magazine", parent = "receiver", 
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
		{id = "owo_lasgun_magazine_rear_child_empty", name = "Empty Rearmag", no_randomize = true},
		{id = "owo_lasgun_magazine_rear_child_01", name = "OwO RearMagChild 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_lasgun_magazine_rear_01 = {
			model = _item_ranged.."/magazines/lasgun_pistol_magazine_01", type = "magazine", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0),
			automatic_equip = {
				rearmag = "owo_lasgun_magazine_rear_child_01"
			}
		},
		-- ### Helper Parts ###
		owo_lasgun_magazine_rear_child_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "rearmag", mesh_move = false, parent = 'receiver'
		},
		-- ### Empty ###
		owo_lasgun_magazine_rear_child_empty = {
			model = "", type = "rearmag", mesh_move = false, parent = 'receiver'
		},
	})
end

-- Magazine: Jungle Mags
--		Autoguns
function mod.owo_jungle_mag(variant_id, type)
	mod.inject_attachments_owo(variant_id, "magazine" or type, {
		{id = "owo_jungle_mag_01", name = "OwO Jungle Mag 1 v^"},
		{id = "owo_jungle_mag_02", name = "OwO Jungle Mag 2 v^"},
		{id = "owo_jungle_mag_03", name = "OwO Jungle Mag 3 v^"},
		{id = "owo_jungle_mag_04", name = "OwO Jungle Mag 4 v^"},
		{id = "owo_jungle_mag_01_flip", name = "OwO Jungle Mag 1 ^v"},
		{id = "owo_jungle_mag_02_flip", name = "OwO Jungle Mag 2 ^v"},
		{id = "owo_jungle_mag_03_flip", name = "OwO Jungle Mag 3 ^v"},
		{id = "owo_jungle_mag_04_flip", name = "OwO Jungle Mag 4 ^v"},
		{id = "owo_jungle_mag_01_up", name = "OwO Jungle Mag 1 ^^ (L)"},
		{id = "owo_jungle_mag_02_up", name = "OwO Jungle Mag 2 ^^ (L)"},
		{id = "owo_jungle_mag_03_up", name = "OwO Jungle Mag 3 ^^ (L)"},
		{id = "owo_jungle_mag_04_up", name = "OwO Jungle Mag 4 ^^ (L)"},
		{id = "owo_jungle_mag_01_up_flip", name = "OwO Jungle Mag 1 ^^ (R)"},
		{id = "owo_jungle_mag_02_up_flip", name = "OwO Jungle Mag 2 ^^ (R)"},
		{id = "owo_jungle_mag_03_up_flip", name = "OwO Jungle Mag 3 ^^ (R)"},
		{id = "owo_jungle_mag_04_up_flip", name = "OwO Jungle Mag 4 ^^ (R)"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac1" or type, {
		{id = "owo_jungle_mag_empty_01", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_helper_01", name = "OwO Jungle Mag'vesa 1", no_randomize = true},
		{id = "owo_jungle_mag_helper_02", name = "OwO Jungle Mag'vesa 2", no_randomize = true},
		{id = "owo_jungle_mag_helper_03", name = "OwO Jungle Mag'vesa 3", no_randomize = true},
		{id = "owo_jungle_mag_helper_04", name = "OwO Jungle Mag'vesa 4", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac2" or type, {
		{id = "owo_jungle_mag_empty_02", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_f_01", name = "OwO Jungle Connector f 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac3" or type, {
		{id = "owo_jungle_mag_empty_03", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_b_01", name = "OwO Jungle Connector b 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac4" or type, {
		{id = "owo_jungle_mag_empty_04", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_l_01", name = "OwO Jungle Connector l 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac5" or type, {
		{id = "owo_jungle_mag_empty_05", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_r_01", name = "OwO Jungle Connector r 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- Main magazine, v^ second mag on the left
		owo_jungle_mag_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_01", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			},
		},
		owo_jungle_mag_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_02", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_03", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_04", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- mirrored mags, ^v second mag on the right
		owo_jungle_mag_01_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_01", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_02_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_02", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_03", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_04", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- ^^ second mag on the right
		owo_jungle_mag_01_up = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_01", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			},
		},
		owo_jungle_mag_02_up = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_02", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03_up = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_03", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04_up = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_04", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- mirrored mags, ^^ second mag on the right
		owo_jungle_mag_01_up_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_01", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_02_up_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_02", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03_up_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_03", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04_up_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_04", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- ### Helper Parts ###
		-- Backup magazine
		owo_jungle_mag_helper_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "owo_magac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_helper_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "owo_magac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_helper_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "owo_magac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_helper_04 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "owo_magac1", 
			mesh_move = false, parent = "receiver"
		},
		-- "tape"
		owo_jungle_mag_connector_f_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owo_magac2", 
			mesh_move = false, parent = "magazine"
		},
		owo_jungle_mag_connector_b_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owo_magac3", 
			mesh_move = false, parent = "magazine"
		},
		owo_jungle_mag_connector_l_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owo_magac4", 
			mesh_move = false, parent = "magazine"
		},
		owo_jungle_mag_connector_r_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owo_magac5", 
			mesh_move = false, parent = "magazine"
		},
		-- ### Empty ### 
		owo_jungle_mag_empty_01 = {
			model = "", type = "owo_magac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_empty_02 = {
			model = "", type = "owo_magac2", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_empty_03 = {
			model = "", type = "owo_magac3", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_empty_04 = {
			model = "", type = "owo_magac4", 
			mesh_move = false, parent = "receiver"
		},
		owo_jungle_mag_empty_05 = {
			model = "", type = "owo_magac5", 
			mesh_move = false, parent = "receiver"
		},
	})
end

-- Magazine: Mag Assists
--	Magpul magazine assists/pulls
function mod.owo_magazine_magpull(variant_id, type)
	mod.inject_attachments_owo(variant_id, "magazine" or type, {
		{id = "owo_magazine_magpull_01", name = "OwO Magpul 1 (DANGER)"},
		{id = "owo_magazine_magpull_02", name = "OwO Magpul 2 (DANGER)"},
		{id = "owo_magazine_magpull_03", name = "OwO Magpul 3 (DANGER)"},
		{id = "owo_magazine_magpull_04", name = "OwO Magpul 4 (DANGER)"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac1" or type, {
		{id = "owo_magazine_magpull_helper_01_empty", name = "Empty Magac1"},
		{id = "owo_magazine_magpull_helper_01", name = "OwO Autogun Magpul'vesa 1"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac2" or type, {
		{id = "owo_magazine_magpull_helper_02_empty", name = "Empty Magac2"},
		{id = "owo_magazine_magpull_helper_02", name = "OwO Autogun Magpul'vesa 2"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac3" or type, {
		{id = "owo_magazine_magpull_helper_03_empty", name = "Empty Magac3"},
		{id = "owo_magazine_magpull_helper_03", name = "OwO Autogun Magpul'vesa 3"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_magazine_magpull_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "magazine", parent = "receiver", 
			automatic_equip = { owo_magac1 = "owo_magazine_magpull_helper_01", owo_magac2 = "owo_magazine_magpull_helper_02", 
				owo_magac3 = "owo_magazine_magpull_helper_03",
			},
		},
		owo_magazine_magpull_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "magazine", parent = "receiver", 
			automatic_equip = { owo_magac1 = "owo_magazine_magpull_helper_01", owo_magac2 = "owo_magazine_magpull_helper_02", 
				owo_magac3 = "owo_magazine_magpull_helper_03",
			},
		},
		owo_magazine_magpull_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "magazine", parent = "receiver", 
			automatic_equip = { owo_magac1 = "owo_magazine_magpull_helper_01", owo_magac2 = "owo_magazine_magpull_helper_02", 
				owo_magac3 = "owo_magazine_magpull_helper_03",
			},
		},
		owo_magazine_magpull_04 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", parent = "receiver", 
			automatic_equip = { owo_magac1 = "owo_magazine_magpull_helper_01", owo_magac2 = "owo_magazine_magpull_helper_02", 
				owo_magac3 = "owo_magazine_magpull_helper_03",
			},
		},
		-- ### Helpers ###
		owo_magazine_magpull_helper_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "owo_magac1", parent = "magazine", 
		},
		owo_magazine_magpull_helper_02 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "owo_magac2", parent = "owo_magac1", 
		},
		owo_magazine_magpull_helper_03 = {
			model = _item_ranged.."/sights/reflex_sight_01", type = "owo_magac3", parent = "owo_magac2", 
			hide_mesh = {{"owo_magac3", 1},},
		},
		-- ### Empty ###
		owo_magazine_magpull_helper_01_empty = {
			model = "", type = "owo_magac1", parent = "magazine", 
		},
		owo_magazine_magpull_helper_02_empty = {
			model = "", type = "owo_magac2", parent = "owo_magac1", 
		},
		owo_magazine_magpull_helper_03_empty = {
			model = "", type = "owo_magac3", parent = "owo_magac2", 
		},
	})
end

-- Magazine: AK
--	Oh fuck the bullets don't move if i only move the mag
--[[
function mod.owo_magazine_ak(variant_id, type)
	mod.inject_attachments_owo(variant_id, "magazine" or type, {
		{id = "owo_magazine_ak_01", name = "OwO AK Mag"},
		{id = "owo_magazine_ak_02", name = "OwO AK Mag Curvy"},
		{id = "owo_magazine_ak_03", name = "OwO AK Mag Curvy (Extended)"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac1" or type, {
		{id = "owo_magazine_ak_ac1_00", name = "OwO AK Mag'vesa Empty"},
		{id = "owo_magazine_ak_ac1_01", name = "OwO AK Mag'vesa"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_magazine_ak_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", parent = "receiver", 
			automatic_equip = {
				owo_magac1 = "owo_magazine_ak_ac1_01",
			},
			hide_mesh = {
				--{"magazine", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_magazine_ak_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", parent = "receiver", 
			automatic_equip = {
				owo_magac1 = "owo_magazine_ak_ac1_01",
			},
			hide_mesh = {
				--{"magazine", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_magazine_ak_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "magazine", parent = "receiver", 
			automatic_equip = {
				owo_magac1 = "owo_magazine_ak_ac1_01",
			},
			hide_mesh = {
				--{"magazine", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- ### Helper Parts ###
		owo_magazine_ak_ac1_00 = {
			model = "", type = "owo_magac1", parent = "magazine", 
		},
		owo_magazine_ak_ac1_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "owo_magac1", parent = "magazine", 
		},
	})
end
]]

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
