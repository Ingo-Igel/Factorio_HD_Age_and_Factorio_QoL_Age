if not settings.startup["f_hd_a_bg_m_disable_artillery_turret"].value then
	data.raw["artillery-turret"]["artillery-turret"].cannon_barrel_pictures.layers[1] = util.sprite_load(
	"__factorio_hd_age_base_game_military__/data/base/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel", {
		dice = 4,
		priority = "very-low",
		allow_low_quality_rotation = true,
		direction_count = 256,
		scale = 0.25
	})
	data.raw["artillery-turret"]["artillery-turret"].cannon_base_pictures.layers[1] = util.sprite_load(
	"__factorio_hd_age_base_game_military__/data/base/graphics/entity/artillery-wagon/artillery-wagon-cannon-base", {
		dice = 4,
		priority = "very-low",
		allow_low_quality_rotation = true,
		direction_count = 256,
		scale = 0.25
	})
end
