local mod = get_mod("extended_weapon_customization_owo")

-- ###################################################################
-- DATA
-- ###################################################################
-- Prints a message to the console log containing the current version number
mod.version = "4.8.0"
mod:info('v' .. mod.version .. mod:localize("mod_version_logging_message"))

-- Discord mode
-- Only needs to be checked at launch because the stuff it affects only runs at startup
mod.discord_mode = mod:get("discord_mode")
local debug_mode = mod:get("debug_mode")
if debug_mode then mod:info(mod:localize("mod_debug_mode_active_message")) end

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
local dump_if_debug = mod.dump_if_debug
local merge_recursive_safe = mod.merge_recursive_safe
local table_insert_all_from_table = mod.table_insert_all_from_table
local string_is_key_in_table = mod.string_is_key_in_table

load_mod_file("utilities/files_to_load")

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
    for i = 1, #(weapons_list) do
        local weapon_id = weapons_list[i]
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

-- ######
-- Insert Custom Fixes for Weapons
-- DESCRIPTION: If a weapon family needs specific fixes, I put them in its own file. This loads that weapon's fixes and adds it to the main table.
-- PARAMETERS: 
--  weapon_id: string
-- RETURN: N/A
-- ######
local function insert_custom_fixes_for_weapon(weapon_id)
    local loaded_table = load_mod_file("fixes/"..weapon_id)
    if not loaded_table then
        -- No custom fixes for this weapon
        return
    end
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

-- ###################################################################
-- ATTACHMENT CREATION
-- This needs to happen BEFORE all mods load, since that's when the base mod gets the tables from the plugins
-- ###################################################################
-- Creating flashlight templates
--  Needs to happen first so the attachments can reference them
attachments_table_for_ewc.flashlight_templates = table_clone(load_mod_file("attachments/owo_flashlight_templates"))

load_mod_file("utilities/owo_damage_types")
load_mod_file("attachments/create_attachments")

local attachment_names = mod.attachment_names
for i = 1, #(attachment_names) do
    load_mod_file("attachments/"..attachment_names[i])
end

-- ################################
-- Adding Attachments
-- ################################
local all_ranged_weapons = {
    "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", "autopistol_p1_m1", 
    "bolter_p1_m1", "boltpistol_p1_m1", 
    "flamer_p1_m1", "plasmagun_p1_m1", 
    "lasgun_p1_m1", "lasgun_p2_m1", "lasgun_p3_m1", "laspistol_p1_m1", 
    "shotgun_p1_m1", "shotgun_p2_m1", "shotgun_p4_m1", "shotpistol_shield_p1_m1", "stubrevolver_p1_m1", 
    "ogryn_gauntlet_p1_m1", "ogryn_rippergun_p1_m1", "ogryn_heavystubber_p1_m1", "ogryn_heavystubber_p2_m1", "ogryn_thumper_p1_m1", 
    "dual_autopistols_p1_m1", "dual_stubpistols_p1_m1", "needlepistol_p1_m1",
    "arc_rifle_p1_m1", "galvanic_rifle_p1_m1", "phosphor_pistol_p1_m1",
}
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
    "dual_autopistols_p1_m1", "dual_stubpistols_p1_m1", "needlepistol_p1_m1",
    -- "galvanic_rifle_p1_m1", 
    "arc_rifle_p1_m1", "phosphor_pistol_p1_m1",
}
local sighted_weapons = {
    "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", "autopistol_p1_m1", 
    "bolter_p1_m1", "boltpistol_p1_m1", 
    --"flamer_p1_m1", "plasmagun_p1_m1", 
    "lasgun_p1_m1", "lasgun_p2_m1", "lasgun_p3_m1", "laspistol_p1_m1", 
    "shotgun_p1_m1", "shotgun_p2_m1", "shotgun_p4_m1", "shotpistol_shield_p1_m1", "stubrevolver_p1_m1", 
    "ogryn_gauntlet_p1_m1", "ogryn_rippergun_p1_m1", "ogryn_heavystubber_p1_m1", "ogryn_heavystubber_p2_m1", "ogryn_thumper_p1_m1", 
    "dual_autopistols_p1_m1", "dual_stubpistols_p1_m1", "needlepistol_p1_m1",
    "arc_rifle_p1_m1", "galvanic_rifle_p1_m1", "phosphor_pistol_p1_m1",
}
local all_melee_weapons = {
    "chainaxe_p1_m1", 
	"chainsword_2h_p1_m1", 
	"chainsword_p1_m1", 
	"combataxe_p1_m1", 
	"combataxe_p2_m1", 
	"combataxe_p3_m1", 
	"combatknife_p1_m1", 
	"combatsword_p1_m1", 
	"combatsword_p2_m1", 
	"combatsword_p3_m1", 
	"crowbar_p1_m1", 
	"dual_shivs_p1_m1", 
	"forcesword_2h_p1_m1", 
	"forcesword_p1_m1", 
	"ogryn_club_p1_m1", 
	"ogryn_club_p2_m1", 
	"ogryn_combatblade_p1_m1", 
	"ogryn_pickaxe_2h_p1_m1", 
	"ogryn_powermaul_p1_m1", 
	"ogryn_powermaul_slabshield_p1_m1", 
	"powermaul_2h_p1_m1", 
	"powermaul_p1_m1", 
	"powermaul_p2_m1", 
	"powermaul_p3_m1", 
	"powermaul_shield_p1_m1", 
	"powersword_2h_p1_m1", 
	"powersword_p1_m1", 
	"powersword_p2_m1", 
	"powersword_p3_m1", 
	"saw_p1_m1", 
	"thunderhammer_2h_p1_m1", 
	"transonic_sword_transonic_knife_p1_m1", 
}
local one_handed_mauls = {
    "powermaul_p1_m1", 
    "powermaul_p2_m1", "powermaul_shield_p1_m1", 
    "powermaul_p3_m1", 
}
-- ################
-- Ranged
-- ################
-- ----------------
-- Special/Flashlight
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_color_flashlight(), all_ranged_weapons, "flashlight")
add_attachments_to_list_of_weapons(mod.owo_tactical_flashlight(), all_ranged_weapons, "flashlight")
add_attachments_to_list_of_weapons(mod.owo_color_flashlight(), { "shotpistol_shield_p1_m1", "stubrevolver_p1_m1" }, "flashlight_under_small")

