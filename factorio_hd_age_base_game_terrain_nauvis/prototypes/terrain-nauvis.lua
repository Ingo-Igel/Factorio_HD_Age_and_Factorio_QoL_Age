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
				outer_corner_x = 576*2,
				side_x = 1152*2,
				u_transition_x = 1728*2,
				o_transition_x = 2304*2,
				mask = { y_offset = 0 }
			}
		}
	end

	return result
end

local tile_spritesheet_layout_hd = {}

tile_spritesheet_layout_hd.transition_3_3_3_1_0 = {
	scale = 0.25,
	inner_corner_count = 3,
	outer_corner_count = 3,
	side_count = 3,
	u_transition_count = 1,
	o_transition_count = 0,
	inner_corner_y = 0,
	outer_corner_y = 576*2,
	side_y = 1152*2,
	u_transition_y = 1728*2,
	o_transition_y = 2304*2,
	inner_corner_tile_height = 2,
	outer_corner_tile_height = 2,
	side_tile_height = 2,
	u_transition_tile_height = 2,
	overlay    = { x_offset = 0 },
	mask       = { x_offset = 2176*2 },
	background = { x_offset = 1088*2 }
}

tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall = {
	scale = 0.25,
	inner_corner_count = 3,
	outer_corner_count = 3,
	side_count = 3,
	u_transition_count = 1,
	o_transition_count = 0,
	inner_corner_y = 0,
	outer_corner_y = 576*2,
	side_y = 1152*2,
	u_transition_y = 1728*2,
	o_transition_y = 2304*2,
	u_transition_tile_height = 2,
	overlay    = { x_offset = 0 },
	mask       = { x_offset = 2176*2 },
	background = { x_offset = 1088*2 }
}

tile_spritesheet_layout_hd.simple_3_3_3_1_0_three_way_edge_mask = {
	spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/sand-water-edge-3-way-transition.png",
	scale = 0.25,
	tile_height = 1,
	x = 0,
	count = 0,
	inner_corner_count = 3,
	outer_corner_count = 3,
	side_count = 3,
	u_transition_count = 1,
	o_transition_count = 0,
	inner_corner_y = 0,
	outer_corner_y = 576*2,
	side_y = 1152*2,
	u_transition_y = 1728*2,
	o_transition_y = 2304*2
}

tile_spritesheet_layout_hd.transition_4_4_8_1_1 = {
	scale = 0.25,
	inner_corner_count = 4,
	outer_corner_count = 4,
	side_count = 8,
	u_transition_count = 1,
	o_transition_count = 1,
	inner_corner_y = 0,
	outer_corner_y = 576*2,
	side_y = 1152*2,
	u_transition_y = 1728*2,
	o_transition_y = 2304*2,
	inner_corner_tile_height = 2,
	outer_corner_tile_height = 2,
	side_tile_height = 2,
	u_transition_tile_height = 2,
	overlay    = { x_offset = 0 },
	mask       = { x_offset = 2176*2 },
	background = { x_offset = 1088*2 }
}

tile_spritesheet_layout_hd.transition_8_8_8_2_4 = {
	scale = 0.25,
	inner_corner_count = 8,
	outer_corner_count = 8,
	side_count = 8,
	u_transition_count = 2,
	o_transition_count = 4,
	inner_corner_y = 0,
	outer_corner_y = 576*2,
	side_y = 1152*2,
	u_transition_y = 1728*2,
	o_transition_y = 2304*2,
	inner_corner_tile_height = 2,
	outer_corner_tile_height = 2,
	side_tile_height = 2,
	u_transition_tile_height = 2,
	overlay    = { x_offset = 0 },
	mask       = { x_offset = 2176*2 },
	background = { x_offset = 1088*2 }
}

tile_spritesheet_layout_hd.transition_16_16_16_4_8 = {
	scale = 0.25,
	inner_corner_count = 16,
	outer_corner_count = 16,
	side_count = 16,
	u_transition_count = 4,
	o_transition_count = 8,
	inner_corner_y = 0,
	outer_corner_y = 576*2,
	side_y = 1152*2,
	u_transition_y = 1728*2,
	o_transition_y = 2304*2,
	inner_corner_tile_height = 2,
	outer_corner_tile_height = 2,
	side_tile_height = 2,
	u_transition_tile_height = 2,
	overlay    = { x_offset = 0 },
	mask       = { x_offset = 2176*2 },
	background = { x_offset = 1088*2 }
}

