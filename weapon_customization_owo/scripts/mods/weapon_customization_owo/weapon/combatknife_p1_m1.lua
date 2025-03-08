local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "combatknife_p1_m1" -- Combat Blade

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
mod.wc.attachment[this_variant].frontguard = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_trench_dagger_guard(this_variant)

mod.owo_historical_blade(this_variant)

-- ############################################
-- Inject Fixes
-- ############################################
local _owo_finger_guards = "owo_trench_dagger_finger_guard_01|owo_trench_dagger_finger_guard_02|owo_trench_dagger_finger_guard_03|owo_trench_dagger_finger_guard_04|owo_trench_dagger_finger_guard_05|owo_trench_dagger_finger_guard_06"
local _mt_falchion_grips = "falchion_mt_grip_01|falchion_mt_grip_02|falchion_mt_grip_03|falchion_mt_grip_04|falchion_mt_grip_05"
local _mt_sabre_grips = "sabre_mt_grip_01|sabre_mt_grip_02|sabre_mt_grip_03|sabre_mt_grip_04|sabre_mt_grip_05"
local _mt_dclaw_grips = "combat_sword_mt_grip_01|combat_sword_mt_grip_02|combat_sword_mt_grip_03|combat_sword_mt_grip_04|combat_sword_mt_grip_05|combat_sword_mt_grip_06"
local _mt_combat_axe_grips = "axe_mt_grip_01|axe_mt_grip_02|axe_mt_grip_03|axe_mt_grip_04|axe_mt_grip_05|axe_mt_grip_06"
local _mt_tactical_axe_grips = "hatchet_mt_grip_01|hatchet_mt_grip_02|hatchet_mt_grip_03|hatchet_mt_grip_04|hatchet_mt_grip_05|hatchet_mt_grip_06"
local _mt_eviscerator_grips = "2h_chain_sword_mt_grip_01|2h_chain_sword_mt_grip_02|2h_chain_sword_mt_grip_03|2h_chain_sword_mt_grip_04"
local _mt_chain_sword_grips = "chain_sword_mt_grip_01|chain_sword_mt_grip_02|chain_sword_mt_grip_03|chain_sword_mt_grip_04|chain_sword_mt_grip_05|chain_sword_mt_grip_06|chain_sword_mt_grip_07|chain_sword_mt_grip_08"
local _mt_ogryn_grips = "ogrynbladehandle_01|ogrynbladehandle_02|ogrynbladehandle_03|ogrynbladehandle_04|ogrynbladehandle_05|ogrynbladehandle_06"

mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Front Guards
    -- ######
    {   dependencies =  { _mt_falchion_grips, _owo_finger_guards },
        frontguard =    { offset = true, position = vector3_box(0, 0, 0.086), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.69, 0.69, 0.75 ), },
    },
    {   dependencies =  { _mt_sabre_grips, _owo_finger_guards },
        frontguard =    { offset = true, position = vector3_box(0, 0, 0.064), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.36, 0.54, 0.52 ), },
    },
    {   dependencies =  { _mt_dclaw_grips, _owo_finger_guards },
        frontguard =    { offset = true, position = vector3_box(0, 0, 0.064), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.36, 0.64, 0.62 ), },
    },
    {   dependencies =  { _mt_combat_axe_grips, _owo_finger_guards },
        frontguard =    { offset = true, position = vector3_box(0, 0, 0.214), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.36, 0.5, 1.15 ), },
    },
    {   dependencies =  { _mt_tactical_axe_grips, _owo_finger_guards },
        frontguard =    { offset = true, position = vector3_box(0, 0, 0.148), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.36, 0.5, 0.8 ), },
    },
    {   dependencies =  { _mt_eviscerator_grips, _owo_finger_guards },
        frontguard =    { offset = true, position = vector3_box(0, 0, 0.122), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.36, 0.45, 0.815 ), },
    },
    {   dependencies =  { _mt_ogryn_grips, _owo_finger_guards },
        frontguard =    { offset = true, position = vector3_box(0, 0, -0.014), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.9, 1.1, 0.9 ), },
    },
    {   dependencies =  { _owo_finger_guards },
        frontguard =    { offset = true, position = vector3_box(0, 0, 0.064), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.36, 0.36, 0.36 ), },
    },
    -- ######
    -- Blade: Historical Pack
    -- ######
    --  -------------------------------------------
    --  Trench Spike
    --  -------------------------------------------
    {   dependencies =  { _mt_falchion_grips, "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.014, 0.0), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.0, 1.75, 1.25 ), },
    },
    {   dependencies =  { _mt_sabre_grips, "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.008, 0.0), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.0, 1.35, 1.0 ), },
    },
    {   dependencies =  { _mt_dclaw_grips, "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.01, 0.026), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.0, 1.25, 1.0 ), },
    },
    {   dependencies =  { _mt_combat_axe_grips, "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.008, 0.076), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 2.65, 0.8 ), },
    },
    {   dependencies =  { _mt_tactical_axe_grips, "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.012, 0.032), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 1.75, 0.8 ), },
    },
    {   dependencies =  { _mt_eviscerator_grips, "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.01, 0.034), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.85, 1.5, 0.85 ), },
    },
    {   dependencies =  { _mt_chain_sword_grips, "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.01, 0.0), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.85, 1.2, 0.85 ), },
    },
    {   dependencies =  { _mt_ogryn_grips, "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.028, 0.036), rotation = vector3_box(90, 0, 0), scale = vector3_box(2.0, 2.3, 2.15 ), },
    },
    {   dependencies =  { "owo_historical_blade_01" },
        body =          { offset = true, position = vector3_box(0, -0.01, 0.0), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.85, 1.0, 0.85 ), },
    },
})
