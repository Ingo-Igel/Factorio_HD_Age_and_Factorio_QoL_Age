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

tile_spritesheet_layout_hd.transition_16_16_16_4_4 = {
	scale                    = 0.25,
	inner_corner_count       = 16,
	outer_corner_count       = 16,
	side_count               = 16,
	u_transition_count       = 4,
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

local ice_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/water-transitions/ice-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		background_enabled = false,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
			o_transition_count = 0
		},
		water_patch = {
			filename =
			"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/water-transitions/ice-patch.png",
			scale = 0.5,
			width = 64,
			height = 64
		}
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		overlay_enabled = false
	},
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
			u_transition_count = 0,
			o_transition_count = 0
		}
	}
}

local ice_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/water-transitions/ice-2.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png",
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count = 8,
			u_transition_count = 2,
			o_transition_count = 1
		}
	},
	{
		to_tiles = lava_tile_type_names,
		transition_group = lava_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/water-transitions/lava-stone.png",
		lightmap_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/water-transitions/lava-stone-lightmap.png"
		},
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4,
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png",
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count = 8,
			u_transition_count = 2,
			o_transition_count = 1
		}
	},
	{
		to_tiles = { "out-of-map", "empty-space", "oil-ocean-shallow" },
		transition_group = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet =
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
		overlay_enabled = false
	}
}

if not settings.startup["f_hd_a_sa_ta_disable_dust"].value then
	data.raw["tile"]["dust-crests"].transitions = ice_transitions
	data.raw["tile"]["dust-crests"].transitions_between_transitions = ice_transitions_between_transitions
	data.raw["tile"]["dust-crests"].variants = tile_variations_template_hd(
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/dust-crests.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
		}
	)

	data.raw["tile"]["dust-flat"].transitions = ice_transitions
	data.raw["tile"]["dust-flat"].transitions_between_transitions = ice_transitions_between_transitions
	data.raw["tile"]["dust-flat"].variants = tile_variations_template_hd(
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/dust-flat.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
		}
	)

	data.raw["tile"]["dust-lumpy"].transitions = ice_transitions
	data.raw["tile"]["dust-lumpy"].transitions_between_transitions = ice_transitions_between_transitions
	data.raw["tile"]["dust-lumpy"].variants = tile_variations_template_hd(
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/dust-lumpy.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
		}
	)

	data.raw["tile"]["dust-patchy"].transitions = ice_transitions
	data.raw["tile"]["dust-patchy"].transitions_between_transitions = ice_transitions_between_transitions
	data.raw["tile"]["dust-patchy"].variants = tile_variations_template_hd(
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/dust-patchy.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_ta_disable_ice"].value then
	data.raw["tile"]["ice-platform"].transitions = ice_transitions
	data.raw["tile"]["ice-platform"].transitions_between_transitions = ice_transitions_between_transitions

	data.raw["tile"]["ice-rough"].transitions = ice_transitions
	data.raw["tile"]["ice-rough"].transitions_between_transitions = ice_transitions_between_transitions
	data.raw["tile"]["ice-rough"].variants = tile_variations_template_hd(
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/ice-rough.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["ice-smooth"].transitions = ice_transitions
	data.raw["tile"]["ice-smooth"].transitions_between_transitions = ice_transitions_between_transitions
end

if not settings.startup["f_hd_a_sa_ta_disable_ice"].value then
	data.raw["tile"]["snow-crests"].transitions = ice_transitions
	data.raw["tile"]["snow-crests"].transitions_between_transitions = ice_transitions_between_transitions
	data.raw["tile"]["snow-crests"].variants = tile_variations_template_hd(
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/snow-crests.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
		}
	)

	data.raw["tile"]["snow-flat"].transitions = ice_transitions
	data.raw["tile"]["snow-flat"].transitions_between_transitions = ice_transitions_between_transitions
	data.raw["tile"]["snow-flat"].variants = tile_variations_template_hd(
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/snow-flat.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
		}
	)

	data.raw["tile"]["snow-lumpy"].transitions = ice_transitions
	data.raw["tile"]["snow-lumpy"].transitions_between_transitions = ice_transitions_between_transitions
	data.raw["tile"]["snow-lumpy"].variants = tile_variations_template_hd(
		"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/snow-lumpy.png",
		"__base__/graphics/terrain/masks/transition-4.png",
		{
			max_size = 4,
			[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
		}
	)

	data.raw["tile"]["snow-patchy"].transitions = ice_transitions
	data.raw["tile"]["snow-patchy"].transitions_between_transitions = ice_transitions_between_transitions
end
