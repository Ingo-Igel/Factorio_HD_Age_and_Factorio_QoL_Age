local rail_type0 = {
	"straight",
	"half-diagonal",
	"curved",
	"curved"
}

local variation = {
	"",
	"",
	"-a",
	"-b"
}

local side = {
	"A",
	"B"
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

local size_rail = 1536
local scale_rail = 0.25
local shift_rail = { 0, -3}

-- Rails
local function elevated_rails(rail_type, direction)
	return {
		metals = {
			filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-metals/elevated-rail-metals-" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			shift = shift_rail,
		},
		backplates = {
			filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-backplates/elevated-rail-backplates-" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			shift = shift_rail,
		},
		ties = {
			filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-base-top/elevated-rail-base-top-" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			shift = shift_rail,
		},
		stone_path = {
			filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-base/elevated-rail-base-" .. rail_type .. "-" .. direction .. ".png",
			priority = "extra-high",
			size = size_rail,
			scale = scale_rail,
			shift = shift_rail,
		},
		stone_path_background = {
			priority = "extra-high",
			filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-base-shadow/elevated-rail-base-shadow-" .. rail_type .. "-" .. direction .. ".png",
			size = 768,
			scale = 0.5,
			shift = {3.87, 2.75 - 3},
			draw_as_shadow = true,
		},
		water_reflection = {
			priority = "extra-high",
			filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-base-reflection/elevated-rail-base-reflection-" .. rail_type .. "-" .. direction .. ".png",
			size = 768,
			scale = 0.5,
			shift = { 0, 3},
		},
	}
end

-- Railings
local function fence(rail_type, varcount, side, part, count, direction)
	return {
		filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-fence-" .. side .. part .. count .. "-upper/elevated-rail-fence-" .. side .. part .. count .. "-upper-" .. rail_type .. "-" .. direction .. ".png",
		priority = "extra-high",
		variation_count = varcount,
		size = size_rail,
		scale = scale_rail,
		shift = shift_rail,
	}
end

local function fence_with_shadow(rail_type, varcount, side, part, count, direction)
	return {
		layers = {
			{
				filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-fence-" .. side .. part .. count .. "/elevated-rail-fence-" .. side .. part .. count .. "-" .. rail_type .. "-" .. direction .. ".png",
				priority = "extra-high",
				variation_count = varcount,
				size = size_rail,
				scale = scale_rail,
				shift = shift_rail,
			},
			{
				filename = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/elevated-rail-fence-" .. side .. part .. count .. "-shadow/elevated-rail-fence-" .. side .. part .. count .. "-shadow-" .. rail_type .. "-" .. direction .. ".png",
				priority = "extra-high",
				variation_count = varcount,
				size = 768,
				scale = 0.5,
				shift = {3.87, 2.75 - 3},
				draw_as_shadow = true,
			}
		}
	}
end

for rt = 1, 4 do
	local rail_type = rail_type0[rt] .. variation[rt]
	local elevated_rail = data.raw["elevated-" .. rail_type0[rt] .. "-rail" .. variation[rt]]["elevated-" .. rail_type0[rt] .. "-rail" .. variation[rt]]

	for d = 1, 4 do
		elevated_rail.pictures[direction[d]] = elevated_rails(rail_type, direction[d])
		if rail_type0[rt] == "curved" then
			elevated_rail.pictures[direction[d+4]] = elevated_rails(rail_type, direction[d+4])
		end

		for s = 1, 2 do
			elevated_rail.fence_pictures["side_" .. side[s]].fence[direction[d]] = fence_with_shadow(rail_type, 2, side[s], "", "", direction[d])
			elevated_rail.fence_pictures["side_" .. side[s]].fence_upper[direction[d]].layers[1] = fence(rail_type, 2, side[s], "", "", direction[d])
			if rail_type0[rt] == "curved" then
				elevated_rail.fence_pictures["side_" .. side[s]].fence[direction[d+4]] = fence_with_shadow(rail_type, 2, side[s], "", "", direction[d+4])
				elevated_rail.fence_pictures["side_" .. side[s]].fence_upper[direction[d+4]].layers[1] = fence(rail_type, 2, side[s], "", "", direction[d+4])
			end

			for n = 1, 4 do
				elevated_rail.fence_pictures["side_" .. side[s]].ends[n][direction[d]] = fence_with_shadow(rail_type, 2, side[s], "-end", "-0" .. n, direction[d])
				elevated_rail.fence_pictures["side_" .. side[s]].ends_upper[n][direction[d]].layers[1] = fence(rail_type, 2, side[s], "-end", "-0" .. n, direction[d])
				if rail_type0[rt] == "curved" then
					elevated_rail.fence_pictures["side_" .. side[s]].ends[n][direction[d+4]] = fence_with_shadow(rail_type, 2, side[s], "-end", "-0" .. n, direction[d+4])
					elevated_rail.fence_pictures["side_" .. side[s]].ends_upper[n][direction[d+4]].layers[1] = fence(rail_type, 2, side[s], "-end", "-0" .. n, direction[d+4])
				end
			end
		end
	end
end