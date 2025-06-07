local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "autogun_p1_m1" -- Braced/Infantry/Vigilant Autoguns

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
local table_with_slots_to_initialize = {
    "muzzle_2", -- MT and Syn didn't add this to autoguns yet
    "muzzle_3",
    "muzzle_4",
    "muzzle_5",
    "muzzle_6",
}
if not mod.syn then -- these slots already exist in Syn's plugin
    mod.wc.attachment[this_variant].barrelshroud = {}
    mod.wc.attachment[this_variant].barrelshroudac = {}
    mod.wc.attachment[this_variant].barrelshroudac2 = {}
    mod.wc.attachment[this_variant].barrelshroudac3 = {}
    mod.wc.attachment[this_variant].barrelshroudac4 = {}
    mod.wc.attachment[this_variant].barrelshroudac5 = {}
    mod.wc.attachment[this_variant].barrelshroudac6 = {}
end
for _, slot_name in table_with_slots_to_initialize do
    mod.initialize_custom_slot_for_weapon(this_variant, slot_name)
end
--mod.wc.attachment[this_variant].muzzle_2 = {} -- MT and Syn didn't add this to autoguns yet
--mod.wc.attachment[this_variant].muzzle_3 = {}
--[[]]
mod.wc.attachment[this_variant].muzzle_4 = {}
mod.wc.attachment[this_variant].muzzle_5 = {}
mod.wc.attachment[this_variant].muzzle_6 = {}

mod.wc.attachment[this_variant].foregripac1 = {}
mod.wc.attachment[this_variant].foregripac2 = {}
mod.wc.attachment[this_variant].foregripac3 = {}

mod.wc.attachment[this_variant].bayonetac1 = {}
mod.wc.attachment[this_variant].bayonetac2 = {}
mod.wc.attachment[this_variant].bayonetac3 = {}
mod.wc.attachment[this_variant].bayonetac4 = {}
mod.wc.attachment[this_variant].bayonetac5 = {}
mod.wc.attachment[this_variant].bayonetac6 = {}
mod.wc.attachment[this_variant].bayonetac7 = {}

mod.wc.attachment[this_variant].owo_magac1 = {}
mod.wc.attachment[this_variant].owo_magac2 = {}
mod.wc.attachment[this_variant].owo_magac3 = {}
mod.wc.attachment[this_variant].owo_magac4 = {}
mod.wc.attachment[this_variant].owo_magac5 = {}
mod.wc.attachment[this_variant].sightac1 = {}
-- Covered by MT Plugin 
-- mod.wc.attachment[this_variant].gripac = {}
-- mod.wc.attachment[this_variant].sightac2 = {}
-- mod.wc.attachment[this_variant].sightac3 = {}
-- mod.wc.attachment[this_variant].sightac4 = {}
mod.wc.attachment[this_variant].sightac5 = {}
mod.wc.attachment[this_variant].sightac6 = {}
mod.wc.attachment[this_variant].sightac7 = {}
mod.wc.attachment[this_variant].sight_secondary = {}
mod.wc.attachment[this_variant].sight_secondary_ac1 = {}
mod.wc.attachment[this_variant].sight_secondary_ac2 = {}
mod.wc.attachment[this_variant].receiverac1 = {}
mod.wc.attachment[this_variant].receiverac2 = {}

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_dreg_gunner_barrel(this_variant, "barrel")
mod.owo_m16_barrel(this_variant, "barrel")
mod.owo_wood_krieg(this_variant, "barrel")

mod.owo_dreg_gunner_bayonet(this_variant, "bayonet")
mod.owo_historical_bayonet(this_variant, "bayonet")
mod.owo_underbarrel_gl(this_variant, "bayonet")
mod.owo_underbarrel_shotgun(this_variant, "bayonet")

mod.owo_suppressor(this_variant)
mod.owo_condom(this_variant)
mod.owo_muzzle_brake(this_variant)

mod.owo_magazine_flat(this_variant, "magazine")
mod.owo_jungle_mag(this_variant, "magazine")
mod.owo_magazine_magpull(this_variant, "magazine")
--mod.owo_magazine_ak(this_variant)

mod.owo_reticle_helper(this_variant)
mod.owo_alt_viewmodel(this_variant)
mod.owo_m16_sight(this_variant, "sight")
mod.owo_kalashnikov_rear_sight(this_variant)
mod.owo_holographic_sight(this_variant, "sight")
mod.owo_telescopic_sight(this_variant, "sight")
mod.owo_pu_scope(this_variant, "sight")

mod.owo_helbore_mas49(this_variant, "receiver")

mod.owo_fin_grip(this_variant, "grip")

mod.owo_tactical_foregrip(this_variant, "foregrip")
mod.owo_heterosexual_foregrip(this_variant)

mod.owo_tactical_stock(this_variant, "stock")
mod.owo_kalash_stock(this_variant)

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_sight_2s = "owo_alt_viewmodel_01|owo_alt_viewmodel_02|owo_alt_viewmodel_03|owo_alt_viewmodel_04|owo_alt_viewmodel_05|owo_alt_viewmodel_06|owo_reticle_helper_invisible"
local _owo_no_magnifier_eotech_sights = "owo_holographic_sight_01_01|owo_holographic_sight_01_01ss"
local _owo_magnifier_aligned_eotech_sights = "owo_holographic_sight_01_02_z1|owo_holographic_sight_01_02_z2|owo_holographic_sight_01_02ss_z1|owo_holographic_sight_01_02ss_z2"
local _owo_magnifier_side_eotech_sights = "owo_holographic_sight_01_03|owo_holographic_sight_01_03ss"
local _owo_magnifier_eotech_sights = _owo_magnifier_aligned_eotech_sights.."|".._owo_magnifier_side_eotech_sights
local _owo_short_eotech_sights = "owo_holographic_sight_01_01ss|owo_holographic_sight_01_02ss_z1|owo_holographic_sight_01_02ss_z2|owo_holographic_sight_01_03ss"
local _owo_all_eotech_sights = _owo_no_magnifier_eotech_sights.."|".._owo_magnifier_eotech_sights
local _owo_no_magnifier_vortex_sights = "owo_holographic_sight_02_01|owo_holographic_sight_02_01ss"
local _owo_magnifier_aligned_vortex_sights = "owo_holographic_sight_02_02_z1|owo_holographic_sight_02_02_z2|owo_holographic_sight_02_02ss_z1|owo_holographic_sight_02_02ss_z2"
local _owo_magnifier_side_vortex_sights = "owo_holographic_sight_02_03|owo_holographic_sight_02_03ss"
local _owo_magnifier_vortex_sights = _owo_magnifier_aligned_vortex_sights.."|".._owo_magnifier_side_vortex_sights
local _owo_all_vortex_sights = _owo_no_magnifier_vortex_sights.."|".._owo_magnifier_vortex_sights
local _owo_forwards_acog_sights = "owo_acog_sight_01f|owo_acog_sight_01f_z1|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top"
local _owo_backwards_acog_sights = "owo_acog_sight_01|owo_acog_sight_01_z1|owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top"
local _owo_all_acog_sights = _owo_forwards_acog_sights.."|".._owo_backwards_acog_sights
local _owo_all_susat_sights = "owo_susat_01|owo_susat_01_z1|owo_susat_01_ps|owo_susat_02|owo_susat_02_z1|owo_susat_02_top"
local _owo_masterkey_bayonets = "owo_underbarrel_shotgun_01|owo_underbarrel_shotgun_01_01|owo_underbarrel_shotgun_01_02"
local _owo_all_suppressor_muzzles = "owo_suppressor_01|owo_suppressor_02|owo_suppressor_03|owo_suppressor_04|owo_suppressor_05"
local _m16_all_barrels = "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2|owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2|owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"
local _m16a1_01_barrels = "owo_m16_barrel_a1|owo_m16_barrel_t_a1|owo_m16_barrel_n_a1"
local _m16a1_02_barrels = "owo_m16_barrel_a1_02|owo_m16_barrel_t_a1_02|owo_m16_barrel_n_a1_02"
local _m16a2_barrels = "owo_m16_barrel_a2|owo_m16_barrel_t_a2|owo_m16_barrel_n_a2"
local _m16_normal_post_barrels = "owo_m16_barrel_a1|owo_m16_barrel_a1_02|owo_m16_barrel_a2"
local _m16_tall_post_barrels = "owo_m16_barrel_t_a1|owo_m16_barrel_t_a1_02|owo_m16_barrel_t_a2"
local _m16_no_post_barrels = "owo_m16_barrel_n_a1|owo_m16_barrel_n_a1_02|owo_m16_barrel_n_a2"

local _short_braced_autogun_mt_barrels = "bagun_barrel_01|bagun_barrel_05|bagun_barrel_06|bagun_barrel_07|bagun_barrel_08"
local _long_braced_autogun_mt_barrels = "bagun_barrel_03|bagun_barrel_04"
local _short_infantry_autogun_mt_barrels = "iagun_barrel_04"
local _medium_infantry_autogun_mt_barrels = "iagun_barrel_01|iagun_barrel_02|iagun_barrel_06"
local _long_infantry_autogun_mt_barrels = "iagun_barrel_03|iagun_barrel_05"
local _short_vigilant_autogun_mt_barrels = "hagun_barrel_02"
local _long_vigilant_autogun_mt_barrels = "hagun_barrel_01|hagun_barrel_03|hagun_barrel_04"
local _all_vigilant_autogun_mt_barrels = _short_vigilant_autogun_mt_barrels.."|".._long_vigilant_autogun_mt_barrels
local _short_infantry_lasgun_mt_barrels = "ilasgun_barrel_03"
local _long_infantry_lasgun_mt_barrels = "ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08"
local _mt_all_infantry_lasgun_barrels = _short_infantry_lasgun_mt_barrels.."|".._long_infantry_lasgun_mt_barrels
local _mt_laspistol_barrels = "lpistol_barrel_01|lpistol_barrel_02|lpistol_barrel_03|lpistol_barrel_04|lpistol_barrel_05|lpistol_barrel_06|lpistol_barrel_07"
local _medium_short_helbore_mt_barrels = "hlasgun_barrel_01|hlasgun_barrel_04|hlasgun_barrel_05|hlasgun_barrel_05b" -- Medium length, short bottom
local _medium_medium_helbore_mt_barrels = "hlasgun_barrel_03"
local _long_helbore_mt_barrels = "hlasgun_barrel_02"
local _all_helbore_mt_barrels = _medium_short_helbore_mt_barrels.."|".._medium_medium_helbore_mt_barrels.."|".._long_helbore_mt_barrels
local _mt_recon_lasgun_barrels = "rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05"
local _mt_autopistol_barrels = "apistol_barrel_01|apistol_barrel_02|apistol_barrel_03|apistol_barrel_04|apistol_barrel_05"
local _mt_twin_stubber_barrels = "stubber_barrel_01|stubber_barrel_02|stubber_barrel_03|stubber_barrel_04|stubber_barrel_05"
local _mt_single_stubber_barrels = "singlestubber_barrel_01|singlestubber_barrel_02|singlestubber_barrel_03"
local _mt_combat_shotgun_barrels = "shot_barrel_01|shot_barrel_02|shot_barrel_03|shot_barrel_04|shot_barrel_07|shot_barrel_08|shot_barrel_09"
local _mt_db_shotgun_barrels = "dbshot_barrel_01|dbshot_barrel_02|dbshot_barrel_03"
local _mt_plasma_barrels = "plas_barrel_01|plas_barrel_02|plas_barrel_03"
local _mt_flamer_barrels = "flamer_barrel_01|flamer_barrel_02|flamer_barrel_03|flamer_barrel_04|flamer_barrel_05|flamer_barrel_06"
local _mt_bolter_barrels = "bolter_barrel_01|bolter_barrel_02|bolter_barrel_03|bolter_barrel_04"
local _mt_backwards_bolter_barrels = "fbolter_barrel_01|fbolter_barrel_02|fbolter_barrel_03|fbolter_barrel_04"
local _mt_ripper_barrels = "ripper_barrel_01|ripper_barrel_02|ripper_barrel_03|ripper_barrel_04|ripper_barrel_05|ripper_barrel_06"

