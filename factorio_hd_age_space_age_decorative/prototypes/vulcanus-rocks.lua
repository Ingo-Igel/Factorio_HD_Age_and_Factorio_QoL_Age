local base = "__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-rocks/"

local function load_rock_sprite(name, variation_count)
    return util.sprite_load(base .. name, {
        scale = 0.25,
        variation_count = variation_count,
        multiply_shift = 0.5,
    })
end

data.raw["optimized-decorative"]["medium-volcanic-rock"].pictures.layers = {
    load_rock_sprite("vulcanus-rock-medium", 16),
}

data.raw["simple-entity"]["huge-volcanic-rock"].pictures.layers = {
    load_rock_sprite("vulcanus-rock-huge", 15),
}

data.raw["simple-entity"]["huge-volcanic-rock-hot"].pictures.layers = {
    load_rock_sprite("vulcanus-rock-huge", 15),
    load_rock_sprite("vulcanus-rock-huge-emissive", 15),
}

data.raw["simple-entity"]["big-volcanic-rock"].pictures.layers = {
    load_rock_sprite("vulcanus-rock-big", 16),
}

data.raw["simple-entity"]["big-volcanic-rock-hot"].pictures.layers = {
    load_rock_sprite("vulcanus-rock-big", 16),
    load_rock_sprite("vulcanus-rock-big-emissive", 16),
}
