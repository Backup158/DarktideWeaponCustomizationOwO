local mod = get_mod("extended_weapon_customization_owo")

-- ################################
-- Locals for Optimization
-- ################################
local pairs = pairs
local type = type
local table = table
local table_clone = table.clone

local string = string
local string_upper = string.upper
local string_sub = string.sub
local string_regex_sub = string.gsub

-- ################################
-- Helper functions for localization
-- ################################
local function append_to_localization(localizations_table, string_to_append)
	if not type(string_to_append) == "string" then
		mod:error("Trying to append nonstring! I can't tell you where though hehe")
		return
	end
	if not type(localizations_table) == "table" then
		mod:error("Localization table is not a table! When appending: "..string_to_append)
		return
	end
	local new_local = table_clone(localizations_table)
	new_local.en = new_local.en.." "..string_to_append
	return new_local
end

-- ---------------
-- Generic Localization
-- ---------------
-- -------
local function internal_name_to_english(attachment_name_string)
	local final_string
	-- Removing my prefix because the group label in the menu implies it
	final_string, _ = string_regex_sub(attachment_name_string, "owo_", "")
	-- Capitalize every word
	final_string, _ = string_regex_sub(attachment_name_string, "_%a", string_upper)
	-- Convert underscore to space
	final_string, _ = string_regex_sub(attachment_name_string, "_", " ")
	return final_string
end
local function generic_localization(attachment_name_string) 
	return {
		en = internal_name_to_english(attachment_name_string),
	}
end

-- ---------------
-- Localizing a group of attachments
-- For all names, use specific localization or generic
-- ---------------
local function localize_all_from_group(attachment_names, localizations_to_use)
	for _, attachment_name in pairs(attachment_names) do
		local final_localization
		if localizations_to_use and localizations_to_use[attachment_name] then
			final_localization = localizations_to_use[attachment_name]
		else
			final_localization = generic_localization(attachment_name)
		end

		mod:add_global_localize_strings({
			["loc_"..attachment_name] = final_localization,
		})
	end
end

-- ################################
-- Localizations for the base mod to use
-- ################################
-- ###############
-- Custom Slots
-- ###############
mod:add_global_localize_strings({
	-- ------------------------------
	-- Separators
	-- ------------------------------
	-- ---------------
	-- Mod Name
	-- ---------------
    loc_ewc_extended_weapon_customization_owo = {
        en = "Ostracized without Objection (OwO)",
    },
	-- ---------------
	-- Attachment Slots
	-- ---------------
	attachment_slot_flashlight_under_small = {
        en = "Flashlight (Under)",
    },
	-- ---------------
	-- Separator groups
	-- ---------------
	-- 	Flashlights
	--		DONE IN ./attachments/owo_flashlight.lua
	-- ------------------------------
	-- Attachment Display Names
	-- ------------------------------
	loc_owo_tactical_stock_telescoping_in = {
		en = "Tactical Stock - Telescoping (Pushed in)",
	},
	loc_description_owo_tactical_stock_telescoping_in = {
		en = "Tactical Stock - Telescoping (Pushed in)",
	},
	loc_owo_tactical_stock_folded_n_1 = {
		en = "Tactical Stock - Folded (Natural, Left)",
	},
	loc_owo_tactical_stock_folded_n_m = {
		en = "Tactical Stock - Folded M (Natural, Left)",
	},
	loc_owo_tactical_stock_folded_n_u = {
		en = "Tactical Stock - Folded (Natural, Under)",
	},
})

-- ###############
-- Attachments
-- ###############
-- ---------------
-- Flashlights
-- ---------------
-- Flashlight Groups are handled in owo_flashlight.lua
-- too many variables to carry over here
-- ---------------
-- Slim Blades
-- ---------------
local slim_blade_names = {
	psword = Localize("loc_weapon_family_powersword_p1_m1"), 
	pfalchion = Localize("loc_weapon_family_powersword_p2_m1"), 
	["2h_psword"] = Localize("loc_weapon_family_powersword_2h_p1_m1"),
	["2h_psword_short"] = Localize("loc_weapon_family_powersword_2h_p1_m1").." (Short)",
	fsword = Localize("loc_weapon_family_forcesword_p1_m1"),
	["2h_fsword"] = Localize("loc_weapon_family_forcesword_2h_p1_m1"),
	["2h_fsword_short"] = Localize("loc_weapon_family_forcesword_2h_p1_m1").." (Short)",
	dclaw = Localize("loc_weapon_family_combatsword_p1_m1"), 
	hsword = Localize("loc_weapon_family_combatsword_p2_m1"), 
}
for attachment_name_code, human_name in pairs(slim_blade_names) do
	mod:add_global_localize_strings({
		["loc_ewc_owo_slim_blade_flat_"..attachment_name_code] = {
			en = "OwO Slim Blades - Flat "..human_name
		},
		["loc_ewc_owo_slim_blade_flat_"..attachment_name_code.."_g"] = {
			en = "OwO Slim Blades - Flat "..human_name.." (Grip)"
		},
		["loc_ewc_owo_slim_blade_slim_"..attachment_name_code] = {
			en = "OwO Slim Blades - Slim "..human_name
		},
		["loc_ewc_owo_slim_blade_slim_"..attachment_name_code.."_g"] = {
			en = "OwO Slim Blades - Slim "..human_name.." (Grip)"
		},
	})
