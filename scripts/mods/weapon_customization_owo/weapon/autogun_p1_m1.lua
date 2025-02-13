local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "autogun_p1_m1" -- Braced/Infantry/Vigilant Autoguns

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
if not mod.syn then -- these slots already exist in Syn's plugin
    mod.wc.attachment[this_variant].barrelshroud = {}
    mod.wc.attachment[this_variant].barrelshroudac = {}
    mod.wc.attachment[this_variant].barrelshroudac2 = {}
    mod.wc.attachment[this_variant].barrelshroudac3 = {}
    mod.wc.attachment[this_variant].barrelshroudac4 = {}
    mod.wc.attachment[this_variant].barrelshroudac5 = {}
    mod.wc.attachment[this_variant].barrelshroudac6 = {}
end
mod.wc.attachment[this_variant].muzzle_2 = {} -- MT and Syn didn't add this to autoguns yet

mod.wc.attachment[this_variant].foregripac1 = {}
mod.wc.attachment[this_variant].foregripac2 = {}
mod.wc.attachment[this_variant].foregripac3 = {}

mod.wc.attachment[this_variant].bayonetac1 = {}
mod.wc.attachment[this_variant].bayonetac2 = {}
mod.wc.attachment[this_variant].bayonetac3 = {}
mod.wc.attachment[this_variant].bayonetac4 = {}
mod.wc.attachment[this_variant].bayonetac5 = {}
mod.wc.attachment[this_variant].bayonetac6 = {}
mod.wc.attachment[this_variant].bayonetac7 = {}

