if not settings.startup["f_hd_a_bg_l_disable_transport_belt"].value then
	data.raw["transport-belt"]["transport-belt"].belt_animation_set.animation_set = {
		filename = "__factorio_hd_age_base_game_logistics__/data/base/graphics/entity/transport-belt/transport-belt.png",
		priority = "extra-high",
		size = 128*2,
		scale = 0.25,
		frame_count = 16,
		direction_count = 20
	}
end

if not settings.startup["f_hd_a_bg_l_disable_fast_transport_belt"].value then
	data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set.animation_set = {
		filename = "__factorio_hd_age_base_game_logistics__/data/base/graphics/entity/fast-transport-belt/fast-transport-belt.png",
		priority = "extra-high",
		size = 128*2,
		scale = 0.25,
		frame_count = 32,
		direction_count = 20
	}
end

if not settings.startup["f_hd_a_bg_l_disable_express_transport_belt"].value then
	data.raw["transport-belt"]["express-transport-belt"].belt_animation_set.animation_set = {
		filename = "__factorio_hd_age_base_game_logistics__/data/base/graphics/entity/express-transport-belt/express-transport-belt.png",
		priority = "extra-high",
		size = 128*2,
		scale = 0.25,
		frame_count = 32,
		direction_count = 20
	}
end