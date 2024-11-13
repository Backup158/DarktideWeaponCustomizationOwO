local mod = get_mod("weapon_customization_owo")

-- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

-- TABLE
mod.wc.add_custom_attachments.barrelac = "barrelac"
mod.wc.barrelshrouds = {
	"owo_dreg_shroud_01"
}
mod.wc.barrelshroudacs = {
	"owo_revolver_shotgun_barrel_01",
	"owo_revolver_shotgun_barrel_04",
	"owo_revolver_shotgun_barrel_05",
	"owo_revolver_shotgun_barrel_06",
	"owo_revolver_shotgun_barrel_08",	
	"owo_revolver_shotgun_barrel_09"
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
		{id = "owo_gripstock_grip_01a",            name = "OwO StraightGrip stockac", no_randomize = true},
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
	mod.inject_attachments_owo(variant_id, "muzzle_2" or type, {
		{id = "owo_suppressor_helper_01", name = "OwO Suppressor vesa 1"},
		{id = "owo_suppressor_helper_02", name = "OwO Suppressor vesa 2"}
	})

	mod.inject_models(variant_id, {
		owo_suppressor_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = owo_suppressor_helper_01
			}
		},
		owo_suppressor_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle", mesh_move = false, parent = "barrel",
			automatic_equip = {
				muzzle_2 = owo_suppressor_helper_02
			}
		},
		owo_suppressor_helper_01 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03", type = "muzzle_2", mesh_move = false, parent = "barrel"
		},
		owo_suppressor_helper_02 = {
			model = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_05", type = "muzzle_2", mesh_move = false, parent = "barrel"
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
		{id = "owo_dreg_barrel_01", name = "OwO Dreg Gunner Barrel 1"},

	})
	mod.inject_attachments_owo(variant_id, "barrelshroud", {
		{id = "owo_dreg_shroud_01",      name = "OwO Dreg Shroud", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "barrelshroudac", {
		{id = "owo_dreg_shroudac_empty",      name = "Dreg Shroud Ac Empty", no_randomize = true},
		{id = "owo_dreg_shroudac_02",      name = "OwO Dreg Shroud Ac", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- thanks syn for the exitus barrel
		owo_dreg_barrel_01 = {
			model = _item_ranged.."/barrels/stubgun_ogryn_barrel_02", type = "barrel", 
			mesh_move = false, parent = 'receiver', 
			automatic_equip = {
				barrelshroud= "owo_dreg_shroud_01", 
				barrelshroudac= "owo_dreg_shroud_02", 
			}
		},
		owo_dreg_shroud_01 = {
			model = _item_ranged.."/barrels/stubgun_ogryn_barrel_01", type = "barrelshroud", 
			mesh_move = false, parent = 'receiver'
		},
		owo_dreg_shroudac_02 = {
			model = _item_ranged.."/barrels/lasgun_rifle_barrel_01", 
			type = "barrelshroudac", mesh_move = false, parent = 'barrel'
		},
		owo_dreg_shroudac_empty = {
			model = "",
			type = "barrelshroudac", mesh_move = false, parent = 'receiver'
		},
	})
end