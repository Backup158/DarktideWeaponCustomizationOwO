local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "combataxe_p2_m1" -- Tactical Axe

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
if not syn then
    mod.wc.attachment[this_variant].bladeshroud = {}
end

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_tacax_spike(this_variant)


-- ############################################
-- Inject Fixes
-- ############################################
local _mt_falchion_grips = "falchion_mt_grip_01|falchion_mt_grip_02|falchion_mt_grip_03|falchion_mt_grip_04|falchion_mt_grip_05"
local _mt_sabre_grips = "sabre_mt_grip_01|sabre_mt_grip_02|sabre_mt_grip_03|sabre_mt_grip_04|sabre_mt_grip_05"
local _mt_dclaw_grips = "combat_sword_mt_grip_01|combat_sword_mt_grip_02|combat_sword_mt_grip_03|combat_sword_mt_grip_04|combat_sword_mt_grip_05|combat_sword_mt_grip_06"
--local _mt_combat_axe_grips = "axe_mt_grip_01|axe_mt_grip_02|axe_mt_grip_03|axe_mt_grip_04|axe_mt_grip_05|axe_mt_grip_06"
--local _mt_tactical_axe_grips = "hatchet_mt_grip_01|hatchet_mt_grip_02|hatchet_mt_grip_03|hatchet_mt_grip_04|hatchet_mt_grip_05|hatchet_mt_grip_06"
local _mt_eviscerator_grips = "2h_chain_sword_mt_grip_01|2h_chain_sword_mt_grip_02|2h_chain_sword_mt_grip_03|2h_chain_sword_mt_grip_04"
local _mt_chain_sword_grips = "chain_sword_mt_grip_01|chain_sword_mt_grip_02|chain_sword_mt_grip_03|chain_sword_mt_grip_04|chain_sword_mt_grip_05|chain_sword_mt_grip_06|chain_sword_mt_grip_07|chain_sword_mt_grip_08"
local _mt_ogryn_grips = "ogrynbladehandle_01|ogrynbladehandle_02|ogrynbladehandle_03|ogrynbladehandle_04|ogrynbladehandle_05|ogrynbladehandle_06"

mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Head: TACAX SPIKE
    -- ######
    {	dependencies =  { "owo_tacax_spike_01|owo_tacax_spike_06", _mt_ogryn_grips },
        head =          { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.54, 2.3, 1.5 ) },
        bladeshroud =   { offset = false, parent = "head", position = vector3_box(0, 0, 0.208), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
    },
    {	dependencies =  { "owo_tacax_spike_03", _mt_ogryn_grips },
        head =          { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.54, 2.3, 1.5 ) },
        bladeshroud =   { offset = false, parent = "head", position = vector3_box(0, 0, 0.214), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
    },
    {	dependencies =  { "owo_tacax_spike_04", _mt_ogryn_grips },
        head =          { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.54, 2.3, 1.5 ) },
        bladeshroud =   { offset = false, parent = "head", position = vector3_box(0, 0, 0.17), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.808, 0.382 ) },
    },
    {	dependencies =  { "owo_tacax_spike_05", _mt_ogryn_grips },
        head =          { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.54, 2.3, 1.5 ) },
        bladeshroud =   { offset = false, parent = "head", position = vector3_box(0, 0, 0.192), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.808, 0.262 ) },
    },
    {	dependencies =  { "owo_tacax_spike_02|owo_tacax_spike_07", _mt_ogryn_grips },
        head =          { offset = false, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.54, 2.3, 1.5 ) },
        bladeshroud =   { offset = false, position = vector3_box(0, 0, 0.382), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 2.202, 0.382 ) },
    },
    --  Default Cases
    --      Chain axe, combat axe, tactical axe, mt shovel grips
    {	dependencies =  { "owo_tacax_spike_01|owo_tacax_spike_06" },
        head =          { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        bladeshroud =   { offset = false, parent = "head", position = vector3_box(0, 0, 0.208), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
    },
    {	dependencies =  { "owo_tacax_spike_03" },
        head =          { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        bladeshroud =   { offset = false, parent = "head", position = vector3_box(0, 0, 0.214), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
    },
    {	dependencies =  { "owo_tacax_spike_04" },
        head =          { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        bladeshroud =   { offset = false, parent = "head", position = vector3_box(0, 0, 0.17), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.808, 0.382 ) },
    },
    {	dependencies =  { "owo_tacax_spike_05" },
        head =          { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        bladeshroud =   { offset = false, parent = "head", position = vector3_box(0, 0, 0.192), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.808, 0.262 ) },
    },
    {	dependencies =  { "owo_tacax_spike_02|owo_tacax_spike_07" },
        head =          { offset = false, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        bladeshroud =   { offset = false, position = vector3_box(0, 0, 0.244), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.56, 0.862, 0.382 ) },
    },

    -- ####################################################################################
    -- HIDING HELPERS
    -- By putting it down here, they will only be hidden if the fixes from above are not found
    -- Because they match the main parts first, if there is no match it means the main part is not attached
    -- ####################################################################################
    -- Head
    {	dependencies = {"owo_tacax_spike_helper_01"},
        bladeshroud = { hide_mesh = {{"bladeshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
