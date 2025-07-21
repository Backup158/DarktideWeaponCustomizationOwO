local mod = get_mod("weapon_customization_owo")
local wc
local mt
local syn

-- Prints a message to the console log containing the current version number
local mod_version = "2.1.0"
mod:info('WeaponCustomizationOwO v' .. mod_version .. ' loaded uwu nya :3')

 -- Locals from Weapon Customization plugin template
 local vector3_box = Vector3Box
 local _item = "content/items/weapons/player"
 local _item_ranged = _item.."/ranged"
 local _item_melee = _item.."/melee"
 local _item_minion = "content/items/weapons/minions"

-- #################
-- Alternative Prepend Function
-- 	Which isn't even necessary to have here
--	The original prepends the whole table as is, preserving the order
--	This way prepends each item, so in the end it'll be be in reverse order
-- 	Since this is used for fixes, this'll end up putting the dependencies at the end
-- 		which probably messes things up lol
-- #################
--function mod.table_prepend_reverse(table_to_prepend_to, items)
--	for _, item in ipairs(items) do
--		table.insert(table_to_prepend_to, 1, item)
--	end
--end

-- #########################################
-- ############### ATTENTION ###############
-- #########################################
-- The rest of this is basically a copy of the core MT plugin file
-- 	When possible, I called functions directly from the MT plugin to reuse code with minimal copy-pasting
--	Otherwise, many of the commands executed during on_all_mods_loaded are written directly into that function
--	In other cases, the tables the function references are ones created directly in the function body
-- My original works are wrapped in the :3 banners
-- Feel free to steal those
-- #########################################

function mod.load_mod_file(relative_path)
	mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/"..relative_path)
end

