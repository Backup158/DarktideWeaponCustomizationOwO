local mod = get_mod("weapon_customization_owo")
local mt = get_mod("weapon_customization_mt_stuff")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "bolter_p1_m1" -- Spearhead Boltgun

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################


-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_california_bolter(this_variant, "receiver")

-- ############################################
-- Inject Fixes
-- ############################################
mod.inject_fixes(this_variant, {
    -- ######
    -- California Bolter receiver main
    -- ######
    {   dependencies = { "owo_california_bolter_01|owo_california_bolter_02|owo_california_bolter_03|owo_california_bolter_04|owo_california_bolter_05|owo_california_bolter_06|owo_california_bolter_07|owo_california_bolter_08"},
        receiver = { offset = true,  position = vector3_box(0, 0, 0.054), scale = vector3_box(1, 1, 0.64)},    
        -- In compliance with California Penal Code § 32310 PC 
        -- Reducing magazine capacity
        magazine = { offset = true,  position = vector3_box(0, 0, 0.055), scale = vector3_box(1, 1, 0.58)},
    },
    -- Cali grips
    {   dependencies = { "owo_california_bolter_01|owo_california_bolter_02|owo_california_bolter_03|owo_california_bolter_04|owo_california_bolter_05|owo_california_bolter_06|owo_california_bolter_07|owo_california_bolter_08", 
            "!hlasgun_grip_01","!hlasgun_grip_02", "!hlasgun_grip_03", "!plas_pisgrip_01","!plas_pisgrip_02", "!plas_pisgrip_03"
        },
        grip = { offset = true,  position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.564)}
    },
    -- MT Plasma grips
    -- this one sits higher than other grips for whatever the fuck reason
    {   dependencies = { "owo_california_bolter_01|owo_california_bolter_02|owo_california_bolter_03|owo_california_bolter_04|owo_california_bolter_05|owo_california_bolter_06|owo_california_bolter_07|owo_california_bolter_08", 
            "plas_pisgrip_01|plas_pisgrip_02|plas_pisgrip_03"
        },
        grip = { offset = true,  position = vector3_box(0, 0.006, -0.038), scale = vector3_box(1, 1, 1.564)},
    },
    -- Repositioning for MT Cadia Compliant Stock
    -- makes it sit higher than usual so the top of the trigger guard is flush with the receiver
    {   dependencies = { "owo_california_bolter_01|owo_california_bolter_02|owo_california_bolter_03|owo_california_bolter_04|owo_california_bolter_05|owo_california_bolter_06|owo_california_bolter_07|owo_california_bolter_08", 
            "hlasgun_grip_01|hlasgun_grip_02|hlasgun_grip_03"
        },
        grip = { offset = true,  position = vector3_box(0, 0, 0.075), scale = vector3_box(1, 1, 1.564)},
    }
})