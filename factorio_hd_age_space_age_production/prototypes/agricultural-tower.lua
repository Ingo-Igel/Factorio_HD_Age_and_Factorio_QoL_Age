if not settings.startup["f_hd_a_sa_p_disable_agricultural_tower_crane"].value then
	data.raw["agricultural-tower"]["agricultural-tower"].crane.parts[1].rotated_sprite = util.sprite_load("__factorio_hd_age_space_age_production__/data/space-age/graphics/entity/agricultural-tower/agricultural-tower-crane-1", {
		priority = "very-low",
		dice = 4,
		direction_count = 128,
		scale = 0.25
	})
	data.raw["agricultural-tower"]["agricultural-tower"].crane.parts[4].rotated_sprite = util.sprite_load("__factorio_hd_age_space_age_production__/data/space-age/graphics/entity/agricultural-tower/agricultural-tower-crane-5", {
		priority = "very-low",
		direction_count = 128,
		scale = 0.25
	})
	data.raw["agricultural-tower"]["agricultural-tower"].crane.parts[6].rotated_sprite = util.sprite_load("__factorio_hd_age_space_age_production__/data/space-age/graphics/entity/agricultural-tower/agricultural-tower-crane-7", {
		priority = "very-low",
		direction_count = 128,
		scale = 0.25
	})
end