local mod = get_mod("extended_weapon_customization_owo")

-- ###################################################################
-- DATA
-- ###################################################################
-- Prints a message to the console log containing the current version number
mod.version = "4.3.0"
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
local type = type
local string = string
local string_sub = string.sub
local string_gsub = string.gsub
local tostring = tostring
local table = table
local table_insert = table.insert
local table_clone = table.clone
local table_equals = table.equals
local table_dump = table.dump
local table_merge_recursive = table.merge_recursive
local vector3_box = Vector3Box
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
    attachment_slots = {

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
mod:io_dofile("extended_weapon_customization_owo/scripts/mods/extended_weapon_customization_owo/utilities/general_helpers")
local load_mod_file = mod.load_mod_file
local info_if_debug = mod.info_if_debug
local merge_recursive_safe = mod.merge_recursive_safe
local table_insert_all_from_table = mod.table_insert_all_from_table

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
local function add_attachment_to_weapon_in_final_table(attachment_tables, weapon_id, slot) 
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
-- Add an Attachment with Fixes to Multiple Weapons
-- DESCRIPTION: Calls the previous function for all given weapons
-- PARAMETERS:
--  weapons_list: table of strings
-- ######
local function add_attachments_to_list_of_weapons(attachment_blob, weapons_list, slot)
    for _, weapon_id in ipairs(weapons_list) do
        -- info_if_debug("Adding attachments to "..weapon_id)
        --table_dump(attachment_blob, "THE BLOB", 9)
        if not slot then
            mod:error("Weapon slot missing! "..weapon_id..": "..attachment_blob[name])
            return
        end
        add_attachment_to_weapon_in_final_table(attachment_blob.attachments, weapon_id, slot)

        -- Only add slots if they exist
        if attachment_blob.attachment_slots then
            -- If destination doesn't exist
            if not attachments_table_for_ewc.attachment_slots[weapon_id] then
                attachments_table_for_ewc.attachment_slots[weapon_id] = {}
            end
            merge_recursive_safe(attachments_table_for_ewc.attachment_slots[weapon_id], attachment_blob.attachment_slots)
        end

        -- Fixes (from these files) and kitbashs only need to be defined once
        -- Fixes are NOT merge recursive because when the keys are indices, so fixes would get merged together
        if not attachments_table_for_ewc.fixes[weapon_id] then 
            attachments_table_for_ewc.fixes[weapon_id] = {} 
        end
        table_insert_all_from_table(attachments_table_for_ewc.fixes[weapon_id], attachment_blob.fixes)
    end
    
    merge_recursive_safe(attachments_table_for_ewc.kitbashs, attachment_blob.kitbashs)
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
    -- If destination doesn't exist
    if not attachments_table_for_ewc.attachments[weapon_id_B] then
        attachments_table_for_ewc.attachments[weapon_id_B] = {}
    end
    table_merge_recursive(attachments_table_for_ewc.attachments[weapon_id_B], attachments_table_for_ewc.attachments[weapon_id_A])

    -- If source does not exist
    if not attachments_table_for_ewc.attachment_slots[weapon_id_A] then
        info_if_debug("No attachment slots found for "..weapon_id_A)
        return
    end
    -- If destination doesn't exist
    if not attachments_table_for_ewc.attachment_slots[weapon_id_B] then
        attachments_table_for_ewc.attachment_slots[weapon_id_B] = {}
    end
    merge_recursive_safe(attachments_table_for_ewc.attachment_slots[weapon_id_B], attachments_table_for_ewc.attachment_slots[weapon_id_A])
end

-- ######
-- Copy Fixes from A to B
-- DESCRIPTION: Copies table of fixes from one weapon to another
-- PARAMETERS: 
--  weapon_id_A: string; the source
--  weapon_id_B: string; the destination
-- RETURN: N/A
-- ######
local function copy_fixes_from_A_to_B(weapon_id_A, weapon_id_B)
    -- If source does not exist
    if not attachments_table_for_ewc.fixes[weapon_id_A] then
        mod:info("No fixes in source: "..weapon_id_A)
        return
    end
    -- If destination doesn't exist
    if not attachments_table_for_ewc.fixes[weapon_id_B] then
        attachments_table_for_ewc.fixes[weapon_id_B] = {}
    end
    
    -- needs to be insert because numerical index, so merge recursive would smash fixes together
    for _, fix in pairs(attachments_table_for_ewc.fixes[weapon_id_A]) do
        table_insert(attachments_table_for_ewc.fixes[weapon_id_B], fix)
    end
end

-- ######
-- Copy Attachments to Siblings
-- DESCRIPTION: Given the first mark of a weapon, copy attachments to marks 2 and 3, if they exist
-- PARAMETERS: 
--  first_mark_id: string
-- RETURN: N/A
-- ######
local function copy_attachments_and_fixes_to_siblings(first_mark_id)
    if not type(first_mark_id) == "string" then
        mod:error("uwu first_mark_id is not a string")
        return
    end
    info_if_debug("\tCopying attachments to siblings of "..first_mark_id)
    -- from 2 to 3
    for i = 2, 3 do
        local weapon_id = string_gsub(first_mark_id, "1$", tostring(i))
        if string_is_key_in_table(weapon_id, WeaponTemplates) then
            info_if_debug("\t\tuwu Copying to sibling: "..first_mark_id.." --> "..weapon_id)
            copy_attachments_from_A_to_B(first_mark_id, weapon_id)
            copy_fixes_from_A_to_B(first_mark_id, weapon_id)
        else
            info_if_debug("\t\tuwu This is not a real weapon: "..weapon_id)
        end
    end
end

-- ###################################################################
-- ATTACHMENT CREATION
-- This needs to happen BEFORE all mods load, since that's when the base mod gets the tables from the plugins
-- ###################################################################
-- Creating flashlight templates
--  Needs to happen first so the attachments can reference them
attachments_table_for_ewc.flashlight_templates = table_clone(load_mod_file("attachments/owo_flashlight_templates"))

load_mod_file("attachments/create_attachments")
load_mod_file("utilities/owo_damage_types")

-- ################################
-- Adding Attachments
-- ################################
-- ################
-- Ranged
-- ################
-- Special/Flashlight
local all_ranged_weapons = {
    "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", "autopistol_p1_m1", 
    "bolter_p1_m1", "boltpistol_p1_m1", 
    "flamer_p1_m1", "plasmagun_p1_m1", 
    "lasgun_p1_m1", "lasgun_p2_m1", "lasgun_p3_m1", "laspistol_p1_m1", 
    "shotgun_p1_m1", "shotgun_p2_m1", "shotgun_p4_m1", "shotpistol_shield_p1_m1", "stubrevolver_p1_m1", 
    "ogryn_gauntlet_p1_m1", "ogryn_rippergun_p1_m1", "ogryn_heavystubber_p1_m1", "ogryn_heavystubber_p2_m1", "ogryn_thumper_p1_m1", 
}
add_attachments_to_list_of_weapons(mod.owo_color_flashlight(), all_ranged_weapons, "flashlight")
add_attachments_to_list_of_weapons(mod.owo_tactical_flashlight(), all_ranged_weapons, "flashlight")
add_attachments_to_list_of_weapons(mod.owo_color_flashlight(), { "shotpistol_shield_p1_m1", "stubrevolver_p1_m1" }, "flashlight_under_small")

-- Muzzle
local ranged_muzzle_no_double = {
    "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", "autopistol_p1_m1", 
    "bolter_p1_m1", "boltpistol_p1_m1", 
    --"flamer_p1_m1", "plasmagun_p1_m1", 
    "lasgun_p1_m1", "lasgun_p2_m1", "lasgun_p3_m1", "laspistol_p1_m1", 
    "shotgun_p1_m1", 
    --"shotgun_p2_m1", 
    "shotgun_p4_m1", "shotpistol_shield_p1_m1", "stubrevolver_p1_m1", 
    --"ogryn_gauntlet_p1_m1", 
    "ogryn_rippergun_p1_m1", 
    --"ogryn_heavystubber_p1_m1", 
    --"ogryn_heavystubber_p2_m1", 
    "ogryn_thumper_p1_m1", 
}
add_attachments_to_list_of_weapons(mod.owo_suppressor(), ranged_muzzle_no_double, "muzzle")
--add_attachments_to_list_of_weapons(mod.owo_suppressor("muzzle", "ap_sight_01"), {"ogryn_thumper_p1_m1"}, "muzzle")
add_attachments_to_list_of_weapons(mod.owo_suppressor("muzzle", "ap_barrel_01"), {"ogryn_heavystubber_p2_m1"}, "muzzle")

-- Stock
add_attachments_to_list_of_weapons(mod.owo_tactical_stock(), {"autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", "autopistol_p1_m1", "bolter_p1_m1", "boltpistol_p1_m1", "lasgun_p1_m1", "lasgun_p2_m1", }, "stock")
--add_attachments_to_list_of_weapons(mod.probe_for_node(), {"lasgun_p2_m1", }, "stock")

-- Magazine
add_attachments_to_list_of_weapons(mod.owo_mag(), { "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", }, "magazine")

-- Sight
local sighted_weapons = {
    "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", "autopistol_p1_m1", 
    "bolter_p1_m1", "boltpistol_p1_m1", 
    --"flamer_p1_m1", "plasmagun_p1_m1", 
    "lasgun_p1_m1", "lasgun_p2_m1", "lasgun_p3_m1", "laspistol_p1_m1", 
    "shotgun_p1_m1", "shotgun_p2_m1", "shotgun_p4_m1", "shotpistol_shield_p1_m1", "stubrevolver_p1_m1", 
    "ogryn_gauntlet_p1_m1", "ogryn_rippergun_p1_m1", "ogryn_heavystubber_p1_m1", "ogryn_heavystubber_p2_m1", "ogryn_thumper_p1_m1", 
}
add_attachments_to_list_of_weapons(mod.owo_iron_sight(), { "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", }, "sight")
add_attachments_to_list_of_weapons(mod.owo_holographic_sight(), sighted_weapons, "sight")
add_attachments_to_list_of_weapons(mod.owo_sight_reticle(), sighted_weapons, "sight_reticle")

-- ################
-- Melee
-- ################
add_attachments_to_list_of_weapons(mod.owo_slim_blade(), { "powersword_p1_m1", "powersword_p2_m1", "powersword_2h_p1_m1", "forcesword_p1_m1", "forcesword_2h_p1_m1", }, "blade")
add_attachments_to_list_of_weapons(mod.owo_slim_blade("body"), {"combatsword_p1_m1", "combatsword_p2_m1", "combatsword_p3_m1", }, "body")
add_attachments_to_list_of_weapons(mod.owo_slim_blade("head"), {"powermaul_p1_m1", "powermaul_p2_m1", "powermaul_shield_p1_m1", }, "head")

add_attachments_to_list_of_weapons(mod.owo_rear_spike("head_rear", "ap_head_01"), {"combataxe_p1_m1", "combataxe_p2_m1", }, "head_rear")
--table_dump(mod.owo_slim_blade(), "SLIM BLADE EXAMPLE", 9)

-- ################################
-- Manual Overrides for Attachments
-- ################################
local special_needs_fixes = { 
    "autogun_p1_m1", "autopistol_p1_m1", 
    "bolter_p1_m1", "boltpistol_p1_m1", 
    "lasgun_p3_m1", 
    "shotgun_p1_m1", "shotgun_p4_m1", "shotpistol_shield_p1_m1", "stubrevolver_p1_m1", 
    "ogryn_rippergun_p1_m1", "ogryn_heavystubber_p2_m1", "ogryn_thumper_p1_m1", 
    "powersword_2h_p1_m1", 
}
for _, weapon_id in ipairs(special_needs_fixes) do
    local loaded_table = load_mod_file("fixes/"..weapon_id)
    local fixes_table_to_add = loaded_table.fixes
    local slots_to_add = loaded_table.attachment_slots
    -- backwards compatibility for not having fixes in its own section
    if not fixes_table_to_add and not slots_to_add then
        fixes_table_to_add = loaded_table
    end

    -- Defining Fixes
    if not attachments_table_for_ewc.fixes[weapon_id] then
        attachments_table_for_ewc.fixes[weapon_id] = {}
    end
    --table_dump(fixes_table_to_add, "SPECIAL NEEDS", 10)

    --table_insert_all_from_table(attachments_table_for_ewc.fixes[weapon_id], fixes_table_to_add)
    if fixes_table_to_add then
        for _, custom_fix in pairs(fixes_table_to_add) do
            local inserted = false

            for i = 1, #attachments_table_for_ewc.fixes[weapon_id] do
                -- if requirements are identical, replace that fix
                if table_equals(attachments_table_for_ewc.fixes[weapon_id][i].requirements, custom_fix.requirements) then
                    --[[
                    if debug_mode then
                        mod:info("Replacing fix for "..weapon_id)
                        table_dump(attachments_table_for_ewc.fixes[weapon_id][i], "\tREPLACING", 10)
                        table_dump(custom_fix, "\tWITH", 10)
                    end
                    ]]
                    attachments_table_for_ewc.fixes[weapon_id][i] = custom_fix
                    inserted = true
                end
            end
            
            if not inserted then
                table_insert(attachments_table_for_ewc.fixes[weapon_id], custom_fix)
            end
        end
    end

    -- Defining Attachment slots
    if slots_to_add then
        if not attachments_table_for_ewc.attachment_slots[weapon_id] then
            attachments_table_for_ewc.attachment_slots[weapon_id] = {}
        end

        table_merge_recursive(attachments_table_for_ewc.attachment_slots[weapon_id], slots_to_add)
    end
end

-- ################################
-- Copying to Different Marks
-- ################################

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
    copy_attachments_and_fixes_to_siblings(weapon_id)
end

if debug_mode then
    table_dump(attachments_table_for_ewc, "uwu fuck you bitch\nALL THE FUCKING TABLE RAAAGH", 10)
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
	if not get_mod("extended_weapon_customization") then
		mod:error("Extended Weapon Customization mod (the rebuild) required")
		return
	end
    --  Outdated base mod
	if get_mod("weapon_customization") then
		mod:error("You are using the OLD version of Weapon Customization! This plugin is for the new, rebuilt version.")
		return
	end
	--	Plugins
	--		Just so I know. Compatibility is only an issue of name collisions
    local other_plugins = { "visible_equipment", "extended_weapon_customization_base_additions", "extended_weapon_customization_empty_scopes", }
    for _, plugin_name in ipairs(other_plugins) do
        if get_mod(plugin_name) then
            mod:info("Uwusa haz "..plugin_name.." :3")
        end
    end
end