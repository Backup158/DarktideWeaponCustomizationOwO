local mod = get_mod("weapon_customization_owo")
local ewc
local mt
local syn

-- Prints a message to the console log containing the current version number
mod.version = "0.1.0"
mod:info('v' .. mod.version .. ' loaded uwu nya :3')

-- Discord mode
-- Only needs to be checked at launch because the stuff it affects only runs at startup
mod.discord_mode = mod:get("discord_mode")

-- Locals from Weapon Customization plugin template
local pairs = pairs
local table = table
local vector3_box = Vector3Box
local table_clone = table.clone

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

-- ###################################################################
-- HELPER FUNCTIONS
-- ###################################################################
-- ######
-- 
-- *Directly* accesses the table
--		weapon {
--			slot1 = { }
--
--		}
-- ######
local function add_attachment_to_weapon(attachment_tables, weapon_id) 
	for slot, attachment_table_in_slot in pairs(attachment_tables) do
		for attachment_id, attachment_models in pairs(attachment_table_in_slot) do
			extended_weapon_customization_plugin.attachments[weapon_id][slot][attachment_id] = attachment_models
		end
	end
end

-- ###################################################################
-- ATTACHMENT CREATION
-- This needs to happen BEFORE all mods load, since that's when the base mod
-- ###################################################################

local extended_weapon_customization_plugin = {
	attachments = {
		autogun_p1_m1 = {
			muzzle = {
				owo_suppressor_01 = {
					replacement_path = _item_ranged.."/muzzles/owo_suppressor_01",
                    icon_render_unit_rotation_offset = {90, 0, 45},
                    icon_render_camera_position_offset = {-0.2, -2.75, 0.25},
				},
			},
		},
	}, 
	fixes = {

	},
	kitbash = {
		[_item_ranged.."/muzzles/owo_suppressor_01"] = {
            attachments = {
                base = {
                    item = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02",
                    fix = {
                        disable_in_ui = true,
                        offset = {
                            node = 1,
                            position = vector3_box(0, 0, 0.0),
                            rotation = vector3_box(0, 0, 0),
                            scale = vector3_box(1, 1, 1),
                        },
                    },
                    children = {
                        body_1 = {
                            item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                            fix = {
                                offset = {
                                    node = 1,
                                    position = vector3_box(0, 0.0, 0.0),
                                    rotation = vector3_box(0, 0, 0),
                                    scale = vector3_box(1.2, 1.8, 1.2),
                                },
                            },
                        },
						body_2 = {
                            item = _item_ranged.."/muzzles/autogun_rifle_ak_muzzle_03",
                            fix = {
                                offset = {
                                    node = 1,
                                    position = vector3_box(0, 0.0, 0.0),
                                    rotation = vector3_box(0, 22, 0),
                                    scale = vector3_box(1.2, 1.8, 1.2),
                                },
                            },
                        },
                    },
                },
            },
            display_name = "loc_owo_suppressor_01",
            description = "loc_description_owo_suppressor_01",
            attach_node = "ap_sight",
            dev_name = "owo_suppressor_01",
        },
	}
}

mod.extended_weapon_customization_plugin = extended_weapon_customization_plugin

function mod.on_setting_changed(setting_id)
	-- if Discord mode changed
	if setting_id == "discord_mode" then
		-- When turned on, print message 
		if mod:get(setting_id) == true then
			mod:echo(mod:localize("discord_mode_message"))
		end
	end
end

function mod.on_all_mods_loaded()
	-- Checks for installed mods. Kept here so it works after reload.
	--	Base Mod
	ewc = get_mod("extended_weapon_customization")
	if not ewc then
		mod:error("Extended Weapon Customization mod (the rebuild) required")
		return
	end
	mod.ewc = ewc
	--	Plugins
	--		Just so I know. Compatibility is only an issue of name collisions
	mt = get_mod("weapon_customization_mt_stuff")
    if mt then
    	mod:info("Uwusa haz MT stuffs :3")
    	return 
    end
    mod.mt = mt
	syn = get_mod("weapon_customization_syn_edits")
    if syn then
		mod:info("Uwusa haz Syn's Edits :3")
    end
    mod.syn = syn
end