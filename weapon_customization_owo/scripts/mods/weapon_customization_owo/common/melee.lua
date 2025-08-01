local mod = get_mod("weapon_customization_owo")

-- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

-- #############################
-- Slot Additions
-- #############################
-- HEAD/BLADE
if mod.syn then
	mod.mt.table_append(mod.wc.bladeshrouds, {
		"owo_bladeshroud_default",
		"owo_tacax_spike_helper_01",
		"owo_polearm_head_helper_0_00",
		"owo_polearm_head_helper_0_01",
		"owo_historical_blade_helper_gerber",
	})
	mod.mt.table_append(mod.wc.bladeshroudacs, {
		"owo_bladeshroudac_default",
		"owo_polearm_head_helper_1_01",
	})
	mod.mt.table_append(mod.wc.bladeshroudac2s, {
		"owo_bladeshroudac2_default",
		"owo_polearm_head_helper_2_01",
	})
	mod.mt.table_append(mod.wc.bladeshroudac3s, {
		"owo_bladeshroudac3_default",
		"owo_polearm_head_helper_3_01",
	})
else 
	mod.wc.add_custom_attachments.bladeshroud = "bladeshrouds"
	mod.wc.bladeshrouds = {
		"owo_bladeshroud_default",
		"owo_tacax_spike_helper_01",
		"owo_polearm_head_helper_0_00",
		"owo_polearm_head_helper_0_01",
		"owo_historical_blade_helper_gerber",
	}
	mod.wc.add_custom_attachments.bladeshroudac = "bladeshroudacs"
	mod.wc.bladeshroudacs = {
		"owo_bladeshroudac_default",
		"owo_polearm_head_helper_1_01",
	}
	mod.wc.add_custom_attachments.bladeshroudac2 = "bladeshroudac2s"
	mod.wc.bladeshroudac2s = {
		"owo_bladeshroudac2_default",
		"owo_polearm_head_helper_2_01",
	}
	mod.wc.add_custom_attachments.bladeshroudac3 = "bladeshroudac3s"
	mod.wc.bladeshroudac3s = {
		"owo_bladeshroudac3_default",
		"owo_polearm_head_helper_3_01",
	}
end
-- CROSSGUARD (HILT)
-- Can't add hilt slot to grip weapons. Don't know exactly why but I can't be assed to find out so eat shit >:3
mod.wc.add_custom_attachments.crossguard = "crossguard_list"
mod.wc.crossguard_list = {
	"owo_crossguard_default",
	"owo_crossguard_plate_01",
}
mod.create_custom_slot("crossguard", 
	{
		en = "Crossguard",
	}
)

-- GRIP
--	Grip Shroud
--table.insert(mod.wc.attachment_slots, "gripshroud")
--mod:add_global_localize_strings({
--    loc_weapon_cosmetics_customization_gripshroud = {
--        en = "Grip Shroud",
--	},
--})
--mod.wc.add_custom_attachments.gripshroud = "gripshroud_list"
--mod.wc.gripshroud_list = {
--	
--}

-- SHAFT
mod.wc.add_custom_attachments.shaftac1 = "shaftac1_list"
mod.wc.shaftac1_list = {
	"owo_shaftac1_default",
	"owo_shaft_low_grip_helper_01",
	"owo_shaft_low_grip_helper_02",
	"owo_shaft_low_grip_helper_03",
	"owo_shaft_low_grip_helper_04",
	"owo_shaft_low_grip_helper_05",
	"owo_shaft_low_grip_helper_06",
}
-- POMMEL
mod.wc.add_custom_attachments.pommelac1 = "pommelac1_list"
mod.wc.pommelac1_list = {
	"owo_pommelac1_empty",
    "owo_shovel_handles_ac1_01",
    "owo_shovel_handles_ac1_02",
    --"owo_shovel_handles_ac1_03",
    "owo_shovel_handles_ac1_04",
    "owo_shovel_handles_ac1_05",
}
mod.wc.add_custom_attachments.pommelac2 = "pommelac2_list"
mod.wc.pommelac2_list = {
	"owo_pommelac2_empty",
    "owo_shovel_handles_ac2_01",
    "owo_shovel_handles_ac2_02",
    "owo_shovel_handles_ac2_03",
}
-- FRONTGUARD
mod.wc.add_custom_attachments.frontguard = "frontguard_list"
mod.wc.frontguard_list = {
	"owo_frontguard_default",
	"owo_trench_dagger_finger_guard_01",
	"owo_trench_dagger_finger_guard_02",
	"owo_trench_dagger_finger_guard_03",
	"owo_trench_dagger_finger_guard_04",
	"owo_trench_dagger_finger_guard_05",
	"owo_trench_dagger_finger_guard_06",
}
mod.create_custom_slot("frontguard", {
	en = "Front Guard",
})
mod.wc.add_custom_attachments.frontguardac1 = "frontguardac1_list"
mod.wc.frontguardac1_list = {
	"owo_frontguardac1_default",
	"owo_trench_dagger_finger_guard_helper_ac1",
}
mod.wc.add_custom_attachments.frontguardac2 = "frontguardac2_list"
mod.wc.frontguardac2_list = {
	"owo_frontguardac2_default",
	"owo_trench_dagger_finger_guard_helper_ac2",
}
mod.wc.add_custom_attachments.frontguardac3 = "frontguardac3_list"
mod.wc.frontguardac3_list = {
	"owo_frontguardac3_default",
	"owo_trench_dagger_finger_guard_helper_ac3",
}

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
-- Head: Tacax Spike (Spiked Tactical Axe)
function mod.owo_tacax_spike(variant_id, given_type, given_parent)
	local current_type = given_type or "head"
	local current_parent = given_parent or "grip"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_tacax_spike_01", name = "OwO Spiked Tactical Axe 1"},
		{id = "owo_tacax_spike_02", name = "OwO Spiked Tactical Axe 2"},
		{id = "owo_tacax_spike_03", name = "OwO Spiked Tactical Axe 3"},
		{id = "owo_tacax_spike_04", name = "OwO Spiked Tactical Axe 4"},
		{id = "owo_tacax_spike_05", name = "OwO Spiked Tactical Axe 5"},
		{id = "owo_tacax_spike_06", name = "OwO Spiked Tactical Axe 6"},
		{id = "owo_tacax_spike_07", name = "OwO Spiked Tactical Axe M"},
	})
    mod.inject_attachments_owo(variant_id, "bladeshroud" or type, {
        {id = "owo_tacax_spike_helper_01", name = "OwO Tacax'vesa 1", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_tacax_spike_01 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_tacax_spike_helper_01",
			},
		},
		owo_tacax_spike_02 = {
			model = _item_melee.."/heads/hatchet_head_02", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_tacax_spike_helper_01",
			},
		},
		owo_tacax_spike_03 = {
			model = _item_melee.."/heads/hatchet_head_03", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_tacax_spike_helper_01",
			},
		},
		owo_tacax_spike_04 = {
			model = _item_melee.."/heads/hatchet_head_04", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_tacax_spike_helper_01",
			},
		},
		owo_tacax_spike_05 = {
			model = _item_melee.."/heads/hatchet_head_05", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_tacax_spike_helper_01",
			},
		},
		owo_tacax_spike_06 = {
			model = _item_melee.."/heads/hatchet_head_06", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_tacax_spike_helper_01",
			},
		},
		owo_tacax_spike_07 = {
			model = _item_melee.."/heads/hatchet_head_ml01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_tacax_spike_helper_01",
			},
		},
		-- ### Helper Parts ###
		owo_tacax_spike_helper_01 = {
			model = _item_melee.."/heads/axe_head_03", type = "bladeshroud", 
			mesh_move = false, parent = current_type,
		},
	})
