data:extend({
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
        default_value = 5,
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

if mods["PlanetsLib"] then
    data:extend({
        {
            type = "double-setting",
            name = "vp-scale-min-moon",
            setting_type = "startup",
            default_value = 0.05,
            minimum_value = 0.01,
            maximum_value = 1
        },
        {
            type = "double-setting",
            name = "vp-scale-max-moon",
            setting_type = "startup",
            default_value = 2.5,
            minimum_value = 1,
            maximum_value = 5
        },
    })
end