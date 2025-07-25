local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "combatknife_p1_m1" -- Combat Blade
local _hide_slot_table = mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/common/hide_slot")

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
-- ###############
-- MT Plugin Compatibility
-- ###############
local table_of_mt_slots = {
    
}
for _, slot_name in ipairs(table_of_mt_slots) do
    mod.create_default_attachment(this_variant, slot_name)
end

-- ###############
-- Syn's Edits Compatibility
-- ###############
local table_of_syn_slots = {
    "bladeshroud",
}
if not mod.syn then -- these slots already exist in Syn's plugin
    mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_syn_slots)
else
    for _, slot_name in ipairs(table_of_syn_slots) do
        mod.create_default_attachment(this_variant, slot_name)
    end
end

-- ###############
-- OwO Slot Initialization
-- ###############
local table_of_owo_slots = {
    "frontguard",
    "frontguardac1",
    "frontguardac2",
    "frontguardac3",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_trench_dagger_guard(this_variant)

mod.owo_historical_blade(this_variant)

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_finger_guards = "owo_trench_dagger_finger_guard_01|owo_trench_dagger_finger_guard_02|owo_trench_dagger_finger_guard_03|owo_trench_dagger_finger_guard_04|owo_trench_dagger_finger_guard_05|owo_trench_dagger_finger_guard_06"
local _owo_trench_dagger_finger_guard_knuckles = "owo_trench_dagger_finger_guard_knuckles_01|owo_trench_dagger_finger_guard_knuckles_02|owo_trench_dagger_finger_guard_knuckles_03|owo_trench_dagger_finger_guard_knuckles_04"
local _owo_tactical_tanto_blades = "owo_historical_blade_tanto_01|owo_historical_blade_tanto_02|owo_historical_blade_tanto_03|owo_historical_blade_tanto_04|owo_historical_blade_tanto_05|owo_historical_blade_tanto_06"

local _mt_falchion_grips = "falchion_mt_grip_01|falchion_mt_grip_02|falchion_mt_grip_03|falchion_mt_grip_04|falchion_mt_grip_05"
local _mt_sabre_grips = "sabre_mt_grip_01|sabre_mt_grip_02|sabre_mt_grip_03|sabre_mt_grip_04|sabre_mt_grip_05"
local _mt_dclaw_grips = "combat_sword_mt_grip_01|combat_sword_mt_grip_02|combat_sword_mt_grip_03|combat_sword_mt_grip_04|combat_sword_mt_grip_05|combat_sword_mt_grip_06"
local _mt_combat_axe_grips = "axe_mt_grip_01|axe_mt_grip_02|axe_mt_grip_03|axe_mt_grip_04|axe_mt_grip_05|axe_mt_grip_06"
local _mt_tactical_axe_grips = "hatchet_mt_grip_01|hatchet_mt_grip_02|hatchet_mt_grip_03|hatchet_mt_grip_04|hatchet_mt_grip_05|hatchet_mt_grip_06"
local _mt_eviscerator_grips = "2h_chain_sword_mt_grip_01|2h_chain_sword_mt_grip_02|2h_chain_sword_mt_grip_03|2h_chain_sword_mt_grip_04"
local _mt_chain_sword_grips = "chain_sword_mt_grip_01|chain_sword_mt_grip_02|chain_sword_mt_grip_03|chain_sword_mt_grip_04|chain_sword_mt_grip_05|chain_sword_mt_grip_06|chain_sword_mt_grip_07|chain_sword_mt_grip_08"
local _mt_ogryn_grips = "ogrynbladehandle_01|ogrynbladehandle_02|ogrynbladehandle_03|ogrynbladehandle_04|ogrynbladehandle_05|ogrynbladehandle_06"
-- ########
-- For This Variant Only
-- ########

-- ############################################
-- Inject Fixes
-- ############################################
-- #################
-- HIDING HELPERS
-- By putting it up here, it ends up at the bottom of the list, so they will only be hidden if the fixes from above are not found
-- Because they match the main parts first, if there is no match it means the main part is not attached
-- #################
for _, slots_table in ipairs({table_of_mt_slots, table_of_syn_slots, table_of_owo_slots}) do
    for _, slot_name in pairs(slots_table) do
        mod.mt.inject_fixes(this_variant, {
            mod.hide_slot(slot_name, { mod.hide_slot_fixes[slot_name] }),
        })
    end
end

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################

-- #################
-- Custom Fixes
-- #################
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
    --  --------------------------------------------
    --  Knuckle Dusters
    --  --------------------------------------------
    {   dependencies =  { _mt_falchion_grips, _owo_trench_dagger_finger_guard_knuckles },
        frontguard =    { offset = true, position = vector3_box(0, 0.004, 0.076), rotation = vector3_box(10, 0, 0), scale = vector3_box(0.26, 0.2, 0.14 ), },
        frontguardac1 = { offset = true, position = vector3_box(0, 0.01, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.26, 0.2, 0.14 ), },
        frontguardac2 = { offset = true, position = vector3_box(0, 0.01, -0.012), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.26, 0.2, 0.14 ), },
        frontguardac3 = { offset = true, position = vector3_box(0, 0.006, -0.052), rotation = vector3_box(-10, 0, 0), scale = vector3_box(0.26, 0.2, 0.14 ), },
    },
    {   dependencies =  { _owo_trench_dagger_finger_guard_knuckles },
        frontguard =    { offset = true, position = vector3_box(0, 0.004, 0.064), rotation = vector3_box(10, 0, 0), scale = vector3_box(0.12, 0.16, 0.07 ), },
        frontguardac1 = { offset = true, position = vector3_box(0, 0.009, 0.042), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.12, 0.16, 0.07 ), },
        frontguardac2 = { offset = true, position = vector3_box(0, 0.008, 0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.12, 0.16, 0.07 ), },
        frontguardac3 = { offset = true, position = vector3_box(0, 0.004, -0.01), rotation = vector3_box(-10, 0, 0), scale = vector3_box(0.12, 0.16, 0.07 ), },
    },
    
    -- ######
    -- Blade: Historical Pack
    -- ######
    --  --------------------------------------------
    --  Trench Spike
    --  --------------------------------------------
    {   dependencies =  { _mt_falchion_grips, "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.014, 0.0), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.0, 1.75, 1.25 ), },
    },
    {   dependencies =  { _mt_sabre_grips, "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.008, 0.0), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.0, 1.35, 1.0 ), },
    },
    {   dependencies =  { _mt_dclaw_grips, "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.01, 0.026), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.0, 1.25, 1.0 ), },
    },
    {   dependencies =  { _mt_combat_axe_grips, "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.008, 0.076), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 2.65, 0.8 ), },
    },
    {   dependencies =  { _mt_tactical_axe_grips, "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.012, 0.032), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.8, 1.75, 0.8 ), },
    },
    {   dependencies =  { _mt_eviscerator_grips, "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.01, 0.034), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.85, 1.5, 0.85 ), },
    },
    {   dependencies =  { _mt_chain_sword_grips, "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.01, 0.0), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.85, 1.2, 0.85 ), },
    },
    {   dependencies =  { _mt_ogryn_grips, "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.028, 0.036), rotation = vector3_box(90, 0, 0), scale = vector3_box(2.0, 2.3, 2.15 ), },
    },
    {   dependencies =  { "owo_historical_blade_trench_spike" },
        body =          { offset = true, position = vector3_box(0, -0.01, 0.0), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.85, 1.0, 0.85 ), },
    },
    --  --------------------------------------------
    --  Gerber Mk II
    --  --------------------------------------------
    {   dependencies =  { _mt_falchion_grips, "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.15, 1.75, 1.5 ), },
    },
    {   dependencies =  { _mt_sabre_grips, "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.15, 1.35, 1.15 ), },
    },
    {   dependencies =  { _mt_dclaw_grips, "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, -0.008), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.15, 1.25, 1.15 ), },
    },
    {   dependencies =  { _mt_combat_axe_grips, "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.2), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1.75 ), },
    },
    {   dependencies =  { _mt_tactical_axe_grips, "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.16), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1.4 ), },
    },
    {   dependencies =  { _mt_eviscerator_grips, "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.146), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1 ), },
    },
    {   dependencies =  { _mt_chain_sword_grips, "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.094), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.2, 1 ), },
    },
    {   dependencies =  { _mt_ogryn_grips, "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.158), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.0, 2.3, 1.5 ), },
    },
    {   dependencies =  { "owo_historical_blade_02" },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1 ), },
    },
    {   dependencies =  { "owo_historical_blade_02" },
        bladeshroud =   { offset = true, position = vector3_box(0.0, 0.001, 0.042), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.04, 0.2, 0.30 ), },
    },
    --  --------------------------------------------
    --  Karambit
    --  --------------------------------------------
    {   dependencies =  { "owo_historical_blade_karambit" },
        body =          { offset = true, position = vector3_box(0, -0.0, -0.014), rotation = vector3_box(9, 0, 180), scale = vector3_box(0.4, 0.188, 0.14 ), },
        bladeshroud =   { offset = true, position = vector3_box(0, -0.0246, 0.049), rotation = vector3_box(-48, 0, 180), scale = vector3_box(0.18, 0.1, 0.078 ), },
    },
    {   dependencies =  { "owo_historical_blade_karambit_f" },
        body =          { offset = true, position = vector3_box(0, -0.0, -0.014), rotation = vector3_box(-9, 0, 0), scale = vector3_box(0.4, 0.188, 0.14 ), },
        bladeshroud =   { offset = true, position = vector3_box(0, 0.0246, 0.049), rotation = vector3_box(48, 0, 0), scale = vector3_box(0.18, 0.1, 0.078 ), },
    },
    {   dependencies =  { "owo_historical_blade_karambit_s" },
        body =          { offset = true, position = vector3_box(0, 0.003, -0.005), rotation = vector3_box(9, 0, 180), scale = vector3_box(0.4, 0.13, 0.084 ), },
        bladeshroud =   { offset = true, position = vector3_box(0, -0.0157, 0.03), rotation = vector3_box(-48, 0, 180), scale = vector3_box(0.18, 0.054, 0.058 ), },
    },
    {   dependencies =  { "owo_historical_blade_karambit_sf" },
        body =          { offset = true, position = vector3_box(0, 0.003, -0.005), rotation = vector3_box(-9, 0, 0), scale = vector3_box(0.4, 0.13, 0.084 ), },
        bladeshroud =   { offset = true, position = vector3_box(0, 0.017, 0.031), rotation = vector3_box(48, 0, 0), scale = vector3_box(0.18, 0.054, 0.058 ), },
    },
    --  --------------------------------------------
    --  Tactical Tanto
    --  --------------------------------------------
    {   dependencies =  { _owo_tactical_tanto_blades },
        body =          { offset = true, position = vector3_box(0, -0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.35, 0.35, 0.19 ), },
    },
    --  --------------------------------------------
    --  Tactical Box Cutter
    --  --------------------------------------------
    {   dependencies =  { "owo_historical_blade_box_cutter" },
        body =          { offset = true, position = vector3_box(0, -0.0, -0.094), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.15, 0.35, 0.19 ), },
    },
})
