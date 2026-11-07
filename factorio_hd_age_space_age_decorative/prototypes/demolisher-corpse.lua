local corpse_sprites = {
	{ name = "small-demolisher-corpse",  scale = 0.25 },
	{ name = "medium-demolisher-corpse", scale = 0.375 },
	{ name = "big-demolisher-corpse",    scale = 0.5 }
}

local sprite_path = "__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/demolisher-corpse/demolisher-corpse"

for _, corpse in ipairs(corpse_sprites) do
	data.raw["simple-entity"][corpse.name].pictures.layers[1] =
		util.sprite_load(sprite_path, {
			scale = corpse.scale,
			variation_count = 15,
			multiply_shift = 1
		})
end
