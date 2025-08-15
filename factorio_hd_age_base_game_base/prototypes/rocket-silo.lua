if not settings.startup["f_hd_a_bg_b_disable_arms_right"].value then
	data.raw["rocket-silo"]["rocket-silo"].arm_02_right_animation = {
		filename = "__factorio_hd_age_base_game_base__/data/base/graphics/entity/rocket-silo/08-rocket-silo-arms-right.png",
		priority = "medium",
		width = 182*2,
		height = 188*2,
		frame_count = 32,
		line_length = 16,
		animation_speed = 0.3,
		shift = util.by_pixel(101, -38),
		scale = 0.25
	}
end