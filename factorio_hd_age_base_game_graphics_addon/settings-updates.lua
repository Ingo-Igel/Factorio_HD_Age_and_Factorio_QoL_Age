data:extend{
    {
        type = "int-setting",
        name = "tree-healing-operation-interval",
        setting_type = "startup",
        default_value = 20,
        minimum_value = 1,
        order = "a"
    },
    {
        type = "int-setting",
        name = "tree-healing-chunk-subdivisions",
        setting_type = "runtime-global",
        default_value = 4,
        minimum_value = 1,
        order = "b"
    }
}