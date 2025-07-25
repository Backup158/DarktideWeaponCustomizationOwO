local mod = get_mod("weapon_customization_owo")

mod.hide_slot_fixes = {
    -- ##########
    -- RANGED
    -- ##########
    -- Muzzles
    ["muzzle_2"] = "owo_suppressor_helper_01|owo_suppressor_helper_02|owo_suppressor_helper_03|owo_suppressor_helper_04|owo_condom_helper_m2_01|owo_muzzle_brake_helper_01_01",
    ["muzzle_3"] = "owo_muzzle_brake_helper_02_01|owo_suppressor_helper_02_01|owo_suppressor_helper_02_02|owo_suppressor_helper_02_03|owo_suppressor_helper_02_04|owo_condom_helper_m3_01",
    ["muzzle_4"] = "owo_muzzle_brake_helper_03_01",
    ["muzzle_5"] = "owo_muzzle_brake_helper_04_01",
    ["muzzle_6"] = "owo_muzzle_brake_helper_05_01",
    -- Bayonet
    ["bayonetac1"] = "owo_dreg_bayonet_front_01|owo_historical_bayonet_m7_helper_01|owo_historical_bayonet_seitengewehr_helper_01|owo_historical_bayonet_epee_helper_01|owo_m203_helper_01|owo_gp25_helper_01|owo_underbarrel_shotgun_ac1|owo_underbarrel_shotgun_ac1_02",
    ["bayonetac2"] = "owo_dreg_bayonet_rear_01|owo_historical_bayonet_m7_helper_02|owo_historical_bayonet_seitengewehr_helper_02|owo_historical_bayonet_epee_helper_02|owo_m203_helper_02|owo_gp25_helper_02|owo_underbarrel_shotgun_ac2|owo_underbarrel_shotgun_ac2_02",
    ["bayonetac3"] = "owo_dreg_bayonet_lug_01_01|owo_m203_helper_03|owo_gp25_helper_03|owo_underbarrel_shotgun_ac3|owo_underbarrel_shotgun_ac3_02",
    ["bayonetac4"] = "owo_dreg_bayonet_lug_02_01|owo_m203_helper_04|owo_gp25_helper_04|owo_underbarrel_shotgun_ac4",
    ["bayonetac5"] = "owo_gp25_helper_05|owo_underbarrel_shotgun_ac5|owo_underbarrel_shotgun_ac5_02",
    ["bayonetac6"] = "owo_underbarrel_shotgun_ac6",
    ["bayonetac7"] = "owo_underbarrel_shotgun_ac7",
    ["bayonetac8"] = "owo_underbarrel_shotgun_ac8",
    -- Barrels
    ["barrelshroud"] = "owo_dreg_shroud_01|owo_m16_barrelshroud_a1|owo_m16_barrelshroud_a1_02|owo_m16_barrelshroud_a2|owo_wood_krieg_ac1_01|owo_bistol_shotgun_barrel_short_04|owo_bistol_shotgun_barrel_short_05|owo_bistol_shotgun_barrel_short_06|owo_bistol_shotgun_barrel_short_08|owo_plasma_krieg_ac0_01|owo_revolver_shotgun_barrel_04|owo_revolver_shotgun_barrel_05|owo_revolver_shotgun_barrel_06|owo_revolver_shotgun_barrel_08",
    ["barrelshroudac"] = "owo_bistol_shotgun_barrel_short_04|owo_bistol_shotgun_barrel_short_05|owo_bistol_shotgun_barrel_short_06|owo_bistol_shotgun_barrel_short_08|owo_plasma_krieg_ac1_01|owo_plasma_krieg_ac1_02|owo_plasma_krieg_ac1_03|owo_plasma_krieg_ac1_04|owo_plasma_krieg_ac1_05|owo_plasma_krieg_ac1_06|owo_plasma_krieg_ac1_07|owo_plasma_krieg_ac1_08|owo_plasma_krieg_ac1_09",
    ["barrelshroudac2"] = "owo_dreg_shroudac2_01|owo_m16_barrelshroudac2_01",
    ["barrelshroudac3"] = "owo_dreg_shroudac3_01|owo_m16_barrelshroudac3_01",
    ["barrelshroudac4"] = "owo_dreg_shroudac4_01|owo_m16_barrelshroudac4_01",
    ["barrelshroudac5"] = "owo_m16_barrelshroudac5_01",
    ["barrelshroudac6"] = "owo_m16_barrelshroudac6_01",
    -- Foregrips
    ["foregripac1"] = "owo_tactical_foregrip_ac1_01|owo_foregrip_group_indicator_heterosexual_gun_grip|owo_foregrip_group_indicator_heterosexual_ogryn_grip|owo_foregrip_group_indicator_heterosexual_knife_grip|owo_foregrip_group_indicator_heterosexual_dclaw_grip",
    ["foregripac2"] = "owo_tactical_foregrip_ac2_01",
    ["foregripac3"] = "owo_tactical_foregrip_ac3_01",
    -- Receivers
    ["receiverac2"] = "owo_bolt_helbore_grip_01|owo_helbore_mas49_knob|owo_receiver_group_indicator_california_bolter|owo_slim_laspistol_grip_mag_helper2_01|owo_chunky_laspistol_grip_mag_helper2_01",
    ["receiverac3"] = "owo_slim_laspistol_grip_mag_helper3_01|owo_slim_laspistol_grip_mag_helper3_02|owo_chunky_laspistol_grip_mag_helper3_01",
    -- Magazines
    ["owo_magac1"] = "owo_jungle_mag_helper_01|owo_jungle_mag_helper_02|owo_jungle_mag_helper_03|owo_jungle_mag_helper_04|owo_magazine_magpull_helper_01|owo_magazine_ak_ac1_01|owo_plasma_mag_helper_01|owo_plasma_mag_helper_02|owo_plasma_mag_helper_03|owo_plasma_mag_helper_04|owo_plasma_melta_mag_helper_01",
    ["owo_magac2"] = "owo_jungle_mag_connector_f_01|owo_magazine_magpull_helper_02",
    ["owo_magac3"] = "owo_jungle_mag_connector_b_01|owo_magazine_magpull_helper_03",
    ["owo_magac4"] = "owo_jungle_mag_connector_l_01",
    ["owo_magac5"] = "owo_jungle_mag_connector_r_01",
    -- Grips
    ["gripac"] = "owo_fin_grip2_01",
    -- Sights
    ["sightac1"] = "owo_holosight_helper_01|owo_rear_sight_ac1_01|owo_rear_sight_ac1_02|owo_rear_sight_ac1_02|owo_rear_sight_ac1_03|owo_kalashnikov_rear_sight_ac1_01|owo_kalashnikov_rear_sight_ac1_02|owo_pu_scope_helper_01|owo_m16_sight_helper_01|owo_acog_sight_helper_01|owo_susat_ac1_01",
    ["sightac2"] = "owo_holosight_helper_02|owo_rear_sight_ac2_01|owo_rear_sight_ac2_02|owo_rear_sight_ac2_03|owo_rear_sight_ac2_04|owo_kalashnikov_rear_sight_ac2_01|owo_kalashnikov_rear_sight_ac2_02|owo_pu_scope_helper_02|owo_m16_sight_helper_02|owo_acog_sight_helper_02|owo_susat_ac2_01",
    ["sightac3"] = "owo_holosight_helper_03|owo_holosight_helper_03_02|owo_rear_sight_ac3_01|owo_kalashnikov_rear_sight_ac3_01|owo_pu_scope_helper_03|owo_m16_sight_helper_03|owo_acog_sight_helper_03|owo_susat_ac3_01",
    ["sightac4"] = "owo_holosight_helper_04|owo_rear_sight_ac4_01|owo_kalashnikov_rear_sight_ac4_01|owo_pu_scope_helper_04|owo_m16_sight_helper_04|owo_acog_sight_helper_04",
    ["sightac5"] = "owo_rear_sight_ac5_01|owo_kalashnikov_rear_sight_ac5_01|owo_pu_scope_helper_05|owo_m16_sight_helper_05|owo_acog_sight_helper_05|owo_susat_ac5_01|owo_sight_group_indicator_holosight_acog|owo_sight_group_indicator_holosight_razor",
    ["sightac6"] = "owo_rear_sight_ac6_01|owo_kalashnikov_rear_sight_ac6_01|owo_pu_scope_helper_06|owo_m16_sight_helper_06|owo_acog_sight_helper_06|owo_susat_ac6_01",
    ["sightac7"] = "owo_m16_sight_helper_07|owo_acog_sight_helper_07|owo_susat_ac7_01|owo_pu_scope_helper_07",
    ["sight_secondary"] = "owo_holosight_sight_secondary_01|owo_acog_sight_sight_secondary_01|owo_pu_scope_riser_01",
    ["sight_secondary_ac1"] = "owo_holosight_sight_secondary_helper_01",
    ["sight_secondary_ac2"] = "owo_holosight_sight_secondary_helper_02",
    -- Sight_2
    ["sight_2_ac1"] = "owo_crosshair_ac1_block|owo_crosshair_ac1_obelisk",
    ["sight_2_ac2"] = "owo_crosshair_ac2_block|owo_crosshair_ac2_obelisk",
    ["sight_2_ac3"] = "owo_crosshair_ac3_block|owo_crosshair_ac3_obelisk",
    -- Stocks
    ["stockac"] = "owo_tactical_stockac_01|owo_stock_group_indicator_kalashnikov|owo_stock_group_indicator_kalashnikov_wood|owo_stock_group_indicator_kalashnikov_compact|owo_stock_group_indicator_beeg",
    ["stockac2"] = "owo_stock_group_indicator_ac2_tactical_stock_folded|owo_stock_group_indicator_tactical_stock_left",

    -- ##########
    -- MELEE
    -- ##########
    -- Head/Blade
    ["bladeshroud"] = "owo_tacax_spike_helper_01|owo_historical_blade_helper_gerber|owo_historical_blade_helper_karambit|owo_polearm_head_helper_0_01",
    ["bladeshroudac"] = "owo_polearm_head_helper_1_01|owo_polearm_head_helper_1_02|owo_polearm_head_helper_1_03|owo_polearm_head_helper_1_04|owo_polearm_head_helper_1_l_01|owo_polearm_head_helper_1_l_02|owo_polearm_head_helper_1_p_01|owo_polearm_head_helper_1_p_02|owo_polearm_head_helper_1_p_03|owo_polearm_head_helper_1_p_04|owo_polearm_head_helper_1_p_05|owo_polearm_head_helper_1_p_06|owo_polearm_head_helper_1_p_07|owo_polearm_head_helper_1_p_08|owo_polearm_head_helper_1_p_09",
    ["bladeshroudac2"] =  "owo_polearm_head_helper_2_01",
    ["bladeshroudac3"] =  "owo_polearm_head_helper_3_01|owo_polearm_head_helper_3_02",
    -- Pommel
    ["pommelac1"] = "owo_shovel_handles_ac1_01|owo_shovel_handles_ac1_02|owo_shovel_handles_ac1_03|owo_shovel_handles_ac1_04|owo_shovel_handles_ac1_05",
    ["pommelac2"] = "owo_shovel_handles_ac2_01|owo_shovel_handles_ac2_02|owo_shovel_handles_ac2_03|owo_shovel_handles_ac2_04",
    -- Front Guard
    ["frontguardac1"] = "owo_trench_dagger_finger_guard_helper_ac1",
    ["frontguardac3"] = "owo_trench_dagger_finger_guard_helper_ac2",
    ["frontguardac3"] = "owo_trench_dagger_finger_guard_helper_ac3",
    -- Shaft
    ["shaftac1"] = "owo_ogryn_shaft_low_grip_helper_01|owo_ogryn_shaft_low_grip_helper_02|owo_ogryn_shaft_low_grip_helper_03|owo_ogryn_shaft_low_grip_helper_04|owo_ogryn_shaft_low_grip_helper_05|owo_ogryn_shaft_low_grip_helper_06|owo_shaft_low_grip_helper_01|owo_shaft_low_grip_helper_02|owo_shaft_low_grip_helper_03|owo_shaft_low_grip_helper_04|owo_shaft_low_grip_helper_05|owo_shaft_low_grip_helper_06",
}