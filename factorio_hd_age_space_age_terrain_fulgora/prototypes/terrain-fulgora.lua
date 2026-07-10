local disable_water_transitions = settings.startup["f_hd_a_sa_tf_disable_water-transitions"].value
local disable_out_of_map_transitions = settings.startup["f_hd_a_sa_tf_disable_out-of-map-transitions"].value

local function tile_variations_template_hd(high_res_picture, high_res_transition_mask, options)
	local function main_variation_hd(size_)
		local y_ = ((size_ == 1) and 0) or ((size_ == 2) and 256) or ((size_ == 4) and 640) or 1280
		local ret = {
			picture = high_res_picture,
			count = (options[size_] and options[size_].weights) and #options[size_].weights or 16,
			size = size_,
			y = y_,
			line_length = (size_ == 8) and 8 or 16,
			scale = 0.25
		}

		if options[size_] then
			for k, v in pairs(options[size_]) do
				ret[k] = v
			end
		end

		return ret
	end

	local result = {
		main = {
			main_variation_hd(1),
			main_variation_hd(2),
			main_variation_hd(4)
		}
	}

	if (options.max_size == 8) then
		table.insert(result.main, main_variation_hd(8))
	end

	if options.empty_transitions then
		result.empty_transitions = true
	else
		result.transition = {
			spritesheet = high_res_transition_mask,
			layout = {
				scale = 0.25,
				count = (options and options.mask_variations) or 8,
				double_side_count = 0,
				u_transition_count = 1,
				o_transition_count = 1,
				u_transition_line_length = 1,
				o_transition_line_length = 2,
				outer_corner_x = 576 * 2,
				side_x = 1152 * 2,
				u_transition_x = 1728 * 2,
				o_transition_x = 2304 * 2,
				mask = { y_offset = 0 }
			}
		}
	end

	return result
end

function tile_variations_template_with_transitions_hd(high_res_picture, options)
	local result = tile_variations_template_hd(high_res_picture, high_res_picture, options)

	if result.transition then
		result.transition.layout =
		{
			scale                    = 0.25,
			inner_corner_x           = 1216 * 2,
			outer_corner_x           = 1504 * 2,
			side_x                   = 1792 * 2,
			u_transition_x           = 1056 * 2,
			o_transition_x           = 544 * 2,
			inner_corner_count       = 8,
			outer_corner_count       = 8,
			side_count               = 8,
			u_transition_count       = 1,
			o_transition_count       = 1,
			u_transition_line_length = 4,
			o_transition_line_length = 4,
			overlay                  = { x_offset = 0 }
		}
	end

	return result
end

local tile_spritesheet_layout_hd = {}

tile_spritesheet_layout_hd.transition_16_16_16_4_8_short = {
	scale              = 0.25,
	inner_corner_count = 16,
	outer_corner_count = 16,
	side_count         = 16,
	u_transition_count = 4,
	o_transition_count = 8,
	inner_corner_y     = 0,
	outer_corner_y     = 576 * 2,
	side_y             = 1152 * 2,
	u_transition_y     = 1728 * 2,
	o_transition_y     = 2304 * 2,
	overlay            = { x_offset = 0 },
	mask               = { x_offset = 2176 * 2 },
	background         = { x_offset = 1088 * 2 }
}

tile_spritesheet_layout_hd.transition_3_3_3_1_0 = {
	scale                    = 0.25,
	inner_corner_count       = 3,
	outer_corner_count       = 3,
	side_count               = 3,
	u_transition_count       = 1,
	o_transition_count       = 0,
	inner_corner_y           = 0,
	outer_corner_y           = 576 * 2,
	side_y                   = 1152 * 2,
	u_transition_y           = 1728 * 2,
	o_transition_y           = 2304 * 2,
	inner_corner_tile_height = 2,
	outer_corner_tile_height = 2,
	side_tile_height         = 2,
	u_transition_tile_height = 2,
	overlay                  = { x_offset = 0 },
	mask                     = { x_offset = 2176 * 2 },
	background               = { x_offset = 1088 * 2 }
}

tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall = {
	scale                    = 0.25,
	inner_corner_count       = 3,
	outer_corner_count       = 3,
	side_count               = 3,
	u_transition_count       = 1,
	o_transition_count       = 0,
	inner_corner_y           = 0,
	outer_corner_y           = 576 * 2,
	side_y                   = 1152 * 2,
	u_transition_y           = 1728 * 2,
	o_transition_y           = 2304 * 2,
	u_transition_tile_height = 2,
	overlay                  = { x_offset = 0 },
	mask                     = { x_offset = 2176 * 2 },
	background               = { x_offset = 1088 * 2 }
}

