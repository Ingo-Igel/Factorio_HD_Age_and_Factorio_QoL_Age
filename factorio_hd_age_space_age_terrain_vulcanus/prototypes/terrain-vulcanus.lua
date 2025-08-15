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

local function tile_variations_template_hd_extra(high_res_picture, high_res_transition_mask, options)
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

local function tile_variations_template_with_transitions_hd(high_res_picture, options)
	local result = tile_variations_template_hd(high_res_picture, high_res_picture, options)

	if result.transition then
		result.transition.layout = {
			scale = 0.25,
			inner_corner_x = 1216 * 2*2,
			outer_corner_x = 1504 * 2*2,
			side_x         = 1792 * 2*2,
			u_transition_x = 1056 * 2*2,
			o_transition_x = 544 * 2*2,
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count         = 8,
			u_transition_count = 1,
			o_transition_count = 1,
			u_transition_line_length = 4,
			o_transition_line_length = 4,
			overlay = { x_offset = 0 }
		}
	end

	return result
end

local function tile_variations_template_with_transitions_and_light_hd(spritesheet, lightmap_spritesheet, options)
	local result = tile_variations_template_with_transitions_hd(spritesheet, options)

	result.light = tile_variations_template_hd(lightmap_spritesheet, nil, { empty_transitions = true }).main
	if result.transition then
		result.transition.lightmap_layout = { spritesheet = lightmap_spritesheet }
	end

	return result
end

local tile_spritesheet_layout_hd = {}
tile_spritesheet_layout_hd.transition_16_16_16_4_4 = {
	scale = 0.25,
	inner_corner_count = 16,
	outer_corner_count = 16,
	side_count = 16,
	u_transition_count = 4,
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

local lava_patch = {
	filename = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/water-transitions/lava-patch.png",
	scale = 0.25,
	width = 64*2,
	height = 64*2
}

local lava_stone_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,

		spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/water-transitions/lava-stone-cold.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png",
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
		spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/water-transitions/lava-stone.png",
		lightmap_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/water-transitions/lava-stone-lightmap.png"
		},
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png",
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count = 8,
			u_transition_count = 2,
			o_transition_count = 1
		}
	},
	{
		to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
		transition_group = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
		overlay_enabled = false
	}
}

local lava_stone_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/water-transitions/lava-stone-cold-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
			o_transition_count = 0
		},
		water_patch = lava_patch
	},
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/out-of-map-transition/lava-stone-cold-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
			o_transition_count = 0
		}
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = lava_transition_group_id,
		spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/water-transitions/lava-stone-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
			o_transition_count = 0
		},
		water_patch = lava_patch
	},
	{
		transition_group1 = lava_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/out-of-map-transition/lava-stone-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
			o_transition_count = 0
		}
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		overlay_enabled = false
	}
}

if not settings.startup["f_hd_a_sa_tv_disable_lava"].value then
	data.raw["tile"]["lava"].variants = tile_variations_template_hd_extra(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/lava.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lava-hot"].variants = {
		main = {
			{
				picture = "__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/lava-hot.png",
				count = 1,
				scale = 0.25,
				size = 1
			}
		},
		empty_transitions = true,
	}
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_ash"].value then
	data.raw["tile"]["volcanic-ash-cracks"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-ash-cracks"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-ash-cracks"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-ash-cracks.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-ash-dark"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-ash-dark"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-ash-dark"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-ash-dark.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-ash-flats"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-ash-flats"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-ash-flats"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-ash-flats.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-ash-light"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-ash-light"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-ash-light"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-ash-light.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-ash-soil"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-ash-soil"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-ash-soil"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-ash-soil.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_cracks"].value then
	data.raw["tile"]["volcanic-cracks"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-cracks"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-cracks"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-cracks.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-cracks-hot"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-cracks-hot"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-cracks-hot"].variants = tile_variations_template_with_transitions_and_light_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-cracks-hot.png",
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-cracks-hot-light.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-cracks-warm"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-cracks-warm"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-cracks-warm"].variants = tile_variations_template_with_transitions_and_light_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-cracks-warm.png",
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-cracks-warm-lightmap1.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_folds"].value then
	data.raw["tile"]["volcanic-folds"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-folds"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-folds"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-folds.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-folds-flat"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-folds-flat"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-folds-flat"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-folds-flat.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-folds-warm"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-folds-warm"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-folds-warm"].variants = tile_variations_template_with_transitions_and_light_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-folds-warm.png",
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-folds-warm-lightmap.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-jagged-ground"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-jagged-ground"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-jagged-ground"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-jagged-ground.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_stone"].value then
	data.raw["tile"]["volcanic-pumice-stones"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-pumice-stones"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-pumice-stones"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-pumice-stones.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-smooth-stone"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-smooth-stone"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-smooth-stone"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-smooth-stone.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["volcanic-smooth-stone-warm"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-smooth-stone-warm"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-smooth-stone-warm"].variants = tile_variations_template_with_transitions_and_light_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-smooth-stone-warm.png",
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-smooth-stone-warm-lightmap.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_soil"].value then
	data.raw["tile"]["volcanic-soil-dark"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-soil-dark"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-soil-dark"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-soil-dark.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)

	data.raw["tile"]["volcanic-soil-light"].transitions = lava_stone_transitions
	data.raw["tile"]["volcanic-soil-light"].transitions_between_transitions = lava_stone_transitions_between_transitions
	data.raw["tile"]["volcanic-soil-light"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/vulcanus/volcanic-soil-light.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
			[4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
		}
	)
end