-- ----------------
-- Bayonet
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_bayonet_flip(), all_ranged_weapons, "bayonet")

-- ----------------
-- Muzzle
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_suppressor("muzzle", "ap_muzzle_01"), ranged_muzzle_no_double, "muzzle")
add_attachments_to_list_of_weapons(mod.owo_suppressor("muzzle", "ap_muzzle_01"), { "galvanic_rifle_p1_m1" }, "muzzle_2")
--add_attachments_to_list_of_weapons(mod.owo_suppressor("muzzle", "ap_sight_01"), {"ogryn_thumper_p1_m1"}, "muzzle")
add_attachments_to_list_of_weapons(mod.owo_suppressor("muzzle", "ap_barrel_01"), {"ogryn_heavystubber_p2_m1"}, "muzzle")

-- ----------------
-- Barrel Shroud
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_suppressor("barrel_foreskin", "ap_barrel_01"), ranged_muzzle_no_double, "barrel_foreskin")

-- ----------------
-- Barrel
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_kalashnikov_barrel(), {"autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", }, "barrel")

-- ----------------
-- OwO Underbarrel Weapon
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_underbarrel_weapon_veteran_guardsman_laspistol(), {"laspistol_p1_m1", }, "owo_underbarrel_weapon")

-- ----------------
-- Stock
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_tactical_stock(), {"autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", "autopistol_p1_m1", "bolter_p1_m1", "boltpistol_p1_m1", "lasgun_p1_m1", "lasgun_p2_m1", }, "stock")
--add_attachments_to_list_of_weapons(mod.probe_for_node(), {"lasgun_p2_m1", }, "stock")

-- ----------------
-- Magazine
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_mag(), { "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", }, "magazine")

-- ----------------
-- Sight
-- ----------------
add_attachments_to_list_of_weapons(mod.owo_iron_sight(), { "autogun_p1_m1", "autogun_p2_m1", "autogun_p3_m1", }, "sight")
add_attachments_to_list_of_weapons(mod.owo_holographic_sight(), sighted_weapons, "sight")
add_attachments_to_list_of_weapons(mod.owo_sight_reticle(), sighted_weapons, "sight_reticle")

-- ################
-- Melee
-- ################
add_attachments_to_list_of_weapons(mod.owo_slim_blade(), { "powersword_p1_m1", "powersword_p2_m1", "powersword_p3_m1", "powersword_2h_p1_m1", "forcesword_p1_m1", "forcesword_2h_p1_m1", }, "blade")
add_attachments_to_list_of_weapons(mod.owo_slim_blade("body"), {"combatsword_p1_m1", "combatsword_p2_m1", "combatsword_p3_m1", }, "body")
add_attachments_to_list_of_weapons(mod.owo_slim_blade("head"), one_handed_mauls, "head")
--[[
add_attachments_to_list_of_weapons(mod.owo_slim_blade_indicator(), { "powersword_p1_m1", "powersword_p2_m1", "powersword_2h_p1_m1", "forcesword_p1_m1", "forcesword_2h_p1_m1", }, "blade_indicator")
add_attachments_to_list_of_weapons(mod.owo_slim_blade_indicator("body"), {"combatsword_p1_m1", "combatsword_p2_m1", "combatsword_p3_m1", }, "blade_indicator")
add_attachments_to_list_of_weapons(mod.owo_slim_blade_indicator("head"), one_handed_mauls, "blade_indicator")
--table_dump(mod.owo_slim_blade(), "SLIM BLADE EXAMPLE", 9)
]]
add_attachments_to_list_of_weapons(mod.owo_invisible_shock_maul_connector(), one_handed_mauls, "connector")

