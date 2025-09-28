return {
    owo_green_flashlight = {
        light = {
            first_person = {
                cast_shadows = true,
                color_temperature = 5000,
                ies_profile = "content/environment/ies_profiles/narrow/flashlight_custom_02",
                intensity = 12,
                spot_reflector = false,
                volumetric_intensity = 0.1,
                spot_angle = {
                    max = 1.1,
                    min = 0,
                },
                falloff = {
                    far = 70,
                    near = 0,
                },
            },
            third_person = {
                cast_shadows = true,
                color_temperature = 5000,
                ies_profile = "content/environment/ies_profiles/narrow/flashlight_custom_02",
                intensity = 12,
                spot_reflector = false,
                volumetric_intensity = 0.6,
                spot_angle = {
                    max = 0.8,
                    min = 0,
                },
                falloff = {
                    far = 30,
                    near = 0,
                },
            },
        },
        flicker = "default_flicker"
    }
}