tile_spritesheet_layout_hd.transition_4_4_8_1_1 =
{
	scale                    = 0.25,
	inner_corner_count       = 4,
	outer_corner_count       = 4,
	side_count               = 8,
	u_transition_count       = 1,
	o_transition_count       = 1,
	inner_corner_y           = 0,
	outer_corner_y           = 576 * 2,
	side_y                   = 1152 * 2,
	u_transition_y           = 1728 * 2,
	o_transition_y           = 2304 * 2,
	inner_corner_tile_height = 2,
	outer_corner_tile_height = 2,
	side_tile_height         = 2,
	u_transition_tile_height = 2,
	overlay                  = { x_offset = 0 },
	mask                     = { x_offset = 2176 * 2 },
	background               = { x_offset = 1088 * 2 }
}

local water_patch = {
	filename =
	"__factorio_hd_age_space_age_terrain_fulgora__/data/base/graphics/terrain/water-transitions/water-patch.png",
	scale = 0.25,
	width = 64 * 2,
	height = 64 * 2
}

local base = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/"

local function load_sand_transition(name, variant)
	local assets = {
		rock = {
			water_transition = "water-transitions/fulgora-rock-slab-transition.png",
			water_between = "water-transitions/fulgora-sand-transition.png",
			out_of_map = "out-of-map-transition/fulgora-out-of-map-transition-b.png",
		},
		oil = {
			water_transition = "water-transitions/fulgora-oil-sand.png",
			water_between = "water-transitions/fulgora-oil-sand-transition.png",
			out_of_map = "out-of-map-transition/oil-out-of-map-transition.png",
		}
	}

	if not disable_water_transitions then
		data.raw.tile[name].transitions[1].spritesheet = base .. assets[variant].water_transition
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short
		data.raw.tile[name].transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-fulgora-sand-mask.png"

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = base .. assets[variant].water_between
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall
		data.raw.tile[name].transitions_between_transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-fulgora-sand-to-land-mask.png"
		data.raw.tile[name].transitions_between_transitions[1].water_patch = water_patch
	end

	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[2].spritesheet = base .. assets[variant].out_of_map
		data.raw.tile[name].transitions[2].layout =
			tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile[name].transitions_between_transitions[2].spritesheet = base .. "out-of-map-transition/fulgora-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile[name].transitions_between_transitions[3].spritesheet = base .. "out-of-map-transition/fulgora-shore-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[3].effect_map_layout.spritesheet = base .. "effect-maps/water-fulgora-sand-to-out-of-map-mask.png"
		data.raw.tile[name].transitions_between_transitions[3].water_patch = water_patch
	end
end

for _, name in ipairs({
    "fulgoran-dust",
    "fulgoran-dunes",
    "fulgoran-sand",
    "fulgoran-rock",
    "fulgoran-paving",
    "fulgoran-walls",
    "fulgoran-conduit",
    "fulgoran-machinery"
}) do
    load_sand_transition(name, "rock")
end

load_sand_transition("oil-ocean-shallow", "oil")
load_sand_transition("oil-ocean-shallow-2", "oil")

local function load_oil_ocean(name, number)
	if not disable_water_transitions and (name == "oil-ocean-deep") then
		data.raw.tile[name].transitions[1].spritesheet = base .. "water-transitions/fulgora-oil-sand.png"
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short
		data.raw.tile[name].transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-fulgora-sand-mask.png"
	end

	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[number].spritesheet = base .. "out-of-map-transition/oil-out-of-map-transition.png"
		data.raw.tile[name].transitions[number].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = base .. "out-of-map-transition/oil-out-of-map-transition-b.png"
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
	end

	data.raw.tile[name].variants = tile_variations_template_with_transitions_hd(
		base .. "oil-ocean-deep.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		})
end

if not settings.startup["f_hd_a_sa_tf_disable_oil_ocean_deep"].value then
	data.raw.tile["oil-ocean-deep-2"].transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions)
	data.raw.tile["oil-ocean-deep-2"].transitions_between_transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions_between_transitions)

	load_oil_ocean("oil-ocean-deep", 2)
	load_oil_ocean("oil-ocean-deep-2", 1)
end
