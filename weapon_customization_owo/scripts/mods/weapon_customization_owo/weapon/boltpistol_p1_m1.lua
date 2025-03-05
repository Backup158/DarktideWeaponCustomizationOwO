local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "boltpistol_p1_m1" -- Bolt Pistol

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
if not mod.syn then
    mod.wc.attachment[this_variant].barrelshroud = {}
end
mod.wc.attachment[this_variant].sightac1 = {}
--[[ Covered by MT Plugin 
mod.wc.attachment[this_variant].sightac2 = {}
mod.wc.attachment[this_variant].sightac3 = {}
mod.wc.attachment[this_variant].sightac4 = {}
]]
mod.wc.attachment[this_variant].sightac5 = {}
mod.wc.attachment[this_variant].sightac6 = {}
mod.wc.attachment[this_variant].sightac7 = {}
mod.wc.attachment[this_variant].sight_secondary = {}
mod.wc.attachment[this_variant].sight_secondary_ac1 = {}
mod.wc.attachment[this_variant].sight_secondary_ac2 = {}
--[[ Covered by other plugins
-- MT
mod.wc.attachment[this_variant]. sight_2 = {}
mod.wc.attachment[this_variant].carryhandle = {}
mod.wc.attachment[this_variant].gripac = {}
mod.wc.attachment[this_variant].stockac = {}
mod.wc.attachment[this_variant].stockac2 = {}
mod.wc.attachment[this_variant].sightac = {}
mod.wc.attachment[this_variant].sightac2 = {}
mod.wc.attachment[this_variant].sightac3 = {}
mod.wc.attachment[this_variant].sightac4 = {}
mod.wc.attachment[this_variant].accessory = {}
-- Syn
mod.wc.attachment[this_variant].synservoskull = {}
mod.wc.attachment[this_variant].barrelshroud = {}
mod.wc.attachment[this_variant].barrelshroudac = {}
mod.wc.attachment[this_variant].barrelshroudac2 = {}
mod.wc.attachment[this_variant].receiver_special_07 = {}
mod.wc.attachment[this_variant].receiver_special_08 = {}
mod.wc.attachment[this_variant].receiver_special_09 = {}
mod.wc.attachment[this_variant].receiver_special_10 = {}
mod.wc.attachment[this_variant].receiver_special_11 = {}
mod.wc.attachment[this_variant].receiver_special_12 = {}
]]


-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_bistol_shotgun_barrel_short(this_variant)

mod.owo_alt_viewmodel(this_variant)

mod.owo_holosight(this_variant, "sight")
mod.owo_telescopic_sight(this_variant, "sight")

mod.owo_tactical_stock(this_variant, "stock")

