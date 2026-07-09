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

if not settings.startup["f_hd_a_sa_b_disable_water-transitions"].value then
	data.raw.tile["foundation"].transitions[1].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/water-transitions/foundation.png"
	data.raw.tile["foundation"].transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false)
	data.raw.tile["foundation"].transitions[1].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"

	data.raw.tile["foundation"].transitions_between_transitions[1].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/water-transitions/foundation-transitions.png"
	data.raw.tile["foundation"].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true)
	data.raw.tile["foundation"].transitions_between_transitions[1].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"
end

if not settings.startup["f_hd_a_sa_b_disable_lava-transitions"].value then
	data.raw.tile["foundation"].transitions[2].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/foundation-lava.png"
	data.raw.tile["foundation"].transitions[2].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/foundation-lava-lightmap.png" }
	data.raw.tile["foundation"].transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false)
	data.raw.tile["foundation"].transitions[2].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"

	data.raw.tile["foundation"].transitions_between_transitions[4].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/foundation-transitions-lava.png"
	data.raw.tile["foundation"].transitions_between_transitions[4].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/foundation-transitions-lightmap.png" }
	data.raw.tile["foundation"].transitions_between_transitions[4].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true)
	data.raw.tile["foundation"].transitions_between_transitions[4].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"

	data.raw.tile["stone-path"].transitions[3].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/stone-path-lava.png"
	data.raw.tile["stone-path"].transitions[3].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/stone-path-lava-lightmap.png" }
	data.raw.tile["stone-path"].transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false)
	data.raw.tile["stone-path"].transitions[3].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"

	data.raw.tile["stone-path"].transitions_between_transitions[4].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/stone-path-lava-transitions.png"
	data.raw.tile["stone-path"].transitions_between_transitions[4].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/stone-path-lava-transitions-lightmap.png" }
	data.raw.tile["stone-path"].transitions_between_transitions[4].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true)
	data.raw.tile["stone-path"].transitions_between_transitions[4].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"

	data.raw.tile["concrete"].transitions[3].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/concrete-lava.png"
	data.raw.tile["concrete"].transitions[3].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/concrete-lava-lightmap.png" }
	data.raw.tile["concrete"].transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, false)
	data.raw.tile["concrete"].transitions[3].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"

	data.raw.tile["concrete"].transitions_between_transitions[4].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/concrete-transitions-lava.png"
	data.raw.tile["concrete"].transitions_between_transitions[4].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/concrete-transitions-lightmap.png" }
	data.raw.tile["concrete"].transitions_between_transitions[4].layout = tile_spritesheet_layout_hd.concrete_layout(false, false, true)
	data.raw.tile["concrete"].transitions_between_transitions[4].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"

	data.raw.tile["refined-concrete"].transitions[3].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/refined-concrete-lava.png"
	data.raw.tile["refined-concrete"].transitions[3].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/refined-concrete-lava-lightmap.png" }
	data.raw.tile["refined-concrete"].transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(true, false, false)
	data.raw.tile["refined-concrete"].transitions[3].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"


	data.raw.tile["refined-concrete"].transitions_between_transitions[4].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/refined-concrete-transitions-lava.png"
	data.raw.tile["refined-concrete"].transitions_between_transitions[4].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/lava-transitions/refined-concrete-transitions-lightmap.png" }
	data.raw.tile["refined-concrete"].transitions_between_transitions[4].layout = tile_spritesheet_layout_hd.concrete_layout(true, false, true)
	data.raw.tile["refined-concrete"].transitions_between_transitions[4].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"
end


if not settings.startup["f_hd_a_sa_b_disable_out-of-map-transitions"].value then
	data.raw.tile["foundation"].transitions[3].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-out-of-map-transition.png"
	data.raw.tile["foundation"].transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, false)

	data.raw.tile["foundation"].transitions_between_transitions[2].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-out-of-map-transition-b.png"
	data.raw.tile["foundation"].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)

	data.raw.tile["foundation"].transitions_between_transitions[3].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-shore-out-of-map-transition.png"
	data.raw.tile["foundation"].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)
	data.raw.tile["foundation"].transitions_between_transitions[3].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png"

	data.raw.tile["foundation"].transitions_between_transitions[5].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-lava-shore-out-of-map.png"
	data.raw.tile["foundation"].transitions_between_transitions[5].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/foundation-lava-shore-out-of-map-lightmap.png" }
	data.raw.tile["foundation"].transitions_between_transitions[5].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)
	data.raw.tile["foundation"].transitions_between_transitions[5].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png"

	data.raw.tile["stone-path"].transitions_between_transitions[5].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/stone-path-lava-shore-out-of-map.png"
	data.raw.tile["stone-path"].transitions_between_transitions[5].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/stone-path-lava-shore-out-of-map-lightmap.png" }
	data.raw.tile["stone-path"].transitions_between_transitions[5].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)
	data.raw.tile["stone-path"].transitions_between_transitions[5].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png"

	data.raw.tile["concrete"].transitions_between_transitions[5].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/concrete-lava-shore-out-of-map.png"
	data.raw.tile["concrete"].transitions_between_transitions[5].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/concrete-lava-shore-out-of-map-lightmap.png" }
	data.raw.tile["concrete"].transitions_between_transitions[5].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)
	data.raw.tile["concrete"].transitions_between_transitions[5].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png"

	data.raw.tile["refined-concrete"].transitions_between_transitions[5].spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/refined-concrete-lava-shore-out-of-map.png"
	data.raw.tile["refined-concrete"].transitions_between_transitions[5].lightmap_layout = { spritesheet = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/out-of-map-transition/refined-concrete-lava-shore-out-of-map-lightmap.png" }
	data.raw.tile["refined-concrete"].transitions_between_transitions[5].layout = tile_spritesheet_layout_hd.concrete_layout(true, true, true)
	data.raw.tile["refined-concrete"].transitions_between_transitions[5].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png"
end
