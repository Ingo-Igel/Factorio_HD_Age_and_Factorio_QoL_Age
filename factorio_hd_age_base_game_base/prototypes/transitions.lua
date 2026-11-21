local disable_water_transitions = settings.startup["f_hd_a_bg_b_disable_water-transitions"].value
local disable_out_of_map_transitions = settings.startup["f_hd_a_bg_b_disable_out-of-map-transitions"].value
local base_path = {
	base = "__base__/graphics/terrain/",
	hd = "__factorio_hd_age_base_game_base__/data/base/graphics/terrain/"
}
local effect_map_paths = {
	original = {
		concrete = base_path.base .. "effect-maps/concrete-mask.png",
		concrete_out_of_map = base_path.base .. "effect-maps/concrete-out-of-map-mask.png"
	},
	hd = {
		concrete = base_path.hd .. "effect-maps/concrete-mask.png",
		concrete_out_of_map = base_path.hd .. "effect-maps/concrete-out-of-map-mask.png"
	}
}

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

local transition_tiles = {
	{ name = "stone-path",       refined = false },
	{ name = "concrete",         refined = false },
	{ name = "refined-concrete", refined = true  }
}

local function load_transitions(name, refined)
	local tile = data.raw.tile[name]
	if not tile then
		return
	end

	local transitions = tile.transitions or {}
	local transitions_between = tile.transitions_between_transitions or {}
	local original = {
		water = base_path.base .. "water-transitions/" .. name,
		out_of_map = base_path.base .. "out-of-map-transition/" .. name
	}
	local hd = {
		water = base_path.hd .. "water-transitions/" .. name,
		out_of_map = base_path.hd .. "out-of-map-transition/" .. name
	}

	for _, transition in ipairs(transitions) do
		if not disable_water_transitions
			and transition.spritesheet == original.water .. ".png"
			and transition.effect_map_layout
			and transition.effect_map_layout.spritesheet == effect_map_paths.original.concrete
		then
			transition.spritesheet = hd.water .. ".png"
			transition.layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, false)
			transition.effect_map_layout.spritesheet = effect_map_paths.hd.concrete
		elseif not disable_out_of_map_transitions
			and transition.spritesheet == original.out_of_map .. "-out-of-map-transition.png"
		then
			transition.spritesheet = hd.out_of_map .. "-out-of-map-transition.png"
			transition.layout = tile_spritesheet_layout_hd.concrete_layout(refined, true, false)
		end
	end

	for _, transition_between in ipairs(transitions_between) do
		if not disable_water_transitions
			and transition_between.spritesheet == original.water .. "-transitions.png"
			and transition_between.effect_map_layout
			and transition_between.effect_map_layout.spritesheet == effect_map_paths.original.concrete
		then
			transition_between.spritesheet = hd.water .. "-transitions.png"
			transition_between.layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, true)
			transition_between.effect_map_layout.spritesheet = effect_map_paths.hd.concrete
		elseif not disable_out_of_map_transitions
			and transition_between.spritesheet == original.out_of_map .. "-out-of-map-transition-b.png"
		then
			transition_between.spritesheet = hd.out_of_map .. "-out-of-map-transition-b.png"
			transition_between.layout = tile_spritesheet_layout_hd.concrete_layout(refined, true, true)
		elseif not disable_out_of_map_transitions
			and transition_between.spritesheet == original.out_of_map .. "-shore-out-of-map-transition.png"
			and transition_between.effect_map_layout
			and transition_between.effect_map_layout.spritesheet == effect_map_paths.original.concrete_out_of_map
		then
			transition_between.spritesheet = hd.out_of_map .. "-shore-out-of-map-transition.png"
			transition_between.layout = tile_spritesheet_layout_hd.concrete_layout(refined, true, true)
			transition_between.effect_map_layout.spritesheet = effect_map_paths.hd.concrete_out_of_map
		end
	end
end

for _, tile_data in ipairs(transition_tiles) do
	load_transitions(tile_data.name, tile_data.refined)
end