end
function mod.fixes_owo_tacax_spike(variant_id, given_type, given_parent)
	local _owo_all_tacax_spike_heads = "owo_tacax_spike_01|owo_tacax_spike_02|owo_tacax_spike_03|owo_tacax_spike_04|owo_tacax_spike_05|owo_tacax_spike_06|owo_tacax_spike_07"

	local _mt_falchion_grips = "falchion_mt_grip_01|falchion_mt_grip_02|falchion_mt_grip_03|falchion_mt_grip_04|falchion_mt_grip_05"
	local _mt_sabre_grips = "sabre_mt_grip_01|sabre_mt_grip_02|sabre_mt_grip_03|sabre_mt_grip_04|sabre_mt_grip_05"
	local _mt_dclaw_grips = "combat_sword_mt_grip_01|combat_sword_mt_grip_02|combat_sword_mt_grip_03|combat_sword_mt_grip_04|combat_sword_mt_grip_05|combat_sword_mt_grip_06"
	--local _mt_combat_axe_grips = "axe_mt_grip_01|axe_mt_grip_02|axe_mt_grip_03|axe_mt_grip_04|axe_mt_grip_05|axe_mt_grip_06"
	--local _mt_tactical_axe_grips = "hatchet_mt_grip_01|hatchet_mt_grip_02|hatchet_mt_grip_03|hatchet_mt_grip_04|hatchet_mt_grip_05|hatchet_mt_grip_06"
	local _mt_eviscerator_grips = "2h_chain_sword_mt_grip_01|2h_chain_sword_mt_grip_02|2h_chain_sword_mt_grip_03|2h_chain_sword_mt_grip_04"
	local _mt_chain_sword_grips = "chain_sword_mt_grip_01|chain_sword_mt_grip_02|chain_sword_mt_grip_03|chain_sword_mt_grip_04|chain_sword_mt_grip_05|chain_sword_mt_grip_06|chain_sword_mt_grip_07|chain_sword_mt_grip_08"
	local _mt_ogryn_grips = "ogrynbladehandle_01|ogrynbladehandle_02|ogrynbladehandle_03|ogrynbladehandle_04|ogrynbladehandle_05|ogrynbladehandle_06"

	local current_type = given_type or "head"
	local current_parent = given_parent or "grip"

	mod.mt.inject_fixes(variant_id, {
		-- ######
		-- Head: TACAX SPIKE
		-- ######
		-- By not giving a head fix, it takes the default position
		--  Default Cases
		--      Chain axe, combat axe, tactical axe, mt shovel grips
		{	dependencies =  { "owo_tacax_spike_01|owo_tacax_spike_06" },
			bladeshroud =   { offset = true, position = vector3_box(0, 0, 0.208), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
		},
		{	dependencies =  { "owo_tacax_spike_02|owo_tacax_spike_07" },
			--bladeshroud =   { offset = false, parent = current_type, parent_node = 12, position = vector3_box(0, 0, 0.244), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
			bladeshroud =   { offset = true, position = vector3_box(0, 0, 0.244), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
		},
		{	dependencies =  { "owo_tacax_spike_03" },
			--bladeshroud =   { offset = false, parent = current_type, parent_node = 12, position = vector3_box(0, 0, 0.214), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
			--bladeshroud =   { offset = false, parent = current_parent, position = vector3_box(0, 0, 0.214), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
			bladeshroud =   { offset = true, position = vector3_box(0, 0, 0.214), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
		},
		{	dependencies =  { "owo_tacax_spike_04" },
			bladeshroud =   { offset = true, position = vector3_box(0, 0, 0.17), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.808, 0.382 ) },
		},
		{	dependencies =  { "owo_tacax_spike_05" },
			bladeshroud =   { offset = true, position = vector3_box(0, 0, 0.192), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.808, 0.262 ) },
		},
		
	})
end

-- Head: Polearms
function mod.owo_polearm_head(variant_id, given_type, given_parent)
	local current_type = given_type or "head"
	local current_parent = given_parent or "grip"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_polearm_head_bc_01", name = "OwO Bec de Corbin 1"},
		{id = "owo_polearm_head_bc_02", name = "OwO Bec de Corbin 2"},
		{id = "owo_polearm_head_bc_03", name = "OwO Bec de Corbin 3"},
		{id = "owo_polearm_head_bc_04", name = "OwO Bec de Corbin 4"},
		{id = "owo_polearm_head_bc_01b", name = "OwO CAW CAW MOTHERF-"},
		{id = "owo_polearm_head_bc_02b", name = "OwO CAW CAW MOTHERFF-"},
		{id = "owo_polearm_head_bc_03b", name = "OwO CAW CAW MOTHERFFF-"},
		{id = "owo_polearm_head_bc_04b", name = "OwO CAW CAW MOTHERFFFF-"},
		{id = "owo_polearm_head_l_01", name = "OwO Lucerne 1"},
		{id = "owo_polearm_head_l_02", name = "OwO Lucerne 2"},
		{id = "owo_polearm_head_l_03", name = "OwO Lucerne 3"},
		-- fuck renaming
		{id = "owo_polearm_head_p_04", name = "OwO Pollax/Poleaxe 1"},
		{id = "owo_polearm_head_p_05", name = "OwO Pollax/Poleaxe 2"},
		{id = "owo_polearm_head_p_06", name = "OwO Pollax/Poleaxe 3"},
		{id = "owo_polearm_head_p_07", name = "OwO Pollax/Poleaxe 4"},
		{id = "owo_polearm_head_p_08", name = "OwO Pollax/Poleaxe 5"},
		{id = "owo_polearm_head_p_09", name = "OwO Pollax/Poleaxe 6"},
		{id = "owo_polearm_head_p_01", name = "OwO Pollax/Poleaxe 7"},
		{id = "owo_polearm_head_p_02", name = "OwO Pollax/Poleaxe 8"},
		{id = "owo_polearm_head_p_03", name = "OwO Pollax/Poleaxe 9"},
	})
    mod.inject_attachments_owo(variant_id, "bladeshroud", {
        {id = "owo_polearm_head_helper_0_01", name = "OwO Polearm'vesa 0 shaft", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bladeshroudac", {
        {id = "owo_polearm_head_helper_1_01", name = "OwO Polearm'vesa ac1 bc hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_02", name = "OwO Polearm'vesa ac1 bc hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_03", name = "OwO Polearm'vesa ac1 bc hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_04", name = "OwO Polearm'vesa ac1 bc hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_l_01", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_l_02", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_01", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_02", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_03", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_04", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_05", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_06", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_07", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_08", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_1_p_09", name = "OwO Polearm'vesa ac1 hammer", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bladeshroudac2", {
        {id = "owo_polearm_head_helper_2_01", name = "OwO Polearm'vesa ac2 spike", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bladeshroudac3", {
        {id = "owo_polearm_head_helper_3_01", name = "OwO Polearm'vesa ac3 pick", no_randomize = true},
		{id = "owo_polearm_head_helper_3_02", name = "OwO Polearm'vesa ac3 pick hammer", no_randomize = true},
		{id = "owo_polearm_head_helper_3_03", name = "OwO Polearm'vesa ac3 pick crow", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "bladeshroudac4", {
		{id = "owo_polearm_head_helper_4_03", name = "OwO Polearm'vesa ac3 pick crow", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- Making the base part invisible so I can parent to it and move it easily for patching
		owo_polearm_head_bc_01 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_01",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_bc_02 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_02",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_bc_03 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_03",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_bc_04 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_04",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_bc_01b = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_01",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_03",
				bladeshroudac4 = "owo_polearm_head_helper_4_03",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_bc_02b = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_02",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_03",
				bladeshroudac4 = "owo_polearm_head_helper_4_03",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_bc_03b = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_03",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_03",
				bladeshroudac4 = "owo_polearm_head_helper_4_03",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_bc_04b = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_04",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_03",
				bladeshroudac4 = "owo_polearm_head_helper_4_03",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- Lucerne
		owo_polearm_head_l_01 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_l_01",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_l_02 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_l_02",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_l_03 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_03",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_01",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- Pollax
		owo_polearm_head_p_01 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_01",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_p_02 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_02",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_p_03 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_03",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		--		pickaxe
		owo_polearm_head_p_04 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_04",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_p_05 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_05",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_p_06 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_06",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_p_07 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_07",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_p_08 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_08",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		owo_polearm_head_p_09 = {
			model = _item_melee.."/heads/hatchet_head_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				bladeshroud = "owo_polearm_head_helper_0_01", bladeshroudac = "owo_polearm_head_helper_1_p_09",
				bladeshroudac2 = "owo_polearm_head_helper_2_01", bladeshroudac3 = "owo_polearm_head_helper_3_02",
			},
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
		-- ### Helper Parts ###
		-- Bladeshroud: Pseudo shaft extender
		owo_polearm_head_helper_0_01 = {
			model = _item_melee.."/heads/power_maul_head_05", type = "bladeshroud", 
			mesh_move = false, parent = current_type,
		},
		-- Bladeshroudac: Hammer head
		--	Becs de Corbin
		owo_polearm_head_helper_1_01 = {
			model = _item_melee.."/pommels/power_sword_pommel_02", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_02 = {
			model = _item_melee.."/pommels/axe_pommel_05", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_03 = {
			model = _item_melee.."/pommels/shovel_pommel_03", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_04 = {
			model = _item_melee.."/pommels/2h_power_sword_pommel_01", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		-- Lucerne
		owo_polearm_head_helper_1_l_01 = {
			model = _item_melee.."/pommels/thunder_hammer_pommel_03", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_l_02 = {
			model = _item_melee.."/heads/thunder_hammer_head_02", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		-- Pollax axe 
		owo_polearm_head_helper_1_p_01 = {
			model = _item_melee.."/heads/axe_head_03", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_p_02 = {
			model = _item_melee.."/heads/axe_head_05", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_p_03 = {
			model = _item_melee.."/heads/force_staff_head_06", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_p_04 = {
			model = _item_melee.."/heads/ogryn_pickaxe_2h_head_01", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_p_05 = {
			model = _item_melee.."/heads/ogryn_pickaxe_2h_head_02", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_p_06 = {
			model = _item_melee.."/heads/ogryn_pickaxe_2h_head_03", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_p_07 = {
			model = _item_melee.."/heads/ogryn_pickaxe_2h_head_04", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_p_08 = {
			model = _item_melee.."/heads/ogryn_pickaxe_2h_head_05", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		owo_polearm_head_helper_1_p_09 = {
			model = _item_melee.."/heads/ogryn_pickaxe_2h_head_06", type = "bladeshroudac", 
			mesh_move = false, parent = current_type,
		},
		-- Bladeshroudac2: Top spike
		owo_polearm_head_helper_2_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "bladeshroudac2", 
			mesh_move = false, parent = current_type,
		},
		-- Bladeshroudac3: rear
		--	Pick
		owo_polearm_head_helper_3_01 = {
			model = _item_melee.."/blades/sabre_blade_01", type = "bladeshroudac3", 
			mesh_move = false, parent = current_type,
		},
		-- 	Hammer
		owo_polearm_head_helper_3_02 = {
			model = _item_melee.."/pommels/power_sword_pommel_02", type = "bladeshroudac3", 
			mesh_move = false, parent = current_type,
		},
		-- Crow's Beak half 1
		owo_polearm_head_helper_3_03 = {
			model = _item_ranged.."/emblems/emblemright_15", type = "bladeshroudac3", 
			mesh_move = false, parent = current_type,
		},
		-- Bladeshroudac4: rear
		-- Crow's Beak half 2
		owo_polearm_head_helper_4_03 = {
			model = _item_ranged.."/emblems/emblemright_15", type = "bladeshroudac4", 
			mesh_move = false, parent = current_type,
		},
	})
end
function mod.fixes_owo_polearm_head(variant_id, given_type, given_parent)
	local _owo_polearm_bec_heads = "owo_polearm_head_bc_01|owo_polearm_head_bc_02|owo_polearm_head_bc_03|owo_polearm_head_bc_04|owo_polearm_head_bc_01b|owo_polearm_head_bc_02b|owo_polearm_head_bc_03b|owo_polearm_head_bc_04b"
	local _owo_polearm_lucerne_heads = "owo_polearm_head_l_01|owo_polearm_head_l_02|owo_polearm_head_l_03"
	local _owo_polearm_pollax_shovel_heads = "owo_polearm_head_p_04|owo_polearm_head_p_05|owo_polearm_head_p_06|owo_polearm_head_p_07|owo_polearm_head_p_08|owo_polearm_head_p_09"
	local _owo_polearm_pollax_misc_heads = "owo_polearm_head_p_01|owo_polearm_head_p_02|owo_polearm_head_p_03"
	local _owo_polearm_pollax_heads = _owo_polearm_pollax_shovel_heads.."|".._owo_polearm_pollax_misc_heads
	local _owo_polearm_heads = _owo_polearm_bec_heads.."|".._owo_polearm_lucerne_heads.."|".._owo_polearm_pollax_heads

	local current_type = given_type or "head"
	local current_parent = given_parent or "grip"

	mod.mt.inject_fixes(variant_id, {
		-- ######
		-- Head: POLEARM HEADS
		-- ######
		-- Overwrites
		--		very studded axe pommel flared
		{	dependencies =  	{ "owo_polearm_head_bc_02|owo_polearm_head_bc_02b" },
			bladeshroudac =		{ offset = true, position = vector3_box(0, 0.02, 0.16), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.1, 1.1, 1.5 ) },
		},
		--		Shovel pommel head
		{	dependencies =  	{ "owo_polearm_head_bc_03|owo_polearm_head_bc_03b" },
			bladeshroudac =		{ offset = true, position = vector3_box(0, 0.01, 0.16), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 0.7, 1.8 ) },
		},
		--		nipple studded axe pommel head
		{	dependencies =  	{ "owo_polearm_head_bc_04|owo_polearm_head_bc_04b" },
			bladeshroudac =		{ offset = true, position = vector3_box(0, 0.02, 0.16), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.6, 1.6, 1.7 ) },
		},
		{	dependencies =  	{ "owo_polearm_head_bc_01b|owo_polearm_head_bc_02b|owo_polearm_head_bc_03b|owo_polearm_head_bc_04b" },
			bladeshroudac3 =	{ offset = true, position = vector3_box(0.0, -0.048, 0.16), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.3, 3.3, 2.0 ) },
			bladeshroudac4 =	{ offset = true, position = vector3_box(0.0, -0.048, 0.16), rotation = vector3_box(0, 0, 180), scale = vector3_box(-1.3, 3.3, 2.0 ) },
		},
		-- Default is built for the psword pommel
		{	dependencies =  	{ _owo_polearm_bec_heads },
			bladeshroud =   	{ offset = true, position = vector3_box(0, 0, -0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.158, 0.158, 0.42 ) },
			bladeshroudac =		{ offset = true, position = vector3_box(0, 0.02, 0.16), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.1, 1.6, 1.5 ) },
			bladeshroudac2 =	{ offset = true, position = vector3_box(0, 0, 0.208), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 0.6 ) },
			bladeshroudac3 =	{ offset = true, position = vector3_box(0, 0, 0.16), rotation = vector3_box(90, 0, 0), scale = vector3_box(2.8, 1.0, 0.25 ) },
		},
		--	Lucernes, when compared to Becs de Corbin, typically have a longer thinner back pick and taller top spike. head also usually has some protrusions
		--		Using the thammer head, not a pommel for the hammer head
		{	dependencies =  	{ "owo_polearm_head_l_02" },
			bladeshroudac =		{ offset = true, position = vector3_box(0, 0.062, 0.118), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.42, 0.53, 0.6 ) },
		},
		--		Using the force staff head
		{	dependencies =  	{ "owo_polearm_head_l_03" },
			bladeshroudac =		{ offset = true, position = vector3_box(0, -0.062, 0.158), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.0, 0.33, 0.87 ) },
		},
		{	dependencies =  	{ _owo_polearm_lucerne_heads },
			bladeshroud =   	{ offset = true, position = vector3_box(0, 0, -0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.158, 0.158, 0.42 ) },
			bladeshroudac =		{ offset = true, position = vector3_box(0, 0.02, 0.16), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.1, 1.1, 2.2 ) },
			bladeshroudac2 =	{ offset = true, position = vector3_box(0, 0, 0.208), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.3, 1.0 ) },
			bladeshroudac3 =	{ offset = true, position = vector3_box(0, 0, 0.16), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.3, 1.0, 0.32 ) },
		},
		-- Pollax
		--		Regular combat axe
		{	dependencies =  	{ "owo_polearm_head_p_01" },
			bladeshroudac =		{ offset = true, position = vector3_box(0, 0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.8, 0.8 ) },
			bladeshroudac3 =	{ offset = true, position = vector3_box(0, 0, 0.2), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.8, 1.4, 1.5 ) },
		},
		--		Thicc axe
		{	dependencies =  	{ "owo_polearm_head_p_02" },
			bladeshroudac =		{ offset = true, position = vector3_box(0, 0.0, -0.066), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.9, 0.8 ) },
			bladeshroudac3 =   	{ offset = true, position = vector3_box(0, -0.05, 0.2), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.8, 1.4, 1.5 ) },
		},
		--		Force Staff head as blade
		{	dependencies =  	{ "owo_polearm_head_p_03" },
			bladeshroudac =   	{ offset = true, position = vector3_box(0, -0.062, 0.164), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.158, 0.58, 0.86 ) },
			bladeshroudac3 =	{ offset = true, position = vector3_box(0, 0, 0.16), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.8, 1.0, 1.2 ) },
		},
		--		Pickaxe blade and others
		--			shorter picks
		{	dependencies =  	{ "owo_polearm_head_p_05|owo_polearm_head_p_06|owo_polearm_head_p_08|owo_polearm_head_p_09" },
			bladeshroudac =   	{ offset = true, position = vector3_box(0, -0.15, 0.154), rotation = vector3_box(-90, 0, 90), scale = vector3_box(0.17, 0.03, 0.45 ) },
		},
		{	dependencies =  	{ _owo_polearm_pollax_heads },
			bladeshroud =   	{ offset = true, position = vector3_box(0, 0, -0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.158, 0.158, 0.42 ) },
			bladeshroudac =		{ offset = true, position = vector3_box(0, -0.11, 0.154), rotation = vector3_box(-90, 0, 90), scale = vector3_box(0.17, 0.03, 0.384 ) },
			bladeshroudac2 =	{ offset = true, position = vector3_box(0, 0, 0.208), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 0.6 ) },
			bladeshroudac3 =	{ offset = true, position = vector3_box(0, 0, 0.158), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.7, 1.1, 1.9 ) },
		},
	})
end

-- Head: Crutches
function mod.owo_crutch_head(variant_id, given_type, given_parent)
	local current_type = given_type or "head"
	local current_parent = given_parent or "grip"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_crutch_01_01", name = "OwO Axillary Crutch 1"},
		{id = "owo_crutch_02_01", name = "OwO Lofstrand Crutch 1"},
	})
	mod.inject_attachments_owo(variant_id, "bladeshroud", {
		{id = "owo_crutch_grip_01", name = "OwO Crutch Grip 1"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- axillary/underarm crutch
		owo_crutch_01_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		-- Lofstrand/elbow crutch
		owo_crutch_02_01 = {
			model = _item_ranged.."/stocks/autogun_rifle_killshot_stock_02", type = current_type, 
			mesh_move = false, parent = current_parent, 
			automatic_equip = {
				bladeshroud = "owo_crutch_grip_01",
			},
		},
		-- ### Helper Parts ###
		owo_crutch_grip_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = "bladeshroud", 
			mesh_move = false, parent = current_type,
		},
	})
