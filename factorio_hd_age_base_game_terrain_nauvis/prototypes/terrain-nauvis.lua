local disable_water_transitions = settings.startup["f_hd_a_bg_tn_disable_water-transitions"].value
local disable_out_of_map_transitions = settings.startup["f_hd_a_bg_tn_disable_out-of-map-transitions"].value

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

local base = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/"
local out_of_map_transition = base .. "out-of-map-transition/out-of-map-transition.png"
local patch_for_inner_corner_of_transition_between_transition = {
	filename =
		base .. "water-transitions/water-patch.png",
	scale = 0.25,
	width = 64 * 2,
	height = 64 * 2
}

local function load_terrain(name, transition, options)
	data.raw.tile[name].variants = tile_variations_template_hd(
		base .. "" .. name .. ".png",
		"__base__/graphics/terrain/masks/transition-" .. transition .. ".png",
		options
	)
end

local function load_grass_transitions(name)
	if not disable_water_transitions then
		data.raw.tile[name].transitions[1].spritesheet = base .. "water-transitions/grass.png"
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8
		data.raw.tile[name].transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-grass-mask.png"

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = base .. "water-transitions/grass-transition.png"
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-grass-to-land-mask.png"
	end

	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile[name].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile[name].transitions_between_transitions[2].spritesheet = base .. "out-of-map-transition/grass-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile[name].transitions_between_transitions[3].spritesheet = base .. "out-of-map-transition/grass-shore-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[3].effect_map_layout.spritesheet = base .. "effect-maps/water-grass-to-out-of-map-mask.png"
	end
end

if not settings.startup["f_hd_a_bg_tn_disable_gras"].value then
	load_grass_transitions("grass-1")
	load_grass_transitions("grass-2")
	load_grass_transitions("grass-3")
	load_grass_transitions("grass-4")

	load_terrain("grass-1", "3", {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 0.91, weights = { 0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 } },
		[4] = { probability = 0.91, weights = { 0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 } }
	})

	load_terrain("grass-2", "3", {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 0.91, weights = { 0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 } },
		[4] = { probability = 0.75, weights = { 0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 } }
	})

	load_terrain("grass-3", "3", {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 } },
		[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 } }
	})

	load_terrain("grass-4", "3", {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 } },
		[4] = { probability = 0.5, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 } }
	})
end

local function load_transitions(name, dry_dirt, dark_dirt)
	local name2 = dry_dirt and "dry-dirt" or (dark_dirt and "dark-dirt" or name)
	local patch = not dry_dirt

	if not disable_water_transitions then
		data.raw.tile[name].transitions[1].spritesheet = base .. "water-transitions/" .. name2 .. ".png"
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4
		data.raw.tile[name].transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-dirt-mask.png"

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = base .. "water-transitions/" .. name2 .. "-transition.png"
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-dirt-to-land-mask.png"
		if patch then
			data.raw.tile[name].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition
		end
	end

	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile[name].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile[name].transitions_between_transitions[2].spritesheet = base .. "out-of-map-transition/dirt-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile[name].transitions_between_transitions[3].spritesheet = base .. "out-of-map-transition/" .. name2 .. "-shore-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[3].effect_map_layout.spritesheet = base .. "effect-maps/water-dirt-to-out-of-map-mask.png"
	end
end

if not settings.startup["f_hd_a_bg_tn_disable_dirt"].value then
	load_transitions("dry-dirt", true, false)
	load_transitions("dirt-1", true, false)
	load_transitions("dirt-2", true, false)
	load_transitions("dirt-3", true, false)
	load_transitions("dirt-4", false, true)
	load_transitions("dirt-5", false, true)
	load_transitions("dirt-6", false, true)
	load_transitions("dirt-7", false, true)

	local options_dirt = {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
		[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 } }
	}

	for _, name in ipairs({ "dry-dirt", "dirt-1", "dirt-2", "dirt-3", "dirt-4", "dirt-5", "dirt-6", "dirt-7" }) do
		load_terrain(name, "1", options_dirt)
	end
end

local function load_sand_transitions(name)
	if not disable_water_transitions then
		data.raw.tile[name].transitions[1].spritesheet = base .. "water-transitions/sand.png"
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short
		data.raw.tile[name].transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-sand-mask.png"

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = base .. "water-transitions/sand-transition.png"
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall
		data.raw.tile[name].transitions_between_transitions[1].effect_map_layout.spritesheet = base .. "effect-maps/water-sand-to-land-mask.png"
		data.raw.tile[name].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition
	end

	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[2].spritesheet = out_of_map_transition
		data.raw.tile[name].transitions[2].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile[name].transitions_between_transitions[2].spritesheet = base .. "out-of-map-transition/sand-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile[name].transitions_between_transitions[3].spritesheet = base .. "out-of-map-transition/sand-shore-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[3].effect_map_layout.spritesheet = base .. "effect-maps/water-sand-to-out-of-map-mask.png"
		data.raw.tile[name].transitions_between_transitions[3].water_patch = patch_for_inner_corner_of_transition_between_transition
	end
end

if not settings.startup["f_hd_a_bg_tn_disable_sand"].value then
	load_sand_transitions("sand-1")
	load_sand_transitions("sand-2")
	load_sand_transitions("sand-3")

	local options_sand = {
		max_size = 8,
		[2] = { probability = 0.39, weights = { 0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020 } },
		[4] = { probability = 0.20, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } },
		[8] = { probability = 0.10, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } }
	}

	load_terrain("sand-1", "4", options_sand)
	load_terrain("sand-2", "4", options_sand)
	load_terrain("sand-3", "4", {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 0.39, weights = { 0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020 } },
		[4] = { probability = 0.39, weights = { 0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020 } }
	})
end

if not settings.startup["f_hd_a_bg_tn_disable_dessert"].value then
	load_grass_transitions("red-desert-0")
	load_transitions("red-desert-1", true, false)
	load_transitions("red-desert-2", true, false)
	load_transitions("red-desert-3", true, false)

	local options_dessert_1 = {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
		[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 } }
	}

	load_terrain("red-desert-0", "3", options_dessert_1)
	load_terrain("red-desert-1", "1", options_dessert_1)

	local options_dessert_2 = {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
		[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 } },
		[8] = { probability = 1.00, weights = { 0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020 } }
	}

	load_terrain("red-desert-2", "1", options_dessert_2)
	load_terrain("red-desert-3", "1", options_dessert_2)
end

load_transitions("landfill")
load_transitions("nuclear-ground")

local function load_water_transitions(name)
	data.raw.tile[name].transitions[1].spritesheet = base .. "out-of-map-transition/water-shallow-out-of-map-transition.png"
	data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

	data.raw.tile[name].transitions_between_transitions[1].spritesheet = base .. "out-of-map-transition/water-shallow-out-of-map-transition-to-water.png"
	data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
end

if not disable_out_of_map_transitions then
	data.raw.tile["water"].transitions[1].spritesheet = base .. "out-of-map-transition/water-out-of-map-transition-tintable.png"
	data.raw.tile["water"].transitions[1].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

	load_water_transitions("water-mud")
	load_water_transitions("water-shallow")
end
