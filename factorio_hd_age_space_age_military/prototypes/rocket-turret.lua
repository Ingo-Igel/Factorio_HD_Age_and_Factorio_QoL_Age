if not settings.startup["f_hd_a_sa_m_disable_rocket_turret_shooting_animation"].value then
	local rocket_turret = data.raw["ammo-turret"]["rocket-turret"]
	local temp_rocket_turret = {
		layers = {
			util.sprite_load("__factorio_hd_age_space_age_military__/data/space-age/graphics/entity/rocket-turret/rocket-turret-shooting", {
				slice = 1,
				direction_count = 64,
				shift = util.by_pixel( 0.0, -20.0),
				scale = 0.25
			}),
			util.sprite_load("__factorio_hd_age_space_age_military__/data/space-age/graphics/entity/rocket-turret/rocket-turret-shooting-mask", {
				flags = {"mask"},
				apply_runtime_tint = true,
				slice = 1,
				direction_count = 64,
				shift = util.by_pixel( 0.0, -20.0),
				scale = 0.25
			})
		}
	}
	rocket_turret.prepared_animation = temp_rocket_turret
	rocket_turret.attacking_animation = temp_rocket_turret
end