end
function mod.fixes_owo_crutch_head(variant_id, given_type, given_parent)
	local _owo_crutch_heads = "owo_crutch_01_01"

	--local _mt_falchion_grips = "falchion_mt_grip_01|falchion_mt_grip_02|falchion_mt_grip_03|falchion_mt_grip_04|falchion_mt_grip_05"
	--local _mt_sabre_grips = "sabre_mt_grip_01|sabre_mt_grip_02|sabre_mt_grip_03|sabre_mt_grip_04|sabre_mt_grip_05"
	--local _mt_dclaw_grips = "combat_sword_mt_grip_01|combat_sword_mt_grip_02|combat_sword_mt_grip_03|combat_sword_mt_grip_04|combat_sword_mt_grip_05|combat_sword_mt_grip_06"
	--local _mt_combat_axe_grips = "axe_mt_grip_01|axe_mt_grip_02|axe_mt_grip_03|axe_mt_grip_04|axe_mt_grip_05|axe_mt_grip_06"
	--local _mt_tactical_axe_grips = "hatchet_mt_grip_01|hatchet_mt_grip_02|hatchet_mt_grip_03|hatchet_mt_grip_04|hatchet_mt_grip_05|hatchet_mt_grip_06"
	--local _mt_eviscerator_grips = "2h_chain_sword_mt_grip_01|2h_chain_sword_mt_grip_02|2h_chain_sword_mt_grip_03|2h_chain_sword_mt_grip_04"
	--local _mt_chain_sword_grips = "chain_sword_mt_grip_01|chain_sword_mt_grip_02|chain_sword_mt_grip_03|chain_sword_mt_grip_04|chain_sword_mt_grip_05|chain_sword_mt_grip_06|chain_sword_mt_grip_07|chain_sword_mt_grip_08"
	--local _mt_ogryn_grips = "ogrynbladehandle_01|ogrynbladehandle_02|ogrynbladehandle_03|ogrynbladehandle_04|ogrynbladehandle_05|ogrynbladehandle_06"

	local current_type = given_type or "head"
	local current_parent = given_parent or "grip"

	mod.mt.inject_fixes(variant_id, {
		-- ######
		-- Head: CRUTCHES
		-- ######
		{	dependencies =	{ "owo_crutch_01_01", "owo_invisible_connector_01" },
			head =			{ offset = true, position = vector3_box(0, 0.0, 0.51), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.1, 1.1, 0.71 ) },
		},
		{	dependencies =	{ "owo_crutch_01_01", },
			head =			{ offset = true, position = vector3_box(0, 0.0, 0.777), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.1, 1.1, 1.0 ) },
			-- making it more foot like
			pommel =		{ offset = true, position = vector3_box(0, 0, -0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1.4, 1.0 ) },
		},
		{	dependencies =	{ "owo_crutch_02_01", "owo_invisible_connector_01" },
			head =			{ offset = true, position = vector3_box(0, -0.006, 0.606), rotation = vector3_box(115, 0, -180), scale = vector3_box(2.1, 1.1, 1.2 ) },
		},
		{	dependencies =	{ "owo_crutch_02_01", },
			head =			{ offset = true, position = vector3_box(0, 0.015, 0.857), rotation = vector3_box(115, 0, -180), scale = vector3_box(2.1, 1.1, 1.2 ) },
			bladeshroud =	{ offset = true, position = vector3_box(0, 0.012, -0.0522), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.145, 0.25, 0.25 ) },
			-- making it more foot like
			pommel =		{ offset = true, position = vector3_box(0, 0, -0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.4, 1.4, 1.0 ) },
		},
	})
