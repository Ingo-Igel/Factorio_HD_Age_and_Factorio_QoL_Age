if not settings.startup["f_hd_a_sa_p_disable_electromagnetic_plant_rotate"].value then
	data.raw["assembling-machine"]["electromagnetic-plant"].graphics_set.working_visualisations[3].animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_production__/data/space-age/graphics/entity/electromagnetic-plant/electromagnetic-plant-main-rotate", {
		animation_speed = 0.4,
		frame_count = 111,
		scale = 0.25
	})
	data.raw["assembling-machine"]["electromagnetic-plant"].graphics_set.working_visualisations[7].animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_production__/data/space-age/graphics/entity/electromagnetic-plant/electromagnetic-plant-lights-rotate", {
		draw_as_glow = true,
		blend_mode = "additive",
		animation_speed = 0.4,
		frame_count = 111,
		scale = 0.25
	})
end