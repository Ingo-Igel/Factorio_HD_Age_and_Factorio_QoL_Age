if not settings.startup["f_hd_a_sa_l_disable_turbo_transport_belt"].value then
	data.raw["transport-belt"]["turbo-transport-belt"].belt_animation_set.animation_set = util.sprite_load("__factorio_hd_age_space_age_logistics__/data/space-age/graphics/entity/turbo-transport-belt/turbo-transport-belt", {
		priority = "extra-high",
		size = 256,
		scale = 0.25,
		frame_count = 64,
		direction_count = 20
	})
end

if not settings.startup["f_hd_a_sa_l_disable_turbo_transport_belt_frozen_layer"].value then
	data.raw["transport-belt"]["turbo-transport-belt"].belt_animation_set.frozen_patch = util.sprite_load("__factorio_hd_age_space_age_logistics__/data/space-age/graphics/entity/turbo-transport-belt/turbo-transport-belt-frozen", {
		priority = "extra-high",
		size = 256,
		scale = 0.25,
		line_length = 64,
		lines_per_file = 20,
		direction_count = 20
	})
end