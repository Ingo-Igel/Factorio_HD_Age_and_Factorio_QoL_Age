local base = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail/"

local use_color = settings.startup["f_hd_a_er_use_colored_railing"].value
local color = settings.startup["f_hd_a_er_color_railing"].value

local base_string = use_color and "-base" or ""

local rail_types = {
	{ type = "straight",      suffix = "",   directions = 4 },
	{ type = "half-diagonal", suffix = "",   directions = 4 },
	{ type = "curved",        suffix = "-a", directions = 8 },
	{ type = "curved",        suffix = "-b", directions = 8 }
}

local sides = {
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

local rail_size = 1536
local rail_scale = 0.25
local rail_shift = { 0, -3 }

-- Rails
local function elevated_rails_backplates(rail_type, direction)
	return {
		filename = base .. "elevated-rail-backplates/elevated-rail-backplates-" .. rail_type .. "-" .. direction .. ".png",
		flags = {
			"trilinear-filtering"
		},
		priority = "extra-high",
		size = rail_size,
		scale = rail_scale,
		shift = rail_shift,
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
		size = rail_size,
		scale = rail_scale,
		shift = rail_shift,
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
		size = rail_size,
		scale = rail_scale,
		shift = rail_shift,
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
		size = rail_size,
		scale = rail_scale,
		shift = rail_shift,
		usage = "elevated-rail"
	}
end

-- Railings
local function get_fence_variation_count(rail_type)
	return rail_type == "straight" and 1 or 2
end

local function fence(rail_type, side, part, count, upper, direction, string)
	local variation_count = get_fence_variation_count(rail_type)
	return {
		filename = base .. "elevated-rail-fence-" .. side .. part .. count .. upper .. string .. "/elevated-rail-fence-" .. side .. part .. count .. upper .. "-" .. rail_type .. "-" .. direction .. string .. ".png",
		flags = {
			"low-object"
		},
		priority = "extra-high",
		variation_count = variation_count,
		size = rail_size,
		scale = rail_scale,
		shift = rail_shift,
		usage = "elevated-rail"
	}
end

local function fence_color(rail_type, side, part, count, upper, direction)
	local variation_count = get_fence_variation_count(rail_type)
	return {
		filename = base .. "elevated-rail-fence-" .. side .. part .. count .. upper .. "-mask/elevated-rail-fence-" .. side .. part .. count .. upper .. "-" .. rail_type .. "-" .. direction .. "-mask.png",
		flags = { "mask" },
		tint = color,
		tint_as_overlay = true,
		priority = "extra-high",
		variation_count = variation_count,
		size = rail_size,
		scale = rail_scale,
		shift = rail_shift,
		usage = "elevated-rail"
	}
end


for _, rail_data in ipairs(rail_types) do
	local rail_type = rail_data.type .. rail_data.suffix
	local prototype_name = "elevated-" .. rail_data.type .. "-rail" .. rail_data.suffix
	local elevated_rail = data.raw[prototype_name][prototype_name]

	for d = 1, rail_data.directions do
		local direction = directions[d]
		local picture = elevated_rail.pictures[direction]

		picture["backplates"] = elevated_rails_backplates(rail_type, direction)
		picture["metals"] = elevated_rails_metals(rail_type, direction)
		picture["stone_path"] = elevated_rails_stone_path(rail_type, direction)
		picture["stone_path_background"].layers[1] = elevated_rails_stone_path_background(rail_type, direction)

		for _, sider in ipairs(sides) do
			local side_fence = elevated_rail.fence_pictures["side_" .. sider]
			side_fence.fence[direction].layers[1] = fence(rail_type, sider, "", "", "", direction, base_string)
			side_fence.fence_upper[direction].layers[1] = fence(rail_type, sider, "", "", "-upper", direction, base_string)

			for variation = 1, 4 do
				local variation_suffix = "-0" .. variation
				side_fence.ends[variation][direction].layers[1] = fence(rail_type, sider, "-end", variation_suffix, "", direction, base_string)
				side_fence.ends_upper[variation][direction].layers[1] = fence(rail_type, sider, "-end", variation_suffix, "-upper", direction, base_string)
			end

			if use_color then
				side_fence.fence[direction].layers[3] = fence_color(rail_type, sider, "", "", "", direction)
				side_fence.fence_upper[direction].layers[2] = fence_color(rail_type, sider, "", "", "-upper", direction)

				for variation = 1, 4 do
					local variation_suffix = "-0" .. variation
					side_fence.ends[variation][direction].layers[3] = fence_color(rail_type, sider, "-end", variation_suffix, "", direction)
					side_fence.ends_upper[variation][direction].layers[2] = fence_color(rail_type, sider, "-end", variation_suffix, "-upper", direction)
				end
			end
		end
	end
end
