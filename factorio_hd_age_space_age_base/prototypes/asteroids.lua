local base = "__factorio_hd_age_space_age_base__/data/space-age/graphics/entity/asteroid/"

local asteroid_sizes = {
	{ name = "chunk",  graphics_scale = 0.5 * 0.5,  resolution = 2 * 50,  type = "asteroid-chunk", prefix = "",        suffix = "-chunk" },
	{ name = "small",  graphics_scale = 0.5 * 0.5,  resolution = 2 * 128, type = "asteroid",       prefix = "small-",  suffix = "" },
	{ name = "medium", graphics_scale = 0.5 * 0.5,  resolution = 2 * 230, type = "asteroid",       prefix = "medium-", suffix = "" },
	{ name = "big",    graphics_scale = 0.5 * 0.6,  resolution = 2 * 304, type = "asteroid",       prefix = "big-",    suffix = "" },
	{ name = "huge",   graphics_scale = 0.5 * 0.75, resolution = 2 * 512, type = "asteroid",       prefix = "huge-",   suffix = "" }
}

local asteroid_types = {
	{ name = "metallic",   counts = { chunk = 8, small = 8, medium = 6, big = 6, huge = 6 } },
	{ name = "carbonic",   counts = { chunk = 6, small = 6, medium = 6, big = 6, huge = 7 } },
	{ name = "oxide",      counts = { chunk = 6, small = 7, medium = 5, big = 5, huge = 7 } },
	{ name = "promethium", counts = { chunk = 6, small = 7, medium = 5, big = 5, huge = 7 } }
}

local function asteroid_variation(asteroid_data)
	for size_index, size_data in ipairs(asteroid_sizes) do
		local count = asteroid_data.counts[size_data.name]
		local prototype_name = size_data.prefix .. asteroid_data.name .. "-asteroid" .. size_data.suffix
		local variations = data.raw[size_data.type][prototype_name].graphics_set.variations
		local size_path = base .. asteroid_data.name .. "/" .. size_data.name .. "/"
		local file_base = "asteroid-" .. asteroid_data.name .. "-" .. size_data.name .. "-"
		local texture_scale = size_data.graphics_scale

		for i = 1, count do
			local variation_number = "0" .. i
			variations[i] = {
				color_texture = {
					filename = size_path .. file_base .. "colour-" .. variation_number .. ".png",
					size = size_data.resolution,
					scale = texture_scale
				},
				shadow_shift = { 0.25 * size_index, 0.25 * size_index },
				normal_map = {
					filename = size_path .. file_base .. "normal-" .. variation_number .. ".png",
					premul_alpha = false,
					size = size_data.resolution,
					scale = texture_scale
				},
				roughness_map = {
					filename = size_path .. file_base .. "roughness-" .. variation_number .. ".png",
					premul_alpha = false,
					size = size_data.resolution,
					scale = texture_scale
				}
			}
		end
	end
end

for _, asteroid_data in ipairs(asteroid_types) do
	asteroid_variation(asteroid_data)
end
