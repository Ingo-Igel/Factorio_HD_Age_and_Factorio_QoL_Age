local tile_spritesheet_layout_hd = {}

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

tile_spritesheet_layout_hd.simple_white_mask = {
	spritesheet = "__core__/graphics/white-square.png",
	x = 0,
	y = 0,
	count = 1,
	scale = 32
}

local water_patch = {
	filename = "__factorio_hd_age_space_age_terrain_fulgora__/data/base/graphics/terrain/water-transitions/water-patch.png",
	scale = 0.25,
	width = 64*2,
	height = 64*2
}

local fulgora_rock_sand_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,
		spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/water-transitions/fulgora-rock-slab-transition.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-mask.png",
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

local fulgora_oil_sand_transitions = {
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		background_layer_group = "water",
		background_layer_offset = -5,
		masked_background_layer_offset = 1,
		offset_background_layer_by_tile_layer = false,
		spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/water-transitions/fulgora-oil-sand-transition.png",
		layout = tile_spritesheet_layout_hd.transition_16_16_16_4_8_short,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-mask.png",
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

local fulgora_sand_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,
		spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/water-transitions/fulgora-sand-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0_only_u_tall,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-to-land-mask.png",
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			o_transition_count = 0
		},
		water_patch = water_patch
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/fulgora-sand-out-of-map-transition.png",
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
		spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/out-of-map-transition/fulgora-sand-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_terrain_fulgora__/data/space-age/graphics/terrain/effect-maps/water-fulgora-sand-to-out-of-map-mask.png",
			o_transition_count = 0
		},
		background_mask_layout = tile_spritesheet_layout_hd.simple_white_mask,
		water_patch = water_patch
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
	data.raw["tile"]["oil-ocean-shallow"].transitions_between_transitions = fulgora_sand_transitions_between_transitions
end