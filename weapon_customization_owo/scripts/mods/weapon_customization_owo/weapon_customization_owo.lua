local mod = get_mod("weapon_customization_owo")
local wc
local mt
local syn

-- Prints a message to the console log containing the current version number
local mod_version = "1.7.3"
mod:info('WeaponCustomizationOwO v' .. mod_version .. ' loaded uwu nya :3')

function mod.define_variables_ranged()
	local _owo_sight_2s = "owo_alt_viewmodel_01|owo_alt_viewmodel_02|owo_alt_viewmodel_03|owo_alt_viewmodel_04|owo_alt_viewmodel_05|owo_alt_viewmodel_06|owo_reticle_helper_invisible"
local _owo_no_magnifier_eotech_sights = "owo_holosight_01_01|owo_holosight_01_01ss"
local _owo_magnifier_aligned_eotech_sights = "owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_02ss_z1|owo_holosight_01_02ss_z2"
local _owo_magnifier_side_eotech_sights = "owo_holosight_01_03|owo_holosight_01_03ss"
local _owo_magnifier_eotech_sights = _owo_magnifier_aligned_eotech_sights.."|".._owo_magnifier_side_eotech_sights
local _owo_short_eotech_sights = "owo_holosight_01_01ss|owo_holosight_01_02ss_z1|owo_holosight_01_02ss_z2|owo_holosight_01_03ss"
local _owo_all_eotech_sights = _owo_no_magnifier_eotech_sights.."|".._owo_magnifier_eotech_sights
local _owo_no_magnifier_vortex_sights = "owo_holosight_02_01|owo_holosight_02_01ss"
local _owo_magnifier_aligned_vortex_sights = "owo_holosight_02_02_z1|owo_holosight_02_02_z2|owo_holosight_02_02ss_z1|owo_holosight_02_02ss_z2"
local _owo_magnifier_side_vortex_sights = "owo_holosight_02_03|owo_holosight_02_03ss"
local _owo_magnifier_vortex_sights = _owo_magnifier_aligned_vortex_sights.."|".._owo_magnifier_side_vortex_sights
local _owo_all_vortex_sights = _owo_no_magnifier_vortex_sights.."|".._owo_magnifier_vortex_sights
local _owo_forwards_acog_sights = "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_backwards_acog_sights = "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top"
local _owo_all_acog_sights = _owo_forwards_acog_sights.."|".._owo_backwards_acog_sights
local _owo_all_susat_sights = "owo_susat_01|owo_susat_01_z1|owo_susat_01_ps|owo_susat_02|owo_susat_02_z1|owo_susat_02_top"

local _owo_masterkey_bayonets = "owo_underbarrel_shotgun_01|owo_underbarrel_shotgun_01_01|owo_underbarrel_shotgun_01_02"
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"

local _infantry_autogun_receivers = "receiver_01|receiver_10"
local _braced_autogun_receivers = "receiver_03|receiver_06|receiver_07|receiver_08"
local _vigilant_autogun_receivers = "receiver_02|receiver_04|receiver_05|receiver_09|receiver_11"