function mod.on_all_mods_loaded()
	-- Checks for installed mods. Kept here so it works after reload.
	---@class WeaponCustomizationMod
	wc = get_mod("weapon_customization")
	if not wc then
		mod:error("Extended Weapon Customization mod required")
		return
	end
	mod.wc = wc
	---@class WeaponCustomizationMod_MTStuff
	mt = get_mod("weapon_customization_mt_stuff")
    if not mt then
    	mod:error("Weapon Customization MT plugin required")
    	return 
    end
    mod.mt = mt
	---@class WeaponCustomization_synedits
	--		Checking to apply compatibility patches later
	syn = get_mod("weapon_customization_syn_edits")
    if syn then
		mod:info("Uwusa haz Syn's edits :3")
    end
    mod.syn = syn

	local attachment_ids = {}
	local model_ids = {}
	local debug = mod:get("debug_mode")
	local discord = mod:get("discord_mode")

	
	-- Reload Callback
	--	Reinject fixes
	mod.wc.register_definition_callback(function()
		mod.load_mod_file("files_to_load")
		mod:info("weapon attachment wewoad :3")
	end)
	

	-- Renamed because initially I was worried about collisions
	-- 		Not an actual issue since methods are called with the class name, like class.method
	--		so mod.inject_attachments is different from mod.mt.inject_attachments
	-- Functionally the same but I changed the prefix checking in the displayed names so it's OwO instead of MT
	function mod.inject_attachments_owo(variant_id, slot, attachments_table)
		if not wc.attachment[variant_id] then
			mod:error(string.format("attachment variant_id [%s] invalid", variant_id))
			return
		end
		if not wc.attachment[variant_id][slot] then
			mod:error(string.format("attachment slot [%s.%s] invalid", variant_id, slot))
			return
		end

		attachment_ids[variant_id] = attachment_ids[variant_id] or {}
		attachment_ids[variant_id][slot] = attachment_ids[variant_id][slot] or {}

		for _, attachment in ipairs(attachments_table) do
			-- I'm just going to add the prefix manually so I can choose which ones don't have the prefix
			--if debug then mod:info("Checking substring: '"..string.sub(attachment.name, 1, 4).."'") end
			--if not string.sub(attachment.name, 1, 4) == "OwO " then
			--	attachment.name = "OwO "..attachment.name
			--	if debug then mod:info("New name: "..attachment.name) end
			--end

			table.insert(wc.attachment[variant_id][slot], attachment)
			table.insert(attachment_ids[variant_id][slot], attachment.id)
		end
	end
	
	-- Since this function directly accesses model_ids, it cannot be imported from MT
	--	model_ids table is created by this mod
	function mod.inject_models(variant_id, model_tables)
		if not wc.attachment_models[variant_id] then
			mod:error(string.format("model variant_id [%s] invalid", variant_id))
			return
		end
		table.merge_recursive(wc.attachment_models[variant_id], model_tables)

		model_ids[variant_id] = model_ids[variant_id] or {}
		mod.mt.table_append(model_ids[variant_id], table.keys(model_tables))
	end

	--[[
	---@param variant_id VariantID
	---@param fix_tables CoreAnchorFix[]
	-- Each weapon calls this directly from the MT plugin
	function mod.inject_fixes(variant_id, fix_tables)
		if not wc.anchors[variant_id] then
			mod:error(string.format("fixes variant_id [%s] invalid", variant_id))
			return
		end
		mod.mt.table_prepend(wc.anchors[variant_id].fixes, fix_tables)
	end
	]]

	-- ############################################################################
	-- :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 
	-- Helper Functions
	-- I need these here because they rely on mod.inject_attachments_owo() and mod.inject_models(), which are only defined on all mods loaded
	-- :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 
	-- ############################################################################
	-- ######
	-- Creating a New Custom Slot
	-- DESCRIPTION: In the melee/ranged files, create a slot and inserts to the slot table
	-- PARAMETER(S):
	--		string: slot_name
	--		table: slot_localization_table
	-- RETURN: N/A
	-- ######
	function mod.create_custom_slot(slot_name, slot_localization_table)
		table.insert(mod.wc.attachment_slots, slot_name)
		mod:add_global_localize_strings({
			["loc_weapon_cosmetics_customization_"..slot_name] = slot_localization_table
		})
	end

	-- ######
	-- Creating an Empty Default Attachment
	-- DESCRIPTION: Creates an attachment with no model, to use as the default
	--		Automatically named owo_<slot_name>_default. Keeping the owo prefix to avoid any possible collisions
	--		I find that unlikely, and even more unlikely that that causes problems, but fuck it
	-- PARAMETER(S):
	--		string: this_variant
	--		string: slot_name
	-- RETURN: N/A
	-- ######
	function mod.create_default_attachment(this_variant, slot_name)
		mod.inject_attachments_owo(this_variant, slot_name, {
			{id = "owo_"..slot_name.."_default", name = "Empty "..slot_name},
		})
		mod.inject_models(this_variant, {
			["owo_"..slot_name.."_default"] = {
				model = "", type = slot_name,
			},
		})
	end

	-- ######
	-- Initialize Custom Slot for Weapon
	-- DESCRIPTION: Creates an empty table for the slot, then adds an empty default
	--		Doesn't require a parent, since it's invisible and we won't see it anyways, so defaulting is fine
	-- PARAMETER(S):
	--		string: slot_name
	--		table: slot_localization_table
	-- RETURN: N/A
	-- ######
	function mod.initialize_custom_slot_for_weapon(this_variant, slot_name)
		mod.wc.attachment[this_variant][slot_name] = {}
		mod.create_default_attachment(this_variant, slot_name)
	end

	-- ######
	-- Initialize Table of Custom Slot for Weapon
	-- DESCRIPTION: For batch usage of initialize_custom_slot_for_weapon
	-- PARAMETER(S):
	--		string: this_variant
	--		table: table_of_slot_names
	--			table of strings
	-- RETURN: N/A
	-- ######
	function mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_slot_names)
		for _, slot_name in ipairs(table_of_slot_names) do
			mod.initialize_custom_slot_for_weapon(this_variant, slot_name)
		end
	end

	-- ######
	-- Hide Slot
	-- DESCRIPTION: To hide unused slots
	-- 		Not directly injecting them to avoid overhead
	-- PARAMETER(S):
	--		string: slot_name
	--		table: table_of_dependencies
	--			table of strings
	-- RETURN: N/A
	-- ######
	function mod.hide_slot(slot_name, table_of_dependencies)
		return {
			dependencies = table_of_dependencies,
			[slot_name] = {
				-- Send it into the stratosphere so it won't interfere with using modding_tools
				position = vector3_box(0, 0, 2),
				hide_mesh = { {slot_name, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }, 
				automatic_equip = { slot_name = "owo_"..slot_name.."_default" }, 
			},
		}
	end

	-- NOTE: For Hide Slot MASTER, it does NOT work because we'd need to deep copy the tables

	-- ######
	-- Create Indicator Group
	-- DESCRIPTION: Creates Indicator groups for fixes efficiency
	-- PARAMETER(S):
	--		string: variant_id
	--			name of weapon family
	--		string: name of slot indicator is for
	--		table: table_of_indicators
	--			table of id and name strings
	-- RETURN: N/A
	-- ######
	function mod.create_group_indicator(variant_id, slot_name, table_of_indicators)
		--local indicator_slot = slot_name.."_group_indicator"
		local indicator_slot = slot_name
		mod.inject_attachments_owo(variant_id, indicator_slot, table_of_indicators)
		local models_for_indicators = {}
		for _, indicator in ipairs(table_of_indicators) do
			models_for_indicators[indicator["id"]] = { model = "", type = indicator_slot, }
		end
		mod.inject_models(variant_id, models_for_indicators)
	end

	-- ############################################################################
	-- :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 
	-- ############################################################################

	
	-- Applies all the fixes you injected into each weapon
	mod.load_mod_file("files_to_load")

	-- Basic id validation
	table.sort(attachment_ids)
	table.sort(model_ids)

	local missing = false

	for variant_id, slots in pairs(attachment_ids) do
		for slot, attachments in pairs(slots) do
			for _, attachment_id in ipairs(attachments) do
			if not table.contains(model_ids[variant_id], attachment_id) then
				__print(("Missing model for wc.attachments[%s][%s] {id = \"%s\"}"):format(variant_id, slot, attachment_id))
				missing = true
			end
			end
		end
	end

	for variant_id, models in pairs(model_ids) do
		for _, model_id in ipairs(models) do
			local found = false
			for slot, slot_attachment_ids in pairs(attachment_ids[variant_id]) do
				if table.contains(slot_attachment_ids, model_id) then
					found = true
					break
				end
			end
			if not found then
				__print(("Missing attachment for wc.attachment_models[%s][%s]"):format(variant_id, model_id))
				missing = true
			end
		end
	end

	if missing then
		mod:error("Check console log. A-a-attachmeownt ow ***whispers to self*** modew i-issues found >.<")
	end
end
