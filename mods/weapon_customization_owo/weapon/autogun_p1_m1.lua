local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "autogun_p1_m1" -- Braced/Infantry Autoguns

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
mod.wc.attachment[this_variant].grip2 = {}
mod.wc.attachment[this_variant].muzzle2 = {}
mod.wc.attachment[this_variant].owomagazineac1 = {}
mod.wc.attachment[this_variant].owomagazineac2 = {}
mod.wc.attachment[this_variant].owomagazineac3 = {}
mod.wc.attachment[this_variant].owomagazineac4 = {}
mod.wc.attachment[this_variant].owomagazineac5 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_dreg_gunner_barrel(this_variant, "barrel")
mod.owo_dreg_gunner_bayonet(this_variant, "bayonet")
mod.owo_fin_grip(this_variant, "grip")
mod.owo_suppressor(this_variant, "muzzle")
mod.owo_jungle_mag(this_variant, "magazine")

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
        barrel = { offset = true, position = vector3_box(0, 0, -0.014), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud = { offset = true, position = vector3_box(0, 0, -0.014), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.24, 0.7, 0.24) }, 
    },
    -- Brautos
    {   dependencies = {"owo_dreg_barrel_01",
            "receiver_03|receiver_06|receiver_07|receiver_08"
        },
        barrel = { offset = true, position = vector3_box(0, 0, 0.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud = { offset = true, position = vector3_box(0, 0, 0.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.24, 0.7, 0.24) }, 
    },
    -- Headhunters
    {   dependencies = {"owo_dreg_barrel_01",
            "receiver_02|receiver_04|receiver_05|receiver_09"
        },
        barrel = { offset = true, position = vector3_box(0, 0, -0.012), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud = { offset = true, position = vector3_box(0, 0, -0.012), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.24, 0.7, 0.24)}, 
    },
	{   dependencies = {"owo_dreg_barrel_01"},
        --[[ will get aligned based receiver
	    barrel = { offset = true, position = vector3_box(0, 0, 0.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.27, 0.63, 0.27) },
        -- outside, one with the front sight
        barrelshroud = {offset = true, position = vector3_box(0, 0, 0.025), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.24, 0.7, 0.24) }, 
        ]]
        --[[-- long receiver, reverse las
        barrelshroudac = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 0, 180),scale = vector3_box(1, 1, 1) },
        ]]
        -- bayonet lug
        barrelshroudac2 = { offset = true, position = vector3_box(0, 0, -0.115), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 2.45, 0.8) }, 
        -- hand grip for long receiver
        barrelshroudac3 = { offset = true, position = vector3_box(0, 0, -0.215), rotation = vector3_box(0, 0, 0), scale = vector3_box(2, 1.5, 2.5) }, 
        -- hand grip (top)
        barrelshroudac4 = { offset = true, position = vector3_box(0, 0.153, 0.115), rotation = vector3_box(180, 0, 0), scale = vector3_box(2.4, 0.969, 2.85) }, 
        flashlight = {offset = true, position = vector3_box(0.096, 0.17, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.7, 2.7, 2.7) },
        muzzle = {offset = true, position = vector3_box(0, 1, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.2, 2.2, 2.2) }
    },
    -- Helbore bayonets
	{   dependencies = {"owo_dreg_barrel_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.699, -0.095), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.5, 1.7, 3.0) }
    },
    -- Hiding helpers when not equipped
    {   dependencies = {"!owo_dreg_barrel_01"},
        -- outside, one with the front sight
        barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        -- bayonet lug
        barrelshroudac2 = {hide_mesh = {{"barrelshroudac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
        -- hand grip for long receiver
        barrelshroudac3 = {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
        -- hand grip (top)
        barrelshroudac4 = {hide_mesh = {{"barrelshroudac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    -- ######
    -- DREG GUNNER BAYONET
    -- ######
    {   dependencies = {"!owo_dreg_barrel_01",
            "owo_dreg_bayonet_01",
        },
        bayonet = {offset = true, position = vector3_box(0, 0.55, -0.055), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.35, 0.275, 0.35) },
        bayonet2 = {offset = true, position = vector3_box(0, 0.55, -0.069), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.35, 0.225, 0.075) },
    },
    {   dependencies = {"owo_dreg_barrel_01",
            "owo_dreg_bayonet_01"
        },
        bayonet = {offset = true, position = vector3_box(0, 0.8, -0.18), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 0.555) },
        bayonet2 = {offset = true, position = vector3_box(0, 0.8, -0.222), rotation = vector3_box(90, 0, 0), scale = vector3_box(1, 0.67, 0.115) },
    },
    {   dependencies = {"!owo_dreg_bayonet_01"},
        bayonet2 = {hide_mesh = { {"bayonet2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    -- ######
    -- FIN GRIP
    -- ######
    {   dependencies = {"owo_fin_grip_01"},
        grip = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        -- fin
        grip2 = { offset = true, position = vector3_box(0, -0.0715, 0.0195), rotation = vector3_box(145, 0, 0), scale = vector3_box(0.35, 0.35, 0.165) },
    },
    {   dependencies = {"!owo_fin_grip_01"},
        grip2 = { hide_mesh = {{"grip2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },

    -- ######
	-- Muzzle: SUPPRESSOR
	-- ######
    {	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
        muzzle = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2) },
    },
    {	dependencies = {"owo_suppressor_01"},
        muzzle2 = {offset = true, position = vector3_box(0, 0, 0),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2) },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle2 = {offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2) }
    },
    -- Hiding helpers when not equipped
    {	dependencies = {"!owo_suppressor_01", 
            "!owo_suppressor_02"
        },
        muzzle2 = {hide_mesh = {{"muzzle2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
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
        magazine = { offset = true,     position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        owomagazineac1 = { offset = true, position = vector3_box(-0.065, 0.106, -0.27), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1, 1) },
        -- front
        owomagazineac2 = { offset = true, position = vector3_box(-0.03, 0.11, -0.15), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 1.74, 0.37) },
        -- back
        owomagazineac3 = { offset = true, position = vector3_box(-0.03, 0., -0.15), rotation = vector3_box(-90, 0, 90), scale = vector3_box(1, 1.74, 0.37) },
        -- left
        owomagazineac4 = { offset = true, position = vector3_box(-0.094, 0.056, -0.15), rotation = vector3_box(90, 90, 90), scale = vector3_box(1, 1.532, 0.37) },
        -- right
        owomagazineac5 = { offset = true, position = vector3_box(0.03, 0.056, -0.15), rotation = vector3_box(-90, -90, 90), scale = vector3_box(1, 1.532, 0.37) },
    },
    {   dependencies = { "owo_jungle_mag_04"},
        magazine = { offset = true,     position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        owomagazineac1 = { offset = true, position = vector3_box(-0.065, 0.153, -0.309), rotation = vector3_box(-170, 0, 0), scale = vector3_box(1, 1, 1) },
        -- front
        owomagazineac2 = { offset = true, position = vector3_box(-0.032, 0.117, -0.149), rotation = vector3_box(108, 0, 90), scale = vector3_box(1, 1.74, 0.37) },
        -- back
        owomagazineac3 = { offset = true, position = vector3_box(-0.032, 0.016, -0.196), rotation = vector3_box(-67, 0, 90), scale = vector3_box(1, 1.74, 0.37) },
        -- left
        owomagazineac4 = { offset = true, position = vector3_box(-0.094, 0.0713, -0.171), rotation = vector3_box(120, 90, 90), scale = vector3_box(1, 1.532, 0.37) },
        -- right
        owomagazineac5 = { offset = true, position = vector3_box(0.03, 0.0647, -0.170), rotation = vector3_box(169, -90, 90), scale = vector3_box(1, 1.532, 0.37) },
    },

    {   dependencies = { "!owo_jungle_mag_01",
            "!owo_jungle_mag_02",
            "!owo_jungle_mag_03",
            "!owo_jungle_mag_04",
        },
        owomagazineac1 = { hide_mesh = {{"owomagazineac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        owomagazineac2 = { hide_mesh = {{"owomagazineac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        owomagazineac3 = { hide_mesh = {{"owomagazineac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        owomagazineac4 = { hide_mesh = {{"owomagazineac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
        owomagazineac5 = { hide_mesh = {{"owomagazineac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
})