local _m16_all_barrels = "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
local _m16a1_01_barrels = "owo_m16_barrel_a1|owo_m16_barrel_t_a1|owo_m16_barrel_n_a1"
local _m16a1_02_barrels = "owo_m16_barrel_a1_02|owo_m16_barrel_t_a1_02|owo_m16_barrel_n_a1_02"
local _m16a2_barrels = "owo_m16_barrel_a2|owo_m16_barrel_t_a2|owo_m16_barrel_n_a2"
local _m16_normal_post_barrels = "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2"
local _m16_tall_post_barrels = "owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2"
local _m16_no_post_barrels = "owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
local _super_short_braced_autogun_all_barrels = "barrel_08|bagun_barrel_02"
local _short_braced_autogun_barrels = "barrel_07|barrel_13|barrel_14|barrel_18|barrel_19|barrel_20"
local _short_braced_autogun_mt_barrels = "bagun_barrel_01|bagun_barrel_05|bagun_barrel_06|bagun_barrel_07|bagun_barrel_08"
local _short_braced_autogun_all_barrels = _short_braced_autogun_barrels.."|".._short_braced_autogun_mt_barrels
local _long_braced_autogun_barrels = "barrel_09|barrel_10"
local _long_braced_autogun_mt_barrels = "bagun_barrel_03|bagun_barrel_04"
local _long_braced_autogun_all_barrels = _long_braced_autogun_barrels.."|".._long_braced_autogun_mt_barrels
local _short_infantry_autogun_barrels = "barrel_04"
local _short_infantry_autogun_mt_barrels = "iagun_barrel_04"
local _short_infantry_autogun_all_barrels = _short_infantry_autogun_barrels.."|".._short_infantry_autogun_mt_barrels
local _medium_infantry_autogun_barrels = "barrel_01|barrel_02|barrel_06|barrel_21"
local _medium_infantry_autogun_mt_barrels = "iagun_barrel_01|iagun_barrel_02|iagun_barrel_06"
local _medium_infantry_autogun_all_barrels = _medium_infantry_autogun_barrels.."|".._medium_infantry_autogun_mt_barrels
local _long_infantry_autogun_barrels = "barrel_03|barrel_05"
local _long_infantry_autogun_mt_barrels = "iagun_barrel_03|iagun_barrel_05"
local _long_infantry_autogun_all_barrels = _long_infantry_autogun_barrels.."|".._long_infantry_autogun_mt_barrels
local _short_vigilant_autogun_barrels = "barrel_12|hagun_barrel_02"
local _long_vigilant_autogun_barrels = "barrel_11|barrel_15|barrel_16|barrel_22"
local _long_vigilant_autogun_mt_barrels = "hagun_barrel_01|hagun_barrel_03|hagun_barrel_04"
local _long_vigilant_autogun_all_barrels = _long_vigilant_autogun_barrels.."|".._long_vigilant_autogun_mt_barrels
local _all_default_vigilant_autogun_barrels = _short_vigilant_autogun_barrels.."|".._long_vigilant_autogun_barrels
local _all_mt_vigilant_autogun_barrels = _long_vigilant_autogun_mt_barrels
local _all_all_vigilant_autogun_barrels = _all_default_vigilant_autogun_barrels.."|".._all_mt_vigilant_autogun_barrels

local _short_infantry_lasgun_mt_barrels = "ilasgun_barrel_03"
local _long_infantry_lasgun_mt_barrels = "ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08"
local _mt_laspistol_barrels = "lpistol_barrel_01|lpistol_barrel_02|lpistol_barrel_03|lpistol_barrel_04|lpistol_barrel_05|lpistol_barrel_06|lpistol_barrel_07"
local _medium_short_helbore_mt_barrels = "hlasgun_barrel_01|hlasgun_barrel_04|hlasgun_barrel_05|hlasgun_barrel_05b" -- Medium length, short bottom
local _medium_medium_helbore_mt_barrels = "hlasgun_barrel_03"
local _long_helbore_mt_barrels = "hlasgun_barrel_02"
local _all_helbore_mt_barrels = _medium_short_helbore_mt_barrels.."|".._medium_medium_helbore_mt_barrels.."|".._long_helbore_mt_barrels

local _recon_lasgun_mt_barrels = "rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05"