end
-- ---------------
-- Suppressors
-- ---------------
local suppressor_localizations = {
	ewc_owo_suppressor = {
		en = "OwO - Suppressors"
	},
	owo_suppressor_01 = {
		en = "Double Suppressor 01"
	},
	owo_suppressor_02 = {
		en = "Double Suppressor 02"
	},
	owo_suppressor_03 = {
		en = "PBS-1 Suppressor"
	},
	owo_suppressor_04 = {
		en = "Heavy Metal Suppressor 01"
	},
	owo_suppressor_05 = {
		en = "Heavy Metal Suppressor 02"
	},
	owo_suppressor_wrapped_01 = {
		en = "Wrapped Suppressor 01"
	},
} 
for attachment_name, localizations in pairs(suppressor_localizations) do
	mod:add_global_localize_strings({
		["loc_"..attachment_name] = localizations,
	})
	mod:add_global_localize_strings({
		["loc_"..attachment_name.."_slim"] = append_to_localization(localizations, "(Slim)"),
	})
end
-- ---------------
-- Tactical Stocks
-- ---------------
local tactical_stock_localizations = {

}

-- ################################
-- Mod Options and Data
-- ################################
local localizations = {
	mod_name = {
		en = "EWC - OwO (Ostracized without Objection)",
		["zh-cn"] = "武器自定义扩展 - OwO（Ostracized without Objection）",
		ru = "Настройка оружия - OwO (Ой мне так нравится мм долбиться в задницу)",
		-- ru = "Настройка оружия - пизда",
	},
	mod_description = {
		en = "Extended Weapon Customization plugin adding various parts, typically inspired by historical and tacticool weapons.",
		["zh-cn"] = "为武器自定义扩展插件添加各种附件,这些附件受史实武器及tacticool启发",
		ru = "Если кто-то присылает вам «UwU», не ломайте себе голову в поиске ответа, пытаясь понять, что вообще это означает. Это слово нельзя расшифровать по буквам. Вместо этого термин используется, как эмодзи для обозначения реакции на что-то милое или радующее вас. Представьте картину милого котёнка, который залез с лапками в блюдце с молоком. Это так мило, что почти отвратительно, и ваша первая реакция, скорее всего, «Ой! Как восхитительно» или «UwU», что произносится как «ooh woo».",
	},
	debug_mode = {
		en = "Debug Mode",
	},
	debug_mode_description = {
		en = "Verbose printing",
	},
	owo_mode = {
		en = "OwO Mode",
	},
	owo_mode_description = {
		en = "UwUified descriptions on the mod options page >:3\nRequires a game restart/reload to apply.",
		ru = "гей порно с обезьянами и с энди",
	},
	discord_mode = {
		en = "Discord Compatibility for EWC Beta Release",
		ru = "Виртуальная служба знакомств",
	},
	discord_mode_description = {
		en = "Enables developer features or supported weapons that are only available in the EWC beta releases in the Darktide Modders Discord.\nRequires a game restart/reload to apply.",
		ru = "Как же хочется тяночку. Как же хочется худенькую, бледную, не очень высокую, девственную, нецелованную, с тонкими руками, небольшими ступнями, синяками под глазами, растрёпанными или неуложенными волосами, ненакрашенную, забитую хикку, лохушку без друзей и подруг, закрытую социофобку, одновременно мечтающую о ком-то близком, чтобы зашёл к ней в мирок, но ничего не ломал по возможности, дабы вместе с ней изолироваться от неприятного социума. БОЖЕ КАК ЖЕ МНЕ ПЛОХО БЕЗ ТЯНОЧКИ.",
		es = "Holii este mod somos unas kitten con unos servicios muy variados, estamos buscando buyers para complacerlos y hacerlos felices con sus deseos y caprichos uwu.",
	},
	discord_mode_message = {
		--en = "You have enabled Discord compatibility mode. Make sure you have the latest beta releases for the base EWC mod (and Syn's Edits if you use it)! These are found in the Darktide Modders Discord [https://discord.gg/rKYWtaDx4D], in the pinned messages of the #weapon-customization-mod channel and the Syndonai's Edits thread in #creation-showcase, respectively. Remember to restart/reload the game.",
		en = "You have enabled Discord compatibility mode, which currently does nothing."
	},
	loc_owo_suppressor_01 = {
		en = "OwO Suppressor 1",
	},
	loc_description_owo_suppressor_01 = {
		en = "Metal suppressor"
	},
}

if mod:get("owo_mode") then
	localizations["mod_name"]["en"] = "EWC - OwO (O-ostwacized *runs away* without Objection >w<)"
	localizations["mod_description"]["en"] = "E-e-extended Weapon ^w^ Customization plugin ;;w;; adding vawious pawts, typicawwy inspiwed >w< by *whispers to self* histowicaw and tacticoow weapons."
	localizations["mod_description"]["ru"] = "У меня в арсенале всего одна маленькая анальная пробка, так что мне явно нужно еще много времени, чтобы научиться комфортно принимать член"
	localizations["debug_mode"]["en"] = "Debug M-m-mode *walks away*"
	localizations["debug_mode_description"]["en"] = "V-Vewbose pwinting"
	localizations["owo_mode"]["en"] = "Notices Buldge OWO what's this?"
	localizations["owo_mode_description"]["en"] = "UwUified ;;w;; descwiptions on the x3 mod options *whispers to self* page *twerks* >:3 Wequiwes a game westawt/wewoad (・`ω´・) to *looks at you* apply."
	localizations["discord_mode"]["en"] = "discord kitten mode uwu"
	localizations["discord_mode_description"]["en"] = ":3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 :3 "
	localizations["discord_mode_description"]["ru"] = "Меня заставили стать котом. Помогите Как выйти из этого порочного круга."
	localizations["discord_mode_message"]["en"] = "imaginye expecting *walks away* usefuw infowmation UwU f-f-fwom the x3 uwu bwothew fuckew wmao ^-^"
end

return localizations