end

-- Connector: Invisible
function mod.owo_invisible_connector(variant_id, given_type, given_parent)
	local current_type = given_type or "connector"
	local current_parent = given_parent or "shaft"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_invisible_connector_01", name = "OwO Invisible Connector", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_invisible_connector_01 = {
			model = _item_melee.."/connectors/thunder_hammer_connector_01", type = current_type, 
			mesh_move = false, parent = current_parent,
			hide_mesh = {
				{current_type, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
			},
		},
	})
end
function mod.fixes_owo_invisible_connector(variant_id, given_type, given_parent)
	local current_type = given_type or "connector"
	local current_parent = given_parent or "shaft"

	mod.mt.inject_fixes(variant_id, {
		-- ######
		-- Connector: WHEN YOU CAN'T EVEN SAY! MY NAME!
		-- ######
		{	dependencies =	{ "owo_invisible_connector_01" },
			trinket_hook =	{ offset = true, position = vector3_box(-0.02, 0.0, -0.027), rotation = vector3_box(0, 90, 90), scale = vector3_box(1, 1, 1) },
		},
	})
end

-- Crossguards
function mod.owo_crossguard(variant_id, given_type, given_parent)
	local current_type = given_type or "crossguard"
	local current_parent = given_parent or "grip"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_crossguard_plate_01", name = "OwO Crossguard Plate"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_crossguard_plate_01 = {
			model = _item_melee.."/pommels/axe_pommel_01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
	})
end
function mod.fixes_owo_crossguard(variant_id, given_type, given_parent)
	local current_type = given_type or "crossguard"
	local current_parent = given_parent or "grip"

	local _owo_crossguards = "owo_crossguard_plate_01"

	mod.mt.inject_fixes(variant_id, {
		{   dependencies =  { "owo_crossguard_plate_01" },
			-- Hilt
			hilt =  { offset = true, position = vector3_box(0, 0, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 0.2)},
		},
	})
end

-- Body: Rapier Blades
function mod.owo_rapier_blade(variant_id, given_type, given_parent)
	local current_type = given_type or "body"
	local current_parent = given_parent or "grip"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_rapier_blade_01", name = "OwO Rapier Blade 1"},
		{id = "owo_rapier_blade_02", name = "OwO Rapier Blade 2"},
		{id = "owo_rapier_blade_03", name = "OwO Rapier Blade 3"},
		{id = "owo_rapier_blade_04", name = "OwO Rapier Blade 4"},
		{id = "owo_rapier_blade_05", name = "OwO Rapier Blade 5"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_rapier_blade_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_rapier_blade_02 = {
			model = _item_melee.."/blades/combat_knife_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_rapier_blade_03 = {
			model = _item_melee.."/blades/force_sword_blade_01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_rapier_blade_04 = {
			model = _item_melee.."/blades/force_sword_blade_03", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_rapier_blade_05 = {
			model = _item_melee.."/blades/force_sword_blade_04", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
	})
end

-- Body: Historical/Tactical Blades
--	Trench Spike: M1917
function mod.owo_historical_blade(variant_id, given_type)
	local current_type = given_type or "body"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_historical_blade_trench_spike", name = "OwO Trench Dagger Spike"},
		{id = "owo_historical_blade_02", name = "OwO Gerber Mk II"},
		{id = "owo_historical_blade_karambit", name = "OwO Karambit Blade"},
		{id = "owo_historical_blade_karambit_f", name = "OwO Karambit Blade (Flip)"},
		{id = "owo_historical_blade_karambit_s", name = "OwO Karambit Blade (Small)"},
		{id = "owo_historical_blade_karambit_sf", name = "OwO Karambit Blade (S/F)"},
		{id = "owo_historical_blade_tanto_01", name = "OwO Tactical Tanto 1"},
		{id = "owo_historical_blade_tanto_02", name = "OwO Tactical Tanto 2"},
		{id = "owo_historical_blade_tanto_03", name = "OwO Tactical Tanto 3"},
		{id = "owo_historical_blade_tanto_04", name = "OwO Tactical Tanto 4"},
		{id = "owo_historical_blade_tanto_05", name = "OwO Tactical Tanto 5"},
		{id = "owo_historical_blade_tanto_06", name = "OwO Tactical Tanto 6"},
		{id = "owo_historical_blade_box_cutter", name = "OwO Box Cutter"},
	})
	mod.inject_attachments_owo(variant_id, "bladeshroud" or type, {
		{id = "owo_historical_blade_helper_gerber", name = "OwO Gerber'vesa", no_randomize = true},
		{id = "owo_historical_blade_helper_karambit", name = "OwO Karambit'vesa", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_historical_blade_trench_spike = {
			model = _item_ranged.."/bayonets/bayonet_03", type = current_type, 
			mesh_move = false, 
		},
		owo_historical_blade_02 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				bladeshroud = "owo_historical_blade_helper_gerber",
			},
		},
		owo_historical_blade_karambit_f = {
			model = _item_melee.."/blades/combat_blade_blade_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				bladeshroud = "owo_historical_blade_helper_karambit",
			},
		},
		owo_historical_blade_karambit_s = {
			model = _item_melee.."/blades/combat_blade_blade_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				bladeshroud = "owo_historical_blade_helper_karambit",
			},
		},
		owo_historical_blade_karambit_sf = {
			model = _item_melee.."/blades/combat_blade_blade_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				bladeshroud = "owo_historical_blade_helper_karambit",
			},
		},
		owo_historical_blade_tanto_01 = {
			model = _item_melee.."/blades/combat_sword_blade_01", type = current_type, 
			mesh_move = false, 
		},
		owo_historical_blade_tanto_02 = {
			model = _item_melee.."/blades/combat_sword_blade_02", type = current_type, 
			mesh_move = false, 
		},
		owo_historical_blade_tanto_03 = {
			model = _item_melee.."/blades/combat_sword_blade_03", type = current_type, 
			mesh_move = false, 
		},
		owo_historical_blade_tanto_04 = {
			model = _item_melee.."/blades/combat_sword_blade_04", type = current_type, 
			mesh_move = false, 
		},
		owo_historical_blade_tanto_05 = {
			model = _item_melee.."/blades/combat_sword_blade_05", type = current_type, 
			mesh_move = false, 
		},
		owo_historical_blade_tanto_06 = {
			model = _item_melee.."/blades/combat_sword_blade_06", type = current_type, 
			mesh_move = false, 
		},
		owo_historical_blade_karambit = {
			model = _item_melee.."/blades/combat_blade_blade_05", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				bladeshroud = "owo_historical_blade_helper_karambit",
			},
		},
		owo_historical_blade_box_cutter = {
			model = _item_melee.."/blades/combat_sword_blade_01", type = current_type, 
			mesh_move = false, 
		},
		-- ### Helper Parts ###
		owo_historical_blade_helper_gerber = {
			model = _item_melee.."/blades/combat_blade_blade_06", type = "bladeshroud", 
			mesh_move = false, parent = current_type,
		},
		owo_historical_blade_helper_karambit = {
			model = _item_melee.."/blades/combat_blade_blade_05", type = "bladeshroud", 
			mesh_move = false, 
		},
	})
