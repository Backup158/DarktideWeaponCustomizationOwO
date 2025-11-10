local mod = get_mod("extended_weapon_customization_owo")

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
local string_regex_sub = string.gsub
local string_upper = string.upper
local tostring = tostring
local table = table
local table_insert = table.insert
--local table_clone = table.clone
local table_merge_recursive = table.merge_recursive

-- ###################################################################
-- HELPER FUNCTIONS
-- ###################################################################
-- ######
-- Load Mod File
-- DESCRIPTION: Runs a file in the mod's folder
-- PARAMETERS:
--  relative_path: string; path to the file without the extension; e.g. "melee/autogun_gooning"
-- RETURN: N/A
-- ######
function mod.load_mod_file(relative_path)
	return mod:io_dofile("extended_weapon_customization_owo/scripts/mods/extended_weapon_customization_owo/"..relative_path)
end

-- ######
-- Print if Debug
-- DESCRIPTION: Logs text in console if debug is on
-- PARAMETERS:
--  message: string
-- RETURN: N/A
-- ######
function mod.info_if_debug(message)
    if debug_mode then
        mod:info(tostring(message))
    end
end
local info_if_debug = mod.info_if_debug

-- ######
-- Merge Recursive (Safe)
-- DESCRIPTION: Checks for source and destination at first
-- PARAMETERS: 
--  destination_table: table
--  source_table: table
-- RETURN: N/A
-- ######
function mod.merge_recursive_safe(destination_table, source_table) 
	if not source_table then
        info_if_debug("no source given")
        return
    elseif not type(source_table) == "table" then
        info_if_debug("source is not table")
        return
    end

    if not destination_table then 
        mod:error("no destination give")
        return
    end

    table_merge_recursive(destination_table, source_table)
end

-- ######
-- Table Insert All from Table
-- DESCRIPTION: Checks for source and destination at first, then inserts each value w/ unspecified key
-- PARAMETERS: 
--  destination_table: table
--  source_table: table
-- RETURN: N/A
-- ######
function mod.table_insert_all_from_table(destination_table, source_table)
    if not source_table then
        -- not printing because of all the times i just dont give a fix
        --info_if_debug("no source given")
        return
    elseif not type(source_table) == "table" then
        info_if_debug("source is not table")
        return
    end

    if not destination_table then 
        destination_table = {}
    end

    for _, value in pairs(source_table) do
        table_insert(destination_table, value)
    end
end

-- ######
-- Create Requirements String from Table of Names\
-- DESC: concatenates all strings from a table into one X|Y|...|Z
-- PARAM:
--  table_of_attachment_names: table of strings; attachment names, such as "owo_suppressor_01"
-- RETURN: string
-- ######
function mod.create_requirements_string_from_names_table(table_of_attachment_names)
    local final_string = ""
    if not type(table_of_attachment_names) == "table" then
        mod:error("Not given table! create_requirements_string_from_names_table for "..tostring(table_of_attachment_names))
        return
    end
    for _, attachment in pairs(table_of_attachment_names) do
        final_string = final_string..attachment.."|"
    end
    -- Remove final character (the unnecessary |)
    final_string = string_sub(final_string, 1, -2)

    return final_string
end

-- ---------------
-- Generic Localization
-- ---------------
-- -------
function mod.internal_name_to_english(attachment_name_string)
	local final_string
	-- Removing my prefix because the group label in the menu implies it
	final_string, _ = string_regex_sub(attachment_name_string, "owo_", "")
	-- Capitalize every word
	final_string, _ = string_regex_sub(attachment_name_string, "_%a", string_upper)
	-- Convert underscore to space
	final_string, _ = string_regex_sub(attachment_name_string, "_", " ")
	return final_string
end
function mod.generic_localization(attachment_name_string) 
	return {
		en = mod.internal_name_to_english(attachment_name_string),
	}
end

-- ---------------
-- Localizing a group of attachments
-- For all names, use specific localization or generic
-- ---------------
function mod.localize_single_attachment_with_table(attachment_name, localizations_to_use)
    local final_localization
    if localizations_to_use and localizations_to_use[attachment_name] then
        final_localization = localizations_to_use[attachment_name]
    else
        final_localization = mod.generic_localization(attachment_name)
    end

    mod:add_global_localize_strings({
        ["loc_"..attachment_name] = final_localization,
    })
end

function mod.localize_all_from_group(attachment_names, localizations_to_use)
	if not (type(attachment_names) == "table") then
		mod:error("Cannot localize all from group. Not given table.\n"..tostring(attachment_names))
		return
	end

	for _, attachment_name in pairs(attachment_names) do
		mod.localize_single_attachment_with_table(attachment_name, localizations_to_use)
	end
end