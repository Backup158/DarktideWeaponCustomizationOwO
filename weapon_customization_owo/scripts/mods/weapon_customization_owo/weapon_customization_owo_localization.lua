local mod = get_mod("weapon_customization_owo")

local localizations = {
	mod_name = {
		en = "Weapon Customization - OwO (Ostracized without Objection)",
		["zh-cn"] = "武器自定义扩展 - OwO（Ostracized without Objection）",
		ru = "Настройка оружия - OwO (Ой мне так нравится мм долбиться в задницу)",
		-- ru = "Настройка оружия - пизда",
	},
	mod_description = {
		en = "Weapon Customization plugin adding various parts, typically inspired by historical and tacticool weapons.",
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
		--en = "OwO",
	},
	owo_mode_description = {
		en = "UwUified descriptions on the mod options page >:3\nRequires a game restart/reload to apply.",
		--en = ">:3",
	},
	discord_mode = {
		en = "EWC Discord Release Compatibility"
	},
	discord_mode_description = {
		en = "Has no effect on which parts are available.\nEnables developer features that are only available in the EWC beta releases in the Darktide Modders Discord.\nRequires a game restart/reload to apply."
	},
}

if mod:get("owo_mode") then
	localizations["mod_name"]["en"] = "Weapon Customization - OwO (O-ostwacized *runs away* without Objection >w<)"
	localizations["mod_description"]["en"] = "Weapon Customization plugin adding vawious pawts, typicawwy inspiwed >w< by *whispers to self* histowicaw and tacticoow weapons."
	localizations["mod_description"]["ru"] = "У меня в арсенале всего одна маленькая анальная пробка, так что мне явно нужно еще много времени, чтобы научиться комфортно принимать член"
	localizations["debug_mode"]["en"] = "Debug M-m-mode *walks away*"
	localizations["debug_mode_description"]["en"] = "V-Vewbose pwinting"
	localizations["owo_mode"]["en"] = "OwO Mode"
	localizations["owo_mode_description"]["en"] = "UwUified ;;w;; descwiptions on the x3 mod options *whispers to self* page *twerks* >:3 Wequiwes a game westawt/wewoad (・`ω´・) to *looks at you* apply."
end

return localizations

