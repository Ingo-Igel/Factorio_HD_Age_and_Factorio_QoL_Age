if not settings.startup["f_hd_a_bg_b_disable_transitions"].value then
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

	tile_spritesheet_layout_hd.transition_8_8_8_4_4 = {
		scale = 0.25,
		inner_corner_count = 8,
		outer_corner_count = 8,
		side_count = 8,
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

	-- CONCRETE
	local concrete_to_out_of_map_transition = {
		to_tiles = out_of_map_tile_type_names,
		transition_group = out_of_map_transition_group_id,

		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,

		spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
	}

	local concrete_transitions = {
		{
			to_tiles = water_tile_type_names,
			transition_group = water_transition_group_id,
			spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/concrete.png",
			layout = tile_spritesheet_layout_hd.transition_8_8_8_4_4,
			background_enabled = false,
			effect_map_layout = {
				spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/effect-maps/water-stone-mask.png",
				inner_corner_count = 1,
				outer_corner_count = 1,
				side_count = 1,
				u_transition_count = 1,
				o_transition_count = 1
			}
		},
	concrete_to_out_of_map_transition
	}

	local concrete_transitions_between_transitions = {
		{
			transition_group1 = default_transition_group_id,
			transition_group2 = water_transition_group_id,
			spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/concrete-transitions.png",
			layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
			background_enabled = false,
			effect_map_layout = {
				spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
				o_transition_count = 0
			}
		},
		{
			transition_group1 = default_transition_group_id,
			transition_group2 = out_of_map_transition_group_id,
			background_layer_offset = 1,
			background_layer_group = "zero",
			offset_background_layer_by_tile_layer = true,
			spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png",
			layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		},
		{
			transition_group1 = water_transition_group_id,
			transition_group2 = out_of_map_transition_group_id,
			background_layer_offset = 1,
			background_layer_group = "zero",
			offset_background_layer_by_tile_layer = true,
			spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png",
			layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
			effect_map_layout = {
				spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
				u_transition_count = 0,
				o_transition_count = 0
			}
		}
	}

	-- STONE_PATH
	local stone_path_to_out_of_map_transition = {
		to_tiles = out_of_map_tile_type_names,
		transition_group = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1,
		mask_enabled = false
	}

	local stone_path_transitions = {
		{
			to_tiles = water_tile_type_names,
			transition_group = water_transition_group_id,
			spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/stone-path.png",
			layout = tile_spritesheet_layout_hd.transition_8_8_8_4_4,
			background_enabled = false,
			effect_map_layout = {
				spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/effect-maps/water-stone-mask.png",
				inner_corner_count = 1,
				outer_corner_count = 1,
				side_count = 1,
				u_transition_count = 1,
				o_transition_count = 1
			}
		},
	stone_path_to_out_of_map_transition
	}

	local stone_path_transitions_between_transitions = {
		{
			transition_group1 = default_transition_group_id,
			transition_group2 = water_transition_group_id,
			spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/stone-path-transitions.png",
			layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
			background_enabled = false,
			effect_map_layout = {
				spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
				o_transition_count = 0
			}
		},
		{
			transition_group1 = default_transition_group_id,
			transition_group2 = out_of_map_transition_group_id,
			background_layer_offset = 1,
			background_layer_group = "zero",
			offset_background_layer_by_tile_layer = true,
			spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition-b.png",
			layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
			mask_enabled = false
		},
		{
			transition_group1 = water_transition_group_id,
			transition_group2 = out_of_map_transition_group_id,
			background_layer_offset = 1,
			background_layer_group = "zero",
			offset_background_layer_by_tile_layer = true,
			spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/stone-path-shore-out-of-map-transition.png",
			layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
			mask_enabled = false,
			effect_map_layout = {
				spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
				u_transition_count = 0,
				o_transition_count = 0
			}
		}
	}

	data.raw["tile"]["stone-path"].transitions = stone_path_transitions
	data.raw["tile"]["stone-path"].transitions_between_transitions = stone_path_transitions_between_transitions

	data.raw["tile"]["concrete"].transitions = concrete_transitions
	data.raw["tile"]["concrete"].transitions_between_transitions = concrete_transitions_between_transitions

	data.raw["tile"]["refined-concrete"].transitions = concrete_transitions
	data.raw["tile"]["refined-concrete"].transitions_between_transitions = concrete_transitions_between_transitions
end