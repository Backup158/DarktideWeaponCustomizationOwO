local mod = get_mod("weapon_customization_owo")
local wc
local mt
local syn

-- Prints a message to the console log containing the current version number
local mod_version = "1.0"
mod:info('WeaponCustomizationOwO v' .. mod_version .. ' loaded uwu nya :3')

-- #########################################
-- ############### ATTENTION ###############
-- #########################################
-- The rest of this is basically a copy of the core MT plugin file
-- 	Many of the commands executed during on_all_mods_loaded are written directly into that function instead of being in their own independent functions
--	and the tables are accessed directly by the function body
--		passing them as args would be pretty redundant to keep pasting
--		maybe it'd be callable if the mt plugin wrote it as 'mod.model_ids' but who cares lol
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

	-- Renamed because i was worried about collisions
	-- 		not an actual issue since methods are called with the class name, like class.method
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
			if not string.sub(attachment.name, 1, 4) == "OwO " then
				attachment.name = "OwO "..attachment.name
			end

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
	
	-- Applies all the fixes you injected into each wepaon
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
