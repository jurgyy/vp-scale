data:extend({
    {
        type = "int-setting",
        name = "vp-scale-nauvis-size",
        setting_type = "startup",
        default_value = 600,
        minimum_value = 50,
        maximum_value = 5000
    },
    {
        type = "double-setting",
        name = "vp-scale-min",
        setting_type = "startup",
        default_value = 0.1,
        minimum_value = 0.1,
        maximum_value = 20
    },
    {
        type = "double-setting",
        name = "vp-scale-max",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 0.1,
        maximum_value = 20
    },
    {
        type = "bool-setting",
        name = "vp-scale-enable-rotation-multiplier",
        setting_type = "startup",
        default_value = true
    }
})