local _mt_autopistol_barrels = "apistol_barrel_01|apistol_barrel_02|apistol_barrel_03|apistol_barrel_04|apistol_barrel_05"
local _mt_twin_stubber_barrels = "stubber_barrel_01|stubber_barrel_02|stubber_barrel_03|stubber_barrel_04|stubber_barrel_05"
local _mt_single_stubber_barrels = "singlestubber_barrel_01|singlestubber_barrel_02|singlestubber_barrel_03"
local _mt_combat_shotgun_barrels = "shot_barrel_01|shot_barrel_02|shot_barrel_03|shot_barrel_04|shot_barrel_07|shot_barrel_08|shot_barrel_09"
local _mt_db_shotgun_barrels = "dbshot_barrel_01|dbshot_barrel_02|dbshot_barrel_03"
local _mt_plasma_barrels = "plas_barrel_01|plas_barrel_02|plas_barrel_03"
local _mt_flamer_barrels = "flamer_barrel_01|flamer_barrel_02|flamer_barrel_03|flamer_barrel_04|flamer_barrel_05|flamer_barrel_06"
local _mt_bolter_barrels = "bolter_barrel_01|bolter_barrel_02|bolter_barrel_03|bolter_barrel_04"
local _mt_backwards_bolter_barrels = "fbolter_barrel_01|fbolter_barrel_02|fbolter_barrel_03|fbolter_barrel_04"
local _mt_ripper_barrels = "ripper_barrel_01|ripper_barrel_02|ripper_barrel_03|ripper_barrel_04|ripper_barrel_05|ripper_barrel_06"

local _syn_m41a_barrels = "syn_m41a_barrel_01|syn_m41a_barrel_02|syn_m41a_barrel_03|syn_m41a_barrel_04|syn_m41a_barrel_05|syn_m41a_barrel_06|syn_m41a_barrel_07|syn_m41a_barrel_08"
local _syn_helbore_sniper_barrels = "helbore_sniper_barrel_01|helbore_sniper_barrel_02|helbore_sniper_barrel_03|helbore_sniper_barrel_04|helbore_sniper_barrel_05|helbore_sniper_barrel_05b"
local _syn_carry_sniper_barrels = "cleaver_sniper_barrel_01|cleaver_sniper_barrel_02|cleaver_sniper_barrel_04|cleaver_sniper_barrel_05|cleaver_sniper_barrel_06"
local _syn_all_sniper_barrels = _syn_helbore_sniper_barrels.."|".._syn_carry_sniper_barrels
local _syn_pulse_barrels = "SWSMPR_barrel_01|SWSMPR_barrel_02|SWSMPR_barrel_03|SWSMPR_barrel_06|SWSMPR_barrel_07|SWSMPR_barrel_08|SWSMPR_barrel_09|SWSMPR_barrel_10|SWSMPR_barrel_11|SWSMPR_barrel_12|SWSMPR_barrel_13"
local _syn_hellgun_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03|syn_hellgun_barrel_01|syn_hellgun_barrel_02"
local _syn_carbine_barrels = "syn_carbine_barrel_01|syn_carbine_barrel_02|syn_carbine_barrel_03|syn_carbine_barrel_04|syn_carbine_barrel_05"
local _syn_aquilon_barrels = "syn_aquilonbarrel_01|syn_aquilonbarrel_01a|syn_aquilonbarrel_02|syn_aquilonbarrel_02a"
local _syn_heavy_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03"
local _syn_thompson_barrels = "syn_thompson_barrel_01|syn_thompson_barrel_02"
local _syn_rotary_barrels = "rotary_barrel_01|rotary_barrel_01a|rotary_barrel_01b|rotary_barrel_01c"
local _syn_q3_barrels = "q3_machinegun_barrel_01|q3_machinegun_barrel_01a"
local _syn_canis_barrels = "syn_vescanis_barrel_01|syn_vescanis_barrel_02"
local _syn_gauss_barrels = "syn_gk8gauss_barrel_01|syn_gk8gauss_barrel_02"
end

-- #########################################
-- ############### ATTENTION ###############
-- #########################################
-- The rest of this is basically a copy of the core MT plugin file
-- 	When possible, I called functions directly from the MT plugin to reuse code with minimal copy-pasting
--	Otherwise, many of the commands executed during on_all_mods_loaded are written directly into that function
--	In other cases, the tables the function references are ones created directly in the function body
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

	if discord then
		-- Reload Callback
		--	Reinject fixes
		mod.wc.register_definition_callback(function()
			mod.load_mod_file("files_to_load")
			mod:info("weapon attachment wewoad :3")
		end)
	end

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