mod.wc.attachment[this_variant].owo_magac1 = {}
mod.wc.attachment[this_variant].owo_magac2 = {}
mod.wc.attachment[this_variant].owo_magac3 = {}
mod.wc.attachment[this_variant].owo_magac4 = {}
mod.wc.attachment[this_variant].owo_magac5 = {}
mod.wc.attachment[this_variant].sightac1 = {}
--[[ Covered by MT Plugin 
mod.wc.attachment[this_variant].gripac = {}
mod.wc.attachment[this_variant].sightac2 = {}
mod.wc.attachment[this_variant].sightac3 = {}
mod.wc.attachment[this_variant].sightac4 = {}
]]
mod.wc.attachment[this_variant].sightac5 = {}
mod.wc.attachment[this_variant].sightac6 = {}
mod.wc.attachment[this_variant].sightac7 = {}
mod.wc.attachment[this_variant].sight_secondary = {}
mod.wc.attachment[this_variant].sight_secondary_ac1 = {}
mod.wc.attachment[this_variant].sight_secondary_ac2 = {}
mod.wc.attachment[this_variant].receiverac1 = {}
mod.wc.attachment[this_variant].receiverac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_dreg_gunner_barrel(this_variant, "barrel")
mod.owo_dreg_gunner_bayonet(this_variant, "bayonet")
mod.owo_fin_grip(this_variant, "grip")
mod.owo_suppressor(this_variant, "muzzle")
mod.owo_jungle_mag(this_variant, "magazine")
mod.owo_m16_barrel(this_variant, "barrel")
mod.owo_bayonet(this_variant, "bayonet")
mod.owo_underbarrel_gl(this_variant, "bayonet")
mod.owo_underbarrel_shotgun(this_variant, "bayonet")
mod.owo_condom(this_variant, "muzzle")
mod.owo_m16_sight(this_variant, "sight")
mod.owo_pu_scope(this_variant, "sight")
mod.owo_telescopic_sight(this_variant, "sight")
mod.owo_holosight(this_variant, "sight")
mod.owo_wood_krieg(this_variant, "barrel")
mod.owo_helbore_mas49(this_variant, "receiver")
mod.owo_magazine_flat(this_variant, "magazine")
mod.owo_magazine_magpull(this_variant, "magazine")
mod.owo_tactical_foregrip(this_variant, "foregrip")

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
    -- ######
	-- Receiver: BOLT ACTION HELBORE
	-- ######
	{	dependencies = {"owo_bolt_helbore_01|owo_bolt_helbore_02|owo_bolt_helbore_03|owo_bolt_helbore_04|owo_bolt_helbore_05"},
		receiver = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		receiverac1 = {offset = true, position = vector3_box(0.025, -0.026, 0.1), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.55, 0.45, 0.55 ) },
		receiverac2 = {offset = true, position = vector3_box(0, 0.024, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.6, 0.5, 1 ) },
	},
    -- ######
	-- Receiver: HELBORE MAS-49
	-- ######
	{	dependencies = {"owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05"},
        receiver = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies = {"owo_helbore_mas49_01_s"},
        receiver = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.69, 1, 1 ) },
    },
    {	dependencies = {"owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s"},
        receiverac1 = {offset = true, position = vector3_box(0.031, -0.016, 0.022), rotation = vector3_box(-90, 0, 90), scale = vector3_box(0.518, 0.573, 0.545 ) },
        receiverac2 = {offset = true, position = vector3_box(0.046, 0.18, 0.096), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.755, 0.755, 0.15 ) },
        stock = {offset = true, position = vector3_box(0, -0.042, 0.008), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies = {"owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s",
            "hlasgun_grip_01|hlasgun_grip_02|hlasgun_grip_03"
        },
        grip = {offset = true, position = vector3_box(0, -0.006, 0.008), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },

    -- ######
	-- Magazine: FLAT
	-- ######
	{	dependencies = {"owo_lasgun_magazine_flat_01"},
		magazine = {offset = true,scale = vector3_box(1, 1, 0.5 ) },
	},
	{	dependencies = {"owo_autogun_magazine_flat_03"},
		magazine = {offset = true, scale = vector3_box(1, 1, 0.6 ) },
	},

    -- ######
    -- DREG GUNNER BARREL
    -- ######
    -- Iag
    {   dependencies = {"owo_dreg_barrel_01",
            "receiver_01|receiver_10"
        },
        barrel =        { offset = true,    position = vector3_box(0, 0, -0.014),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud =  { offset = true,    position = vector3_box(0, 0, -0.014),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.24, 0.7, 0.24) }, 
    },
    -- Brautos
    {   dependencies = {"owo_dreg_barrel_01",
            "receiver_03|receiver_06|receiver_07|receiver_08"
        },
        barrel =        { offset = true,    position = vector3_box(0, 0, 0.025),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud =  { offset = true,    position = vector3_box(0, 0, 0.025),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.24, 0.7, 0.24) }, 
    },
    -- Headhunters
    {   dependencies = {"owo_dreg_barrel_01",
            "receiver_02|receiver_04|receiver_05|receiver_09"
        },
        barrel =        { offset = true,    position = vector3_box(0, 0, -0.012),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud =  { offset = true,    position = vector3_box(0, 0, -0.012),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.24, 0.7, 0.24)}, 
    },
	{   dependencies = {"owo_dreg_barrel_01"},
        -- inner barrel
        -- outer barrel with front post
        -- bayonet lug
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0, -0.115),       rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 2.45, 0.8) }, 
        -- hand grip for long receiver
        barrelshroudac3 =   { offset = true,    position = vector3_box(0, 0, -0.215),       rotation = vector3_box(0, 0, 0),    scale = vector3_box(2, 1.5, 2.5) }, 
        -- hand grip (top)
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.153, 0.115),    rotation = vector3_box(180, 0, 0),  scale = vector3_box(2.4, 0.969, 2.85) }, 
        flashlight =        {offset = true,     position = vector3_box(0.096, 0.17, 0.0),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.7, 2.7, 2.7) },
        muzzle =            {offset = true,     position = vector3_box(0, 1, 0),            rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.2, 2.2, 2.2) },
    },
    -- Helbore bayonets
	{   dependencies = {"owo_dreg_barrel_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = {offset = true,   position = vector3_box(0, 0.699, -0.095),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.5, 1.7, 3.0) },
    },

    -- ######
    -- Foregrip: TACTICAL FOREGRIP
    -- ######
    -- skeletal shotgun
    {   dependencies = {"owo_tactical_foregrip_01"},
        foregrip = {offset = true,   position = vector3_box(0, 0.605, -0.045),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 0.8, 1.0) },
    },
    -- skeletal shotgun (slant)
    {   dependencies = {"owo_tactical_foregrip_02"},
        foregrip = {offset = true,   position = vector3_box(0, 0.545, -0.035),   rotation = vector3_box(15, 0, 0),    scale = vector3_box(1.2, 0.6, 0.7) },
    },
    -- skeletal brauto (slant)
    {   dependencies = {"owo_tactical_foregrip_03"},
        foregrip = {offset = true,   position = vector3_box(0, 0.555, -0.02),   rotation = vector3_box(10, 0, 0),    scale = vector3_box(0.8, 1.0, 0.8) },
    },
    -- magpul afg triple threat
    {   dependencies = {"owo_tactical_foregrip_04"},
        foregrip = {offset = true,   position = vector3_box(-0.0, 0.34, 0.022),   rotation = vector3_box(-67, 0, -180),    scale = vector3_box(0.85, 0.37, 0.74) },
        foregripac1 = {offset = true,   position = vector3_box(0.002, 0.415, -0.102),   rotation = vector3_box(0, 90, -40),    scale = vector3_box(0.5, 0.45, 0.2) },
        foregripac2 = {offset = true,   position = vector3_box(-0.002, 0.415, -0.102),   rotation = vector3_box(-40, -90, 0),    scale = vector3_box(0.5, 0.45, 0.2) },
        foregripac3 = {offset = true,   position = vector3_box(0, 0.47, -0.060),   rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.5, 0.45, 0.2) },
    },

    -- ######
    -- DREG GUNNER BAYONET
    -- ######
    {   dependencies = {"!owo_dreg_barrel_01",
            "owo_dreg_bayonet_01",
        },
        bayonet =   {offset = true,     position = vector3_box(0, 0.55, -0.055),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(0.35, 0.275, 0.35) },
        bayonetac1 =  {offset = true,     position = vector3_box(0, 0.55, -0.069),    rotation = vector3_box(90, 0, 0),   scale = vector3_box(0.35, 0.225, 0.075) },
    },
    {   dependencies = {"owo_dreg_barrel_01",
            "owo_dreg_bayonet_01"
        },
        bayonet =   {offset = true,     position = vector3_box(0, 0.8, -0.18),  rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1, 1, 0.555) },
        bayonetac1 =  {offset = true,     position = vector3_box(0, 0.8, -0.222), rotation = vector3_box(90, 0, 0),   scale = vector3_box(1, 0.67, 0.115) },
    },
    -- ######
    -- FIN GRIP
    -- ######
    {   dependencies = {"owo_fin_grip_01"},
        grip =  { offset = true,    position = vector3_box(0, 0, 0),            rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
        -- fin
        gripac = { offset = true,    position = vector3_box(0, -0.0715, 0.0195), rotation = vector3_box(145, 0, 0),  scale = vector3_box(0.35, 0.35, 0.165) },
    },

    -- ######
	-- Muzzle: SUPPRESSOR
	-- ######
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2",
            "owo_suppressor_01|owo_suppressor_02"
        },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2) },
    },
    {	dependencies = {"owo_suppressor_01",
            "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
        },
        muzzle_2 = {offset = true,   position = vector3_box(0, 0.11, 0), rotation = vector3_box(0, 22, 0),   scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies = {"owo_suppressor_02",
            "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
        },
        muzzle_2 = {offset = true,   position = vector3_box(0, 0.11, 0), rotation = vector3_box(0, 17, 0),   scale = vector3_box(1.2, 1.8, 1.2) }	
    },
    -- Base case
    {	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
        muzzle = { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
    },
    {	dependencies = {"owo_suppressor_01"},
        muzzle_2 = {offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 22, 0),   scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle_2 = {offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 17, 0),   scale = vector3_box(1.2, 1.8, 1.2) }
    },
    -- the skinny bayonet. sits on muzzle
    {	dependencies = {"owo_suppressor_01|owo_suppressor_02",
            "autogun_bayonet_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85) },
    },

    -- ######
	-- Muzzle: CONDOM
	-- ######
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2",
            "owo_condom_01"
        },
        muzzle =    {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.64, 1.344, 0.64 ) },
    },
	{	dependencies = {"owo_condom_01"},
        muzzle =    {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.64, 1.344, 0.64 ) },
        muzzle_2 =   {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 22, 0), scale = vector3_box(0.64, 1.344, 0.64 ) },
    },
    -- the skinny bayonet. sits on muzzle
    {	dependencies = {"owo_condom_01",
            "autogun_bayonet_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.1, 0.66, 1.1 ) },
    },

    -- ######
	-- Magazine: Jungle Mags
	-- ######
    -- Straight Mags
    --  Second mag on the left
    {   dependencies = { "owo_jungle_mag_01|owo_jungle_mag_02|owo_jungle_mag_03|owo_jungle_mag_01_up|owo_jungle_mag_02_up|owo_jungle_mag_03_up"},
        magazine =          { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        -- front
        owo_magac2 =    { offset = true,    position = vector3_box(-0.03, 0.11, -0.15),     rotation = vector3_box(90, 0, 90),      scale = vector3_box(1, 1.74, 0.37) },
        -- back
        owo_magac3 =    { offset = true,    position = vector3_box(-0.03, 0., -0.15),       rotation = vector3_box(-90, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- left
        owo_magac4 =    { offset = true,    position = vector3_box(-0.094, 0.056, -0.15),   rotation = vector3_box(90, 90, 90),     scale = vector3_box(1, 1.532, 0.37) },
        -- right
        owo_magac5 =    { offset = true,    position = vector3_box(0.03, 0.056, -0.15),     rotation = vector3_box(-90, -90, 90),   scale = vector3_box(1, 1.532, 0.37) },
    },
    --       v^
    {   dependencies = { "owo_jungle_mag_01|owo_jungle_mag_02|owo_jungle_mag_03"},
        owo_magac1 =    { offset = true,    position = vector3_box(-0.065, 0.106, -0.27),   rotation = vector3_box(180, 0, 0),      scale = vector3_box(1, 1, 1) },
    },
    --      ^^
    {   dependencies = { "owo_jungle_mag_01_up|owo_jungle_mag_02_up|owo_jungle_mag_03_up"},
        owo_magac1 =    { offset = true,    position = vector3_box(-0.065, 0.0, -0.08),   rotation = vector3_box(0, 0, 0),      scale = vector3_box(1, 1, 1) },
    },
    --  Second mag on the right
    {   dependencies = { "owo_jungle_mag_01_flip|owo_jungle_mag_02_flip|owo_jungle_mag_03_flip|owo_jungle_mag_01_up_flip|owo_jungle_mag_02_up_flip|owo_jungle_mag_03_up_flip"},
        magazine =          { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        owo_magac2 =    { offset = true,    position = vector3_box(0.034, 0.11, -0.15),     rotation = vector3_box(90, 0, 90),      scale = vector3_box(1, 1.74, 0.37) },
        owo_magac3 =    { offset = true,    position = vector3_box(0.034, 0., -0.15),       rotation = vector3_box(-90, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owo_magac4 =    { offset = true,    position = vector3_box(-0.028, 0.056, -0.15),   rotation = vector3_box(90, 90, 90),     scale = vector3_box(1, 1.532, 0.37) },
        owo_magac5 =    { offset = true,    position = vector3_box(0.095, 0.056, -0.15),    rotation = vector3_box(-90, -90, 90),   scale = vector3_box(1, 1.532, 0.37) },
    },
    --      ^v
    {   dependencies = { "owo_jungle_mag_01_flip|owo_jungle_mag_02_flip|owo_jungle_mag_03_flip"},
        owo_magac1 =    { offset = true,    position = vector3_box(0.065, 0.106, -0.27),    rotation = vector3_box(180, 0, 0),      scale = vector3_box(1, 1, 1) },
    },
    --      ^^
    {   dependencies = { "owo_jungle_mag_01_up_flip|owo_jungle_mag_02_up_flip|owo_jungle_mag_03_up_flip"},
        owo_magac1 =    { offset = true,    position = vector3_box(0.061, 0.0, -0.08),    rotation = vector3_box(0, 0, 0),      scale = vector3_box(1, 1, 1) },
    },
    -- Curved Mag
    --  second mag on left
    {   dependencies = { "owo_jungle_mag_04|owo_jungle_mag_04_up"},
        magazine =          { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        -- front
        owo_magac2 =    { offset = true,    position = vector3_box(-0.032, 0.117, -0.149),  rotation = vector3_box(108, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- back
        owo_magac3 =    { offset = true,    position = vector3_box(-0.032, 0.016, -0.196),  rotation = vector3_box(-67, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- left
        owo_magac4 =    { offset = true,    position = vector3_box(-0.094, 0.0713, -0.171), rotation = vector3_box(120, 90, 90),    scale = vector3_box(1, 1.532, 0.37) },
        -- right
        owo_magac5 =    { offset = true,    position = vector3_box(0.03, 0.0647, -0.170),   rotation = vector3_box(45, -90, -165),  scale = vector3_box(1, 1.532, 0.37) },
    },
    --      v^
    {   dependencies = { "owo_jungle_mag_04"},
        owo_magac1 =    { offset = true,    position = vector3_box(-0.065, 0.153, -0.309),  rotation = vector3_box(-170, 0, 0),     scale = vector3_box(1, 1, 1) },
    },
    --      ^^
    {   dependencies = { "owo_jungle_mag_04_up"},
        owo_magac1 =    { offset = true,    position = vector3_box(-0.065, -0.007, -0.011),  rotation = vector3_box(18, 0, 0),     scale = vector3_box(1, 1, 1) },
    },
    --  second mag on right
    {   dependencies = { "owo_jungle_mag_04_flip"},
        magazine =          { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        owo_magac2 =    { offset = true,    position = vector3_box(0.034, 0.117, -0.149),   rotation = vector3_box(108, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owo_magac3 =    { offset = true,    position = vector3_box(0.034, 0.016, -0.196),   rotation = vector3_box(-67, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owo_magac4 =    { offset = true,    position = vector3_box(-0.028, 0.0713, -0.171), rotation = vector3_box(120, 90, 90),    scale = vector3_box(1, 1.532, 0.37) },
        owo_magac5 =    { offset = true,    position = vector3_box(0.095, 0.0647, -0.170),  rotation = vector3_box(45, -90, -165),  scale = vector3_box(1, 1.532, 0.37) },
    },
    --      ^v
    {   dependencies = { "owo_jungle_mag_04_flip"},
        owo_magac1 =    { offset = true,    position = vector3_box(0.065, 0.153, -0.309),   rotation = vector3_box(-170, 0, 0),     scale = vector3_box(1, 1, 1) },
    },
    --      ^^
    {   dependencies = { "owo_jungle_mag_04_up_flip"},
        owo_magac1 =    { offset = true,    position = vector3_box(0.065, -0.007, -0.011),  rotation = vector3_box(18, 0, 0),     scale = vector3_box(1, 1, 1) },
    },

    -- ######
	-- Magazine: Mag Pull
	-- ######
    {   dependencies = { "owo_magazine_magpull_01|owo_magazine_magpull_02|owo_magazine_magpull_03|owo_magazine_magpull_04"},
        magazine =      { offset = true,    
            position = vector3_box(0.0, 0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0),
            trigger_move = {"owo_magac1", "owo_magac2", "owo_magac3"}, animation_wait_detach = {"owo_magac3", "owo_magac2", "owo_magac1"},
        },
    },

    -- First helper. These need to be explicitly parented to a specific node. 2 is almost at the end
    --  Straight Mags
    --      Short
    {   dependencies = { "owo_magazine_magpull_01"},
        owo_magac1 =    { offset = false, parent_node = 2,
            position = vector3_box(0.0, 0.056, -0.180), rotation = vector3_box(90, 0, 90), scale = vector3_box(1.0, 0.44, 0.64), 
            animation_wait_attach = {"magazine"},
        },
    },
    --      Long
    {   dependencies = { "owo_magazine_magpull_02"},
        owo_magac1 =    { offset = false, parent_node = 2,
            position = vector3_box(0.0, 0.056, -0.180), rotation = vector3_box(90, 0, 90), scale = vector3_box(1.0, 0.44, 0.64), 
        },
    },
    --  The slanted bottom that looks like the 20 round M16 mags
    {   dependencies = { "owo_magazine_magpull_03"},
        owo_magac1 =    { offset = false, parent_node = 2,
            position = vector3_box(0.034, 0.056, -0.17), rotation = vector3_box(104, 0, 90), scale = vector3_box(1.0, 0.44, 0.69),
        },
    },
    --  Curved Mag
    {   dependencies = { "owo_magazine_magpull_04"},
        owo_magac1 =    { offset = false, parent_node = 2,
            position = vector3_box(0.034, 0.088, -0.219), rotation = vector3_box(114, 0, 90), scale = vector3_box(1.0, 0.44, 0.64),
         },
    },
    --  All Mags
    {   dependencies = { "owo_magazine_magpull_01|owo_magazine_magpull_02|owo_magazine_magpull_03|owo_magazine_magpull_04"},
        
        owo_magac2 =    { offset = true,    position = vector3_box(0.0, 0.0, 0.0),   rotation = vector3_box(180, 0, 0),     scale = vector3_box(1.0, 1.0, 1.0) },
        owo_magac3 =    { offset = true,    position = vector3_box(0.0, -0.05, -0.02),   rotation = vector3_box(0, -90, 90),     scale = vector3_box(2.2, 1.27, 1.1) },
    },


    -- ######
	-- Barrel: M16
    -- basically the same as syn's aquilon barrel
	-- ######
    -- Iags and others
    --      Barrels need to be aligned for each type of receiver >:(
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0),          rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.082, -0.02), scale = vector3_box(0.5, 0.5, 0.5)},
    },
    --      Front Post for non headhunter/vigilant
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.092),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.27, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.642, 0.146),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.148),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.148),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    --      Front Post (Tall) for non headhunter/vigilant
    {   dependencies = { "owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.122),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.405, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.64, 0.176),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.178),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.178),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    --      A1 1 barrel is the only one with a sloped grip at the bottom
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_t_a1|owo_m16_barrel_n_a1",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.066),     rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.47, 2.748, 1.63) },
        barrelshroudac3 =   { offset = true,    position = vector3_box(0, 0.667, -0.024),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.884, 1.45, 0.5) },
    },
    {   dependencies = { "owo_m16_barrel_a1_02|owo_m16_barrel_t_a1_02|owo_m16_barrel_n_a1_02",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.9, 2.388, 1.07) },
        barrelshroudac3 =   {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies = { "owo_m16_barrel_a2|owo_m16_barrel_t_a2|owo_m16_barrel_n_a2",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        flashlight =        { offset = false,   position = vector3_box(0.036, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(2.188, 2.388, 1.5) },
        barrelshroudac3 =   {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    -- Brautos
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2",
            "receiver_03|receiver_06|receiver_07|receiver_08",
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0.03),       rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.082, -0.02), scale = vector3_box(0.5, 0.5, 0.5)},
    },
    {   dependencies = { "owo_m16_barrel_a1", "owo_m16_barrel_t_a1", "owo_m16_barrel_n_a1",
            "receiver_03|receiver_06|receiver_07|receiver_08"
        },
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.066),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.47, 2.748, 1.63) },
        barrelshroudac3 =   { offset = true,    position = vector3_box(0, 0.589, -0.024),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.884, 1.45, 0.5) },
    },
    {   dependencies = { "owo_m16_barrel_a1_02", "owo_m16_barrel_t_a1_02", "owo_m16_barrel_n_a1_02",
            "receiver_03|receiver_06|receiver_07|receiver_08"
        },
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.064),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.9, 2.388, 1.07) },
        barrelshroudac3 =   {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_m16_barrel_a2", "owo_m16_barrel_t_a2", "owo_m16_barrel_n_a2",
            "receiver_03|receiver_06|receiver_07|receiver_08"
        },
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.064),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(2.188, 2.388, 1.5) },
        barrelshroudac3 =   {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Headhunters (Vigilants)
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2",
            "receiver_02|receiver_04|receiver_05|receiver_09",
        },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, -0.02),          rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.022, -0.166), scale = vector3_box(1, 1, 1)},
    },
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_t_a1|owo_m16_barrel_n_a1",
            "receiver_02|receiver_04|receiver_05|receiver_09"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true, position = vector3_box(0, 0.393, 0.056), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.47, 2.388, 1.67) },
        barrelshroudac3 =   { offset = true, position = vector3_box(0, 0.685, -0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.884, 1.45, 0.5) },
    },
    {   dependencies = { "owo_m16_barrel_a1_02|owo_m16_barrel_t_a1_02|owo_m16_barrel_n_a1_02",
            "receiver_02|receiver_04|receiver_05|receiver_09"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.375, 0.054),    rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.9, 2.388, 1.07) },
    },
    {   dependencies = { "owo_m16_barrel_a2|owo_m16_barrel_t_a2|owo_m16_barrel_n_a2",
            "receiver_02|receiver_04|receiver_05|receiver_09"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.395, 0.054),    rotation = vector3_box(-90, 0, 0), scale = vector3_box(2.188, 2.388, 1.5) },
    },
    -- Front posts
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2",
            "receiver_02|receiver_04|receiver_05|receiver_09",
        },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.072),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.27, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.642, 0.126),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.128),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.128),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    --      Front Post (Tall)
    {   dependencies = { "owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2",
            "receiver_02|receiver_04|receiver_05|receiver_09",
        },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.172),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.405, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.64, 0.156),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.158),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.158),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    -- Muzzle Alignment
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2",
            --"!owo_suppressor_01", "!owo_suppressor_02",
            --"!owo_condom_01"
        },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    -- EOTech
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03|owo_holosight_01_01_ps|owo_holosight_01_02_ps|owo_holosight_01_03_ps" },
        sightac1 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.256) }, -- scale was 1.25, 0.56, 0.286
        sightac2 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.256) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =       { offset = true, position  = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
    },
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_01_ps" },
        sight =             { offset = true, position  = vector3_box(0, 0, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies = { "owo_holosight_01_02|owo_holosight_01_03|owo_holosight_01_02_ps|owo_holosight_01_03_ps" },
        sight =             { offset = true, position  = vector3_box(0, 0.05, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    {   dependencies = { "owo_holosight_01_02|owo_holosight_01_02_ps" },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0, -0.15, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0, -0.0162, 0.03), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    {   dependencies = { "owo_holosight_01_03|owo_holosight_01_03_ps" },
        sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0.042, -0.15, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },
    --  Aligning sights to crosshair
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02|owo_holosight_01_03"},
        scope_offset =      { position = vector3_box(0, -0.0001, -0.0193), rotation = vector3_box(0, 0, 0)},
    },
    --      Point shooting
    {   dependencies = { "owo_holosight_01_01_ps|owo_holosight_01_02_ps|owo_holosight_01_03_ps" },
        scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0)},
    },

    -- ######
	-- Sight: M16 Sights
	-- ######
	{	dependencies = {"owo_m16_sight_01|owo_m16_sight_02"},
        no_scope_offset =   { position = vector3_box(0, -0.00015, -0.0483), rotation = vector3_box(0, 0, 0)},
        scope_offset =      { position = vector3_box(0, -0.00015, -0.0483), rotation = vector3_box(0, 0, 0)},
        sight =       {offset = true, position = vector3_box(0, -0.048, 0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.745, 1, 0.88 ) },
        sightac1 =    {offset = true, position = vector3_box(0.005, 0.308, 0.114), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.05, 1.12, 0.15 ) },
        sightac2 =    {offset = true, position = vector3_box(-0.005, 0.308, 0.114), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.05, 1.12, 0.15 ) },
        -- Rear Sight Aperture. the peep hole then the 2 bases
        sightac3 =    {offset = true, position = vector3_box(0, 0.022, 0.185), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.15, 0.06, 0.15 ) },
        sightac4 =    {offset = true, position = vector3_box(0.001, 0.038, 0.177), rotation = vector3_box(180, 90, 0), scale = vector3_box(0.08, 0.1, 0.03 ) },
        sightac5 =    {offset = true, position = vector3_box(-0.003, 0.038, 0.177), rotation = vector3_box(-90, -90, -180), scale = vector3_box(0.08, 0.1, 0.03 ) },
        -- Windage Knob on the right side of the sight
        sightac6 =    {offset = true, position = vector3_box(0.006, 0.016, 0.174), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.14, 0.14, 0.056 ) },
        -- Rear Elevation Knob in the base, below the rear sight
        sightac7 =    {offset = true, position = vector3_box(0, 0.012, 0.146), rotation = vector3_box(45, 90, 45), scale = vector3_box(0.77, 0.09, 0.77 ) },
    },

    -- ######
	-- Sight: SOVIET PU SCOPE
	-- ######
    {	dependencies = {"owo_pu_scope_01|owo_pu_scope_02", "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s"},
        sight = 	  {offset = true, position = vector3_box(0, -0.028, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        sightac1 = {offset = true, position = vector3_box(0, 0.166 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
    },
	{	dependencies = {"owo_pu_scope_01|owo_pu_scope_02"},
        no_scope_offset =   { position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0)},
        scope_offset =      { position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0)},
        sight = 	  {offset = true, position = vector3_box(0, -0.09, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        sightac1 = {offset = true, position = vector3_box(0, 0.106 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        -- Crosshair
        sightac2 = {offset = true, position = vector3_box(0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
        sightac3 = {offset = true, position = vector3_box(-0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
        sightac4 = {offset = true, position = vector3_box(0, 0.08, -0.031), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.25, 0.1 ) },
        -- Knobs
        sightac5 = {offset = true, position = vector3_box(0, 0.13, 0.03), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.5, 0.5, 0.2 ) },
        sightac6 = {offset = true, position = vector3_box(0.03, 0.095, 0), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.5, 0.5, 0.2 ) },
    },
    -- Riser alightment
    {	dependencies = {"owo_pu_scope_01", "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s"},
        sight_secondary = {offset = true, position = vector3_box(0, 0.066, 0.096), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
    {	dependencies = {"owo_pu_scope_01"},
        sight_secondary = {offset = true, position = vector3_box(0, 0.016, 0.1), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
    {	dependencies = {"owo_pu_scope_02"},
        sight_secondary = {offset = true, position = vector3_box(0, -0.036, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },

    -- ######
    -- Sight: Telescopic Sights
    -- ######
    -- Trijicon ACOG
    --  ACOG only
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_ps|owo_acog_sight_02_01|owo_acog_sight_02_02|owo_acog_sight_02_ps" },
        sight =             { offset = true, position  = vector3_box(0, 0, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sightac1 =       { offset = true, position  = vector3_box(0, -0.022, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        sightac2 =       { offset = true, position  = vector3_box(0, -0.128, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.064, 0.032), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Base
        sightac4 =       { offset = true, position  = vector3_box(0, -0.018, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Knobs
        sightac5 =       { offset = true, position  = vector3_box(0, -0.01, 0.061), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.45, 0.68, 0.24) },
        sightac6 =       { offset = true, position  = vector3_box(0.028, -0.014, 0.034), rotation = vector3_box(-180, -90, -180), scale = vector3_box(0.45, 0.45, 0.12) },
        -- Cable
        sightac7 =       { offset = true, position  = vector3_box(0, -0.018, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.515, 0.195, 0.525) },
    },
    --  ACOG with RMR on top
    {   dependencies = { "owo_acog_sight_02_01|owo_acog_sight_02_02|owo_acog_sight_02_ps" },
        sight_secondary =       { offset = true, position  = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --		Hiding housing for helper sights
	{   dependencies = { "owo_acog_sight_01|owo_acog_sight_02_01"},
		sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
	--		Hiding reticle and housing for helper sights for sights that don't use the sights
	{   dependencies = { "owo_acog_sight_01_ps|owo_acog_sight_02_02|owo_acog_sight_02_ps"},
		sight_2 =           { parent = "sight", position  = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,5,6}} },
    },
    -- SUSAT
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_02_01|owo_susat_02_02|owo_susat_02_ps" },
        sight =             { offset = true, position  = vector3_box(0, -0.06, 0.160), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        --lens =              { parent = "sight", position  = vector3_box(0, 0.105, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"lens", 1, 2, 3, 5}}, data = {lens = 1}},
        --lens_2 =            { parent = "sight", position  = vector3_box(0, -0.06, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"lens_2", 1, 2, 3, 5}}, data = {lens = 2} },
        -- cylinder thing
        sightac1 =       { offset = true, position  = vector3_box(0, 0.096, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.6, 1.47, 1.27), data = {sightac1 = 1} },
        -- Rear
        sightac2 =       { offset = true, position  = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        sightac3 =       { offset = true, position  = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        -- Base
        sightac4 =       { offset = true, position  = vector3_box(0, 0.07, -0.036), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Reticle
        sightac5 =       { offset = true, position  = vector3_box(-0.0028, 0.066, -0.026), rotation = vector3_box(0, 6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        sightac6 =       { offset = true, position  = vector3_box(0.0028, 0.066, -0.026), rotation = vector3_box(0, -6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
    },
    -- SUSAT with red dot
    {   dependencies = { "owo_susat_02_01|owo_susat_02_02|owo_susat_02_ps" },
            sight_secondary =     { offset = true, position  = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  Aligning sights to crosshair
    --      Aiming with main sight
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_02_01|owo_susat_01|owo_susat_02_01" },
        scope_offset =      { position = vector3_box(0, -0.0001, -0.0235), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --      Aiming with RMR on ACOG
    {   dependencies = { "owo_acog_sight_02_02" },
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.100), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --      Aiming with RMR on SUSAT
    {   dependencies = { "owo_susat_02_02" },
        scope_offset =      { position = vector3_box(0.0002, 0.001, -0.0872), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --      Point shooting
    {   dependencies = { "owo_acog_sight_01_ps|owo_acog_sight_02_ps|owo_susat_01_ps|owo_susat_02_ps" },
        scope_offset =      { position = vector3_box(-0.04, 0.26, -0.163), rotation = vector3_box(0, -19, 0), lense_transparency = false},
    },

    -- ######
	-- Bayonet: UNDERBARREL GRENADE LAUNCHER
	-- ######
	{	dependencies = {"owo_m203"},
        bayonet =       {offset = true, position = vector3_box(0, -0.172, -0.118), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
        bayonetac1 =    {offset = true, position = vector3_box(0, 0.138, 0.), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1, 1 ) },
        bayonetac2 =    {offset = true, position = vector3_box(0, -0.046, 0), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.4, 1.4, 0.8 ) },
        bayonetac3 =    {offset = true, position = vector3_box(0, 0.06, 0.042), rotation = vector3_box(-180, 0, -180), scale = vector3_box(1, 0.51, 0.51 ) },
        bayonetac4 =    {offset = true, position = vector3_box(0, -0.112, -0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.28, 0.69 ) },
    },

    -- ######
	-- Bayonet: UNDERBARREL SHOTGUN
	-- ######
    -- Masterkey
    {   dependencies = {"owo_underbarrel_shotgun_01", 
            "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
        },
        bayonet =       {offset = true, position = vector3_box(0, -0.288, -0.11), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    }, 
    {	dependencies = {"owo_underbarrel_shotgun_01"},
        -- Shotgun body
        bayonet =       {offset = true, position = vector3_box(0, -0.078, -0.11), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
	{	dependencies = {"owo_underbarrel_shotgun_01"},
        -- Shotgun tube
        bayonetac1 =    {offset = true, position = vector3_box(0, 0.613, 0), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.2, 1, 1.2 ) },
        -- Shotgun barrel 2
        bayonetac2 =    {offset = true, position = vector3_box(0, 0.01, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Shotgun tube middle extension
        bayonetac3 =    {offset = true, position = vector3_box(0, 0.42, -0.05), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    {offset = true, position = vector3_box(0, 0.036, -0.088), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 0.85 ) },
        -- Shotgun Trap
        bayonetac5 =    {offset = true, position = vector3_box(0, 0.06, -0.0818), rotation = vector3_box(-90, 0, -84), scale = vector3_box(0.135, 0.25, 0.365 ) },
        -- Connector
        bayonetac6 =    {offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.6, 1.0 ) },
        -- Pump
        bayonetac7 =    {offset = true, position = vector3_box(0, 0.46, -0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.95, 0.7, 0.85 ) },
    },
    -- m26-MASS
    {   dependencies = {"owo_underbarrel_shotgun_02", 
            "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
        },
        bayonet =       {offset = true, position = vector3_box(0, -0.214, -0.152), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    }, 
    {	dependencies = {"owo_underbarrel_shotgun_02"},
        -- Receiver
        bayonet =       {offset = true, position = vector3_box(0, 0.022, -0.148), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    {	dependencies = {"owo_underbarrel_shotgun_02"},
        -- Mag
        bayonetac1 =    {offset = true, position = vector3_box(0, -0.015, -0.079), rotation = vector3_box(15, 0, 0), scale = vector3_box(1, 1.2, 1 ) },
        -- Barrel
        bayonetac2 =    {offset = true, position = vector3_box(0, -0.02, 0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Muzzle
        bayonetac3 =    {offset = true, position = vector3_box(0, 0.36, 0.086), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    {offset = true, position = vector3_box(0, -0.044, -0.026), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 1.085 ) },
        -- Front Connector
        bayonetac5 =    {offset = true, position = vector3_box(0, 0.246, 0.082), rotation = vector3_box(-180, -90, 90), scale = vector3_box(0.75, 0.95, 0.335 ) },
        -- Connector
        bayonetac6 =    {offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.0 ) },
    },

    -- ######
    -- Bayonet: HISTORICAL PACK
    -- ######
	-- M7 Bayonet
    {   dependencies = {"owo_bayonet_m7_01",
            "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.158, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = {"owo_bayonet_m7_01",
            "!owo_m16_barrel_a1","!owo_m16_barrel_a1_02","!owo_m16_barrel_a2", 
            "!owo_m16_barrel_t_a1", "!owo_m16_barrel_n_a1_02", "!owo_m16_barrel_t_a2",
            "!owo_m16_barrel_n_a1", "!owo_m16_barrel_n_a1_02", "!owo_m16_barrel_n_a2",
        },
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = {"owo_bayonet_m7_01"},
        bayonetac1 = {offset = true, position = vector3_box(0, 0.002, -0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        bayonetac2 = {offset = true, position = vector3_box(0, -0.012, -0.002), rotation = vector3_box(0, 90, 180), scale = vector3_box(0.25, 0.825, 0.25) },
    },
	-- Seitengewehr 98
	{   dependencies = {"owo_bayonet_seitengewehr",
            "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.575, -0.06), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
    {   dependencies = {"owo_bayonet_seitengewehr",
            "!owo_wood_krieg_01","!owo_wood_krieg_02","!owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.575, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
    {   dependencies = {"owo_bayonet_seitengewehr"},
        bayonetac1 = {offset = true, position = vector3_box(0, 0.002, -0.036), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.46, 0.25) },
        bayonetac2 = {offset = true, position = vector3_box(0, 0, -0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.6, 0.2) },
    },
	-- Épée baïonnette modèle 1886 Lebel
	{   dependencies = {"owo_bayonet_epee",
            "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
    {   dependencies = {"owo_bayonet_epee", 
            "!owo_wood_krieg_01","!owo_wood_krieg_02","!owo_wood_krieg_03",
        },
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
    {   dependencies = {"owo_bayonet_epee"},
        bayonetac1 = {offset = true, position = vector3_box(0, 0.025, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.1, 1.35, 0.6) },
        bayonetac2 = {offset = true, position = vector3_box(0, 0.06, 0.014), rotation = vector3_box(180, 0, 180), scale = vector3_box(0.25, 0.09, 0.245) },
    },

    -- ######
	-- Barrel: WOODEN HELBORE
	-- ######
	{	dependencies = {"owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03",
        },
        barrel = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        barrelshroud = {offset = true, position = vector3_box(0, 0.19, -0.001), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.78, 0.6, 1.188 ) },
    },
    -- Regular Helbore bayonets (barrel parent)
    {   dependencies = {"owo_wood_krieg_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = {offset = true,   position = vector3_box(0, 0.504, -0.03),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },
    -- 	these barrels are shorter
    {   dependencies = {"owo_wood_krieg_02|owo_wood_krieg_03",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = {offset = true,   position = vector3_box(0, 0.428, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },

    -- ####################################################################################
    -- HIDING HELPERS
    -- By putting it down here, they will only be hidden if the fixes from above are not found
    -- Because they match the main parts first, if there is no match it means the main part is not attached
    -- ####################################################################################
    -- Muzzles
    {	dependencies = {"owo_suppressor_helper_01|owo_suppressor_helper_02|owo_condom_helper_01"},
        muzzle_2 = {hide_mesh = {{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Bayonet
    {	dependencies = {"owo_dreg_bayonet_rear_01|owo_bayonet_m7_helper_01|owo_bayonet_seitengewehr_helper_01|owo_bayonet_epee_helper_01|owo_m203_helper_01|owo_underbarrel_shotgun_helper_01|owo_underbarrel_shotgun_helper_01_02"},
        bayonetac1 = {hide_mesh = {     {"bayonetac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_bayonet_m7_helper_02|owo_bayonet_seitengewehr_helper_02|owo_bayonet_epee_helper_02|owo_m203_helper_02|owo_underbarrel_shotgun_helper_02|owo_underbarrel_shotgun_helper_02_02"},
        bayonetac2 = {hide_mesh = {     {"bayonetac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_m203_helper_03|owo_underbarrel_shotgun_helper_03|owo_underbarrel_shotgun_helper_03_02"},
        bayonetac3 = {hide_mesh = {     {"bayonetac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_m203_helper_04|owo_underbarrel_shotgun_helper_04"},
        bayonetac4 = {hide_mesh = {     {"bayonetac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_underbarrel_shotgun_helper_05|owo_underbarrel_shotgun_helper_05_02"},
        bayonetac5 = {hide_mesh = {     {"bayonetac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_underbarrel_shotgun_helper_06|owo_underbarrel_shotgun_helper_06_02"},
        bayonetac6 = {hide_mesh = {     {"bayonetac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies = {"owo_underbarrel_shotgun_helper_07"},
        bayonetac7 = {hide_mesh = {     {"bayonetac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    -- Barrels
    --      a2 barrel doesn't use barrelshroudac3, but that's covered in the function
    {   dependencies = {"owo_dreg_shroud_01|owo_m16_barrelshroud_a1|owo_m16_barrelshroud_a1_02|owo_m16_barrelshroud_a2|owo_wood_krieg_ac1_01"},
        barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_dreg_shroudac2_01|owo_m16_barrelshroudac2_01"},
        barrelshroudac2 = {hide_mesh = {{"barrelshroudac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies = {"owo_dreg_shroudac3_01|owo_m16_barrelshroudac3_01"},
        barrelshroudac3 = {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies = {"owo_dreg_shroudac2_01|owo_m16_barrelshroudac4_01"},
        barrelshroudac4 = {hide_mesh = {{"barrelshroudac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies = {"owo_m16_barrelshroudac5_01"},
        barrelshroudac5 = {hide_mesh = {{"barrelshroudac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies = {"owo_m16_barrelshroudac6_01"},
        barrelshroudac6 = {hide_mesh = {{"barrelshroudac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    --      No post versions
    {   dependencies = {"owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"},
        barrelshroudac2 = {hide_mesh = {{"barrelshroudac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        barrelshroudac4 = {hide_mesh = {{"barrelshroudac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        barrelshroudac5 = {hide_mesh = {{"barrelshroudac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
        barrelshroudac6 = {hide_mesh = {{"barrelshroudac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    -- Foregrips
    {   dependencies = {"owo_tactical_foregrip_ac1_01"},
        foregripac1 = {hide_mesh = {{"foregripac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_tactical_foregrip_ac2_01"},
        foregripac2 = {hide_mesh = {{"foregripac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Receivers
	{	dependencies = {"owo_bolt_helbore_bolt_01|owo_helbore_mas49_ass"},
		receiverac1 = {hide_mesh = {     {"receiverac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	{	dependencies = {"owo_bolt_helbore_bolt_02|owo_helbore_mas49_knob"},
		receiverac2 = {hide_mesh = {     {"receiverac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
    -- Magazines
    {   dependencies = { "owo_jungle_mag_helper_01|owo_jungle_mag_helper_02|owo_jungle_mag_helper_03|owo_jungle_mag_helper_04|owo_magazine_magpull_helper_01"},
        owo_magac1 = { hide_mesh = {{"owo_magac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_jungle_mag_connector_f_01|owo_magazine_magpull_helper_02"},
        owo_magac2 = { hide_mesh = {{"owo_magac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_jungle_mag_connector_b_01|owo_magazine_magpull_helper_03"},
        owo_magac3 = { hide_mesh = {{"owo_magac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_jungle_mag_connector_l_01"},
        owo_magac4 = { hide_mesh = {{"owo_magac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_jungle_mag_connector_r_01"},
        owo_magac5 = { hide_mesh = {{"owo_magac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    -- Grips
    {   dependencies = {"owo_fin_grip2_01"},
        gripac = { hide_mesh = {{"gripac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Sights
    {   dependencies = {"owo_holosight_helper_01|owo_rear_sight_ac1_01|owo_pu_scope_helper_01|owo_m16_sight_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01"},
        sightac1 = { hide_mesh = {{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_02|owo_rear_sight_ac2_01|owo_rear_sight_ac2_02|owo_rear_sight_ac2_03|owo_pu_scope_helper_02|owo_m16_sight_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01"},
        sightac2 = { hide_mesh = {{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_03|owo_rear_sight_ac3_01|owo_pu_scope_helper_03|owo_m16_sight_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01"},
        sightac3 = { hide_mesh = {{"sightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_04|owo_rear_sight_ac4_01|owo_pu_scope_helper_04|owo_m16_sight_helper_04|owo_acog_sight_helper_04"},
        sightac4 = { hide_mesh = {{"sightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac5_01|owo_pu_scope_helper_05|owo_m16_sight_helper_05|owo_acog_sight_helper_05|owo_susat_ac5_01"},
        sightac5 = { hide_mesh = {{"sightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac6_01|owo_pu_scope_helper_06|owo_m16_sight_helper_06|owo_acog_sight_helper_06|owo_susat_ac5_01"},
        sightac6 = { hide_mesh = {{"sightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_m16_sight_helper_07|owo_acog_sight_helper_07"},
        sightac7 = { hide_mesh = {{"sightac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_01|owo_acog_sight_sight_secondary_01|owo_pu_scope_riser_01"},
        sight_secondary = { hide_mesh = {{"sight_secondary", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_01"},
        sight_secondary_ac1 = { hide_mesh = {{"sight_secondary_ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},  
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_02"},
        sight_secondary_ac2 = { hide_mesh = {{"sight_secondary_ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
