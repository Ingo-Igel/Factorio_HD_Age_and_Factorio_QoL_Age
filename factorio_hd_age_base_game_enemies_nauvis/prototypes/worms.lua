if not settings.startup["f_hd_a_bg_en_disable_worms"].value then
	local worm_size = {
		"small",
		"medium",
		"big",
		"behemoth"
	}

	local worm_scale = {
		0.65,
		0.83,
		1.0,
		1.2
	}

	local worm_tint = {
		{ 0.7,  1,    0.3,  0.5 },
		{ 0.9,  0.15, 0.3,  1 },
		{ 0.34, 0.68, 0.90, 0.8 },
		{ 0.3,  1,    0,    0.8 }
	}

	local start_attack_frame_sequence = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
	local end_attack_frame_sequence = { 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 }

	for n = 1, 4 do
		data.raw["turret"][worm_size[n] .. "-worm-turret"].starting_attack_animation.layers[1] = util.sprite_load(
		"__factorio_hd_age_base_game_enemies_nauvis__/data/base/graphics/entity/worm/worm-attack", {
			slice = 4,
			frame_count = 10,
			direction_count = 16,
			scale = worm_scale[n] * 0.25,
			frame_sequence = start_attack_frame_sequence,
			multiply_shift = worm_scale[n],
			allow_forced_downscale = true,
			surface = "nauvis",
			usage = "enemy"
		})
		data.raw["turret"][worm_size[n] .. "-worm-turret"].starting_attack_animation.layers[2] = util.sprite_load(
		"__factorio_hd_age_base_game_enemies_nauvis__/data/base/graphics/entity/worm/worm-attack-mask", {
			slice = 4,
			frame_count = 10,
			direction_count = 16,
			scale = worm_scale[n] * 0.25,
			frame_sequence = start_attack_frame_sequence,
			tint = worm_tint[n],
			multiply_shift = worm_scale[n],
			allow_forced_downscale = true,
			surface = "nauvis",
			usage = "enemy"
		})

		data.raw["turret"][worm_size[n] .. "-worm-turret"].ending_attack_animation.layers[1] = util.sprite_load(
		"__factorio_hd_age_base_game_enemies_nauvis__/data/base/graphics/entity/worm/worm-attack", {
			slice = 4,
			frame_count = 10,
			direction_count = 16,
			scale = worm_scale[n] * 0.25,
			frame_sequence = end_attack_frame_sequence,
			multiply_shift = worm_scale[n],
			allow_forced_downscale = true,
			surface = "nauvis",
			usage = "enemy"
		})
		data.raw["turret"][worm_size[n] .. "-worm-turret"].ending_attack_animation.layers[2] = util.sprite_load(
		"__factorio_hd_age_base_game_enemies_nauvis__/data/base/graphics/entity/worm/worm-attack-mask", {
			slice = 4,
			frame_count = 10,
			direction_count = 16,
			scale = worm_scale[n] * 0.25,
			frame_sequence = end_attack_frame_sequence,
			tint = worm_tint[n],
			multiply_shift = worm_scale[n],
			allow_forced_downscale = true,
			surface = "nauvis",
			usage = "enemy"
		})
	end
end
