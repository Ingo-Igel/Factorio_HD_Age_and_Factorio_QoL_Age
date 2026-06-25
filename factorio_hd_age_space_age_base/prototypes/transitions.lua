if not settings.startup["f_hd_a_bg_b_disable_transitions"].value then
	local tile_spritesheet_layout_hd = {}

	function tile_spritesheet_layout_hd.concrete_layout(refined, out_of_map, transition_to_transition)
		return
		{
			scale                    = 0.5,
			inner_corner_count       = refined and 8 or (transition_to_transition and 3 or 16),
			outer_corner_count       = refined and 4 or (transition_to_transition and 3 or 8),
			side_count               = refined and 8 or (transition_to_transition and 3 or 16),
			u_transition_count       = transition_to_transition and 1 or 4,
			o_transition_count       = transition_to_transition and 0 or 4,
			inner_corner_y           = 0,
			outer_corner_y           = out_of_map and 768 * 2 or 576 * 2,
			side_y                   = out_of_map and 1280 * 2 or 1152 * 2,
			u_transition_y           = out_of_map and 1792 * 2 or 1728 * 2,
			o_transition_y           = out_of_map and 2304 * 2 or 2304 * 2,
			inner_corner_tile_height = out_of_map and 3 or 2,
			outer_corner_tile_height = 2,
			side_tile_height         = 2,
			u_transition_tile_height = 2,
			overlay                  = { x_offset = 0 },
			mask                     = { x_offset = refined and 1024 * 2 or 2048 * 2 },
			background               = { x_offset = refined and 512 * 2 or 1024 * 2 }
		}
	end

	data.raw["tile"]["foundation"].transitions = {
		{
			to_tiles = water_tile_type_names,
			transition_group = water_transition_group_id,
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/water-transitions/foundation.png",
			layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false),
			background_enabled = true,
			effect_map_layout = {
				spritesheet =
				"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
				inner_corner_count = 1,
				outer_corner_count = 1,
				side_count = 1,
				u_transition_count = 1,
				o_transition_count = 1
			}
		},
		{
			to_tiles = lava_tile_type_names,
			transition_group = lava_transition_group_id,
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/foundation-lava.png",
			lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/foundation-lava-lightmap.png" },
			layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false),
			background_enabled = false,
			effect_map_layout = {
				spritesheet =
				"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
				inner_corner_count = 1,
				outer_corner_count = 1,
				side_count = 1,
				u_transition_count = 1,
				o_transition_count = 1
			}
		},
		{
			to_tiles = out_of_map_tile_type_names,
			transition_group = out_of_map_transition_group_id,
			background_layer_offset = 1,
			background_layer_group = "zero",
			offset_background_layer_by_tile_layer = true,
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-out-of-map-transition.png",
			layout = tile_spritesheet_layout_hd.concrete_layout(false, true, false),
		}
	}

	data.raw["tile"]["foundation"].transitions_between_transitions = {
		{
			transition_group1 = default_transition_group_id,
			transition_group2 = water_transition_group_id,
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/water-transitions/foundation-transitions.png",
			layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true),
			background_enabled = true,
			effect_map_layout = {
				spritesheet =
				"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
				inner_corner_count = 1,
				outer_corner_count = 1,
				side_count = 1,
				u_transition_count = 1,
				o_transition_count = 1
			}
		},
		{
			transition_group1 = default_transition_group_id,
			transition_group2 = out_of_map_transition_group_id,
			background_layer_offset = 1,
			background_layer_group = "zero",
			offset_background_layer_by_tile_layer = true,
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-out-of-map-transition-b.png",
			layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true),
		},
		{
			transition_group1 = water_transition_group_id,
			transition_group2 = out_of_map_transition_group_id,
			background_layer_offset = 1,
			background_layer_group = "zero",
			offset_background_layer_by_tile_layer = true,
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-shore-out-of-map-transition.png",
			layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true),
			effect_map_layout = {
				spritesheet =
				"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png",
				inner_corner_count = 1,
				outer_corner_count = 1,
				side_count = 1,
				u_transition_count = 1,
				o_transition_count = 1
			}
		},
		{
			transition_group1 = default_transition_group_id,
			transition_group2 = lava_transition_group_id,
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/foundation-transitions-lava.png",
			lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/foundation-transitions-lightmap.png" },
			layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true),
			background_enabled = false,
			effect_map_layout = {
				spritesheet =
				"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
				inner_corner_count = 1,
				outer_corner_count = 1,
				side_count = 1,
				u_transition_count = 1,
				o_transition_count = 1
			}
		},
		{
			transition_group1 = lava_transition_group_id,
			transition_group2 = out_of_map_transition_group_id,
			background_layer_offset = 1,
			background_layer_group = "zero",
			offset_background_layer_by_tile_layer = true,
			background_enabled = true,
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-lava-shore-out-of-map.png",
			lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-lava-shore-out-of-map-lightmap.png" },
			layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true),
			effect_map_layout = {
				spritesheet =
				"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png",
				inner_corner_count = 1,
				outer_corner_count = 1,
				side_count = 1,
				u_transition_count = 1,
				o_transition_count = 1
			}
		}
	}


	data.raw.tile["stone-path"].transitions[3] = {
		to_tiles = lava_tile_type_names,
		transition_group = lava_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/stone-path-lava.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/stone-path-lava-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false),
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}

	data.raw.tile["stone-path"].transitions_between_transitions[4] = {
		transition_group1 = default_transition_group_id,
		transition_group2 = lava_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/stone-path-lava-transitions.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/stone-path-lava-transitions-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true),
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}
	data.raw.tile["stone-path"].transitions_between_transitions[5] = {
		transition_group1 = lava_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		background_enabled = true,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/stone-path-lava-shore-out-of-map.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/stone-path-lava-shore-out-of-map-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true),
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}
	data.raw.tile["concrete"].transitions[3] = {
		to_tiles = lava_tile_type_names,
		transition_group = lava_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/concrete-lava.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/concrete-lava-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false),
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}
	data.raw.tile["concrete"].transitions_between_transitions[4] = {
		transition_group1 = default_transition_group_id,
		transition_group2 = lava_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/concrete-transitions-lava.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/concrete-transitions-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true),
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}
	data.raw.tile["concrete"].transitions_between_transitions[5] = {
		transition_group1 = lava_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		background_enabled = true,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/concrete-lava-shore-out-of-map.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/concrete-lava-shore-out-of-map-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true),
		effect_map_layout =
		{
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}

	data.raw.tile["refined-concrete"].transitions[3] = {
		to_tiles = lava_tile_type_names,
		transition_group = lava_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/refined-concrete-lava.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/refined-concrete-lava-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(true, false, false),
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}
	data.raw.tile["refined-concrete"].transitions_between_transitions[4] = {
		transition_group1 = default_transition_group_id,
		transition_group2 = lava_transition_group_id,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/refined-concrete-transitions-lava.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/refined-concrete-transitions-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(true, false, true),
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}
	data.raw.tile["refined-concrete"].transitions_between_transitions[5] = {
		transition_group1 = lava_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		background_enabled = true,
		spritesheet =
		"__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/refined-concrete-lava-shore-out-of-map.png",
		lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/refined-concrete-lava-shore-out-of-map-lightmap.png" },
		layout = tile_spritesheet_layout_hd.concrete_layout(true, true, true),
		effect_map_layout = {
			spritesheet =
			"__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png",
			inner_corner_count = 1,
			outer_corner_count = 1,
			side_count = 1,
			u_transition_count = 1,
			o_transition_count = 1
		}
	}
end
