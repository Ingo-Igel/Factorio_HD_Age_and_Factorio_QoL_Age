local base = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/"

local use_color = settings.startup["f_hd_a_er_use_colored_railing"].value
local color = settings.startup["f_hd_a_er_color_railing"].value

local base_string = use_color and "-base" or ""

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

local variation_count_exceptions = {
	north = true,
	east = true,
	northeast = true,
	southeast = true
}

local side = {
	"A",
	"B"
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

local size_rail = 1536
local scale_rail = 0.25
local shift_rail = { 0, -3 }

-- Rails
local function elevated_rails_backplates(rail_type, direction)
	return {
		filename = base .. "elevated-rail-backplates/elevated-rail-backplates-" .. rail_type .. "-" .. direction .. ".png",
		flags = {
			"trilinear-filtering"
		},
		priority = "extra-high",
		size = size_rail,
		scale = scale_rail,
		shift = shift_rail,
		usage = "elevated-rail"
	}
end

local function elevated_rails_metals(rail_type, direction)
	return {
		filename =
			base .. "elevated-rail-metals/elevated-rail-metals-" .. rail_type .. "-" .. direction .. ".png",
		flags = {
			"trilinear-filtering"
		},
		priority = "extra-high",
		size = size_rail,
		scale = scale_rail,
		shift = shift_rail,
		usage = "elevated-rail"
	}
end

local function elevated_rails_stone_path(rail_type, direction)
	return {
		filename = base .. "elevated-rail-base-top/elevated-rail-base-top-" .. rail_type .. "-" .. direction .. ".png",
		flags = {
			"low-object"
		},
		priority = "extra-high",
		size = size_rail,
		scale = scale_rail,
		shift = shift_rail,
		usage = "elevated-rail"
	}
end

local function elevated_rails_stone_path_background(rail_type, direction)
	return {
		filename = base .. "elevated-rail-base/elevated-rail-base-" .. rail_type .. "-" .. direction .. ".png",
		flags = {
			"low-object"
		},
		priority = "extra-high",
		size = size_rail,
		scale = scale_rail,
		shift = shift_rail,
		usage = "elevated-rail"
	}
end

-- Railings
local function fence(rail_type, side, part, count, upper, direction, string)
	varcount = (rail_type == "straight" and variation_count_exceptions[direction]) and 1 or 2
	return {
		filename = base .. "elevated-rail-fence-" .. side .. part .. count .. upper .. string .. "/elevated-rail-fence-" .. side .. part .. count .. upper .. "-" .. rail_type .. "-" .. direction .. string .. ".png",
		flags = {
			"low-object"
		},
		priority = "extra-high",
		variation_count = varcount,
		size = size_rail,
		scale = scale_rail,
		shift = shift_rail,
		usage = "elevated-rail"
	}
end

local function fence_color(rail_type, side, part, count, upper, direction)
	varcount = (rail_type == "straight" and variation_count_exceptions[direction]) and 1 or 2
	return {
		filename = base .. "elevated-rail-fence-" .. side .. part .. count .. upper .. "-mask/elevated-rail-fence-" .. side .. part .. count .. upper .. "-" .. rail_type .. "-" .. direction .. "-mask.png",
		flags = { "mask" },
		tint = color,
		tint_as_overlay = true,
		priority = "extra-high",
		variation_count = varcount,
		size = size_rail,
		scale = scale_rail,
		shift = shift_rail,
		usage = "elevated-rail"
	}
end


for rt = 1, 4 do
	local rail_type = rail_type0[rt] .. variation[rt]
	local elevated_rail = data.raw["elevated-" .. rail_type0[rt] .. "-rail" .. variation[rt]]["elevated-" .. rail_type0[rt] .. "-rail" .. variation[rt]]

	for d = 1, 4 do
		elevated_rail.pictures[directions[d]]["backplates"] = elevated_rails_backplates(rail_type, directions[d])
		elevated_rail.pictures[directions[d]]["metals"] = elevated_rails_metals(rail_type, directions[d])
		elevated_rail.pictures[directions[d]]["stone_path"] = elevated_rails_stone_path(rail_type, directions[d])
		elevated_rail.pictures[directions[d]]["stone_path_background"].layers[1] = elevated_rails_stone_path_background(rail_type, directions[d])
		if rail_type0[rt] == "curved" then
			elevated_rail.pictures[directions[d + 4]]["backplates"] = elevated_rails_backplates(rail_type, directions[d + 4])
			elevated_rail.pictures[directions[d + 4]]["metals"] = elevated_rails_metals(rail_type, directions[d + 4])
			elevated_rail.pictures[directions[d + 4]]["stone_path"] = elevated_rails_stone_path(rail_type, directions[d + 4])
			elevated_rail.pictures[directions[d + 4]]["stone_path_background"].layers[1] = elevated_rails_stone_path_background(rail_type, directions[d + 4])
		end

		for s = 1, 2 do
			elevated_rail.fence_pictures["side_" .. side[s]].fence[directions[d]].layers[1] = fence(rail_type, side[s], "", "", "", directions[d], base_string)
			elevated_rail.fence_pictures["side_" .. side[s]].fence_upper[directions[d]].layers[1] = fence(rail_type, side[s], "", "", "-upper", directions[d], base_string)
			if rail_type0[rt] == "curved" then
				elevated_rail.fence_pictures["side_" .. side[s]].fence[directions[d + 4]].layers[1] = fence(rail_type, side[s], "", "", "", directions[d + 4], base_string)
				elevated_rail.fence_pictures["side_" .. side[s]].fence_upper[directions[d + 4]].layers[1] = fence(rail_type, side[s], "", "", "-upper", directions[d + 4], base_string)
			end
			for n = 1, 4 do
				elevated_rail.fence_pictures["side_" .. side[s]].ends[n][directions[d]].layers[1] = fence(rail_type, side[s], "-end", "-0" .. n, "", directions[d], base_string)
				elevated_rail.fence_pictures["side_" .. side[s]].ends_upper[n][directions[d]].layers[1] = fence(rail_type, side[s], "-end", "-0" .. n, "-upper", directions[d], base_string)
				if rail_type0[rt] == "curved" then
					elevated_rail.fence_pictures["side_" .. side[s]].ends[n][directions[d + 4]].layers[1] = fence(rail_type, side[s], "-end", "-0" .. n, "", directions[d + 4], base_string)
					elevated_rail.fence_pictures["side_" .. side[s]].ends_upper[n][directions[d + 4]].layers[1] = fence(rail_type, side[s], "-end", "-0" .. n, "-upper", directions[d + 4], base_string)
				end
			end
		end

		if use_color then
			for s = 1, 2 do
				elevated_rail.fence_pictures["side_" .. side[s]].fence[directions[d]].layers[3] = fence_color(rail_type, side[s], "", "", "", directions[d])
				elevated_rail.fence_pictures["side_" .. side[s]].fence_upper[directions[d]].layers[2] = fence_color(rail_type, side[s], "", "", "-upper", directions[d])
				if rail_type0[rt] == "curved" then
					elevated_rail.fence_pictures["side_" .. side[s]].fence[directions[d + 4]].layers[3] = fence_color(rail_type, side[s], "", "", "", directions[d + 4])
					elevated_rail.fence_pictures["side_" .. side[s]].fence_upper[directions[d + 4]].layers[2] = fence_color(rail_type, side[s], "", "", "-upper", directions[d + 4])
				end
				for n = 1, 4 do
					elevated_rail.fence_pictures["side_" .. side[s]].ends[n][directions[d]].layers[3] = fence_color(rail_type, side[s], "-end", "-0" .. n, "", directions[d])
					elevated_rail.fence_pictures["side_" .. side[s]].ends_upper[n][directions[d]].layers[2] = fence_color(rail_type, side[s], "-end", "-0" .. n, "-upper", directions[d])
					if rail_type0[rt] == "curved" then
						elevated_rail.fence_pictures["side_" .. side[s]].ends[n][directions[d + 4]].layers[3] = fence_color(rail_type, side[s], "-end", "-0" .. n, "", directions[d + 4])
						elevated_rail.fence_pictures["side_" .. side[s]].ends_upper[n][directions[d + 4]].layers[2] = fence_color(rail_type, side[s], "-end", "-0" .. n, "-upper", directions[d + 4])
					end
				end
			end
		end
	end
end
