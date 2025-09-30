local mod = get_mod("extended_weapon_customization_owo")

local vector3 = Vector3
local vector3_box = Vector3Box
local tostring = tostring

local flashlight_templates_to_return = {}

-- Helper to convert rgb from 255 scale to 1 scale
local function convert_255_rgb_to_percent_decimal(r, g, b)
    return r/255, g/255, b/255
end

mod.flashlight_colors = {
    green = vector3_box(0, 1, 0),
    red = vector3_box(1, 0, 0),
    blue = vector3_box(0, 0, 1),
    magenta = vector3_box(1, 0, 1),
    cyan = vector3_box(0, 1, 1),
    yellow = vector3_box(1, 1, 0),
    pink = vector3_box(1, 0.5, 1),
    andy = vector3_box(convert_255_rgb_to_percent_decimal(137, 235, 136))
    leyley = vector3_box(convert_255_rgb_to_percent_decimal(223, 127, 190))
    -- black = vector3_box(1, 1, 1), -- just becomes white
}
local flashlight_colors = mod.flashlight_colors

local function generate_flashlight_template(template_name, table_of_values_to_use)
    if not table_of_values_to_use then
        mod:error("no table of values for flashlight templates in "..template_name)
        return
    end

    if flashlight_templates_to_return[template_name] then
        mod:info(template_name.." exists in flashlight templates. overwriting >:3")
    end

    -- fallback to default template in `scripts/settings/equipment/flashlight_templates.lua`
    flashlight_templates_to_return[template_name] = {
        light = {
            first_person = {
                cast_shadows = true,
                color_temperature = table_of_values_to_use.color_temperature or 8000,
                ies_profile = table_of_values_to_use.ies_profile or "content/environment/ies_profiles/narrow/flashlight_custom_01",
                intensity = table_of_values_to_use.intensity or 12,
                spot_reflector = false,
                volumetric_intensity = 0.1,
                color_filter = table_of_values_to_use.color_filter or vector3_box(0, 0, 0),
                spot_angle = {
                    max = table_of_values_to_use.spot_angle_max_1p or 1.1,
                    min = 0,
                },
                falloff = {
                    far = table_of_values_to_use.falloff_1p or 70,
                    near = 0,
                },
            },
            third_person = {
                cast_shadows = true,
                color_temperature = table_of_values_to_use.color_temperature or 8000,
                ies_profile = table_of_values_to_use.ies_profile or "content/environment/ies_profiles/narrow/flashlight_custom_01",
                intensity = table_of_values_to_use.intensity or 12,
                spot_reflector = false,
                volumetric_intensity = 0.6,
                color_filter = table_of_values_to_use.color_filter or vector3_box(0, 0, 0),
                spot_angle = {
                    max = table_of_values_to_use.spot_angle_max_3p or 0.8,
                    min = 0,
                },
                falloff = {
                    far = table_of_values_to_use.falloff_3p or 30,
                    near = 0,
                },
            },
        },
        flicker = table_of_values_to_use.flicker or "default_flicker"
    }
end

local function generate_different_beams_for_color(color_to_use, given_color_vector)
    -- allows a custom given color, but it'd prob be better to just insert that into the table on top, since that'd get automated in owo_flashlight.lua
    local color_filter_from_table = given_color_vector or flashlight_colors[color_to_use]

    -- Narrow high beam, fits around a reflex sight at ~20m
    generate_flashlight_template("owo_"..color_to_use.."_flashlight_narrow", {
        color_temperature = 7300,
        intensity = 6,
        color_filter = color_filter_from_table,
        spot_angle_max_1p = 0.4,
        spot_angle_max_3p = 0.2,
        falloff_1p = 140,
        falloff_3p = 60,
    })
    -- Narrow high beam, but cooler temperature
    generate_flashlight_template("owo_"..color_to_use.."_flashlight_narrow_cool", {
        color_temperature = 4000,
        intensity = 6,
        color_filter = color_filter_from_table,
        spot_angle_max_1p = 0.4,
        spot_angle_max_3p = 0.2,
        falloff_1p = 140,
        falloff_3p = 60,
    })
    -- Weaker flashlight
    generate_flashlight_template("owo_"..color_to_use.."_flashlight_weak", {
        color_temperature = 5500,
        intensity = 2,
        color_filter = color_filter_from_table,
        spot_angle_max_1p = 0.6,
        spot_angle_max_3p = 0.3,
        falloff_1p = 100,
        falloff_3p = 45,
    })
    -- default
    generate_flashlight_template("owo_"..color_to_use.."_flashlight_default", {
        color_filter = color_filter_from_table,
    })
end

for key, _ in pairs(flashlight_colors) do
    generate_different_beams_for_color(key)
end

return flashlight_templates_to_return