if not settings.startup["f_hd_a_sa_p_disable_foundry"].value then
	data.raw["assembling-machine"]["foundry"].graphics_set.animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_production__/data/space-age/graphics/entity/foundry/foundry-main", {
		animation_speed = 0.16,
		frame_count = 128,
		scale = 0.25
	})
	data.raw["assembling-machine"]["foundry"].graphics_set.working_visualisations[3].animation = util.sprite_load("__factorio_hd_age_space_age_production__/data/space-age/graphics/entity/foundry/foundry-working", {
		animation_speed = 0.16,
		frame_count = 128,
		scale = 0.25
	})
	data.raw["assembling-machine"]["foundry"].graphics_set.working_visualisations[4].animation = util.sprite_load("__factorio_hd_age_space_age_production__/data/space-age/graphics/entity/foundry/foundry-lights", {
		draw_as_glow = true,
		animation_speed = 0.16,
		frame_count = 128,
		blend_mode = "additive",
		scale = 0.25
	})
end