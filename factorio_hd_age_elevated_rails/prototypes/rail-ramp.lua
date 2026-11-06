local base = "__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/elevated-rail-ramp/elevated-rail-ramp-fence-color/"

local color = settings.startup["f_hd_a_er_color_railing"].value

local scale_value = 0.25
local line_length_value = 2

local sides = {
	"A",
	"B"
}

local directions = {
	"north",
	"east",
	"south",
	"west"
}

local direction_offsets = {
	north = { x = 0, y = 0 },
	east = { x = 1, y = 1 },
	south = { x = 0, y = 1 },
	west = { x = 1, y = 0 }
}

local function fence_color(side_name, direction_name, suffix)
	local height_value = suffix == "" and 2372 or 2336
	local width_value = suffix == "" and 2048 or 2088
	local direction_offset = direction_offsets[direction_name]
	local shift_value = suffix == "" and { 0, -2.28125 } or { 0.03125, -2.140625 }

	return {
		layers = {
			{
				filename = base .. "elevated-rail-ramp-fence-" .. side_name .. suffix .. "-base.png",
				line_length = line_length_value,
				height = height_value,
				width = width_value,
				scale = scale_value,
				shift = shift_value,
				x = direction_offset.x * width_value,
				y = direction_offset.y * height_value
			},
			{
				filename = base .. "elevated-rail-ramp-fence-" .. side_name .. suffix .. "-mask.png",
				flags = { "mask" },
				tint = color,
				tint_as_overlay = true,
				line_length = line_length_value,
				height = height_value,
				width = width_value,
				scale = scale_value,
				shift = shift_value,
				x = direction_offset.x * width_value,
				y = direction_offset.y * height_value
			}
		}
	}
end

local fence_pictures = assert(data.raw["rail-ramp"]["rail-ramp"].fence_pictures)

for _, side_name in ipairs(sides) do
	local rail_ramp = fence_pictures["side_" .. side_name]

	for _, direction_name in ipairs(directions) do
		local fence_sprite = fence_color(side_name, direction_name, "")
		rail_ramp.fence[direction_name] = fence_sprite
		rail_ramp.ends[1][direction_name] = fence_sprite
		rail_ramp.ends[3][direction_name] = fence_color(side_name, direction_name, "-end")
	end
end
