local vector3 = Vector3
local vector3_box = Vector3Box

local flashlight_templates_to_return = {}

local function generate_flashlight_template(template_name, table_of_values_to_use)
    if not table_of_values_to_use then
        mod:echo("no table of values for flashlight templates in "..template_name)
        return
    end

    if flashlight_templates_to_return[template_name] then
        mod:info(template_name.." exists in flashlight templates. overwriting >:3")
    end

    flashlight_templates_to_return[template_name] = {
        light = {
            first_person = {
                cast_shadows = true,
                color_temperature = table_of_values_to_use.color_temperature or 8000,
                ies_profile = "content/environment/ies_profiles/narrow/flashlight_custom_01",
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
                ies_profile = "content/environment/ies_profiles/narrow/flashlight_custom_01",
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

generate_flashlight_template("green_flashlight_01", {
    color_temperature = 7300,
    intensity = 6,
    color_filter = vector3_box(0, 1, 0),
    spot_angle_max_1p = 0.4,
    spot_angle_max_3p = 0.2,
    falloff_1p = 140,
    falloff_3p = 60,
})

return flashlight_templates_to_return