tile_spritesheet_layout_hd.transition_16_16_16_4_8_short = {
	scale = 0.25,
	inner_corner_count = 16,
	outer_corner_count = 16,
	side_count = 16,
	u_transition_count = 4,
	o_transition_count = 8,
	inner_corner_y = 0,
	outer_corner_y = 576*2,
	side_y = 1152*2,
	u_transition_y = 1728*2,
	o_transition_y = 2304*2,
	overlay    = { x_offset = 0 },
	mask       = { x_offset = 2176*2 },
	background = { x_offset = 1088*2 }
}

tile_spritesheet_layout_hd.simple_white_mask = {
	spritesheet = "__core__/graphics/white-square.png",
	x = 0,
	y = 0,
	count = 1,
	scale = 32
}

local patch_for_inner_corner_of_transition_between_transition = {
	filename = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/water-patch.png",
	scale = 0.25,
	width = 64*2,
	height = 64*2
}

-- WATER
local water_shallow_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition-to-water.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		overlay_enabled = false
	}
}

local water_mud_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition-to-water.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		overlay_enabled = false
	}
}

local water_to_out_of_map_transition = {
	to_tiles = out_of_map_tile_type_names,
	transition_group = out_of_map_transition_group_id,
	overlay_layer_group = "zero",
	apply_effect_color_to_overlay = true,
	background_layer_offset = 1,
	background_layer_group = "zero",
	offset_background_layer_by_tile_layer = true,
	spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
	layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
	background_enabled = false,
	apply_waving_effect_on_masks = true,
	waving_effect_time_scale = 0.15 * 0.09,
	mask_enabled = true,
	mask_layout = {
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/water-edge-transition.png",
		count = 1,
		double_side_count = 0,
		scale = 0.25,
		outer_corner_x = 64*2,
		side_x = 128*2,
		u_transition_x = 192*2,
		o_transition_x = 256*2,
		y = 0
	}
}

local water_shallow_to_out_of_map_transition = {
	to_tiles = out_of_map_tile_type_names,
	transition_group = out_of_map_transition_group_id,
	background_layer_offset = 1,
	background_layer_group = "zero",
	offset_background_layer_by_tile_layer = true,
	spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/water-shallow-out-of-map-transition.png",
	layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
	overlay_enabled = false
}

local ground_to_out_of_map_transition = {
	to_tiles = out_of_map_tile_type_names,
	transition_group = out_of_map_transition_group_id,
	background_layer_offset = 1,
	background_layer_group = "zero",
	offset_background_layer_by_tile_layer = true,
	spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/out-of-map-transition.png",
	layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
	overlay_enabled = false
}

-- GRASS
local grass_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		side_weights = { 1, 1, 1, 1,  0.25, 0.25, 1, 1,  1, 1, 0.125, 0.25,  1, 1, 1, 1 },
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/grass.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-grass-mask.png",
			o_transition_count = 1
		}
	},
	ground_to_out_of_map_transition
}

local grass_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/grass-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		background_enabled = false,
		effect_map_layout = {
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-grass-to-land-mask.png",
		o_transition_count = 0
		},
		water_patch = patch_for_inner_corner_of_transition_between_transition
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/grass-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		overlay_enabled = false
	},
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/grass-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-grass-to-out-of-map-mask.png",
			o_transition_count = 0
		}
	}
}

-- DIRT_DRY
local dirt_out_of_map_transition = {
	transition_group1 = default_transition_group_id,
	transition_group2 = out_of_map_transition_group_id,
	background_layer_offset = 1,
	background_layer_group = "zero",
	offset_background_layer_by_tile_layer = true,
	spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
	layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
	overlay_enabled = false
}

local dry_dirt_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/dry-dirt.png",
		layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png",
			o_transition_count = 1
		}
	},
	ground_to_out_of_map_transition
}

local dry_dirt_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/dry-dirt-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
			o_transition_count = 0
		},

		water_patch = patch_for_inner_corner_of_transition_between_transition,
	},
	dirt_out_of_map_transition,
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
			u_transition_count = 0,
			o_transition_count = 0
		}
	}
}

-- DIRT_DARK
local dark_dirt_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/dark-dirt.png",
		layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png",
			o_transition_count = 1
		}
	},
	ground_to_out_of_map_transition
}

