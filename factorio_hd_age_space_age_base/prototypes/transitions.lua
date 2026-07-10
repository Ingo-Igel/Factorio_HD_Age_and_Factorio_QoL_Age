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

local base = "__factorio_hd_age_space_age_base__/data/space-age/graphics/terrain/"
local concrete_mask = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-mask.png"
local concrete_out_of_map_mask = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png"

local function load_transitions(name, refined, foundation)
	if not settings.startup["f_hd_a_sa_b_disable_water-transitions"].value and foundation then
		data.raw.tile[name].transitions[1].spritesheet = base .. "water-transitions/" .. name .. ".png"
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, false)
		data.raw.tile[name].transitions[1].effect_map_layout.spritesheet = concrete_mask

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = base .. "water-transitions/" .. name .. "-transitions.png"
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, true)
		data.raw.tile[name].transitions_between_transitions[1].effect_map_layout.spritesheet = concrete_mask
	end

	if not settings.startup["f_hd_a_sa_b_disable_out-of-map-transitions"].value then
		if foundation then
			data.raw.tile[name].transitions[3].spritesheet = base .. "out-of-map-transition/" .. name .. "-out-of-map-transition.png"
			data.raw.tile[name].transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, false)

			data.raw.tile[name].transitions_between_transitions[2].spritesheet = base .. "out-of-map-transition/" .. name .. "-out-of-map-transition-b.png"
			data.raw.tile[name].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)

			data.raw.tile[name].transitions_between_transitions[3].spritesheet = base .. "out-of-map-transition/" .. name .. "-shore-out-of-map-transition.png"
			data.raw.tile[name].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)
			data.raw.tile[name].transitions_between_transitions[3].effect_map_layout.spritesheet = concrete_out_of_map_mask
		end

		data.raw.tile[name].transitions_between_transitions[5].spritesheet = base .. "out-of-map-transition/" .. name .. "-lava-shore-out-of-map.png"
		data.raw.tile[name].transitions_between_transitions[5].lightmap_layout = { spritesheet = base .. "out-of-map-transition/" .. name .. "-lava-shore-out-of-map-lightmap.png" }
		data.raw.tile[name].transitions_between_transitions[5].layout = tile_spritesheet_layout_hd.concrete_layout(refined, true, true)
		data.raw.tile[name].transitions_between_transitions[5].effect_map_layout.spritesheet = concrete_out_of_map_mask
	end

	if not settings.startup["f_hd_a_sa_b_disable_lava-transitions"].value then
		local entry_number = foundation and 2 or 3

		data.raw.tile[name].transitions[entry_number].spritesheet = base .. "lava-transitions/" .. name .. "-lava.png"
		data.raw.tile[name].transitions[entry_number].lightmap_layout = { spritesheet = base .. "lava-transitions/" .. name .. "-lava-lightmap.png" }
		data.raw.tile[name].transitions[entry_number].layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, false)
		data.raw.tile[name].transitions[entry_number].effect_map_layout.spritesheet = concrete_mask

		data.raw.tile[name].transitions_between_transitions[4].spritesheet = base .. "lava-transitions/" .. name .. "-transitions-lava.png"
		data.raw.tile[name].transitions_between_transitions[4].lightmap_layout = { spritesheet = base .. "lava-transitions/" .. name .. "-transitions-lightmap.png" }
		data.raw.tile[name].transitions_between_transitions[4].layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, true)
		data.raw.tile[name].transitions_between_transitions[4].effect_map_layout.spritesheet = concrete_mask
	end
end

load_transitions("stone-path", false, false)
load_transitions("concrete", false, false)
load_transitions("refined-concrete", true, false)
load_transitions("foundation", false, true)
