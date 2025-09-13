local mod = get_mod("extended_weapon_customization_owo")

-- ###################################################################
-- DATA
-- ###################################################################
-- Prints a message to the console log containing the current version number
mod.version = "0.1.0"
mod:info('v' .. mod.version .. ' loaded uwu nya :3')

-- Discord mode
-- Only needs to be checked at launch because the stuff it affects only runs at startup
mod.discord_mode = mod:get("discord_mode")
local debug_mode = mod:get("debug_mode")
if debug_mode then mod:info('Debug mode active. Verbose logging in effect.') end

-- ################################
-- Local References for Performance
-- ################################
local pairs = pairs
local string = string
local table = table
local vector3 = Vector3
local vector3_box = Vector3Box
local vector3_one = vector3.one
local vector3_zero = vector3.zero
local table_clone = table.clone
local table_clone_safe = table.clone_safe

-- ################################
-- Game Content Address Shortcuts
-- ################################
-- List of weapons from game code
local WeaponTemplates = require("scripts/settings/equipment/weapon_templates/weapon_templates")

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

-- ################################
-- Table to Hold all Attachments
-- ################################
local attachments_table_for_ewc = {
	attachments = {

	}, 
	fixes = {

	},
	kitbashs = {
		
	}
}

-- ###################################################################
-- HELPER FUNCTIONS
-- ###################################################################
-- ################################
-- Other Helpers
-- ################################
-- ######
-- String is key in table?
-- ######
local function string_is_key_in_table(string_to_find, table_to_search)
    for key, _ in pairs(table_to_search) do
        if string_to_find == key then
            return true
        end
    end
    return false
end

-- ################################
-- Adding Directly to the Attachments Table
-- ################################
-- ######
-- Add Attachment to Weapon
-- ######
local function add_attachment_to_weapon(attachment_tables, weapon_id, slot) 
	for attachment_id, attachment_models in pairs(attachment_tables) do
        -- Creates table keys if they don't exist
        if not attachments_table_for_ewc.attachments[weapon_id] then
		    attachments_table_for_ewc.attachments[weapon_id] = {}
            attachments_table_for_ewc.attachments[weapon_id][slot] = {}
        elseif not attachments_table_for_ewc.attachments[weapon_id][slot] then
		    attachments_table_for_ewc.attachments[weapon_id][slot] = {}
        end
        -- Adds attachments
        --  Check to prevent overwriting
        if not attachments_table_for_ewc.attachments[weapon_id][slot][attachment_id] then
		    attachments_table_for_ewc.attachments[weapon_id][slot][attachment_id] = attachment_models
        end
    end
end

-- ######
-- Add Fixes to Weapon
-- ######
local function add_fixes_to_weapon(fixes_tables, weapon_id) 
	for _, fix_table in pairs(fixes_tables) do
		table.append(attachments_table_for_ewc.fixes[weapon_id], fix_table)
    end
end

-- ######
-- Add Kitbashes to Weapon
-- ######
local function add_kitbashes_to_weapon(kitbash_tables, weapon_id) 
	for kitbash_key, kitbash_table in pairs(kitbash_tables) do
        if not attachments_table_for_ewc.kitbashs[kitbash_key] then
		    attachments_table_for_ewc.kitbashs[kitbash_key] = kitbash_table
        end
    end
end

-- ######
-- Add an Attachment with Fixes to Weapon
-- Calls the previous three functions
-- ######
local function add_all_tables_to_weapon(attachment_blob, weapon_id, slot)
    if not slot then
        mod:error("Weapon slot missing! "..weapon_id..": "..attachment_blob[name])
        return
    end
    add_attachment_to_weapon(attachment_blob.attachments, weapon_id, slot)
    add_fixes_to_weapon(attachment_blob.fixes, weapon_id)
    add_kitbashes_to_weapon(attachment_blob.kitbashs, weapon_id)
end

-- ######
-- Add an Attachment with Fixes to Multiple Weapons
-- Calls the previous function for all given weapons
-- ######
local function add_attachments_to_list_of_weapons(attachment_blob, weapons_list, slot)
    for _, weapon_id in ipairs(weapons_list) do
        add_all_tables_to_weapon(attachment_blob, weapon_id, slot)
    end
end

