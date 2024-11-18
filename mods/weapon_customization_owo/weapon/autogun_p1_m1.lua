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
mod.wc.attachment[this_variant].barrelshroud = {}
--mod.wc.attachment[this_variant].barrelshroudac = {}
mod.wc.attachment[this_variant].barrelshroudac2 = {}
mod.wc.attachment[this_variant].barrelshroudac3 = {}
mod.wc.attachment[this_variant].barrelshroudac4 = {}
mod.wc.attachment[this_variant].bayonet = {}
mod.wc.attachment[this_variant].bayonet2 = {}
mod.wc.attachment[this_variant].bayonet3 = {}
mod.wc.attachment[this_variant].grip2 = {}
mod.wc.attachment[this_variant].muzzle2 = {}
mod.wc.attachment[this_variant].owomagazineac1 = {}
mod.wc.attachment[this_variant].owomagazineac2 = {}
mod.wc.attachment[this_variant].owomagazineac3 = {}
mod.wc.attachment[this_variant].owomagazineac4 = {}
mod.wc.attachment[this_variant].owomagazineac5 = {}
mod.wc.attachment[this_variant].owosightac1 = {}
mod.wc.attachment[this_variant].owosightac2 = {}
mod.wc.attachment[this_variant].owosightac3 = {}
mod.wc.attachment[this_variant].owosightac4 = {}
mod.wc.attachment[this_variant].owosight2 = {}
mod.wc.attachment[this_variant].owosight2ac1 = {}
mod.wc.attachment[this_variant].owosight2ac2 = {}

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
mod.owo_m7_bayonet(this_variant, "bayonet")
mod.owo_holosight(this_variant, "sight")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
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
        muzzle =            {offset = true,     position = vector3_box(0, 1, 0),            rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.2, 2.2, 2.2) }
    },
    -- Helbore bayonets
	{   dependencies = {"owo_dreg_barrel_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = {offset = true,   position = vector3_box(0, 0.699, -0.095),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.5, 1.7, 3.0) }
    },
    -- ######
    -- DREG GUNNER BAYONET
    -- ######
    {   dependencies = {"!owo_dreg_barrel_01",
            "owo_dreg_bayonet_01",
        },
        bayonet =   {offset = true,     position = vector3_box(0, 0.55, -0.055),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(0.35, 0.275, 0.35) },
        bayonet2 =  {offset = true,     position = vector3_box(0, 0.55, -0.069),    rotation = vector3_box(90, 0, 0),   scale = vector3_box(0.35, 0.225, 0.075) },
    },
    {   dependencies = {"owo_dreg_barrel_01",
            "owo_dreg_bayonet_01"
        },
        bayonet =   {offset = true,     position = vector3_box(0, 0.8, -0.18),  rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1, 1, 0.555) },
        bayonet2 =  {offset = true,     position = vector3_box(0, 0.8, -0.222), rotation = vector3_box(90, 0, 0),   scale = vector3_box(1, 0.67, 0.115) },
    },
    -- ######
    -- FIN GRIP
    -- ######
    {   dependencies = {"owo_fin_grip_01"},
        grip =  { offset = true,    position = vector3_box(0, 0, 0),            rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
        -- fin
        grip2 = { offset = true,    position = vector3_box(0, -0.0715, 0.0195), rotation = vector3_box(145, 0, 0),  scale = vector3_box(0.35, 0.35, 0.165) },
    },

    -- ######
	-- Muzzle: SUPPRESSOR
	-- ######
    {	dependencies = { "owo_suppressor_01|owo_suppressor_02",
            "!owo_m16_barrel_a1", "!owo_m16_barrel_a1_02", "!owo_m16_barrel_a2", 
        },
        muzzle = { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 1.8, 1.2) },
    },
    {	dependencies = {"owo_suppressor_01",
            "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2"
        },
        muzzle2 = {offset = true,   position = vector3_box(0, 0.11, 0), rotation = vector3_box(0, 22, 0),   scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies = {"owo_suppressor_02",
            "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2"
        },
        muzzle2 = {offset = true,   position = vector3_box(0, 0.11, 0), rotation = vector3_box(0, 17, 0),   scale = vector3_box(1.2, 1.8, 1.2) }	
    },
    {	dependencies = {"owo_suppressor_01"},
        muzzle2 = {offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 22, 0),   scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle2 = {offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 17, 0),   scale = vector3_box(1.2, 1.8, 1.2) }
    },
    -- the skinny bayonet. sits on muzzle
    {	dependencies = {"owo_suppressor_01|owo_suppressor_02",
            "autogun_bayonet_03"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85) },
    },

    -- ######
	-- Magazine: Jungle Mags
	-- ######
    {   dependencies = { "owo_jungle_mag_01|owo_jungle_mag_02|owo_jungle_mag_03"},
        magazine =          { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        owomagazineac1 =    { offset = true,    position = vector3_box(-0.065, 0.106, -0.27),   rotation = vector3_box(180, 0, 0),      scale = vector3_box(1, 1, 1) },
        -- front
        owomagazineac2 =    { offset = true,    position = vector3_box(-0.03, 0.11, -0.15),     rotation = vector3_box(90, 0, 90),      scale = vector3_box(1, 1.74, 0.37) },
        -- back
        owomagazineac3 =    { offset = true,    position = vector3_box(-0.03, 0., -0.15),       rotation = vector3_box(-90, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- left
        owomagazineac4 =    { offset = true,    position = vector3_box(-0.094, 0.056, -0.15),   rotation = vector3_box(90, 90, 90),     scale = vector3_box(1, 1.532, 0.37) },
        -- right
        owomagazineac5 =    { offset = true,    position = vector3_box(0.03, 0.056, -0.15),     rotation = vector3_box(-90, -90, 90),   scale = vector3_box(1, 1.532, 0.37) },
    },
    {   dependencies = { "owo_jungle_mag_01_flip|owo_jungle_mag_02_flip|owo_jungle_mag_03_flip"},
        magazine =          { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        owomagazineac1 =    { offset = true,    position = vector3_box(0.065, 0.106, -0.27),    rotation = vector3_box(180, 0, 0),      scale = vector3_box(1, 1, 1) },
        owomagazineac2 =    { offset = true,    position = vector3_box(0.034, 0.11, -0.15),     rotation = vector3_box(90, 0, 90),      scale = vector3_box(1, 1.74, 0.37) },
        owomagazineac3 =    { offset = true,    position = vector3_box(0.034, 0., -0.15),       rotation = vector3_box(-90, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owomagazineac4 =    { offset = true,    position = vector3_box(-0.028, 0.056, -0.15),   rotation = vector3_box(90, 90, 90),     scale = vector3_box(1, 1.532, 0.37) },
        owomagazineac5 =    { offset = true,    position = vector3_box(0.095, 0.056, -0.15),    rotation = vector3_box(-90, -90, 90),   scale = vector3_box(1, 1.532, 0.37) },
    },
    {   dependencies = { "owo_jungle_mag_04"},
        magazine =          { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        owomagazineac1 =    { offset = true,    position = vector3_box(-0.065, 0.153, -0.309),  rotation = vector3_box(-170, 0, 0),     scale = vector3_box(1, 1, 1) },
        -- front
        owomagazineac2 =    { offset = true,    position = vector3_box(-0.032, 0.117, -0.149),  rotation = vector3_box(108, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- back
        owomagazineac3 =    { offset = true,    position = vector3_box(-0.032, 0.016, -0.196),  rotation = vector3_box(-67, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- left
        owomagazineac4 =    { offset = true,    position = vector3_box(-0.094, 0.0713, -0.171), rotation = vector3_box(120, 90, 90),    scale = vector3_box(1, 1.532, 0.37) },
        -- right
        owomagazineac5 =    { offset = true,    position = vector3_box(0.03, 0.0647, -0.170),   rotation = vector3_box(45, -90, -165),  scale = vector3_box(1, 1.532, 0.37) },
    },
    {   dependencies = { "owo_jungle_mag_04_flip"},
        magazine =          { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        owomagazineac1 =    { offset = true,    position = vector3_box(0.065, 0.153, -0.309),   rotation = vector3_box(-170, 0, 0),     scale = vector3_box(1, 1, 1) },
        owomagazineac2 =    { offset = true,    position = vector3_box(0.034, 0.117, -0.149),   rotation = vector3_box(108, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owomagazineac3 =    { offset = true,    position = vector3_box(0.034, 0.016, -0.196),   rotation = vector3_box(-67, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owomagazineac4 =    { offset = true,    position = vector3_box(-0.028, 0.0713, -0.171), rotation = vector3_box(120, 90, 90),    scale = vector3_box(1, 1.532, 0.37) },
        owomagazineac5 =    { offset = true,    position = vector3_box(0.095, 0.0647, -0.170),  rotation = vector3_box(45, -90, -165),  scale = vector3_box(1, 1.532, 0.37) },
    },

    -- ######
	-- Barrel: M16
    -- basically the same as syn's aquilon barrel
	-- ######
    -- Iags
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
            "!owo_suppressor_01", "!owo_suppressor_02"
        },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0),          rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.01, -0.064)},
        -- Front Post
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.705, 0.092),    rotation = vector3_box(90, 0, 0), scale = vector3_box(1, 0.27, 0.47) },
    },
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
            "owo_suppressor_01|owo_suppressor_02"
        },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2) },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0),          rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.01, -0.05)},
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.705, 0.092),    rotation = vector3_box(90, 0, 0), scale = vector3_box(1, 0.27, 0.47) },
    },
    {   dependencies = { "owo_m16_barrel_a1",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.06),     rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.47, 2.388, 1.63) },
        barrelshroudac3 =   { offset = true,    position = vector3_box(0, 0.667, -0.024),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.884, 1.45, 0.5) },
    },
    {   dependencies = { "owo_m16_barrel_a1_02",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.06), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.9, 2.388, 1.07) },
    },
    {   dependencies = { "owo_m16_barrel_a2",
            "!receiver_03", "!receiver_06", "!receiver_07", "!receiver_08",
            "!receiver_02", "!receiver_04", "!receiver_05", "!receiver_09",
        },
        flashlight =        { offset = false,   position = vector3_box(0.036, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.06), rotation = vector3_box(-90, 0, 0), scale = vector3_box(2.188, 2.388, 1.5) },
    },
    -- Brautos
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2",
            "receiver_03|receiver_06|receiver_07|receiver_08",
            "!owo_suppressor_01", "!owo_suppressor_02"
        },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0.03),       rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.01, -0.066)},
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.615, 0.092),    rotation = vector3_box(90, 0, 0), scale = vector3_box(1, 0.27, 0.47) },
    },
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2",
            "receiver_03|receiver_06|receiver_07|receiver_08",
            "owo_suppressor_01|owo_suppressor_02"
        },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2) },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0.03),       rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.01, -0.066)},
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.615, 0.092),    rotation = vector3_box(90, 0, 0), scale = vector3_box(1, 0.27, 0.47) },
    },
    {   dependencies = { "owo_m16_barrel_a1",
            "receiver_03|receiver_06|receiver_07|receiver_08"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.064),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.47, 2.388, 1.63) },
        barrelshroudac3 =   { offset = true,    position = vector3_box(0, 0.589, -0.024),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.884, 1.45, 0.5) },
    },
    {   dependencies = { "owo_m16_barrel_a1_02",
            "receiver_03|receiver_06|receiver_07|receiver_08"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.064),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.9, 2.388, 1.07) },
    },
    {   dependencies = { "owo_m16_barrel_a2",
            "receiver_03|receiver_06|receiver_07|receiver_08"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.064),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(2.188, 2.388, 1.5) },
    },
    -- Headhunters (Vigilants)
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2",
            "receiver_02|receiver_04|receiver_05|receiver_09",
            "!owo_suppressor_01", "!owo_suppressor_02"
        },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0),          rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.65, -0.03)},
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.705, 0.098),    rotation = vector3_box(90, 0, 0), scale = vector3_box(1, 0.27, 0.47) },
    },
    {   dependencies = { "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2",
            "receiver_02|receiver_04|receiver_05|receiver_09",
            "owo_suppressor_01|owo_suppressor_02"
        },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2) },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0),          rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.65, -0.03)},
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.705, 0.098),    rotation = vector3_box(90, 0, 0), scale = vector3_box(1, 0.27, 0.47) },
    },
    {   dependencies = { "owo_m16_barrel_a1",
            "receiver_02|receiver_04|receiver_05|receiver_09"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true, position = vector3_box(0, 0.393, 0.076), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.47, 2.388, 1.67) },
        barrelshroudac3 =   { offset = true, position = vector3_box(0, 0.685, -0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.884, 1.45, 0.5) },
    },
    {   dependencies = { "owo_m16_barrel_a1_02",
            "receiver_02|receiver_04|receiver_05|receiver_09"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.375, 0.074),    rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.9, 2.388, 1.07) },
    },
    {   dependencies = { "owo_m16_barrel_a2",
            "receiver_02|receiver_04|receiver_05|receiver_09"
        },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.395, 0.074),    rotation = vector3_box(-90, 0, 0), scale = vector3_box(2.188, 2.388, 1.5) },
    },
    
    -- ######
    -- Bayonet: M7
    -- ######
    {   dependencies = {"owo_bayonet_m7_01",
            "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.158, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = {"owo_bayonet_m7_01",
            "!owo_m16_barrel_a1","!owo_m16_barrel_a1_02","!owo_m16_barrel_a2"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.47, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = {"owo_bayonet_m7_01"},
        bayonet2 = {offset = true, position = vector3_box(0, 0.002, -0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        bayonet3 = {offset = true, position = vector3_box(0, -0.012, -0.002), rotation = vector3_box(0, 90, 180), scale = vector3_box(0.25, 0.825, 0.25) },
    },

    -- ######
    -- Sight: EOTech
    -- ######
    {   dependencies = { "owo_holosight_01|owo_holosight_02" },
        no_scope_offset =   { position = vector3_box(0, -0.0001, -0.0193), rotation = vector3_box(0, 0, 0)},
        scope_offset =      { position = vector3_box(0, -0.0001, -0.0193), rotation = vector3_box(0, 0, 0)},
        owosightac1 =       { offset = true, position  = vector3_box(0.004, 0.012, 0.014), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.39, 0.222) },
        owosightac2 =       { offset = true, position  = vector3_box(-0.004, 0.012, 0.014), rotation = vector3_box(90, -90, 0), scale = vector3_box(0.95, 0.39, 0.222) },
        owosightac3 =       { offset = true, position  = vector3_box(-0.003, 0.046, 0.014), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.204) },
        owosightac4 =       { offset = true, position  = vector3_box(0, 0.012, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.45, 0.28, 0.192) },
    },
    {   dependencies = { "owo_holosight_01" },
        sight =             { offset = true, position  = vector3_box(0, 0, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
    },
    {   dependencies = { "owo_holosight_02" },
        sight =             { offset = true, position  = vector3_box(0, 0.05, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        owosight2 =         { offset = true, position  = vector3_box(0, -0.042, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.168, 0.104) },
        owosight2ac1 =      { offset = true, position  = vector3_box(0, -0.15, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        owosight2ac2 =      { offset = true, position  = vector3_box(0, -0.0162, 0.03), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    },

    -- ####################################################################################
    -- HIDING HELPERS
    -- ####################################################################################
    -- Muzzles
    {	dependencies = {"!owo_suppressor_01", "!owo_suppressor_02"},
        muzzle2 = {hide_mesh = {{"muzzle2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Bayonet
    {   dependencies = {"!owo_dreg_bayonet_01", "!owo_bayonet_m7_01"},
        bayonet2 = {hide_mesh = { {"bayonet2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        bayonet3 = {hide_mesh = { {"bayonet3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    -- Barrels
    -- Barrels
    {   dependencies = {"!owo_dreg_barrel_01", "!owo_m16_barrel_a1", "!owo_m16_barrel_a1_02", "owo_m16_barrel_a2"},
        barrelshroudac2 = {hide_mesh = {{"barrelshroudac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
        barrelshroudac3 = {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
        barrelshroudac4 = {hide_mesh = {{"barrelshroudac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies = {"!owo_dreg_barrel_01", "!owo_m16_barrel_a1", "!owo_m16_barrel_a1_02", "!owo_m16_barrel_a2"},
        barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        barrelshroudac2 = {hide_mesh = {{"barrelshroudac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
        barrelshroudac3 = {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
        barrelshroudac4 = {hide_mesh = {{"barrelshroudac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    -- Magazines
    {   dependencies = { "!owo_jungle_mag_01", "!owo_jungle_mag_02", "!owo_jungle_mag_03", "!owo_jungle_mag_04",
            "!owo_jungle_mag_01_flip", "!owo_jungle_mag_02_flip", "!owo_jungle_mag_03_flip", "!owo_jungle_mag_04_flip",
        },
        owomagazineac1 = { hide_mesh = {{"owomagazineac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        owomagazineac2 = { hide_mesh = {{"owomagazineac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        owomagazineac3 = { hide_mesh = {{"owomagazineac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        owomagazineac4 = { hide_mesh = {{"owomagazineac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        owomagazineac5 = { hide_mesh = {{"owomagazineac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    -- Grips
    {   dependencies = {"!owo_fin_grip_01"},
        grip2 = { hide_mesh = {{"grip2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Sights
    {   dependencies = {"!owo_holosight_01", "!owo_holosight_02"},
        owosightac1 = { hide_mesh = {{"owosightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosightac2 = { hide_mesh = {{"owosightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosightac3 = { hide_mesh = {{"owosightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosightac4 = { hide_mesh = {{"owosightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"!owo_holosight_02"},
        owosight2 = { hide_mesh = {{"owosight2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosight2ac1 = { hide_mesh = {{"owosight2ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        owosight2ac2 = { hide_mesh = {{"owosight2ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})