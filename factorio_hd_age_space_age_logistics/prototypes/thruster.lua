if not settings.startup["f_hd_a_sa_l_disable_thruster"].value then
	data.raw["thruster"]["thruster"].graphics_set.animation = util.sprite_load("__factorio_hd_age_space_age_logistics__/data/space-age/graphics/entity/thruster/thruster", {
		animation_speed = 0.5,
		frame_count = 64,
		scale = 0.25,
		shift = {0,3}
	})
end

if not settings.startup["f_hd_a_sa_l_disable_thruster_light_layer"].value then
	data.raw["thruster"]["thruster"].graphics_set.working_visualisations[5].animation = util.sprite_load("__factorio_hd_age_space_age_logistics__/data/space-age/graphics/entity/thruster/thruster-light", {
		animation_speed = 0.5,
		frame_count = 64,
		blend_mode = "additive",
		draw_as_glow = true,
		scale = 0.25,
		shift = {0,3}
	})
end