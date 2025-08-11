local mod = get_mod("weapon_customization_owo")

 -- Locals from Weapon Customization plugin template
local vector3_box = Vector3Box
local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

local this_variant = "powermaul_p2_m1" -- Arbites Shock Maul
local _hide_slot_table = mod:io_dofile("weapon_customization_owo/scripts/mods/weapon_customization_owo/common/hide_slot")

-- ############################################
-- Add Custom Attachments
-- Makes new tables for attachment anchors
-- ############################################
-- MT Plugin normally would be the one to add these
--  but with that dev being paused, syn adds it 
if not mod.syn then
    mod.wc.anchors[this_variant] = {}
    mod.wc.anchors[this_variant].fixes = {}
    mod.wc.attachment[this_variant].poweraura = {}
end

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
	"bladeshroudac",
	"bladeshroudac2",
	"bladeshroudac3",
	"bladeshroudac4",
	--"bladeshroudac5",
	--"bladeshroudac6",
	--"bladeshroudac7",
	--"bladeshroudac8",
	--"bladeshroudac9",
	--"bladeshroudac10",
	--"bladeshroudac11",
	--"bladeshroudac12",
	--"bladeshroudac13",
	--"shaftshroud",
	--"shaftshroudac",
	--"shaftshroudac2",
	--"shaftshroudac3",
	--"shaftshroudac4",
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
    
}
mod.initialize_table_of_custom_slot_for_weapon(this_variant, table_of_owo_slots)

-- ############################################
-- Injection Calls: attachments and models
-- from ranged.lua and melee.lua
-- ############################################
mod.owo_tacax_spike(this_variant, "head", "shaft")
mod.owo_polearm_head(this_variant, "head", "shaft")
mod.owo_slim_blade(this_variant, "head", "shaft")

mod.owo_invisible_connector(this_variant)

--mod.owo_crossguard(this_variant, "hilt", "grip")

-- ############################################
-- Define Variables for Fixes
-- ############################################
local _owo_flat_psword_blades = "owo_flat_psword_01|owo_flat_psword_02|owo_flat_psword_03|owo_flat_psword_04|owo_flat_psword_05|owo_flat_psword_06|owo_flat_psword_07|owo_flat_psword_08"
local _owo_slim_psword_blades = "owo_slim_psword_01|owo_slim_psword_02|owo_slim_psword_03|owo_slim_psword_04|owo_slim_psword_05|owo_slim_psword_06|owo_slim_psword_07|owo_slim_psword_08"
local _owo_flat_psword_g_blades = "owo_flat_psword_01g|owo_flat_psword_02g|owo_flat_psword_03g|owo_flat_psword_04g|owo_flat_psword_05g|owo_flat_psword_06g|owo_flat_psword_07g|owo_flat_psword_08g"
local _owo_slim_psword_g_blades = "owo_slim_psword_01g|owo_slim_psword_02g|owo_slim_psword_03g|owo_slim_psword_04g|owo_slim_psword_05g|owo_slim_psword_06g|owo_slim_psword_07g|owo_slim_psword_08g"
local _owo_flat_all_psword_blades = _owo_flat_psword_blades.."|".._owo_flat_psword_g_blades
local _owo_slim_all_psword_blades = _owo_slim_psword_blades.."|".._owo_slim_psword_g_blades
local _owo_all_psword_g_blades = _owo_flat_psword_g_blades.."|".._owo_slim_psword_g_blades
local _owo_flat_dclaw_blades = "owo_flat_dclaw_01|owo_flat_dclaw_02|owo_flat_dclaw_03|owo_flat_dclaw_04|owo_flat_dclaw_05|owo_flat_dclaw_06|owo_flat_dclaw_07|owo_flat_dclaw_08"
local _owo_flat_dclaw_g_blades = "owo_flat_dclaw_01g|owo_flat_dclaw_02g|owo_flat_dclaw_03g|owo_flat_dclaw_04g|owo_flat_dclaw_05g|owo_flat_dclaw_06g|owo_flat_dclaw_07g|owo_flat_dclaw_08g"
local _owo_flat_all_dclaw_blades = _owo_flat_dclaw_blades.."|".._owo_flat_dclaw_g_blades
local _owo_slim_dclaw_blades = "owo_slim_dclaw_01|owo_slim_dclaw_02|owo_slim_dclaw_03|owo_slim_dclaw_04|owo_slim_dclaw_05|owo_slim_dclaw_06|owo_slim_dclaw_07|owo_slim_dclaw_08"
local _owo_slim_dclaw_g_blades = "owo_slim_dclaw_01g|owo_slim_dclaw_02g|owo_slim_dclaw_03g|owo_slim_dclaw_04g|owo_slim_dclaw_05g|owo_slim_dclaw_06g|owo_slim_dclaw_07g|owo_slim_dclaw_08g"
local _owo_slim_all_dclaw_blades = _owo_slim_dclaw_blades.."|".._owo_slim_dclaw_g_blades
local _owo_all_dclaw_g_blades = _owo_flat_dclaw_g_blades.."|".._owo_slim_dclaw_g_blades
local _owo_all_tacax_spike_heads = "owo_tacax_spike_01|owo_tacax_spike_02|owo_tacax_spike_03|owo_tacax_spike_04|owo_tacax_spike_05|owo_tacax_spike_06|owo_tacax_spike_07"
local _owo_polearm_bec_heads = "owo_polearm_head_bc_01|owo_polearm_head_bc_02|owo_polearm_head_bc_03|owo_polearm_head_bc_04|owo_polearm_head_bc_01b|owo_polearm_head_bc_02b|owo_polearm_head_bc_03b|owo_polearm_head_bc_04b"
local _owo_polearm_lucerne_heads = "owo_polearm_head_l_01|owo_polearm_head_l_02||owo_polearm_head_l_03"
local _owo_polearm_pollax_shovel_heads = "owo_polearm_head_p_04|owo_polearm_head_p_05|owo_polearm_head_p_06|owo_polearm_head_p_07|owo_polearm_head_p_08|owo_polearm_head_p_09"
local _owo_polearm_pollax_misc_heads = "owo_polearm_head_p_01|owo_polearm_head_p_02|owo_polearm_head_p_03"
local _owo_polearm_pollax_heads = _owo_polearm_pollax_shovel_heads.."|".._owo_polearm_pollax_misc_heads
local _owo_polearm_heads = _owo_polearm_bec_heads.."|".._owo_polearm_lucerne_heads.."|".._owo_polearm_pollax_heads