local dark_dirt_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/dark-dirt-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
			o_transition_count = 0
		},
		water_patch = patch_for_inner_corner_of_transition_between_transition,
	},
	dirt_out_of_map_transition,
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/dark-dirt-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
			u_transition_count = 0,
			o_transition_count = 0
		}
	}
}

-- SAND
local sand_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/sand.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-sand-mask.png",
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			u_transition_tile_height = 2,
			o_transition_count = 1
		},
		background_mask_layout = tile_spritesheet_layout_hd.simple_white_mask
	},
	ground_to_out_of_map_transition
}

local sand_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/sand-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-sand-to-land-mask.png",
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			o_transition_count = 0
		},
		water_patch = patch_for_inner_corner_of_transition_between_transition,
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/sand-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		overlay_enabled = false
	},
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/sand-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-sand-to-out-of-map-mask.png",
			o_transition_count = 0
		},
		background_mask_layout = tile_spritesheet_layout_hd.simple_3_3_3_1_0_three_way_edge_mask,
		draw_simple_outer_corner_over_diagonal = false,
		apply_waving_effect_on_background_mask = true,
		waving_effect_time_scale = 0.15 * 0.09,
		water_patch = patch_for_inner_corner_of_transition_between_transition
	}
}

-- NUCLEAR_GROUND
local nuclear_ground_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/nuclear-ground.png",
		layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png",
			o_transition_count = 1
		}
	},
	ground_to_out_of_map_transition
}

local nuclear_ground_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/nuclear-ground-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		background_enabled = false,
		effect_map_layout =
		{
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
			o_transition_count = 0
		},
		water_patch = patch_for_inner_corner_of_transition_between_transition,
	},
	dirt_out_of_map_transition,
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/nuclear-ground-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
			u_transition_count = 0,
			o_transition_count = 0
		}
	}
}

-- DIRT_LANDFILL
local landfill_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/landfill.png",
		layout = tile_spritesheet_layout_hd.transition_8_8_8_2_4,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png",
			o_transition_count = 1
		}
	},
	ground_to_out_of_map_transition
}

local landfill_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/water-transitions/landfill-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
			o_transition_count = 0
		},
		water_patch = patch_for_inner_corner_of_transition_between_transition
	},
	dirt_out_of_map_transition,
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/out-of-map-transition/landfill-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
			u_transition_count = 0,
			o_transition_count = 0
		}
	}
}

if not settings.startup["f_hd_a_bg_tn_disable_water_transitions"].value then
	data.raw["tile"]["water"].transitions = {water_to_out_of_map_transition}

	data.raw["tile"]["water-shallow"].transitions = {water_shallow_to_out_of_map_transition}
	data.raw["tile"]["water-shallow"].transitions_between_transitions = water_shallow_transitions_between_transitions

	data.raw["tile"]["water-mud"].transitions = {water_shallow_to_out_of_map_transition}
	data.raw["tile"]["water-mud"].transitions_between_transitions = water_mud_transitions_between_transitions
end

