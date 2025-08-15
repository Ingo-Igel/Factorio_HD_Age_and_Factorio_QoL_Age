local tile_spritesheet_layout_hd = {}

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

tile_spritesheet_layout_hd.transition_3_3_3_1_0 =
{
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

data.raw["tile"]["foundation"].transitions[1] = {
	to_tiles = water_tile_type_names,
	transition_group = water_transition_group_id or 1,
	spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/water-transitions/foundation.png",
	layout = tile_spritesheet_layout_hd.transition_8_8_8_4_4,
	background_enabled = false,
	effect_map_layout = {
		spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/water-stone-mask.png",
		inner_corner_count = 1,
		outer_corner_count = 1,
		side_count = 1,
		u_transition_count = 1,
		o_transition_count = 1
	}
}

data.raw["tile"]["foundation"].transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id or 0,
		transition_group2 = water_transition_group_id or 1,
		spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/water-transitions/foundation-transitions.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		background_enabled = false,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
			o_transition_count = 0
		}
	},
	{
		transition_group1 = default_transition_group_id or 0,
		transition_group2 = out_of_map_transition_group_id or 2,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
	},
	{
		transition_group1 = water_transition_group_id or 1,
		transition_group2 = out_of_map_transition_group_id or 2,
		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,
		spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0,
		effect_map_layout = {
			spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
			u_transition_count = 0,
			o_transition_count = 0
		}
	}
}