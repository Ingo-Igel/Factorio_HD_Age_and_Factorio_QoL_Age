if not settings.startup["f_hd_a_bg_m_disable_artillery_wagon"].value then
	data.raw["artillery-wagon"]["artillery-wagon"].pictures.rotated.layers[1] = util.sprite_load("__factorio_hd_age_base_game_military__/data/base/graphics/entity/artillery-wagon/artillery-wagon-base", {
		dice = 4,
		priority = "very-low",
		allow_low_quality_rotation = true,
		direction_count = 256,
		scale = 0.25,
		usage = "train"
	})
	data.raw["artillery-wagon"]["artillery-wagon"].cannon_barrel_pictures.rotated.layers[1] = util.sprite_load("__factorio_hd_age_base_game_military__/data/base/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel", {
		priority = "very-low",
		allow_low_quality_rotation = true,
		direction_count = 256,
		scale = 0.25,
		usage = "train"
	})
	data.raw["artillery-wagon"]["artillery-wagon"].cannon_base_pictures.rotated.layers[1] = util.sprite_load("__factorio_hd_age_base_game_military__/data/base/graphics/entity/artillery-wagon/artillery-wagon-cannon-base", {
		priority = "very-low",
		allow_low_quality_rotation = true,
		direction_count = 256,
		scale = 0.25,
		usage = "train"
	})
end