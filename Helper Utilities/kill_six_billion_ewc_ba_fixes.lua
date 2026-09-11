-- ###################################################################
-- Gets Fixes in EWC_BA and replaces them
-- Intended to just be thrown somewhere into your mod
-- Or put this file in there then use io:dofile
-- No reason for me to make this a standalone mod
-- ###################################################################
local ewc_ba = get_mod("extended_weapon_customization_base_additions")

if not (ewc_ba and ewc_ba.extended_weapon_customization_plugin and ewc_ba.extended_weapon_customization_plugin.fixes) then
    echo_if_verbose("Missing ewc ba fixes. Standing down.")
    return
end 

-- ###################################################################
-- DATA
-- ###################################################################
-- ################################
-- Local References for Performance
-- ################################
local vector3 = Vector3
local vector3_box = Vector3Box
local pairs = pairs
local table = table
local table_insert = table.insert
local table_clone = table.clone
local table_dump = table.dump

-- ################################
-- Mod Data
-- ################################
-- Change this to get rid of all the dumping and echoing
local verbose_replacement = false

local headhunter_receivers = "autogun_rifle_killshot_receiver_01|autogun_rifle_killshot_receiver_02|autogun_rifle_killshot_receiver_03|autogun_rifle_killshot_receiver_04|autogun_rifle_killshot_receiver_ml01"
local reflex_sights = "reflex_sight_01|reflex_sight_02|reflex_sight_03"
local scopes = "scope_01"
local ewc_ba_both_sights_condition = reflex_sights.."|"..scopes

-- In my fixes, I'm adding a key "target_acquired" to know which requirements string to check
--  This is meaningless to EWC, and it should be fine to just leave, but I'm wiping it after inserting into EWC_BA anyways
--  You define this right inside each fix you want to insert
-- Also I'm putting the key name as a variable on the slim chance that there's a name collision in the future, so it's easily changed
--  Oh who am I kidding
local target_acquired_name = "target_acquired"
local my_fixes = {
    stubrevolver_p1_m1 = {
        {
            [target_acquired_name] = {
                {
                    slot = "sight",
                    has_or_missing = "has",
                    condition = ewc_ba_both_sights_condition,
                },
            },
            attachment_slot = "rail",
            requirements = {
                barrel = {
                    has = "penis_inside_default",
                },
                bayonet = {
                    missing = "loving_family",
                },
            },
            fix = {
                attach = {
                    rail = "lasgun_pistol_rail_01",
                },
                offset = {
                    position = vector3_box(0.0, 0.085, -0.045),
                },
            },
        },
        {
            -- This should be OK because I added the backwards compatibility (the versions are 1 hour apart xd)
            [target_acquired_name] = {
                slot = "sight",
                has_or_missing = "has",
                condition = ewc_ba_both_sights_condition,
            },
            attachment_slot = "rail",
            requirements = {
                sight = {
                    has = "penis_inside_backwards_compatibility",
                },
            },
            fix = {
                attach = {
                    rail = "lasgun_pistol_rail_01",
                },
                offset = {
                    position = vector3_box(0.0, 0.085, -0.045),
                },
            },
        },
    },
    autogun_p1_m1 = {
        {
            [target_acquired_name] = {
                {
                    slot = "sight",
                    has_or_missing = "has",
                    condition = ewc_ba_both_sights_condition,
                },
            },
            attachment_slot = "rail",
            requirements = {
                barrel = {
                    has = "penis_inside_default_3",
                },
                bayonet = {
                    missing = "loving_family2",
                },
            },
            fix = {
                attach = {
                    rail = "lasgun_pistol_rail_01",
                },
                offset = {
                    position = vector3_box(0.0, 0.085, -0.045),
                },
            },
        },
        {
            [target_acquired_name] = {
                {
                    slot = "sight",
                    has_or_missing = "has",
                    condition = reflex_sights,
                },
                {
                    slot = "receiver",
                    has_or_missing = "has",
                    condition = headhunter_receivers,
                },
            },
            attachment_slot = "rail",
            requirements = {
                sight = {
                    has = "penis_inside4_with_multiple_conditions",
                },
            },
            fix = {
                offset = {
                    position = vector3_box(0.0, 0.085, -0.045),
                },
            },
        },
        {
            [target_acquired_name] = {
                slot = "some_bum_fuck_slot_idc_this_is_just_to_test_failure",
                has_or_missing = "has",
                condition = ewc_ba_both_sights_condition,
            },
            attachment_slot = "rail",
            requirements = {
                sight = {
                    has = "penis_inside5_invalid_slot",
                },
            },
            fix = {
                attach = {
                    rail = "lasgun_pistol_rail_01",
                },
                offset = {
                    position = vector3_box(0.0, 0.085, -0.045),
                },
            },
        },
    }
}
-- If you want to add marks, you could do so here. Loops are too complicated since you hae to check the MasterItems so
my_fixes.autogun_p1_m2 = table_clone(my_fixes.autogun_p1_m1)
my_fixes.autogun_p1_m3 = table_clone(my_fixes.autogun_p1_m1)
my_fixes.autogun_p2_m1 = table_clone(my_fixes.autogun_p1_m1)
my_fixes.autogun_p2_m2 = table_clone(my_fixes.autogun_p1_m1)
my_fixes.autogun_p2_m3 = table_clone(my_fixes.autogun_p1_m1)
my_fixes.autogun_p3_m1 = table_clone(my_fixes.autogun_p1_m1)
my_fixes.autogun_p3_m2 = table_clone(my_fixes.autogun_p1_m1)
my_fixes.autogun_p3_m3 = table_clone(my_fixes.autogun_p1_m1)

