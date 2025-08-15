local standard_train_wheels = {
	rotated = util.sprite_load("__factorio_hd_age_base_game_railway__/data/base/graphics/entity/train-wheel/train-wheel", {
		priority = "very-low",
		direction_count = 256,
		scale = 0.25,
		shift = util.by_pixel(0, 8),
		usage = "train"
	})
}

if not settings.startup["f_hd_a_bg_r_disable_artillery_wagon_wheels"].value then
	data.raw["artillery-wagon"]["artillery-wagon"].wheels = standard_train_wheels
end

if not settings.startup["f_hd_a_bg_r_disable_locomotive"].value then
	data.raw["locomotive"]["locomotive"].pictures.rotated.layers[1] = util.sprite_load("__factorio_hd_age_base_game_railway__/data/base/graphics/entity/locomotive/locomotive", {
		dice = 4,
		priority = "very-low",
		allow_low_quality_rotation = true,
		direction_count = 256,
		scale = 0.25,
		usage = "train"
	})
	if not settings.startup["f_hd_a_bg_r_disable_locomotive_tint"].value then
		data.raw["locomotive"]["locomotive"].pictures.rotated.layers[2] = util.sprite_load("__factorio_hd_age_base_game_railway__/data/base/graphics/entity/locomotive/locomotive-mask", {
			dice = 4,
			priority = "very-low",
			flags = { "mask" },
			apply_runtime_tint = true,
			tint_as_overlay = true,
			allow_low_quality_rotation = true,
			direction_count = 256,
			scale = 0.25,
			usage = "train"
		})
	end
	data.raw["locomotive"]["locomotive"].front_light_pictures.rotated.layers[1] = util.sprite_load("__factorio_hd_age_base_game_railway__/data/base/graphics/entity/locomotive/locomotive-lights", {
		dice = 4,
		priority = "very-low",
		blend_mode = "additive",
		draw_as_light = true,
		allow_low_quality_rotation = true,
		direction_count = 256,
		scale = 0.25
	})
	data.raw["locomotive"]["locomotive"].wheels = standard_train_wheels
end

if not settings.startup["f_hd_a_bg_r_disable_cargo_wagon"].value then
	data.raw["cargo-wagon"]["cargo-wagon"].pictures.rotated.layers[1] = util.sprite_load("__factorio_hd_age_base_game_railway__/data/base/graphics/entity/cargo-wagon/cargo-wagon", {
		dice = 4,
		priority = "very-low",
		allow_low_quality_rotation = true,
		back_equals_front = true,
		direction_count = 128,
		scale = 0.25,
		usage = "train"
	})
	if not settings.startup["f_hd_a_bg_r_disable_cargo_wagon_tint"].value then
		data.raw["cargo-wagon"]["cargo-wagon"].pictures.rotated.layers[2] = util.sprite_load("__factorio_hd_age_base_game_railway__/data/base/graphics/entity/cargo-wagon/cargo-wagon-mask", {
			dice = 4,
			priority = "very-low",
			allow_low_quality_rotation = true,
			back_equals_front = true,
			flags = { "mask" },
			apply_runtime_tint = true,
			tint_as_overlay = true,
			direction_count = 128,
			scale = 0.25,
			usage = "train"
		})
	end
	data.raw["cargo-wagon"]["cargo-wagon"].wheels = standard_train_wheels
end

if not settings.startup["f_hd_a_bg_r_disable_fluid_wagon"].value then
	data.raw["fluid-wagon"]["fluid-wagon"].pictures.rotated.layers[1] = util.sprite_load("__factorio_hd_age_base_game_railway__/data/base/graphics/entity/fluid-wagon/fluid-wagon", {
	dice = 4,
	priority = "very-low",
	allow_low_quality_rotation = true,
	back_equals_front = true,
	direction_count = 128,
	scale = 0.25,
	usage = "train"
	})
	data.raw["fluid-wagon"]["fluid-wagon"].wheels = standard_train_wheels
end