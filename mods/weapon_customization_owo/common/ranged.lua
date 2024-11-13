local mod = get_mod("weapon_customization_owo")

-- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

-- TABLE
mod.wc.add_custom_attachments.muzzle2 = "muzzle2List"
mod.wc.muzzle2List = {
	"owo_suppressor_helper_empty",
	"owo_suppressor_helper_01",
	"owo_suppressor_helper_02"
}

mod.wc.add_custom_attachments.barrelac = "barrelacList"
mod.wc.barrelacList = {
	"owo_revolver_shotgun_barrel_01",
	"owo_revolver_shotgun_barrel_04",
	"owo_revolver_shotgun_barrel_05",
	"owo_revolver_shotgun_barrel_06",
	"owo_revolver_shotgun_barrel_08",	
	"owo_revolver_shotgun_barrel_09"
}

mod.wc.add_custom_attachments.barrelshroud = "barrelshroudList"
mod.wc.barrelshroudList = {
	"owo_dreg_shroud_01"
}

--[[mod.wc.add_custom_attachments.barrelshroudac = "barrelshroudacList"
mod.wc.barrelshroudacList = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroudac_01"
}]]

mod.wc.add_custom_attachments.barrelshroudac2 = "barrelshroudac2List"
mod.wc.barrelshroudac2List = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroudac2_01"
}

mod.wc.add_custom_attachments.barrelshroudac3 = "barrelshroudac3List"
mod.wc.barrelshroudac3List = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroudac3_01"
}

mod.wc.add_custom_attachments.barrelshroudac3 = "barrelshroudac4List"
mod.wc.barrelshroudac4List = {
	"owo_dreg_shroud_empty",
	"owo_dreg_shroudac4_01"
}

mod.wc.add_custom_attachments.bayonet2 = "bayonet2List"
mod.wc.bayonet2List = {
	"owo_dreg_bayonet_empty",
	"owo_dreg_bayonet_rear_01"
}

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
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

-- Magazine: Lasgun Flat
function mod.owo_lasgun_magazine_flat(variant_id, type)
	mod.inject_attachments_owo(variant_id, "magazine" or type, {
		{id = "owo_lasgun_magazine_flat", name = "OwO Flat Magazine 1"},
	})

	mod.inject_models(variant_id, {
		owo_lasgun_magazine_flat = {
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

-- Muzzle: Suppressor
-- helper suppressors not working
function mod.owo_suppressor(variant_id, type)
	mod.inject_attachments_owo(variant_id, "muzzle" or type, {
		{id = "owo_suppressor_01", name = "OwO Suppressor 1"},
		{id = "owo_suppressor_02", name = "OwO Suppressor 2"}
	})
	mod.inject_attachments_owo(variant_id, "muzzle2" or type, {
		{id = "owo_suppressor_helper_empty", name = "OwO Suppressor'vesa Empty"},
		{id = "owo_suppressor_helper_01", name = "OwO Suppressor'vesa 1"},
		{id = "owo_suppressor_helper_02", name = "OwO Suppressor'vesa 2"}
	})

	mod.inject_models(variant_id, {
		owo_suppressor_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle2 = owo_suppressor_helper_01
			}
		},
		owo_suppressor_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle2 = owo_suppressor_helper_02
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

-- Barrel: Shotgun barrel short
--		Bolt pistol
function mod.owo_bistol_shotgun_barrel_short(variant_id, type)
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		{id = "owo_bistol_shotgun_barrel_short_01", name = "OwO Shotgun Shorty 1"},
		{id = "owo_bistol_shotgun_barrel_short_04", name = "OwO Shotgun Shorty 2"},
		{id = "owo_bistol_shotgun_barrel_short_05", name = "OwO Shotgun Shorty 3"},
		{id = "owo_bistol_shotgun_barrel_short_06", name = "OwO Shotgun Shorty 4"},
		{id = "owo_bistol_shotgun_barrel_short_08", name = "OwO Shotgun Shorty 5"},
		{id = "owo_bistol_shotgun_barrel_short_09", name = "OwO Shotgun Shorty 6"},
	})

	mod.inject_models(variant_id, {
		owo_bistol_shotgun_barrel_short_01 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_01", type = "barrel", parent = "receiver"
		},
		owo_bistol_shotgun_barrel_short_04 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_04", type = "barrel", parent = "receiver"
		},
		owo_bistol_shotgun_barrel_short_05 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_05", type = "barrel", parent = "receiver"
		},
		owo_bistol_shotgun_barrel_short_06 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_06", type = "barrel", parent = "receiver"
		},
		owo_bistol_shotgun_barrel_short_08 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_08", type = "barrel", parent = "receiver"
		},
		owo_bistol_shotgun_barrel_short_09 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_09", type = "barrel", parent = "receiver"
		}
	})