local _syn_m41a_barrels = "syn_m41a_barrel_01|syn_m41a_barrel_02|syn_m41a_barrel_03|syn_m41a_barrel_04|syn_m41a_barrel_05|syn_m41a_barrel_06|syn_m41a_barrel_07|syn_m41a_barrel_08"
local _syn_helbore_sniper_barrels = "helbore_sniper_barrel_01|helbore_sniper_barrel_02|helbore_sniper_barrel_03|helbore_sniper_barrel_04|helbore_sniper_barrel_05|helbore_sniper_barrel_05b"
local _syn_carry_sniper_barrels = "cleaver_sniper_barrel_01|cleaver_sniper_barrel_02|cleaver_sniper_barrel_04|cleaver_sniper_barrel_05|cleaver_sniper_barrel_06"
local _syn_all_sniper_barrels = _syn_helbore_sniper_barrels.."|".._syn_carry_sniper_barrels
local _syn_pulse_barrels = "SWSMPR_barrel_01|SWSMPR_barrel_02|SWSMPR_barrel_03|SWSMPR_barrel_06|SWSMPR_barrel_07|SWSMPR_barrel_08|SWSMPR_barrel_09|SWSMPR_barrel_10|SWSMPR_barrel_11|SWSMPR_barrel_12|SWSMPR_barrel_13"
local _syn_hellgun_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03|syn_hellgun_barrel_01|syn_hellgun_barrel_02"
local _syn_carbine_barrels = "syn_carbine_barrel_01|syn_carbine_barrel_02|syn_carbine_barrel_03|syn_carbine_barrel_04|syn_carbine_barrel_05"
local _syn_aquilon_barrels = "syn_aquilonbarrel_01|syn_aquilonbarrel_01a|syn_aquilonbarrel_02|syn_aquilonbarrel_02a"
local _syn_heavy_barrels = "syn_heavybarrel_01|syn_heavybarrel_02|syn_heavybarrel_03"
local _syn_thompson_barrels = "syn_thompson_barrel_01|syn_thompson_barrel_02"
local _syn_rotary_barrels = "rotary_barrel_01|rotary_barrel_01a|rotary_barrel_01b|rotary_barrel_01c"
local _syn_q3_barrels = "q3_machinegun_barrel_01|q3_machinegun_barrel_01a"
local _syn_canis_barrels = "syn_vescanis_barrel_01|syn_vescanis_barrel_02"
local _syn_gauss_barrels = "syn_gk8gauss_barrel_01|syn_gk8gauss_barrel_02"
-- ########
-- For This Variant Only
-- ########
local _infantry_autogun_receivers = "receiver_01|receiver_10"
local _braced_autogun_receivers = "receiver_03|receiver_06|receiver_07|receiver_08"
local _vigilant_autogun_receivers = "receiver_02|receiver_04|receiver_05|receiver_09|receiver_11"

local _super_short_braced_autogun_all_barrels = "barrel_08|bagun_barrel_02"
local _short_braced_autogun_barrels = "barrel_07|barrel_13|barrel_14|barrel_18|barrel_19|barrel_20"
local _short_braced_autogun_all_barrels = _short_braced_autogun_barrels.."|".._short_braced_autogun_mt_barrels
local _long_braced_autogun_barrels = "barrel_09|barrel_10"
local _long_braced_autogun_all_barrels = _long_braced_autogun_barrels.."|".._long_braced_autogun_mt_barrels
local _short_infantry_autogun_barrels = "barrel_04"
local _short_infantry_autogun_all_barrels = _short_infantry_autogun_barrels.."|".._short_infantry_autogun_mt_barrels
local _medium_infantry_autogun_barrels = "barrel_01|barrel_02|barrel_06|barrel_21"
local _medium_infantry_autogun_all_barrels = _medium_infantry_autogun_barrels.."|".._medium_infantry_autogun_mt_barrels
local _long_infantry_autogun_barrels = "barrel_03|barrel_05"
local _long_infantry_autogun_all_barrels = _long_infantry_autogun_barrels.."|".._long_infantry_autogun_mt_barrels
local _short_vigilant_autogun_barrels = "barrel_12|hagun_barrel_02"
local _long_vigilant_autogun_barrels = "barrel_11|barrel_15|barrel_16|barrel_22"
local _long_vigilant_autogun_all_barrels = _long_vigilant_autogun_barrels.."|".._long_vigilant_autogun_mt_barrels
local _all_default_vigilant_autogun_barrels = _short_vigilant_autogun_barrels.."|".._long_vigilant_autogun_barrels
local _all_all_vigilant_autogun_barrels = _all_default_vigilant_autogun_barrels.."|".._all_vigilant_autogun_mt_barrels