-- ######
-- Copy Attachments from First Mark
-- ######
local function copy_attachments_from_first_mark(weapon_id)
    -- Replaces the final character (if it's a digit) with 1
    --  autogun_p1_m2 --> autogun_p1_m1
    local first_mark = string.gsub(weapon_id, "%d$", "1")
    if not attachments_table_for_ewc.attachments[first_mark] then
        mod:error("No attachments found for "..first_mark)
        return
    end
    attachments_table_for_ewc.attachments[weapon_id] = table_clone(attachments_table_for_ewc.attachments[first_mark])
end

-- ######
-- Copy Attachments to Siblings
-- ######
local function copy_attachments_to_siblings(first_mark_id)
    -- from 2 to 3
    for i = 2, 3 do
        local weapon_id = string.gsub(first_mark_id, "1$", tostring(i))
        if string_is_key_in_table(weapon_id, WeaponTemplates) then
            if debug_mode then mod:info("Copying to sibling: "..first_mark_id.." --> "..weapon_id) end
            attachments_table_for_ewc.attachments[weapon_id] = table_clone(attachments_table_for_ewc.attachments[first_mark_id])
        else
            if debug_mode then mod:info("This is not a real weapon: "..weapon_id) end
            return
        end
    end
end

-- ###################################################################
-- ATTACHMENT CREATION
-- This needs to happen BEFORE all mods load, since that's when the base mod gets the tables from the plugins
--
-- Placeholder for notes
-- replacement_path is added to master items table? it's the name for our item
--  causes issue with how did i get that (and presumably any other mod that tries to work with that table)
--  if you use a default item name, you wont load the kitbash stuff
--  match with kitbash key name or else master items will kill itself in the console log
-- kitbash key name is your item's name
--  using an existing one crashes
-- ###################################################################
-- ################################
-- Defining Attachment Functions
-- also has a NAME key that gets used for debugging
-- ################################
local function owo_suppressor()
    return {
        name = "owo_suppressor",
        attachments = {
            owo_suppressor_01 = {
                replacement_path = _item_ranged.."/muzzles/owo_suppressor_01",
                --replacement_path = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02",
                icon_render_unit_rotation_offset = {90, 0, 30},
                icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
            },
        },
        fixes = {

        },
        kitbashs = {
            [_item_ranged.."/muzzles/owo_suppressor_01"] = {
                attachments = {
                    base = {
                        --item = _item_ranged.."/muzzles/lasgun_rifle_krieg_muzzle_02",
                        item = _item_empty_trinket,
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
                            muzzle_ac1 = {
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
                            muzzle_ac2 = {
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
                attach_node = "ap_muzzle_01",
                dev_name = "owo_suppressor_01",
            },
        }
    }
end

-- ################################
-- Adding Attachments
-- ################################
add_attachments_to_list_of_weapons(owo_suppressor(), {"autogun_p1_m1", "lasgun_p1_m1"}, "muzzle")

-- ################################
-- Copying to Different Marks
-- ################################
for weapon_id, _ in pairs(attachments_table_for_ewc.attachments) do
    -- If first mark of pattern, copy to the siblings
    --  Check last two characters of the name
    --  if mark 1, copy to mk 2 and 3 if they exist (handled in that function)
    -- Since we're adding the siblings to the 
    if (string.sub(weapon_id, -2) == "m1") then
        copy_attachments_to_siblings(weapon_id)
    end
end

-- ################################
-- **Sending it to the actual table that gets read by the base mod**
-- ################################
mod.extended_weapon_customization_plugin = attachments_table_for_ewc

-- ###################################################################
-- HOOKS
-- Mostly for debugging stuff
-- ###################################################################
function mod.on_setting_changed(setting_id)
	-- if Discord mode changed
	if setting_id == "discord_mode" then
		-- When turned on, print message 
		if mod:get(setting_id) == true then
			mod:echo(mod:localize("discord_mode_message"))
		end
    --[[
    -- debug mode only matters at startup so idc if you change it midgame
    elseif setting_id == "debug_mode" then
        debug_mode = mod:get(setting_id)
        if debug_mode then
            mod:info('Debug mode active. Verbose logging in effect.')
        else
            mod:info('Debug mode disabled.')
        end
    ]]
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
    --  Outdated base mod
    wc = get_mod("weapon_customization")
	if wc then
		mod:error("You are using the OLD version of Weapon Customization! This plugin is for the new, rebuilt version.")
		return
	end
	--	Plugins
	--		Just so I know. Compatibility is only an issue of name collisions
	mt = get_mod("weapon_customization_mt_stuff")
    if mt then
    	mod:info("Uwusa haz MT stuffs :3")
    	return 
    end
	syn = get_mod("weapon_customization_syn_edits")
    if syn then
		mod:info("Uwusa haz Syn's Edits :3")
    end
end