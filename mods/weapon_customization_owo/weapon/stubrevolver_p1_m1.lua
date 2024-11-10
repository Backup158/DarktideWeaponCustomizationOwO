local mod = get_mod("weapon_customization_owo")
local mt = get_mod("weapon_customization_mt_stuff")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "stubrevolver_p1_m1"

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
--mod.wc.attachment[this_variant].barrelex = {}

--mod.barrelex(this_variant)
--mt.barrelex(this_variant)

--[[
mod.table_append(mt.barrelex, {
    "owo_revolver_shotgun_barrel_01",
    "owo_revolver_shotgun_barrel_02",
})
]]

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_revolver_shotgun_barrel(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    {   dependencies = {
            "owo_revolver_shotgun_barrel_01|owo_revolver_shotgun_barrel_04|owo_revolver_shotgun_barrel_05|owo_revolver_shotgun_barrel_06|owo_revolver_shotgun_barrel_08|owo_revolver_shotgun_barrel_09"
        },
        barrel = {
            offset = true, 
            --position = vector3_box(-0.033, -0.4, 0.1),
            position = vector3_box(0, 0, 0),
            --mesh_position = vector3_box(1, 1, 0),
            --mesh_position = vector3_box(0.033, 0.4, -0.1),
            scale = vector3_box(1, 0.55, 0.75)
        }
    },
    {   dependencies = {
            "owo_revolver_shotgun_barrel_01|owo_revolver_shotgun_barrel_05|owo_revolver_shotgun_barrel_06|owo_revolver_shotgun_barrel_08",
            "rshroud_gaunt_01b|rshroud_gaunt_02b|rshroud_gaunt_03b|rshroud_gaunt_04b|rshroud_gaunt_04bb|rshroud_gaunt_05b"
        },
        rshroud = {
            parent = "receiver", parent_node = 9, 
            position = vector3_box(-0.03, -0.35, 0.05), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(1, 1, 1)
        }
    },
    {   dependencies = {
            "owo_revolver_shotgun_barrel_04",
            "rshroud_gaunt_01b|rshroud_gaunt_02b|rshroud_gaunt_03b|rshroud_gaunt_04b|rshroud_gaunt_04bb|rshroud_gaunt_05b"
        },
        rshroud = {
            parent = "barrel", parent_node = 9, 
            position = vector3_box(-0.03, -0.35, 0.05), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(1, 1, 1)
        }
    },
    {   dependencies = {
            "owo_revolver_shotgun_barrel_09",
            "rshroud_gaunt_01b|rshroud_gaunt_02b|rshroud_gaunt_03b|rshroud_gaunt_04b|rshroud_gaunt_04bb|rshroud_gaunt_05b"
        },
        rshroud = {
            parent = "barrel", parent_node = 9, 
            position = vector3_box(-0.03, -0.35, 0.05), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(1, 1, 1)
        }
    }
    --[[,
    {   dependencies = {
            "owo_revolver_shotgun_barrel_01|owo_revolver_shotgun_barrel_04|owo_revolver_shotgun_barrel_05|owo_revolver_shotgun_barrel_06|owo_revolver_shotgun_barrel_08|owo_revolver_shotgun_barrel_09",
            "scope_01|scope_02|scope_03"
        },
        rail = {
            parent = "barrel", parent_node = 9, 
            position = vector3_box(-0.033, -0.4, 0.1), 
            rotation = vector3_box(0, 0, 0), 
            scale = vector3_box(1, .3, 2.5)
        },
        sight = {
            parent = "barrel", parent_node = 9, 
            position = vector3_box(-0.033, -0.4, 0.1), 
            scale = vector3_box(0.8, 1, 1)
        }
    }
        ]]
})