if not settings.startup["f_hd_a_bg_tn_disable_gras"].value then
	data.raw["tile"]["grass-1"].transitions = grass_transitions
	data.raw["tile"]["grass-1"].transitions_between_transitions = grass_transitions_between_transitions
	data.raw["tile"]["grass-1"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/grass-1.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
			[4] = { probability = 0.91, weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }, },
		}
	)

	data.raw["tile"]["grass-2"].transitions = grass_transitions
	data.raw["tile"]["grass-2"].transitions_between_transitions = grass_transitions_between_transitions
	data.raw["tile"]["grass-2"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/grass-2.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
			[4] = { probability = 0.75, weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 }, },
		}
	)

	data.raw["tile"]["grass-3"].transitions = grass_transitions
	data.raw["tile"]["grass-3"].transitions_between_transitions = grass_transitions_between_transitions
	data.raw["tile"]["grass-3"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/grass-3.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["grass-4"].transitions = grass_transitions
	data.raw["tile"]["grass-4"].transitions_between_transitions = grass_transitions_between_transitions
	data.raw["tile"]["grass-4"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/grass-4.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.5, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_bg_tn_disable_dirt"].value then
	data.raw["tile"]["dry-dirt"].transitions = dry_dirt_transitions
	data.raw["tile"]["dry-dirt"].transitions_between_transitions = dry_dirt_transitions_between_transitions
	data.raw["tile"]["dry-dirt"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dry-dirt.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["dirt-1"].transitions = dry_dirt_transitions
	data.raw["tile"]["dirt-1"].transitions_between_transitions = dry_dirt_transitions_between_transitions
	data.raw["tile"]["dirt-1"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-1.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["dirt-2"].transitions = dry_dirt_transitions
	data.raw["tile"]["dirt-2"].transitions_between_transitions = dry_dirt_transitions_between_transitions
	data.raw["tile"]["dirt-2"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-2.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["dirt-3"].transitions = dry_dirt_transitions
	data.raw["tile"]["dirt-3"].transitions_between_transitions = dry_dirt_transitions_between_transitions
	data.raw["tile"]["dirt-3"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-3.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["dirt-4"].transitions = dark_dirt_transitions
	data.raw["tile"]["dirt-4"].transitions_between_transitions = dark_dirt_transitions_between_transitions
	data.raw["tile"]["dirt-4"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-4.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["dirt-5"].transitions = dark_dirt_transitions
	data.raw["tile"]["dirt-5"].transitions_between_transitions = dark_dirt_transitions_between_transitions
	data.raw["tile"]["dirt-5"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-5.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["dirt-6"].transitions = dark_dirt_transitions
	data.raw["tile"]["dirt-6"].transitions_between_transitions = dark_dirt_transitions_between_transitions
	data.raw["tile"]["dirt-6"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-6.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["dirt-7"].transitions = dark_dirt_transitions
	data.raw["tile"]["dirt-7"].transitions_between_transitions = dark_dirt_transitions_between_transitions
	data.raw["tile"]["dirt-7"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/dirt-7.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)
end

if not settings.startup["f_hd_a_bg_tn_disable_sand"].value then
	data.raw["tile"]["sand-1"].transitions = sand_transitions
	data.raw["tile"]["sand-1"].transitions_between_transitions = sand_transitions_between_transitions
	data.raw["tile"]["sand-1"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/sand-1.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-4.png",
		{
			max_size = 8,
			[2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
			[4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
			[8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
		}
	)

	data.raw["tile"]["sand-2"].transitions = sand_transitions
	data.raw["tile"]["sand-2"].transitions_between_transitions = sand_transitions_between_transitions
	data.raw["tile"]["sand-2"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/sand-2.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-4.png",
		{
			max_size = 8,
			[2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
			[4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
			[8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
		}
	)

	data.raw["tile"]["sand-3"].transitions = sand_transitions
	data.raw["tile"]["sand-3"].transitions_between_transitions = sand_transitions_between_transitions
	data.raw["tile"]["sand-3"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/sand-3.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
			[4] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
		}
	)
end

if not settings.startup["f_hd_a_bg_tn_disable_dessert"].value then
	data.raw["tile"]["red-desert-0"].transitions = grass_transitions
	data.raw["tile"]["red-desert-0"].transitions_between_transitions = grass_transitions_between_transitions
	data.raw["tile"]["red-desert-0"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/red-desert-0.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-3.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["red-desert-1"].transitions = dry_dirt_transitions
	data.raw["tile"]["red-desert-1"].transitions_between_transitions = dry_dirt_transitions_between_transitions
	data.raw["tile"]["red-desert-1"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/red-desert-1.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["red-desert-2"].transitions = dry_dirt_transitions
	data.raw["tile"]["red-desert-2"].transitions_between_transitions = dry_dirt_transitions_between_transitions
	data.raw["tile"]["red-desert-2"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/red-desert-2.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
			[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
		}
	)

	data.raw["tile"]["red-desert-3"].transitions = dry_dirt_transitions
	data.raw["tile"]["red-desert-3"].transitions_between_transitions = dry_dirt_transitions_between_transitions
	data.raw["tile"]["red-desert-3"].variants = tile_variations_template_hd(
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/red-desert-3.png",
		"__factorio_hd_age_base_game_terrain_nauvis__/data/base/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 }, },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
			[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
		}
	)
end

if not settings.startup["f_hd_a_bg_tn_disable_nuclear_ground_transitions"].value then
	data.raw["tile"]["nuclear-ground"].transitions = nuclear_ground_transitions
	data.raw["tile"]["nuclear-ground"].transitions_between_transitions = nuclear_ground_transitions_between_transitions
end

if not settings.startup["f_hd_a_bg_tn_disable_landfill_transitions"].value then
	data.raw["tile"]["landfill"].transitions = landfill_transitions
	data.raw["tile"]["landfill"].transitions_between_transitions = landfill_transitions_between_transitions
end