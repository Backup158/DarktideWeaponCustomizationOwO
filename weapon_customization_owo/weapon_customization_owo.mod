return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`weapon_customization_owo` encountered an error loading the Darktide Mod Framework.")

		new_mod("weapon_customization_owo", {
			mod_script       = "weapon_customization_owo/scripts/mods/weapon_customization_owo/weapon_customization_owo",
			mod_data         = "weapon_customization_owo/scripts/mods/weapon_customization_owo/weapon_customization_owo_data",
			mod_localization = "weapon_customization_owo/scripts/mods/weapon_customization_owo/weapon_customization_owo_localization",
		})
	end,
	require = {
		 "weapon_customization",
		 "weapon_customization_mt_stuff",
	},
	load_after = {
		 "weapon_customization",
		 "for_the_drip",
		 "weapon_customization_no_gun",
	},
	load_before = {
		"weapon_customization_syn_edits",
		"weapon_customization_mt_stuff",
	},
	packages = {},
}