end

-- Barrel: Shotgun barrel extension
--		Revolver
function mod.owo_revolver_shotgun_barrel(variant_id)
	mod.inject_attachments_owo(variant_id, "barrelex" or type, {
		{id = "owo_revolver_shotgun_barrel_01", name = "OwO Shotgun Barrel 1"},
		{id = "owo_revolver_shotgun_barrel_04", name = "OwO Shotgun Barrel 2"},
		{id = "owo_revolver_shotgun_barrel_05", name = "OwO Shotgun Barrel 3"},
		{id = "owo_revolver_shotgun_barrel_06", name = "OwO Shotgun Barrel 4"},
		{id = "owo_revolver_shotgun_barrel_08", name = "OwO Shotgun Barrel 5"},
		{id = "owo_revolver_shotgun_barrel_09", name = "OwO Shotgun Barrel 6"},
	})

	-- parent receiver nor barrel matters
	mod.inject_models(variant_id, {
		owo_revolver_shotgun_barrel_01 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_01", type = "barrelex", parent = "receiver"
		},
		owo_revolver_shotgun_barrel_04 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_04", type = "barrelex", parent = "receiver"
		},
		owo_revolver_shotgun_barrel_05 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_05", type = "barrelex", parent = "receiver"
		},
		owo_revolver_shotgun_barrel_06 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_06", type = "barrelex", parent = "receiver"
		},
		owo_revolver_shotgun_barrel_08 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_08", type = "barrelex", parent = "receiver"
		},
		owo_revolver_shotgun_barrel_09 = {
			model = _item_ranged.."/barrels/shotgun_rifle_barrel_09", type = "barrelex", parent = "receiver"
		}
	})
end

-- Barrel: Dreg Gunner barrel
--		Brauto
function mod.owo_dreg_gunner_barrel(variant_id, type)
	mod.inject_attachments_owo(variant_id, "barrel" or type, {
		{id = "owo_dreg_barrel_01", name = "OwO Dreg Gunner Barrel"},

	})
	mod.inject_attachments_owo(variant_id, "barrelshroud", {
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

-- Bayonet: Dreg Gunner bayonet
--		Brauto
function mod.owo_dreg_gunner_bayonet(variant_id, type)
	mod.inject_attachments_owo(variant_id, "bayonet" or type, {
		{id = "owo_dreg_bayonet_empty", name = "OwO Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_bayonet_01", name = "OwO Dreg Gunner bayonet"},

	})
	mod.inject_attachments_owo(variant_id, "bayonet2", {
		{id = "owo_dreg_bayonet_empty", name = "OwO Dreg Shroud Empty", no_randomize = true},
		{id = "owo_dreg_bayonet_rear_01", name = "OwO Dreg Shroud", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		owo_dreg_bayonet_01 = {
			model = _item_melee.."/blades/combat_blade_blade_03", type = "bayonet", 
			mesh_move = false, parent = 'barrel', 
			automatic_equip = {
				bayonet2 = "owo_dreg_bayonet_rear_01"
			}
		},
		owo_dreg_bayonet_empty = {
			model = "", type = "bayonet2", 
			mesh_move = false, parent = 'barrel'
		},
		owo_dreg_bayonet_rear_01 = {
			model = _item_melee.."/blades/combat_blade_blade_05", type = "bayonet2", 
			mesh_move = false, parent = 'barrel'
		}
	})
end