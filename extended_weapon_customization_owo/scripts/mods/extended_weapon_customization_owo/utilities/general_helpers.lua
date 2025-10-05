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
local string_gsub = string.gsub
local tostring = tostring
local table = table
local table_insert = table.insert
local table_clone = table.clone
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