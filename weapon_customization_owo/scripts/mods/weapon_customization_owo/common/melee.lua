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
-- HEAD
if mod.syn then
	mod.mt.table_append(mod.wc.head2s, {
		"owo_tacax_spike_helper_empty",
		"owo_tacax_spike_helper_01",
	})
else 
	mod.wc.add_custom_attachments.head2 = "head2s"
	mod.wc.head2s = {
		"owo_tacax_spike_helper_empty",
		"owo_tacax_spike_helper_01",
	}
end
-- BLADE
--[[
if mod.syn then
	mod.mt.table_append(mod.wc.bladeshrouds, {
		--"owo_slim_psword_helper_00",
		--"owo_slim_psword_helper_01",
	})
else 
	mod.wc.add_custom_attachments.bladeshroud = "bladeshrouds"
	mod.wc.bladeshrouds = {
		--"owo_slim_psword_helper_00",
		--"owo_slim_psword_helper_01",
	}
end
]]
-- POMMEL
mod.wc.add_custom_attachments.pommelac1 = "pommelac1_list"
mod.wc.pommelac1_list = {
	"owo_shovel_handles_ac1_empty",
    "owo_shovel_handles_ac1_01",
    "owo_shovel_handles_ac1_02",
    --"owo_shovel_handles_ac1_03",
    "owo_shovel_handles_ac1_04",
    "owo_shovel_handles_ac1_05",
}
mod.wc.add_custom_attachments.pommelac2 = "pommelac2_list"
mod.wc.pommelac2_list = {
	"owo_shovel_handles_ac2_empty",
    "owo_shovel_handles_ac2_01",
    "owo_shovel_handles_ac2_02",
    "owo_shovel_handles_ac2_03",
}
-- frontguard
mod.wc.add_custom_attachments.frontguard = "frontguard_list"
mod.wc.frontguard_list = {
	"owo_trench_dagger_finger_guard_default",
	"owo_trench_dagger_finger_guard_01",
	"owo_trench_dagger_finger_guard_02",
	"owo_trench_dagger_finger_guard_03",
	"owo_trench_dagger_finger_guard_04",
	"owo_trench_dagger_finger_guard_05",
	"owo_trench_dagger_finger_guard_06",
}
table.insert(mod.wc.attachment_slots, "frontguard")
mod:add_global_localize_strings({
    loc_weapon_cosmetics_customization_frontguard = {
        en = "Front Guard",
	},
})

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
-- Head: Tacax Spike (Spiked Tactical Axe)
function mod.owo_tacax_spike(variant_id, type)
	mod.inject_attachments_owo(variant_id, "head" or type, {
		{id = "owo_tacax_spike_01", name = "OwO Spiked Tactical Axe 1"},
	})
    mod.inject_attachments_owo(variant_id, "head2" or type, {
        {id = "owo_tacax_spike_helper_empty", name = "OwO Empty Head2"},
		{id = "owo_tacax_spike_helper_01", name = "OwO Tacax'vesa 1"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_tacax_spike_01 = {
			model = _item_melee.."/heads/hatchet_head_01", type = "head", 
			mesh_move = false, parent = "grip",
			automatic_equip = {
				head2 = "owo_tacax_spike_helper_01",
			},
		},
		-- ### Helper Parts ###
		owo_tacax_spike_helper_01 = {
			model = _item_melee.."/heads/axe_head_03", type = "head2", 
			mesh_move = false, parent = "head",
		},
		-- ### Empty ###
		owo_tacax_spike_helper_empty = {
			model = "", type = "head2", 
			mesh_move = false, parent = "head"
		},
	})
end

-- Body: Rapier Blades
function mod.owo_rapier_blade(variant_id, type)
	mod.inject_attachments_owo(variant_id, "body" or type, {
		{id = "owo_rapier_blade_01", name = "OwO Rapier Blade 1"},
		{id = "owo_rapier_blade_02", name = "OwO Rapier Blade 2"},
		{id = "owo_rapier_blade_03", name = "OwO Rapier Blade 3"},
		{id = "owo_rapier_blade_04", name = "OwO Rapier Blade 4"},
		{id = "owo_rapier_blade_05", name = "OwO Rapier Blade 5"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_rapier_blade_01 = {
			model = _item_melee.."/blades/combat_knife_blade_03", type = "body", 
			mesh_move = false, parent = "grip",
		},
		owo_rapier_blade_02 = {
			model = _item_melee.."/blades/combat_knife_blade_06", type = "body", 
			mesh_move = false, parent = "grip",
		},
		owo_rapier_blade_03 = {
			model = _item_melee.."/blades/force_sword_blade_01", type = "body", 
			mesh_move = false, parent = "grip",
		},
		owo_rapier_blade_04 = {
			model = _item_melee.."/blades/force_sword_blade_03", type = "body", 
			mesh_move = false, parent = "grip",
		},
		owo_rapier_blade_05 = {
			model = _item_melee.."/blades/force_sword_blade_04", type = "body", 
			mesh_move = false, parent = "grip",
		},
	})
end

-- Blade: Slim Power Sword
--	Blade 4 doesn't exist
function mod.owo_slim_psword(variant_id, type)
	mod.inject_attachments_owo(variant_id, "blade" or type, {
		{id = "owo_slim_psword_01", name = "OwO Slim PSword 1"},
		{id = "owo_slim_psword_02", name = "OwO Slim PSword 2"},
		{id = "owo_slim_psword_03", name = "OwO Slim PSword 3"},
		--{id = "owo_slim_psword_04", name = "OwO Slim PSword 4"},
		{id = "owo_slim_psword_05", name = "OwO Slim PSword 4"},
		{id = "owo_slim_psword_06", name = "OwO Slim PSword 5"},
		{id = "owo_slim_psword_07", name = "OwO Slim PSword 6"},
		{id = "owo_slim_psword_08", name = "OwO Slim PSword 7 (M)"},
		{id = "owo_slim_psword_01t", name = "OwO Thin PSword 1"},
		{id = "owo_slim_psword_02t", name = "OwO Thin PSword 2"},
		{id = "owo_slim_psword_03t", name = "OwO Thin PSword 3"},
		--{id = "owo_slim_psword_04t", name = "OwO Slim PSword 4"},
		{id = "owo_slim_psword_05t", name = "OwO Thin PSword 4"},
		{id = "owo_slim_psword_06t", name = "OwO Thin PSword 5"},
		{id = "owo_slim_psword_07t", name = "OwO Thin PSword 6"},
		{id = "owo_slim_psword_08t", name = "OwO Thin PSword 7 (M)"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_slim_psword_01 = {
			model = _item_melee.."/blades/power_sword_blade_01", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_02 = {
			model = _item_melee.."/blades/power_sword_blade_02", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_03 = {
			model = _item_melee.."/blades/power_sword_blade_03", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		--owo_slim_psword_04 = {
		--	model = _item_melee.."/blades/power_sword_blade_04", type = "blade", 
		--	mesh_move = false, parent = "hilt",
		--},
		owo_slim_psword_05 = {
			model = _item_melee.."/blades/power_sword_blade_06", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_06 = {
			model = _item_melee.."/blades/power_sword_blade_06", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_07 = {
			model = _item_melee.."/blades/power_sword_blade_07", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_08 = {
			model = _item_melee.."/blades/power_sword_blade_ml01", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_01t = {
			model = _item_melee.."/blades/power_sword_blade_01", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_02t = {
			model = _item_melee.."/blades/power_sword_blade_02", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_03t = {
			model = _item_melee.."/blades/power_sword_blade_03", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		--owo_slim_psword_04t = {
		--	model = _item_melee.."/blades/power_sword_blade_04", type = "blade", 
		--	mesh_move = false, parent = "hilt",
		--},
		owo_slim_psword_05t = {
			model = _item_melee.."/blades/power_sword_blade_06", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_06t = {
			model = _item_melee.."/blades/power_sword_blade_06", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_07t = {
			model = _item_melee.."/blades/power_sword_blade_07", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
		owo_slim_psword_08t = {
			model = _item_melee.."/blades/power_sword_blade_ml01", type = "blade", 
			mesh_move = false, parent = "hilt",
		},
	})
end

-- Frontguard: Trench Dagger
--	Guards 1,2,6 SOMETIMES don't attach
function mod.owo_trench_dagger_guard(variant_id, type)
    mod.inject_attachments_owo(variant_id, "frontguard" or type, {
        {id = "owo_trench_dagger_finger_guard_default", name = "Default"},
		{id = "owo_trench_dagger_finger_guard_01", name = "OwO Trench Dagger Guard 1"},
		{id = "owo_trench_dagger_finger_guard_02", name = "OwO Trench Dagger Guard 2"},
		{id = "owo_trench_dagger_finger_guard_03", name = "OwO Trench Dagger Guard 3"},
		{id = "owo_trench_dagger_finger_guard_04", name = "OwO Trench Dagger Guard 4"},
		{id = "owo_trench_dagger_finger_guard_05", name = "OwO Trench Dagger Guard 5"},
		{id = "owo_trench_dagger_finger_guard_06", name = "OwO Trench Dagger Guard 6"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_trench_dagger_finger_guard_default = {
			model = "", type = "frontguard", 
			mesh_move = false, parent = "grip"
		},
		owo_trench_dagger_finger_guard_01 = {
			model = _item_melee.."/grips/combat_blade_grip_01", type = "frontguard", 
			mesh_move = false, parent = "grip",
		},
		owo_trench_dagger_finger_guard_02 = {
			model = _item_melee.."/grips/combat_blade_grip_02", type = "frontguard", 
			mesh_move = false, parent = "grip",
		},
		owo_trench_dagger_finger_guard_03 = {
			model = _item_melee.."/grips/combat_blade_grip_04", type = "frontguard", 
			mesh_move = false, parent = "grip",
		},
		owo_trench_dagger_finger_guard_04 = {
			model = _item_melee.."/grips/combat_blade_grip_05", type = "frontguard", 
			mesh_move = false, parent = "grip",
		},
		owo_trench_dagger_finger_guard_05 = {
			model = _item_melee.."/grips/combat_blade_grip_06", type = "frontguard", 
			mesh_move = false, parent = "grip",
		},
		owo_trench_dagger_finger_guard_06 = {
			model = _item_melee.."/grips/combat_blade_grip_08", type = "frontguard", 
			mesh_move = false, parent = "grip",
		},
	})
end

-- Pommel: Shovel Handles
--  D-Ring Handle mostly (D-Handle, D-Grip, etc.)
--  ~~~~~~~~ Serrated Shovel ~~~~~~~~ this is literally already in the game dumb bitch
--  ~~~~~~~~ Sheathed Shovel ~~~~~~~~ the straps are too big and the actual bag is too small. straps are part of the bag mesh
function mod.owo_shovel_handles(variant_id, type)
	mod.inject_attachments_owo(variant_id, "pommel" or type, {
		{id = "owo_shovel_handles_01", name = "OwO E-Tool Tri-Fold (Slim)"},
        {id = "owo_shovel_handles_02", name = "OwO E-Tool Tri-Fold 1"},
        {id = "owo_shovel_handles_03", name = "OwO E-Tool Tri-Fold 2"},
        {id = "owo_shovel_handles_04", name = "OwO E-Tool Tri-Fold 2 (1)"},
        {id = "owo_shovel_handles_05", name = "OwO E-Tool Tri-Fold 2 (1f)"},
        --{id = "owo_shovel_handles_06", name = "OwO E-Tool D-Ring Handle 3"}, -- the wrapped grip one
        {id = "owo_shovel_handles_07", name = "OwO D-Ring Handle 3"},
        {id = "owo_shovel_handles_08", name = "OwO D-Ring Handle 4"},
		{id = "owo_shovel_handles_09", name = "OwO T-Handle 1"},
		{id = "owo_shovel_handles_10", name = "OwO T-Handle 2"},
		{id = "owo_shovel_handles_11", name = "OwO T-Handle 3"},
		{id = "owo_shovel_handles_12", name = "OwO T-Handle 4"},
		{id = "owo_shovel_handles_13", name = "OwO T-Handle 5"},
	})
    mod.inject_attachments_owo(variant_id, "pommelac1" or type, {
		{id = "owo_shovel_handles_ac1_empty", name = "OwO Empty Pommelac1"},
        {id = "owo_shovel_handles_ac1_01", name = "OwO E-Tool'vesa'ac1 1"},
        {id = "owo_shovel_handles_ac1_02", name = "OwO E-Tool'vesa'ac1 2"},
        --{id = "owo_shovel_handles_ac1_03", name = "OwO E-Tool'vesa'ac1 3"},
        {id = "owo_shovel_handles_ac1_04", name = "OwO E-Tool'vesa'ac1 4"},
        {id = "owo_shovel_handles_ac1_05", name = "OwO E-Tool'vesa'ac1 5"},
	})
    mod.inject_attachments_owo(variant_id, "pommelac2" or type, {
		{id = "owo_shovel_handles_ac2_empty", name = "OwO Empty Pommelac1"},
        {id = "owo_shovel_handles_ac2_01", name = "OwO E-Tool'vesa'ac2 1"},
        {id = "owo_shovel_handles_ac2_02", name = "OwO E-Tool'vesa'ac2 2"},
		{id = "owo_shovel_handles_ac2_03", name = "OwO E-Tool'vesa'ac2 3"},
		{id = "owo_shovel_handles_ac2_04", name = "OwO E-Tool'vesa'ac2 4"},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
        --  Fucked up single /\ D-Ring Handle
        owo_shovel_handles_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_05", type = "pommel", 
			mesh_move = false, parent = "grip",
		},
        --  Proper /\ D-Ring Handle
        owo_shovel_handles_02 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "pommel", 
			mesh_move = false, parent = "pommel",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_01", 
                pommelac2 = "owo_shovel_handles_ac2_01", 
			},
		},
        --  simple D-Ring Handle
        owo_shovel_handles_03 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_02", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        owo_shovel_handles_04 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        owo_shovel_handles_05 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_02", 
			},
		},
        --  single D-Ring Handle, chainsword
        --owo_shovel_handles_06 = {
		--	model = _item_melee.."/grips/chain_sword_grip_01", type = "pommel", 
		--	mesh_move = false, parent = "grip",
        --    automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_03", 
        --        pommelac2 = "owo_shovel_handles_ac2_empty", 
		--	},
		--},
        owo_shovel_handles_07 = {
			model = _item_melee.."/grips/chain_sword_grip_02", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_04", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
        owo_shovel_handles_08 = {
			model = _item_melee.."/grips/chain_sword_grip_05", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_05", 
                pommelac2 = "owo_shovel_handles_ac2_empty", 
			},
		},
		-- T-Handle
		--	Synthetic
		owo_shovel_handles_09 = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_01", 
			},
		},
		-- 	Wood T
		owo_shovel_handles_10 = {
			model = _item_melee.."/grips/combat_knife_grip_01", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_03", 
			},
		},
		-- 	Super Wood T
		owo_shovel_handles_11 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_03", 
			},
		},
		--  Wood T Metal end
		owo_shovel_handles_12 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_04", 
			},
		},
		--  Double Metal T
		owo_shovel_handles_13 = {
			model = _item_melee.."/grips/chain_axe_grip_01", type = "pommel", 
			mesh_move = false, parent = "grip",
            automatic_equip = { pommelac1 = "owo_shovel_handles_ac1_empty", 
                pommelac2 = "owo_shovel_handles_ac2_04", 
			},
		},
        -- ### Helper Parts ###
		-- AC1
		--	/\ D-ring2
        owo_shovel_handles_ac1_01 = {
			model = _item_ranged.."/stocks/shotgun_rifle_stock_01", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
		--	D-Ring2
        owo_shovel_handles_ac1_02 = {
			model = _item_melee.."/grips/power_sword_grip_04", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
		-- 	Chainsword D-ring wrapped
        --owo_shovel_handles_ac1_03 = {
		--	model = _item_melee.."/grips/chain_sword_grip_01", type = "pommelac1", 
		--	mesh_move = false, parent = "grip",
		--},
		-- 	Chainsword D-ring
        owo_shovel_handles_ac1_04 = {
			model = _item_melee.."/grips/chain_sword_grip_02", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
		-- 	Chainsword D-ring
        owo_shovel_handles_ac1_05 = {
			model = _item_melee.."/grips/chain_sword_grip_05", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
		-- AC2
		--	Soft ogryn handle to grip
        owo_shovel_handles_ac2_01 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = "pommelac2", 
			mesh_move = false, parent = "grip",
		},
		--	Soft ogryn handle to pommel
        owo_shovel_handles_ac2_02 = {
			model = _item_ranged.."/handles/combat_blade_handle_03", type = "pommelac2", 
			mesh_move = false, parent = "pommel",
		},
		-- 	Wood ogryn handle
		owo_shovel_handles_ac2_03 = {
			model = _item_ranged.."/handles/combat_blade_handle_01", type = "pommelac2", 
			mesh_move = false, parent = "grip",
		},
		--  Metal handle 
		owo_shovel_handles_ac2_04 = {
			model = _item_melee.."/grips/chain_axe_grip_01", type = "pommelac2", 
			mesh_move = false, parent = "grip",
		},
        -- ### Empty Parts ###
        owo_shovel_handles_ac1_empty = {
			model = "", type = "pommelac1", 
			mesh_move = false, parent = "grip",
		},
        owo_shovel_handles_ac2_empty = {
			model = "", type = "pommelac2", 
			mesh_move = false, parent = "grip",
		},
	})
end

