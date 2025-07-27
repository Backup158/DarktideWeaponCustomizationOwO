local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "stubrevolver_p1_m1" -- Quickdraw Stub Revolver
local _hide_slot_table = mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/common/hide_slot")

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
-- ###############
-- MT Plugin Compatibility
-- ###############
local table_of_mt_slots = {
    "sightac2", 
    "sightac3", 
}
for _, slot_name in ipairs(table_of_mt_slots) do
    mod.create_default_attachment(this_variant, slot_name)
end

-- ###############
-- Syn's Edits Compatibility
-- ###############
local table_of_syn_slots = {
    "sightac4",
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
    "muzzle_2", -- MT and Syn didn't add this to revolver yet
    "muzzle_3",
    
    "barrelshroud", -- MT and Syn didn't add this to revolver yet

    "sightac1",
    "sightac5",
    "sightac6",
    "sightac7",
    "sight_secondary",
    "sight_secondary_ac1",
    "sight_secondary_ac2",
    "sight_group_indicator",
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_revolver_shotgun_barrel(this_variant, "barrel")
mod.owo_grip_laser(this_variant, "flashlight")
mod.owo_suppressor(this_variant, "muzzle")

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)

mod.owo_holosight(this_variant, "sight", "rail")
mod.owo_prismatic_sight(this_variant, "sight", "rail")

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_sight_2s = "owo_alt_viewmodel_01|owo_alt_viewmodel_02|owo_alt_viewmodel_03|owo_alt_viewmodel_04|owo_alt_viewmodel_05|owo_alt_viewmodel_06|owo_reticle_helper_invisible"
local _owo_no_magnifier_eotech_sights = "owo_holosight_01_01|owo_holosight_01_01ss"
local _owo_magnifier_aligned_eotech_sights = "owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_02ss_z1|owo_holosight_01_02ss_z2"
local _owo_magnifier_side_eotech_sights = "owo_holosight_01_03|owo_holosight_01_03ss"
local _owo_magnifier_eotech_sights = _owo_magnifier_aligned_eotech_sights.."|".._owo_magnifier_side_eotech_sights
local _owo_short_eotech_sights = "owo_holosight_01_01ss|owo_holosight_01_02ss_z1|owo_holosight_01_02ss_z2|owo_holosight_01_03ss"
local _owo_all_eotech_sights = _owo_no_magnifier_eotech_sights.."|".._owo_magnifier_eotech_sights
local _owo_no_magnifier_vortex_sights = "owo_holosight_02_01|owo_holosight_02_01ss"
local _owo_magnifier_aligned_vortex_sights = "owo_holosight_02_02_z1|owo_holosight_02_02_z2|owo_holosight_02_02ss_z1|owo_holosight_02_02ss_z2"
local _owo_magnifier_side_vortex_sights = "owo_holosight_02_03|owo_holosight_02_03ss"
local _owo_magnifier_vortex_sights = _owo_magnifier_aligned_vortex_sights.."|".._owo_magnifier_side_vortex_sights
local _owo_all_vortex_sights = _owo_no_magnifier_vortex_sights.."|".._owo_magnifier_vortex_sights
local _owo_forwards_acog_sights = "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_backwards_acog_sights = "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top"
local _owo_rmr_acog_sights = "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_all_acog_sights = _owo_forwards_acog_sights.."|".._owo_backwards_acog_sights
local _owo_all_susat_sights = "owo_susat_01|owo_susat_01_z1|owo_susat_01_ps|owo_susat_02|owo_susat_02_z1|owo_susat_02_top"
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"
-- ########
-- For This Variant Only
-- ########
local _owo_short_shotgun_barrels_for_muzzles = "owo_revolver_shotgun_barrel_base_04b|owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08"
local _owo_long_shotgun_barrels_for_muzzles = "owo_revolver_shotgun_barrel_base_04b_l|owo_revolver_shotgun_barrel_base_05_l|owo_revolver_shotgun_barrel_base_06_l|owo_revolver_shotgun_barrel_base_08_l"

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
mod.fixes_owo_holosight(this_variant)
mod.fixes_owo_prismatic_sight(this_variant)
mod.fixes_owo_suppressors(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
    -- Muzzle: Suppressors
    -- ######

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  --------------------------------------------
    --  EOTech
    --  --------------------------------------------
    --  Patch to hide alt viewmodel sights
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Sight Alignment
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_no_magnifier_eotech_sights },
        rail =              { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.02, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.65, 0.8), },
        sight =             { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.03, 0.021), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3),},
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0463), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies =      { "owo_sight_group_indicator_holosight_eotech", _owo_magnifier_eotech_sights },
        rail =              { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.02, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.65, 0.8), },
        sight =             { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.096, 0.021), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3),},
        sight_secondary =   { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104),},
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.046), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  --------------------------------------------
    --  Vortex Razor
    --  --------------------------------------------
    --  Patch for alt sights
    --      _owo_all_vortex_sights,
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.014), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Sight Alignment
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", "owo_sight_group_indicator_holosight_razor", _owo_no_magnifier_vortex_sights },
        rail =              { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.02, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.65, 0.8), },
        sight =             { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.058, 0.021), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0363), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      Magnifier moves sight forwards
    {   dependencies =      { "owo_sight_group_indicator_holosight_razor", _owo_magnifier_vortex_sights },
        rail =              { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.02, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.65, 0.8), },
        sight =             { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.11, 0.021), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_secondary =   { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.04, 0.021), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0363), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

    -- ######
    -- Sight: Prismatic Sights (Telescopic)
    -- ######
    --  --------------------------------------------
    --  Trijicon ACOG
    --  --------------------------------------------
    --  Patch for alt vms
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_sight_2s, },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.046, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Aiming with RMR on ACOG
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.127), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.127), rotation = vector3_box(0, 0, 0), },
    },
    --  Sight Position
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_forwards_acog_sights },
        rail =              { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.02, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.65, 0.8), },
        sight =             { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.102, 0.038), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),},
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0528), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_acog", 
            _owo_backwards_acog_sights },
        rail =              { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.02, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.65, 0.8), },
        sight =             { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.074, 0.038), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),},
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0528), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    -- ---------------------------------------------
    --  SUSAT
    --  --------------------------------------------
    --  Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.112), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.112), rotation = vector3_box(0, 0, 0), },
    },
    {   dependencies =      { --"owo_sight_group_indicator_prismatic_sight_susat", 
            _owo_all_susat_sights, },
        rail =              { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.02, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.65, 0.8), },
        sight =             { offset = false, parent = "barrel", parent_node = 9, position = vector3_box(0, 0.008, 0.060), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),},
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.042), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },

    -- #####
    -- Barrel: Shotgun Extension
    -- offset false/true. doesn't change pos either way. does change scale.
    -- barrel_04 is bigger than the others. 04b is that one chopped down to fit the others (the woke left have gone after our shotgun barrels)
    -- #####
    --  Normal Barrels
    {   dependencies = { "owo_revolver_shotgun_barrel_base_04|owo_revolver_shotgun_barrel_base_05|owo_revolver_shotgun_barrel_base_06|owo_revolver_shotgun_barrel_base_08", },
        -- trigger move is used in wc/weapon_attachments/WEAPON.lua
        -- monkey see monkey do :3
        barrel =        { offset = true, mesh_move = false, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), rotation_node = 2,
            trigger_move = {"muzzle", "rail", "sight", "barrelshroud", "muzzle_2"}, animation_wait_detach = {"muzzle_2", "barrelshroud", "sight", "rail", "muzzle"},
        },
        -- Offset is false so it can be reparented to barrel on load, which lets it follow the animation
        barrelshroud =  { parent = "barrel", parent_node = 9, offset = false, mesh_move = false, 
            position = vector3_box(0, 0.026, -0.022), scale = vector3_box(0.722, 0.460, 0.815),
        },
        emblem_left =   { position = vector3_box(-0.021, 0.159, .0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(.65, -.65, .65)},
        emblem_right =  { position = vector3_box(0.021, 0.159, .0315), rotation = vector3_box(0, 0, 0), scale = vector3_box(.65, .65, .65)},
    },
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04b", },
        barrel =        { offset = true, mesh_move = false, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), rotation_node = 2, trigger_move = {"muzzle", "rail", "sight", "barrelshroud", "muzzle_2"}, animation_wait_detach = {"muzzle_2", "barrelshroud", "sight", "rail", "muzzle"}, },
        barrelshroud =  { parent = "barrel", parent_node = 9, offset = false, mesh_move = false, 
            position = vector3_box(0, 0.026, -0.022), scale = vector3_box(0.722, 0.330, 0.815),
        },
        emblem_left =   { position = vector3_box(-0.021, 0.159, .0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(.65, -.65, .65)},
        emblem_right =  { position = vector3_box(0.021, 0.159, .0315), rotation = vector3_box(0, 0, 0), scale = vector3_box(.65, .65, .65)},
    },
    --      Muzzle handling
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04",
        },
        muzzle = {parent = "barrel", parent_node = 9, parent = "barrel", offset = false,
            position = vector3_box(0, 0.328, -0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),},
    },
    {   dependencies = { _owo_short_shotgun_barrels_for_muzzles, },
        muzzle = {parent = "barrel", parent_node = 9, parent = "barrel", offset = false,
            position = vector3_box(0, 0.236, -0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),},
    },
   --  Long barrels
   {    dependencies = { "owo_revolver_shotgun_barrel_base_04_l|owo_revolver_shotgun_barrel_base_05_l|owo_revolver_shotgun_barrel_base_06_l|owo_revolver_shotgun_barrel_base_08_l", },
        barrel = { offset = true, mesh_move = false, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), rotation_node = 2, trigger_move = {"muzzle", "rail", "sight", "barrelshroud", "muzzle_2"}, animation_wait_detach = {"muzzle_2", "barrelshroud", "sight", "rail", "muzzle"}, },
        barrelshroud = {parent = "barrel", parent_node = 9, offset = false, mesh_move = false, 
            position = vector3_box(0, 0.026, -0.022), scale = vector3_box(0.722, 0.660, 0.815),
        },
        emblem_left = {position = vector3_box(-0.021, 0.159, .0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(.65, -.65, .65)},
        emblem_right = {position = vector3_box(0.021, 0.159, .0315), rotation = vector3_box(0, 0, 0), scale = vector3_box(.65, .65, .65)},
    },
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04b_l", },
        barrel = { offset = true, mesh_move = false, position = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), rotation_node = 2, trigger_move = {"muzzle", "rail", "sight", "barrelshroud", "muzzle_2"}, animation_wait_detach = {"muzzle_2", "barrelshroud", "sight", "rail", "muzzle"},
        },
        barrelshroud = {parent = "barrel", parent_node = 9, offset = false, mesh_move = false, 
            position = vector3_box(0, 0.026, -0.022), scale = vector3_box(0.722, 0.46, 0.815),
        },
        emblem_left = {position = vector3_box(-0.021, 0.159, .0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(.65, -.65, .65)},
        emblem_right = {position = vector3_box(0.021, 0.159, .0315), rotation = vector3_box(0, 0, 0), scale = vector3_box(.65, .65, .65)},
    },
    --      Muzzles
    {   dependencies = {"owo_revolver_shotgun_barrel_base_04_l", },
        muzzle = {parent = "barrel", parent_node = 9, parent = "barrel", offset = false,
            position = vector3_box(0, 0.476, -0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
        },
    },
    {   dependencies = { _owo_long_shotgun_barrels_for_muzzles, },
        muzzle = {parent = "barrel", parent_node = 9, parent = "barrel", offset = false,
            position = vector3_box(0, 0.346, -0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1),
        },
    },

    -- #####
    -- Flashlight: Grip Laser
    -- #####
    {   dependencies = {"owo_grip_laser_01|owo_grip_laser_02"},
        flashlight = {position = vector3_box(-0.01, 0.044, -0.016), scale = vector3_box(0.345, 0.3, 0.285)},
    },
})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)