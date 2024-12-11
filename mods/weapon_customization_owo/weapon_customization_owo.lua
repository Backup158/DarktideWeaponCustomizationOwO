local mod = get_mod("weapon_customization_owo")
local wc
local mt

-- Prints a message to the console log containing the current version number
mod:info('WeaponCustomizationOwO v1.nya loaded uwu nya :3')

-- #########################################
-- ############### ATTENTION ###############
-- #########################################
-- The rest of this is basically a copy of the core MT plugin file
-- Functions won't load when I try to call them externally
-- I don't know why
-- #########################################

function mod.load_mod_file(relative_path)
	mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/"..relative_path)
end

-- need to get out of weapon_customization_owo/scripts/mods/weapon_customization_owo (YOU ARE HERE)
-- 4 jumps to get back to main darktide mods folder
--[[package.path = package.path .. ';../../../../weapon_customization_mt_stuff/?.lua'
--local mtMain = require 'wc_mts'
if mtMain then
	mod:error('mt main plugin found uwu nya :3')
end
]]

--[[ Importing function from MT
Shit that don't work

directly in ranged.lua
---------------------------
mt.inject_fixes(blah)
get_mod("weapon_customization_mt_stuff").inject_fixes(blah)
mt:inject_fixes(blah)
mod.mt.inject_fixes(blah)
finding mt on all mods loaded in ranged.lua

in here
-----------------------------
--mt:inject_models(variant_id, model_tables)			-- model invalid
--mt.inject_models(variant_id, model_tables)
--mtlol.inject_models(variant_id, model_tables)
		-- after creating a var named mtlol, mod:io_dofile("weapon_customization_mt_stuff/wc_mts"). tried both local and global

OK SO LOOKS LIKE YOU NEED TO DO THE mod.mt = mt
BEFORE USING mod.mt.function()
	only seems to work on functions outside of on_all_mods_loaded
]]

function mod.on_all_mods_loaded()
	-- Need to keep the get_mod here so it works after reload.
	---@class WeaponCustomizationMod
	wc = get_mod("weapon_customization")
	if not wc then
		mod:error("Weapon Customization mod required")
		return
	end
	mod.wc = wc
	--@class WeaponCustomizationMod_MT
	mt = get_mod("weapon_customization_mt_stuff")
    if not mt then
        mod:error("Weapon Customization MT plugin required")
       return 
    end
    mod.mt = mt

	local attachment_ids = {}
	local model_ids = {}

	-- Renamed because i was worried about collisions
	-- 	probably not an actual issue since methods are called with the class name, like class.method
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
	
	function mod.inject_models(variant_id, model_tables)
		if not wc.attachment_models[variant_id] then
			mod:error(string.format("model variant_id [%s] invalid", variant_id))
			return
		end
		table.merge_recursive(wc.attachment_models[variant_id], model_tables)

		model_ids[variant_id] = model_ids[variant_id] or {}
		mod.mt.table_append(model_ids[variant_id], table.keys(model_tables))
	end

	---@param variant_id VariantID
	---@param fix_tables CoreAnchorFix[]
	function mod.inject_fixes(variant_id, fix_tables)
		if not wc.anchors[variant_id] then
			mod:error(string.format("fixes variant_id [%s] invalid", variant_id))
			return
		end
		mod.mt.table_prepend(wc.anchors[variant_id].fixes, fix_tables)
		
	end
	
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