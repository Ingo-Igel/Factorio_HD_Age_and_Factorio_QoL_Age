local tile_spritesheet_layout_hd = {}

function tile_spritesheet_layout_hd.concrete_layout(refined, out_of_map, transition_to_transition)
	return
	{
		scale                    = 0.25,
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

local concrete_mask = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"
local concrete_out_of_map_mask = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png"

if not settings.startup["f_hd_a_bg_b_disable_water-transitions"].value then
	data.raw.tile["stone-path"].transitions[1].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/stone-path.png"
	data.raw.tile["stone-path"].transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false)
	data.raw.tile["stone-path"].transitions[1].effect_map_layout.spritesheet = concrete_mask

	data.raw.tile["stone-path"].transitions_between_transitions[1].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/stone-path-transitions.png"
	data.raw.tile["stone-path"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true)
	data.raw.tile["stone-path"].transitions_between_transitions[1].effect_map_layout.spritesheet = concrete_mask

	data.raw.tile["concrete"].transitions[1].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/concrete.png"
	data.raw.tile["concrete"].transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false)
	data.raw.tile["concrete"].transitions[1].effect_map_layout.spritesheet = concrete_mask

	data.raw.tile["concrete"].transitions_between_transitions[1].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/concrete-transitions.png"
	data.raw.tile["concrete"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true)
	data.raw.tile["concrete"].transitions_between_transitions[1].effect_map_layout.spritesheet = concrete_mask


	data.raw.tile["refined-concrete"].transitions[1].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/refined-concrete.png"
	data.raw.tile["refined-concrete"].transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(true, false, false)
	data.raw.tile["refined-concrete"].transitions[1].effect_map_layout.spritesheet = concrete_mask

	data.raw.tile["refined-concrete"].transitions_between_transitions[1].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/water-transitions/refined-concrete-transitions.png"
	data.raw.tile["refined-concrete"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(true, false, true)
	data.raw.tile["refined-concrete"].transitions_between_transitions[1].effect_map_layout.spritesheet = concrete_mask
end

if not settings.startup["f_hd_a_bg_b_disable_out-of-map-transitions"].value then
	data.raw.tile["stone-path"].transitions[2].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition.png"
	data.raw.tile["stone-path"].transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, false)

	data.raw.tile["stone-path"].transitions_between_transitions[2].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition-b.png"
	data.raw.tile["stone-path"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)

	data.raw.tile["stone-path"].transitions_between_transitions[3].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/stone-path-shore-out-of-map-transition.png"
	data.raw.tile["stone-path"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)
	data.raw.tile["stone-path"].transitions_between_transitions[3].effect_map_layout.spritesheet = concrete_out_of_map_mask

	data.raw.tile["concrete"].transitions[2].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition.png"
	data.raw.tile["concrete"].transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, false)

	data.raw.tile["concrete"].transitions_between_transitions[2].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png"
	data.raw.tile["concrete"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)

	data.raw.tile["concrete"].transitions_between_transitions[3].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png"
	data.raw.tile["concrete"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)
	data.raw.tile["concrete"].transitions_between_transitions[3].effect_map_layout.spritesheet = concrete_out_of_map_mask

	data.raw.tile["refined-concrete"].transitions[2].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/refined-concrete-out-of-map-transition.png"
	data.raw.tile["refined-concrete"].transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(true, true, false)

	data.raw.tile["refined-concrete"].transitions_between_transitions[2].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/refined-concrete-out-of-map-transition-b.png"
	data.raw.tile["refined-concrete"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(true, true, true)

	data.raw.tile["refined-concrete"].transitions_between_transitions[3].spritesheet = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/out-of-map-transition/refined-concrete-shore-out-of-map-transition.png"
	data.raw.tile["refined-concrete"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(true, true, true)
	data.raw.tile["refined-concrete"].transitions_between_transitions[3].effect_map_layout.spritesheet = concrete_out_of_map_mask
end
