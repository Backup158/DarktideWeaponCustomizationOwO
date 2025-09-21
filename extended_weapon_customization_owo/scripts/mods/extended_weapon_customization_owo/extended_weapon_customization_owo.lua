local mod = get_mod("extended_weapon_customization_owo")

-- ###################################################################
-- DATA
-- ###################################################################
-- Prints a message to the console log containing the current version number
mod.version = "4.0.0"
mod:info('v' .. mod.version .. ' loaded uwu nya :3')

-- Discord mode
-- Only needs to be checked at launch because the stuff it affects only runs at startup
mod.discord_mode = mod:get("discord_mode")
local debug_mode = mod:get("debug_mode")
if debug_mode then mod:info('UwU Debug mowode a-active :3. Vewbose w-w-wogging in effect.') end

-- ################################
-- Local References for Performance
-- ################################
--[[
local vector3 = Vector3
local vector3_box = Vector3Box
]]

local pairs = pairs
local string = string
local string_sub = string.sub
local string_gsub = string.gsub
local tostring = tostring
local table = table
local table_insert = table.insert
local table_clone = table.clone
-- ################################
-- Game Content Addresses
-- ################################
--[[
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"
]]

-- ################################
-- Requires
-- ################################
-- List of weapons from game code
local WeaponTemplates = require("scripts/settings/equipment/weapon_templates/weapon_templates")

