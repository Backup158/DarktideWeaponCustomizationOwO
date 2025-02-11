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
-- HEAD ADDITIONS
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

-- ############################################
-- Injection Definitions
-- inject_attachments_owo injects attachment descriptions first
-- inject_models adds the models for actual use
-- ############################################
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