end

-- Blade: Slim Blades
--		PSword Blade 4 doesn't exist
--	Flat is just less thicc but keeps how wide it is
--	Slim reduces both
function mod.owo_slim_blade(variant_id, given_type, given_parent)
	local current_type = given_type or "blade"
	local current_parent = given_parent or "hilt"

	mod.inject_attachments_owo(variant_id, current_type, {
		-- PSword
		{id = "owo_flat_psword_01", name = "OwO Flat PSword 1"},
		{id = "owo_flat_psword_02", name = "OwO Flat PSword 2"},
		{id = "owo_flat_psword_03", name = "OwO Flat PSword 3"},
		--{id = "owo_flat_psword_04", name = "OwO Flat PSword 4"},
		{id = "owo_flat_psword_05", name = "OwO Flat PSword 4"},
		{id = "owo_flat_psword_06", name = "OwO Flat PSword 5"},
		{id = "owo_flat_psword_07", name = "OwO Flat PSword 6"},
		{id = "owo_flat_psword_08", name = "OwO Flat PSword M"},
		{id = "owo_flat_psword_01g", name = "OwO Flat PSword 1 (Grip)"},
		{id = "owo_flat_psword_02g", name = "OwO Flat PSword 2 (G)"},
		{id = "owo_flat_psword_03g", name = "OwO Flat PSword 3 (G)"},
		--{id = "owo_flat_psword_04g", name = "OwO Flat PSword 4"},
		{id = "owo_flat_psword_05g", name = "OwO Flat PSword 4 (G)"},
		{id = "owo_flat_psword_06g", name = "OwO Flat PSword 5 (G)"},
		{id = "owo_flat_psword_07g", name = "OwO Flat PSword 6 (G)"},
		{id = "owo_flat_psword_08g", name = "OwO Flat PSword 7 (G) (M)"},
		{id = "owo_slim_psword_01", name = "OwO Slim PSword 1"},
		{id = "owo_slim_psword_02", name = "OwO Slim PSword 2"},
		{id = "owo_slim_psword_03", name = "OwO Slim PSword 3"},
		--{id = "owo_slim_psword_04", name = "OwO Slim PSword 4"},
		{id = "owo_slim_psword_05", name = "OwO Slim PSword 4"},
		{id = "owo_slim_psword_06", name = "OwO Slim PSword 5"},
		{id = "owo_slim_psword_07", name = "OwO Slim PSword 6"},
		{id = "owo_slim_psword_08", name = "OwO Slim PSword 7 (M)"},
		{id = "owo_slim_psword_01g", name = "OwO Slim PSword 1 (G)"},
		{id = "owo_slim_psword_02g", name = "OwO Slim PSword 2 (G)"},
		{id = "owo_slim_psword_03g", name = "OwO Slim PSword 3 (G)"},
		--{id = "owo_slim_psword_04g", name = "OwO Slim PSword (G) 4"},
		{id = "owo_slim_psword_05g", name = "OwO Slim PSword 4 (G)"},
		{id = "owo_slim_psword_06g", name = "OwO Slim PSword 5 (G)"},
		{id = "owo_slim_psword_07g", name = "OwO Slim PSword 6 (G)"},
		{id = "owo_slim_psword_08g", name = "OwO Slim PSword M (G)"},
		-- DClaw
		{id = "owo_flat_dclaw_01", name = "OwO Flat DClaw 1"},
		{id = "owo_flat_dclaw_02", name = "OwO Flat DClaw 2"},
		{id = "owo_flat_dclaw_03", name = "OwO Flat DClaw 3"},
		{id = "owo_flat_dclaw_04", name = "OwO Flat DClaw 4"},
		{id = "owo_flat_dclaw_05", name = "OwO Flat DClaw 5"},
		{id = "owo_flat_dclaw_06", name = "OwO Flat DClaw 6"},
		{id = "owo_flat_dclaw_07", name = "OwO Flat DClaw 7"},
		{id = "owo_flat_dclaw_08", name = "OwO Flat DClaw M"},
		{id = "owo_flat_dclaw_01g", name = "OwO Flat DClaw 1 (G)"},
		{id = "owo_flat_dclaw_02g", name = "OwO Flat DClaw 2 (G)"},
		{id = "owo_flat_dclaw_03g", name = "OwO Flat DClaw 3 (G)"},
		{id = "owo_flat_dclaw_04g", name = "OwO Flat DClaw 4 (G)"},
		{id = "owo_flat_dclaw_05g", name = "OwO Flat DClaw 5 (G)"},
		{id = "owo_flat_dclaw_06g", name = "OwO Flat DClaw 6 (G)"},
		{id = "owo_flat_dclaw_07g", name = "OwO Flat DClaw 7 (G)"},
		{id = "owo_flat_dclaw_08g", name = "OwO Flat DClaw M (G)"},
		{id = "owo_slim_dclaw_01", name = "OwO Slim DClaw 1"},
		{id = "owo_slim_dclaw_02", name = "OwO Slim DClaw 2"},
		{id = "owo_slim_dclaw_03", name = "OwO Slim DClaw 3"},
		{id = "owo_slim_dclaw_04", name = "OwO Slim DClaw 4"},
		{id = "owo_slim_dclaw_05", name = "OwO Slim DClaw 5"},
		{id = "owo_slim_dclaw_06", name = "OwO Slim DClaw 6"},
		{id = "owo_slim_dclaw_07", name = "OwO Slim DClaw 7"},
		{id = "owo_slim_dclaw_08", name = "OwO Slim DClaw (M)"},
		{id = "owo_slim_dclaw_01g", name = "OwO Slim DClaw 1 (G)"},
		{id = "owo_slim_dclaw_02g", name = "OwO Slim DClaw 2 (G)"},
		{id = "owo_slim_dclaw_03g", name = "OwO Slim DClaw 3 (G)"},
		{id = "owo_slim_dclaw_04g", name = "OwO Slim DClaw 4 (G)"},
		{id = "owo_slim_dclaw_05g", name = "OwO Slim DClaw 5 (G)"},
		{id = "owo_slim_dclaw_06g", name = "OwO Slim DClaw 6 (G)"},
		{id = "owo_slim_dclaw_07g", name = "OwO Slim DClaw 7 (G)"},
		{id = "owo_slim_dclaw_08g", name = "OwO Slim DClaw M (G)"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		-- PSword
		--	Flat
		owo_flat_psword_01 = {
			model = _item_melee.."/blades/power_sword_blade_01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_02 = {
			model = _item_melee.."/blades/power_sword_blade_02", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_03 = {
			model = _item_melee.."/blades/power_sword_blade_03", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		--owo_flat_psword_04 = {
		--	model = _item_melee.."/blades/power_sword_blade_04", type = current_type, 
		--	mesh_move = false, parent = current_parent,
		--},
		owo_flat_psword_05 = {
			model = _item_melee.."/blades/power_sword_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_06 = {
			model = _item_melee.."/blades/power_sword_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_07 = {
			model = _item_melee.."/blades/power_sword_blade_07", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_08 = {
			model = _item_melee.."/blades/power_sword_blade_ml01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_01 = {
			model = _item_melee.."/blades/power_sword_blade_01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		--	Slim
		owo_slim_psword_02 = {
			model = _item_melee.."/blades/power_sword_blade_02", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_03 = {
			model = _item_melee.."/blades/power_sword_blade_03", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		--owo_slim_psword_04 = {
		--	model = _item_melee.."/blades/power_sword_blade_04", type = current_type, 
		--	mesh_move = false, parent = current_parent,
		--},
		owo_slim_psword_05 = {
			model = _item_melee.."/blades/power_sword_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_06 = {
			model = _item_melee.."/blades/power_sword_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_07 = {
			model = _item_melee.."/blades/power_sword_blade_07", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_08 = {
			model = _item_melee.."/blades/power_sword_blade_ml01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		-- PSword Grip
		owo_flat_psword_01g = {
			model = _item_melee.."/blades/power_sword_blade_01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_02g = {
			model = _item_melee.."/blades/power_sword_blade_02", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_03g = {
			model = _item_melee.."/blades/power_sword_blade_03", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		--owo_flat_psword_04g = {
		--	model = _item_melee.."/blades/power_sword_blade_04", type = current_type, 
		--	mesh_move = false, parent = current_parent,
		--},
		owo_flat_psword_05g = {
			model = _item_melee.."/blades/power_sword_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_06g = {
			model = _item_melee.."/blades/power_sword_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_07g = {
			model = _item_melee.."/blades/power_sword_blade_07", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_flat_psword_08g = {
			model = _item_melee.."/blades/power_sword_blade_ml01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_01g = {
			model = _item_melee.."/blades/power_sword_blade_01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_02g = {
			model = _item_melee.."/blades/power_sword_blade_02", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_03g = {
			model = _item_melee.."/blades/power_sword_blade_03", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		--owo_slim_psword_04g = {
		--	model = _item_melee.."/blades/power_sword_blade_04", type = current_type, 
		--	mesh_move = false, parent = current_parent,
		--},
		owo_slim_psword_05g = {
			model = _item_melee.."/blades/power_sword_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_06g = {
			model = _item_melee.."/blades/power_sword_blade_06", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_07g = {
			model = _item_melee.."/blades/power_sword_blade_07", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		owo_slim_psword_08g = {
			model = _item_melee.."/blades/power_sword_blade_ml01", type = current_type, 
			mesh_move = false, parent = current_parent,
		},
		-- Devil's Claw
		--		Flat DClaw
		owo_flat_dclaw_01 = {
			model = _item_melee.."/blades/combat_sword_blade_01", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_02 = {
			model = _item_melee.."/blades/combat_sword_blade_02", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_03 = {
			model = _item_melee.."/blades/combat_sword_blade_03", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_04 = {
			model = _item_melee.."/blades/combat_sword_blade_04", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_05 = {
			model = _item_melee.."/blades/combat_sword_blade_05", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_06 = {
			model = _item_melee.."/blades/combat_sword_blade_06", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_07 = {
			model = _item_melee.."/blades/combat_sword_blade_07", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_08 = {
			model = _item_melee.."/blades/combat_sword_blade_ml01", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_01g = {
			model = _item_melee.."/blades/combat_sword_blade_01", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_02g = {
			model = _item_melee.."/blades/combat_sword_blade_02", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_03g = {
			model = _item_melee.."/blades/combat_sword_blade_03", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_04g = {
			model = _item_melee.."/blades/combat_sword_blade_04", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_05g = {
			model = _item_melee.."/blades/combat_sword_blade_05", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_06g = {
			model = _item_melee.."/blades/combat_sword_blade_06", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_07g = {
			model = _item_melee.."/blades/combat_sword_blade_07", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_flat_dclaw_08g = {
			model = _item_melee.."/blades/combat_sword_blade_ml01", type = current_type, mesh_move = false, parent = current_parent,
		},
		--		Slim DClaw
		owo_slim_dclaw_01 = {
			model = _item_melee.."/blades/combat_sword_blade_01", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_02 = {
			model = _item_melee.."/blades/combat_sword_blade_02", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_03 = {
			model = _item_melee.."/blades/combat_sword_blade_03", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_04 = {
			model = _item_melee.."/blades/combat_sword_blade_04", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_05 = {
			model = _item_melee.."/blades/combat_sword_blade_05", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_06 = {
			model = _item_melee.."/blades/combat_sword_blade_06", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_07 = {
			model = _item_melee.."/blades/combat_sword_blade_07", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_08 = {
			model = _item_melee.."/blades/combat_sword_blade_ml01", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_01g = {
			model = _item_melee.."/blades/combat_sword_blade_01", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_02g = {
			model = _item_melee.."/blades/combat_sword_blade_02", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_03g = {
			model = _item_melee.."/blades/combat_sword_blade_03", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_04g = {
			model = _item_melee.."/blades/combat_sword_blade_04", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_05g = {
			model = _item_melee.."/blades/combat_sword_blade_05", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_06g = {
			model = _item_melee.."/blades/combat_sword_blade_06", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_07g = {
			model = _item_melee.."/blades/combat_sword_blade_07", type = current_type, mesh_move = false, parent = current_parent,
		},
		owo_slim_dclaw_08g = {
			model = _item_melee.."/blades/combat_sword_blade_ml01", type = current_type, mesh_move = false, parent = current_parent,
		},
	})
end
function mod.fixes_owo_slim_blade(variant_id, given_type, given_parent)
	local current_type = given_type or "blade"
	local current_parent = given_parent or "hilt"

	local _owo_flat_psword_blades = "owo_flat_psword_01|owo_flat_psword_02|owo_flat_psword_03|owo_flat_psword_04|owo_flat_psword_05|owo_flat_psword_06|owo_flat_psword_07|owo_flat_psword_08"
	local _owo_slim_psword_blades = "owo_slim_psword_01|owo_slim_psword_02|owo_slim_psword_03|owo_slim_psword_04|owo_slim_psword_05|owo_slim_psword_06|owo_slim_psword_07|owo_slim_psword_08"
	local _owo_flat_psword_g_blades = "owo_flat_psword_01g|owo_flat_psword_02g|owo_flat_psword_03g|owo_flat_psword_04g|owo_flat_psword_05g|owo_flat_psword_06g|owo_flat_psword_07g|owo_flat_psword_08g"
	local _owo_slim_psword_g_blades = "owo_slim_psword_01g|owo_slim_psword_02g|owo_slim_psword_03g|owo_slim_psword_04g|owo_slim_psword_05g|owo_slim_psword_06g|owo_slim_psword_07g|owo_slim_psword_08g"
	local _owo_flat_all_psword_blades = _owo_flat_psword_blades.."|".._owo_flat_psword_g_blades
	local _owo_slim_all_psword_blades = _owo_slim_psword_blades.."|".._owo_slim_psword_g_blades
	local _owo_all_psword_g_blades = _owo_flat_psword_g_blades.."|".._owo_slim_psword_g_blades
	local _owo_flat_dclaw_blades = "owo_flat_dclaw_01|owo_flat_dclaw_02|owo_flat_dclaw_03|owo_flat_dclaw_04|owo_flat_dclaw_05|owo_flat_dclaw_06|owo_flat_dclaw_07|owo_flat_dclaw_08"
	local _owo_flat_dclaw_g_blades = "owo_flat_dclaw_01g|owo_flat_dclaw_02g|owo_flat_dclaw_03g|owo_flat_dclaw_04g|owo_flat_dclaw_05g|owo_flat_dclaw_06g|owo_flat_dclaw_07g|owo_flat_dclaw_08g"
	local _owo_flat_all_dclaw_blades = _owo_flat_dclaw_blades.."|".._owo_flat_dclaw_g_blades
	local _owo_slim_dclaw_blades = "owo_slim_dclaw_01|owo_slim_dclaw_02|owo_slim_dclaw_03|owo_slim_dclaw_04|owo_slim_dclaw_05|owo_slim_dclaw_06|owo_slim_dclaw_07|owo_slim_dclaw_08"
	local _owo_slim_dclaw_g_blades = "owo_slim_dclaw_01g|owo_slim_dclaw_02g|owo_slim_dclaw_03g|owo_slim_dclaw_04g|owo_slim_dclaw_05g|owo_slim_dclaw_06g|owo_slim_dclaw_07g|owo_slim_dclaw_08g"
	local _owo_slim_all_dclaw_blades = _owo_slim_dclaw_blades.."|".._owo_slim_dclaw_g_blades
	local _owo_all_dclaw_g_blades = _owo_flat_dclaw_g_blades.."|".._owo_slim_dclaw_g_blades

	mod.mt.inject_fixes(variant_id, {
		-- PSword
		--      Flat Power Sword
		--          Default
		{   dependencies =  { _owo_flat_psword_g_blades },
			[current_parent] =  { offset = true, position = vector3_box(0, 0, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
			[current_type] = { offset = true, position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 1)},
		},
		{   dependencies =  { _owo_flat_psword_blades },
			[current_type] = { offset = true, position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
		},
		--      Slim Power Sword
		--          Default
		{   dependencies =  { _owo_slim_psword_g_blades },
			[current_parent] =  { offset = true, position = vector3_box(0, 0, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
			[current_type] = { offset = true, position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 0.65, 1)},
		},
		{   dependencies =  { _owo_slim_psword_blades },
			[current_type] = { offset = true, position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.65, 1)},
		},
		-- DClaw
		--      Flat DClaw
		{   dependencies =  { _owo_flat_dclaw_g_blades },
			[current_parent] =  { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
			[current_type] = { offset = true, position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.75, 1, 1)},
		},
		{   dependencies =  { _owo_flat_dclaw_blades },
			[current_type] = { offset = true, position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
		},
		--      Slim DClaw
		{   dependencies =  { _owo_slim_dclaw_g_blades },
			[current_parent] =  { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
			[current_type] = { offset = true, position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.75, 0.75, 1)},
		},
		{   dependencies =  { _owo_slim_dclaw_blades },
			[current_type] = { offset = true, position = vector3_box(0, 0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.75, 1)},
		},
	})
end

-- Shaft: Thammer Low Grip
function mod.owo_shaft_low_grip(variant_id, given_type)
	local current_type = given_type or "shaft"

	mod.inject_attachments_owo(variant_id, current_type, {
        {id = "owo_shaft_low_grip_01", name = "OwO Long Shaft (Low Grip) 1"},
		{id = "owo_shaft_low_grip_02", name = "OwO Long Shaft (Low) 2"},
		{id = "owo_shaft_low_grip_03", name = "OwO Long Shaft (Low) 3"},
		{id = "owo_shaft_low_grip_04", name = "OwO Long Shaft (Low) 4"},
		{id = "owo_shaft_low_grip_05", name = "OwO Long Shaft (Low) 5"},
		{id = "owo_shaft_low_grip_06", name = "OwO Long Shaft (Low) 6"},
	})
	mod.inject_attachments_owo(variant_id, "shaftac1", {
		{id = "owo_shaft_low_grip_helper_01", name = "OwO Shaft'vesa 1", no_randomize = true},
		{id = "owo_shaft_low_grip_helper_02", name = "OwO Shaft'vesa 2", no_randomize = true},
		{id = "owo_shaft_low_grip_helper_03", name = "OwO Shaft'vesa 3", no_randomize = true},
		{id = "owo_shaft_low_grip_helper_04", name = "OwO Shaft'vesa 4", no_randomize = true},
		{id = "owo_shaft_low_grip_helper_05", name = "OwO Shaft'vesa 5", no_randomize = true},
		{id = "owo_shaft_low_grip_helper_06", name = "OwO Shaft'vesa 6", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_shaft_low_grip_01 = {
			model = _item_ranged.."/shafts/force_staff_shaft_lower_01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_shaft_low_grip_helper_01" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_shaft_low_grip_02 = {
			model = _item_ranged.."/shafts/force_staff_shaft_lower_01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_shaft_low_grip_helper_02" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_shaft_low_grip_03 = {
			model = _item_ranged.."/shafts/force_staff_shaft_lower_01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_shaft_low_grip_helper_03" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_shaft_low_grip_04 = {
			model = _item_ranged.."/shafts/force_staff_shaft_lower_01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_shaft_low_grip_helper_04" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_shaft_low_grip_05 = {
			model = _item_ranged.."/shafts/force_staff_shaft_lower_01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_shaft_low_grip_helper_05" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_shaft_low_grip_06 = {
			model = _item_ranged.."/shafts/force_staff_shaft_lower_01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_shaft_low_grip_helper_06" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		-- ### Helper Parts ###
		owo_shaft_low_grip_helper_01 = {
			model = _item_ranged.."/shafts/thunder_hammer_shaft_01", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_shaft_low_grip_helper_02 = {
			model = _item_ranged.."/shafts/thunder_hammer_shaft_02", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_shaft_low_grip_helper_03 = {
			model = _item_ranged.."/shafts/thunder_hammer_shaft_03", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_shaft_low_grip_helper_04 = {
			model = _item_ranged.."/shafts/thunder_hammer_shaft_04", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_shaft_low_grip_helper_05 = {
			model = _item_ranged.."/shafts/thunder_hammer_shaft_05", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_shaft_low_grip_helper_06 = {
			model = _item_ranged.."/shafts/thunder_hammer_shaft_ml01", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
	})
end
function mod.fixes_owo_shaft_low_grip(variant_id, given_type)
	local current_type = given_type or "shaft"

	local _owo_low_grip_shafts = "owo_shaft_low_grip_01|owo_shaft_low_grip_02|owo_shaft_low_grip_03|owo_shaft_low_grip_04|owo_shaft_low_grip_05|owo_shaft_low_grip_06"

	mod.mt.inject_fixes(variant_id, {
		-- Trying to get it be 1.5-2 meters long
		--	based on head position past connector:
		--	1.35 ends up being around shoulder/lowerhead height
		--	1.5 is eye level 
		--	past that it goes off screen in first person
		{   dependencies =  { _owo_low_grip_shafts },
			shaft =  		{ offset = true, position = vector3_box(0, 0, 0.38), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
			shaftac1 = 		{ offset = true, position = vector3_box(0, 0, -0.28), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.5) },
			pommel = 		{ offset = true, position = vector3_box(0, 0, -0.48), },
		},
	})
end

-- Shaft: Ogryn Low Grip
-- 	Using mastery stick as base, so can't have that as an option. janky but i'm lazy and fuck that shit
function mod.owo_ogryn_shaft_low_grip(variant_id, given_type)
	local current_type = given_type or "shaft"

	mod.inject_attachments_owo(variant_id, current_type, {
        {id = "owo_ogryn_shaft_low_grip_01", name = "OwO Long Ogryn (Low Grip) 1"},
		{id = "owo_ogryn_shaft_low_grip_02", name = "OwO Long Ogryn (Low) 2"},
		{id = "owo_ogryn_shaft_low_grip_03", name = "OwO Long Ogryn (Low) 3"},
		{id = "owo_ogryn_shaft_low_grip_04", name = "OwO Long Ogryn (Low) 4"},
		{id = "owo_ogryn_shaft_low_grip_05", name = "OwO Long Ogryn (Low) 5"},
	})
	mod.inject_attachments_owo(variant_id, "shaftac1", {
		{id = "owo_ogryn_shaft_low_grip_helper_01", name = "OwO Shaft'vesa 1", no_randomize = true},
		{id = "owo_ogryn_shaft_low_grip_helper_02", name = "OwO Shaft'vesa 2", no_randomize = true},
		{id = "owo_ogryn_shaft_low_grip_helper_03", name = "OwO Shaft'vesa 3", no_randomize = true},
		{id = "owo_ogryn_shaft_low_grip_helper_04", name = "OwO Shaft'vesa 4", no_randomize = true},
		{id = "owo_ogryn_shaft_low_grip_helper_05", name = "OwO Shaft'vesa 5", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_ogryn_shaft_low_grip_01 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_ml01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_ogryn_shaft_low_grip_helper_01" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_ogryn_shaft_low_grip_02 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_ml01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_ogryn_shaft_low_grip_helper_02" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_ogryn_shaft_low_grip_03 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_ml01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_ogryn_shaft_low_grip_helper_03" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_ogryn_shaft_low_grip_04 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_ml01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_ogryn_shaft_low_grip_helper_04" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		owo_ogryn_shaft_low_grip_05 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_ml01", type = current_type, 
			mesh_move = false, automatic_equip = { shaftac1 = "owo_ogryn_shaft_low_grip_helper_05" },
			hide_mesh = { {"shaft", 1,2,3,4,5,6,7,8,9,10,12,13,14,15 }, },
		},
		-- ### Helper Parts ###
		owo_ogryn_shaft_low_grip_helper_01 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_01", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_ogryn_shaft_low_grip_helper_02 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_02", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_ogryn_shaft_low_grip_helper_03 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_03", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_ogryn_shaft_low_grip_helper_04 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_04", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
		owo_ogryn_shaft_low_grip_helper_05 = {
			model = _item_melee.."/shafts/ogryn_pickaxe_shaft_05", type = "shaftac1", 
			mesh_move = false, parent = current_type,
		},
	})
end
function mod.fixes_owo_ogryn_shaft_low_grip(variant_id, given_type)
	local current_type = given_type or "shaft"

	local _owo_low_grip_ogryn_shafts = "owo_ogryn_shaft_low_grip_01|owo_ogryn_shaft_low_grip_02|owo_ogryn_shaft_low_grip_03|owo_ogryn_shaft_low_grip_04|owo_ogryn_shaft_low_grip_05|owo_ogryn_shaft_low_grip_06"

	mod.mt.inject_fixes(variant_id, {
		{   dependencies =  { _owo_low_grip_ogryn_shafts },
			shaft =  		{ offset = true, position = vector3_box(0, 0, 0.38), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
			shaftac1 = 		{ offset = true, position = vector3_box(0, 0, -0.28), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.5) },
			pommel = 		{ offset = true, position = vector3_box(0, 0, -0.48), },
		},
	})
end

-- Frontguard: Trench Dagger
--	Guards 1,2,6 SOMETIMES don't attach
function mod.owo_trench_dagger_guard(variant_id, given_type)
	local current_type = given_type or "frontguard"

    mod.inject_attachments_owo(variant_id, current_type, {
        {id = "owo_trench_dagger_finger_guard_01", name = "OwO Trench Dagger Guard 1"},
		{id = "owo_trench_dagger_finger_guard_02", name = "OwO Trench Dagger Guard 2"},
		{id = "owo_trench_dagger_finger_guard_03", name = "OwO Trench Dagger Guard 3"},
		{id = "owo_trench_dagger_finger_guard_04", name = "OwO Trench Dagger Guard 4"},
		{id = "owo_trench_dagger_finger_guard_05", name = "OwO Trench Dagger Guard 5"},
		{id = "owo_trench_dagger_finger_guard_06", name = "OwO Trench Dagger Guard 6"},
		{id = "owo_trench_dagger_finger_guard_knuckles_01", name = "OwO Knuckle Dusters 1"},
		{id = "owo_trench_dagger_finger_guard_knuckles_02", name = "OwO Knuckle Dusters 2"},
		{id = "owo_trench_dagger_finger_guard_knuckles_03", name = "OwO Knuckle Dusters 3"},
		{id = "owo_trench_dagger_finger_guard_knuckles_04", name = "OwO Knuckle Dusters 4"},
	})
	mod.inject_attachments_owo(variant_id, "frontguardac1", {
        {id = "owo_trench_dagger_finger_guard_helper_ac1", name = "OwO Knuckle'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "frontguardac2", {
        {id = "owo_trench_dagger_finger_guard_helper_ac2", name = "OwO Knuckle'vesa", no_randomize = true},
	})
	mod.inject_attachments_owo(variant_id, "frontguardac3", {
        {id = "owo_trench_dagger_finger_guard_helper_ac3", name = "OwO Knuckle'vesa", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_trench_dagger_finger_guard_01 = {
			model = _item_melee.."/grips/combat_blade_grip_01", type = current_type, 
			mesh_move = false, 
		},
		owo_trench_dagger_finger_guard_02 = {
			model = _item_melee.."/grips/combat_blade_grip_02", type = current_type, 
			mesh_move = false, 
		},
		owo_trench_dagger_finger_guard_03 = {
			model = _item_melee.."/grips/combat_blade_grip_04", type = current_type, 
			mesh_move = false, 
		},
		owo_trench_dagger_finger_guard_04 = {
			model = _item_melee.."/grips/combat_blade_grip_05", type = current_type, 
			mesh_move = false, 
		},
		owo_trench_dagger_finger_guard_05 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = current_type, 
			mesh_move = false, 
		},
		owo_trench_dagger_finger_guard_06 = {
			model = _item_melee.."/grips/combat_blade_grip_08", type = current_type, 
			mesh_move = false, 
		},
		owo_trench_dagger_finger_guard_knuckles_01 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				frontguardac1 = "owo_trench_dagger_finger_guard_helper_ac1_default",
				frontguardac2 = "owo_trench_dagger_finger_guard_helper_ac2_default",
				frontguardac3 = "owo_trench_dagger_finger_guard_helper_ac3_default",
			},
		},
		owo_trench_dagger_finger_guard_knuckles_02 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				frontguardac1 = "owo_trench_dagger_finger_guard_helper_ac1",
				frontguardac2 = "owo_trench_dagger_finger_guard_helper_ac2_default",
				frontguardac3 = "owo_trench_dagger_finger_guard_helper_ac3_default",
			},
		},
		owo_trench_dagger_finger_guard_knuckles_03 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				frontguardac1 = "owo_trench_dagger_finger_guard_helper_ac1",
				frontguardac2 = "owo_trench_dagger_finger_guard_helper_ac2",
				frontguardac3 = "owo_trench_dagger_finger_guard_helper_ac3_default",
			},
		},
		owo_trench_dagger_finger_guard_knuckles_04 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = current_type, 
			mesh_move = false, 
			automatic_equip = {
				frontguardac1 = "owo_trench_dagger_finger_guard_helper_ac1",
				frontguardac2 = "owo_trench_dagger_finger_guard_helper_ac2",
				frontguardac3 = "owo_trench_dagger_finger_guard_helper_ac3",
			},
		},
		-- ### Helper Parts ###
		owo_trench_dagger_finger_guard_helper_ac1 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = "frontguardac1", 
			mesh_move = false, 
		},
		owo_trench_dagger_finger_guard_helper_ac2 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = "frontguardac2", 
			mesh_move = false, 
		},
		owo_trench_dagger_finger_guard_helper_ac3 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = "frontguardac3", 
			mesh_move = false, 
		},
	})
end

-- Pommel: Shovel Handles
--  D-Ring Handle mostly (D-Handle, D-Grip, etc.)
--  ~~~~~~~~ Serrated Shovel ~~~~~~~~ this is literally already in the game dumb bitch
--  ~~~~~~~~ Sheathed Shovel ~~~~~~~~ the straps are too big and the actual bag is too small. straps are part of the bag mesh
function mod.owo_shovel_handles(variant_id, given_type)
	local current_type = given_type or "pommel"

	mod.inject_attachments_owo(variant_id, current_type, {
		{id = "owo_shovel_handles_01", name = "OwO E-Tool Tri-Fold (Slim)"},
        {id = "owo_shovel_handles_02", name = "OwO E-Tool Tri-Fold 1"},
        {id = "owo_shovel_handles_03", name = "OwO D-Ring Handle 1"},
        {id = "owo_shovel_handles_04", name = "OwO D-Ring Handle 1 (1)"},
        {id = "owo_shovel_handles_05", name = "OwO D-Ring Handle 1 (1f)"},
        --{id = "owo_shovel_handles_06", name = "OwO E-Tool D-Ring Handle 3"}, -- the wrapped grip one
		{id = "owo_shovel_handles_07b", name = "OwO D-Ring Handle 2"},
        {id = "owo_shovel_handles_07", name = "OwO D-Ring Handle 2 (Small)"},
        {id = "owo_shovel_handles_08", name = "OwO D-Ring Handle 3"},
        {id = "owo_shovel_handles_08b", name = "OwO D-Ring Handle 3 (Small)"},
		{id = "owo_shovel_handles_09", name = "OwO T-Handle 1"},
		{id = "owo_shovel_handles_10", name = "OwO T-Handle 2"},
		{id = "owo_shovel_handles_11", name = "OwO T-Handle 3"},
		{id = "owo_shovel_handles_12", name = "OwO T-Handle 4"},
		{id = "owo_shovel_handles_13", name = "OwO T-Handle 5"},
	})
    mod.inject_attachments_owo(variant_id, "pommelac1" or type, {
		{id = "owo_shovel_handles_ac1_01", name = "OwO E-Tool'vesa'ac1 1", no_randomize = true},
        {id = "owo_shovel_handles_ac1_02", name = "OwO E-Tool'vesa'ac1 2", no_randomize = true},
        --{id = "owo_shovel_handles_ac1_03", name = "OwO E-Tool'vesa'ac1 3", no_randomize = true},
        {id = "owo_shovel_handles_ac1_04", name = "OwO E-Tool'vesa'ac1 4", no_randomize = true},
        {id = "owo_shovel_handles_ac1_05", name = "OwO E-Tool'vesa'ac1 5", no_randomize = true},
	})
    mod.inject_attachments_owo(variant_id, "pommelac2" or type, {
		{id = "owo_shovel_handles_ac2_01", name = "OwO E-Tool'vesa'ac2 1", no_randomize = true},
        {id = "owo_shovel_handles_ac2_02", name = "OwO E-Tool'vesa'ac2 2", no_randomize = true},
		{id = "owo_shovel_handles_ac2_03", name = "OwO E-Tool'vesa'ac2 3", no_randomize = true},
		{id = "owo_shovel_handles_ac2_04", name = "OwO E-Tool'vesa'ac2 4", no_randomize = true},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
        --  Fucked up single /\ D-Ring Handle
        owo_shovel_handles_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = current_type, 
			mesh_move = false, 
		},
        --  Proper /\ D-Ring Handle
        owo_shovel_handles_02 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = current_type, 
			mesh_move = false, parent = "pommel",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_01", 
                pommelac2 = "owo_shovel_handles_ac2_01", 
			},
		},
        --  simple D-Ring Handle
        owo_shovel_handles_03 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_02", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        owo_shovel_handles_04 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_pommelac1_default", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        owo_shovel_handles_05 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_pommelac1_default", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        --  single D-Ring Handle, chainsword
        --owo_shovel_handles_06 = {
		--	model = _item_melee.."/grips/chain_sword_grip_01", type = current_type, 
		--	mesh_move = false, 
        --    automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_03", 
        --        pommelac2 = "owo_shovel_handles_ac2_empty", 
		--	},
		--},
        owo_shovel_handles_07 = {
			model = _item_melee.."/grips/chain_sword_grip_02", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_04", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
        owo_shovel_handles_08b = {
			model = _item_melee.."/grips/chain_sword_grip_05", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_05", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
		owo_shovel_handles_07b = {
			model = _item_melee.."/grips/chain_sword_grip_02", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_04", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
        owo_shovel_handles_08 = {
			model = _item_melee.."/grips/chain_sword_grip_05", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_05", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
		-- T-Handle
		--	Synthetic
		owo_shovel_handles_09 = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_01", 
			},
		},
		-- 	Wood T
		owo_shovel_handles_10 = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_03", 
			},
		},
		-- 	Super Wood T
		owo_shovel_handles_11 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_03", 
			},
		},
		--  Wood T Metal end
		owo_shovel_handles_12 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_04", 
			},
		},
		--  Double Metal T
		owo_shovel_handles_13 = {
			model = _item_melee.."/grips/chain_axe_grip_01", type = current_type, 
			mesh_move = false, 
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_04", 
			},
		},
        -- ### Helper Parts ###
		-- AC1
		--	/\ D-ring2
        owo_shovel_handles_ac1_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "pommelac1", 
			mesh_move = false, 
		},
		--	D-Ring2
        owo_shovel_handles_ac1_02 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommelac1", 
			mesh_move = false, 
		},
		-- 	Chainsword D-ring wrapped
        --owo_shovel_handles_ac1_03 = {
		--	model = _item_melee.."/grips/chain_sword_grip_01", type = "pommelac1", 
		--	mesh_move = false, 
		--},
		-- 	Chainsword D-ring
        owo_shovel_handles_ac1_04 = {
			model = _item_melee.."/grips/chain_sword_grip_02", type = "pommelac1", 
			mesh_move = false, 
		},
		-- 	Chainsword D-ring
        owo_shovel_handles_ac1_05 = {
			model = _item_melee.."/grips/chain_sword_grip_05", type = "pommelac1", 
			mesh_move = false, 
		},
		-- AC2
		--	Soft ogryn handle to grip
        owo_shovel_handles_ac2_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = "pommelac2", 
			mesh_move = false, 
		},
		--	Soft ogryn handle to pommel
        owo_shovel_handles_ac2_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = "pommelac2", 
			mesh_move = false, parent = "pommel",
		},
		-- 	Wood ogryn handle
		owo_shovel_handles_ac2_03 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = "pommelac2", 
			mesh_move = false, 
		},
		--  Metal handle 
		owo_shovel_handles_ac2_04 = {
			model = _item_melee.."/grips/chain_axe_grip_01", type = "pommelac2", 
			mesh_move = false, 
		},
	})
end