-- ################################
-- Table to Hold all Attachments
-- ################################
local attachments_table_for_ewc = {
	attachments = {
        --[[
        -- for muzzle flash test
        autogun_p1_m1 = {
            muzzle = {
                owo_nyaaaaa = {   
                    replacement_path = "content/items/weapons/player/ranged/muzzles/autogun_rifle_muzzle_01",
                    icon_render_unit_rotation_offset = {90, 0, 30},
                    icon_render_camera_position_offset = {-0.2, -1.75, 0.15},
                },
            }
        }
        ]]
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
-- RETURN: boolean; was the key found?
-- ######
local function string_is_key_in_table(string_to_find, table_to_search)
    if table_to_search[string_to_find] then
        return true
    else
        -- Checks if key is in table but is just has nil value
        for key, _ in pairs(table_to_search) do
            if string_to_find == key then
                return true
            end
        end
        return false
    end
end

-- ######
-- Load Mod File
-- DESCRIPTION: Runs a file in the mod's folder
-- PARAMETERS:
--  relative_path: string; path to the file without the extension; e.g. "melee/autogun_gooning"
-- RETURN: N/A
-- ######
local function load_mod_file(relative_path)
	mod:io_dofile("extended_weapon_customization_owo/scripts/mods/extended_weapon_customization_owo/"..relative_path)
end

-- ######
-- Print if Debug
-- DESCRIPTION: Logs text in console if debug is on
-- PARAMETERS:
--  message: string
-- RETURN: N/A
-- ######
local function info_if_debug(message)
    if debug_mode then
        mod:info(tostring(message))
    end
end

-- ################################
-- Adding Directly to the Attachments Table
-- ################################
-- ######
-- Add Attachment to Weapon
-- DESCRIPTION: Given a table of attachments, insert them into the table to send back to the base mod later
-- PARAMETERS: 
--  attachment_tables: table of (string, table) pairs
--  weapon_id: string
--  slot: string
-- RETURN: N/A
-- ######
local function add_attachment_to_weapon(attachment_tables, weapon_id, slot) 
	for attachment_id, attachment_models in pairs(attachment_tables) do
        -- Creates table keys if they don't exist
        if not attachments_table_for_ewc.attachments[weapon_id] then
            info_if_debug("Initializing table entry for "..weapon_id..": "..slot)
		    attachments_table_for_ewc.attachments[weapon_id] = {}
            attachments_table_for_ewc.attachments[weapon_id][slot] = {}
        elseif not attachments_table_for_ewc.attachments[weapon_id][slot] then
            info_if_debug("Initializing only slot for "..weapon_id..": "..slot)
		    attachments_table_for_ewc.attachments[weapon_id][slot] = {}
        end
        -- Adds attachments
        --  Check to prevent overwriting
        if not attachments_table_for_ewc.attachments[weapon_id][slot][attachment_id] then
		    attachments_table_for_ewc.attachments[weapon_id][slot][attachment_id] = attachment_models
        else
            info_if_debug("Duplicate attachment found: "..weapon_id.."; "..slot.."; "..attachment_id)
        end
    end
end

-- ######
-- Add Fixes to Weapon
-- DESCRIPTION: Given a table of fixes, insert them into the table to send back to the base mod later
-- PARAMETERS: 
--  fixes_table: table of tables
-- RETURN: N/A
-- ######
local function add_fixes_to_weapon(fixes_tables) 
	for _, fix_table in pairs(fixes_tables) do
		table_insert(attachments_table_for_ewc.fixes, fix_table)
    end
end

-- ######
-- Add Kitbashes to Weapon
-- DESCRIPTION: Given a table of kitbashes, insert them into the table to send back to the base mod later
-- PARAMETERS: 
--  kitbash_tables: table of (string, table) pairs
-- RETURN: N/A
-- ######
local function add_kitbashes_to_weapon(kitbash_tables) 
	for kitbash_key, kitbash_table in pairs(kitbash_tables) do
        if not attachments_table_for_ewc.kitbashs[kitbash_key] then
		    attachments_table_for_ewc.kitbashs[kitbash_key] = kitbash_table
        end
    end
end

-- ######
-- Add an Attachment with Fixes to Weapon
-- DESCRIPTION: Calls the previous three functions. See them for details
-- PARAMETERS: 
--  attachment_blob: table of tables
--      attachments = { tables }
--      fixes = { tables }
--      kitbashes = { tables }
-- ######
local function add_all_tables_to_weapon(attachment_blob, weapon_id, slot)
    if not slot then
        mod:error("Weapon slot missing! "..weapon_id..": "..attachment_blob[name])
        return
    end
    add_attachment_to_weapon(attachment_blob.attachments, weapon_id, slot)
    add_fixes_to_weapon(attachment_blob.fixes)
    add_kitbashes_to_weapon(attachment_blob.kitbashs)
end

-- ######
-- Add an Attachment with Fixes to Multiple Weapons
-- DESCRIPTION: Calls the previous function for all given weapons
-- PARAMETERS:
--  weapons_list: table of strings
-- ######
local function add_attachments_to_list_of_weapons(attachment_blob, weapons_list, slot)
    for _, weapon_id in ipairs(weapons_list) do
        -- info_if_debug("Adding attachments to "..weapon_id)
        add_all_tables_to_weapon(attachment_blob, weapon_id, slot)
    end
end

-- ######
-- Copy Attachments from A to B
-- DESCRIPTION: Copies table of attachments from one weapon to another
-- PARAMETERS: 
--  weapon_id_A: string; the source
--  weapon_id_B: string; the destination
-- RETURN: N/A
-- ######
local function copy_attachments_from_A_to_B(weapon_id_A, weapon_id_B)
    -- If source does not exist
    if not attachments_table_for_ewc.attachments[weapon_id_A] then
        mod:error("No attachments found for "..weapon_id_A)
        return
    end
    attachments_table_for_ewc.attachments[weapon_id_B] = table_clone(attachments_table_for_ewc.attachments[weapon_id_A])
end

-- ######
-- Copy Attachments from First Mark
-- DESCRIPTION: Given a weapon that isn't the first mark, copy attachments from the first one
-- PARAMETERS: 
--  weapon_id: string
-- RETURN: N/A
-- ######
local function copy_attachments_from_first_mark(weapon_id)
    -- if (string_sub(weapon_id, -2) == "m1") then return end

    -- Replaces the final character (if it's a digit) with 1
    --  autogun_p1_m2 --> autogun_p1_m1
    local first_mark_id = string.gsub(weapon_id, "%d$", "1")

    -- error checking is handled there 
    copy_attachments_from_A_to_B(first_mark_id, weapon_id)
end

-- ######
-- Copy Attachments to Siblings
-- DESCRIPTION: Given the first mark of a weapon, copy attachments to marks 2 and 3, if they exist
-- PARAMETERS: 
--  first_mark_id: string
-- RETURN: N/A
-- ######
local function copy_attachments_to_siblings(first_mark_id)
    if not type(first_mark_id) == "string" then
        mod:error("uwu first_mark_id is not a string")
        return
    end
    info_if_debug("\tCopying attachments to siblings of "..first_mark_id)
    -- from 2 to 3
    for i = 2, 3 do
        local weapon_id = string_gsub(first_mark_id, "1$", tostring(i))
        if string_is_key_in_table(weapon_id, WeaponTemplates) then
            if debug_mode then mod:info("\t\tuwu Copying to sibling: "..first_mark_id.." --> "..weapon_id) end
            copy_attachments_from_A_to_B(first_mark_id, weapon_id)
        else
            if debug_mode then mod:info("\t\tuwu This is not a real weapon: "..weapon_id) end
        end
    end
end

-- ###################################################################
-- ATTACHMENT CREATION
-- This needs to happen BEFORE all mods load, since that's when the base mod gets the tables from the plugins
-- ###################################################################
load_mod_file("create_attachments")

-- ################################
-- Adding Attachments
-- ################################
add_attachments_to_list_of_weapons(mod.owo_suppressor(), {"autogun_p1_m1", "autopistol_p1_m1", "bolter_p1_m1", "boltpistol_p1_m1", "lasgun_p1_m1", "lasgun_p2_m1", "lasgun_p3_m1", }, "muzzle")
add_attachments_to_list_of_weapons(mod.owo_tactical_stock(), {"autogun_p1_m1", "autopistol_p1_m1", "bolter_p1_m1", "boltpistol_p1_m1", "lasgun_p1_m1", "lasgun_p2_m1", }, "stock")
add_attachments_to_list_of_weapons(mod.probe_for_node(), {"lasgun_p2_m1", }, "stock")

-- ################################
-- Manual Overrides for Attachments
-- ################################

-- ################################
-- Copying to Different Marks
-- ################################
-- Autoguns: Propagate Infantry autogun attachments to Braced and Vigilant
copy_attachments_from_A_to_B("autogun_p1_m1", "autogun_p2_m1")
copy_attachments_from_A_to_B("autogun_p1_m1", "autogun_p3_m1")

info_if_debug("Going through attachments_table_for_ewc...")
local siblings_to_add = {}
-- See which weapons may need to copy over to siblings
for weapon_id, _ in pairs(attachments_table_for_ewc.attachments) do
    -- If first mark of pattern, copy to the siblings
    --  Check last two characters of the name
    --  if mark 1, copy to mk 2 and 3
    --      if they exist (checks for this are handled in that function)
    info_if_debug("\tChecking "..weapon_id)
    if (string_sub(weapon_id, -2) == "m1") then
        table_insert(siblings_to_add, weapon_id)
    else
        mod:error("uwu [REPORT TO MOD AUTHOR] not the first mark: "..weapon_id)
    end
end
-- copies to siblings
--  Done this way because pairs() does NOT guarantee order
--  and since I'm adding to the table i'm reading, it can lead to duplicates and shuffling order
--  so somehow things can get skipped? this happened to ilas for some reason
for _, weapon_id in ipairs(siblings_to_add) do
    copy_attachments_to_siblings(weapon_id)
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