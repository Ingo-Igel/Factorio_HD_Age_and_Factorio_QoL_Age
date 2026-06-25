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

function tile_variations_template_with_transitions_hd(high_res_picture, options)
	local result = tile_variations_template_hd(high_res_picture, high_res_picture, options)

	if result.transition then
		result.transition.layout =
		{
			scale                    = 0.5,
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

tile_spritesheet_layout_hd.simple_white_mask = {
	spritesheet = "__core__/graphics/white-square.png",
	x = 0,
	y = 0,
	count = 1,
	scale = 32
}

local patch_for_inner_corner_of_transition_between_transition = {
	filename =
	"__factorio_hd_age_space_age_terrain_fulgora__/data/base/graphics/terrain/water-transitions/water-patch.png",
	scale = 0.25,
	width = 64 * 2,
	height = 64 * 2
}

local fulgora_rock_sand_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/water-transitions/fulgora-rock-slab-transition.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short,
		background_enabled = false,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-mask.png",
			--tile_height = 2,
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			u_transition_tile_height = 2,
			o_transition_count = 1
		},
		background_mask_layout = tile_spritesheet_layout_hd.simple_white_mask
	},
	{
		to_tiles = out_of_map_tile_type_names,
		transition_group = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/fulgora-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
		overlay_enabled = false
	}
}

local fulgora_oil_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,

		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/water-transitions/fulgora-oil-sand.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short,
		background_enabled = false,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-mask.png",
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			u_transition_tile_height = 2,
			o_transition_count = 1
		},
		background_mask_layout = tile_spritesheet_layout_hd.simple_white_mask
	},
	{
		to_tiles = out_of_map_tile_type_names,
		transition_group = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/oil-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
		overlay_enabled = false
	}
}
local fulgora_oil_transitions_between_transitions = {
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/oil-out-of-map-transition-b.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		background_enabled = true,
		background_mask_layout = tile_spritesheet_layout_hd.simple_3_3_3_1_0_three_way_edge_mask,
	}
}

local fulgora_sand_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/water-transitions/fulgora-sand-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall,
		background_enabled = false,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-to-land-mask.png",
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
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/fulgora-out-of-map-transition-b.png",
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
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/fulgora-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-to-out-of-map-mask.png",
			o_transition_count = 0
		},
		background_mask_layout = tile_spritesheet_layout_hd.simple_3_3_3_1_0_three_way_edge_mask,
		water_patch = patch_for_inner_corner_of_transition_between_transition
	}
}

local fulgora_oil_sand_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/water-transitions/fulgora-oil-sand.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short,
		background_enabled = false,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-mask.png",
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			u_transition_tile_height = 2,
			o_transition_count = 1
		},
		background_mask_layout = tile_spritesheet_layout_hd.simple_white_mask
	},
	{
		to_tiles = out_of_map_tile_type_names,
		transition_group = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/oil-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
		overlay_enabled = false
	}
}
local fulgora_oil_sand_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/water-transitions/fulgora-oil-sand-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall,
		background_enabled = false,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-to-land-mask.png",
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
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/fulgora-out-of-map-transition.png",
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
		spritesheet =
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/fulgora-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-to-out-of-map-mask.png",
			o_transition_count = 0
		},
		background_mask_layout = tile_spritesheet_layout_hd.simple_white_mask,
		water_patch = patch_for_inner_corner_of_transition_between_transition
	}
}

if not settings.startup["f_hd_a_sa_tf_disable_fulgora_transitions"].value then
	data.raw["tile"]["fulgoran-dust"].transitions = fulgora_rock_sand_transitions
	data.raw["tile"]["fulgoran-dust"].transitions_between_transitions = fulgora_sand_transitions_between_transitions

	data.raw["tile"]["fulgoran-dunes"].transitions = fulgora_rock_sand_transitions
	data.raw["tile"]["fulgoran-dunes"].transitions_between_transitions = fulgora_sand_transitions_between_transitions

	data.raw["tile"]["fulgoran-sand"].transitions = fulgora_rock_sand_transitions
	data.raw["tile"]["fulgoran-sand"].transitions_between_transitions = fulgora_sand_transitions_between_transitions

	data.raw["tile"]["fulgoran-rock"].transitions = fulgora_rock_sand_transitions
	data.raw["tile"]["fulgoran-rock"].transitions_between_transitions = fulgora_sand_transitions_between_transitions

	data.raw["tile"]["fulgoran-paving"].transitions = fulgora_rock_sand_transitions
	data.raw["tile"]["fulgoran-paving"].transitions_between_transitions = fulgora_sand_transitions_between_transitions

	data.raw["tile"]["fulgoran-walls"].transitions = fulgora_rock_sand_transitions
	data.raw["tile"]["fulgoran-walls"].transitions_between_transitions = fulgora_sand_transitions_between_transitions

	data.raw["tile"]["fulgoran-conduit"].transitions = fulgora_rock_sand_transitions
	data.raw["tile"]["fulgoran-conduit"].transitions_between_transitions = fulgora_sand_transitions_between_transitions

	data.raw["tile"]["fulgoran-machinery"].transitions = fulgora_rock_sand_transitions
	data.raw["tile"]["fulgoran-machinery"].transitions_between_transitions = fulgora_sand_transitions_between_transitions

	data.raw["tile"]["oil-ocean-shallow"].transitions = fulgora_oil_sand_transitions
	data.raw["tile"]["oil-ocean-shallow"].transitions_between_transitions =
		fulgora_oil_sand_transitions_between_transitions

	data.raw["tile"]["oil-ocean-shallow-2"].transitions = fulgora_oil_sand_transitions
	data.raw["tile"]["oil-ocean-shallow-2"].transitions_between_transitions =
		fulgora_oil_sand_transitions_between_transitions

	data.raw["tile"]["oil-ocean-deep"].transitions = fulgora_oil_transitions
	data.raw["tile"]["oil-ocean-deep"].transitions_between_transitions = fulgora_oil_transitions_between_transitions

	data.raw["tile"]["oil-ocean-deep-2"].transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions)
	data.raw["tile"]["oil-ocean-deep-2"].transitions_between_transitions = table.deepcopy(data.raw.tile["water-shallow"]
		.transitions_between_transitions)
end

if not settings.startup["f_hd_a_sa_tf_disable_oil_ocean_deep"].value then
	data.raw["tile"]["oil-ocean-deep"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/oil-ocean-deep.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["oil-ocean-deep-2"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/oil-ocean-deep.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end
