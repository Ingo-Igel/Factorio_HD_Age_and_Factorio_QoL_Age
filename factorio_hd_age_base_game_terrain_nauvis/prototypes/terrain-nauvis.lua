local disable_water_transitions = true
local disable_out_of_map_transitions = true

if not settings.startup["f_hd_a_bg_tn_disable_water-transitions"].value then
	disable_water_transitions = false
end

if not settings.startup["f_hd_a_bg_tn_disable_out-of-map-transitions"].value then
	disable_out_of_map_transitions = false
end


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
				scale = 0.5,
				count = (options and options.mask_variations) or 8,
				double_side_count = 0,
				u_transition_count = 1,
				o_transition_count = 1,
				u_transition_line_length = 1,
				o_transition_line_length = 2,
				outer_corner_x = 576,
				side_x = 1152,
				u_transition_x = 1728,
				o_transition_x = 2304,
				mask = { y_offset = 0 }
			}
		}
	end

	return result
end

local tile_spritesheet_layout_hd = {}

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

tile_spritesheet_layout_hd.transition_4_4_8_1_1 = {
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

tile_spritesheet_layout_hd.transition_8_8_8_2_4 = {
	scale                    = 0.25,
	inner_corner_count       = 8,
	outer_corner_count       = 8,
	side_count               = 8,
	u_transition_count       = 2,
	o_transition_count       = 4,
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

tile_spritesheet_layout_hd.transition_16_16_16_4_8 = {
	scale                    = 0.25,
	inner_corner_count       = 16,
	outer_corner_count       = 16,
	side_count               = 16,
	u_transition_count       = 4,
	o_transition_count       = 8,
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

local patch_for_inner_corner_of_transition_between_transition = {
	filename =
	"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/water-patch.png",
	scale = 0.25,
	width = 64 * 2,
	height = 64 * 2
}

-- GROUND
local out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/out-of-map-transition.png"

-- WATER
local water_grass_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-grass-mask.png"
local water_grass_to_land_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-grass-to-land-mask.png"
local water_grass_to_out_of_map_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-grass-to-out-of-map-mask.png"

local water_dirt_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png"
local water_dirt_to_land_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png"
local water_dirt_to_out_of_map_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png"

local water_sand_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-sand-mask.png"
local water_sand_to_land_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-sand-to-land-mask.png"
local water_sand_to_out_of_map_mask = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-sand-to-out-of-map-mask.png"

local water_shallow_to_out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition.png"

-- GRASS
local grass = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/grass.png"
local grass_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/grass-transition.png"
local grass_out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/grass-out-of-map-transition.png"
local grass_shore_out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/grass-shore-out-of-map-transition.png"

-- DIRT
local dirt_out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png"

-- DIRT_DRY
local dry_dirt = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/dry-dirt.png"
local dry_dirt_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/dry-dirt-transition.png"
local dry_dirt_shore_out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png"

-- DIRT_DARK

local dark_dirt = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/dark-dirt.png"
local dark_dirt_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/dark-dirt-transition.png"
local dark_dirt_shore_out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/dark-dirt-shore-out-of-map-transition.png"

-- SAND
local sand = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/sand.png"
local sand_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/sand-transition.png"
local sand_out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/sand-out-of-map-transition.png"
local sand_shore_out_of_map_transition = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/sand-shore-out-of-map-transition.png"


if not settings.startup["f_hd_a_bg_tn_disable_gras"].value then
	if not disable_water_transitions then
		data.raw.tile["grass-1"].transitions[1].spritesheet = grass
		data.raw.tile["grass-1"].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8
		data.raw.tile["grass-1"].transitions[1].effect_map_layout.spritesheet = water_grass_mask

		data.raw.tile["grass-1"].transitions_between_transitions[1].spritesheet = grass_transition
		data.raw.tile["grass-1"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["grass-1"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_grass_to_land_mask

		data.raw.tile["grass-2"].transitions[1].spritesheet = grass
		data.raw.tile["grass-2"].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8
		data.raw.tile["grass-2"].transitions[1].effect_map_layout.spritesheet = water_grass_mask

		data.raw.tile["grass-2"].transitions_between_transitions[1].spritesheet = grass_transition
		data.raw.tile["grass-2"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["grass-2"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_grass_to_land_mask

		data.raw.tile["grass-3"].transitions[1].spritesheet = grass
		data.raw.tile["grass-3"].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8
		data.raw.tile["grass-3"].transitions[1].effect_map_layout.spritesheet = water_grass_mask

		data.raw.tile["grass-3"].transitions_between_transitions[1].spritesheet = grass_transition
		data.raw.tile["grass-3"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["grass-3"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_grass_to_land_mask

		data.raw.tile["grass-4"].transitions[1].spritesheet = grass
		data.raw.tile["grass-4"].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8
		data.raw.tile["grass-4"].transitions[1].effect_map_layout.spritesheet = water_grass_mask

		data.raw.tile["grass-4"].transitions_between_transitions[1].spritesheet = grass_transition
		data.raw.tile["grass-4"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["grass-4"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_grass_to_land_mask
	end

	if not disable_out_of_map_transitions then
		data.raw.tile["grass-1"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["grass-1"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["grass-1"].transitions_between_transitions[2].spritesheet = grass_out_of_map_transition
		data.raw.tile["grass-1"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["grass-1"].transitions_between_transitions[3].spritesheet = grass_shore_out_of_map_transition
		data.raw.tile["grass-1"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["grass-1"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_grass_to_out_of_map_mask

		data.raw.tile["grass-2"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["grass-2"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["grass-2"].transitions_between_transitions[2].spritesheet = grass_out_of_map_transition
		data.raw.tile["grass-2"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["grass-2"].transitions_between_transitions[3].spritesheet = grass_shore_out_of_map_transition
		data.raw.tile["grass-2"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["grass-2"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_grass_to_out_of_map_mask

		data.raw.tile["grass-3"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["grass-3"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["grass-3"].transitions_between_transitions[2].spritesheet = grass_out_of_map_transition
		data.raw.tile["grass-3"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["grass-3"].transitions_between_transitions[3].spritesheet = grass_shore_out_of_map_transition
		data.raw.tile["grass-3"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["grass-3"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_grass_to_out_of_map_mask

		data.raw.tile["grass-4"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["grass-4"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["grass-4"].transitions_between_transitions[2].spritesheet = grass_out_of_map_transition
		data.raw.tile["grass-4"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["grass-4"].transitions_between_transitions[3].spritesheet = grass_shore_out_of_map_transition
		data.raw.tile["grass-4"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["grass-4"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_grass_to_out_of_map_mask
	end

	data.raw.tile["grass-1"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/grass-1.png",
		"__base__/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 0.91, weights = { 0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
			[4] = { probability = 0.91, weights = { 0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }, },
		}
	)

	data.raw.tile["grass-2"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/grass-2.png",
		"__base__/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 0.91, weights = { 0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
			[4] = { probability = 0.75, weights = { 0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 }, },
		}
	)

	data.raw.tile["grass-3"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/grass-3.png",
		"__base__/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw.tile["grass-4"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/grass-4.png",
		"__base__/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.5, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_bg_tn_disable_dirt"].value then
	if not disable_water_transitions then
		data.raw.tile["dry-dirt"].transitions[1].spritesheet = dry_dirt
		data.raw.tile["dry-dirt"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["dry-dirt"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["dry-dirt"].transitions_between_transitions[1].spritesheet = dry_dirt_transition
		data.raw.tile["dry-dirt"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dry-dirt"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask

		data.raw.tile["dirt-1"].transitions[1].spritesheet = dry_dirt
		data.raw.tile["dirt-1"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["dirt-1"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["dirt-1"].transitions_between_transitions[1].spritesheet = dry_dirt_transition
		data.raw.tile["dirt-1"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-1"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask

		data.raw.tile["dirt-2"].transitions[1].spritesheet = dry_dirt
		data.raw.tile["dirt-2"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["dirt-2"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["dirt-2"].transitions_between_transitions[1].spritesheet = dry_dirt_transition
		data.raw.tile["dirt-2"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-2"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask

		data.raw.tile["dirt-3"].transitions[1].spritesheet = dry_dirt
		data.raw.tile["dirt-3"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["dirt-3"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["dirt-3"].transitions_between_transitions[1].spritesheet = dry_dirt_transition
		data.raw.tile["dirt-3"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-3"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
	end

	if not disable_out_of_map_transitions then
		data.raw.tile["dry-dirt"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["dry-dirt"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["dry-dirt"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["dry-dirt"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["dry-dirt"].transitions_between_transitions[3].spritesheet = dry_dirt_shore_out_of_map_transition
		data.raw.tile["dry-dirt"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dry-dirt"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

		data.raw.tile["dirt-1"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["dirt-1"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["dirt-1"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["dirt-1"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["dirt-1"].transitions_between_transitions[3].spritesheet = dry_dirt_shore_out_of_map_transition
		data.raw.tile["dirt-1"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-1"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

		data.raw.tile["dirt-2"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["dirt-2"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["dirt-2"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["dirt-2"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["dirt-2"].transitions_between_transitions[3].spritesheet = dry_dirt_shore_out_of_map_transition
		data.raw.tile["dirt-2"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-2"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

		data.raw.tile["dirt-3"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["dirt-3"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["dirt-3"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["dirt-3"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["dirt-3"].transitions_between_transitions[3].spritesheet = dry_dirt_shore_out_of_map_transition
		data.raw.tile["dirt-3"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-3"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask
	end

	data.raw.tile["dry-dirt"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dry-dirt.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw.tile["dirt-1"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-1.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw.tile["dirt-2"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-2.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw.tile["dirt-3"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-3.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	if not disable_water_transitions then
		data.raw.tile["dirt-4"].transitions[1].spritesheet = dark_dirt
		data.raw.tile["dirt-4"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["dirt-4"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["dirt-4"].transitions_between_transitions[1].spritesheet = dark_dirt_transition
		data.raw.tile["dirt-4"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-4"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
		data.raw.tile["dirt-4"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition

		data.raw.tile["dirt-5"].transitions[1].spritesheet = dark_dirt
		data.raw.tile["dirt-5"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["dirt-5"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["dirt-5"].transitions_between_transitions[1].spritesheet = dark_dirt_transition
		data.raw.tile["dirt-5"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-5"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
		data.raw.tile["dirt-5"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition

		data.raw.tile["dirt-6"].transitions[1].spritesheet = dark_dirt
		data.raw.tile["dirt-6"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["dirt-6"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["dirt-6"].transitions_between_transitions[1].spritesheet = dark_dirt_transition
		data.raw.tile["dirt-6"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-6"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
		data.raw.tile["dirt-6"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition

		data.raw.tile["dirt-7"].transitions[1].spritesheet = dark_dirt
		data.raw.tile["dirt-7"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["dirt-7"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["dirt-7"].transitions_between_transitions[1].spritesheet = dark_dirt_transition
		data.raw.tile["dirt-7"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-7"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
		data.raw.tile["dirt-7"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition
	end

	if not disable_out_of_map_transitions then
		data.raw.tile["dirt-4"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["dirt-4"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["dirt-4"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["dirt-4"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["dirt-4"].transitions_between_transitions[3].spritesheet = dark_dirt_shore_out_of_map_transition
		data.raw.tile["dirt-4"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-4"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

		data.raw.tile["dirt-5"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["dirt-5"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["dirt-5"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["dirt-5"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["dirt-5"].transitions_between_transitions[3].spritesheet = dark_dirt_shore_out_of_map_transition
		data.raw.tile["dirt-5"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-5"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

		data.raw.tile["dirt-6"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["dirt-6"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["dirt-6"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["dirt-6"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["dirt-6"].transitions_between_transitions[3].spritesheet = dark_dirt_shore_out_of_map_transition
		data.raw.tile["dirt-6"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-6"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

		data.raw.tile["dirt-7"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["dirt-7"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["dirt-7"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["dirt-7"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["dirt-7"].transitions_between_transitions[3].spritesheet = dark_dirt_shore_out_of_map_transition
		data.raw.tile["dirt-7"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["dirt-7"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask
	end

	data.raw.tile["dirt-4"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-4.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw.tile["dirt-5"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-5.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw.tile["dirt-6"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-6.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw.tile["dirt-7"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-7.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)
end

if not settings.startup["f_hd_a_bg_tn_disable_sand"].value then
	if not disable_water_transitions then
		data.raw.tile["sand-1"].transitions[1].spritesheet = sand
		data.raw.tile["sand-1"].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short
		data.raw.tile["sand-1"].transitions[1].effect_map_layout.spritesheet = water_sand_mask

		data.raw.tile["sand-1"].transitions_between_transitions[1].spritesheet = sand_transition
		data.raw.tile["sand-1"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall
		data.raw.tile["sand-1"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_sand_to_land_mask
		data.raw.tile["sand-1"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition

		data.raw.tile["sand-2"].transitions[1].spritesheet = sand
		data.raw.tile["sand-2"].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short
		data.raw.tile["sand-2"].transitions[1].effect_map_layout.spritesheet = water_sand_mask

		data.raw.tile["sand-2"].transitions_between_transitions[1].spritesheet = sand_transition
		data.raw.tile["sand-2"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall
		data.raw.tile["sand-2"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_sand_to_land_mask
		data.raw.tile["sand-2"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition

		data.raw.tile["sand-3"].transitions[1].spritesheet = sand
		data.raw.tile["sand-3"].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short
		data.raw.tile["sand-3"].transitions[1].effect_map_layout.spritesheet = water_sand_mask

		data.raw.tile["sand-3"].transitions_between_transitions[1].spritesheet = sand_transition
		data.raw.tile["sand-3"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall
		data.raw.tile["sand-3"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_sand_to_land_mask
		data.raw.tile["sand-3"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition
	end

	if not disable_out_of_map_transitions then
		data.raw.tile["sand-1"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["sand-1"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["sand-1"].transitions_between_transitions[2].spritesheet = sand_out_of_map_transition
		data.raw.tile["sand-1"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["sand-1"].transitions_between_transitions[3].spritesheet = sand_shore_out_of_map_transition
		data.raw.tile["sand-1"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["sand-1"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_sand_to_out_of_map_mask
		data.raw.tile["sand-1"].transitions_between_transitions[3].water_patch = patch_for_inner_corner_of_transition_between_transition

		data.raw.tile["sand-2"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["sand-2"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["sand-2"].transitions_between_transitions[2].spritesheet = sand_out_of_map_transition
		data.raw.tile["sand-2"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["sand-2"].transitions_between_transitions[3].spritesheet = sand_shore_out_of_map_transition
		data.raw.tile["sand-2"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["sand-2"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_sand_to_out_of_map_mask
		data.raw.tile["sand-2"].transitions_between_transitions[3].water_patch = patch_for_inner_corner_of_transition_between_transition

		data.raw.tile["sand-3"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["sand-3"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["sand-3"].transitions_between_transitions[2].spritesheet = sand_out_of_map_transition
		data.raw.tile["sand-3"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["sand-3"].transitions_between_transitions[3].spritesheet = sand_shore_out_of_map_transition
		data.raw.tile["sand-3"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["sand-3"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_sand_to_out_of_map_mask
		data.raw.tile["sand-3"].transitions_between_transitions[3].water_patch = patch_for_inner_corner_of_transition_between_transition
	end

	data.raw.tile["sand-1"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/sand-1.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 8,
			[2] = { probability = 0.39, weights = { 0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020 } },
			[4] = { probability = 0.20, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } },
			[8] = { probability = 0.10, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } }
		}
	)

	data.raw.tile["sand-2"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/sand-2.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 8,
			[2] = { probability = 0.39, weights = { 0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020 } },
			[4] = { probability = 0.20, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } },
			[8] = { probability = 0.10, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } }
		}
	)

	data.raw.tile["sand-3"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/sand-3.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 0.39, weights = { 0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020 }, },
			[4] = { probability = 0.39, weights = { 0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020 }, },
		}
	)
end

if not settings.startup["f_hd_a_bg_tn_disable_dessert"].value then
	if not disable_water_transitions then
		data.raw.tile["red-desert-0"].transitions[1].spritesheet = grass
		data.raw.tile["red-desert-0"].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8
		data.raw.tile["red-desert-0"].transitions[1].effect_map_layout.spritesheet = water_grass_mask

		data.raw.tile["red-desert-0"].transitions_between_transitions[1].spritesheet = grass_transition
		data.raw.tile["red-desert-0"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["red-desert-0"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_grass_to_land_mask
	end

	if not disable_out_of_map_transitions then
		data.raw.tile["red-desert-0"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["red-desert-0"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["red-desert-0"].transitions_between_transitions[2].spritesheet = grass_out_of_map_transition
		data.raw.tile["red-desert-0"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["red-desert-0"].transitions_between_transitions[3].spritesheet = grass_shore_out_of_map_transition
		data.raw.tile["red-desert-0"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["red-desert-0"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_grass_to_out_of_map_mask
	end

	data.raw.tile["red-desert-0"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/red-desert-0.png",
		"__base__/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	if not disable_water_transitions then
		data.raw.tile["red-desert-1"].transitions[1].spritesheet = dry_dirt
		data.raw.tile["red-desert-1"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["red-desert-1"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["red-desert-1"].transitions_between_transitions[1].spritesheet = dry_dirt_transition
		data.raw.tile["red-desert-1"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["red-desert-1"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask

		data.raw.tile["red-desert-2"].transitions[1].spritesheet = dry_dirt
		data.raw.tile["red-desert-2"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["red-desert-2"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["red-desert-2"].transitions_between_transitions[1].spritesheet = dry_dirt_transition
		data.raw.tile["red-desert-2"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["red-desert-2"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask

		data.raw.tile["red-desert-3"].transitions[1].spritesheet = dry_dirt
		data.raw.tile["red-desert-3"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile["red-desert-3"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile["red-desert-3"].transitions_between_transitions[1].spritesheet = dry_dirt_transition
		data.raw.tile["red-desert-3"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["red-desert-3"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
	end

	if not disable_out_of_map_transitions then
		data.raw.tile["red-desert-1"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["red-desert-1"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["red-desert-1"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["red-desert-1"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["red-desert-1"].transitions_between_transitions[3].spritesheet = dry_dirt_shore_out_of_map_transition
		data.raw.tile["red-desert-1"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["red-desert-1"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

		data.raw.tile["red-desert-2"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["red-desert-2"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["red-desert-2"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["red-desert-2"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["red-desert-2"].transitions_between_transitions[3].spritesheet = dry_dirt_shore_out_of_map_transition
		data.raw.tile["red-desert-2"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["red-desert-2"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

		data.raw.tile["red-desert-3"].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile["red-desert-3"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile["red-desert-3"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
		data.raw.tile["red-desert-3"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile["red-desert-3"].transitions_between_transitions[3].spritesheet = dry_dirt_shore_out_of_map_transition
		data.raw.tile["red-desert-3"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile["red-desert-3"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask
	end

	data.raw.tile["red-desert-1"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/red-desert-1.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw.tile["red-desert-2"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/red-desert-2.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
			[8] = { probability = 1.00, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } }
		}
	)

	data.raw.tile["red-desert-3"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/red-desert-3.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
			[8] = { probability = 1.00, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } }
		}
	)
end

if not disable_water_transitions then
	data.raw.tile["landfill"].transitions[1].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/landfill.png"
	data.raw.tile["landfill"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
	data.raw.tile["landfill"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

	data.raw.tile["landfill"].transitions_between_transitions[1].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/landfill-transition.png"
	data.raw.tile["landfill"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
	data.raw.tile["landfill"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
	data.raw.tile["landfill"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition

	data.raw.tile["nuclear-ground"].transitions[1].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/nuclear-ground.png"
	data.raw.tile["nuclear-ground"].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
	data.raw.tile["nuclear-ground"].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

	data.raw.tile["nuclear-ground"].transitions_between_transitions[1].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/nuclear-ground-transition.png"
	data.raw.tile["nuclear-ground"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
	data.raw.tile["nuclear-ground"].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
	data.raw.tile["nuclear-ground"].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition
end

if not disable_out_of_map_transitions then
	data.raw.tile["landfill"].transitions[2].spritesheet = out_of_map_transition
	data.raw.tile["landfill"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

	data.raw.tile["landfill"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
	data.raw.tile["landfill"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

	data.raw.tile["landfill"].transitions_between_transitions[3].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/landfill-shore-out-of-map-transition.png"
	data.raw.tile["landfill"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
	data.raw.tile["landfill"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

	data.raw.tile["nuclear-ground"].transitions[2].spritesheet = out_of_map_transition
	data.raw.tile["nuclear-ground"].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

	data.raw.tile["nuclear-ground"].transitions_between_transitions[2].spritesheet = dirt_out_of_map_transition
	data.raw.tile["nuclear-ground"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

	data.raw.tile["nuclear-ground"].transitions_between_transitions[3].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/nuclear-ground-shore-out-of-map-transition.png"
	data.raw.tile["nuclear-ground"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
	data.raw.tile["nuclear-ground"].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask

	data.raw.tile["water"].transitions[1].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png"
	data.raw.tile["water"].transitions[1].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

	data.raw.tile["water-mud"].transitions[1].spritesheet = water_shallow_to_out_of_map_transition
	data.raw.tile["water-mud"].transitions[1].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

	data.raw.tile["water-mud"].transitions_between_transitions[1].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition-to-water.png"
	data.raw.tile["water-mud"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

	data.raw.tile["water-shallow"].transitions[1].spritesheet = water_shallow_to_out_of_map_transition
	data.raw.tile["water-shallow"].transitions[1].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

	data.raw.tile["water-shallow"].transitions_between_transitions[1].spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition-to-water.png"
	data.raw.tile["water-shallow"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
end
