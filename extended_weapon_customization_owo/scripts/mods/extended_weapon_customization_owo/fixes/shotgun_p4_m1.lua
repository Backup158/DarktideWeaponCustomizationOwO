-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box

-- ################################
-- Game Content Addresses
-- ################################
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_empty_trinket = _item.."/trinkets/unused_trinket"
local _item_minion = "content/items/weapons/minions"

-- ###################################################################
-- FIXES TO RETURN
-- ###################################################################


local custom_fixes = {
    
}

local custom_attachments = {

}
-- Patches for if other plugins already defined
local ewc_ba = get_mod("extended_weapon_customization_base_additions")
if not ewc_ba then
    custom_attachments.flashlight = {
        parent_slot = "receiver",
        default_path = _item_empty_trinket,
        fix = {
            offset = {
                position = vector3_box(0.015, 0.158, 0.025),
                rotation = vector3_box(0, 0, 0),
                scale = vector3_box(1, 1, 1),
                node = 1,
            },
        },
    }
    custom_attachments.muzzle = {
        parent_slot = "receiver",
        default_path = _item_empty_trinket,
    }
end

return {
    --fixes = custom_fixes,
    attachment_slots = custom_attachments,
}