add_attachments_to_list_of_weapons(mod.owo_chainsword_blade(), {"chainsword_2h_p1_m1"}, "body")
add_attachments_to_list_of_weapons(mod.owo_chainsword_chain(), {"chainsword_2h_p1_m1"}, "chain")
add_attachments_to_list_of_weapons(mod.owo_chainsword_2h_blade(), {"chainsword_p1_m1"}, "body")
add_attachments_to_list_of_weapons(mod.owo_chainsword_2h_chain(), {"chainsword_p1_m1"}, "chain")

add_attachments_to_list_of_weapons(mod.owo_rear_spike("head_rear", "ap_head_01"), {"combataxe_p1_m1", "combataxe_p2_m1", }, "head_rear")

-- ################################
-- Manual Overrides for Attachments
-- ################################
-- Generates certain requirement strings automatically, for use among multiple files
load_mod_file("fixes/shared_fix_requirements")

-- Adding the specific fixes
local special_needs_fixes = mod.special_needs_fixes
--[[
for i = 1, #(all_ranged_weapons) do
    insert_custom_fixes_for_weapon(all_ranged_weapons[i])
end
for i = 1, #(all_melee_weapons) do
    insert_custom_fixes_for_weapon(all_melee_weapons[i])
end
]]
for i = 1, #(special_needs_fixes) do
    insert_custom_fixes_for_weapon(special_needs_fixes[i])
end

-- ################################
-- Copying to Different Marks (Siblings)
-- Finds how many siblings there are, then copies the eldest to the rest
--  Done this way because pairs() does NOT guarantee order
--  Since I'm adding to the table I'm reading, it can lead to duplicates and shuffling order
--  Shuffling can mean things get missed, which happened to ilas once
-- ################################
info_if_debug("Copying attachments to all marks. Going through attachments_table_for_ewc...")
-- Preallocates table for all siblings. 150 weapons-ish
local siblings_to_add = Script.new_array(128)
local amount_of_siblings = 0
-- See which weapons have siblings
for weapon_id, _ in pairs(attachments_table_for_ewc.attachments) do
    -- If first mark of pattern, copy to the siblings
    --  Check last two characters of the name
    --  if mark 1, copy to mk 2 and 3
    --      if they exist (checks for this are handled in that function)
    info_if_debug("\tChecking "..weapon_id)
    if (string_sub(weapon_id, -2) == "m1") then
        amount_of_siblings = amount_of_siblings + 1
        siblings_to_add[amount_of_siblings] = weapon_id
    else
        mod:error("uwu [REPORT TO MOD AUTHOR] not the first mark: "..weapon_id)
    end
end
-- Copies values for each sibling
for i = 1, amount_of_siblings do
    copy_attachments_and_fixes_to_siblings(siblings_to_add[i])
end

--dump_if_debug(attachments_table_for_ewc, "uwu fuck you bitch\nALL THE FUCKING TABLE RAAAGH")

-- ################################
-- **Sending it to the actual table that gets read by the base mod**
-- This must happen BEFORE all mods are loaded, since that's when EWC looks for it.
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
    local ewc = get_mod("extended_weapon_customization")
	--	Base Mod
	if not ewc then
		mod:error(mod:localize("mod_error_missing_ewc"))
		return
	end
    --  Outdated base mod
	if get_mod("weapon_customization") then
		mod:error(mod:localize("mod_error_using_old_wcm"))
		return
	end
    --  Outdated MT Plugin
	if get_mod("weapon_customization_mt_stuff") then
		mod:error(mod:localize("mod_error_using_old_mt"))
		return
	end
	--	Plugins
	--		Just so I know. Compatibility is only an issue of name collisions
    --      Actually this is already included in the base mod
    --[[
    local other_plugins = { "visible_equipment", "extended_weapon_customization_base_additions", "extended_weapon_customization_empty_scopes", }
    for i = 1, #(other_plugins) do
        local plugin_name = other_plugins[i]
        if get_mod(plugin_name) then
            mod:info("Uwusa haz "..plugin_name.." :3")
        end
    end
    ]]

    -- Adding damage types
    mod.add_damage_types_to_ewc(ewc)
end