local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local pairs = pairs
local type = type
local string = string
local string_sub = string.sub
local string_regex_sub = string.gsub
local string_upper = string.upper
local tostring = tostring
local table = table
local table_insert = table.insert
local table_dump = table.dump
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
    if mod:get("debug_mode") then
        mod:info(tostring(message))
    end
end
local info_if_debug = mod.info_if_debug

function mod.dump_if_debug(table_to_dump, message)
    if mod:get("debug_mode") then
        table_dump(table_to_dump, message, 15)
    end
end
local dump_if_debug = mod.dump_if_debug

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
-- Create Requirements String from Values of a Table of Names
-- DESC: concatenates all strings from a table into one X|Y|...|Z
-- PARAM:
--  table_of_attachment_names: table of strings; attachment names, such as "owo_suppressor_01"
-- RETURN: string
-- ######
function mod.create_requirements_string_from_values_of_names_table(table_of_attachment_names)
    local final_string = ""
    -- Exits if not given table
    if not (type(table_of_attachment_names) == "table") then
        if type(table_of_attachment_names) == "string" then
            info_if_debug("table of attachments is already string: "..table_of_attachment_names)
        else
            info_if_debug("Not given table/string! create_requirements_string_from_values_of_names_table for "..tostring(table_of_attachment_names))
        end
        return table_of_attachment_names
    end
    -- Adds each string to large line
    for _, attachment in pairs(table_of_attachment_names) do
        if type(attachment) == "string" then
            final_string = final_string..attachment.."|"
        end
    end
    -- Remove final character (the unnecessary |)
    final_string = string_sub(final_string, 1, -2)

    return final_string
end
local create_requirements_string_from_values_of_names_table = mod.create_requirements_string_from_values_of_names_table

-- ######
-- Shallow Create "All" Requirements String in Table
-- DESC: Given a table where the requirement strings are stored in separate keys, make a key that has them all
-- PARAM:
--  table_of_attachment_names: table of keys and (tables or strings)
function mod.shallow_create_all_requirements_string_in_table(table_of_attachment_names)
    -- Exits if not given table
    if not (type(table_of_attachment_names) == "table") then
        info_if_debug("Not given table! shallow_create_all_requirements_string_in_table for "..tostring(table_of_attachment_names))
        return table_of_attachment_names
    end

    -- Make sure each value is already is a spread out requirements string
    for variant_name, requirements_table_or_string in pairs(table_of_attachment_names) do
        table_of_attachment_names[variant_name] = create_requirements_string_from_values_of_names_table(requirements_table_or_string)
    end

    -- Making the "All"
    local concatenated_all_values = create_requirements_string_from_values_of_names_table(table_of_attachment_names)
    table_of_attachment_names.all = concatenated_all_values
end

-- ######
-- String is key in table?
-- RETURN: boolean; was the key found?
-- ######
function mod.string_is_key_in_table(string_to_find, table_to_search)
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

-- ---------------
-- Generic Localization
-- ---------------
-- -------
function mod.internal_name_to_english(attachment_name_string)
	local final_string
	-- Removing my prefix because the group label in the menu implies it
	final_string, _ = string_regex_sub(attachment_name_string, "owo_", "")
	-- Capitalize every word
    --  first letter
    final_string, _ = string_regex_sub(final_string, "^%a", string_upper)
    --  the rest
	final_string, _ = string_regex_sub(final_string, "_%a", string_upper)
	-- Convert underscore to space
	final_string, _ = string_regex_sub(final_string, "_", " ")
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

-- ------------------------------
-- Make Local Table for Attachments
-- ------------------------------
-- ---------------
-- Adding One Attachment to the List
-- ---------------
-- DESCRIPTION: One first time setup of an attachment group, I create a local table to track all the ones I added
--   This gets transferred to a global variable later
-- There are two forms
--      local_attachments = {"attachment1", "attachment2", ...}
--      local_attachments = {
--                              ["variant_1"] = {"attachment_1", "attachment_2"},
--                              ["variant_2"] = {"attachment_3", "attachment_4"},s
--                          }
--      I call this straight up and variant-based
-- PARAMETERS: 
--      local_all_attachment_names_table: table
--      attachment_name: string; "owo_suppressor_01"
--      variant_name: string; "dclaw", so it can go like ["dclaw"] = {"owo_slim_dclaw_01", "owo_slim_dclaw_02", ...}
-- RETURN: Nothing. Since Lua is pass by reference, there's no need to return anything
-- ---------------
function mod.local_table_of_attachments_add_one(local_all_attachment_names_table, attachment_name, variant_name)
    -- This is how you check if it's the first time
    if not local_all_attachment_names_table then return end

    -- Two cases: 
    --   Add straight up to table
    --   Add based on variant
    if variant_name then
        local_all_attachment_names_table[variant_name] = local_all_attachment_names_table[variant_name] or {}
        table_insert(local_all_attachment_names_table[variant_name], attachment_name)
    else
        table_insert(local_all_attachment_names_table, attachment_name)
    end
end

