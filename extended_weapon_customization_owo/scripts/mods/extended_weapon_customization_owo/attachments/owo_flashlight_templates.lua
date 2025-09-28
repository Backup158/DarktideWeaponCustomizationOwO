local vector3 = Vector3
local vector3_box = Vector3Box

return {
    green_flashlight_01 = {
        light = {
            first_person = {
                cast_shadows = true,
                color_temperature = 5000,
                ies_profile = "content/environment/ies_profiles/narrow/flashlight_custom_01",
                intensity = 6,
                spot_reflector = false,
                volumetric_intensity = 0.1,
                color_filter = vector3_box(0, 1, 0),
                spot_angle = {
                    max = 0.4,
                    min = 0,
                },
                falloff = {
                    far = 140,
                    near = 0,
                },
            },
            third_person = {
                cast_shadows = true,
                color_temperature = 5000,
                ies_profile = "content/environment/ies_profiles/narrow/flashlight_custom_01",
                intensity = 6,
                spot_reflector = false,
                volumetric_intensity = 0.6,
                color_filter = vector3_box(0, 1, 0),
                spot_angle = {
                    max = 0.2,
                    min = 0,
                },
                falloff = {
                    far = 60,
                    near = 0,
                },
            },
        },
        flicker = "default_flicker"
    }
}