my_fixes.stubrevolver_p1_m2 = table_clone(my_fixes.stubrevolver_p1_m1)

-- ################################
-- Helper Functions
-- ################################
local function echo_if_verbose(message)
    if verbose_replacement then
        -- I can just take echo from ewc_ba so you don't need the mod = get_mod
        ewc_ba:echo(message)
    end
end

local function dump_if_verbose(table, message, depth)
    if verbose_replacement then
        table_dump(table, message, depth)
    end
end

-- ################
-- Check My Fix for Target Intel
-- DESCRIPTION: Given a fix from my table of fixes, extract the conditions that need to be met to use it as a replacement
-- PARAMETERS: 
--      table: one_of_my_fixes_under_a_weapon
-- RETURN:
--      bool: extraction was successful or not
--      string/table: slot_to_check; "sight"
--      string/table: type_of_check; "has"
--      string/table: my_target_requirements_string; "reflex_sight_01|reflex_sight_02"
-- ################
local function check_my_fix_for_target(one_of_my_fixes_under_a_weapon) 
    local type_of_given_fix = type(one_of_my_fixes_under_a_weapon)
    if not(type_of_given_fix == "table") then
        echo_if_verbose("You did not give a table. A most shamefuru dispray. Type: "..type_of_given_fix)
        return false
    end

    local function check_for_target_intel(one_fix)
        -- These could be formatted as `local x = fix[target].y or "default" but I want the error message
        local slot_to_check = one_of_my_fixes_under_a_weapon[target_acquired_name].slot
        if not slot_to_check then
            echo_if_verbose("Given fix was missing a slot. Defaulting to rail.")
            slot_to_check = "rail"
        end
        local type_of_check = one_of_my_fixes_under_a_weapon[target_acquired_name].has_or_missing
        if not type_of_check then
            echo_if_verbose("Given fix was missing if it was has/missing. Defaulting to has.")
            type_of_check = "has"
        end
        local my_target_requirements_string = one_of_my_fixes_under_a_weapon[target_acquired_name].condition
        if not my_target_requirements_string then
            echo_if_verbose("Given fix was missing if it was has/missing. Defaulting to scope_01.")
            my_target_requirements_string = "scope_01"
        end
        return slot_to_check, type_of_check, my_target_requirements_string
    end

    if one_of_my_fixes_under_a_weapon[target_acquired_name] then
        local fix_has_subtable = one_of_my_fixes_under_a_weapon[target_acquired_name][1]
        -- Case 1: Given single fix
        if not fix_has_subtable then
            local slot_to_check, type_of_check, my_target_requirements_string = check_for_target_intel(one_of_my_fixes_under_a_weapon[target_acquired_name])
            return true, slot_to_check, type_of_check, my_target_requirements_string
        -- Case 2: Multiple fixes
        else
            local final_slot_to_check, final_type_of_check, final_requirements_string = {}, {}, {}
            for i = 1, #one_of_my_fixes_under_a_weapon[target_acquired_name] do
                local subtable_for_target_intel = one_of_my_fixes_under_a_weapon[target_acquired_name][i]
                local slot_to_check, type_of_check, my_target_requirements_string = check_for_target_intel(subtable_for_target_intel)
                table_insert(final_slot_to_check, slot_to_check)
                table_insert(final_type_of_check, type_of_check)
                table_insert(final_requirements_string, my_target_requirements_string)
            end
            return true, final_slot_to_check, final_type_of_check, final_requirements_string
        end
    else
        echo_if_verbose("Given fix was missing key: "..target_acquired_name)
        return false
    end
end

-- ################
-- Compare a Single Fix Target with Fix from EWC_BA
-- DESCRIPTION: With such a long name, that should be clear. This fulfills Step 2. Check if condition matches
-- PARAMETERS:
--      string: weapon_id; "stubrevolver_p1_m1"
--      table: current_fix_in_ba
--      table: current_fix_from_my_fixes
--      string: slot_to_check; "sight"
--      string: type_of_check; "has"
--      string: my_target_requirements_string; "reflex_sight_01|reflex_sight_02"
-- RETURN:
--      bool: If the requirements in EWC_BA matches the given conditions
-- ################
local function compare_one_of_my_fix_targets_with_ba_fix(weapon_id, current_fix_in_ba, current_fix_from_my_fixes, slot_to_check, type_of_check, my_target_requirements_string)
    -- 2. Check if condition matches
    --  I put a target_acquired = "fix_value_to_look_for_in_ba" in case what we're actually putting in is different
    --  First safety check is to be sure the fix in EWC has the proper slot to check
    --  Second safety check is for my own fix to make sure it's a sight
    local safe_to_access_ba = current_fix_in_ba.requirements[slot_to_check] and current_fix_in_ba.requirements[slot_to_check][type_of_check]
    if safe_to_access_ba then
        echo_if_verbose("Attachment slots match and my fix was not used yet")
        if current_fix_from_my_fixes.requirements[slot_to_check] then
            local ba_requirements_for_slot = current_fix_in_ba.requirements[slot_to_check][type_of_check]
            if (my_target_requirements_string == ba_requirements_for_slot) then
                return true
            else
                echo_if_verbose("Not matching: "..ba_requirements_for_slot.."\n\t"..my_target_requirements_string)
            end
        else
            dump_if_verbose(my_fixes[weapon_id][my_index], "my fix doesn't have target slot because fuck you", 15)
        end
    else
        echo_if_verbose("EWC BA fix was missing \"has sight requirements\"")
    end
    return false
end

-- ################
-- For One Fix, Get All Fix Targets, then Compare Them All to The Requirements in EWC_BA
-- DESCRIPTION: With such a long name, that should be clear
-- PARAMETERS:
--      string: weapon_id; "stubrevolver_p1_m1"
--      table: current_fix_in_ba
--      table: current_fix_from_my_fixes
-- RETURN:
--      bool: If the requirements in EWC_BA matches the given conditions
-- ################
local function one_fix_get_and_compare_all_targets_to_ba_fix(weapon_id, current_fix_in_ba, current_fix_from_my_fixes)
    -- Get which condition must checked (see note above my_fixes definition)
    local target_found_successfully, slot_to_check, type_of_check, my_target_requirements_string = check_my_fix_for_target(current_fix_from_my_fixes)
    local execute_replacement = false
    if target_found_successfully then
        local type_slot_to_check = type(slot_to_check)
        local type_type_of_check = type(type_of_check)
        local type_my_target_requirements_string = type(my_target_requirements_string)

        -- Backwards compatibility
        if (type_slot_to_check == "string") and (type_type_of_check == "string") and (type_my_target_requirements_string == "string") then
            execute_replacement = compare_one_of_my_fix_targets_with_ba_fix(weapon_id, current_fix_in_ba, current_fix_from_my_fixes, slot_to_check, type_of_check, my_target_requirements_string)
        elseif (type_slot_to_check == "table") and (type_type_of_check == "table") and (type_my_target_requirements_string == "table") then
            local all_are_true = true
            local index_of_each_intel = 1
            -- All tables will have the same length, so it's fine
            while all_are_true and (index_of_each_intel < #slot_to_check) do
                -- The logic goes like this
                --   Comparing fix returns true if that case works
                --   and it retuns false if not
                --   true and true: true, all matches so far
                --   true and false: false, so the first time it fails, all_or_true = false, leading to...
                --   false and true: false; false and false: false
                --   not that the last two cases matter since it'll exit the loop
                all_are_true = all_are_true and compare_one_of_my_fix_targets_with_ba_fix(weapon_id, current_fix_in_ba, current_fix_from_my_fixes, slot_to_check[index_of_each_intel], type_of_check[index_of_each_intel], my_target_requirements_string[index_of_each_intel])
                
                index_of_each_intel = index_of_each_intel + 1
            end
            execute_replacement = all_are_true
        else
            echo_if_verbose("Somehow your target results don't match eachother. How odd!\n\t"..type_slot_to_check.." "..type_type_of_check.." "..type_my_target_requirements_string)
        end
    else
        dump_if_verbose(current_fix_from_my_fixes, "No target was found in my fix uwu", 15)
    end

    return target_found_successfully and execute_replacement
end

-- ###################################################################
-- Execution
-- ###################################################################
-- Replacing certain fixes from EWC_BA
--   You write your own list of fixes `my_fixes`
--   In each fix, define the conditions that need to be met to replace a fix `target_acquired_name`
-- NOTE: The example my_fixes only replaces it for family 1, mark 1 as proof of concept. You'll have to handle the associated weapon_id some other way (autogun_p1_m2, autogun_p1_m3, autogun_p2_m1, etc.)
for weapon_id, _ in pairs(my_fixes) do
    if ewc_ba.extended_weapon_customization_plugin.fixes[weapon_id] then
        echo_if_verbose("Base Additions has fixes for this weapon. Commencing search. "..tostring(weapon_id))
        -- Linear search through each fix because kiss your sister
        -- Description:
        --      For each one, check all fixes in my fixes. 
        --      The first match replaces the one in BA, and it gets marked as used so it doesn't duplicate
        -- Some notes about this for loop declaration
        --      There's no safety check beforehand for if BA fix is a table. I assumed it was safe
        --      I also used ipairs to keep things in order, since I assumed gras was consistent in using arrays for fixes
        --      That's been the case. But if you edit this to edit one of our plugins, who knows what stupid thing we might've done (causing a backend error)
        --      Remember: current_fix_in_ba == ewc_ba.extended_weapon_customization_plugin.fixes[weapon_id][index_of_current_fix_in_ba]
        for index_of_current_fix_in_ba, current_fix_in_ba in ipairs(ewc_ba.extended_weapon_customization_plugin.fixes[weapon_id]) do
            -- dump_if_verbose(current_fix_in_ba, "Checking BA fix at index "..tostring(index_of_current_fix_in_ba), 15)

            -- Checking each of my fixes
            --  1. Check if attachment_slot names matches
            --  2. Check if condition matches
            --  If so, replace it in BA then wipe it from my fixes
            if my_fixes[weapon_id] and type(my_fixes[weapon_id]) == "table" then
                --echo_if_verbose("my fixes have this weapon: "..tostring(weapon_id).."\n\tTable size: "..#my_fixes[weapon_id])
                for my_index = 1, #my_fixes[weapon_id] do
                    local current_fix_from_my_fixes = my_fixes[weapon_id][my_index]

                    -- Check if my fix exists first, then
                    -- 1. Check if affecting slot matches
                    if current_fix_from_my_fixes and (not current_fix_from_my_fixes.used) and
                    (current_fix_from_my_fixes.attachment_slot == current_fix_in_ba.attachment_slot) then
                        -- 2. Check if condition matches
                        local execute_replacement = one_fix_get_and_compare_all_targets_to_ba_fix(weapon_id, current_fix_in_ba, current_fix_from_my_fixes)
                        if execute_replacement then
                            echo_if_verbose("Dr Dre's dead; he's locked in my basement!")
                            -- Not using local references to be explicit on what is being changed (it should be fine either way)
                            -- Replacing fix from EWC_BA: current_fix_in_ba
                            ewc_ba.extended_weapon_customization_plugin.fixes[weapon_id][index_of_current_fix_in_ba] = nil
                            ewc_ba.extended_weapon_customization_plugin.fixes[weapon_id][index_of_current_fix_in_ba] = table_clone(my_fixes[weapon_id][my_index])

                            -- Removing the extraneous target data from my current fix
                            ewc_ba.extended_weapon_customization_plugin.fixes[weapon_id][index_of_current_fix_in_ba][target_acquired_name] = nil

                            -- "Wiping" my fix: current_fix_from_my_fixes
                            -- So it doesn't replace two fixes in BA
                            my_fixes[weapon_id][my_index].used = true
                        end
                    end
                end
            else
                echo_if_verbose("where are my fixes")
            end
            
        end
    end
    -- Now, we have gone through every fix in BA for this weapon
    -- This function should only be given a my_fixes that is explicitly written to replace the values in BA. If you give too many, sucks to suck
    -- I'm going to do nothing now and log an error
    for _, fix in pairs(my_fixes[weapon_id]) do
        if not fix.used then
            mod:info("Gave too many fixes to replace. BA didn't have enough to take all that.")
            dump_if_verbose(fix, "uwu my unused fix", 15)
        end
    end
    -- Let's unzip ewc ba's jeans
    table_dump(ewc_ba.extended_weapon_customization_plugin.fixes[weapon_id], "uwu ewc ba fixes for "..weapon_id, 15)
end