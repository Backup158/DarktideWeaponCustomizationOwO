local mod = get_mod("extended_weapon_customization_owo")
local ewc = get_mod("extended_weapon_customization")

-- ################################
-- Local References for Performance
-- ################################
--local vector3 = Vector3
--local vector3_box = Vector3Box

local type = type
--local pairs = pairs
local ipairs = ipairs
local string = string
local string_find = string.find
local table = table
local table_insert = table.insert
local table_contains = table.contains
local table_clone = table.clone
--local table_merge_recursive = table.merge_recursive

--local merge_recursive_safe = mod.merge_recursive_safe
local table_insert_all_from_table = mod.table_insert_all_from_table


-- ################################
-- Helper Functions
-- ################################
-- ######
-- Initialize Table to Return
-- DESCRIPTION: Use in a function for defining a group of attachments. This is to create the table that will have attachments added to it, before it finally sends back a table of attachments, which will finally be put into the table that gets copied back into the base mod. Creates an internal name for debugging purposes
-- PARAMETERS:
--  internal_name: string; name for what attachments these are; "owo_suppressor"
-- RETURN: N/A
-- ######
function mod.init_table_to_return(internal_name)
    return {
        name = internal_name or "owo_UNKNOWN",
        attachments = { },
        attachment_slots = { },
        fixes = { },
        kitbashs = { },
    }
end

-- ######
-- Create Kitbash - Merge Table
-- DESCRIPTION: creates a kitbash that's the normal type
-- PARAMETERS:
--  table_to_add_to: table; the one to add to the attachments table in the base mod
--  replacement_name: string; the replacement_path in the attachments
--  internal_name: string; attachment name used internally
--  kitbash_data: table; contains data to copy over for the kitbash
--  attachment_point: string; attachment point for the given kitbash
--  use_vfx_here: boolean; if muzzle flash should spawn
-- RETURN: N/A
-- ######
local function create_kitbash_merge_table(table_to_add_to, replacement_name, internal_name, kitbash_data, attachment_point, use_vfx_here)
    -- Allows VFX to play, if it's a muzzle/barrel
    --  disable_vfx_spawner_exclusion
    local have_vfx
    if use_vfx_here then
        have_vfx = true
    else
        have_vfx = false
    end
    -- create kitbash table to send back for merging
    table_to_add_to.kitbashs[replacement_name] = {
        -- attachments = { [internal_name] = kitbash_data },
        attachments = { base = kitbash_data }, -- had issues with hide mesh when done the other way
        display_name = "loc_"..internal_name,
        description = "loc_description_"..internal_name,
        attach_node = attachment_point,
        dev_name = internal_name,
        disable_vfx_spawner_exclusion = have_vfx
    }
end

-- ######
-- Create Kitbash - Full Item
-- DESCRIPTION: creates a kitbash that's a full item
-- PARAMETERS:
--  table_to_add_to: table; the one to add to the attachments table in the base mod
--  replacement_name: string; the replacement_path in the attachments
--  internal_name: string; attachment name used internally
--  kitbash_data: table; contains the base_unit address and that's it
--  attachment_point: string; attachment point for the given kitbash
-- RETURN: N/A
-- ######
function mod.create_kitbash_full_item(table_to_add_to, replacement_name, internal_name, kitbash_data, attachment_point, use_vfx_here)
    local display_name_to_use = nil
    local given_base_unit = nil
    local given_resource_dependencies = nil
    local given_attachments = {
        zzz_shared_material_overrides = {
            item = "",
            children = {},
        },
    }
    if type(kitbash_data) == "table" then
        given_base_unit = kitbash_data.base_unit
        if kitbash_data.attachments and (type(kitbash_data.attachments) == "table") then
            given_attachments = table_clone(kitbash_data.attachments)
        end
        if kitbash_data.resource_dependencies and (type(kitbash_data.resource_dependencies) == "table") then
            given_resource_dependencies = table_clone(kitbash_data.resource_dependencies)
        else
            given_resource_dependencies = {
                [given_base_unit] = true,
            }
        end
    -- backwards compatibility for passing only base unit (string)
    else
        given_base_unit = kitbash_data
        given_resource_dependencies = {
            [given_base_unit] = true,
        }
    end
    local have_vfx
    if use_vfx_here then
        have_vfx = true
    else
        have_vfx = false
    end

    if kitbash_data.additional_asset_requirements then
        --table.dump(kitbash_data, "Kitbash DAT FULL", 20)
        for _, sound_str in ipairs(kitbash_data.additional_asset_requirements) do
            given_resource_dependencies[sound_str] = true
        end
        --table.dump(given_resource_dependencies, "GIVEN resource_dependencies WITH CUSTOM DMG FROM ADDITIONAL ASSETS", 20)
    end

    if not internal_name then
        display_name_to_use = "n/a"
    else
        display_name_to_use = "loc_"..internal_name
    end

    table_to_add_to.kitbashs[replacement_name] = {
        is_fallback_item = false,
        show_in_1p = true,
        base_unit = given_base_unit,
        item_list_faction = "Player",
        tags = {
        },
        only_show_in_1p = false,
        feature_flags = {
            "FEATURE_item_retained",
        },
        attach_node = attachment_point,
        resource_dependencies = given_resource_dependencies,
        attachments = given_attachments,
        workflow_checklist = {
        },
        display_name = display_name_to_use,
        name = replacement_name,
        workflow_state = "RELEASABLE",
        is_full_item = true,
        disable_vfx_spawner_exclusion = have_vfx,
    }
