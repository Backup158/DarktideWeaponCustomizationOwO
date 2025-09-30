local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

local pairs = pairs
--local string = string
local table = table
local table_insert = table.insert
local table_contains = table.contains
local table_clone = table.clone
local table_merge_recursive = table.merge_recursive

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

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
        attachments = {

        },
        fixes = {

        },
        kitbashs = {

        },
    }
end

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
function mod.create_an_attachment(table_to_add_to, internal_name, attachment_data, fixes_data, kitbash_data, attachment_point)
    if table_to_add_to.attachments[internal_name] then
        mod:error(table_to_add_to.name.."; duplicate attachment: "..internal_name)
    end
    table_to_add_to.attachments[internal_name] = attachment_data
    if fixes_data then
        for _, fix in ipairs(fixes_data) do
            table_insert(table_to_add_to.fixes, fix)
        end
        --table_merge_recursive(table_to_add_to.fixes, fixes_data)
    end
    if kitbash_data then
        --if kitbash_data.base_unit then
        --    mod:echo(attachment_data.replacement_path)
        --    table_to_add_to.kitbashs[attachment_data.replacement_path] = table_clone(kitbash_data)
        --else
            -- Allows VFX to play, if it's a muzzle/barrel
            --  disable_vfx_spawner_exclusion
            if (attachment_point == "ap_muzzle_01") or (attachment_point == "ap_barrel_01") then
                have_vfx = true
            else
                have_vfx = false
            end
            -- create kitbash table to send back
            table_to_add_to.kitbashs[attachment_data.replacement_path] = {
                attachments = { [internal_name] = kitbash_data },
                display_name = "loc_"..internal_name,
                description = "loc_description_"..internal_name,
                attach_node = attachment_point,
                dev_name = internal_name,
                disable_vfx_spawner_exclusion = have_vfx
            }
        --end
    end
end

-- ######
-- For All Weapon Models
-- DESCRIPTION: Use in a function for defining a group of attachments. The attachment definition function initializes a table, then this function adds an attachment (and optionally fixes and/or a kitbash) to it. The main thing is to avoid having to copypaste the name so many times, even though this is less performant
--  kitbash key name is your item's name (in the replacement_path). using an existing one crashes, and if it just doesn't match the masteritems goes nuts in the console log
-- PARAMETERS:
--  table_to_add_to: table; the one to add to the attachments table in the base mod
--  internal_name: string; attachment name used internally
-- RETURN: N/A
-- ######
function mod.for_all_weapon_models(range_end_inclusive, table_of_values_to_exclude, function_to_run)
    for i = 1, range_end_inclusive do
        -- if nothing needed to be excluded, or it's not one of the things to exclude
        if table_of_values_to_exclude and table_contains(table_of_values_to_exclude, i) then
            break
        end
        i = "0"..tostring(i)
        function_to_run(i)
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
local infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_ml01"
local braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_ml01"
local vigilant_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
local infantry_lasgun_receivers = "lasgun_rifle_receiver_01|lasgun_rifle_receiver_02|lasgun_rifle_receiver_03|lasgun_rifle_receiver_ml01"
local helbore_lasgun_receivers = "lasgun_rifle_krieg_receiver_01|lasgun_rifle_krieg_receiver_02|lasgun_krieg_rifle_receiver_03|lasgun_rifle_krieg_receiver_04|lasgun_rifle_krieg_receiver_05|lasgun_krieg_rifle_receiver_06|lasgun_rifle_krieg_receiver_ml01"
local recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_elysian_rifle_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_elysian_rifle_receiver_06|lasgun_elysian_rifle_receiver_07|lasgun_rifle_elysian_receiver_ml01"

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
}
for _, name in ipairs(attachment_names) do
    load_mod_file("attachments/"..name)
end