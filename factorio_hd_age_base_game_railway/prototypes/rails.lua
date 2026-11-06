local base = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/"

local rail_types = {
	{ type = "straight",      suffix = "",   variations = 8, size = 512,  directions = 4 },
	{ type = "half-diagonal", suffix = "",   variations = 3, size = 768,  directions = 4 },
	{ type = "curved",        suffix = "-a", variations = 4, size = 1024, directions = 8 },
	{ type = "curved",        suffix = "-b", variations = 4, size = 1024, directions = 8 },
}

local directions = {
	"north",
	"northeast",
	"east",
	"southeast",
	"south",
	"southwest",
	"west",
	"northwest"
}

local rail_scale = 0.25

local function size_variation_exceptions(rail_type, direction, rail_size, rail_variations)
	if rail_type == "straight" and (direction == "northeast" or direction == "southeast") then
		return 768, 3
	end

	return rail_size, rail_variations
end

local function rails(rail_type, direction, rail_size, rail_variations)
	rail_size, rail_variations = size_variation_exceptions(rail_type, direction, rail_size, rail_variations)

	return {
		backplates = {
			filename = base .. "rail-backplates/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "trilinear-filtering" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
		metals = {
			filename = base .. "rail-metals/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "trilinear-filtering" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
		stone_path = {
			filename = base .. "rail-stone-path/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
		stone_path_background = {
			filename = base .. "rail-stone-path-inside/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
		ties = {
			filename = base .. "rail-ties/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		}
	}
end

local function rails_remnants(rail_type, direction, rail_size, rail_variations)
	rail_size, rail_variations = size_variation_exceptions(rail_type, direction, rail_size, rail_variations)

	return {
		backplates = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-backplates/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "trilinear-filtering" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
		metals = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-metals/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "trilinear-filtering" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
		stone_path = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-stone-path/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
		stone_path_background = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-stone-path-inside/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
		ties = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-ties/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = rail_size,
			scale = rail_scale,
			variation_count = rail_variations,
			usage = "rail"
		},
	}
end

for _, rail_data in ipairs(rail_types) do
	local rail_type = rail_data.type .. rail_data.suffix
	local prototype_name = rail_data.type .. "-rail" .. rail_data.suffix
	local rail = data.raw[prototype_name][prototype_name]
	local rail_remnants = data.raw["rail-remnants"][prototype_name .. "-remnants"]

	for d = 1, rail_data.directions do
		local direction = directions[d]
		rail.pictures[direction] = rails(rail_type, direction, rail_data.size, rail_data.variations)
		rail_remnants.pictures[direction] = rails_remnants(rail_type, direction, rail_data.size, rail_data.variations)
	end
end
