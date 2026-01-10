if mods["PlanetsLib"] then
	PlanetsLib:extend({
		{
			type = "space-location",
			name = "shattered-planet_Big",
			orbit = {
				parent = {
					type = "space-location",
					name = "shattered-planet"
				},
				distance = 0,
				orientation = 0,
				sprite = {
					type = "sprite",
					filename = "__factorio_hd_age_space_age_graphics_addon__/graphics/shattered-planet.png",
					size = 960,
					scale = 0.4,
				}
			},
			sprite_only = true
		},
			{
			type = "space-location",
			name = "asteroid_belt_1",
			orbit = {
				parent = {
					type = "space-location",
					name = "star"
				},
				distance = 0,
				orientation = 0,
				sprite = {
					type = "sprite",
					filename = "__custom-space-map__/graphics/starmap/Starmap_Solar_System_05.png",
					size = 2436,
					scale = 1,
				}
			},
			sprite_only = true
		},
			{
			type = "space-location",
			name = "asteroid_belt_2",
			orbit = {
				parent = {
					type = "space-location",
					name = "star"
				},
				distance = 0,
				orientation = 0,
				sprite = {
					type = "sprite",
					filename = "__custom-space-map__/graphics/starmap/Starmap_Solar_System_06.png",
					size = 2436,
					scale = 1.5
				}
			},
			sprite_only = true
		}
	})

else
	data.raw["utility-sprites"]["default"]["starmap_star"].layers[19].scale = 1
	data.raw["utility-sprites"]["default"]["starmap_star"].layers[20].scale = 1.5
	data.raw["utility-sprites"]["default"]["starmap_star"].layers[21] = {
		filename = "__factorio_hd_age_space_age_graphics_addon__/graphics/shattered-planet.png",
		size = 960,
		scale = 0.4,
		shift = { 2565, 10 }
	}
end