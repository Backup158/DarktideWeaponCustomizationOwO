local mod = get_mod("extended_weapon_customization_owo")

-- ================================
-- This file contains all the common hard-coded attachment "query results" for fixes
-- Dynamically-created ones are in the shared_fix_requirements file
-- This is important because this file can run before the attachments are created, while the shared_fix_requirements must run after
-- ================================

-- ################################
-- Camera Angles for Preview
-- ################################
mod.render_unit_rot_profile_left = {90, 0, 30}
mod.render_cam_pos_profile_left = {-0.2, -1.75, 0.15}
mod.render_unit_rot_sword_blade = {90, 30, 0}
mod.render_cam_pos_sword_blade = {-.025, -2.5, .7}
mod.render_unit_rot_headon = {0, 0, 0}
-- For the Sight Reticles
mod.render_unit_rot_spread_ass_cheeks = {
    [1] = {90, 0, -103},
    [2] = {60, 0, 0},
    [3] = {90, 4, -105},
}
mod.render_cam_pos_reticle_close = {
    [1] = {0, 0.45, 0.21},
    [2] = {0, 0.45, 0.25},
    [3] = {0, 0.75, 0.2},
}

-- ################################
-- Attachments
-- ################################
-- ################
-- Regular and Base Additions Parts
-- ################
mod.all_infantry_autogun_receivers = "autogun_rifle_receiver_01|autogun_rifle_receiver_02|autogun_rifle_receiver_03|autogun_rifle_receiver_04|autogun_rifle_receiver_ml01"
mod.all_braced_autogun_receivers = "autogun_rifle_ak_receiver_01|autogun_rifle_ak_receiver_02|autogun_rifle_ak_receiver_03|autogun_rifle_ak_receiver_04|autogun_rifle_ak_receiver_ml01"
mod.all_headhunter_autogun_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
mod.all_autogun_receivers = mod.all_infantry_autogun_receivers.."|"..mod.all_braced_autogun_receivers.."|"..mod.all_headhunter_autogun_receivers
mod.all_recon_lasgun_receivers = "lasgun_rifle_elysian_receiver_01|lasgun_rifle_elysian_receiver_02|lasgun_rifle_elysian_receiver_03|lasgun_rifle_elysian_receiver_04|lasgun_rifle_elysian_receiver_05|lasgun_rifle_elysian_receiver_06|lasgun_rifle_elysian_receiver_07|lasgun_rifle_elysian_receiver_08|lasgun_rifle_elysian_receiver_ml01"

-- ################
-- Syn's Parts
-- ################
mod.syn_ma5_extensions = "ma5_extension_01|ma5_extension_02|ma5_extension_03|ma5_extension_04|ma5_extension_05|ma5_extension_06|ma5_extension_07|ma5_extension_08|ma5_extension_09|ma5_extension_10|ma5_extension_11|ma5_extension_12|ma5_extension_13|ma5_extension_14|ma5_extension_15|ma5_extension_16|ma5_extension_17|ma5_extension_18|ma5_extension_19"
mod.syn_ma5_compact_extensions = "ma5_compact_extension_01|ma5_compact_extension_02|ma5_compact_extension_03|ma5_compact_extension_04|ma5_compact_extension_05|ma5_compact_extension_06|ma5_compact_extension_07|ma5_compact_extension_08|ma5_compact_extension_09|ma5_compact_extension_10|ma5_compact_extension_11|ma5_compact_extension_12|ma5_compact_extension_13|ma5_compact_extension_14|ma5_compact_extension_15|ma5_compact_extension_16|ma5_compact_extension_17|ma5_compact_extension_18|ma5_compact_extension_19"
mod.syn_ma5_classic_extensions = "ma5_extension_20|ma5_extension_21|ma5_extension_20a|ma5_extension_21a"
mod.syn_ma5_compact_classic = "ma5_compact_extension_20|ma5_compact_extension_21"
mod.syn_all_ma5_extensions = mod.syn_ma5_extensions.."|"..mod.syn_ma5_compact_extensions.."|"..mod.syn_ma5_classic_extensions.."|"..mod.syn_ma5_compact_classic
mod.syn_recon_extensions = "recon_extension_01|recon_extension_02|recon_extension_03|recon_extension_04|recon_extension_05|recon_extension_06|recon_extension_07|recon_extension_08|recon_extension_09|recon_extension_01_reversed|recon_extension_02_reversed|recon_extension_03_reversed|recon_extension_04_reversed|recon_extension_05_reversed|recon_extension_06_reversed|recon_extension_07_reversed|recon_extension_08_reversed|recon_extension_09_reversed"
mod.syn_g36_extensions = "g36_extension_01|g36_extension_02"
mod.syn_all_receiver_extensions = mod.syn_all_ma5_extensions.."|"..mod.syn_recon_extensions.."|"..mod.syn_g36_extensions
mod.syn_hellgun_receivers = "syn_hellgun_receiver_01|syn_hellgun_receiver_02|syn_hellgun_receiver_03|syn_hellgun_receiver_ml01|syn_hellgun_receiver_14|syn_hellgun_receiver_15"

