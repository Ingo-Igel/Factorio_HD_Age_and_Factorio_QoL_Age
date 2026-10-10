local base = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-color/"

local color = settings.startup["f_hd_a_er_color_railing"].value

local scale_value = 0.25
local line_length_value = 2

local side = {
	"A",
	"B"
}

local directions = {
	"north",
	"east",
	"south",
	"west"
}

local function fence_color(side, direction, string)
	local hight_value = string == "" and 2372 or 2336
	local width_value = string == "" and 2048 or 2088

	local x_value = {
		north = 0,
		east = width_value,
		south = 0,
		west = width_value
	}

	local y_value = {
		north = 0,
		east = hight_value,
		south = hight_value,
		west = 0
	}

	local shift_value = string == "" and { 0, -2.28125 } or { 0.03125, -2.140625 }

	return {
		layers = {
			{
				filename = base .. "elevated-rail-ramp-fence-" .. side .. string .. "-base.png",
				line_length = line_length_value,
				height = hight_value,
				width = width_value,
				scale = scale_value,
				shift = shift_value,
				x = x_value[direction],
				y = y_value[direction]
			},
			{
				filename = base .. "elevated-rail-ramp-fence-" .. side .. string .. "-mask.png",
				flags = { "mask" },
				tint = color,
				tint_as_overlay = true,
				line_length = line_length_value,
				height = hight_value,
				width = width_value,
				scale = scale_value,
				shift = shift_value,
				x = x_value[direction],
				y = y_value[direction]
			}
		}

	}
end

for s = 1, 2 do
	local rail_ramp = data.raw["rail-ramp"]["rail-ramp"].fence_pictures["side_" .. side[s]]

	for d = 1, 4 do
		rail_ramp.fence[directions[d]] = fence_color(side[s], directions[d], "")
		rail_ramp.ends[1][directions[d]] = fence_color(side[s], directions[d], "")
		rail_ramp.ends[3][directions[d]] = fence_color(side[s], directions[d], "-end")
	end
end
