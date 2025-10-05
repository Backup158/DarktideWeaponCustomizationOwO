local mod = get_mod("extended_weapon_customization_owo")

-- Localizations for the base mod to use
mod:add_global_localize_strings({
	-- Mod Name for the separators
    loc_ewc_extended_weapon_customization_owo = {
        en = "Ostracized without Objection (OwO)",
    },
	-- Custom separator names
	
	-- Attachment Display Names
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
local slim_blade_names = {
	psword = "Power Sword", 
	pfalchion = "Power Falchion", 
	["2h_psword"] = "Relic Blade",
	["2h_psword_short"] = "Relic Blade (Short)",
	fsword = "Force Sword",
	["2h_fsword"] = "Force Greatsword",
	["2h_fsword_short"] = "Force Greatsword (Short)",
	dclaw = "\"Devil's Claw\" Sword", 
	hsword = "Heavy Sword/Falchion", 
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

