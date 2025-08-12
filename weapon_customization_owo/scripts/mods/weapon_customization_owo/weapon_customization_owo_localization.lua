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
		ru = "гей порно с обезьянами и с энди",
	},
	discord_mode = {
		en = "Compatibility for EWC Beta Release",
		ru = "Виртуальная служба знакомств",
	},
	discord_mode_description = {
		en = "Enables developer features or supported weapons that are only available in the EWC beta releases in the Darktide Modders Discord.\nRequires a game restart/reload to apply.",
		ru = "Как же хочется тяночку. Как же хочется худенькую, бледную, не очень высокую, девственную, нецелованную, с тонкими руками, небольшими ступнями, синяками под глазами, растрёпанными или неуложенными волосами, ненакрашенную, забитую хикку, лохушку без друзей и подруг, закрытую социофобку, одновременно мечтающую о ком-то близком, чтобы зашёл к ней в мирок, но ничего не ломал по возможности, дабы вместе с ней изолироваться от неприятного социума. БОЖЕ КАК ЖЕ МНЕ ПЛОХО БЕЗ ТЯНОЧКИ.",
		es = "Holii este mod somos unas kitten con unos servicios muy variados, estamos buscando buyers para complacerlos y hacerlos felices con sus deseos y caprichos uwu.",
	},
	discord_mode_message = {
		en = "You have enabled Discord compatibility mode. Make sure you have the latest beta releases for the base EWC mod (and Syn's Edits if you use it)! These are found in the Darktide Modders Discord [https://discord.gg/rKYWtaDx4D], in the pinned messages of the #weapon-customization-mod channel and the Syndonai's Edits thread in #creation-showcase, respectively. Remember to restart/reload the game.",
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
	localizations["discord_mode_description"]["ru"] = "Меня заставили стать котом. Помогите Как выйти из этого порочного круга."
end

return localizations

