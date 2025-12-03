local mod = get_mod("extended_weapon_customization_owo")

local pairs = pairs
local ipairs = ipairs
local table = table
local table_clone = table.clone

local final_widgets = {}
local widgets_toggleable_to_add = {
    off = {"debug_mode", "owo_mode", "discord_mode"},
    groups = {
        on = {
            group_randomization_options = {
                "mod_option_flashlight_randomization", 
            }
        },
    },
}
-- Appends a toggleable option for a new widget
local function add_widget(location, name, truth)
    -- Write at (table size) + 1, ie inserting at the tail
    location[#location + 1] = {
        setting_id = name,
        type = "checkbox",
        default_value = truth or false,
    }
end
local function add_group_of_widgets(location, name, suboptions, truth)
    local temp_widgets = {}
    for _, subwidget in ipairs(suboptions) do
        add_widget(temp_widgets, subwidget, truth)
    end

    location[#location + 1] = {
        setting_id = name,
        type = "group",
        sub_widgets = table_clone(temp_widgets),
    }
end

-- Adds a widget for each one in the list of names
for _, name in ipairs(widgets_toggleable_to_add.off) do
    add_widget(final_widgets, name, false)
end
for group_name, suboptions in pairs(widgets_toggleable_to_add.groups.on) do
    add_group_of_widgets(final_widgets, group_name, suboptions, true)
end

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = final_widgets
	}
}
