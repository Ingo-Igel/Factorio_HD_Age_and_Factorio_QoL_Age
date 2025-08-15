data:extend({
    -- Runtime settings
    {
        type = "double-setting",
        name = "visible-planets-planet-scale",
        setting_type = "runtime-global",
        default_value = 12.5,
        minimum_value = 0.0,
        order = "b[sprite]-b"
    },
    {
        type = "int-setting",
        name = "visible-planets-planet-pos-x",
        setting_type = "runtime-global",
        default_value = -108,
        order = "b[sprite]-c"
    },
    {
        type = "int-setting",
        name = "visible-planets-planet-anim-dur",
        setting_type = "runtime-global",
        default_value = 500,
        minimum_value = 1, -- Avoid division by zero
        order = "b[sprite]-f"
    },
    {
        type = "int-setting",
        name = "visible-planets-planet-angle",
        setting_type = "runtime-global",
        default_value = 345,
        minimum_value = 0,
        maximum_value = 359,
        order = "b[sprite]-g"
    },
    {
        type = "bool-setting",
        name = "visible-planets-enable-parallax",
        setting_type = "runtime-global",
        default_value = false,
        order = "c[parallax]-a"
    },
    {
        type = "double-setting",
        name = "visible-planets-parallax-factor",
        setting_type = "runtime-global",
        default_value = 1,
        minimum_value = 0.1,
        order = "c[parallax]-b"
    },
    {
        type = "bool-setting",
        name = "visible-planets-enable-rotation",
        setting_type = "runtime-global",
        default_value = true,
        order = "d[rotation]-a"
    },
    {
        type = "double-setting",
        name = "visible-planets-rotation-speed",
        setting_type = "runtime-global",
        default_value = 0.003,
        minimum_value = -180,
        maximum_value = 180,
        order = "d[rotation]-b"
    }
})