-- ############################################
-- Inject Fixes
-- ############################################
-- #################
-- HIDING HELPERS
-- By putting it up here, it ends up at the bottom of the list, so they will only be hidden if the fixes from above are not found
-- Because they match the main parts first, if there is no match it means the main part is not attached
-- #################
mod.mt.inject_fixes(this_variant, {
    -- Muzzles
    {	dependencies =  { "owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03|owo_suppressor_helper_04|owo_condom_helper_m2_01|owo_muzzle_brake_helper_01_01"},
        muzzle_2 = {hide_mesh = {{"muzzle_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_2 = "owo_muzzle_2_default"}, },
    },
    {	dependencies =  { "owo_muzzle_brake_helper_02_01|owo_suppressor_helper_02_01|owo_suppressor_helper_02_02|owo_suppressor_helper_02_03|owo_suppressor_helper_02_04"},
        muzzle_3 = {hide_mesh = {{"muzzle_3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_3 = "owo_muzzle_3_default"}, },
    },
    {	dependencies =  { "owo_muzzle_brake_helper_03_01"},
        muzzle_4 = {hide_mesh = {{"muzzle_4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_4 = "owo_muzzle_4_default"}, },
    },
    {	dependencies =  { "owo_muzzle_brake_helper_04_01"},
        muzzle_5 = {hide_mesh = {{"muzzle_5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_5 = "owo_muzzle_5_default"}, },
    },
    {	dependencies =  { "owo_muzzle_brake_helper_05_01"},
        muzzle_6 = {hide_mesh = {{"muzzle_6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = { muzzle_6 = "owo_muzzle_6_default"}, },
    },
    -- Bayonet
    {	dependencies =  { "owo_dreg_bayonet_rear_01|owo_historical_bayonet_m7_helper_01|owo_historical_bayonet_seitengewehr_helper_01|owo_historical_bayonet_epee_helper_01|owo_m203_helper_01|owo_gp25_helper_01|owo_underbarrel_shotgun_helper_01|owo_underbarrel_shotgun_helper_01_02"},
        bayonetac1 = {hide_mesh = {     {"bayonetac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_historical_bayonet_m7_helper_02|owo_historical_bayonet_seitengewehr_helper_02|owo_historical_bayonet_epee_helper_02|owo_m203_helper_02|owo_gp25_helper_02|owo_underbarrel_shotgun_helper_02|owo_underbarrel_shotgun_helper_02_02"},
        bayonetac2 = {hide_mesh = {     {"bayonetac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_m203_helper_03|owo_gp25_helper_03|owo_underbarrel_shotgun_helper_03|owo_underbarrel_shotgun_helper_03_02"},
        bayonetac3 = {hide_mesh = {     {"bayonetac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_m203_helper_04|owo_gp25_helper_04|owo_underbarrel_shotgun_helper_04"},
        bayonetac4 = {hide_mesh = {     {"bayonetac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_gp25_helper_05|owo_underbarrel_shotgun_helper_05|owo_underbarrel_shotgun_helper_05_02"},
        bayonetac5 = {hide_mesh = {     {"bayonetac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_underbarrel_shotgun_helper_06|owo_underbarrel_shotgun_helper_06_02"},
        bayonetac6 = {hide_mesh = {     {"bayonetac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    {	dependencies =  { "owo_underbarrel_shotgun_helper_07"},
        bayonetac7 = {hide_mesh = {     {"bayonetac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
    },
    -- Barrels
    {   dependencies =  { "owo_dreg_shroud_01|owo_m16_barrelshroud_a1|owo_m16_barrelshroud_a1_02|owo_m16_barrelshroud_a2|owo_wood_krieg_ac1_01"},
        barrelshroud = {hide_mesh = {{"barrelshroud", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_dreg_shroudac2_01|owo_m16_barrelshroudac2_01"},
        barrelshroudac2 = {hide_mesh = {{"barrelshroudac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies =  { "owo_dreg_shroudac3_01|owo_m16_barrelshroudac3_01"},
        barrelshroudac3 = {hide_mesh = {{"barrelshroudac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies =  { "owo_dreg_shroudac2_01|owo_m16_barrelshroudac4_01"},
        barrelshroudac4 = {hide_mesh = {{"barrelshroudac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies =  { "owo_m16_barrelshroudac5_01"},
        barrelshroudac5 = {hide_mesh = {{"barrelshroudac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    {   dependencies =  { "owo_m16_barrelshroudac6_01"},
        barrelshroudac6 = {hide_mesh = {{"barrelshroudac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}}, 
    },
    -- Foregrips
    {   dependencies =  { "owo_tactical_foregrip_ac1_01"},
        foregripac1 = {hide_mesh = {{"foregripac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_tactical_foregrip_ac2_01"},
        foregripac2 = {hide_mesh = {{"foregripac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_tactical_foregrip_ac3_01"},
        foregripac3 = {hide_mesh = {{"foregripac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Receivers
	{	dependencies =  { "owo_bolt_helbore_bolt_01|owo_helbore_mas49_ass"},
		receiverac1 = {hide_mesh = {     {"receiverac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
	{	dependencies =  { "owo_bolt_helbore_bolt_02|owo_helbore_mas49_knob"},
		receiverac2 = {hide_mesh = {     {"receiverac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} }},
	},
    -- Magazines
    {   dependencies = { "owo_jungle_mag_helper_01|owo_jungle_mag_helper_02|owo_jungle_mag_helper_03|owo_jungle_mag_helper_04|owo_magazine_magpull_helper_01|owo_magazine_ak_ac1_01"},
        owo_magac1 = { hide_mesh = {{"owo_magac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_jungle_mag_connector_f_01|owo_magazine_magpull_helper_02"},
        owo_magac2 = { hide_mesh = {{"owo_magac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_jungle_mag_connector_b_01"},
        owo_magac3 = { hide_mesh = {{"owo_magac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_magazine_magpull_helper_03"},
        owo_magac3 = { hide_mesh = {{"owo_magac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}, automatic_equip = {magazine = "owo_magazine_magpull_helper_03_empty"}},
    },
    {   dependencies = { "owo_jungle_mag_connector_l_01"},
        owo_magac4 = { hide_mesh = {{"owo_magac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies = { "owo_jungle_mag_connector_r_01"},
        owo_magac5 = { hide_mesh = {{"owo_magac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    -- Grips
    {   dependencies =  { "owo_fin_grip2_01"},
        gripac = { hide_mesh = {{"gripac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Sights
    {   dependencies =  { "owo_holographic_sight_helper_01|owo_rear_sight_ac1_01|owo_rear_sight_ac1_02|owo_rear_sight_ac1_02|owo_rear_sight_ac1_03|owo_kalashnikov_rear_sight_ac1_01|owo_kalashnikov_rear_sight_ac1_02|owo_pu_scope_helper_01|owo_m16_sight_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01"},
        sightac1 = { hide_mesh = {{"sightac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_holographic_sight_helper_02|owo_rear_sight_ac2_01|owo_rear_sight_ac2_02|owo_rear_sight_ac2_03|owo_rear_sight_ac2_04|owo_kalashnikov_rear_sight_ac2_01|owo_kalashnikov_rear_sight_ac2_02|owo_pu_scope_helper_02|owo_m16_sight_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01"},
        sightac2 = { hide_mesh = {{"sightac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_holographic_sight_helper_03|owo_holographic_sight_helper_03_02|owo_rear_sight_ac3_01|owo_kalashnikov_rear_sight_ac3_01|owo_pu_scope_helper_03|owo_m16_sight_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01"},
        sightac3 = { hide_mesh = {{"sightac3", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies =  { "owo_holographic_sight_helper_04|owo_rear_sight_ac4_01|owo_kalashnikov_rear_sight_ac4_01|owo_pu_scope_helper_04|owo_m16_sight_helper_04|owo_acog_sight_helper_04"},
        sightac4 = { hide_mesh = {{"sightac4", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac5_01|owo_kalashnikov_rear_sight_ac5_01|owo_pu_scope_helper_05|owo_m16_sight_helper_05|owo_acog_sight_helper_05|owo_susat_ac5_01"},
        sightac5 = { hide_mesh = {{"sightac5", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_rear_sight_ac6_01|owo_kalashnikov_rear_sight_ac6_01|owo_pu_scope_helper_06|owo_m16_sight_helper_06|owo_acog_sight_helper_06|owo_susat_ac5_01"},
        sightac6 = { hide_mesh = {{"sightac6", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_m16_sight_helper_07|owo_acog_sight_helper_07|owo_susat_ac7_01|owo_pu_scope_helper_07"},
        sightac7 = { hide_mesh = {{"sightac7", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holographic_sight_sight_secondary_01|owo_acog_sight_sight_secondary_01|owo_pu_scope_riser_01"},
        sight_secondary = { hide_mesh = {{"sight_secondary", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    {   dependencies = { "owo_holographic_sight_sight_secondary_helper_01"},
        sight_secondary_ac1 = { hide_mesh = {{"sight_secondary_ac1", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},  
    },
    {   dependencies = { "owo_holographic_sight_sight_secondary_helper_02"},
        sight_secondary_ac2 = { hide_mesh = {{"sight_secondary_ac2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
    -- Stocks
    {   dependencies =  { "owo_tactical_stockac_01"},
        stockac = { hide_mesh = {{"stockac", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
    },
})

-- #################
-- Universal Fixes
-- These are shared among multiple weapons but are the same each time
-- Up here so the custom fixes are ahead of the generic cases
-- #################
mod.fixes_owo_suppressors(this_variant)
mod.fixes_owo_muzzle_brake(this_variant)
mod.fixes_owo_condom(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- ######
	-- Receiver: BOLT ACTION HELBORE
	-- ######
	{	dependencies =  { "owo_bolt_helbore_01|owo_bolt_helbore_02|owo_bolt_helbore_03|owo_bolt_helbore_04|owo_bolt_helbore_05"},
		receiver =      { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
		receiverac1 =   { offset = true, position = vector3_box(0.025, -0.026, 0.1), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.55, 0.45, 0.55 ) },
		receiverac2 =   { offset = true, position = vector3_box(0, 0.024, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.6, 0.5, 1 ) },
	},
    -- ######
	-- Receiver: HELBORE MAS-49
	-- ######
	{	dependencies =  { "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05"},
        receiver =      { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { "owo_helbore_mas49_01_s"},
        receiver =      { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.69, 1, 1 ) },
    },
    {	dependencies =  { "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s"},
        receiverac1 =   { offset = true, position = vector3_box(0.031, -0.016, 0.022), rotation = vector3_box(-90, 0, 90), scale = vector3_box(0.518, 0.573, 0.545 ) },
        receiverac2 =   { offset = true, position = vector3_box(0.046, 0.18, 0.096), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.755, 0.755, 0.15 ) },
        stock =         { offset = true, position = vector3_box(0, -0.042, 0.008), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    --  Patch for MT Helbore grip
    {	dependencies =  { "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s",
            "hlasgun_grip_01|hlasgun_grip_02|hlasgun_grip_03"
        },
        grip = { offset = true, position = vector3_box(0, -0.006, 0.008), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },

    -- ######
	-- Magazine: FLAT
	-- ######
	{	dependencies =  { "owo_lasgun_magazine_flat_01"},
		magazine =      { offset = true, scale = vector3_box(1, 1, 0.5 ) },
	},
	{	dependencies =  { "owo_autogun_magazine_flat_03"},
		magazine =      { offset = true, scale = vector3_box(1, 1, 0.6 ) },
	},

    -- ######
	-- Magazine: AK
	-- ######
    --[[
    {   dependencies =  { "owo_magazine_ak_01|owo_magazine_ak_02|owo_magazine_ak_03"},
        magazine = { offset = true, position = vector3_box(0, 0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ), trigger_move = {"owo_magac1"}, animation_wait_detach = {"owo_magac1"}, },
    },
    {	dependencies =  { "owo_magazine_ak_01"},
        owo_magac1 = { offset = false, position = vector3_box(0, 0.0, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ), animation_wait_attach = {"magazine"}, },
    },
	{	dependencies =  { "owo_magazine_ak_02"},
        owo_magac1 = { offset = false, position = vector3_box(0, 0.05, -0.04), rotation = vector3_box(18, 0, 0), scale = vector3_box(1, 1, 0.7 ), animation_wait_attach = {"magazine"}, },
    },
    {	dependencies =  { "owo_magazine_ak_03"},
        owo_magac1 = { offset = false, position = vector3_box(0, -0.002, -0.111), rotation = vector3_box(18, 0, 0), scale = vector3_box(1, 1, 1.15 ), animation_wait_attach = {"magazine"}, },
    },
    ]] 

    -- ######
    -- DREG GUNNER BARREL
    -- ######
    -- Iag
    --  meshauto_01 is the MT Autogun Custom
    {   dependencies =  { "owo_dreg_barrel_01", _infantry_autogun_receivers.."|meshauto_01", },
        barrel =        { offset = true,    position = vector3_box(0, 0, -0.014),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud =  { offset = true,    position = vector3_box(0, 0, -0.014),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.24, 0.7, 0.24) }, 
    },
    -- Brautos
    {   dependencies =  { "owo_dreg_barrel_01", _braced_autogun_receivers, },
        barrel =        { offset = true,    position = vector3_box(0, 0, 0.025),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud =  { offset = true,    position = vector3_box(0, 0, 0.025),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.24, 0.7, 0.24) }, 
    },
    -- Headhunters
    {   dependencies =  { "owo_dreg_barrel_01", _vigilant_autogun_receivers, },
        barrel =        { offset = true,    position = vector3_box(0, 0, -0.012),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.27, 0.63, 0.27) },
        barrelshroud =  { offset = true,    position = vector3_box(0, 0, -0.012),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.24, 0.7, 0.24)}, 
    },
    --  Dreg Gunner Helpers
	{   dependencies =  { "owo_dreg_barrel_01" },
        -- barrel: inner barrel
        -- barrelshroud: outer barrel with front post
        -- bayonet lug
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0, -0.115),       rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 2.45, 0.8) }, 
        -- hand grip to extend receiver
        barrelshroudac3 =   { offset = true,    position = vector3_box(0, 0, -0.215),       rotation = vector3_box(0, 0, 0),    scale = vector3_box(2, 1.5, 2.5) }, 
        -- hand grip (top)
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.153, 0.115),    rotation = vector3_box(180, 0, 0),  scale = vector3_box(2.4, 0.969, 2.85) }, 
        flashlight =        { offset = true,     position = vector3_box(0.096, 0.17, 0.0),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.7, 2.7, 2.7) },
        muzzle =            { offset = true,     position = vector3_box(0, 1, 0),            rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.2, 2.2, 2.2) },
    },
    -- Helbore bayonets
	{   dependencies =  { "owo_dreg_barrel_01", "autogun_bayonet_01|autogun_bayonet_02" },
        bayonet = { offset = true,   position = vector3_box(0, 0.699, -0.095),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.5, 1.7, 3.0) },
    },

    -- ######
    -- Foregrip: TACTICAL FOREGRIP
    -- ######
    -- skeletal shotgun
    {   dependencies =  { "owo_tactical_foregrip_01"},
        foregrip = { offset = true,   position = vector3_box(0, 0.605, -0.045),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.2, 0.8, 1.0) },
    },
    -- skeletal shotgun (slant)
    {   dependencies =  { "owo_tactical_foregrip_02"},
        foregrip = { offset = true,   position = vector3_box(0, 0.545, -0.035),   rotation = vector3_box(15, 0, 0),    scale = vector3_box(1.2, 0.6, 0.7) },
    },
    -- skeletal brauto (slant)
    {   dependencies =  { "owo_tactical_foregrip_03"},
        foregrip = { offset = true,   position = vector3_box(0, 0.555, -0.02),   rotation = vector3_box(10, 0, 0),    scale = vector3_box(0.8, 1.0, 0.8) },
    },
    -- magpul afg triple threat
    {   dependencies =  { "owo_tactical_foregrip_04"},
        foregrip = { offset = true,   position = vector3_box(-0.0, 0.34, 0.022),   rotation = vector3_box(-67, 0, -180),    scale = vector3_box(0.85, 0.37, 0.74) },
        foregripac1 = { offset = true,   position = vector3_box(0.002, 0.415, -0.102),   rotation = vector3_box(0, 90, -40),    scale = vector3_box(0.5, 0.45, 0.2) },
        foregripac2 = { offset = true,   position = vector3_box(-0.002, 0.415, -0.102),   rotation = vector3_box(-40, -90, 0),    scale = vector3_box(0.5, 0.45, 0.2) },
        foregripac3 = { offset = true,   position = vector3_box(0, 0.47, -0.060),   rotation = vector3_box(0, 0, 180),    scale = vector3_box(0.5, 0.45, 0.2) },
    },

    -- ######
    -- Foregrip: HETEROSEXUAL FOREGRIP
    -- ######
    --  Ogryn handles
    {   dependencies =  { "owo_heterosexual_foregrip_01|owo_heterosexual_foregrip_02|owo_heterosexual_foregrip_03|owo_heterosexual_foregrip_04|owo_heterosexual_foregrip_05|owo_heterosexual_foregrip_06|owo_heterosexual_foregrip_07|owo_heterosexual_foregrip_08"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.3, 0.3, 0.3) },
    },
    --  Dclaw
    {   dependencies =  { "owo_heterosexual_foregrip_09|owo_heterosexual_foregrip_10|owo_heterosexual_foregrip_11|owo_heterosexual_foregrip_12|owo_heterosexual_foregrip_13|owo_heterosexual_foregrip_14"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.6, 0.6, 0.45) },
    },
    --  Knife
    {   dependencies =  { "owo_heterosexual_foregrip_knife_01|owo_heterosexual_foregrip_knife_02|owo_heterosexual_foregrip_knife_03|owo_heterosexual_foregrip_knife_04|owo_heterosexual_foregrip_knife_05|owo_heterosexual_foregrip_knife_06"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_06_fat"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.041),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 1) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_01s|owo_heterosexual_foregrip_knife_02s|owo_heterosexual_foregrip_knife_03s|owo_heterosexual_foregrip_knife_04s|owo_heterosexual_foregrip_knife_05s|owo_heterosexual_foregrip_knife_06s"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 0.5) },
    },
    {   dependencies =  { "owo_heterosexual_foregrip_knife_06s_fat"},
        foregrip = { offset = true,   position = vector3_box(0, 0.325, -0.036),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1.5, 1, 0.5) },
    },
    --  Grip grips
    {   dependencies =  { "owo_heterosexual_foregrip_grip_01|owo_heterosexual_foregrip_grip_02|owo_heterosexual_foregrip_grip_03|owo_heterosexual_foregrip_grip_04|owo_heterosexual_foregrip_grip_05|owo_heterosexual_foregrip_grip_06|owo_heterosexual_foregrip_grip_07|owo_heterosexual_foregrip_grip_08|owo_heterosexual_foregrip_grip_09|owo_heterosexual_foregrip_grip_10|owo_heterosexual_foregrip_grip_11|owo_heterosexual_foregrip_grip_12|owo_heterosexual_foregrip_grip_13|owo_heterosexual_foregrip_grip_14|owo_heterosexual_foregrip_grip_15|owo_heterosexual_foregrip_grip_16|owo_heterosexual_foregrip_grip_17|owo_heterosexual_foregrip_grip_18|owo_heterosexual_foregrip_grip_19|owo_heterosexual_foregrip_grip_20|owo_heterosexual_foregrip_grip_21|owo_heterosexual_foregrip_grip_22|owo_heterosexual_foregrip_grip_23|owo_heterosexual_foregrip_grip_24|owo_heterosexual_foregrip_grip_25|owo_heterosexual_foregrip_grip_26|owo_heterosexual_foregrip_grip_27|owo_heterosexual_foregrip_grip_28|owo_heterosexual_foregrip_grip_29"},
        foregrip = { offset = true,   position = vector3_box(0, 0.375, 0.06),   rotation = vector3_box(30, 0, 0),    scale = vector3_box(1, 1, 1) },
    },

    -- ######
    -- Bayonet: DREG GUNNER BAYONET
    -- ######
    -- Patches
    {   dependencies =  { "owo_dreg_barrel_01", "owo_dreg_bayonet_01" },
        bayonet =       { offset = true,     position = vector3_box(0, 0.8, -0.18),  rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1, 1, 0.555) },
        bayonetac1 =    { offset = true,     position = vector3_box(0, 0.8, -0.222), rotation = vector3_box(90, 0, 0),   scale = vector3_box(1, 0.67, 0.115) },
    },
    -- Default
    {   dependencies =  { "owo_dreg_bayonet_01", },
        bayonet =       { offset = true,     position = vector3_box(0, 0.55, -0.055),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(0.35, 0.275, 0.35) },
        bayonetac1 =    { offset = true,     position = vector3_box(0, 0.55, -0.069),    rotation = vector3_box(90, 0, 0),   scale = vector3_box(0.35, 0.225, 0.075) },
    },
    
    -- ######
    -- Grip: FIN GRIP
    -- ######
    {   dependencies =  { "owo_fin_grip_01" },
        grip =   { offset = true,    position = vector3_box(0, 0, 0),            rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
        -- fin
        gripac = { offset = true,    position = vector3_box(0, -0.0715, 0.0195), rotation = vector3_box(145, 0, 0),  scale = vector3_box(0.35, 0.35, 0.165) },
    },

    -- ######
	-- Muzzle: SUPPRESSOR
    -- Autogun Exclusive parts
	-- ######
    --  Vigilant barrels
    {   dependencies =  { _owo_all_suppressor_muzzles, _all_all_vigilant_autogun_barrels },
        muzzle =        { offset = true,   position = vector3_box(0, -0.034, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },
    --  OwO Dreg Gunner
    {	dependencies =  { _owo_all_suppressor_muzzles, "owo_dreg_barrel_01" },
        muzzle =        { offset = true,   position = vector3_box(0, 0, 0),    rotation = vector3_box(0, 0, 0),    scale = vector3_box(2.8, 2.2, 2.8) },
    },

    -- ######
	-- Muzzle: CONDOM
	-- ######
    {   dependencies =  { _m16_all_barrels, "owo_condom_01" },
        muzzle =        { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.001, 1.0, 1.001 ) },
    },

    -- ######
	-- Muzzle: Muzzle Brake
	-- ######
    -- MT The long boys
    --  Long Helbores and Longlas
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _long_helbore_mt_barrels.."|longlasgun_barrel_01" },
        muzzle_6 =      { offset = true, position = vector3_box(0, 0.13, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- MT Lasgun Barrels (ALL)
    --  What a fucking mess
    --  Infantry, Helbore, Recon, Laspistol
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _mt_all_infantry_lasgun_barrels.."|".._all_helbore_mt_barrels.."|".._mt_recon_lasgun_barrels.."|".._mt_laspistol_barrels },
        muzzle_6 =      { offset = true, position = vector3_box(0, 0.06, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- MT Autopistol
    {	dependencies =  { "owo_muzzle_brake_01|owo_muzzle_brake_02|owo_muzzle_brake_03", _mt_autopistol_barrels },
        muzzle_6 =      { offset = true, position = vector3_box(0, -0.02, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 0.5, 1.0 ) },
    },
    -- Rest are in universal fixes

    -- ######
	-- Magazine: Jungle Mags
	-- ######
    -- Straight Mags
    --  Second mag on the left
    {   dependencies =  { "owo_jungle_mag_01|owo_jungle_mag_02|owo_jungle_mag_03|owo_jungle_mag_01_up|owo_jungle_mag_02_up|owo_jungle_mag_03_up"},
        magazine =      { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        -- front
        owo_magac2 =    { offset = true,    position = vector3_box(-0.03, 0.11, -0.15),     rotation = vector3_box(90, 0, 90),      scale = vector3_box(1, 1.74, 0.37) },
        -- back
        owo_magac3 =    { offset = true,    position = vector3_box(-0.03, 0., -0.15),       rotation = vector3_box(-90, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- left
        owo_magac4 =    { offset = true,    position = vector3_box(-0.094, 0.056, -0.15),   rotation = vector3_box(90, 90, 90),     scale = vector3_box(1, 1.532, 0.37) },
        -- right
        owo_magac5 =    { offset = true,    position = vector3_box(0.03, 0.056, -0.15),     rotation = vector3_box(-90, -90, 90),   scale = vector3_box(1, 1.532, 0.37) },
    },
    --       v^
    {   dependencies =  { "owo_jungle_mag_01|owo_jungle_mag_02|owo_jungle_mag_03"},
        owo_magac1 =    { offset = true,    position = vector3_box(-0.065, 0.106, -0.27),   rotation = vector3_box(180, 0, 0),      scale = vector3_box(1, 1, 1) },
    },
    --      ^^
    {   dependencies =  { "owo_jungle_mag_01_up|owo_jungle_mag_02_up|owo_jungle_mag_03_up"},
        owo_magac1 =    { offset = true,    position = vector3_box(-0.065, 0.0, -0.08),   rotation = vector3_box(0, 0, 0),      scale = vector3_box(1, 1, 1) },
    },
    --  Second mag on the right
    {   dependencies =  { "owo_jungle_mag_01_flip|owo_jungle_mag_02_flip|owo_jungle_mag_03_flip|owo_jungle_mag_01_up_flip|owo_jungle_mag_02_up_flip|owo_jungle_mag_03_up_flip"},
        magazine =      { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        owo_magac2 =    { offset = true,    position = vector3_box(0.034, 0.11, -0.15),     rotation = vector3_box(90, 0, 90),      scale = vector3_box(1, 1.74, 0.37) },
        owo_magac3 =    { offset = true,    position = vector3_box(0.034, 0., -0.15),       rotation = vector3_box(-90, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owo_magac4 =    { offset = true,    position = vector3_box(-0.028, 0.056, -0.15),   rotation = vector3_box(90, 90, 90),     scale = vector3_box(1, 1.532, 0.37) },
        owo_magac5 =    { offset = true,    position = vector3_box(0.095, 0.056, -0.15),    rotation = vector3_box(-90, -90, 90),   scale = vector3_box(1, 1.532, 0.37) },
    },
    --      ^v
    {   dependencies =  { "owo_jungle_mag_01_flip|owo_jungle_mag_02_flip|owo_jungle_mag_03_flip"},
        owo_magac1 =    { offset = true,    position = vector3_box(0.065, 0.106, -0.27),    rotation = vector3_box(180, 0, 0),      scale = vector3_box(1, 1, 1) },
    },
    --      ^^
    {   dependencies =  { "owo_jungle_mag_01_up_flip|owo_jungle_mag_02_up_flip|owo_jungle_mag_03_up_flip"},
        owo_magac1 =    { offset = true,    position = vector3_box(0.061, 0.0, -0.08),    rotation = vector3_box(0, 0, 0),      scale = vector3_box(1, 1, 1) },
    },
    -- Curved Mag
    --  second mag on left
    {   dependencies =  { "owo_jungle_mag_04|owo_jungle_mag_04_up"},
        magazine =      { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        -- front
        owo_magac2 =    { offset = true,    position = vector3_box(-0.032, 0.117, -0.149),  rotation = vector3_box(108, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- back
        owo_magac3 =    { offset = true,    position = vector3_box(-0.032, 0.016, -0.196),  rotation = vector3_box(-67, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        -- left
        owo_magac4 =    { offset = true,    position = vector3_box(-0.094, 0.0713, -0.171), rotation = vector3_box(120, 90, 90),    scale = vector3_box(1, 1.532, 0.37) },
        -- right
        owo_magac5 =    { offset = true,    position = vector3_box(0.03, 0.0647, -0.170),   rotation = vector3_box(45, -90, -165),  scale = vector3_box(1, 1.532, 0.37) },
    },
    --      v^
    {   dependencies =  { "owo_jungle_mag_04"},
        owo_magac1 =    { offset = true,    position = vector3_box(-0.065, 0.153, -0.309),  rotation = vector3_box(-170, 0, 0),     scale = vector3_box(1, 1, 1) },
    },
    --      ^^
    {   dependencies =  { "owo_jungle_mag_04_up"},
        owo_magac1 =    { offset = true,    position = vector3_box(-0.065, -0.007, -0.011),  rotation = vector3_box(18, 0, 0),     scale = vector3_box(1, 1, 1) },
    },
    --  second mag on right
    {   dependencies =  { "owo_jungle_mag_04_flip"},
        magazine =      { offset = true,    position = vector3_box(0, 0, 0),                rotation = vector3_box(0, 0, 0),        scale = vector3_box(1, 1, 1) },
        owo_magac2 =    { offset = true,    position = vector3_box(0.034, 0.117, -0.149),   rotation = vector3_box(108, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owo_magac3 =    { offset = true,    position = vector3_box(0.034, 0.016, -0.196),   rotation = vector3_box(-67, 0, 90),     scale = vector3_box(1, 1.74, 0.37) },
        owo_magac4 =    { offset = true,    position = vector3_box(-0.028, 0.0713, -0.171), rotation = vector3_box(120, 90, 90),    scale = vector3_box(1, 1.532, 0.37) },
        owo_magac5 =    { offset = true,    position = vector3_box(0.095, 0.0647, -0.170),  rotation = vector3_box(45, -90, -165),  scale = vector3_box(1, 1.532, 0.37) },
    },
    --      ^v
    {   dependencies =  { "owo_jungle_mag_04_flip"},
        owo_magac1 =    { offset = true,    position = vector3_box(0.065, 0.153, -0.309),   rotation = vector3_box(-170, 0, 0),     scale = vector3_box(1, 1, 1) },
    },
    --      ^^
    {   dependencies =  { "owo_jungle_mag_04_up_flip"},
        owo_magac1 =    { offset = true,    position = vector3_box(0.065, -0.007, -0.011),  rotation = vector3_box(18, 0, 0),     scale = vector3_box(1, 1, 1) },
    },

    -- ######
	-- Magazine: Mag Pull
    --  Position transforms decided to not work
    --  Good thing there's a parent node near the bottom (IT'S THE FINAL BULLET IN THE MAG LMFAO)
    --      So the magpull moves up while you shoot 
	-- ######
    {   dependencies =  { "owo_magazine_magpull_01|owo_magazine_magpull_02|owo_magazine_magpull_03|owo_magazine_magpull_04"},
        magazine =      { offset = true,    
            position = vector3_box(0.0, 0.0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0),
            trigger_move = {"owo_magac1", "owo_magac2", "owo_magac3"}, animation_wait_detach = {"owo_magac3", "owo_magac2", "owo_magac1"},
        },
    },
    -- First helper. These need to be explicitly parented to a specific node. 2 is almost at the end
    --  Straight Mags
    --      Short
    {   dependencies =  { "owo_magazine_magpull_01"},
        owo_magac1 =    { offset = false, parent_node = 2,
            position = vector3_box(0.0, 0.056, -0.180), rotation = vector3_box(90, 0, 90), scale = vector3_box(1.0, 0.44, 0.64), 
            animation_wait_attach = {"magazine"},
        },
    },
    --      Long
    {   dependencies =  { "owo_magazine_magpull_02"},
        owo_magac1 =    { offset = false, parent_node = 2,
            position = vector3_box(0.0, 0.056, -0.180), rotation = vector3_box(90, 0, 90), scale = vector3_box(1.0, 0.44, 0.64), 
        },
    },
    --  The slanted bottom that looks like the 20 round M16 mags
    {   dependencies =  { "owo_magazine_magpull_03"},
        owo_magac1 =    { offset = false, parent_node = 2,
            position = vector3_box(0.034, 0.056, -0.17), rotation = vector3_box(104, 0, 90), scale = vector3_box(1.0, 0.44, 0.69),
        },
    },
    --  Curved Mag
    {   dependencies =  { "owo_magazine_magpull_04"},
        owo_magac1 =    { offset = false, parent_node = 6,
            position = vector3_box(-0.028, 0, 0), rotation = vector3_box(0, 3, 0), scale = vector3_box(1.0, 0.44, 0.64),
         },
    },
    --  All Mags
    {   dependencies =  { "owo_magazine_magpull_01|owo_magazine_magpull_02|owo_magazine_magpull_03|owo_magazine_magpull_04"},
        owo_magac2 =    { offset = true,    position = vector3_box(0.0, 0.0, 0.0),   rotation = vector3_box(180, 0, 0),     scale = vector3_box(1.0, 1.0, 1.0) },
    },
    --  Loop 
    {   dependencies =  { "owo_magazine_magpull_01|owo_magazine_magpull_02|owo_magazine_magpull_03"},
        owo_magac3 =    { offset = true,    position = vector3_box(0.0, -0.05, -0.02),   rotation = vector3_box(0, -90, 90),     scale = vector3_box(2.2, 1.27, 1.1) },
    },
    {   dependencies =  { "owo_magazine_magpull_04"},
        owo_magac3 =    { offset = true,    position = vector3_box(0.0, -0.05, -0.02),   rotation = vector3_box(0, -90, 90),     scale = vector3_box(2.2, 1.27, 2.1) },
    },

    -- ######
	-- Barrel: M16
	-- ######
    --  -------------------------------------------
    --  Brautos
    --  -------------------------------------------
    {   dependencies =      { _m16_all_barrels, _braced_autogun_receivers, },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0.03),       rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.082, -0.02), scale = vector3_box(0.5, 0.5, 0.5)},
    },
    {   dependencies =      { _m16a1_01_barrels, _braced_autogun_receivers, },
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.066),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.47, 2.748, 1.63) },
        barrelshroudac3 =   { offset = true,    position = vector3_box(0, 0.589, -0.024),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.884, 1.45, 0.5) },
    },
    {   dependencies =      { _m16a1_02_barrels, _braced_autogun_receivers, },
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.064),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.9, 2.388, 1.07) },
    },
    {   dependencies =      { _m16a2_barrels, _braced_autogun_receivers, },
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.305, 0.064),    rotation = vector3_box(-90, 0, 0),  scale = vector3_box(2.188, 2.388, 1.5) },
    },
    --  Front Posts
    {   dependencies =      { _m16_normal_post_barrels, _braced_autogun_receivers, },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.072),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.27, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.642, 0.126),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.128),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.128),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    {   dependencies =      { _m16_tall_post_barrels, _braced_autogun_receivers, },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.106),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.488, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.64, 0.158),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.160),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.160),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    --  -------------------------------------------
    --  Headhunters (Vigilants)
    --  -------------------------------------------
    {   dependencies =      { _m16_all_barrels, _vigilant_autogun_receivers, },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, -0.02),          rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0.00, -0.01, -0.032), scale = vector3_box(1, 1, 1)},
    },
    {   dependencies =      { _m16a1_01_barrels, _vigilant_autogun_receivers, },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true, position = vector3_box(0, 0.393, 0.056), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.47, 2.388, 1.67) },
        barrelshroudac3 =   { offset = true, position = vector3_box(0, 0.685, -0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.884, 1.45, 0.5) },
    },
    {   dependencies =      { _m16a1_02_barrels, _vigilant_autogun_receivers, },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.375, 0.054),    rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.9, 2.388, 1.07) },
    },
    {   dependencies =      { _m16a2_barrels, _vigilant_autogun_receivers, },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.395, 0.054),    rotation = vector3_box(-90, 0, 0), scale = vector3_box(2.188, 2.388, 1.5) },
    },
    -- Front Posts
    {   dependencies =      { _m16_normal_post_barrels, _vigilant_autogun_receivers, },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.072),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.27, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.642, 0.126),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.128),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.128),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    {   dependencies =      { _m16_tall_post_barrels, _vigilant_autogun_receivers, },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.106),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.488, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.64, 0.158),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.160),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.160),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    --  -------------------------------------------
    --  Infantry Autoguns and others
    --  -------------------------------------------
    --  Barrels
    {   dependencies =      { _m16_all_barrels, },
        barrel =            { offset = true,    position = vector3_box(0, 0.3, 0),          rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        trinket_hook =      { offset = true,    position = vector3_box(0, 0.082, -0.02), scale = vector3_box(0.5, 0.5, 0.5)},
    },
    --      A1 1 barrel is the only one with a sloped grip at the bottom
    {   dependencies =      { _m16a1_01_barrels, },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.066),     rotation = vector3_box(-90, 0, 0),  scale = vector3_box(1.47, 2.748, 1.63) },
        barrelshroudac3 =   { offset = true,    position = vector3_box(0, 0.667, -0.024),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(0.884, 1.45, 0.5) },
    },
    --      A1 2 Barrel is the single knife grip
    {   dependencies =      { _m16a1_02_barrels, },
        flashlight =        { offset = false,   position = vector3_box(0.028, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.9, 2.388, 1.07) },
    },
    {   dependencies =      { _m16a2_barrels, },
        flashlight =        { offset = false,   position = vector3_box(0.036, 0.406, 0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        barrelshroud =      { offset = true,    position = vector3_box(0, 0.397, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(2.188, 2.388, 1.5) },
    },
    --  Front Posts
    {   dependencies =      { _m16_normal_post_barrels, },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.092),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.27, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.642, 0.146),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.148),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.148),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    {   dependencies =      { _m16_tall_post_barrels, },
        barrelshroudac2 =   { offset = true,    position = vector3_box(0, 0.74, 0.096),    rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.26, 0.329, 0.47) },
        barrelshroudac4 =   { offset = true,    position = vector3_box(0, 0.64, 0.152),    rotation = vector3_box(0, 0, 180), scale = vector3_box(0.020, 0.085, 0.1) },
        barrelshroudac5 =   { offset = true,    position = vector3_box(0.003, 0.642, 0.154),    rotation = vector3_box(0, 0, 90), scale = vector3_box(2.36, 0.03, 0.022) },
        barrelshroudac6 =   { offset = true,    position = vector3_box(-0.003, 0.642, 0.154),    rotation = vector3_box(0, 0, -90), scale = vector3_box(2.36, 0.03, 0.022) },
    },
    --  -------------------------------------------
    --  All
    --  -------------------------------------------
    -- Muzzle Alignment
    {   dependencies =      { _m16_all_barrels, },
        muzzle =            { offset = true,    position = vector3_box(0, 0.11, 0),         rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },

    -- ######
	-- Barrel: WOODEN HELBORE
	-- ######
	{	dependencies =  { "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03",
        },
        barrel = { offset = true, position = vector3_box(0, 0, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        barrelshroud = { offset = true, position = vector3_box(0, 0.19, -0.001), rotation = vector3_box(90, 0, 180), scale = vector3_box(0.78, 0.6, 1.188 ) },
    },
    -- Regular Helbore bayonets (barrel parent)
    {   dependencies =  { "owo_wood_krieg_01",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = { offset = true,   position = vector3_box(0, 0.504, -0.03),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },
    -- 	these barrels are shorter
    {   dependencies =  { "owo_wood_krieg_02|owo_wood_krieg_03",
            "autogun_bayonet_01|autogun_bayonet_02"
        },
        bayonet = { offset = true,   position = vector3_box(0, 0.428, -0.04),   rotation = vector3_box(0, 0, 0),    scale = vector3_box(1, 1, 1) },
    },

    -- ######
	-- Sight: M16 Sights
	-- ######
    {	dependencies =  { "owo_m16_sight_01|owo_m16_sight_02",
            _vigilant_autogun_receivers,
        },
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.00015, -0.0273), rotation = vector3_box(0, 0, 0)},
        scope_offset =      { offset = true, position = vector3_box(0, -0.00015, -0.0273), rotation = vector3_box(0, 0, 0)},
        sight =      { offset = true, position = vector3_box(0, -0.038, 0.024), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.745, 0.714, 0.758 ) },
        sightac1 =    { offset = true, position = vector3_box(0.005, 0.247, 0.098), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.03, 0.804, 0.104 ) },
        sightac2 =    { offset = true, position = vector3_box(-0.005, 0.247, 0.098), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.03, 0.804, 0.104 ) },
    },
    {	dependencies =  { "owo_m16_sight_01|owo_m16_sight_02"},
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.00015, -0.0223), rotation = vector3_box(0, 0, 0)},
        scope_offset =      { offset = true, position = vector3_box(0, -0.00015, -0.0223), rotation = vector3_box(0, 0, 0)},
        sight =      { offset = true, position = vector3_box(0, -0.038, 0.019), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.745, 0.714, 0.758 ) },
        sightac1 =    { offset = true, position = vector3_box(0.005, 0.247, 0.098), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.03, 0.804, 0.104 ) },
        sightac2 =    { offset = true, position = vector3_box(-0.005, 0.247, 0.098), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.03, 0.804, 0.104 ) },
    },
    --  M16 Helpers
	{	dependencies =  { "owo_m16_sight_01|owo_m16_sight_02"},
        -- Rear Sight Aperture. the peep hole then the 2 bases
        sightac3 =    { offset = true, position = vector3_box(0, 0.022, 0.185), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.15, 0.06, 0.15 ) },
        sightac4 =    { offset = true, position = vector3_box(0.001, 0.024, 0.177), rotation = vector3_box(180, 90, 0), scale = vector3_box(0.08, 0.1, 0.03 ) },
        sightac5 =    { offset = true, position = vector3_box(-0.003, 0.024, 0.177), rotation = vector3_box(-90, -90, -180), scale = vector3_box(0.08, 0.1, 0.03 ) },
        -- Windage Knob on the right side of the sight
        sightac6 =    { offset = true, position = vector3_box(0.006, 0.016, 0.174), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.14, 0.14, 0.056 ) },
        -- Rear Elevation Knob in the base, below the rear sight
        sightac7 =    { offset = true, position = vector3_box(0, 0.012, 0.146), rotation = vector3_box(45, 90, 45), scale = vector3_box(0.77, 0.09, 0.77 ) },
    },

    -- ######
    -- Sight: Rear Sight
    -- ######
    -- AK
    {	dependencies =  { "owo_kalashnikov_rear_sight_01"},
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.1, 0.007), rotation = vector3_box(0.5, 0, 0)},
        sight =     { offset = true, position = vector3_box(0, 0.24, -0.004), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0 ) },
        sightac5 = { offset = true, position = vector3_box(0.008, -0.01, 0.005), rotation = vector3_box(-145, 90, 145), scale = vector3_box(0.23, 0.24, 0.25 ) },
    },
    {	dependencies =  { "owo_kalashnikov_rear_sight_02"},
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.15, 0.002), rotation = vector3_box(0.9, 0, 0)},
        sight =     { offset = true, position = vector3_box(0, 0.24, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0 ) },
        sightac5 = { offset = true, position = vector3_box(0.008, -0.01, 0.003), rotation = vector3_box(-145, 90, 145), scale = vector3_box(0.23, 0.24, 0.25 ) },
        sightac6 =     { offset = true, position = vector3_box(0.0, 0.0, -0.022), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.75, 1.4, 1.0 ) },
    },
    {	dependencies =  { "owo_kalashnikov_rear_sight_01|owo_kalashnikov_rear_sight_02"},
        sightac1 = { offset = true, position = vector3_box(-0.004, -0.06, 0.01), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.36, 0.36, 0.25 ) },
        sightac2 = { offset = true, position = vector3_box(0.022, -0.06, 0.01), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.32, 0.32, 0.06 ) },
        sightac3 = { offset = true, position = vector3_box(0.009, -0.07, 0.0226), rotation = vector3_box(90, 90, 0), scale = vector3_box(0.23, 0.047, 0.22 ) },
        sightac4 = { offset = true, position = vector3_box(-0.009, -0.07, 0.0226), rotation = vector3_box(90, -90, 0), scale = vector3_box(0.23, 0.047, 0.22 ) },
    },
    --   Scuffed
    --      0.5 degree up to align with brauto front post
    --      Pushed forwards to hide stock
    {	dependencies =  { "owo_kalashnikov_rear_sight_03"},
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.1, 0.007), rotation = vector3_box(0.5, 0, 0)},
        sight =     { offset = true, position = vector3_box(0, 0.19, 0.119), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
    },
    --      pushed even more forwards to hide receiver not covered by dust cover (aka the part that gets molested by dust)
    {	dependencies =  { "owo_kalashnikov_rear_sight_04"},
        no_scope_offset =   { offset = true, position = vector3_box(0, -0.15, 0.002), rotation = vector3_box(0.9, 0, 0)},
        sight =     { offset = true, position = vector3_box(0, 0.19, 0.125), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.23, 0.5, 0.1 ) },
    },
    {	dependencies =  { "owo_kalashnikov_rear_sight_03|owo_kalashnikov_rear_sight_04"},
        sightac1 = { offset = true, position = vector3_box(0, 0.034, 0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.38, 4.18 ) },
        --sightac2 = { offset = true, position = vector3_box(-0.008, -0.044, 0.016), rotation = vector3_box(180, 0, 90), scale = vector3_box(0.8, 0.38, 4.18 ) },
        sightac2 = { offset = true, position = vector3_box(0, 0.034, -0.004), rotation = vector3_box(180, 0, 90), scale = vector3_box(0.36, 0.73, 3.48 ) },
        sightac3 = { offset = true, position = vector3_box(-0.05, -0.034, 0.054), rotation = vector3_box(0, 0, 90), scale = vector3_box(0.55, 0.27, 1.34 ) },
        sightac4 = { offset = true, position = vector3_box(-0.05, -0.034, -0.062), rotation = vector3_box(180, 0, 90), scale = vector3_box(0.55, 0.27, 1.34 ) },
        sightac5 = { offset = true, position = vector3_box(-0.008, 0.012, -0.068), rotation = vector3_box(180, 0, 180), scale = vector3_box(1.04, 0.254, 1.62 ) },
    },
    {	dependencies =  { "owo_kalashnikov_rear_sight_04"},
        sightac6 =     { offset = true, position = vector3_box(0.126, 0.126, 0.0), rotation = vector3_box(-180, -90, -180), scale = vector3_box(8.23, 2.8, 3.92 ) },
    },

    -- ######
    -- Sight: Holographic Sights + Magnifier
    -- ######
    --  -------------------------------------------
    --  EOTech
    --  -------------------------------------------
    --  Sight Helpers
    {   dependencies =  { _owo_all_eotech_sights },
        sightac3 =      { offset = true, position = vector3_box(0, 0.088, 0.01), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.1, 0.57, 0.154) },
        sightac4 =      { offset = true, position = vector3_box(0, 0.034, 0.008), rotation = vector3_box(90, 0, -180), scale = vector3_box(0.42, 0.24, 0.314) },
        
        rail =          { offset = true, position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.8), automatic_equip = { rail = "rail_01"}, },
    },
    {   dependencies =  { "owo_holographic_sight_01_01|owo_holographic_sight_01_02_z1|owo_holographic_sight_01_02_z2|owo_holographic_sight_01_03" },
        sightac1 =      { offset = true, position = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac2 =      { offset = true, position = vector3_box(0.00, 0.018, 0.0), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
    },
    --      Short Variant
    {   dependencies =  { _owo_short_eotech_sights },
        sightac1 =      { offset = true, position = vector3_box(0.00, 0.018, 0.018), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.366, 0.256) },
        sightac2 =      { offset = true, position = vector3_box(0.00, 0.018, 0.018), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.366, 0.256) },
    },
    --  Main Sight body
    --      Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =  { _owo_no_magnifier_eotech_sights,
            _owo_sight_2s,
        },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =  { _owo_no_magnifier_eotech_sights },
        sight =         { offset = true, position = vector3_box(0, 0, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
    },
    --      Holo + Magnifier puts the holo a bit more forwards
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =      { _owo_magnifier_eotech_sights,
            _owo_sight_2s,
        },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =      { _owo_magnifier_eotech_sights },
        sight =             { offset = true, position = vector3_box(0, 0.13, 0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.3) },
        sight_2 =           { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 5,6}} },
    
        sight_secondary =         { offset = true, position = vector3_box(0, -0.042, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    --  Magnifier
    --      Aligned
    {   dependencies =      { _owo_magnifier_aligned_eotech_sights },
        sight_secondary_ac1 =      { offset = true, position = vector3_box(0, -0.154, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position = vector3_box(0, -0.0162, 0.034), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    
        lens =              { offset = false, parent = "sight", position = vector3_box(0, -0.048, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0, -0.12, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.45), data = {lens = 2}},
    },
    --      Side
    {   dependencies =      { _owo_magnifier_side_eotech_sights },
        sight_secondary_ac1 =      { offset = true, position = vector3_box(0.042, -0.154, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =      { offset = true, position = vector3_box(0.042, -0.0162, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
    
        lens =              { offset = false, parent = "sight", position = vector3_box(0.042, -0.048, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.52)},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0.042, -0.12, 0.01), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.52)},
    },
    --  -------------------------------------------
    --  Vortex Razor
    --  -------------------------------------------
    --  Patch for alt sights
    {   dependencies =  { _owo_all_vortex_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    --  Short Variant
    {   dependencies =  { "owo_holographic_sight_02_01ss|owo_holographic_sight_02_02ss_z1|owo_holographic_sight_02_02ss_z2|owo_holographic_sight_02_03ss" },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.018), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.4, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.018), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.4, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.032, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.05, 0.666, 1.282) },
    },
    --  Magnifier moves sight forwards
    {   dependencies =  { _owo_magnifier_vortex_sights },
        sight =         { offset = true, position = vector3_box(0, 0.11, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sight_secondary =         { offset = true, position = vector3_box(0, -0.082, 0.0), rotation = vector3_box(180, 90, -90), scale = vector3_box(0.95, 0.184, 0.104) },
    },
    {   dependencies =  { _owo_all_vortex_sights },
        sight =         { offset = true, position = vector3_box(0, 0, 0.124), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), hide_mesh = {{"sight_2", 5,6}} },
        sightac1 =      { offset = true, position = vector3_box(-0.002, -0.018, 0.004), rotation = vector3_box(180, 90, -90), scale = vector3_box(1.25, 0.56, 0.292) },
        sightac2 =      { offset = true, position = vector3_box(0.00, -0.018, 0.004), rotation = vector3_box(90, -90, 0), scale = vector3_box(1.25, 0.56, 0.286) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.032, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.05, 0.666, 0.884) },
        sightac4 =      { offset = true, position = vector3_box(0, -0.002, 0.002), rotation = vector3_box(90, -90, 180), scale = vector3_box(0.98, 0.24, 0.16) },
        rail =          { offset = true, position = vector3_box(0, -0.02, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.8), automatic_equip = { rail = "rail_01"}, },
    },
    --  Magnifier
    --      Aligned
    {   dependencies =          { _owo_magnifier_aligned_vortex_sights },
        sight_secondary_ac1 =   { offset = true, position = vector3_box(0, -0.194, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =   { offset = true, position = vector3_box(0, -0.0562, 0.034), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        lens =                  { offset = false, parent = "sight", position = vector3_box(0, -0.088, 0.034), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.57), data = {lens = 1}},
	    lens_2 =                { offset = false, parent = "sight", position = vector3_box(0, -0.16, 0.034), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.57), data = {lens = 2}},
	},
	--		Side
    {   dependencies =          { _owo_magnifier_side_vortex_sights },
        sight_secondary_ac1 =   { offset = true, position = vector3_box(0.042, -0.194, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        sight_secondary_ac2 =   { offset = true, position = vector3_box(0.042, -0.0562, 0.01), rotation = vector3_box(180, 0, 0), scale = vector3_box(0.89, 1, 0.61) },
        lens =                  { offset = false, parent = "sight", position = vector3_box(0.042, -0.088, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.57), data = {lens = 1}},
	    lens_2 =                { offset = false, parent = "sight", position = vector3_box(0.042, -0.16, 0.01), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.57), data = {lens = 2}},
	},
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    -- Vortex Razor
    {   dependencies =      { _owo_no_magnifier_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0193), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0193), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_vortex_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0193), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    -- EOTech
    {   dependencies =      { _owo_no_magnifier_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.0193), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_aligned_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.018), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_magnifier_side_eotech_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0, -0.018), rotation = vector3_box(0, 0, 0) },
    },

    -- ######
    -- Sight: Telescopic Sights
    -- ######
    --  -------------------------------------------
    --  Trijicon ACOG
    --  -------------------------------------------
    --  ACOG only
    --      Main sight and reticle
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =  { _owo_forwards_acog_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =  { _owo_forwards_acog_sights },
        sight =         { offset = true, position = vector3_box(0, 0.074, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { offset = true, position = vector3_box(0, -0.046, 0.016), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Main sight and reticle (backwards)
    --          Patch to hide alt viewmodel sights. Copies position of case below because its children are lenses
    {   dependencies =  { _owo_backwards_acog_sights, _owo_sight_2s, },
        sight_2 =       { parent = "sight", position = vector3_box(0, -0.02, 0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.769), hide_mesh = {{"sight_2", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}} },
    },
    {   dependencies =  { _owo_backwards_acog_sights },
        sight =         { offset = true, position = vector3_box(0, 0, 0.13), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sight_2 =       { offset = true, position = vector3_box(0, -0.046, 0.018), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    --      Sight Helpers
    {   dependencies =  { _owo_all_acog_sights },
        sightac1 =      { offset = true, position = vector3_box(0, -0.022, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.3, 1, 1.3) },
        sightac2 =      { offset = true, position = vector3_box(0, -0.132, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        sightac3 =      { offset = true, position = vector3_box(0, 0.064, 0.032), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Base
        sightac4 =      { offset = true, position = vector3_box(0, -0.018, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Knobs
        sightac5 =      { offset = true, position = vector3_box(0, -0.01, 0.061), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.45, 0.68, 0.24) },
        sightac6 =      { offset = true, position = vector3_box(0.028, -0.014, 0.034), rotation = vector3_box(-180, -90, -180), scale = vector3_box(0.45, 0.45, 0.12) },
        -- Cable
        sightac7 =      { offset = true, position = vector3_box(0, -0.018, 0.066), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.515, 0.195, 0.525) },
        -- Lenses are the same for forwards and backwards
        lens =          { offset = false, parent = "sight", position = vector3_box(0, 0.026, 0.0345), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.03, 0.3, 1.03), data = {lens = 1}},
	    lens_2 =        { offset = false, parent = "sight", position = vector3_box(0, -0.098, 0.0315), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    --  ACOG with RMR on top
    {   dependencies =      { "owo_acog_sight_02|owo_acog_sight_02_z1|owo_acog_sight_02_top|owo_acog_sight_02f|owo_acog_sight_02f_z1|owo_acog_sight_02f_top" },
        sight_secondary =   { offset = true, position = vector3_box(0, -0.062, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  SUSAT
    --  -------------------------------------------
    {   dependencies =  { "owo_susat_01|owo_susat_01_ps|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight =         { offset = true, position = vector3_box(0, -0.06, 0.160), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        -- Cylinder thing
        sightac1 =      { offset = true, position = vector3_box(0, -0.115, 0.147), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.6, 2.47, 2.14) },
        -- Rear
        sightac2 =      { offset = true, position = vector3_box(0, -0.0081, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        sightac3 =      { offset = true, position = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 17, 0), scale = vector3_box(1.36, 0.514, 1.36) },
        -- Base
        sightac4 =      { offset = true, position = vector3_box(0, 0.07, -0.036), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.63, 0.56) },
        -- Reticle
        sightac5 =      { offset = true, position = vector3_box(-0.0028, 0.066, -0.026), rotation = vector3_box(0, 6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        sightac6 =      { offset = true, position = vector3_box(0.0028, 0.066, -0.026), rotation = vector3_box(0, -6, 0), scale = vector3_box(0.15, 0.45, 0.09) },
        -- Main sight body
        sightac7 =      { offset = true, position = vector3_box(0, -0.008, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.0, 1.0, 1.0) },
        -- Lenses
        lens =          { offset = false, parent = "sightac7", position = vector3_box(0, 0.096, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.85, 0.3, 0.85), data = {lens = 1}},
	    lens_2 =        { offset = false, parent = "sightac7", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
    },
    -- SUSAT with red dot
    {   dependencies =      { "owo_susat_02|owo_susat_02_z1|owo_susat_02_top" },
        sight_secondary =   { offset = true, position = vector3_box(0, 0.022, 0.03), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.7, 1) },
    },
    --  -------------------------------------------
    --  Aligning sights to crosshair
    --  -------------------------------------------
    --  Aiming with main sight
    --      ACOG
    {   dependencies =      { _owo_forwards_acog_sights, _vigilant_autogun_receivers, },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.0258), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_forwards_acog_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.0237), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      ACOG Backwards
    {   dependencies =      { _owo_backwards_acog_sights, _vigilant_autogun_receivers, },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.026), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { _owo_backwards_acog_sights },
        scope_offset =      { offset = true, position = vector3_box(0, -0.0001, -0.0257), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --      SUSAT
    {   dependencies =      { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1", _vigilant_autogun_receivers, },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0238), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    {   dependencies =      { "owo_susat_01|owo_susat_01_z1|owo_susat_02|owo_susat_02_z1", },
        scope_offset =      { offset = true, position = vector3_box(0, 0.0, -0.0237), rotation = vector3_box(0, 0, 0), lense_transparency = true },
    },
    --  Aiming with RMR on ACOG
    {   dependencies =      { "owo_acog_sight_02_top|owo_acog_sight_02f_top" },
        --scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.100), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.100), rotation = vector3_box(0, 0, 0), },
    },
    --  Aiming with RMR on SUSAT
    {   dependencies =      { "owo_susat_02_top" },
        scope_offset =      { offset = true, position = vector3_box(0.0002, 0.001, -0.0872), rotation = vector3_box(0, 0, 0), },
        no_scope_offset =   { offset = true, position = vector3_box(0.0002, 0.001, -0.0872), rotation = vector3_box(0, 0, 0), },
    },

    -- ######
	-- Sight: SOVIET PU SCOPE
	-- ######
    --  Position for MAS bodies
    {	dependencies =  { "owo_pu_scope_01|owo_pu_scope_02", 
            "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s",
        },
        sight = 	    { offset = true, position = vector3_box(0, -0.028, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        -- Scope body
        sightac1 =      { offset = true, position = vector3_box(0, 0.166 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        sightac7 =      { offset = true, position = vector3_box(0, 0.0 , 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
	{	dependencies =  { "owo_pu_scope_01|owo_pu_scope_02"},
        sight = 	  { offset = true, position = vector3_box(0, -0.09, 0.167), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        -- Scope body
        sightac1 = { offset = true, position = vector3_box(0, 0.106 , 0.167), rotation = vector3_box(-180, 0, 0), scale = vector3_box(0.6, 1, 0.6 ) },
        sightac7 = { offset = true, position = vector3_box(0, 0.0 , 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
        -- Crosshair
        sightac2 = { offset = true, position = vector3_box(0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
        sightac3 = { offset = true, position = vector3_box(-0.015, 0.08, 0), rotation = vector3_box(0, 90, 0), scale = vector3_box(0.01, 0.2, 0.078 ) },
        sightac4 = { offset = true, position = vector3_box(0, 0.08, -0.031), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.25, 0.1 ) },
        -- Knobs
        sightac5 = { offset = true, position = vector3_box(0, 0.13, 0.03), rotation = vector3_box(-180, 0, -180), scale = vector3_box(0.5, 0.5, 0.2 ) },
        sightac6 = { offset = true, position = vector3_box(0.03, 0.095, 0), rotation = vector3_box(0, -90, 0), scale = vector3_box(0.5, 0.5, 0.2 ) },
        -- Lenses
        lens =              { offset = false, parent = "sight", position = vector3_box(0, 0.162, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 1}},
	    lens_2 =            { offset = false, parent = "sight", position = vector3_box(0, 0.032, 0.0), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.65, 0.155, 0.65), data = {lens = 2}},
        -- Aligning with Crosshair
        --no_scope_offset =   { offset = true, position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0), lense_transparency = true },
        scope_offset =      { offset = true, position = vector3_box(0, -0.002, -0.0307), rotation = vector3_box(0, 0, 0), lense_transparency = true },

    },
    -- Riser alightment
    {	dependencies =  { "owo_pu_scope_01", 
            "owo_helbore_mas49_01|owo_helbore_mas49_02|owo_helbore_mas49_03|owo_helbore_mas49_05|owo_helbore_mas49_01_s",
        },
        sight_secondary = { offset = true, position = vector3_box(0, 0.066, 0.096), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
    {	dependencies =  { "owo_pu_scope_01"},
        sight_secondary = { offset = true, position = vector3_box(0, 0.016, 0.1), rotation = vector3_box(-90, 0, 180), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },
    {	dependencies =  { "owo_pu_scope_02"},
        sight_secondary = { offset = true, position = vector3_box(0, -0.036, 0.1), rotation = vector3_box(90, 0, 0), scale = vector3_box(0.67, 0.4, 0.5 ) },
    },

    -- ######
	-- Stock: TACTICAL STOCK
	-- ######
    --  Skeletal
    {   dependencies =  { "owo_tactical_stock_s_01" },
        stock =         { position = vector3_box(0.0, 0.11, 0.074), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.95, 1 ) },
    },
    --  Folded
    {   dependencies =  { "owo_tactical_stock_01|owo_tactical_stock_02|owo_tactical_stock_03|owo_tactical_stock_04|owo_tactical_stock_05|owo_tactical_stock_06|owo_tactical_stock_07|owo_tactical_stock_08" },
        stock =         { position = vector3_box(0.054, -0.092, 0.058), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(-0.0037, -0.054, 0.059), rotation = vector3_box(90, 0, -90), scale = vector3_box(1, 0.45, 0.3 )}
    },
    --  Folded (Left)
    {   dependencies =  { "owo_tactical_stock_01l|owo_tactical_stock_02l|owo_tactical_stock_03l|owo_tactical_stock_04l|owo_tactical_stock_05l|owo_tactical_stock_06l|owo_tactical_stock_07l|owo_tactical_stock_08l" },
        stock =         { position = vector3_box(-0.05, -0.096, 0.060), rotation = vector3_box(0, 0, 180), scale = vector3_box(1, 1.0, 1 ) },
        stockac =       { position = vector3_box(0.0023, -0.054, 0.061), rotation = vector3_box(90, 0, 90), scale = vector3_box(1, 0.45, 0.3 )}
    },
    --  Natural
    {   dependencies =  { "owo_tactical_stock_f_01|owo_tactical_stock_f_02" },
        stock =         { position = vector3_box(-0.012, -0.108, 0.064), rotation = vector3_box(0, 0, -176), scale = vector3_box(1, 1.0, 1 ) },
    },
    --  Natural (Under)
    {   dependencies =  { "owo_tactical_stock_f_03u" },
        stock =         { position = vector3_box(0.0, -0.112, 0.0625), rotation = vector3_box(174, 0, 0), scale = vector3_box(2.52, 1.45, 1 ) },
    },

    -- ######
	-- Stock: Kalash Stock
	-- ######
    -- Full
    --  Shotgun
    {   dependencies =  { "owo_kalash_stock_01|owo_kalash_stock_02|owo_kalash_stock_03|owo_kalash_stock_04|owo_kalash_stock_05|owo_kalash_stock_06|owo_kalash_stock_07|owo_kalash_stock_08" },
        stock =         { position = vector3_box(0.0, 0.027, 0.085), rotation = vector3_box(-169, 0, -180), scale = vector3_box(1.0, 1.35, 1.0 ) },
    },
    --  Helbore
    {   dependencies =  { "owo_kalash_stock_h_01|owo_kalash_stock_h_02|owo_kalash_stock_h_03" },
        stock =         { position = vector3_box(0.0, 0.158, 0.077), rotation = vector3_box(-172, 0, 180), scale = vector3_box(1.0, 1.4, 1.0 ) },
    },
    -- Compact
    {   dependencies =  { "owo_kalash_stock_01c|owo_kalash_stock_02c|owo_kalash_stock_03c|owo_kalash_stock_04c|owo_kalash_stock_05c|owo_kalash_stock_06c|owo_kalash_stock_07c|owo_kalash_stock_08c" },
        stock =         { position = vector3_box(0.0, -0.01, 0.083), rotation = vector3_box(-165, 0, -180), scale = vector3_box(1.0, 1.0, 1.0 ) },
    },

    -- ######
	-- Bayonet: UNDERBARREL GRENADE LAUNCHER
	-- ######
    --  -------------------------------------------
    --  M203
    --  -------------------------------------------
    {	dependencies =  { "owo_m203", _short_infantry_autogun_all_barrels},
        bayonet =       { offset = true, position = vector3_box(0, -0.064, -0.136), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _medium_infantry_autogun_all_barrels.."|".._long_infantry_autogun_all_barrels},
        bayonet =       { offset = true, position = vector3_box(0, -0.172, -0.136), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _super_short_braced_autogun_all_barrels.."|".._short_braced_autogun_all_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.172, -0.1), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _long_braced_autogun_all_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.242, -0.1), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _short_vigilant_autogun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.272, -0.138), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _long_vigilant_autogun_all_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.172, -0.138), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    --      Patches for MT parts
    {	dependencies =  { "owo_m203", _short_infantry_lasgun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.016, -0.138), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _long_infantry_lasgun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.084, -0.128), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _mt_recon_lasgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.044, -0.152), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _mt_laspistol_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.036, -0.142), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _mt_combat_shotgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.296, -0.132), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _mt_autopistol_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.036, -0.142), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", "longlasgun_barrel_01" },
        bayonet =       { offset = true, position = vector3_box(0, -0.088, -0.138), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { "owo_m203", _mt_db_shotgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.184, -0.084), rotation = vector3_box(0, 0, 0), scale = vector3_box(2, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _mt_plasma_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.22, -0.18), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.47, 1.5, 1.67 ) },
    },
    {	dependencies =  { "owo_m203", _mt_flamer_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.118, -0.192), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.5, 1.5, 1.43 ) },
    },
    {	dependencies =  { "owo_m203", _mt_bolter_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.178, -0.18), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.6, 0.75, 1.6 ) },
    },
    {	dependencies =  { "owo_m203", _mt_backwards_bolter_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.178, -0.18), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.6, 0.75, 1.6 ) },
    },
    {	dependencies =  { "owo_m203", _mt_twin_stubber_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.402, -0.536), rotation = vector3_box(0, 0, 0), scale = vector3_box(4, 3, 4 ) },
    },
    {	dependencies =  { "owo_m203", _mt_single_stubber_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.326, -0.222), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.6, 2.5, 2.6 ) },
    },
    {	dependencies =  { "owo_m203", _mt_ripper_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.202, -0.212), rotation = vector3_box(0, 0, 0), scale = vector3_box(2.5, 1.5, 2.5 ) },
    },
    --      Patches for Syn's parts
    {	dependencies =  { "owo_m203", "exitus_barrel_01" },
        bayonet =       { offset = true, position = vector3_box(0, -0.172, -0.142), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _syn_helbore_sniper_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.116, -0.476), rotation = vector3_box(0, 0, 0), scale = vector3_box(3.3, 1.5, 3.3 ) },
    },
    {	dependencies =  { "owo_m203", _syn_carry_sniper_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.116, -0.488), rotation = vector3_box(0, 0, 0), scale = vector3_box(3.3, 1.5, 3.3 ) },
    },
    {	dependencies =  { "owo_m203", "ilasgun_double_barrel_01" },
        bayonet =       { offset = true, position = vector3_box(0, -0.116, -0.158), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _syn_heavy_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.172, -0.098), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _syn_m41a_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.34, -0.142), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.25, 3, 1 ) },
    },
    {	dependencies =  { "owo_m203", _syn_carbine_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.04, -0.15), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { "owo_m203", _syn_thompson_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.094, -0.152), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", "syn_daewook11_barrel_01" },
        bayonet =       { offset = true, position = vector3_box(0, -0.3, 0.1), rotation = vector3_box(-180, 0, -180), scale = vector3_box(1, 2.2, 1 ) },
    },
    --          As it suggests, the rotary barrels ROTATE! which will spin the grenade launcher lmao. offset false to allow reparent to the handguard
    {	dependencies =  { "owo_m203", _syn_rotary_barrels },
        bayonet =       { offset = false, parent = "barrelshroudac3", position = vector3_box(0, 0.114, -0.098), rotation = vector3_box(0, 0, 0), scale = vector3_box(1.744, 1.26, 1.42 ) },
    },
    {	dependencies =  { "owo_m203", _syn_q3_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.208, -0.422), rotation = vector3_box(0, 0, 0), scale = vector3_box(3.33, 2.3, 3.33 ) },
    },
    {	dependencies =  { "owo_m203", _syn_pulse_barrels },
        bayonet =       { offset = true, position = vector3_box(0.14, -0.176, -0.085), rotation = vector3_box(0, -60, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    {	dependencies =  { "owo_m203", _syn_aquilon_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.098, -0.11), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    --      Default
	{	dependencies =  { "owo_m203" },
        bayonet =       { offset = true, position = vector3_box(0, -0.172, -0.118), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 1 ) },
    },
    --  Helpers
    {	dependencies =  { "owo_m203"},
        bayonetac1 =    { offset = true, position = vector3_box(0, 0.138, 0.), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1, 1 ) },
        bayonetac2 =    { offset = true, position = vector3_box(0, -0.046, 0), rotation = vector3_box(90, 0, 0), scale = vector3_box(1.4, 1.4, 0.8 ) },
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.06, 0.042), rotation = vector3_box(-180, 0, -180), scale = vector3_box(1, 0.51, 0.51 ) },
        bayonetac4 =    { offset = true, position = vector3_box(0, -0.112, -0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.28, 0.69 ) },
    },
    --  -------------------------------------------
    --  GP-25
    --  -------------------------------------------
    {	dependencies =  { "owo_gp25", _short_infantry_autogun_all_barrels},
        bayonet =       { offset = true, position = vector3_box(0, 0.06, -0.136), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _medium_infantry_autogun_all_barrels.."|".._long_infantry_autogun_all_barrels},
        bayonet =       { offset = true, position = vector3_box(0, -0.044, -0.136), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _super_short_braced_autogun_all_barrels.."|".._short_braced_autogun_all_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.05, -0.106), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_braced_autogun_all_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.204, -0.106), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _short_vigilant_autogun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.13, -0.15), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_vigilant_autogun_all_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.072, -0.148), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --      Patches for MT parts
    {	dependencies =  { "owo_gp25", _short_infantry_lasgun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.088, -0.144), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _long_infantry_lasgun_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.0, -0.138), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _all_helbore_mt_barrels },
        bayonet =       { offset = true, position = vector3_box(0, -0.092, -0.142), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_recon_lasgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.124, -0.152), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_laspistol_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.198, -0.142), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_combat_shotgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.414, -0.132), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_autopistol_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.152, -0.152), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", "longlasgun_barrel_01" },
        bayonet =       { offset = true, position = vector3_box(0, 0.022, -0.138), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 0.68, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_twin_stubber_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.634, -0.464), rotation = vector3_box(0, 0, 180), scale = vector3_box(6, 2.4, 6 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_single_stubber_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.326, -0.084), rotation = vector3_box(0, 0, 180), scale = vector3_box(4, 1.2, 4 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_db_shotgun_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.184, -0.084), rotation = vector3_box(0, 0, 180), scale = vector3_box(3, 1.8, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_plasma_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.22, -0.18), rotation = vector3_box(0, 0, 180), scale = vector3_box(2.2, 1.2, 2.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_flamer_barrels },
        bayonet =       { offset = true, position = vector3_box(0, 0.218, -0.208), rotation = vector3_box(0, 0, 180), scale = vector3_box(2.3, 1.2, 2.15 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_bolter_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.056), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_backwards_bolter_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.056), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _mt_ripper_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.06, 0.03), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.06, 0.038), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 0.566, 0.39 ) },
    },
    --      Patches for Syn's parts
    {	dependencies =  { "owo_gp25", "exitus_barrel_01" },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.65, -0.07), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --{	dependencies =  { "owo_gp25", _syn_helbore_sniper_barrels },
    --    bayonet =       { offset = true, position = vector3_box(0, 0.116, -0.476), rotation = vector3_box(0, 0, 180), scale = vector3_box(3.3, 1.5, 3.3 ) },
    --},
    --{	dependencies =  { "owo_gp25", _syn_carry_sniper_barrels },
    --    bayonet =       { offset = true, position = vector3_box(0, 0.116, -0.488), rotation = vector3_box(0, 0, 180), scale = vector3_box(3.3, 1.5, 3.3 ) },
    --},
    --{	dependencies =  { "owo_gp25", "ilasgun_double_barrel_01" },
    --    bayonet =       { offset = true, position = vector3_box(0, -0.116, -0.158), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    --},
    {	dependencies =  { "owo_gp25", _syn_heavy_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.038), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_m41a_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_carbine_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.076), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_thompson_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.066), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", "syn_daewook11_barrel_01" },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.08), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_rotary_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.072), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_q3_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.046), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_pulse_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.094), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    {	dependencies =  { "owo_gp25", _syn_aquilon_barrels },
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.5, -0.038), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --      Default
    {	dependencies =  { "owo_gp25" },
        bayonet =       { offset = true, position = vector3_box(0, -0.072, -0.112), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.5, 1.2, 1.5 ) },
    },
    --  Helpers
    {	dependencies =  { "owo_gp25" },
        bayonetac1 =    { offset = true, position = vector3_box(0, -0.022, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.875, 1, 0.875 ) },
        bayonetac2 =    { offset = true, position = vector3_box(0, 0.09, 0), rotation = vector3_box(90, 0, 180), scale = vector3_box(1.1, 1.1, 1.3 ) },
        -- Connector
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.06, 0.03), rotation = vector3_box(-180, 0, 0), scale = vector3_box(1, 0.566, 0.21 ) },
        -- Trigger
        bayonetac4 =    { offset = true, position = vector3_box(0, 0.142, 0.004), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.0, 0.6, 0.35 ) },
        -- Top trigger
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.158, -0.012), rotation = vector3_box(-173, 0, 0), scale = vector3_box(0.6, 0.7, 0.7 ) },
    },

    -- ######
	-- Bayonet: UNDERBARREL SHOTGUN
	-- ######
    --  -------------------------------------------
    --  Masterkey
    --  -------------------------------------------
    --      A bit lower
    {	dependencies =  { _mt_combat_shotgun_barrels.."|".._mt_db_shotgun_barrels.."|".._syn_hellgun_barrels.."|".._syn_carbine_barrels, "owo_underbarrel_shotgun_01_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.065), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    {	dependencies =  { _mt_combat_shotgun_barrels.."|".._mt_db_shotgun_barrels.."|".._syn_hellgun_barrels.."|".._syn_carbine_barrels, "owo_underbarrel_shotgun_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.07), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { _mt_combat_shotgun_barrels.."|".._mt_db_shotgun_barrels.."|".._syn_hellgun_barrels.."|".._syn_carbine_barrels, "owo_underbarrel_shotgun_01_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.065), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --      A bit and a bit lower
    {	dependencies =  { "exitus_barrel_01|".._syn_aquilon_barrels, "owo_underbarrel_shotgun_01_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.052), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    {	dependencies =  { "exitus_barrel_01|".._syn_aquilon_barrels, "owo_underbarrel_shotgun_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.060), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { "exitus_barrel_01|".._syn_aquilon_barrels, "owo_underbarrel_shotgun_01_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.052), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --      M41a
    {	dependencies =  { _syn_m41a_barrels, "owo_underbarrel_shotgun_01_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.22, -0.046), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    {	dependencies =  { _syn_m41a_barrels, "owo_underbarrel_shotgun_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.22, -0.052), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { _syn_m41a_barrels, "owo_underbarrel_shotgun_01_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.212, -0.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --      SWS Pulse
    {	dependencies =  { _syn_pulse_barrels, "owo_underbarrel_shotgun_01_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.052), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    {	dependencies =  { _syn_pulse_barrels, "owo_underbarrel_shotgun_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.060), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    {	dependencies =  { _syn_pulse_barrels, "owo_underbarrel_shotgun_01_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.052), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --      Default
    --          Normal
    {	dependencies =  { "owo_underbarrel_shotgun_01_01"},
        -- Shotgun body
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.042), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.8, 0.8 ) },
    },
    --          THICC
    {	dependencies =  { "owo_underbarrel_shotgun_01"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.05), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1 ) },
    },
    --          Mini
    {	dependencies =  { "owo_underbarrel_shotgun_01_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.168, -0.042), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.6, 0.6 ) },
    },
    --  Masterkey Helpers
    --      Connector patches
    {	dependencies =  { _mt_laspistol_barrels.."|".._mt_autopistol_barrels, _owo_masterkey_bayonets},
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.28, 1.0 ) },
    },
    {	dependencies =  { _mt_single_stubber_barrels.."|".._mt_ripper_barrels, _owo_masterkey_bayonets},
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.6, 1.7 ) },
    },
    {	dependencies =  { _mt_backwards_bolter_barrels, _owo_masterkey_bayonets},
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 0.8, 0.7 ) },
    },
    {	dependencies =  { _syn_carry_sniper_barrels, _owo_masterkey_bayonets},
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.6, 0.7 ) },
    },
    {	dependencies =  { _syn_aquilon_barrels, _owo_masterkey_bayonets},
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.5, 1.5 ) },
    },
    --      Default Helpers
	{	dependencies =  { "owo_underbarrel_shotgun_01|owo_underbarrel_shotgun_01_01|owo_underbarrel_shotgun_01_02"},
        -- Shotgun tube
        bayonetac1 =    { offset = true, position = vector3_box(0, 0.613, 0), rotation = vector3_box(0, 0, 180), scale = vector3_box(1.2, 1, 1.2 ) },
        -- Shotgun barrel 2
        bayonetac2 =    { offset = true, position = vector3_box(0, 0.01, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Shotgun tube middle extension
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.42, -0.05), rotation = vector3_box(180, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    { offset = true, position = vector3_box(0, 0.036, -0.088), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 0.85 ) },
        -- Shotgun Trap
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.06, -0.0818), rotation = vector3_box(-90, 0, -84), scale = vector3_box(0.135, 0.25, 0.365 ) },
        -- Connector
        bayonetac6 =    { offset = true, position = vector3_box(0, 0.002, 0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1.6, 1.0 ) },
        -- Pump
        bayonetac7 =    { offset = true, position = vector3_box(0, 0.46, -0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.95, 0.7, 0.85 ) },
    },
    --  -------------------------------------------
    --  M26-MASS
    --  -------------------------------------------
    {	dependencies =  { _mt_combat_shotgun_barrels.."|".._mt_db_shotgun_barrels.."|".._syn_hellgun_barrels.."|".._syn_carbine_barrels, "owo_underbarrel_shotgun_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.25, -0.1), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    {	dependencies =  { "exitus_barrel_01|".._syn_aquilon_barrels, "owo_underbarrel_shotgun_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.25, -0.114), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    {	dependencies =  { _syn_m41a_barrels, "owo_underbarrel_shotgun_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.304, -0.116), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.198, 0.082), rotation = vector3_box(-180, -90, 90), scale = vector3_box(0.75, 0.95, 0.335 ) },
    },
    {	dependencies =  { _syn_pulse_barrels, "owo_underbarrel_shotgun_02"},
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.25, -0.128), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.148, 0.082), rotation = vector3_box(-180, -90, 90), scale = vector3_box(0.75, 0.95, 0.335 ) },
    },
    {	dependencies =  { "owo_underbarrel_shotgun_02"},
        -- Receiver
        bayonet =       { offset = false, parent = "receiver", position = vector3_box(0, 0.25, -0.092), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.85, 0.65 ) },
    },
    --  M26-MASS Helpers
    --      Connector Patches
    {	dependencies =  { _mt_laspistol_barrels.."|".._mt_autopistol_barrels, "owo_underbarrel_shotgun_02"},
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 0.6, 1.0 ) },
    },
    {	dependencies =  { _mt_single_stubber_barrels.."|".._mt_ripper_barrels, "owo_underbarrel_shotgun_02"},
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.7 ) },
    },
    {	dependencies =  { _mt_backwards_bolter_barrels, "owo_underbarrel_shotgun_02"},
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 0.466, 0.7 ) },
    },
    {	dependencies =  { _syn_carry_sniper_barrels, "owo_underbarrel_shotgun_02"},
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 0.7 ) },
    },
    {	dependencies =  { _syn_aquilon_barrels, "owo_underbarrel_shotgun_02"},
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.5 ) },
    },
    --      Default Helpers
    {	dependencies =  { "owo_underbarrel_shotgun_02"},
        -- Mag
        bayonetac1 =    { offset = true, position = vector3_box(0, -0.015, -0.079), rotation = vector3_box(15, 0, 0), scale = vector3_box(1, 1.2, 1 ) },
        -- Barrel
        bayonetac2 =    { offset = true, position = vector3_box(0, -0.02, 0.006), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.8, 0.675, 0.935 ) },
        -- Muzzle
        bayonetac3 =    { offset = true, position = vector3_box(0, 0.36, 0.086), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.0, 1.0 ) },
        -- Trigger
        bayonetac4 =    { offset = true, position = vector3_box(0, -0.044, -0.026), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.4, 0.85, 1.085 ) },
        -- Front Connector
        bayonetac5 =    { offset = true, position = vector3_box(0, 0.246, 0.082), rotation = vector3_box(-180, -90, 90), scale = vector3_box(0.75, 0.95, 0.335 ) },
        -- Connector
        bayonetac6 =    { offset = true, position = vector3_box(0, -0.066, 0.097), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.3, 1, 1.0 ) },
    },

    -- ######
    -- Bayonet: HISTORICAL PACK
    -- ######
    --  -------------------------------------------
	--  M7 Bayonet
    --  -------------------------------------------
    {   dependencies =  { "owo_historical_bayonet_m7_01", _m16_all_barrels, },
        bayonet =       { offset = true, position = vector3_box(0, 0.158, -0.058), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
    },
    {   dependencies =  { "owo_historical_bayonet_m7_01", },
        bayonet =       { offset = true, position = vector3_box(0, 0.47, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1) },
        bayonetac1 =    { offset = true, position = vector3_box(0, 0.002, -0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1) },
        bayonetac2 =    { offset = true, position = vector3_box(0, -0.012, -0.002), rotation = vector3_box(0, 90, 180), scale = vector3_box(0.25, 0.825, 0.25) },
    },
    --  -------------------------------------------
	--  Seitengewehr 98
    --  -------------------------------------------
	{   dependencies =  { "owo_historical_bayonet_seitengewehr", "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03" },
        bayonet =       { offset = true, position = vector3_box(0, 0.575, -0.06), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
    },
    {   dependencies =  { "owo_historical_bayonet_seitengewehr", },
        bayonet =       { offset = true, position = vector3_box(0, 0.575, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 1, 1.7) },
        bayonetac1 =    { offset = true, position = vector3_box(0, 0.002, -0.036), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.25, 0.46, 0.25) },
        bayonetac2 =    { offset = true, position = vector3_box(0, 0, -0.028), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.6, 0.2) },
    },
    --  -------------------------------------------
	--  Épée baïonnette modèle 1886 Lebel
    --  -------------------------------------------
	{   dependencies =  { "owo_historical_bayonet_epee", "owo_wood_krieg_01|owo_wood_krieg_02|owo_wood_krieg_03" },
        bayonet =       { offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
    },
    {   dependencies =  { "owo_historical_bayonet_epee", },
        bayonet =       { offset = true, position = vector3_box(0, 0.47, -0.04), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.5, 0.7) },
        bayonetac1 =    { offset = true, position = vector3_box(0, 0.025, -0.012), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1.1, 1.35, 0.6) },
        bayonetac2 =    { offset = true, position = vector3_box(0, 0.06, 0.014), rotation = vector3_box(180, 0, 180), scale = vector3_box(0.25, 0.09, 0.245) },
    },
})

-- #################
-- Sight Fixes
-- These are shared among multiple weapons but are the same each time
-- Down here so prepend puts it before everything else
-- #################
mod.fixes_owo_alt_viewmodel(this_variant)