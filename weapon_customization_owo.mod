return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`weapon_customization_owo` encountered an error loading the Darktide Mod Framework.")

		new_mod("weapon_customization_owo", {
			mod_script       = "weapon_customization_owo/scripts/mods/weapon_customization_owo/weapon_customization_owo",
			mod_data         = "weapon_customization_owo/scripts/mods/weapon_customization_owo/weapon_customization_owo_data",
			mod_localization = "weapon_customization_owo/scripts/mods/weapon_customization_owo/weapon_customization_owo_localization",
		})
	end,
	packages = {},
}
