return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`extended_weapon_customization_owo` encountered an error loading the Darktide Mod Framework.")

		new_mod("extended_weapon_customization_owo", {
			mod_script       = "extended_weapon_customization_owo/scripts/mods/extended_weapon_customization_owo/extended_weapon_customization_owo",
			mod_data         = "extended_weapon_customization_owo/scripts/mods/extended_weapon_customization_owo/extended_weapon_customization_owo_data",
			mod_localization = "extended_weapon_customization_owo/scripts/mods/extended_weapon_customization_owo/extended_weapon_customization_owo_localization",
		})
	end,
	require = {
		"extended_weapon_customization",
	},
	load_after = {
		"extended_weapon_customization",
	},
	version = "4.3.1",
	packages = {},
}