-- ########
-- For This Variant Only
-- ########
local _power_sword_grips = "power_sword_grip_01|power_sword_grip_02|power_sword_grip_03|power_sword_grip_04|power_sword_grip_05|power_sword_grip_06"

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
--mod.fixes_owo_slim_blade(this_variant, "head", "shaft") -- WAY TOO DIFFERENT
mod.fixes_owo_polearm_head(this_variant, "head", "shaft")
mod.fixes_owo_tacax_spike(this_variant, "head", "shaft")

--mod.fixes_owo_crossguard(this_variant)

-- #################
-- Custom Fixes
-- #################
mod.mt.inject_fixes(this_variant, {
    -- PSword
    --      Flat Power Sword
    --          Hilt Patches
    --{   dependencies =  { _owo_flat_psword_g_blades, _power_sword_grips },
    --    hilt =  { offset = true, position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
    --},
    ----      Slim Power Sword
    ----          Hilt Patches
    --{   dependencies =  { _owo_slim_psword_g_blades, _power_sword_grips },
    --    hilt =  { offset = true, position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
    --},
    -- PSword
		--      Flat Power Sword
		--          Default
	{   dependencies =  { _owo_flat_psword_g_blades },
        shaft =         { offset = true, position = vector3_box(0, 0, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
        head =          { offset = true, position = vector3_box(0, 0, 0.012), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 1, 1)},
    },
    {   dependencies =  { _owo_flat_psword_blades },
        head =          { offset = true, position = vector3_box(0, 0, 0.012), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
    },
    --      Slim Power Sword
    --          Default
    {   dependencies =  { _owo_slim_psword_g_blades },
        shaft =         { offset = true, position = vector3_box(0, 0, 0.02), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
        head =          { offset = true, position = vector3_box(0, 0, 0.012), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.6, 0.65, 1)},
    },
    {   dependencies =  { _owo_slim_psword_blades },
        head =          { offset = true, position = vector3_box(0, 0, 0.012), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 0.65, 1)},
    },
    -- DClaw
    --      Flat DClaw
    {   dependencies =  { _owo_flat_dclaw_g_blades },
        shaft =         { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
        head =          { offset = true, position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.75, 1, 1)},
    },
    {   dependencies =  { _owo_flat_dclaw_blades },
        head =          { offset = true, position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.5, 1, 1)},
    },
    --      Slim DClaw
    {   dependencies =  { _owo_slim_dclaw_g_blades },
        shaft =         { offset = true, position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.5, 1, 1)},
        head =          { offset = true, position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.75, 0.75, 1)},
    },
    {   dependencies =  { _owo_slim_dclaw_blades },
        head =          { offset = true, position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 180), scale = vector3_box(0.5, 0.75, 1)},
    },

    -- ######
    -- Head: Tacax Spike
    -- ######
    -- Lowers it so the actual axehead is where the hammer head is usually
    {	dependencies =  { "owo_invisible_connector_01", _owo_all_tacax_spike_heads },
        head =          { offset = true, position = vector3_box(0, 0, 0.06), rotation = vector3_box(0, 0, 180), },
    },
    {	dependencies =  { _owo_all_tacax_spike_heads },
        head =          { offset = true, position = vector3_box(0, 0, 0.25), rotation = vector3_box(0, 0, 180), },
    },

    -- ######
    -- Head: Polearm heads
    -- ######
    -- Raises it so the actual axehead is where the hammer head is usually
    {	dependencies =  { "owo_invisible_connector_01", _owo_polearm_heads },
        head =          { offset = true, position = vector3_box(0, 0, 0.066), rotation = vector3_box(0, 0, 180), },
    },
    {	dependencies =  { _owo_polearm_heads },
        head =          { offset = true, position = vector3_box(0, 0, 0.29), rotation = vector3_box(0, 0, 180), },
    },
})