end
local create_kitbash_full_item = mod.create_kitbash_full_item

-- ######
-- Create an Attachment
-- DESCRIPTION: Use in a function for defining a group of attachments. The attachment definition function initializes a table, then this function adds an attachment (and optionally fixes and/or a kitbash) to it. The main thing is to avoid having to copypaste the name so many times, even though this is less performant
--  kitbash key name is your item's name (in the replacement_path). using an existing one crashes, and if it just doesn't match the masteritems goes nuts in the console log
-- PARAMETERS:
--  table_to_add_to: table; the one to add to the attachments table in the base mod
--  internal_name: string; attachment name used internally
--  attachment_data: table; contains data for an attachment
--  fixes_data: table; contains data for any fixes
--  kitbash_data: table; contains data for a kitbash
--  attachment_point: string; attachment point for the given kitbash
-- RETURN: N/A
-- ######
function mod.create_an_attachment(table_to_add_to, internal_name, attachment_data, fixes_data, kitbash_data, attachment_point, use_vfx_here)
    if table_to_add_to.attachments[internal_name] then
        mod:error(table_to_add_to.name.."; duplicate attachment: "..internal_name)
    else
        table_to_add_to.attachments[internal_name] = attachment_data
    end

    -- table may not always be empty, so insert
    table_insert_all_from_table(table_to_add_to.fixes, fixes_data)

    if kitbash_data then
        local replacement_name = attachment_data.replacement_path
        local damage_type = attachment_data.damage_type
        if damage_type then
            kitbash_data.additional_asset_requirements = {}
            local custom_damage_defined_here = mod.custom_damage_types[damage_type]
            local custom_damage_from_main_mod = ewc.damage_types[damage_type]
            local custom_damage = custom_damage_defined_here or custom_damage_from_main_mod
            if custom_damage then
                table.dump(custom_damage, "CUSTOM DAMAGE", 20)
                for _, sound_event in pairs(custom_damage) do
                    -- Need to check if it's actually a resource
                    --  sound has wwise, vs like "sawing" or something from gib data
                    if string_find(sound_event, "wwise") or string_find(sound_event, "content/fx/particles") then
                        table_insert(kitbash_data.additional_asset_requirements, sound_event)
                    end
                end
                table.dump(kitbash_data.additional_asset_requirements, "additional_asset_requirements AFTER CUSTOM DAMAGE", 20)
            end
        end

        -- this only is a thing if it's a full item on its own
        if kitbash_data.base_unit then
            create_kitbash_full_item(table_to_add_to, replacement_name, internal_name, kitbash_data, attachment_point, use_vfx_here)
        else
            create_kitbash_merge_table(table_to_add_to, replacement_name, internal_name, kitbash_data, attachment_point, use_vfx_here)
        end
    end
end

function mod.create_group_indicator(table_to_return, indicator_name, current_attachment_node)
    create_kitbash_full_item(table_to_return, indicator_name, nil, "content/characters/empty_item/empty_item", current_attachment_node)
end

-- ######
-- For All Weapon Models
-- DESCRIPTION: Executes a given function for a range, which should cover all models for a certain weapon slot, such as psword blades
-- PARAMETERS:
--  range_end_inclusive: int; the last number for all the non-mastery meshes there are, eg 7 for power_sword_blade_07 being the last
--  table_of_values_to_exclude: table of int or string; meshes to skip, if those don't exist (dont think it can be checked automatically)
--  function_to_run: function; whatever gets run using the number for each model (so the function to create an attachment)
--      note that i gets passed as a string!
-- RETURN: N/A
-- ######
function mod.for_all_weapon_models(range_end_inclusive, table_of_values_to_exclude, function_to_run)
    for i = 1, range_end_inclusive do
        -- if nothing needed to be excluded, or it's not one of the things to exclude
        if not (table_of_values_to_exclude and table_contains(table_of_values_to_exclude, i)) then
            function_to_run("0"..tostring(i))
        end
    end
    -- Now for mastery item
    if not table_of_values_to_exclude or not table_contains(table_of_values_to_exclude, "ml01") then
        function_to_run("ml01")
    end
end

-- ######
-- for use with hide { mesh = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }
-- ######
function mod.return_all_numbers_for_hide()
    return {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
end

-- ################################
-- Some Variables for Common Attachments
-- ################################
-- Camera Angles for Preview
mod.render_unit_rot_profile_left = {90, 0, 30}
mod.render_cam_pos_profile_left = {-0.2, -1.75, 0.15}
mod.render_unit_rot_sword_blade = {90, 30, 0}
mod.render_cam_pos_sword_blade = {-.025, -2.5, .7}

-- ################################
-- Defining Attachment Functions
-- ################################
local load_mod_file = mod.load_mod_file

local attachment_names = {
    "probe_for_node", 
    "owo_suppressor", 
    "owo_tactical_stock", 
    "owo_flashlight",
    "owo_slim_blade",
    "owo_mag",
    "owo_iron_sight",
    "owo_rear_spike",
    "owo_holographic_sight",
    "owo_sight_reticle",
}
for _, name in ipairs(attachment_names) do
    load_mod_file("attachments/"..name)
end