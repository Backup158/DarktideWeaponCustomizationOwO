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
	})
end

mod.mt.inject_fixes(this_variant, {
    {   dependencies = {"owo_",
        },
        grip = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
    },
})