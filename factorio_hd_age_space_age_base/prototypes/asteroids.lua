local base = "__factorio_hd_age_space_age_base__/data/space-age/graphics/entity/asteroid/"

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

local function asteroid_variation(asteroid_type, count_array)
	for size = 1, 5 do
		count = count_array[size]
		local front = ""
		local back = ""
		if size == 1 then
			back = "-" .. asteroid_sizes[size]
		else
			front = asteroid_sizes[size] .. "-"
		end
		for i = 1, count do
			data.raw["asteroid" .. back][front .. asteroid_type .. "-asteroid" .. back].graphics_set.variations[i] = {
				color_texture = {
					filename = base .. asteroid_type .. "/" .. asteroid_sizes[size] .. "/" .. "asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-colour-" .. "0" .. i .. ".png",
					size = sizes_resolution[size],
					scale = graphics_scale[size] * 0.5
				},
				shadow_shift = { 0.25 * size, 0.25 * size },
				normal_map = {
					filename = base .. asteroid_type .. "/" .. asteroid_sizes[size] .. "/" .. "asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-normal-" .. "0" .. i .. ".png",
					premul_alpha = false,
					size = sizes_resolution[size],
					scale = graphics_scale[size] * 0.5
				},
				roughness_map = {
					filename = base .. asteroid_type .. "/" .. asteroid_sizes[size] .. "/" .. "asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-roughness-" .. "0" .. i .. ".png",
					premul_alpha = false,
					size = sizes_resolution[size],
					scale = graphics_scale[size] * 0.5
				}
			}
		end
	end
end

asteroid_variation("metallic", { 8, 8, 6, 6, 6 })
asteroid_variation("carbonic", { 6, 6, 6, 6, 7 })
asteroid_variation("oxide", { 6, 7, 5, 5, 7 })
asteroid_variation("promethium", { 6, 7, 5, 5, 7 })
