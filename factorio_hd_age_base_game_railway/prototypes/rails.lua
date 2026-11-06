local base = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/"

local rail_types = {
	{ base = "straight",      variation = "",   count = 8, size = 512,  directions = 4 },
	{ base = "half-diagonal", variation = "",   count = 3, size = 768,  directions = 4 },
	{ base = "curved",        variation = "-a", count = 4, size = 1024, directions = 8 },
	{ base = "curved",        variation = "-b", count = 4, size = 1024, directions = 8 },
}

local direction = {
	"north",
	"northeast",
	"east",
	"southeast",
	"south",
	"southwest",
	"west",
	"northwest"
}

local scale_rail = 0.25

local function size_variation_exceptions(rail_type, direction, size_rail, variation_rail)
	if rail_type == "straight" and (direction == "northeast" or direction == "southeast") then
		return 768, 3
	end

	return size_rail, variation_rail
end

local function rails(rail_type, direction, size_rail, variation_rail)
	size_rail, variation_rail = size_variation_exceptions(rail_type, direction, size_rail, variation_rail)

	return {
		backplates = {
			filename = base .. "rail-backplates/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "trilinear-filtering" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
		metals = {
			filename = base .. "rail-metals/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "trilinear-filtering" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
		stone_path = {
			filename = base .. "rail-stone-path/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
		stone_path_background = {
			filename = base .. "rail-stone-path-inside/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
		ties = {
			filename = base .. "rail-ties/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		}
	}
end

local function rails_remnants(rail_type, direction, size_rail, variation_rail)
	size_rail, variation_rail = size_variation_exceptions(rail_type, direction, size_rail, variation_rail)

	return {
		backplates = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-backplates/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "trilinear-filtering" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
		metals = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-metals/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "trilinear-filtering" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
		stone_path = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-stone-path/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
		stone_path_background = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-stone-path-inside/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
		ties = {
			allow_forced_downscale = true,
			filename = base .. "remnants/rail-remnants-ties/" .. rail_type .. "-" .. direction .. ".png",
			flags = { "low-object" },
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
			usage = "rail"
		},
	}
end

for _, rail_data in ipairs(rail_types) do
	local rail_type = rail_data.base .. rail_data.variation
	local prototype_name = rail_data.base .. "-rail" .. rail_data.variation
	local rail = data.raw[prototype_name][prototype_name]
	local rail_remnants = data.raw["rail-remnants"][prototype_name .. "-remnants"]

	for d = 1, rail_data.directions do
		local direction_name = direction[d]
		rail.pictures[direction_name] = rails(rail_type, direction_name, rail_data.size, rail_data.count)
		rail_remnants.pictures[direction_name] = rails_remnants(rail_type, direction_name, rail_data.size, rail_data.count)
	end
end