-- ############################################
-- Inject Fixes
-- ############################################
mod.mt.inject_fixes(this_variant, {
    -- ######
	-- Sight_2: Alt Viewmodels
	-- ######
    --  Doom
    {   dependencies = { "owo_alt_viewmodel_01" },
        scope_offset =      { position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0)},
        no_scope_offset =      { position = vector3_box(0, 0.2, -0.25), rotation = vector3_box(7, 0, 0)},
    },
    {   dependencies = { "owo_alt_viewmodel_02" },
        scope_offset =      { position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0)},
        no_scope_offset =      { position = vector3_box(0, -0.2, -0.05), rotation = vector3_box(2, 0, 0)},
    },
    {   dependencies = { "owo_alt_viewmodel_03" },
        scope_offset =      { position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0)},
        no_scope_offset =      { position = vector3_box(0, -0.2, -0.15), rotation = vector3_box(7, 0, 0)},
    },
    -- CS:S
    {   dependencies = { "owo_alt_viewmodel_04" },
        scope_offset =      { position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0)},
        no_scope_offset =      { position = vector3_box(0.45, 0.35, -0.15), rotation = vector3_box(0, 0, 0)},
    },
    -- Hipfire
    {   dependencies = { "owo_alt_viewmodel_05" },
        scope_offset =      { position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0)},
        no_scope_offset =      { position = vector3_box(0.25, 0.35, -0.15), rotation = vector3_box(0, 0, 0)},
    },

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  -------------------------------------------
    --  EOTech
    --  -------------------------------------------
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_03" },
        sightac1 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac2 =       { offset = true, position  = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =       { offset = true, position  = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
        rail =           { offset = true, position  = vector3_box(0, 0.012, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.65, 0.8) },
    },
    {   dependencies = { "owo_holosight_01_01",
		},
        sight =             { offset = true, parent = "rail", position  = vector3_box(0, 0, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    {   dependencies = { "owo_holosight_01_02_z1|owo_holosight_01_02_z2|owo_holosight_01_03",
        },
        --sight =             { offset = true, position  = vector3_box(0, 0.05, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight =             { offset = true, position  = vector3_box(0, 0.03, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position  = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} }, -- 6 hides housing for sight 1, 5 hides sights 2 and 3
    
        sight_secondary =         { offset = true, position  = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    {   dependencies = { "owo_holosight_01_02_z1|owo_holosight_01_02_z2" },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0, -0.154, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0, -0.0162, 0.034), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
   
        lens =              {offset = false, parent = "sight", position = vector3_box(0, -0.048, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 1}},
	    lens_2 =            {offset = false, parent = "sight", position = vector3_box(0, -0.12, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 2}},
    },
    {   dependencies = { "owo_holosight_01_03" },
        sight_secondary_ac1 =      { offset = true, position  = vector3_box(0.042, -0.154, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position  = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    
        lens =              {offset = false, parent = "sight", position = vector3_box(0.042, -0.048, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 1}},
	    lens_2 =            {offset = false, parent = "sight", position = vector3_box(0.042, -0.12, 0.01), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 2}},
    },
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    {   dependencies = { "owo_holosight_01_01|owo_holosight_01_02_z1|owo_holosight_01_02_z2"},
        scope_offset =      { position = vector3_box(0.002, 0, -0.0345), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    {   dependencies = { "owo_holosight_01_03"},
        scope_offset =      { position = vector3_box(0.002, 0, -0.0345), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },

	-- ######
    -- Sight: Telescopic Sights
    -- ######
    --  -------------------------------------------
    --  Trijicon ACOG
    --  -------------------------------------------
    --  ACOG only
    --      Sight and Sight 2 Adjustment
    --          For whatever fucking reason, the recon body won't apply position transformations to sight_2
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top" },
        sight =             { offset = true, position  = vector3_box(0, 0.02, 0.128), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },

        lens =              { offset = true, parent = "sight", position = vector3_box(0, 0.072, 0.0325), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =            { offset = true, parent = "sight", position = vector3_box(0, -0.053, 0.0355), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =           { offset = true, position  = vector3_box(0, 0.0, 0.004), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight =             { offset = true, position  = vector3_box(0, 0.07, 0.128), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },

        lens =              { offset = true, parent = "sight", position = vector3_box(0, 0.122, 0.0325), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =            { offset = true, parent = "sight", position = vector3_box(0, -0.003, 0.0355), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        sight_2 =           { offset = true, position  = vector3_box(0, 0.0, 0.004), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      ACOG Parts
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sightac1 =       { offset = true, position  = vector3_box(0, -0.022, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        sightac2 =       { offset = true, position  = vector3_box(0, -0.132, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sightac3 =       { offset = true, position  = vector3_box(0, 0.064, 0.032), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Base
        sightac4 =       { offset = true, position  = vector3_box(0, -0.018, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Knobs
        sightac5 =       { offset = true, position  = vector3_box(0, -0.01, 0.061), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.45, 0.68, 0.24) },
        sightac6 =       { offset = true, position  = vector3_box(0.028, -0.014, 0.034), rotation = vector3_box(-180, -90, -180), scale = vector3_box(0.45, 0.45, 0.12) },
        -- Cable
        sightac7 =       { offset = true, position  = vector3_box(0, -0.018, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.515, 0.195, 0.525) },
    },
    --  ACOG with RMR on top
    {   dependencies = { "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight_secondary =       { offset = true, position  = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  SUSAT
    --  -------------------------------------------
    {   dependencies = { "owo_susat_01|owo_susat_01_ps|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight =             { offset = true, position  = vector3_box(0, -0.03, 0.16), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        -- cylinder thing
        sightac1 =       { offset = true, position  = vector3_box(0, 0.096, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.6, 1.47, 1.27), data = {sightac1 = 1} },
        -- Rear
        sightac2 =       { offset = true, position  = vector3_box(0, -0.0081, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        sightac3 =       { offset = true, position  = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        -- Base
        sightac4 =       { offset = true, position  = vector3_box(0, 0.07, -0.036), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Reticle
        sightac5 =       { offset = true, position  = vector3_box(-0.0028, 0.066, -0.026), rotation = vector3_box(0, 6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        sightac6 =       { offset = true, position  = vector3_box(0.0028, 0.066, -0.026), rotation = vector3_box(0, -6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        sightac7 =       { offset = true, position  = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0) },

        lens =              {offset = false, parent = "sightac7", position = vector3_box(0, 0.096, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.3, 0.85), data = {lens = 1}},
	    lens_2 =            {offset = false, parent = "sightac7", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    --  SUSAT with red dot
    {   dependencies = { "owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
            sight_secondary =     { offset = true, position  = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    --      Aiming with main sight
    --          Backwards
    {   dependencies = { "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1" },
        scope_offset =      { position = vector3_box(0.003, 0.04, -0.028), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    {   dependencies = { "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1" },
        scope_offset =      { position = vector3_box(0.003, 0.04, -0.028), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    {   dependencies = { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1" },
        scope_offset =      { position = vector3_box(0.002, 0.04, -0.026), rotation = vector3_box(0, 0, 0), lense_transparency = true},
    },
    --      Aiming with RMR on ACOG
    {   dependencies = { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        scope_offset =      { position = vector3_box(0.006, 0.001, -0.103), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },
    --      Aiming with RMR on SUSAT
    {   dependencies = { "owo_susat_02_top" },
        scope_offset =      { position = vector3_box(0.006, 0.04, -0.09), rotation = vector3_box(0, 0, 0), lense_transparency = false},
    },
    
    -- #####
    -- Barrel: Short Shotgun
    -- #####
    {   dependencies = {"owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08|owo_bistol_sg_base_04_s|owo_bistol_sg_base_05_s|owo_bistol_sg_base_06_s|owo_bistol_sg_base_08_s"},
        muzzle = {offset = true, position = vector3_box(0, 0.47, 0), scale = vector3_box(1, 1, 1) },
    },
    {   --dependencies = {"owo_bistol_sg_base_01|owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08|owo_bistol_sg_base_09"},
        dependencies = {"owo_bistol_sg_base_04|owo_bistol_sg_base_05|owo_bistol_sg_base_06|owo_bistol_sg_base_08"},
        barrel = {offset = true,  position = vector3_box(0, 0.162, 0.012), scale = vector3_box(1, 1, 1) },
        barrelshroud = {offset = true,  position = vector3_box(0, -0.144, 0.002), scale = vector3_box(1.328, 0.33, 0.9) },
    },
    -- Super Shorty
    {   dependencies = {"owo_bistol_sg_base_04_s|owo_bistol_sg_base_05_s|owo_bistol_sg_base_06_s|owo_bistol_sg_base_08_s"},
        barrel = {offset = true,  position = vector3_box(0, 0.098, 0.012), scale = vector3_box(1, 1, 1) },
        barrelshroud = {offset = true,  position = vector3_box(0, -0.082, 0.002), scale = vector3_box(1.328, 0.178, 0.9) },
    },

    -- ######
	-- Stock: TACTICAL STOCK
	-- ######
    --  Skeletal
    {   dependencies = { "owo_tactical_stock_s_01" },
        stock =      { position = vector3_box(0.0, 0.11, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.95, 1 ) },
    },
    --  Folded
    {   dependencies = { "owo_tactical_stock_01|owo_tactical_stock_02|owo_tactical_stock_03|owo_tactical_stock_04|owo_tactical_stock_05|owo_tactical_stock_06|owo_tactical_stock_07|owo_tactical_stock_08" },
        stock =     { position = vector3_box(0.056, -0.122, 0.044), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =   { position = vector3_box(-0.0037, -0.092, 0.043), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.5, 0.3 )}
    },
    --  Folded (Left)
    {   dependencies = { "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
        stock =     { position = vector3_box(-0.05, -0.122, 0.044), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =   { position = vector3_box(0.0023, -0.092, 0.043), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 0.5, 0.3 )}
    },
    --  Floating/Natural
    {   dependencies = { "owo_tactical_stock_f_01|owo_tactical_stock_f_02" },
        stock =      { position = vector3_box(-0.018, -0.137, 0.046), rotation = vector3_box(0, 0, -176), scale = vector3_box(1, 1.0, 1 ) },
    },
    {   dependencies = { "owo_tactical_stock_f_03u" },
        stock =      { position = vector3_box(0.0, -0.142, 0.046), rotation = vector3_box(174, 0, 0), scale = vector3_box(3.76, 1.42, 1 ) },
    },

    -- ###############
    -- HIDING UNUSED PARTS
    -- ###############
    {   dependencies = {"owo_bistol_shotgun_barrel_short_04|owo_bistol_shotgun_barrel_short_05|owo_bistol_shotgun_barrel_short_06|owo_bistol_shotgun_barrel_short_08"},
        barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Sights
    {   dependencies = {"owo_holosight_helper_01|owo_pu_scope_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01"},
        sightac1 = { hide_mesh = {{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_02|owo_pu_scope_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01"},
        sightac2 = { hide_mesh = {{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_03|owo_pu_scope_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01"},
        sightac3 = { hide_mesh = {{"sightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = {"owo_holosight_helper_04|owo_pu_scope_helper_04|owo_acog_sight_helper_04"},
        sightac4 = { hide_mesh = {{"sightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac5_01|owo_pu_scope_helper_05|owo_acog_sight_helper_05|owo_susat_ac5_01"},
        sightac5 = { hide_mesh = {{"sightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac6_01|owo_pu_scope_helper_06|owo_acog_sight_helper_06|owo_susat_ac6_01"},
        sightac6 = { hide_mesh = {{"sightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_acog_sight_helper_07|owo_susat_ac7_01"},
        sightac7 = { hide_mesh = {{"sightac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_01|owo_acog_sight_sight_secondary_01|owo_pu_scope_riser_01"},
        sight_secondary = { hide_mesh = {{"sight_secondary", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_01"},
        sight_secondary_ac1 = { hide_mesh = {{"sight_secondary_ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},  
    },
    {   dependencies = { "owo_holosight_sight_secondary_helper_02"},
        sight_secondary_ac2 = { hide_mesh = {{"sight_secondary_ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Stocks
    {   dependencies = {"owo_tactical_stockac_01"},
        stockac = { hide_mesh = {{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})
