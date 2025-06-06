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
mod.wc.add_custom_attachments.muzzle_6 = "muzzle_6_list"
mod.wc.muzzle_6_list = {
	"owo_muzzle_brake_helper_05_00",
	"owo_muzzle_brake_helper_05_01",
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
	"owo_holographic_sight_01_02_z1",
	"owo_holographic_sight_01_02_z2",
	"owo_holographic_sight_01_02ss_z1",
	"owo_holographic_sight_02_02_z1",
	"owo_holographic_sight_02_02_z2",
	"owo_holographic_sight_02_02ss_z1",
	"owo_holographic_sight_02_02ss_z2",
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
	"owo_holographic_sight_empty_01",
	"owo_holographic_sight_helper_01",
	"owo_rear_sight_empty_01",
	"owo_rear_sight_ac1_01",
	"owo_pu_scope_helper_01",
	"owo_m16_sight_helper_01",
	"owo_acog_sight_helper_01",
	"owo_susat_ac1_01",
	"owo_kalashnikov_rear_sight_empty_01",
	"owo_kalashnikov_rear_sight_ac1_01",
}
--[[ sightac 2-4 covered by MT. it uses sightac for sightac1 but i hate that naming system so fuck that
mod.wc.add_custom_attachments.sightac2 = "sightac2s"
mod.wc.sightac2s = {
	"owo_holographic_sight_empty_02",
	"owo_holographic_sight_helper_02",
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
	"owo_holographic_sight_empty_03",
	"owo_holographic_sight_helper_03",
	"owo_rear_sight_empty_03",
	"owo_rear_sight_ac3_01",
	"owo_pu_scope_helper_03",
	"owo_m16_sight_helper_03",
	"owo_acog_sight_helper_03",
	"owo_susat_ac3_01",
}
mod.wc.add_custom_attachments.sightac4 = "sightac4s"
mod.wc.sightac4s = {
	"owo_holographic_sight_empty_04",
	"owo_holographic_sight_helper_04",
	"owo_rear_sight_empty_04",
	"owo_rear_sight_ac4_01",
	"owo_pu_scope_helper_04",
	"owo_m16_sight_helper_04",
	"owo_acog_sight_helper_04", -- SUSAT reuses this
}
]]
-- In the MT Plugin, these tables are sightacs#, instead of sightac#s
mod.mt.table_append(mod.wc.sightacs2, {
	"owo_holographic_sight_empty_02",
	"owo_holographic_sight_helper_02",
	"owo_rear_sight_empty_02",
	"owo_rear_sight_ac2_01",
	"owo_rear_sight_ac2_02",
	"owo_rear_sight_ac2_03",
	"owo_pu_scope_helper_02",
	"owo_m16_sight_helper_02",
	"owo_acog_sight_helper_02",
	"owo_susat_ac2_01",
	"owo_kalashnikov_rear_sight_empty_02",
	"owo_kalashnikov_rear_sight_ac2_01",
})
mod.mt.table_append(mod.wc.sightacs3, {
	"owo_holographic_sight_empty_03",
	"owo_holographic_sight_helper_03",
	"owo_rear_sight_empty_03",
	"owo_rear_sight_ac3_01",
	"owo_pu_scope_helper_03",
	"owo_m16_sight_helper_03",
	"owo_acog_sight_helper_03",
	"owo_susat_ac3_01",
})
mod.mt.table_append(mod.wc.sightacs4, {
	"owo_holographic_sight_empty_04",
	"owo_holographic_sight_helper_04",
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
	"owo_holographic_sight_empty2",
	"owo_holographic_sight_sight_secondary_01",
	"owo_pu_scope_riser_01"
}
mod.wc.add_custom_attachments.sight_secondary_ac1 = "sight_secondary_ac1_list"
mod.wc.sight_secondary_ac1_list = {
	"owo_holographic_sight_empty2_01",
	"owo_holographic_sight_sight_secondary_helper_01",
	--"owo_pu_scope2_helper_01",
}
mod.wc.add_custom_attachments.sight_secondary_ac2 = "sight_secondary_ac2_list"
mod.wc.sight_secondary_ac2_list = {
	"owo_holographic_sight_empty2_02",
	"owo_holographic_sight_sight_secondary_helper_02",
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
	"owo_gripstock_amr_ac_empty",
	"owo_gripstock_amr_ac_01",
})
mod.mt.table_append(mod.wc.stockac2s, {
	"owo_gripstock_amr_ac2_empty",
	"owo_gripstock_amr_ac2_01",
	"owo_gripstock_amr_ac2_02",
})

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
-- Flashlight/Special: Grip Laser
function mod.owo_grip_laser(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, "flashlight", {
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
function mod.owo_suppressor(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "muzzle", {
		{id = "owo_suppressor_01", name = "OwO Suppressor 1"},
		{id = "owo_suppressor_02", name = "OwO Suppressor 2"},
		{id = "owo_suppressor_03", name = "OwO Suppressor 3 (PBS-1)"},
		{id = "owo_suppressor_04", name = "OwO Suppressor 4"},
		{id = "owo_suppressor_05", name = "OwO Suppressor 5"},
	})
	mod.inject_attachments_owo(variant_id, "muzzle_2", {
		{id = "owo_suppressor_helper_empty", name = "Empty", no_randomize = true},
		{id = "owo_suppressor_helper_01", name = "OwO Suppressor'vesa 1", no_randomize = true},
		{id = "owo_suppressor_helper_02", name = "OwO Suppressor'vesa 2", no_randomize = true},
		{id = "owo_suppressor_helper_03", name = "OwO Suppressor'vesa 3", no_randomize = true},
		{id = "owo_suppressor_helper_04", name = "OwO Suppressor'vesa 4", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "muzzle_3", {
		{id = "owo_suppressor_helper_02_empty", name = "Empty", no_randomize = true},
		{id = "owo_suppressor_helper_02_01", name = "OwO Suppressor'vesa2 1", no_randomize = true},
		{id = "owo_suppressor_helper_02_02", name = "OwO Suppressor'vesa2 2", no_randomize = true},
		{id = "owo_suppressor_helper_02_03", name = "OwO Suppressor'vesa2 3", no_randomize = true},
		{id = "owo_suppressor_helper_02_04", name = "OwO Suppressor'vesa2 4", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ####
		-- Using invisible placeholder 
		owo_suppressor_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_01", muzzle_3 = "owo_suppressor_helper_02_01",
			},
			hide_mesh = {
				{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_suppressor_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_02", muzzle_3 = "owo_suppressor_helper_02_02",
			},
			hide_mesh = {
				{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_suppressor_03 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_03", muzzle_3 = "owo_suppressor_helper_02_03",
			},
			hide_mesh = {
				{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_suppressor_04 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_04", muzzle_3 = "owo_suppressor_helper_02_01",
			},
			hide_mesh = {
				{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_suppressor_05 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_suppressor_helper_04", muzzle_3 = "owo_suppressor_helper_02_04",
			},
			hide_mesh = {
				{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- ### Helpers ###
		-- muzzle_2
		owo_suppressor_helper_empty = {
			model = "", type = "muzzle_2", mesh_move = false, parent = "muzzle"
		},
		owo_suppressor_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle_2", mesh_move = false, parent = "muzzle"
		},
		owo_suppressor_helper_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle_2", mesh_move = false, parent = "muzzle"
		},
		owo_suppressor_helper_03 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "muzzle_2", mesh_move = false, parent = "muzzle"
		},
		owo_suppressor_helper_04 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "muzzle_2", mesh_move = false, parent = "muzzle"
		},
		-- muzzle_3
		owo_suppressor_helper_02_empty = {
			model = "", type = "muzzle_3", mesh_move = false, parent = "muzzle"
		},
		owo_suppressor_helper_02_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle_3", mesh_move = false, parent = "muzzle",
		},
		owo_suppressor_helper_02_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle_3", mesh_move = false, parent = "muzzle",
		},
		owo_suppressor_helper_02_03 = {
			model = _item_ranged.."/barrels/rippergun_rifle_barrel_03", type = "muzzle_3", mesh_move = false, parent = "muzzle",
		},
		owo_suppressor_helper_02_04 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle_3", mesh_move = false, parent = "muzzle",
		},
	})
end
function mod.fixes_owo_suppressors(variant_id)
	local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"

	local _short_braced_autogun_mt_barrels = "bagun_barrel_01|bagun_barrel_05|bagun_barrel_06|bagun_barrel_07|bagun_barrel_08"
	local _long_braced_autogun_mt_barrels = "bagun_barrel_03|bagun_barrel_04"
	local _short_infantry_autogun_mt_barrels = "iagun_barrel_04"
	local _medium_infantry_autogun_mt_barrels = "iagun_barrel_01|iagun_barrel_02|iagun_barrel_06"
	local _long_infantry_autogun_mt_barrels = "iagun_barrel_03|iagun_barrel_05"
	local _short_vigilant_autogun_mt_barrels = "hagun_barrel_02"
	local _long_vigilant_autogun_mt_barrels = "hagun_barrel_01|hagun_barrel_03|hagun_barrel_04"
	local _all_vigilant_autogun_mt_barrels = _short_vigilant_autogun_mt_barrels.."|".._long_vigilant_autogun_mt_barrels
	local _short_infantry_lasgun_mt_barrels = "ilasgun_barrel_03"
	local _long_infantry_lasgun_mt_barrels = "ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08"
	local _mt_all_infantry_lasgun_barrels = _short_infantry_lasgun_mt_barrels.."|".._long_infantry_lasgun_mt_barrels
	local _mt_laspistol_barrels = "lpistol_barrel_01|lpistol_barrel_02|lpistol_barrel_03|lpistol_barrel_04|lpistol_barrel_05|lpistol_barrel_06|lpistol_barrel_07"
	local _medium_short_helbore_mt_barrels = "hlasgun_barrel_01|hlasgun_barrel_04|hlasgun_barrel_05|hlasgun_barrel_05b" -- Medium length, short bottom
	local _medium_medium_helbore_mt_barrels = "hlasgun_barrel_03"
	local _long_helbore_mt_barrels = "hlasgun_barrel_02"
	local _all_helbore_mt_barrels = _medium_short_helbore_mt_barrels.."|".._medium_medium_helbore_mt_barrels.."|".._long_helbore_mt_barrels
	local _mt_recon_lasgun_barrels = "rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05"
	local _mt_autopistol_barrels = "apistol_barrel_01|apistol_barrel_02|apistol_barrel_03|apistol_barrel_04|apistol_barrel_05"
	local _mt_twin_stubber_barrels = "stubber_barrel_01|stubber_barrel_02|stubber_barrel_03|stubber_barrel_04|stubber_barrel_05"
	local _mt_single_stubber_barrels = "singlestubber_barrel_01|singlestubber_barrel_02|singlestubber_barrel_03"
	local _mt_combat_shotgun_barrels = "shot_barrel_01|shot_barrel_02|shot_barrel_03|shot_barrel_04|shot_barrel_07|shot_barrel_08|shot_barrel_09"
	local _mt_db_shotgun_barrels = "dbshot_barrel_01|dbshot_barrel_02|dbshot_barrel_03"
	local _mt_plasma_barrels = "plas_barrel_01|plas_barrel_02|plas_barrel_03"
	local _mt_flamer_barrels = "flamer_barrel_01|flamer_barrel_02|flamer_barrel_03|flamer_barrel_04|flamer_barrel_05|flamer_barrel_06"
	local _mt_bolter_barrels = "bolter_barrel_01|bolter_barrel_02|bolter_barrel_03|bolter_barrel_04"
	local _mt_backwards_bolter_barrels = "fbolter_barrel_01|fbolter_barrel_02|fbolter_barrel_03|fbolter_barrel_04"
	local _mt_ripper_barrels = "ripper_barrel_01|ripper_barrel_02|ripper_barrel_03|ripper_barrel_04|ripper_barrel_05|ripper_barrel_06"

	local _syn_m41a_barrels = "syn_m41a_barrel_01|syn_m41a_barrel_02|syn_m41a_barrel_03|syn_m41a_barrel_04|syn_m41a_barrel_05|syn_m41a_barrel_06|syn_m41a_barrel_07|syn_m41a_barrel_08"
	local _syn_helbore_sniper_barrels = "helbore_sniper_barrel_01|helbore_sniper_barrel_02|helbore_sniper_barrel_03|helbore_sniper_barrel_04|helbore_sniper_barrel_05|helbore_sniper_barrel_05b"
	local _syn_carry_sniper_barrels = "cleaver_sniper_barrel_01|cleaver_sniper_barrel_02|cleaver_sniper_barrel_04|cleaver_sniper_barrel_05|cleaver_sniper_barrel_06"
	local _syn_all_sniper_barrels = _syn_helbore_sniper_barrels.."|".._syn_carry_sniper_barrels
	local _syn_pulse_barrels = "SWSMPR_barrel_01|SWSMPR_barrel_02|SWSMPR_barrel_03|SWSMPR_barrel_06|SWSMPR_barrel_07|SWSMPR_barrel_08|SWSMPR_barrel_09|SWSMPR_barrel_10|SWSMPR_barrel_11|SWSMPR_barrel_12|SWSMPR_barrel_13"
	local _syn_hellgun_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03|syn_hellgun_barrel_01|syn_hellgun_barrel_02"
	local _syn_carbine_barrels = "syn_carbine_barrel_01|syn_carbine_barrel_02|syn_carbine_barrel_03|syn_carbine_barrel_04|syn_carbine_barrel_05"
	local _syn_aquilon_barrels = "syn_aquilonbarrel_01|syn_aquilonbarrel_01a|syn_aquilonbarrel_02|syn_aquilonbarrel_02a"
	local _syn_heavy_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03"
	local _syn_thompson_barrels = "syn_thompson_barrel_01|syn_thompson_barrel_02"
	local _syn_rotary_barrels = "rotary_barrel_01|rotary_barrel_01a|rotary_barrel_01b|rotary_barrel_01c"
	local _syn_q3_barrels = "q3_machinegun_barrel_01|q3_machinegun_barrel_01a"
	local _syn_canis_barrels = "syn_vescanis_barrel_01|syn_vescanis_barrel_02"
	local _syn_gauss_barrels = "syn_gk8gauss_barrel_01|syn_gk8gauss_barrel_02"

	mod.mt.inject_fixes(variant_id, {
		--  Vigilant barrels
		{   dependencies =  { _owo_all_suppressor_muzzles, _all_vigilant_autogun_mt_barrels },
			muzzle =        { offset = true,   position = vector3_box(0, -0.034, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
		},
		 --  MT Autopistol
		{   dependencies =  { _owo_all_suppressor_muzzles, _mt_autopistol_barrels },
			muzzle =        { offset = true,   position = vector3_box(0, -0.02, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
		},
		--  MT Twink Stubbers have no muzzles
		--  MT Single Stubbers
		{	dependencies =  { _owo_all_suppressor_muzzles, "singlestubber_barrel_01" },
			muzzle =        { offset = true,   position = vector3_box(0, 0.78, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.3, 1.4, 2.3) },
		},
		{	dependencies =  { _owo_all_suppressor_muzzles, "singlestubber_barrel_02" },
			muzzle =        { offset = true,   position = vector3_box(0, 1, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.3, 1.4, 2.3) },
		},
		{	dependencies =  { _owo_all_suppressor_muzzles, "singlestubber_barrel_03" },
			muzzle =        { offset = true,   position = vector3_box(0, 1.34, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.3, 1.4, 2.3) },
		},
		--  MT Bolter
		{	dependencies =  { _owo_all_suppressor_muzzles, _mt_bolter_barrels },
			muzzle =        { offset = true,   position = vector3_box(0, 0.165, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.7, 0.4, 1.7) },
		},
		--  MT Backwards Bolter
		{	dependencies =  { _owo_all_suppressor_muzzles, _mt_backwards_bolter_barrels },
			muzzle =        { offset = true,   position = vector3_box(0, 0.01, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.7, -0.65, 1.7) },
		},
		--  MT Ripper
		{	dependencies =  { _owo_all_suppressor_muzzles, _mt_ripper_barrels },
			muzzle =        { offset = true,   position = vector3_box(0, 0.56, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.6, 2, 2.6) },
		},
		--  Syn Exitus
		{	dependencies =  { _owo_all_suppressor_muzzles, "exitus_barrel_01" },
			muzzle =        { offset = true,   position = vector3_box(0, -0.034, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
		},
		-- Not doing Quake barrel because that looks like a pain in the ass and I'm lazy
		-- Syn SWS Pulse barrel has 3 barrels and I'm not choosing one
		--  -------------------------------------------
		--  Double cans
		--  -------------------------------------------
		{	dependencies =  { "owo_suppressor_01" },
			muzzle_2 =      { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 22, 0),   scale = vector3_box(1.2, 1.8, 1.2) },	
			muzzle_3 =      { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
		},
		{	dependencies =  { "owo_suppressor_02" },
			muzzle_2 =      { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 17, 0),   scale = vector3_box(1.2, 1.8, 1.2) },
			muzzle_3 =      { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
		},
		--  -------------------------------------------
		--  PBS-1
		--  -------------------------------------------
		-- Default
		{	dependencies =  { "owo_suppressor_03" },
			muzzle_2 =      { offset = true,   position = vector3_box(0, 0.055, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
			muzzle_3 =      { offset = true,   position = vector3_box(0, 0.265, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
		},
		--  -------------------------------------------
		--  Can and Seat
		--  -------------------------------------------
		{	dependencies =  { "owo_suppressor_04|owo_suppressor_05" },
			muzzle_2 =      { offset = true,   position = vector3_box(0, 0.13, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.80, 1.80, 1.5) },
			muzzle_3 =      { offset = true,   position = vector3_box(0, 0.086, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
		},
	})
end

-- Muzzle: Lasgun Condom
function mod.owo_condom(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "muzzle", {
		{id = "owo_condom_01", name = "OwO Lasbarrel Condom", no_randomize = true}
	})
	mod.inject_attachments_owo(variant_id, "muzzle_2", {
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
--	AMR brake based on Barrett M82
function mod.owo_muzzle_brake(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "muzzle", {
		{id = "owo_muzzle_brake_01", name = "OwO Muzzle Brake AMR", no_randomize = true},
		{id = "owo_muzzle_brake_02", name = "OwO Muzzle Brake AMR (Big)", no_randomize = true},
		{id = "owo_muzzle_brake_03", name = "OwO Muzzle Brake AMR (BIG)", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "muzzle_2", {
		{id = "owo_muzzle_brake_helper_01_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_01_01", name = "OwO Muzzle Brake'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "muzzle_3", {
		{id = "owo_muzzle_brake_helper_02_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_02_01", name = "OwO Muzzle Brake'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "muzzle_4", {
		{id = "owo_muzzle_brake_helper_03_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_03_01", name = "OwO Muzzle Brake'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "muzzle_5", {
		{id = "owo_muzzle_brake_helper_04_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_04_01", name = "OwO Muzzle Brake'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "muzzle_6", {
		{id = "owo_muzzle_brake_helper_05_00", name = "Brake'vesa Empty", no_randomize = true},
		{id = "owo_muzzle_brake_helper_05_01", name = "OwO Muzzle Brake'vesa Base", no_randomize = true},
		{id = "owo_muzzle_brake_helper_05_02", name = "OwO Muzzle Brake'vesa Base 2", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_muzzle_brake_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_muzzle_brake_helper_01_01", muzzle_3 = "owo_muzzle_brake_helper_02_01", 
				muzzle_4 = "owo_muzzle_brake_helper_03_01", muzzle_5 = "owo_muzzle_brake_helper_04_01", 
				muzzle_6 = "owo_muzzle_brake_helper_05_01",
			},
			hide_mesh = {
				{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_muzzle_brake_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_muzzle_brake_helper_01_01", muzzle_3 = "owo_muzzle_brake_helper_02_01", 
				muzzle_4 = "owo_muzzle_brake_helper_03_01", muzzle_5 = "owo_muzzle_brake_helper_04_01", 
				muzzle_6 = "owo_muzzle_brake_helper_05_02",
			},
			hide_mesh = {
				{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_muzzle_brake_03 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = "owo_muzzle_brake_helper_01_01", muzzle_3 = "owo_muzzle_brake_helper_02_01", 
				muzzle_4 = "owo_muzzle_brake_helper_03_01", muzzle_5 = "owo_muzzle_brake_helper_04_01", 
				muzzle_6 = "owo_muzzle_brake_helper_05_02",
			},
			hide_mesh = {
				{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- ### Helpers ###
		owo_muzzle_brake_helper_01_00 = {
			model = "", type = "muzzle_2", mesh_move = false, parent = "muzzle_6"
		},
		owo_muzzle_brake_helper_01_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle_2", mesh_move = false, parent = "muzzle_6"
		},
		owo_muzzle_brake_helper_02_00 = {
			model = "", type = "muzzle_3", mesh_move = false, parent = "muzzle_6"
		},
		owo_muzzle_brake_helper_02_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle_3", mesh_move = false, parent = "muzzle_6"
		},
		owo_muzzle_brake_helper_03_00 = {
			model = "", type = "muzzle_4", mesh_move = false, parent = "muzzle_6"
		},
		owo_muzzle_brake_helper_03_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle_4", mesh_move = false, parent = "muzzle_6"
		},
		owo_muzzle_brake_helper_04_00 = {
			model = "", type = "muzzle_5", mesh_move = false, parent = "muzzle_6"
		},
		owo_muzzle_brake_helper_04_01 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_04", type = "muzzle_5", mesh_move = false, parent = "muzzle_6"
		},
		owo_muzzle_brake_helper_05_00 = {
			model = "", type = "muzzle_6", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_05_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_killshot_muzzle_05", type = "muzzle_6", mesh_move = false, parent = "muzzle"
		},
		owo_muzzle_brake_helper_05_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_killshot_muzzle_03", type = "muzzle_6", mesh_move = false, parent = "muzzle"
		},
	})
end
function mod.fixes_owo_muzzle_brake(variant_id)
	mod.mt.inject_fixes(variant_id, {
		{	dependencies =  { "owo_muzzle_brake_01" },
			muzzle_6 =      { offset = true, position = vector3_box(0, 0.02, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
			muzzle_2 =      { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(-90, -30, 90), scale = vector3_box(1.3, 0.3, 1.5 ) },
			muzzle_3 =      { offset = true, position = vector3_box(0, 0.02, 0), rotation = vector3_box(-90, -30, 90), scale = vector3_box(1.3, 0.3, 1.5 ) },
			muzzle_4 =      { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(-90, 30, -90), scale = vector3_box(1.3, 0.3, 1.5 ) },
			muzzle_5 =      { offset = true, position = vector3_box(0, 0.02, 0), rotation = vector3_box(-90, 30, -90), scale = vector3_box(1.3, 0.3, 1.5 ) },
		},
		{	dependencies =  { "owo_muzzle_brake_02" },
			muzzle_6 =      { offset = true, position = vector3_box(0, 0.02, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
			muzzle_2 =      { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(-90, -30, 90), scale = vector3_box(1.3, 0.5, 2.2 ) },
			muzzle_3 =      { offset = true, position = vector3_box(0, -0.02, 0), rotation = vector3_box(-90, -30, 90), scale = vector3_box(1.3, 0.5, 2.2 ) },
			muzzle_4 =      { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(-90, 30, -90), scale = vector3_box(1.3, 0.5, 2.2 ) },
			muzzle_5 =      { offset = true, position = vector3_box(0, -0.02, 0), rotation = vector3_box(-90, 30, -90), scale = vector3_box(1.3, 0.5, 2.2 ) },
		},
		{	dependencies =  { "owo_muzzle_brake_03" },
			muzzle_6 =      { offset = true, position = vector3_box(0, 0.02, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
			muzzle_2 =      { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(-90, -30, 90), scale = vector3_box(1.7, 0.75, 2.2 ) },
			muzzle_3 =      { offset = true, position = vector3_box(0, -0.02, 0), rotation = vector3_box(-90, -30, 90), scale = vector3_box(1.7, 0.75, 2.2 ) },
			muzzle_4 =      { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(-90, 30, -90), scale = vector3_box(1.7, 0.75, 2.2 ) },
			muzzle_5 =      { offset = true, position = vector3_box(0, -0.02, 0), rotation = vector3_box(-90, 30, -90), scale = vector3_box(1.7, 0.75, 2.2 ) },
		},
	})
end

-- Barrel: Bolt Pistol Shotgun barrel (short)
function mod.owo_bistol_shotgun_barrel_short(variant_id, given_type)
	--[[
	1,6 dont work, but 2-5 do
		setting offset to false made 1,6 as 2d models not following the gun and no scale
		what the FUCK?
	
	]]
	mod.inject_attachments_owo(variant_id, given_type or "barrel", {
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
	mod.inject_attachments_owo(variant_id, "barrelshroud" , {
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
function mod.owo_revolver_shotgun_barrel(variant_id, given_type)
	--[[ what the FUCK is wrong with barrels 1 and 9
	]]
	mod.inject_attachments_owo(variant_id, given_type or "barrel", {
		--{id = "owo_revolver_shotgun_barrel_base_01", name = "OwO Shotgun Barrel (1)"},
		{id = "owo_revolver_shotgun_barrel_base_04", name = "OwO Shotgun Barrel (4)"},
		{id = "owo_revolver_shotgun_barrel_base_04b", name = "OwO Shotgun Barrel (4b)"},
		{id = "owo_revolver_shotgun_barrel_base_05", name = "OwO Shotgun Barrel (5)"},
		{id = "owo_revolver_shotgun_barrel_base_06", name = "OwO Shotgun Barrel (6)"},
		-- barrel 7 with the skulls is too squished
		{id = "owo_revolver_shotgun_barrel_base_08", name = "OwO Shotgun Barrel (8)"},
		--{id = "owo_revolver_shotgun_barrel_base_09", name = "OwO Shotgun Barrel (9)"},
		{id = "owo_revolver_shotgun_barrel_base_04_l", name = "OwO SG Long (4)"},
		{id = "owo_revolver_shotgun_barrel_base_04b_l", name = "OwO SG Long (4b)"},
		{id = "owo_revolver_shotgun_barrel_base_05_l", name = "OwO SG Long (5)"},
		{id = "owo_revolver_shotgun_barrel_base_06_l", name = "OwO SG Long (6)"},
		{id = "owo_revolver_shotgun_barrel_base_08_l", name = "OwO SG Long (8)"},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroud" , {
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
		-- ### Base Parts ###
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
		owo_revolver_shotgun_barrel_base_04b = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel",
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
		owo_revolver_shotgun_barrel_base_04_l = {
			model = _item_ranged.."/barrels/stubgun_pistol_barrel_01", type = "barrel", parent = "receiver",
			automatic_equip = {barrelshroud = "owo_revolver_shotgun_barrel_04"},
		},
		owo_revolver_shotgun_barrel_base_04b_l = {
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
		-- ### Helper Parts ###
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
function mod.owo_dreg_gunner_barrel(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "barrel", {
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
function mod.owo_m16_barrel(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "barrel", {
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
	mod.inject_attachments_owo(variant_id, "barrelshroud" , {
		{id = "owo_m16_empty", name = "Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroud_a1", name = "OwO M16a1 Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroud_a1_02", name = "OwO M16a2 Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroud_a2", name = "OwO M16a2 Barrel Shroud", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac2", {
		{id = "owo_m16_empty_02", name = "Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac2_01", name = "OwO M16 Front Sight shroudac", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac3", {
		{id = "owo_m16_empty_03", name = "Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac3_a1", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac4", {
		{id = "owo_m16_empty_04", name = "Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac4_01", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac5", {
		{id = "owo_m16_empty_05", name = "Empty Barrel Shroud", no_randomize = true},
		{id = "owo_m16_barrelshroudac5_01", name = "OwO M16a1 Barrel Shroudac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac6", {
		{id = "owo_m16_empty_06", name = "Empty Barrel Shroud", no_randomize = true},
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
			mesh_move = false, parent = "receiver", 
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a1",
				barrelshroudac3 = "owo_m16_barrelshroudac3_a1",
			}
		},
		owo_m16_barrel_n_a2 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a2",
			}
		},
		owo_m16_barrel_n_a1_02 = {
			model = _item_ranged.."/barrels/lasgun_pistol_barrel_07", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_m16_barrelshroud_a1_02", }
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
function mod.owo_wood_krieg(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "barrel", {
		{id = "owo_wood_krieg_01", name = "OwO Wooden Helbore 1 (2)"},
		{id = "owo_wood_krieg_02", name = "OwO Wooden Helbore 2 (3)"},
		{id = "owo_wood_krieg_03", name = "OwO Wooden Helbore 3 (7)"},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroud" , {
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

-- Barrel: Plasma Helbore
function mod.owo_plasma_krieg(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "barrel", {
		{id = "owo_plasma_krieg_01f", name = "OwO Plasma Helbore 1 (2)"},
		{id = "owo_plasma_krieg_02f", name = "OwO Plasma Helbore 2 (3)"},
		{id = "owo_plasma_dmr_01", name = "OwO Plasma Lasgun 1"},
		{id = "owo_plasma_dmr_02", name = "OwO Plasma Lasgun 2"},
		{id = "owo_plasma_dmr_01f", name = "OwO Plasma Lasgun 1 Flip"},
		{id = "owo_plasma_dmr_02f", name = "OwO Plasma Lasgun 2f"},
		{id = "owo_plasma_sniper_01", name = "OwO Plasma Sniper 1"},
		{id = "owo_plasma_sniper_02", name = "OwO Plasma Sniper 2"},
		{id = "owo_plasma_sniper_03", name = "OwO Plasma Sniper 3"},
		{id = "owo_plasma_sniper_04", name = "OwO Plasma Sniper 4"},
		{id = "owo_plasma_sniper_05", name = "OwO Plasma Sniper 5"},
		{id = "owo_plasma_sniper_06", name = "OwO Plasma Sniper 6"},
		{id = "owo_plasma_sniper_07", name = "OwO Plasma Sniper 7"},
		{id = "owo_plasma_sniper_08", name = "OwO Plasma Sniper 8"},
		{id = "owo_plasma_sniper_09", name = "OwO Plasma Sniper 9"},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroud" , {
		{id = "owo_plasma_krieg_ac0_empty", name = "Empty Barrel", no_randomize = true},
		{id = "owo_plasma_krieg_ac0_01", name = "OwO Plasma Helbore ac0 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac", {
		{id = "owo_plasma_krieg_ac1_empty", name = "Empty Barrelac", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_01", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_02", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_03", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_04", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_05", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_06", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_07", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_08", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
		{id = "owo_plasma_krieg_ac1_09", name = "OwO Plasma Helbore ac1 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_plasma_krieg_01f = {
			model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_02", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", }
		},
		owo_plasma_krieg_02f = {
			model = _item_ranged.."/barrels/lasgun_rifle_krieg_barrel_04", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", }
		},
		owo_plasma_dmr_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", }
		},
		owo_plasma_dmr_02 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_05", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", }
		},
		owo_plasma_dmr_01f = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", }
		},
		owo_plasma_dmr_02f = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_05", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", }
		},
		owo_plasma_sniper_01 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_01", }
		},
		owo_plasma_sniper_02 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_02", }
		},
		owo_plasma_sniper_03 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_03", }
		},
		owo_plasma_sniper_04 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_04", }
		},
		owo_plasma_sniper_05 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_05", }
		},
		owo_plasma_sniper_06 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_06", }
		},
		owo_plasma_sniper_07 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_07", }
		},
		owo_plasma_sniper_08 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_08", }
		},
		owo_plasma_sniper_09 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_06", type = "barrel", 
			mesh_move = false, parent = "receiver",
			automatic_equip = { barrelshroud = "owo_plasma_krieg_ac0_01", barrelshroudac = "owo_plasma_krieg_ac1_09", }
		},
		-- ### Helper Parts ###
		owo_plasma_krieg_ac0_empty = {
			model = "", type = "barrelshroud", 
			mesh_move = false, parent = "barrel"
		},
		owo_plasma_krieg_ac0_01 = {
			model = _item_ranged.."/barrels/plasma_rifle_barrel_01", type = "barrelshroud", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_empty = {
			model = "", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel"
		},
		owo_plasma_krieg_ac1_01 = {
			model = _item_ranged.."/underbarrels/shotgun_rifle_underbarrel_01", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_02 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_01", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_03 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_04", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_04 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_05", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_05 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_06", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_06 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_07", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_07 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_08", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_08 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_09", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
		owo_plasma_krieg_ac1_09 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_ml01", type = "barrelshroudac", 
			mesh_move = false, parent = "barrel",
		},
	})

end

-- Foregrip: Empty Foregrip
function mod.owo_empty_foregrip(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "foregrip", {
		{id = "owo_foregrip_empty", name = "Empty Foregrip"},
	})
	mod.inject_models(variant_id, {
		owo_foregrip_empty = {
			model = "", type = type or "foregrip", 
			mesh_move = false, parent = "receiver",
		},
	})
end

-- Foregrip: Tactical Foregrips
function mod.owo_tactical_foregrip(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, "foregrip", {
		{id = "owo_tactical_foregrip_01", name = "OwO Angled Foregrip (AFG) 1"},
		{id = "owo_tactical_foregrip_02", name = "OwO AFG 1 Slanted"},
		{id = "owo_tactical_foregrip_03", name = "OwO AFG 2"},
		{id = "owo_tactical_foregrip_04", name = "OwO AFG 3"},
	})
	mod.inject_attachments_owo(variant_id, "foregripac1", {
		{id = "owo_tactical_foregrip_ac1_empty", name = "OwO foregripac1 empty"},
		{id = "owo_tactical_foregrip_ac1_01", name = "OwO AFGac2'vesa 1"},
	})
	mod.inject_attachments_owo(variant_id, "foregripac2", {
		{id = "owo_tactical_foregrip_ac2_empty", name = "OwO foregripac2 empty"},
		{id = "owo_tactical_foregrip_ac2_01", name = "OwO AFGac2'vesa 1"},
	})
	mod.inject_attachments_owo(variant_id, "foregripac3", {
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
function mod.owo_heterosexual_foregrip(variant_id, given_type)
	local current_main_type = type or "foregrip"
	mod.inject_attachments_owo(variant_id, current_main_type, {
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
			model = _item_ranged.."/grips/grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_02 = {
			model = _item_ranged.."/grips/grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_03 = {
			model = _item_ranged.."/grips/grip_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_04 = {
			model = _item_ranged.."/grips/grip_05", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_05 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_06 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_07 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_08 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_09 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_10 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_11 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_12 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_ak_05", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_13 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_killshot_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_14 = {
			model = _item_ranged.."/grips/boltgun_pistol_grip_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_15 = {
			model = _item_ranged.."/grips/boltgun_pistol_grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_16 = {
			model = _item_ranged.."/grips/boltgun_pistol_grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_17 = {
			model = _item_ranged.."/grips/boltgun_rifle_grip_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_18 = {
			model = _item_ranged.."/grips/boltgun_rifle_grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_19 = {
			model = _item_ranged.."/grips/boltgun_rifle_grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_20 = {
			model = _item_ranged.."/grips/boltgun_rifle_grip_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_21 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_22 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_23 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_24 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_25 = {
			model = _item_ranged.."/grips/lasgun_pistol_grip_05", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_26 = {
			model = _item_ranged.."/grips/flamer_rifle_grip_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_27 = {
			model = _item_ranged.."/grips/flamer_rifle_grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_28 = {
			model = _item_ranged.."/grips/flamer_rifle_grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_grip_29 = {
			model = _item_ranged.."/grips/flamer_rifle_grip_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		-- Ogryn
		owo_heterosexual_foregrip_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_03 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_05 = {
			model = _item_ranged.."/handles/combat_blade_handle_05", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_06 = {
			model = _item_ranged.."/handles/combat_blade_handle_06", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_07 = {
			model = _item_ranged.."/handles/combat_blade_handle_07", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_08 = {
			model = _item_ranged.."/handles/combat_blade_handle_08", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		-- Dclaw
		owo_heterosexual_foregrip_09 = {
			model = _item_melee.."/grips/combat_sword_grip_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_10 = {
			model = _item_melee.."/grips/combat_sword_grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_11 = {
			model = _item_melee.."/grips/combat_sword_grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_12 = {
			model = _item_melee.."/grips/combat_sword_grip_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_13 = {
			model = _item_melee.."/grips/combat_sword_grip_05", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_14 = {
			model = _item_melee.."/grips/combat_sword_grip_06", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		-- Knife 
		owo_heterosexual_foregrip_knife_01 = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_02 = {
			model = _item_melee.."/grips/combat_knife_grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_03 = {
			model = _item_melee.."/grips/combat_knife_grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_04 = {
			model = _item_melee.."/grips/combat_knife_grip_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_05 = {
			model = _item_melee.."/grips/combat_knife_grip_05", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_06 = {
			model = _item_melee.."/grips/combat_knife_grip_06", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_06_fat = {
			model = _item_melee.."/grips/combat_knife_grip_06", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_01s = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_02s = {
			model = _item_melee.."/grips/combat_knife_grip_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_03s = {
			model = _item_melee.."/grips/combat_knife_grip_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_04s = {
			model = _item_melee.."/grips/combat_knife_grip_04", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_05s = {
			model = _item_melee.."/grips/combat_knife_grip_05", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_06s = {
			model = _item_melee.."/grips/combat_knife_grip_06", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_heterosexual_foregrip_knife_06s_fat = {
			model = _item_melee.."/grips/combat_knife_grip_06", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
	})
end

-- Bayonet: Dreg Gunner bayonet
--		Brauto/Iag
function mod.owo_dreg_gunner_bayonet(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "bayonet", {
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
function mod.owo_bayonet(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "bayonet", {
		{id = "owo_bayonet_m7_01", name = "OwO M7 Bayonet"},
		{id = "owo_bayonet_seitengewehr", name = "OwO Seitengewehr 98"},
		{id = "owo_bayonet_epee", name = "OwO Épée Baïonnette 1886"},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac1", {
		{id = "owo_bayonet_empty_01", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_bayonet_m7_helper_01", name = "M7 Bayonet Grip", no_randomize = true},
		{id = "owo_bayonet_seitengewehr_helper_01", name = "Seitengewehr Grip", no_randomize = true},
		{id = "owo_bayonet_epee_helper_01", name = "Epee Grip", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac2", {
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
function mod.owo_underbarrel_gl(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "bayonet", {
		{id = "owo_m203", name = "OwO M203 Grenade Launcher"},
		{id = "owo_gp25", name = "OwO GP-25 Grenade Launcher"},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac1", {
		{id = "owo_underbarrel_gl_empty_01", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_01", name = "OwO M203 ac1", no_randomize = true},
		{id = "owo_gp25_helper_01", name = "OwO GP25 ac1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac2", {
		{id = "owo_underbarrel_gl_empty_02", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_02", name = "OwO M203 ac2", no_randomize = true},
		{id = "owo_gp25_helper_02", name = "OwO GP25 ac2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac3", {
		{id = "owo_underbarrel_gl_empty_03", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_03", name = "OwO M203 ac3", no_randomize = true},
		{id = "owo_gp25_helper_03", name = "OwO GP25 ac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac4", {
		{id = "owo_underbarrel_gl_empty_04", name = "Empty Bayonet", no_randomize = true},
		{id = "owo_m203_helper_04", name = "OwO M203 ac4", no_randomize = true},
		{id = "owo_gp25_helper_04", name = "OwO GP25 ac4", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac5", {
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
			},
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
function mod.owo_underbarrel_shotgun(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "bayonet", {
		{id = "owo_underbarrel_shotgun_01_01", name = "OwO Masterkey"},
		{id = "owo_underbarrel_shotgun_01", name = "OwO Masterkey (THICC)"},
		{id = "owo_underbarrel_shotgun_01_02", name = "OwO Masterkey (Mini)"},
		{id = "owo_underbarrel_shotgun_02", name = "OwO M26-MASS"},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac1", {
		{id = "owo_underbarrel_shotgun_empty_01", name = "Empty Bayonetac1", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_01", name = "OwO Masterkey ac1", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_01_02", name = "OwO MASS ac1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac2", {
		{id = "owo_underbarrel_shotgun_empty_02", name = "Empty Bayonetac2", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_02", name = "OwO Masterkey ac2", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_02_02", name = "OwO MASS ac2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac3", {
		{id = "owo_underbarrel_shotgun_empty_03", name = "Empty Bayonetac3", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_03", name = "OwO Masterkey ac3", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_03_02", name = "OwO MASS ac3", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac4", {
		{id = "owo_underbarrel_shotgun_empty_04", name = "Empty Bayonetac4", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_04", name = "OwO Masterkey ac4", no_randomize = true}, -- Trigger
	})
	mod.inject_attachments_owo(variant_id, "bayonetac5", {
		{id = "owo_underbarrel_shotgun_empty_05", name = "Empty Bayonetac5", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_05", name = "OwO Masterkey ac5", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_05_02", name = "OwO MASS ac5", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac6", {
		{id = "owo_underbarrel_shotgun_empty_06", name = "Empty Bayonetac6", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_06", name = "OwO Masterkey ac6", no_randomize = true},
		{id = "owo_underbarrel_shotgun_helper_06_02", name = "OwO MASS ac6", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bayonetac7", {
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
		owo_underbarrel_shotgun_01_01 = {
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
function mod.owo_california_bolter(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, "receiver", {
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
function mod.owo_bolt_action(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, "receiver", {
		{id = "owo_bolt_helbore_01", name = "OwO Helbore Bolt Action 1"},
		{id = "owo_bolt_helbore_02", name = "OwO Helbore Bolt Action 2"},
		{id = "owo_bolt_helbore_03", name = "OwO Helbore Bolt Action 3"},
		{id = "owo_bolt_helbore_04", name = "OwO Helbore Bolt Action 4"},
		{id = "owo_bolt_helbore_05", name = "OwO Helbore Bolt Action 5"},
	})
	mod.inject_attachments_owo(variant_id, "receiverac1", {
		{id = "owo_bolt_grip_empty", name = "receiverac1 empty", no_randomize = true},
		{id = "owo_bolt_helbore_bolt_01", name = "OwO bolt action bolt", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "receiverac2", {
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
function mod.owo_helbore_mas49(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, "receiver", {
		{id = "owo_helbore_mas49_01", name = "OwO Helbore MAS-49 1"},
		{id = "owo_helbore_mas49_02", name = "OwO Helbore MAS-49 2"},
		{id = "owo_helbore_mas49_03", name = "OwO Helbore MAS-49 3"},
		--{id = "owo_helbore_mas49_04", name = "OwO Helbore MAS-49 4"}, -- yeah this musket ass mf ain't workin
		{id = "owo_helbore_mas49_05", name = "OwO Helbore MAS-49 4 (M)"},
		{id = "owo_helbore_mas49_01_s", name = "OwO MAS-49 Slim 1"},
	})
	mod.inject_attachments_owo(variant_id, "receiverac1", {
		{id = "owo_bolt_empty", name = "receiverac1 empty", no_randomize = true},
		{id = "owo_helbore_mas49_ass", name = "OwO MAS-49 Ass", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "receiverac2", {
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
		{id = "owo_laspistol_grip_mag_helper_empty", name = "Empty Receiverac1", no_randomize = true},
		{id = "owo_laspistol_grip_mag_helper_01", name = "OwO Pistol Receiverac", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "receiverac2", {
		{id = "owo_laspistol_grip_mag_helper2_empty", name = "Empty Receiverac2", no_randomize = true},
		{id = "owo_laspistol_grip_mag_helper2_01", name = "OwO Pistol Trigger", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
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
		-- ### Helper Parts ###
		owo_laspistol_grip_mag_helper_empty = {
			model = "", type = "receiverac1", parent = "receiver", mesh_move = false,
		},
		owo_laspistol_grip_mag_helper_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "receiverac1", parent = "receiver", mesh_move = false,
		},
		owo_laspistol_grip_mag_helper2_empty = {
			model = "", type = "receiverac2", parent = "receiver", mesh_move = false,
		},
		owo_laspistol_grip_mag_helper2_01 = {
			model = "content/items/weapons/player/melee/blades/sabre_blade_01", type = "receiverac2", parent = "receiver", mesh_move = false,
		},
	})
end

-- Grip: Fin Grip
function mod.owo_fin_grip(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "grip", {
		{id = "owo_fin_grip_01", name = "OwO Fin Grip 1"},
	})
	mod.inject_attachments_owo(variant_id, "gripac", {
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

-- Stock: Straight Grip and Stock
--	Recon
--	Anti-Material Rifle (AMR, Barrett M82 style)
function mod.owo_helbore_gripstock(variant_id,type)
	mod.inject_attachments_owo(variant_id, given_type or "stock", {
		{id = "owo_gripstock_recon_01", name = "OwO StraightGrip Recon 1"},
		{id = "owo_gripstock_recon_02", name = "OwO StraightGrip Recon 2"},
		{id = "owo_gripstock_recon_03", name = "OwO StraightGrip Recon 3"},
		{id = "owo_gripstock_amr_01", name = "OwO AMR Stock+Grip 1"},
		{id = "owo_gripstock_amr_02", name = "OwO AMR Stock+Grip 2"},
		{id = "owo_gripstock_amr_03", name = "OwO AMR Stock+Grip 3"},
		{id = "owo_gripstock_amr_04", name = "OwO AMR Stock+Grip 4"},
		{id = "owo_gripstock_amr_05", name = "OwO AMR Stock+Grip 5"},
		{id = "owo_gripstock_amr_06", name = "OwO AMR Stock+Grip 6"},
		{id = "owo_gripstock_amr_07", name = "OwO AMR Stock+Grip 7"},
		{id = "owo_gripstock_amr_08", name = "OwO AMR Stock+Grip 8"},
		{id = "owo_gripstock_amr_09", name = "OwO AMR Stock+Grip 9"},
	})
	mod.inject_attachments_owo(variant_id, "stockac", {
		{id = "owo_gripstock_grip_empty",  name = "Empty stockac", no_randomize = true},
		{id = "owo_gripstock_grip_01a",  name = "OwO StraightGrip stockac", no_randomize = true},
		{id = "owo_gripstock_amr_ac_01",  name = "OwO StraightGrip50 stockac", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "stockac2", {
		{id = "owo_gripstock_amr_ac2_empty",  name = "Empty stockac2", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_01",  name = "OwO StraightGrip50 stockac2 1", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_02",  name = "OwO StraightGrip50 stockac2 2", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_03",  name = "OwO StraightGrip50 stockac2 3", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_04",  name = "OwO StraightGrip50 stockac2 4", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_05",  name = "OwO StraightGrip50 stockac2 1", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_06",  name = "OwO StraightGrip50 stockac2 2", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_07",  name = "OwO StraightGrip50 stockac2 3", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_08",  name = "OwO StraightGrip50 stockac2 4", no_randomize = true},
		{id = "owo_gripstock_amr_ac2_09",  name = "OwO StraightGrip50 stockac2 4", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		--	Recon
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
		-- 	AMR
	    owo_gripstock_amr_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_01",
			},
		},
		owo_gripstock_amr_02 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_02",
			},
		},
		owo_gripstock_amr_03 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_03",
			},
		},
		owo_gripstock_amr_04 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_04",
			},
		},
		owo_gripstock_amr_05 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_05",
			},
		},
		owo_gripstock_amr_06 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_06",
			},
		},
		owo_gripstock_amr_07 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_07",
			},
		},
		owo_gripstock_amr_08 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_08",
			},
		},
		owo_gripstock_amr_09 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "stock", parent = "receiver", 
			automatic_equip = {
				stockac = "owo_gripstock_amr_ac_01", stockac2 = "owo_gripstock_amr_ac2_09",
			},
		},
		-- ### Helper Parts ###
		-- AC1: Grip
		owo_gripstock_grip_empty = {
			model = "", type = "stockac", parent = "receiver", 
		},
		owo_gripstock_grip_01a = {
			model = _item_ranged.."/recievers/stubgun_pistol_receiver_02", type = "stockac", parent = "receiver", 
			move = vector3_box(0, 0, 0), remove = vector3_box(0, -.2, 0)
		},
		owo_gripstock_amr_ac_01 = {
			model = _item_ranged.."/grips/autogun_rifle_grip_killshot_01", type = "stockac", parent = "stock",
		},
		-- AC2: Stock loop fuckass thing
		owo_gripstock_amr_ac2_empty = {
			model = "", type = "stockac2", parent = "stock", 
		},
		--		Something about chain sword grips is making it not attach. The trigger perhaps?
		--			Issue arises with grip {2, 3, 4, 6, 7, 9}
		owo_gripstock_amr_ac2_01 = {
			model = _item_melee.."/grips/chain_sword_grip_05", type = "stockac2", parent = "stock",
		},
		owo_gripstock_amr_ac2_02 = {
			model = _item_melee.."/grips/chain_sword_grip_08", type = "stockac2", parent = "stock",
		},
		owo_gripstock_amr_ac2_03 = {
			model = _item_ranged.."/recievers/rippergun_rifle_receiver_01", type = "stockac2", parent = "stock",
			hide_mesh = {{"stockac2", 5,6}}
		},
		owo_gripstock_amr_ac2_04 = {
			model = _item_melee.."/grips/combat_blade_grip_01", type = "stockac2", parent = "stock",
		},
		owo_gripstock_amr_ac2_05 = {
			model = _item_melee.."/grips/combat_blade_grip_02", type = "stockac2", parent = "stock",
		},
		owo_gripstock_amr_ac2_06 = {
			model = _item_melee.."/grips/combat_blade_grip_04", type = "stockac2", parent = "stock",
		},
		owo_gripstock_amr_ac2_07 = {
			model = _item_melee.."/grips/combat_blade_grip_05", type = "stockac2", parent = "stock",
		},
		owo_gripstock_amr_ac2_08 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = "stockac2", parent = "stock",
		},
		owo_gripstock_amr_ac2_09 = {
			model = _item_melee.."/grips/combat_blade_grip_08", type = "stockac2", parent = "stock",
		},
	})
end

-- Stock: Tactical Stock
function mod.owo_tactical_stock(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "stock", {
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
	mod.inject_attachments_owo(variant_id, "stockac", {
		{id = "owo_tactical_stockac_00",  name = "Empty stockac", no_randomize = true},
		{id = "owo_tactical_stockac_01",  name = "Folding stock'vesa", no_randomize = true},
	})
	local current_main_type = type or "stock" 

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_tactical_stock_s_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stock_f_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stock_f_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_ml01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stock_f_03u = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
		},
		owo_tactical_stock_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_03 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_04 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_ml01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_05 = {
			model = _item_ranged.."/stocks/stock_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_06 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_07 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_08 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_05", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_01l = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_02l = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_03l = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_04l = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_ml01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_05l = {
			model = _item_ranged.."/stocks/stock_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_06l = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_07l = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = current_main_type, 
			mesh_move = false, parent = "receiver",
			automatic_equip = {
				stockac = "owo_tactical_stockac_01",
			},
		},
		owo_tactical_stock_08l = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_05", type = current_main_type, 
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
function mod.owo_kalash_stock(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, given_type or "stock", {
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

-- Stock: Big Stock!
function mod.owo_beeg_stock(variant_id, given_type)
	local current_main_type = type or "stock"
	mod.inject_attachments_owo(variant_id, "stockac", {
		{id = "owo_beeg_stockac_00", name = "Empty stockac", no_randomize = true},
		{id = "owo_beeg_stockac_01", name = "OwO Beeg Stock Indicator", no_randomize = true},
	})
	mod.inject_models(variant_id, {
		-- ### Helper Parts ###
		owo_beeg_stockac_00 = {
			model = "", type = "stockac", parent = "receiver",
		},
		owo_beeg_stockac_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "stockac", parent = "receiver",
			hide_mesh = {{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}},
		},
	})
	
	-- Generic
	if not (variant_id == "shotgun_p1_m1") then
		mod.inject_attachments_owo(variant_id, current_main_type, {
			{id = "owo_beeg_stock_01", name = "OwO Big ^.^ Stock 1"},
			{id = "owo_beeg_stock_02", name = "OwO Big ^.^ Stock 2"},
			{id = "owo_beeg_stock_03", name = "OwO Big ^.^ Stock 3"},
			{id = "owo_beeg_stock_04", name = "OwO Big ^.^ Stock 4"},
			{id = "owo_beeg_stock_05", name = "OwO Big ^.^ Stock 5"},

		})
		mod.inject_models(variant_id, {
			-- Generic
			owo_beeg_stock_01 = {
				model = _item_ranged.."/stocks/stock_01", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_02 = {
				model = _item_ranged.."/stocks/stock_02", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_03 = {
				model = _item_ranged.."/stocks/stock_03", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_04 = {
				model = _item_ranged.."/stocks/stock_04", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_05 = {
				model = _item_ranged.."/stocks/stock_05", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
		})
	end
	-- Infantry Autogun
	mod.inject_attachments_owo(variant_id, current_main_type, {
		{id = "owo_beeg_stock_iag_02", name = "OwO Big ^.^ Stock IAG 2"},
		{id = "owo_beeg_stock_iag_03", name = "OwO Big ^.^ Stock IAG 3"},
		{id = "owo_beeg_stock_iag_04", name = "OwO Big ^.^ Stock IAG 4"},
		{id = "owo_beeg_stock_iag_05", name = "OwO Big ^.^ Stock IAG (M)"},
	})
	mod.inject_models(variant_id, {
		-- Infantry Autogun
		owo_beeg_stock_iag_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_stock_02", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
		owo_beeg_stock_iag_03 = {
			model = _item_ranged.."/stocks/autogun_rifle_stock_03", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
		owo_beeg_stock_iag_04 = {
			model = _item_ranged.."/stocks/autogun_rifle_stock_04", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
		owo_beeg_stock_iag_05 = {
			model = _item_ranged.."/stocks/autogun_rifle_stock_ml01", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
	})
	-- Braced Autogun
	mod.inject_attachments_owo(variant_id, current_main_type, {
		{id = "owo_beeg_stock_bag_02", name = "OwO Big ^.^ Stock BAG 2"},
		{id = "owo_beeg_stock_bag_05", name = "OwO Big ^.^ Stock BAG 5"},
	})
	mod.inject_models(variant_id, {
		-- Braced Autogun
		owo_beeg_stock_bag_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
		owo_beeg_stock_bag_05 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_05", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
	})
	if not (variant_id == "shotgun_p1_m1") then
		mod.inject_attachments_owo(variant_id, current_main_type, {
			{id = "owo_beeg_stock_iag_01", name = "OwO Big ^.^ Stock IAG 1"},
			{id = "owo_beeg_stock_bag_01", name = "OwO Big ^.^ Stock BAG 1"},
			{id = "owo_beeg_stock_bag_03", name = "OwO Big ^.^ Stock BAG 3"},
			{id = "owo_beeg_stock_bag_04", name = "OwO Big ^.^ Stock BAG 4"},
			{id = "owo_beeg_stock_bag_06", name = "OwO Big ^.^ Stock BAG 6"},
			{id = "owo_beeg_stock_bag_07", name = "OwO Big ^.^ Stock BAG 7"},
			{id = "owo_beeg_stock_bag_08", name = "OwO Big ^.^ Stock BAG (M)"},
			{id = "owo_beeg_stock_sg_01", name = "OwO Big ^.^ Stock SG 1"},
			{id = "owo_beeg_stock_sg_02", name = "OwO Big ^.^ Stock SG 2"},
			{id = "owo_beeg_stock_sg_03", name = "OwO Big ^.^ Stock SG 3"},
			{id = "owo_beeg_stock_sg_04", name = "OwO Big ^.^ Stock SG 4"},
			{id = "owo_beeg_stock_sg_05", name = "OwO Big ^.^ Stock SG 5"},
			{id = "owo_beeg_stock_sg_06", name = "OwO Big ^.^ Stock SG 6"},
			{id = "owo_beeg_stock_sg_07", name = "OwO Big ^.^ Stock SG 7"},
			{id = "owo_beeg_stock_sg_08", name = "OwO Big ^.^ Stock SG (M)"},
			{id = "owo_beeg_stock_h_01", name = "OwO Big Wood ^.^ 1"},
			{id = "owo_beeg_stock_h_02", name = "OwO Big Wood ^.^ 2"},
			{id = "owo_beeg_stock_h_03", name = "OwO Big Wood ^.^ 2"},
		})
		mod.inject_models(variant_id, {
			-- Infantry Autogun
			owo_beeg_stock_iag_01 = {
				model = _item_ranged.."/stocks/autogun_rifle_stock_01", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			-- Braced Autogun
			owo_beeg_stock_bag_01 = {
				model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_bag_03 = {
				model = _item_ranged.."/stocks/autogun_rifle_ak_stock_03", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_bag_04 = {
				model = _item_ranged.."/stocks/autogun_rifle_ak_stock_04", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_bag_06 = {
				model = _item_ranged.."/stocks/autogun_rifle_ak_stock_06", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_bag_07 = {
				model = _item_ranged.."/stocks/autogun_rifle_ak_stock_07", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_bag_08 = {
				model = _item_ranged.."/stocks/shotgun_rifle_ak_stock_ml01", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			-- Shotgun
			owo_beeg_stock_sg_01 = {
				model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_sg_02 = {
				model = _item_ranged.."/stocks/shotgun_rifle_stock_03", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_sg_03 = {
				model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_sg_04 = {
				model = _item_ranged.."/stocks/shotgun_rifle_stock_06", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_sg_05 = {
				model = _item_ranged.."/stocks/shotgun_rifle_stock_07", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_sg_06 = {
				model = _item_ranged.."/stocks/shotgun_rifle_stock_08", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_sg_07 = {
				model = _item_ranged.."/stocks/shotgun_rifle_stock_09", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_sg_08 = {
				model = _item_ranged.."/stocks/shotgun_rifle_stock_ml01", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			-- Helbore
			owo_beeg_stock_h_01 = {
				model = _item_ranged.."/stocks/lasgun_rifle_krieg_stock_01", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_h_02 = { 
				model = _item_ranged.."/stocks/lasgun_rifle_krieg_stock_02", type = current_main_type, 
				mesh_move = false, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
			owo_beeg_stock_h_03 = {
				model = _item_ranged.."/stocks/lasgun_rifle_krieg_stock_04", type = current_main_type, 
				mesh_move = false, parent = "receiver",
				automatic_equip = { stockac = "owo_beeg_stockac_01", },
			},
		})
	end
	-- Lasgun
	mod.inject_attachments_owo(variant_id, current_main_type, {
		{id = "owo_beeg_stock_las_01", name = "OwO Big ^.^ Stock Las 1"},
		{id = "owo_beeg_stock_las_02", name = "OwO Big ^.^ Stock Las 2"},
		{id = "owo_beeg_stock_las_03", name = "OwO Big ^.^ Stock Las 3"},
		{id = "owo_beeg_stock_las_04", name = "OwO Big ^.^ Stock Las 4"},
	})
	mod.inject_models(variant_id, {
		-- Las
		owo_beeg_stock_las_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_01", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
		owo_beeg_stock_las_02 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_02", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
		owo_beeg_stock_las_03 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
		owo_beeg_stock_las_04 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_04", type = current_main_type, parent = "receiver", automatic_equip = { stockac = "owo_beeg_stockac_01", },
		},
	})
end

-- Sight: Rear sights with flip up. Ladder Aperture Sights
--	Helbore style only
function mod.owo_rear_sight(variant_id, given_type, given_parent)
	local current_type = given_type or "sight"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_rear_sight_01", name = "OwO Aperture Sights, U Notch"},
		{id = "owo_rear_sight_02", name = "OwO Aperture, U Notch (Up)"},
		{id = "owo_rear_sight_o_00", name = "OwO _n_"},
		{id = "owo_rear_sight_o_01", name = "OwO _n_ (thicc)"},
		{id = "owo_rear_sight_o_02", name = "OwO MAS49/56 Irons"},
		{id = "owo_rear_sight_o_03", name = "OwO MAS49 (starving)"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1", {
		{id = "owo_rear_sight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac1_01", name = "Flip sight range select 1", no_randomize = true},
		{id = "owo_rear_sight_ac1_02", name = "MAS49 Peep 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2", {
		{id = "owo_rear_sight_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac2_01", name = "Flip sight range select 2", no_randomize = true},
		{id = "owo_rear_sight_ac2_02", name = "MAS49 Peep 2", no_randomize = true},
		{id = "owo_rear_sight_ac2_03", name = "MAS49/56 Feet", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3", {
		{id = "owo_rear_sight_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac3_01", name = "Rear Aperture 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4", {
		{id = "owo_rear_sight_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac4_01", name = "Rear Aperture 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5", {
		{id = "owo_rear_sight_empty_05", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac5_01", name = "MAS49 sight seat", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6", {
		{id = "owo_rear_sight_empty_06", name = "Empty Sight", no_randomize = true},
		{id = "owo_rear_sight_ac6_01", name = "MAS49 bulge", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- the base sight is the ladder
		owo_rear_sight_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_01", sightac2 = "owo_rear_sight_ac2_01",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
			}
		},
		owo_rear_sight_02 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_01", sightac2 = "owo_rear_sight_ac2_01",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
			}
		},
		-- mas sight
		owo_rear_sight_o_00 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_02", sightac2 = "owo_rear_sight_ac2_02",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
				sightac5 = "owo_rear_sight_ac5_01", sightac6 = "owo_rear_sight_empty",
			}
		},
		owo_rear_sight_o_01 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_02", sightac2 = "owo_rear_sight_ac2_02",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
				sightac5 = "owo_rear_sight_ac5_01", sightac6 = "owo_rear_sight_ac6_01",
			}
		},
		-- mas 49/56
		owo_rear_sight_o_02 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_rear_sight_ac1_02", sightac2 = "owo_rear_sight_empty",
				sightac3 = "owo_rear_sight_ac3_01", sightac4 = "owo_rear_sight_ac4_01",
				sightac5 = "owo_rear_sight_ac5_01", sightac6 = "owo_rear_sight_ac6_01",
			}
		},
		owo_rear_sight_o_03 = {
			model = _item_melee.."/grips/chain_sword_grip_07", type = current_type, 
			mesh_move = false, parent = current_parent,
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
			mesh_move = false, parent = current_type,
		},
		-- 	mas peep
		owo_rear_sight_ac1_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "sightac1", 
			mesh_move = false, parent = current_type,
		},
		-- ac2
		-- 	ladder sight select
		owo_rear_sight_ac2_01 = {
			model = _item_ranged.."/bayonets/rippergun_rifle_bayonet_02", type = "sightac2", 
			mesh_move = false, parent = current_type,
		},
		-- 	mas peep
		owo_rear_sight_ac2_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac2", 
			mesh_move = false, parent = current_type,
		},
		-- 	mas 49/56 bulgey wulgey (fake)
		owo_rear_sight_ac2_03 = {
			model = _item_melee.."/heads/power_maul_head_03", type = "sightac2", 
			mesh_move = false, parent = current_type,
		},
		-- ac3
		owo_rear_sight_ac3_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "sightac3", 
			mesh_move = false, parent = current_type,
		},
		-- ac4
		owo_rear_sight_ac4_01 = {
			model = _item_ranged.."/stocks/lasgun_rifle_stock_03", type = "sightac4", 
			mesh_move = false, parent = current_type,
		},
		-- ac5
		-- 	mas seat/feet
		owo_rear_sight_ac5_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "sightac5", 
			mesh_move = false, parent = current_type,
		},
		-- ac6
		-- 	mas bulgey wulgey (real)
		owo_rear_sight_ac6_01 = {
			model = _item_melee.."/heads/power_maul_head_03", type = "sightac6", 
			mesh_move = false, parent = current_type,
		},
		-- ### Empty ###
		owo_rear_sight_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = current_type
		},
		owo_rear_sight_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = current_type
		},
		owo_rear_sight_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		owo_rear_sight_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = current_type
		},
		owo_rear_sight_empty_05 = {
			model = "", type = "sightac5", 
			mesh_move = false, parent = current_type
		},
		owo_rear_sight_empty_06 = {
			model = "", type = "sightac6", 
			mesh_move = false, parent = current_type
		},
	})
end

-- Sight: Kalashnikov Rear Sights
--	I made 1 and 2 before noticing thte range select was already a part in game lmfao
function mod.owo_kalashnikov_rear_sight(variant_id, given_type, given_parent)
	local current_type = given_type or "sight"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_kalashnikov_rear_sight_01", name = "OwO AK Irons"},
		{id = "owo_kalashnikov_rear_sight_02", name = "OwO AK Irons w/ Dust Cover"},
		{id = "owo_kalashnikov_rear_sight_03", name = "OwO AK Scuffed Irons"},
		{id = "owo_kalashnikov_rear_sight_04", name = "OwO AK Scuffed Irons2"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1", {
		{id = "owo_kalashnikov_rear_sight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_kalashnikov_rear_sight_ac1_01", name = "AK Range select 1", no_randomize = true},
		{id = "owo_kalashnikov_rear_sight_ac1_02", name = "AK Range select 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2", {
		{id = "owo_kalashnikov_rear_sight_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_kalashnikov_rear_sight_ac2_01", name = "AK Range select 2", no_randomize = true},
		{id = "owo_kalashnikov_rear_sight_ac2_02", name = "AK Range select 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3", {
		{id = "owo_kalashnikov_rear_sight_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_kalashnikov_rear_sight_ac3_01", name = "Rear Aperture 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4", {
		{id = "owo_kalashnikov_rear_sight_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_kalashnikov_rear_sight_ac4_01", name = "Rear Aperture 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5", {
		{id = "owo_kalashnikov_rear_sight_empty_05", name = "Empty Sight", no_randomize = true},
		{id = "owo_kalashnikov_rear_sight_ac5_01", name = "AK Bottom notch", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6", {
		{id = "owo_kalashnikov_rear_sight_empty_06", name = "Empty Sight", no_randomize = true},
		{id = "owo_kalashnikov_rear_sight_ac6_01", name = "AK Dust Cover", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- Avtomat Kalashnikov
		--	Using the elevation ladder ALREADY IN THE GAME
		owo_kalashnikov_rear_sight_01 = {
			model = _item_ranged.."/sights/autogun_rifle_sight_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_kalashnikov_rear_sight_ac1_02", sightac2 = "owo_kalashnikov_rear_sight_ac2_02",
				sightac3 = "owo_kalashnikov_rear_sight_ac3_01", sightac4 = "owo_kalashnikov_rear_sight_ac4_01",
				sightac5 = "owo_kalashnikov_rear_sight_ac5_01",
			},
			hide_mesh = {
				{current_type, 2,3,4,5,6} -- one of these is the front rail lol
			},
		},
		owo_kalashnikov_rear_sight_02 = {
			model = _item_ranged.."/sights/autogun_rifle_sight_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_kalashnikov_rear_sight_ac1_02", sightac2 = "owo_kalashnikov_rear_sight_ac2_02",
				sightac3 = "owo_kalashnikov_rear_sight_ac3_01", sightac4 = "owo_kalashnikov_rear_sight_ac4_01",
				sightac5 = "owo_kalashnikov_rear_sight_ac5_01", sightac6 = "owo_kalashnikov_rear_sight_ac6_01",
			},
			hide_mesh = {
				{current_type, 2,3,4,5,6} -- one of these is the front rail lol
			},
		},
		--	Ladder for the elevation
		owo_kalashnikov_rear_sight_03 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_kalashnikov_rear_sight_ac1_01", sightac2 = "owo_kalashnikov_rear_sight_ac2_01",
				sightac3 = "owo_kalashnikov_rear_sight_ac3_01", sightac4 = "owo_kalashnikov_rear_sight_ac4_01",
				sightac5 = "owo_kalashnikov_rear_sight_ac5_01",
			}
		},
		owo_kalashnikov_rear_sight_04 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { sightac1 = "owo_kalashnikov_rear_sight_ac1_01", sightac2 = "owo_kalashnikov_rear_sight_ac2_01",
				sightac3 = "owo_kalashnikov_rear_sight_ac3_01", sightac4 = "owo_kalashnikov_rear_sight_ac4_01",
				sightac5 = "owo_kalashnikov_rear_sight_ac5_01", sightac6 = "owo_kalashnikov_rear_sight_ac6_01",
			}
		},
		-- ### Helper Parts ###
		-- ac1
		--	AK range select
		owo_kalashnikov_rear_sight_ac1_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sightac1", 
			mesh_move = false, parent = current_type,
		},
		owo_kalashnikov_rear_sight_ac1_02 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "sightac1", 
			mesh_move = false, parent = current_type,
		},
		-- ac2
		--	AK range select
		owo_kalashnikov_rear_sight_ac2_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = "sightac2", 
			mesh_move = false, parent = current_type,
		},
		owo_kalashnikov_rear_sight_ac2_02 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "sightac2", 
			mesh_move = false, parent = current_type,
		},
		-- ac3
		--	AK iron notch
		owo_kalashnikov_rear_sight_ac3_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "sightac3", 
			mesh_move = false, parent = current_type,
		},
		-- ac4
		--	AK iron notch
		owo_kalashnikov_rear_sight_ac4_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "sightac4", 
			mesh_move = false, parent = current_type,
		},
		-- ac5
		--	ak rear butt
		owo_kalashnikov_rear_sight_ac5_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "sightac5", 
			mesh_move = false, parent = current_type,
		},
		-- ac6
		--	ak dust cover
		owo_kalashnikov_rear_sight_ac6_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_02", type = "sightac6", 
			mesh_move = false, parent = current_type,
		},
		-- ### Empty ###
		owo_kalashnikov_rear_sight_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = current_type
		},
		owo_kalashnikov_rear_sight_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = current_type
		},
		owo_kalashnikov_rear_sight_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		owo_kalashnikov_rear_sight_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = current_type
		},
		owo_kalashnikov_rear_sight_empty_05 = {
			model = "", type = "sightac5", 
			mesh_move = false, parent = current_type
		},
		owo_kalashnikov_rear_sight_empty_06 = {
			model = "", type = "sightac6", 
			mesh_move = false, parent = current_type
		},
	})
end

-- Sight: M16 Carry Handle
function mod.owo_m16_sight(variant_id, given_type, given_parent)
	local current_type = given_type or "sight"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
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
			model = _item_ranged.."/recievers/lasgun_rifle_elysian_receiver_01", type = current_type, 
			mesh_move = false, parent = current_parent, hide_mesh = {{current_type, 1}}, -- hiding the stock. I stole this from MT
			automatic_equip = { sightac1 = "owo_m16_sight_helper_01", sightac2 = "owo_m16_sight_helper_02", 
				sightac3 = "owo_m16_sight_helper_03", 
				sightac4 = "owo_m16_sight_helper_04", sightac5 = "owo_m16_sight_helper_05", 
				sightac6 = "owo_m16_sight_helper_06", sightac7 = "owo_m16_sight_helper_07", 
			}
		},
		owo_m16_sight_02  = {
			model = _item_ranged.."/recievers/lasgun_rifle_elysian_receiver_02", type = current_type, 
			mesh_move = false, parent = current_parent, hide_mesh = {{current_type, 5}},
			automatic_equip = { sightac1 = "owo_m16_sight_helper_01", sightac2 = "owo_m16_sight_helper_02", 
				sightac3 = "owo_m16_sight_helper_03", 
				sightac4 = "owo_m16_sight_helper_04", sightac5 = "owo_m16_sight_helper_05", 
				sightac6 = "owo_m16_sight_helper_06", sightac7 = "owo_m16_sight_empty_07", 
			}
		},
		-- ### Helper Parts ###
		-- Carry handle side rails
		owo_m16_sight_helper_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "sightac1",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_helper_02 = {
			model = _item_ranged.."/stocks/autogun_rifle_ak_stock_01", type = "sightac2",
			mesh_move = false, parent = current_type
		},
		-- Rear sight aperture
		owo_m16_sight_helper_03 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "sightac3",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_helper_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sightac4",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_helper_05 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sightac5",
			mesh_move = false, parent = current_type
		},
		-- Windage Knob
		owo_m16_sight_helper_06 = {
			model = _item_melee.."/heads/human_power_maul_head_05", type = "sightac6",
			mesh_move = false, parent = current_type
		},
		-- Rear Elevation Knob
		-- seems to be a newer addition on a2+
		owo_m16_sight_helper_07 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "sightac7",
			mesh_move = false, parent = current_type
		},
		-- ### Empty ###
		owo_m16_sight_empty_01 = {
			model = "", type = "sightac1",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_empty_02 = {
			model = "", type = "sightac2",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_empty_03 = {
			model = "", type = "sightac3",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_empty_04 = {
			model = "", type = "sightac4",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_empty_05 = {
			model = "", type = "sightac5",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_empty_06 = {
			model = "", type = "sightac6",
			mesh_move = false, parent = current_type
		},
		owo_m16_sight_empty_07 = {
			model = "", type = "sightac7",
			mesh_move = false, parent = current_type
		},
		
	})
end

-- Sight: Holographic Sights + Magnifiers
--		EOTech HWS (Holographic Weapon Sight)
--		Vortex Razor AMG UH-1
function mod.owo_holographic_sight(variant_id, given_type)
	local current_type = given_type or "sight"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_holographic_sight_01_01", name = "OwO EOTech"},
		{id = "owo_holographic_sight_01_02_z1", name = "OwO EOTech+Magnifier (1.25x)"},
		{id = "owo_holographic_sight_01_02_z2", name = "OwO EOTech+Magnifier (1.75x)"},
		{id = "owo_holographic_sight_01_03", name = "OwO EOTech+Magnifier (Side)"},
		{id = "owo_holographic_sight_01_01ss", name = "OwO EOTech (Short)"},
		{id = "owo_holographic_sight_01_02ss_z1", name = "OwO EOTech + M (Short, 1.25x)"},
		{id = "owo_holographic_sight_01_02ss_z2", name = "OwO EOTech + M (Short, 1.75x)"},
		{id = "owo_holographic_sight_01_03ss", name = "OwO EOTech + M/s (Short)"},
		{id = "owo_holographic_sight_02_01", name = "OwO Razor Sight"},
		{id = "owo_holographic_sight_02_02_z1", name = "OwO Razor + M (1.25x)"},
		{id = "owo_holographic_sight_02_02_z2", name = "OwO Razor + M (1.75x)"},
		{id = "owo_holographic_sight_02_03", name = "OwO Razor + M/s"},
		{id = "owo_holographic_sight_02_01ss", name = "OwO Razor (Short)"},
		{id = "owo_holographic_sight_02_02ss_z1", name = "OwO Razor + M (Short, 1.25x)"},
		{id = "owo_holographic_sight_02_02ss_z2", name = "OwO Razor + M (Short, 1.75x)"},
		{id = "owo_holographic_sight_02_03ss", name = "OwO Razor + M/s (Short)"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1", {
		{id = "owo_holographic_sight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_holographic_sight_helper_01", name = "OwO EOTech'vesa sight container 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2", {
		{id = "owo_holographic_sight_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_holographic_sight_helper_02", name = "OwO EOTech'vesa sight container 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3", {
		{id = "owo_holographic_sight_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_holographic_sight_helper_03", name = "OwO EOTech'vesa base bulge", no_randomize = true},
		{id = "owo_holographic_sight_helper_03_02", name = "OwO Razor'vesa front scope hood", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4", {
		{id = "owo_holographic_sight_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_holographic_sight_helper_04", name = "OwO EOTech'vesa base", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary", {
		{id = "owo_holographic_sight_empty2", name = "Empty Sight", no_randomize = true},
		{id = "owo_holographic_sight_sight_secondary_01", name = "OwO EOTech Magnifier Stand", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary_ac1", {
		{id = "owo_holographic_sight_empty2_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_holographic_sight_sight_secondary_helper_01", name = "OwO EOTech Magnifier 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary_ac2", {
		{id = "owo_holographic_sight_empty2_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_holographic_sight_sight_secondary_helper_02", name = "OwO EOTech Magnifier 2", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- EOTech
		-- purposefully did not hide housing. the seating makes up the for skinny centre of the ogryn grip
		owo_holographic_sight_01_01 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03", sightac4 = "owo_holographic_sight_helper_04",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		owo_holographic_sight_01_02_z1 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type,
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holographic_sight_01_02_z2 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type,
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holographic_sight_01_03 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		-- Compact Versions that you can't aim with
		owo_holographic_sight_01_01ss = {
			model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		owo_holographic_sight_01_02ss_z1 = {
			--model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		owo_holographic_sight_01_02ss_z2 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		owo_holographic_sight_01_03ss = {
			model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		-- Vortex Razor Sight
		owo_holographic_sight_02_01 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03_02", sightac4 = "owo_holographic_sight_helper_04",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		owo_holographic_sight_02_02_z1 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03_02", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holographic_sight_02_02_z2 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03_02", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holographic_sight_02_03 = {
			model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03_02", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		owo_holographic_sight_02_01ss = {
			model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_default", lens_2 = "scope_lens_default", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03_02", sightac4 = "owo_holographic_sight_helper_04",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		owo_holographic_sight_02_02ss_z1 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03_02", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holographic_sight_02_02ss_z2 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03_02", sightac4 = "owo_holographic_sight_helper_04",
				sight_secondary = "owo_holographic_sight_sight_secondary_01", sight_secondary_ac1 = "owo_holographic_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_holographic_sight_sight_secondary_helper_02",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
		},
		owo_holographic_sight_02_03ss = {
			model = _item_ranged.."/sights/reflex_sight_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02", rail = "rail_default",
				sightac1 = "owo_holographic_sight_helper_01", sightac2 = "owo_holographic_sight_helper_02", 
				sightac3 = "owo_holographic_sight_helper_03_02", sightac4 = "owo_holographic_sight_helper_04",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1}
			},
		},
		-- ### Helper Parts ###
		owo_holographic_sight_helper_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "sightac1", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_helper_02 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "sightac2", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_helper_03 = {
			model = _item_melee.."/grips/hatchet_grip_03", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_helper_03_02 = {
			model = _item_ranged.."/muzzles/lasgun_pistol_muzzle_03", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_helper_04 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sightac4",
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_sight_secondary_01 = {
			model = _item_melee.."/grips/2h_chain_sword_grip_01", type = "sight_secondary",
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_sight_secondary_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "sight_secondary_ac1",
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_sight_secondary_helper_02 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "sight_secondary_ac2",
			mesh_move = false, parent = current_type
		},
		-- ### Empty ###
		owo_holographic_sight_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_empty2 = {
			model = "", type = "sight_secondary", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_empty2_01 = {
			model = "", type = "sight_secondary_ac1", 
			mesh_move = false, parent = current_type
		},
		owo_holographic_sight_empty2_02 = {
			model = "", type = "sight_secondary_ac2", 
			mesh_move = false, parent = current_type
		},
	})
end

-- Sight: Telescopic Sights
--		Trijicon ACOG (Advanced Combat Optical Gunsight), SUSAT (Small Unit Small Arms, Trilux - L9A1), Night Vision 1 (Sightmark Wraith HD), Night Vision 2 (Sightmark Photon XT)
--		KNOWN BUG: SUSAT on recon/ilas main receiver steals the laser (but not the volleygun)
--			Thief is the ac2/3, ak muzzles in the back
function mod.owo_telescopic_sight(variant_id, given_type, given_parent)
	local current_type = given_type or "sight"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
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
	mod.inject_attachments_owo(variant_id, "sightac1", {
		{id = "owo_acog_sight_empty_01", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_01", name = "OwO ACOG'vesa sight container 1", no_randomize = true},
		{id = "owo_susat_ac1_01", name = "SUSAT'vesa Cylinder thing", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2", {
		{id = "owo_acog_sight_empty_02", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_02", name = "OwO ACOG'vesa rear sight container 1", no_randomize = true},
		{id = "owo_susat_ac2_01", name = "SUSAT'vesa rear scope 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3", {
		{id = "owo_acog_sight_empty_03", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_03", name = "OwO ACOG'vesa rear sight container 2", no_randomize = true},
		{id = "owo_susat_ac3_01", name = "SUSAT'vesa rear scope 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4", {
		{id = "owo_acog_sight_empty_04", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_04", name = "OwO ACOG'vesa Base", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5", {
		{id = "owo_acog_sight_empty_05", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_05", name = "OwO ACOG'vesa Knob", no_randomize = true},
		{id = "owo_susat_ac5_01", name = "SUSAT'vesa reticle 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6", {
		{id = "owo_acog_sight_empty_06", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_06", name = "OwO ACOG'vesa Knob", no_randomize = true},
		{id = "owo_susat_ac6_01", name = "SUSAT'vesa reticle 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac7", {
		{id = "owo_acog_sight_empty_07", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_helper_07", name = "ACOG'vesa Cable", no_randomize = true},
		{id = "owo_susat_ac7_01", name = "SUSAT'vesa Front Scope 2", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary", {
		{id = "owo_acog_sight_empty2", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_sight_secondary_01", name = "OwO ACOG RMR", no_randomize = true},
	})
	--[[mod.inject_attachments_owo(variant_id, "sight_secondary_ac1", {
		{id = "owo_acog_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_sight_secondary_helper_01", name = "OwO ACOG Magnifier 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary_ac2", {
		{id = "owo_acog_sight_empty", name = "Empty Sight", no_randomize = true},
		{id = "owo_acog_sight_sight_secondary_helper_02", name = "OwO ACOG Magnifier 2", no_randomize = true},
	})]]

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_acog_sight_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_01f = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_01_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_01f_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02f = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02f_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 5,6},
			},
		},
		owo_acog_sight_02_top = {
			model = _item_melee.."/full/force_staff_full_02", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01", -- sight_secondary_ac1 = "owo_acog_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_acog_sight_sight_secondary_helper_02"
				sight_2 = "owo_reticle_helper_invisible",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_acog_sight_02f_top = {
			model = _item_melee.."/full/force_staff_full_02", type = current_type, 
			mesh_move = false, 
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_helper_01", sightac2 = "owo_acog_sight_helper_02", 
				sightac3 = "owo_acog_sight_helper_03", sightac4 = "owo_acog_sight_helper_04",
				sightac5 = "owo_acog_sight_helper_05", sightac6 = "owo_acog_sight_helper_06",
				sightac7 = "owo_acog_sight_helper_07",
				sight_secondary = "owo_acog_sight_sight_secondary_01", -- sight_secondary_ac1 = "owo_acog_sight_sight_secondary_helper_01", sight_secondary_ac2 = "owo_acog_sight_sight_secondary_helper_02"
				sight_2 = "owo_reticle_helper_invisible",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- SUSAT
		owo_susat_01 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_empty", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sightac7 = "owo_susat_ac7_01", sight_2 = "owo_reticle_helper_invisible",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_01_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_empty", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sightac7 = "owo_susat_ac7_01", sight_2 = "owo_reticle_helper_invisible",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_01_ps = {
			model = _item_melee.."/full/force_staff_full_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_susat_ac1_01", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sightac7 = "owo_susat_ac7_01", sight_2 = "owo_alt_viewmodel_06",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_02 = {
			model = _item_melee.."/pommels/axe_pommel_03", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_empty", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sightac7 = "owo_susat_ac7_01", sight_2 = "owo_reticle_helper_invisible",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_02_z1 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_acog_sight_empty", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sightac7 = "owo_susat_ac7_01", sight_2 = "owo_reticle_helper_invisible",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,5,6},
			},
		},
		owo_susat_02_top = {
			model = _item_melee.."/full/force_staff_full_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_susat_ac1_01", sightac2 = "owo_susat_ac2_01", 
				sightac3 = "owo_susat_ac3_01", sightac4 = "owo_acog_sight_helper_04", 
				sightac5 = "owo_susat_ac5_01", sightac6 = "owo_susat_ac6_01", 
				sight_secondary = "owo_acog_sight_sight_secondary_01",
				sightac7 = "owo_susat_ac7_01", sight_2 = "owo_reticle_helper_invisible",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- ### Helper Parts ###
		-- AC1
		-- 	ACOG: Front of scope
		owo_acog_sight_helper_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_elysian_muzzle_01", type = "sightac1", 
			mesh_move = false, parent = current_type
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
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_helper_03 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		--	SUSAT: Rear of scope
		owo_susat_ac2_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "sightac2", 
			--model = "", type = "sightac2", 
			mesh_move = false, parent = current_type
		},
		owo_susat_ac3_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "sightac3", 
			--model = "", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		-- AC4
		-- 	Base
		owo_acog_sight_helper_04 = {
			model = _item_melee.."/grips/hatchet_grip_04", type = "sightac4",
			mesh_move = false, parent = current_type
		},
		-- AC5, 6
		-- 	ACOG: Knobs
		owo_acog_sight_helper_05 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "sightac5",
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_helper_06 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "sightac6",
			mesh_move = false, parent = current_type
		},
		-- SUSAT: Reticle
		owo_susat_ac5_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "sightac5", 
			mesh_move = false, parent = current_type
		},
		owo_susat_ac6_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "sightac6", 
			mesh_move = false, parent = current_type
		},
		-- AC7
		-- Cable
		owo_acog_sight_helper_07 = {
			model = _item_melee.."/full/force_staff_full_01", type = "sightac7",
			mesh_move = false, parent = current_type
		},
		owo_susat_ac7_01 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac7",
			mesh_move = false, parent = current_type
		},
		-- Sight_Secondary
		-- RMR on top
		owo_acog_sight_sight_secondary_01 = {
			model = _item_ranged.."/sights/reflex_sight_02", type = "sight_secondary",
			mesh_move = false, parent = current_type
		},
		-- ### Empty ###
		owo_acog_sight_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_empty_05 = {
			model = "", type = "sightac5", 
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_empty_06 = {
			model = "", type = "sightac6", 
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_empty_07 = {
			model = "", type = "sightac7", 
			mesh_move = false, parent = current_type
		},
		owo_acog_sight_empty2 = {
			model = "", type = "sight_secondary", 
			mesh_move = false, parent = current_type
		},
	})
end

-- Sight: Soviet PU scope
--		Sight rings are too mf fat
function mod.owo_pu_scope(variant_id, given_type, given_parent)
	local current_type = given_type or "sight"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_pu_scope_01", name = "OwO Soviet PU Scope, Riser 1"},
		{id = "owo_pu_scope_02", name = "OwO Soviet PU Scope, Riser 1b"},
	})
	mod.inject_attachments_owo(variant_id, "sightac1", {
		{id = "owo_pu_scope_empty_01", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_01", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac2", {
		{id = "owo_pu_scope_empty_02", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_02", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac3", {
		{id = "owo_pu_scope_empty_03", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_03", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac4", {
		{id = "owo_pu_scope_empty_04", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_04", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac5", {
		{id = "owo_pu_scope_empty_05", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_05", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac6", {
		{id = "owo_pu_scope_empty_06", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_06", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sightac7", {
		{id = "owo_pu_scope_empty_07", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_helper_07", name = "PU Scope'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary", {
		{id = "owo_pu_scope_empty2", name = "Empty Scope", no_randomize = true},
		{id = "owo_pu_scope_riser_01", name = "PU Scope Riser", no_randomize = true},
	})
	--[[mod.inject_attachments_owo(variant_id, "sight_secondary_ac1", {
		{id = "owo_pu_scope_empty", name = "Empty Scope"},
		{id = "owo_pu_scope2_helper_01", name = "PU Scope Riser'vesa"},
	})
	mod.inject_attachments_owo(variant_id, "sight_secondary_ac2", {
		{id = "owo_pu_scope_empty", name = "Empty Scope"},
		{id = "owo_pu_scope2_helper_02", name = "PU Scope Riser'vesa"},
	})]]

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_pu_scope_01 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { lens = "scope_lens_02", lens_2 = "scope_lens_2_02",
				sightac1 = "owo_pu_scope_helper_01", sightac2 = "owo_pu_scope_helper_02",
				sightac3 = "owo_pu_scope_helper_03", sightac4 = "owo_pu_scope_helper_04",
				sightac5 = "owo_pu_scope_helper_05", sightac6 = "owo_pu_scope_helper_06",
				sightac7 = "owo_pu_scope_helper_07",
				sight_secondary = "owo_pu_scope_riser_01", sight_2 = "reflex_scopehelper_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}, 
				{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}, 
			},
		},
		owo_pu_scope_02 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = current_type, 
			mesh_move = false, parent = current_parent,
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
			mesh_move = false, parent = current_parent,
		},
		-- Crosshair
		owo_pu_scope_helper_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sightac2", 
			mesh_move = false, parent = current_type,
		},
		owo_pu_scope_helper_03 = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sightac3", 
			mesh_move = false, parent = current_type,
		},
		owo_pu_scope_helper_04 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "sightac4", 
			mesh_move = false, parent = current_type,
		},
		-- Knobs
		owo_pu_scope_helper_05 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "sightac5", 
			mesh_move = false, parent = current_type,
		},
		owo_pu_scope_helper_06 = {
			model = _item_melee.."/pommels/shovel_pommel_01", type = "sightac6", 
			mesh_move = false, parent = current_type,
		},
		-- Scope again
		owo_pu_scope_helper_07 = {
			model = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02", type = "sightac7", 
			mesh_move = false, parent = current_type,
		},
		-- Riser
		owo_pu_scope_riser_01 = {
			model = _item_melee.."/grips/falchion_grip_03", type = "sight_secondary", 
			mesh_move = false, parent = current_parent,
			--automatic_equip = { sight_secondary_ac1 = "owo_pu_scope2_helper_01", sight_secondary_ac2 = "owo_pu_scope2_helper_02",}
		},
		--[[ Too thick
		owo_pu_scope2_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "sight_secondary_ac1", 
			mesh_move = false, parent = current_type,
		},
		owo_pu_scope2_helper_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "sight_secondary_ac2", 
			mesh_move = false, parent = current_type,
		},]]
		-- ### Empty ###
		owo_pu_scope_empty_01 = {
			model = "", type = "sightac1", 
			mesh_move = false, parent = "receiver"
		},
		owo_pu_scope_empty_02 = {
			model = "", type = "sightac2", 
			mesh_move = false, parent = current_type
		},
		owo_pu_scope_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		owo_pu_scope_empty_03 = {
			model = "", type = "sightac3", 
			mesh_move = false, parent = current_type
		},
		owo_pu_scope_empty_04 = {
			model = "", type = "sightac4", 
			mesh_move = false, parent = current_type
		},
		owo_pu_scope_empty_05 = {
			model = "", type = "sightac5", 
			mesh_move = false, parent = current_type
		},
		owo_pu_scope_empty_06 = {
			model = "", type = "sightac6", 
			mesh_move = false, parent = current_type
		},
		owo_pu_scope_empty_07 = {
			model = "", type = "sightac7", 
			mesh_move = false, parent = current_type
		},
		owo_pu_scope_empty2 = {
			model = "", type = "sight_secondary", 
			mesh_move = false, parent = current_type
		},
	})
	
end

-- Sight_2: Invisible
function mod.owo_reticle_helper(variant_id)
	mod.inject_attachments_owo(variant_id, "sight_2", {
		{id = "owo_reticle_helper_invisible", name = "Invisible sight_2"},
	})
	mod.inject_models(variant_id, {
		owo_reticle_helper_invisible = {
			model = _item_ranged.."/handles/combat_blade_handle_04", type = "sight_2", 
			parent = "sight", hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}},
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
--	Alternative Viewmodel Fixes
function mod.fixes_owo_alt_viewmodel(variant_id)
	mod.mt.inject_fixes(variant_id, {
		-- ######
		-- Sight_2: Alt Viewmodels
		-- ######
		--  Doom
		{   dependencies =      { "owo_alt_viewmodel_01" },
			scope_offset =      { offset = true, position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0), },
			no_scope_offset =   { offset = true, position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0), },
		},
		{   dependencies =      { "owo_alt_viewmodel_02" },
			scope_offset =      { offset = true, position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
			no_scope_offset =   { offset = true, position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0), },
		},
		{   dependencies =      { "owo_alt_viewmodel_03" },
			scope_offset =      { offset = true, position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
			no_scope_offset =   { offset = true, position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0), },
		},
		-- CS:S
		{   dependencies =      { "owo_alt_viewmodel_04" },
			scope_offset =      { offset = true, position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
			no_scope_offset =   { offset = true, position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
		},
		-- Hipfire
		{   dependencies =      { "owo_alt_viewmodel_05" },
			scope_offset =      { offset = true, position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
			no_scope_offset =   { offset = true, position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0), },
		},
		-- Point Shooting
		{   dependencies =      { "owo_alt_viewmodel_06" },
			scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0), },
			no_scope_offset =   { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0), },
		},
	})
end

-- Magazine: Flat
--		Lasgun and Autogun mags
--		All done with scaling in the weapon classes
function mod.owo_magazine_flat(variant_id, given_type, given_parent)
	local current_type = given_type or "magazine"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_lasgun_magazine_flat_01", name = "OwO Flat Mag (Las) 1"},
		{id = "owo_autogun_magazine_flat_03", name = "OwO Flat Mag (Autogun) 3"},
	})

	mod.inject_models(variant_id, {
		owo_lasgun_magazine_flat_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = current_type, parent = current_parent, 
		},
		owo_autogun_magazine_flat_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = current_type, parent = current_parent, 
		},
	})
end

-- Magazine: Plasma
--		Intended for Helbore since mt added plasma mags to some already?
function mod.owo_plasma_mag(variant_id, given_type, given_parent)
	local current_type = given_type or "magazine"
	local current_parent = given_parent or "receiver"
	
	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_plasma_mag_01", name = "OwO Plasma Mag 1"},
		{id = "owo_plasma_mag_02", name = "OwO Plasma Mag 2"},
		{id = "owo_plasma_mag_03", name = "OwO Plasma Mag 3"},
		{id = "owo_plasma_mag_04", name = "OwO Plasma Mag 4"},
		{id = "owo_plasma_melta_mag_01", name = "OwO Melta Mag (Plasma 3)"},
		{id = "owo_plasma_mag_01ss", name = "OwO Plasma Mag 1 (SS)"},
		{id = "owo_plasma_mag_02ss", name = "OwO Plasma Mag 2 (SS)"},
		{id = "owo_plasma_mag_03ss", name = "OwO Plasma Mag 3 (SS)"},
		{id = "owo_plasma_mag_04ss", name = "OwO Plasma Mag 4 (SS)"},
		{id = "owo_plasma_melta_mag_01ss", name = "OwO Melta Mag (SS)"},
	})
	mod.inject_attachments_owo(variant_id, "magac", {
		{id = "owo_plasma_mag_helper_00", name = "Empty magac"},
		{id = "owo_plasma_mag_helper_01", name = "OwO Plasma Mag Helper 1", no_randomize = true},
		{id = "owo_plasma_mag_helper_02", name = "OwO Plasma Mag Helper 2", no_randomize = true},
		{id = "owo_plasma_mag_helper_03", name = "OwO Plasma Mag Helper 3", no_randomize = true},
		{id = "owo_plasma_mag_helper_04", name = "OwO Plasma Mag Helper 4", no_randomize = true},
		{id = "owo_plasma_melta_mag_helper_01", name = "OwO Melta Mag Helper (Plasma 3)", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_plasma_mag_01 = {
			model = _item_ranged.."/magazines/plasma_rifle_magazine_01", type = current_type, parent = current_parent, 
		},
		owo_plasma_mag_02 = {
			model = _item_ranged.."/magazines/plasma_rifle_magazine_02", type = current_type, parent = current_parent, 
		},
		owo_plasma_mag_03 = {
			model = _item_ranged.."/magazines/plasma_rifle_magazine_03", type = current_type, parent = current_parent, 
		},
		owo_plasma_mag_04 = {
			model = _item_ranged.."/magazines/plasma_rifle_magazine_04", type = current_type, parent = current_parent, 
		},
		owo_plasma_melta_mag_01 = {
			model = _item_ranged.."/magazines/melta_gun_magazine_01", type = current_type, parent = current_parent, 
		},
		owo_plasma_mag_01ss = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = current_type, parent = current_parent, 
			automatic_equip = { magac = "owo_plasma_mag_helper_01", },
		},
		owo_plasma_mag_02ss = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = current_type, parent = current_parent, 
			automatic_equip = { magac = "owo_plasma_mag_helper_02", },
		},
		owo_plasma_mag_03ss = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = current_type, parent = current_parent, 
			automatic_equip = { magac = "owo_plasma_mag_helper_03", },
		},
		owo_plasma_mag_04ss = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = current_type, parent = current_parent, 
			automatic_equip = { magac = "owo_plasma_mag_helper_04", },
		},
		owo_plasma_melta_mag_01ss = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = current_type, parent = current_parent, 
			automatic_equip = { magac = "owo_plasma_melta_mag_helper_01", },
		},
		-- ### Helper Parts ###
		owo_plasma_mag_helper_00 = {
			model = "", type = "magac", parent = current_type, 
		},
		owo_plasma_mag_helper_01 = {
			model = _item_ranged.."/magazines/plasma_rifle_magazine_01", type = "magac", parent = current_type, 
		},
		owo_plasma_mag_helper_02 = {
			model = _item_ranged.."/magazines/plasma_rifle_magazine_02", type = "magac", parent = current_type, 
		},
		owo_plasma_mag_helper_03 = {
			model = _item_ranged.."/magazines/plasma_rifle_magazine_03", type = "magac", parent = current_type, 
		},
		owo_plasma_mag_helper_04 = {
			model = _item_ranged.."/magazines/plasma_rifle_magazine_04", type = "magac", parent = current_type, 
		},
		owo_plasma_melta_mag_helper_01 = {
			model = _item_ranged.."/magazines/melta_gun_magazine_01", type = "magac", parent = current_type, 
		},
	})
end

-- Magazine: Rear Lasgun 
--		For Straight Grip and Recon Stock
-- 		I stole this from Syn
function mod.owo_lasgun_magazine_rear(variant_id, given_type, given_parent)
	local current_type = given_type or "magazine"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_lasgun_magazine_rear_01", name = "OwO Rear Mag 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "rearmag", {
		{id = "owo_lasgun_magazine_rear_child_empty", name = "Empty Rearmag", no_randomize = true},
		{id = "owo_lasgun_magazine_rear_child_01", name = "OwO RearMagChild 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_lasgun_magazine_rear_01 = {
			model = _item_ranged.."/magazines/lasgun_pistol_magazine_01", type = current_type, parent = current_parent, 
			automatic_equip = {
				rearmag = "owo_lasgun_magazine_rear_child_01"
			}
		},
		-- ### Helper Parts ###
		owo_lasgun_magazine_rear_child_01 = {
			model = _item_ranged.."/magazines/lasgun_rifle_magazine_01", type = "rearmag", mesh_move = false, parent = current_parent,
		},
		-- ### Empty ###
		owo_lasgun_magazine_rear_child_empty = {
			model = "", type = "rearmag", mesh_move = false, parent = current_parent,
		},
	})
end

-- Magazine: Jungle Mags
--		Autoguns
function mod.owo_jungle_mag(variant_id, given_type, given_parent)
	local current_type = given_type or "magazine"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
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
	mod.inject_attachments_owo(variant_id, "owo_magac1", {
		{id = "owo_jungle_mag_empty_01", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_helper_01", name = "OwO Jungle Mag'vesa 1", no_randomize = true},
		{id = "owo_jungle_mag_helper_02", name = "OwO Jungle Mag'vesa 2", no_randomize = true},
		{id = "owo_jungle_mag_helper_03", name = "OwO Jungle Mag'vesa 3", no_randomize = true},
		{id = "owo_jungle_mag_helper_04", name = "OwO Jungle Mag'vesa 4", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac2", {
		{id = "owo_jungle_mag_empty_02", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_f_01", name = "OwO Jungle Connector f 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac3", {
		{id = "owo_jungle_mag_empty_03", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_b_01", name = "OwO Jungle Connector b 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac4", {
		{id = "owo_jungle_mag_empty_04", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_l_01", name = "OwO Jungle Connector l 1", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac5", {
		{id = "owo_jungle_mag_empty_05", name = "OwO Jungle Mag Empty", no_randomize = true},
		{id = "owo_jungle_mag_connector_r_01", name = "OwO Jungle Connector r 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- Main magazine, v^ second mag on the left
		owo_jungle_mag_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_01", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			},
		},
		owo_jungle_mag_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_02", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_03", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_04", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- mirrored mags, ^v second mag on the right
		owo_jungle_mag_01_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_01", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_02_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_02", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_03", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_04", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- ^^ second mag on the right
		owo_jungle_mag_01_up = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_01", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			},
		},
		owo_jungle_mag_02_up = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_02", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03_up = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_03", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04_up = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_04", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- mirrored mags, ^^ second mag on the right
		owo_jungle_mag_01_up_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_01", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_02_up_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_02", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_03_up_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_03", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		owo_jungle_mag_04_up_flip = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = { owo_magac1 = "owo_jungle_mag_helper_04", owo_magac2 = "owo_jungle_mag_connector_f_01", 
				owo_magac3 = "owo_jungle_mag_connector_b_01", owo_magac4 = "owo_jungle_mag_connector_l_01", owo_magac5 = "owo_jungle_mag_connector_r_01",
			}
		},
		-- ### Helper Parts ###
		-- Backup magazine
		owo_jungle_mag_helper_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = "owo_magac1", 
			mesh_move = false, parent = current_parent
		},
		owo_jungle_mag_helper_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = "owo_magac1", 
			mesh_move = false, parent = current_parent
		},
		owo_jungle_mag_helper_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = "owo_magac1", 
			mesh_move = false, parent = current_parent
		},
		owo_jungle_mag_helper_04 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = "owo_magac1", 
			mesh_move = false, parent = current_parent
		},
		-- "tape"
		owo_jungle_mag_connector_f_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owo_magac2", 
			mesh_move = false, parent = current_type
		},
		owo_jungle_mag_connector_b_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owo_magac3", 
			mesh_move = false, parent = current_type
		},
		owo_jungle_mag_connector_l_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owo_magac4", 
			mesh_move = false, parent = current_type
		},
		owo_jungle_mag_connector_r_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "owo_magac5", 
			mesh_move = false, parent = current_type
		},
		-- ### Empty ### 
		owo_jungle_mag_empty_01 = {
			model = "", type = "owo_magac1", 
			mesh_move = false, parent = current_parent
		},
		owo_jungle_mag_empty_02 = {
			model = "", type = "owo_magac2", 
			mesh_move = false, parent = current_parent
		},
		owo_jungle_mag_empty_03 = {
			model = "", type = "owo_magac3", 
			mesh_move = false, parent = current_parent
		},
		owo_jungle_mag_empty_04 = {
			model = "", type = "owo_magac4", 
			mesh_move = false, parent = current_parent
		},
		owo_jungle_mag_empty_05 = {
			model = "", type = "owo_magac5", 
			mesh_move = false, parent = current_parent
		},
	})
end

-- Magazine: Mag Assists
--	Magpul magazine assists/pulls
function mod.owo_magazine_magpull(variant_id, given_type, given_parent)
	local current_type = given_type or "magazine"
	local current_parent = given_type or "receiver"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_magazine_magpull_01", name = "OwO Magpul 1"},
		{id = "owo_magazine_magpull_02", name = "OwO Magpul 2"},
		{id = "owo_magazine_magpull_03", name = "OwO Magpul 3"},
		{id = "owo_magazine_magpull_04", name = "OwO Magpul 4"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac1", {
		{id = "owo_magazine_magpull_helper_01_empty", name = "Empty Magac1"},
		{id = "owo_magazine_magpull_helper_01", name = "OwO Autogun Magpul'vesa 1"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac2", {
		{id = "owo_magazine_magpull_helper_02_empty", name = "Empty Magac2"},
		{id = "owo_magazine_magpull_helper_02", name = "OwO Autogun Magpul'vesa 2"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac3", {
		{id = "owo_magazine_magpull_helper_03_empty", name = "Empty Magac3"},
		{id = "owo_magazine_magpull_helper_03", name = "OwO Autogun Magpul'vesa 3"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_magazine_magpull_01 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_01", type = current_type, parent = current_parent, 
			automatic_equip = { owo_magac1 = "owo_magazine_magpull_helper_01", owo_magac2 = "owo_magazine_magpull_helper_02", 
				owo_magac3 = "owo_magazine_magpull_helper_03",
			},
		},
		owo_magazine_magpull_02 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_02", type = current_type, parent = current_parent, 
			automatic_equip = { owo_magac1 = "owo_magazine_magpull_helper_01", owo_magac2 = "owo_magazine_magpull_helper_02", 
				owo_magac3 = "owo_magazine_magpull_helper_03",
			},
		},
		owo_magazine_magpull_03 = {
			model = _item_ranged.."/magazines/autogun_rifle_magazine_03", type = current_type, parent = current_parent, 
			automatic_equip = { owo_magac1 = "owo_magazine_magpull_helper_01", owo_magac2 = "owo_magazine_magpull_helper_02", 
				owo_magac3 = "owo_magazine_magpull_helper_03",
			},
		},
		owo_magazine_magpull_04 = {
			model = _item_ranged.."/magazines/autogun_rifle_ak_magazine_01", type = current_type, parent = current_parent, 
			automatic_equip = { owo_magac1 = "owo_magazine_magpull_helper_01", owo_magac2 = "owo_magazine_magpull_helper_02", 
				owo_magac3 = "owo_magazine_magpull_helper_03",
			},
		},
		-- ### Helpers ###
		owo_magazine_magpull_helper_01 = {
			model = _item_melee.."/grips/chain_sword_grip_06", type = "owo_magac1", parent = current_type, 
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
			model = "", type = "owo_magac1", parent = current_type, 
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
--	Oh fuck the bullets don't move if I only move the mag
--[[
function mod.owo_magazine_ak(variant_id, given_type)
	mod.inject_attachments_owo(variant_id, "magazine", {
		{id = "owo_magazine_ak_01", name = "OwO AK Mag"},
		{id = "owo_magazine_ak_02", name = "OwO AK Mag Curvy"},
		{id = "owo_magazine_ak_03", name = "OwO AK Mag Curvy (Extended)"},
	})
	mod.inject_attachments_owo(variant_id, "owo_magac1", {
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

function mod.owo_<NAME>(variant_id, given_type, given_parent)
	local current_type = given_type or "magazine"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, "", {
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

-- ############################################
-- Define Variables for Fixes
-- ############################################

-- ########
-- For This Variant Only
-- ########

-- ############################################
-- Inject Fixes
-- ############################################
-- #################
-- HIDING HELPERS
-- By putting it up here, it ends up at the bottom of the list, so they will only be hidden if the fixes from above are not found
-- Because they match the main parts first, if there is no match it means the main part is not attached
-- #################
mod.mt.inject_fixes(this_variant, {
    
})

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################

-- #################
-- Custom Fixes
-- #################

]]