-- ---------------
-- Transfer Local Table of Attachments to Global
-- ---------------
-- DESCRIPTION: 
--      Simple list: attachments = {"a", "b" ...}
--      One layer: 
--          attachments
--           |- ["var_1"] = {"a", "b"}
--           |- ["var_2"] = {"c", "d"}
--      Multilayer: 
--          all_these_attachments
--           |- Type 1
--              |- variant_a
--                  |- {x, y, z}
--              |- variant_b
--                  |- {aa, bb, cc}
--           |- Type 2
--              |- variant_a
--                  |- {dd, ee, ff}
--              |- variant_b
--                  |- {gg, hh, ii}
-- PARAMETERS:
-- RETURN: Nothing. Since Lua is pass by reference, there's no need to return anything
-- ---------------
function mod.transfer_local_table_of_attachments_to_global(local_all_attachment_names_table, attachment_name_for_global)
    -- This is how you check if it's the first time
    if not local_all_attachment_names_table then return end

    -- Simple List
    if local_all_attachment_names_table[1] then
        local_all_attachment_names_table = create_requirements_string_from_values_of_names_table(local_all_attachment_names_table)
    else
        -- This will go down the chain until it finds a {x, y, z}
        -- Then at that layer, it will flatten that out into requirement strings
        local function recursive_check_layer_make_strings_at_the_end(current_layer_of_table)
            -- There's a flat list in the given table, meaning this is the end of the line
            --   The goal is to go from
            --          attachments
            --           |- ["var_1"] = {"a", "b"}
            --           |- ["var_2"] = {"c", "d"}
            --   to
            --          attachments
            --           |- ["var_1"] = "a|b"
            --           |- ["var_2"] = "c|d"
            --           |- ["all"] = "a|b|c|d"
            if (type(current_layer_of_table[1]) == "string") then
                return create_requirements_string_from_values_of_names_table(current_layer_of_table)
            else
                local result = {}
                local all_parts = {}
                
                for key, value in pairs(current_layer_of_table) do
                    if type(value) == "table" then
                        result[key] = recursive_check_layer_make_strings_at_the_end(value)
                        -- Collect the "all" values from deeper levels
                        -- Or if it's a string at the end
                        if result[key]["all"] then
                            table_insert(all_parts, result[key]["all"])
                        elseif type(result[key]) == "string" then
                            table_insert(all_parts, result[key])
                        end
                    else
                        result[key] = value
                    end
                end
                
                -- If we collected any "all" values, combine them
                if #all_parts > 0 then
                    result["all"] = recursive_check_layer_make_strings_at_the_end(all_parts)
                end
                
                return result
            end
        end

        local_all_attachment_names_table = recursive_check_layer_make_strings_at_the_end(local_all_attachment_names_table)
    end

    mod[attachment_name_for_global] = local_all_attachment_names_table
    --table_dump(local_all_attachment_names_table, "Transferred table of attachments to global uwu", 6)
end

-- ----------
-- Localize Attachment Triple Threat
-- DESC: Creates a global localization using the values in the localization file
--      barrel name + suffix + number --> Kalashnikov Barrel - Short 07
--      This should work with other languages since mod:Localize finds your language --> replaces english --> there's nothing for your language so it grabs the english (which is actually in your language)
-- PARAM: 
--      attachment_group_name: string; such as owo_contemporary_barrel
--      attachment_suffix: string; the specific ending of a name that's words, such as kalashnikov_barrel
--      number_string: string (optional); if the attachment ends in a number, the number as a string, where 1 --> "01"
-- RETURN: N/A
-- ----------
function mod.localize_attachment_triple_threat(attachment_group_name, attachment_suffix, number_string) 
    local attachment_name = attachment_group_name.."_"..attachment_suffix

    local attachment_start = mod:localize("loc_"..attachment_group_name)
    local attachment_end = mod:localize("loc_"..attachment_group_name.."_"..attachment_suffix)

    local attachment_combination = attachment_start.." - "..attachment_end
    if number_string then
        attachment_combination = attachment_combination.." "..number_string
        attachment_name = attachment_name.."_"..number_string
    end
    mod:add_global_localize_strings({
        ["loc_"..attachment_name] = {
            en = attachment_combination
        },
    })
end

-- ----------
-- Localize Attachment QUADRUPLE Threat
-- For when I have the same suffix in the same family
--   like i have a_x, a_y, a_z as the main variants
--   and each of those have variants j k l
--   so I'd have to localize a_x_j, a_x_k, ...
--   I'll store these as a_x and a_j, and so on
-- ----------
function mod.localize_attachment_quadruple_threat_shared_suffix(attachment_group_name, specific_name, variant_suffix, number_string)
    local attachment_name = attachment_group_name.."_"..specific_name.."_"..variant_suffix
    local attachment_start = mod:localize("loc_"..attachment_group_name.."_"..specific_name)
    local attachment_end = mod:localize("loc_"..attachment_group_name.."_"..variant_suffix)

    local attachment_combination = attachment_start.." - "..attachment_end

    if number_string then
        attachment_combination = attachment_combination.." "..number_string
        attachment_name = attachment_name.."_"..number_string
    end

    mod:add_global_localize_strings({
        ["loc_"..attachment_name] = {
            en = attachment_combination
        },
    })
end

-- ----------
-- Apply 2D Transformation to Vector3Box
-- DESC: given a vector3box, multiply it with the transformation given
--  not just modifying the vector without returning because that affects the one it was cloned from
--  maybe vectors are pointers being passed around?
--  not using the vector3 functions becaus returning a vector3 doesn't work (just defaults to 0)
-- PARAM:
--      vector_userdata; Vector3Box; the position/rotation
--      two_dimensional_array; table of numbers; like {x = 1, y = 2, z = 1}
-- RETURN: Vector3Box
-- ----------
function mod.apply_two_dimensional_transformation_to_vector(vector_userdata, two_dimensional_array)
    -- if different lengths, error
    if not 3 == #two_dimensional_array then
        mod:error("Scalar array is not sized 3")
        return
    end

    return vector3_box( vector_userdata[1] * (two_dimensional_array.x or 1), 
                        vector_userdata[2] * (two_dimensional_array.y or 1), 
                        vector_userdata[3] * (two_dimensional_array.z or 1))
end