local rail_type0 = {
	"straight",
	"half-diagonal",
	"curved",
	"curved",
}

local variation = {
	"",
	"",
	"-a",
	"-b",
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

local variation_rails = {
	8,
	3,
	4,
	4
}

local size_rails = {
	512,
	768,
	1024,
	1024
}

local scale_rail = 0.25

local function rails(rail_type, direction, size_rail, variation_rail)
	if ((rail_type == "straight") and ((direction == "northeast") or (direction == "southeast"))) then
		size_rail = 768
		variation_rail = 3
	end

	return {
		metals = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/rail-metals/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		},
		backplates = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/rail-backplates/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		},
		ties = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/rail-ties/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		},
		stone_path = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/rail-stone-path/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		},
		stone_path_background = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/rail-stone-path-inside/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		}
	}
end

local function rails_remnants(rail_type, direction, size_rail, variation_rail)
	if ((rail_type == "straight") and ((direction == "northeast") or (direction == "southeast"))) then
		size_rail = 768
		variation_rail = 3
	end

	return {
		metals = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/remnants/rail-remnants-metals/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		},
		backplates = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/remnants/rail-remnants-backplates/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		},
		ties = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/remnants/rail-remnants-ties/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		},
		stone_path = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/remnants/rail-remnants-stone-path/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		},
		stone_path_background = {
			filename = "__factorio_hd_age_base_game_railway__/data/base/graphics/entity/rails/rail/remnants/rail-remnants-stone-path-inside/" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			variation_count = variation_rail,
		}
	}
end

for rt = 1, 4 do
	local rail_type = rail_type0[rt] .. variation[rt]
	local rail = data.raw[rail_type0[rt] .. "-rail" .. variation[rt]][rail_type0[rt] .. "-rail" .. variation[rt]]
	local rail_remnants = data.raw["rail-remnants"][rail_type0[rt] .. "-rail" .. variation[rt] .. "-remnants"]
	for d = 1, 4 do
		rail.pictures[direction[d]] = rails(rail_type, direction[d], size_rails[rt], variation_rails[rt])
		rail_remnants.pictures[direction[d]] = rails_remnants(rail_type, direction[d], size_rails[rt], variation_rails[rt])
		if rail_type0[rt] == "curved" then
			rail.pictures[direction[d+4]] = rails(rail_type, direction[d+4], size_rails[rt], variation_rails[rt])
			rail_remnants.pictures[direction[d+4]] = rails_remnants(rail_type, direction[d+4], size_rails[rt], variation_rails[rt])
		end

	end
end