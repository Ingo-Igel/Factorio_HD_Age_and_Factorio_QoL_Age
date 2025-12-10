local graphics_scale = {
	0.5, -- chunk
	0.5, -- small
	0.5, -- medium
	0.6, -- big
	0.75 -- huge
}

local sizes_resolution = {
	50 * 2, -- chunk
	128 * 2, -- small
	230 * 2, -- medium
	304 * 2, -- big
	512 * 2 -- huge
}

local asteroid_sizes = {
	"chunk",
	"small",
	"medium",
	"big",
	"huge"
}

local function asteroid_variation(asteroid_type, suffix, size)
	return {
		color_texture = {
			filename = "__factorio_hd_age_space_age_base__/data/space-age/graphics/entity/asteroid/" ..
			asteroid_type ..
			"/" ..
			asteroid_sizes[size] ..
			"/" .. "asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-colour-" .. suffix .. ".png",
			size = sizes_resolution[size],
			scale = graphics_scale[size] * 0.5
		},
		shadow_shift = { 0.25 * size, 0.25 * size },
		normal_map = {
			filename = "__factorio_hd_age_space_age_base__/data/space-age/graphics/entity/asteroid/" ..
			asteroid_type ..
			"/" ..
			asteroid_sizes[size] ..
			"/" .. "asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-normal-" .. suffix .. ".png",
			premul_alpha = false,
			size = sizes_resolution[size],
			scale = graphics_scale[size] * 0.5
		},
		roughness_map = {
			filename = "__factorio_hd_age_space_age_base__/data/space-age/graphics/entity/asteroid/" ..
			asteroid_type ..
			"/" ..
			asteroid_sizes[size] ..
			"/" .. "asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-roughness-" .. suffix .. ".png",
			premul_alpha = false,
			size = sizes_resolution[size],
			scale = graphics_scale[size] * 0.5
		}
	}
end

-- matallic
for count = 1, 8 do
	data.raw["asteroid-chunk"]["metallic-asteroid-chunk"].graphics_set.variations[count] = asteroid_variation("metallic",
		"0" .. count, 1)
end
for count = 1, 8 do
	data.raw["asteroid"]["small-metallic-asteroid"].graphics_set.variations[count] = asteroid_variation("metallic",
		"0" .. count, 2)
end
for count = 1, 6 do
	data.raw["asteroid"]["medium-metallic-asteroid"].graphics_set.variations[count] = asteroid_variation("metallic",
		"0" .. count, 3)
end
for count = 1, 6 do
	data.raw["asteroid"]["big-metallic-asteroid"].graphics_set.variations[count] = asteroid_variation("metallic",
		"0" .. count, 4)
end
for count = 1, 6 do
	data.raw["asteroid"]["huge-metallic-asteroid"].graphics_set.variations[count] = asteroid_variation("metallic",
		"0" .. count, 5)
end

-- carbonic
for count = 1, 7 do
	data.raw["asteroid-chunk"]["carbonic-asteroid-chunk"].graphics_set.variations[count] = asteroid_variation("carbonic",
		"0" .. count, 1)
end
for count = 1, 6 do
	data.raw["asteroid"]["small-carbonic-asteroid"].graphics_set.variations[count] = asteroid_variation("carbonic",
		"0" .. count, 2)
end
for count = 1, 6 do
	data.raw["asteroid"]["medium-carbonic-asteroid"].graphics_set.variations[count] = asteroid_variation("carbonic",
		"0" .. count, 3)
end
for count = 1, 6 do
	data.raw["asteroid"]["big-carbonic-asteroid"].graphics_set.variations[count] = asteroid_variation("carbonic",
		"0" .. count, 4)
end
for count = 1, 7 do
	data.raw["asteroid"]["huge-carbonic-asteroid"].graphics_set.variations[count] = asteroid_variation("carbonic",
		"0" .. count, 5)
end

-- oxide
for count = 1, 6 do
	data.raw["asteroid-chunk"]["oxide-asteroid-chunk"].graphics_set.variations[count] = asteroid_variation("oxide",
		"0" .. count, 1)
end
for count = 1, 7 do
	data.raw["asteroid"]["small-oxide-asteroid"].graphics_set.variations[count] = asteroid_variation("oxide",
		"0" .. count, 2)
end
for count = 1, 5 do
	data.raw["asteroid"]["medium-oxide-asteroid"].graphics_set.variations[count] = asteroid_variation("oxide",
		"0" .. count, 3)
end
for count = 1, 5 do
	data.raw["asteroid"]["big-oxide-asteroid"].graphics_set.variations[count] = asteroid_variation("oxide", "0" .. count,
		4)
end
for count = 1, 7 do
	data.raw["asteroid"]["huge-oxide-asteroid"].graphics_set.variations[count] = asteroid_variation("oxide", "0" .. count,
		5)
end

-- promethium
for count = 1, 6 do
	data.raw["asteroid-chunk"]["promethium-asteroid-chunk"].graphics_set.variations[count] = asteroid_variation(
	"promethium", "0" .. count, 1)
end
for count = 1, 7 do
	data.raw["asteroid"]["small-promethium-asteroid"].graphics_set.variations[count] = asteroid_variation("promethium",
		"0" .. count, 2)
end
for count = 1, 5 do
	data.raw["asteroid"]["medium-promethium-asteroid"].graphics_set.variations[count] = asteroid_variation("promethium",
		"0" .. count, 3)
end
for count = 1, 5 do
	data.raw["asteroid"]["big-promethium-asteroid"].graphics_set.variations[count] = asteroid_variation("promethium",
		"0" .. count, 4)
end
for count = 1, 7 do
	data.raw["asteroid"]["huge-promethium-asteroid"].graphics_set.variations[count] = asteroid_variation("promethium",
		"0" .. count, 5)
end
