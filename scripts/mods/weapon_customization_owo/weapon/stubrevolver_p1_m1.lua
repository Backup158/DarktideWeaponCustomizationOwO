local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "stubrevolver_p1_m1" -- Quickdraw Stub Revolver

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].muzzle_2 = {} -- MT and Syn didn't add this to revolver yet
mod.wc.attachment[this_variant].barrelshroud = {} -- MT and Syn didn't add this to revolver yet

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_revolver_shotgun_barrel(this_variant, "barrel")
mod.owo_grip_laser(this_variant, "flashlight")
mod.owo_suppressor(this_variant, "muzzle")

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
    -- ######
	-- Muzzle: SUPPRESSOR
	-- ######
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04",
            "owo_suppressor_01|owo_suppressor_02"
        },
        muzzle = {parent = "barrel", parent_node = 9, 
            position = vector3_box(0, 0.328, -0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2),
            animation_wait_attach = {"barrel"},
        },
        muzzle_2 = {parent = "barrel", parent_node = 9, 
            position = vector3_box(0, 0.328, -0.02),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ),
            animation_wait_attach = {"barrel"}, 
        },	
    },
    {   dependencies = {"owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08",
            "owo_suppressor_01|owo_suppressor_02"
        },
        muzzle = {parent = "barrel", parent_node = 9, 
            position = vector3_box(0, 0.236, -0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2),
            animation_wait_attach = {"barrel"},
        },
        muzzle_2 = {parent = "barrel", parent_node = 9, 
            position = vector3_box(0, 0.236, -0.02),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ),
            animation_wait_attach = {"barrel"}, 
        },	
    },
    {	dependencies = { "owo_suppressor_01|owo_suppressor_02"},
        muzzle = {parent = "barrel", parent_node = 9, offset = false, 
            position = vector3_box(0, 0.192, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.2, 1.8, 1.2 ),
            animation_wait_attach = {"barrel"},
        },
    },
    {	dependencies = {"owo_suppressor_01"},
        muzzle_2 = {parent = "barrel", parent_node = 9, offset = false, 
            position = vector3_box(0, 0.192, -0.022),rotation = vector3_box(0, 22, 0), scale = vector3_box(1.2, 1.8, 1.2 ),
            animation_wait_attach = {"barrel"},
        },	
    },
    {	dependencies = {"owo_suppressor_02"},
        muzzle_2 = {parent = "barrel", parent_node = 9, offset = false, 
            position = vector3_box(0, 0.192, -0.022), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.2, 1.8, 1.2 ),
            animation_wait_attach = {"barrel"},
        },
    },
    {	dependencies = { "owo_suppressor_03"},
        muzzle = { offset = true,   position = vector3_box(0, 0.5, 0),    rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.36, 0.4, 0.36) },
        muzzle_2 = { offset = true,   position = vector3_box(0, 0.3, 0),    rotation = vector3_box(-90, 0, 0),    scale = vector3_box(1.3, 1.3, 1.11) },
    },
    -- the skinny bayonet. sits on muzzle
    {	dependencies = {"owo_suppressor_01|owo_suppressor_02", 
            "autogun_bayonet_03"
        },
        bayonet = {parent = "barrel", parent_node = 9, offset = false, 
            position = vector3_box(0, 0.03, -0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.5, 0.85 ),
            animation_wait_attach = {"barrel"},
        },
    },

    -- #####
    -- Barrel: Shotgun Extension
    -- offset false/true. doesn't change pos either way. does change scale.
    -- #####
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04|owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08",
        },
        -- trigger move is used in wc/weapon_attachments/WEAPON.lua
        -- monkey see monkey do :3
        barrel = { offset = true, mesh_move = false, 
            position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
            rotation_node = 2,
            trigger_move = {"muzzle", "rail", "barrelshroud", "muzzle_2"}, animation_wait_detach = {"muzzle_2", "barrelshroud", "rail", "muzzle"},
        },
        -- Offset is false so it can be reparented to barrel on load, which lets it follow the animation
        barrelshroud = {parent = "barrel", parent_node = 9, offset = false, mesh_move = false, 
            position = vector3_box(0, 0.026, -0.022), scale = vector3_box(0.722, 0.460, 0.815),
            animation_wait_attach = {"barrel"},
        },
        emblem_left = {position = vector3_box(-0.021, 0.159, .0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(.65, -.65, .65)},
        emblem_right = {position = vector3_box(0.021, 0.159, .0315), rotation = vector3_box(0, 0, 0), scale = vector3_box(.65, .65, .65)},
    },
   --[[ --      Long barrel
        Not doing until i figure out the positioning issue bug
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04_l|owo_revolver_shotgun_barrel_base_05_l|owo_revolver_shotgun_barrel_base_06_l|owo_revolver_shotgun_barrel_base_08_l",
        },
        barrel = {offset = true, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud = {parent = "barrel", parent_node = 9, offset = false, 
            position = vector3_box(0, 0.116, -0.02), scale = vector3_box(0.8, 0.615, 0.865)
        },
    },]]
    --      Muzzle handling
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04",
        },
        muzzle = {parent = "barrel", parent_node = 9, parent = "barrel", 
            position = vector3_box(0, 0.328, -0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
            animation_wait_attach = {"barrel"},
        },
        dependencies = {"owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08",
        },
        muzzle = {parent = "barrel", parent_node = 9, parent = "barrel", 
            position = vector3_box(0, 0.236, -0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
            animation_wait_attach = {"barrel"},
        },
    },

    -- #####
    -- Flashlight: Grip Laser
    -- #####
    {   dependencies = {"owo_grip_laser_01|owo_grip_laser_02"},
        flashlight = {position = vector3_box(-0.01, 0.044, -0.016), scale = vector3_box(0.345, 0.3, 0.285)},
    },

    -- ################
    -- Hiding unused attachments
    -- ################
    -- Barrels
    {   dependencies = { "owo_revolver_shotgun_barrel_04|owo_revolver_shotgun_barrel_05|owo_revolver_shotgun_barrel_06|owo_revolver_shotgun_barrel_08"-- "!owo_revolver_shotgun_barrel_base_04_l", "!owo_revolver_shotgun_barrel_base_05_l", "!owo_revolver_shotgun_barrel_base_06_l", "!owo_revolver_shotgun_barrel_base_08_l"
        },
            barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Muzzles
    {	dependencies = {"owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03" },
        muzzle_2 = {hide_mesh = { 	{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
})
