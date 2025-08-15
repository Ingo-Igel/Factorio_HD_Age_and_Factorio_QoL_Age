if not settings.startup["f_hd_a_sa_d_disable_vulcanus_chimneys"].value then
	-- CHIMNEY
	data.raw["simple-entity"]["vulcanus-chimney"].pictures.layers[1] = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/sulfuric-chimney-upper", {
		scale = 0.25,
		variation_count = 3,
		multiply_shift = 0.5,
		shift = {5, 0}
	})
	data.raw["simple-entity"]["vulcanus-chimney"].lower_pictures = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/sulfuric-chimney-lower", {
		scale = 0.25,
		variation_count = 3,
		multiply_shift = 0.5,
		shift = {5, 0}
	})

	-- CHIMNEY FADED
	data.raw["simple-entity"]["vulcanus-chimney-faded"].pictures.layers[1] = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/sulfuric-chimney-faded-upper", {
		scale = 0.25,
		variation_count = 5,
		multiply_shift = 0.5,
		shift = {5, 0}
	})
	data.raw["simple-entity"]["vulcanus-chimney-faded"].lower_pictures = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/sulfuric-chimney-faded-lower", {
		scale = 0.25,
		variation_count = 5,
		multiply_shift = 0.5,
		shift = {5, 0}
	})

	-- CHIMNEY COLD
	data.raw["simple-entity"]["vulcanus-chimney-cold"].pictures.layers[1] = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/cold-chimney-upper", {
		scale = 0.25,
		variation_count = 3,
		multiply_shift = 0.5,
		shift = {5, 0}
	})
	data.raw["simple-entity"]["vulcanus-chimney-cold"].lower_pictures = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/cold-chimney-lower", {
		scale = 0.25,
		variation_count = 3,
		multiply_shift = 0.5,
		shift = {5, 0}
	})

	-- SHORT CHIMNEY
	data.raw["simple-entity"]["vulcanus-chimney-short"].pictures.layers[1] = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/sulfuric-chimney-short-upper", {
		scale = 0.25,
		variation_count = 7
		,multiply_shift=0.5
	})
	data.raw["simple-entity"]["vulcanus-chimney-short"].lower_pictures = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/sulfuric-chimney-short-lower", {
		scale = 0.25,
		variation_count = 7
		,multiply_shift=0.5
	})

	--- TRUNCATED CHIMNEY
	data.raw["simple-entity"]["vulcanus-chimney-truncated"].pictures.layers[1] = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/sulfuric-chimney-truncated-upper", {
		scale = 0.25,
		variation_count = 6,
		multiply_shift = 0.5
	})
	data.raw["simple-entity"]["vulcanus-chimney-truncated"].lower_pictures = util.sprite_load("__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/sulfuric-chimney-truncated-lower", {
		scale = 0.25,
		variation_count = 6,
		multiply_shift = 0.5
	})
end