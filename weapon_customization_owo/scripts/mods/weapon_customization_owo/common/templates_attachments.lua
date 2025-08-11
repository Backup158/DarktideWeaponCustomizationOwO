-- Create Custom Attachments
-- Is this even necessary?
mod.wc.add_custom_attachments.KUMQUAT = "KUMQUAT_list"
mod.wc.KUMQUAT_list = {
	"",
}

-- Functions to create attachments and universal fixes
function mod.owo_<NAME>(variant_id, given_type, given_parent)
	local current_type = given_type or "magazine"
	local current_parent = given_parent or "receiver"

	mod.inject_attachments_owo(variant_id, "", {
		{id = "owo_", name = "OwO "},
	})

	mod.inject_models(variant_id, {
		-- ### Base Parts ###
		owo_ = {
			model = _item_ranged.."", type = current_type, 
			mesh_move = false, parent = current_parent,
			automatic_equip = {
				 = "",
			},
		},
		-- ### Helper Parts ###
		owo_ = {
			model = _item_ranged.."", type = "", 
			mesh_move = false, parent = current_type,
		},
	})
end
function mod.fixes_owo_<NAME>(variant_id, given_type, given_parent)
	local current_type = given_type or "magazine"
	local current_parent = given_parent or "receiver"

	mod.mt.inject_fixes(variant_id, {
		-- ######
		-- Slot: NAME
		-- ######
	})
end