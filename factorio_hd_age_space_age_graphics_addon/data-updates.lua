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
	PlanetsLib:update(
		{
			{
				type = "space-location",
				name = "background-steroidbelt-2",
				starmap_icon = "__factorio_hd_age_space_age_graphics_addon__/graphics/belt.png",
				magnitude = 103
			}
		}
	)
end
