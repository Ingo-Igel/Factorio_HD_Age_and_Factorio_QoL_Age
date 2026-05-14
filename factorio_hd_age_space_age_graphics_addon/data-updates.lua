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
		}		
	})
		if settings.startup["asteroid-belt-2-enabled"].value then
		PlanetsLib:update({{
			type = "space-location",
			name = "background-steroidbelt-2",
			starmap_icon = "__factorio_hd_age_space_age_graphics_addon__/graphics/belt.png",
			magnitude = 103
		}})
	end
else
	local last_layer = 19
	if settings.startup["asteroid-belt-1-enabled"].value and settings.startup["asteroid-belt-1-enabled"].value then
		last_layer = 21
	elseif settings.startup["asteroid-belt-1-enabled"].value or settings.startup["asteroid-belt-1-enabled"].value then
		last_layer = 20
	end

	if settings.startup["asteroid-belt-1-enabled"].value then
		data.raw["utility-sprites"]["default"]["starmap_star"].layers[19].scale = 1.08
	end
	if settings.startup["asteroid-belt-1-enabled"].value then
		data.raw["utility-sprites"]["default"]["starmap_star"].layers[20].filename = "__factorio_hd_age_space_age_graphics_addon__/graphics/belt.png"
		data.raw["utility-sprites"]["default"]["starmap_star"].layers[20].scale = 1.6
	end
	data.raw["utility-sprites"]["default"]["starmap_star"].layers[last_layer] = {
		filename = "__factorio_hd_age_space_age_graphics_addon__/graphics/shattered-planet.png",
		size = 960,
		scale = 0.4,
		shift = { 2565, 10 }
	}
end