local reff_base = "__base__"
local mod_base = "__factorio_hd_age_space_age_base__"
local base_path = "/data/space-age/graphics/terrain/"
local concrete_mask = "/data/base/graphics/terrain/effect-maps/concrete-mask.png"
local concrete_out_of_map_mask = "__factorio_hd_age_space_age_base__/data/base/graphics/terrain/effect-maps/concrete-out-of-map-mask.png"
local disable_water_transitions = settings.startup["f_hd_a_sa_b_disable_water-transitions"].value
local disable_out_of_map_transitions = settings.startup["f_hd_a_sa_b_disable_out-of-map-transitions"].value
local disable_lava_transitions = settings.startup["f_hd_a_sa_b_disable_lava-transitions"].value

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
	{ name = "stone-path",       refined = false, foundation = false },
	{ name = "concrete",         refined = false, foundation = false },
	{ name = "refined-concrete", refined = true,  foundation = false },
	{ name = "foundation",       refined = false, foundation = true }
}

local function required_transition(entries, index)
	local entry = entries[index]
	return entry
end

local function load_transitions(name, refined, foundation)
	local tile = data.raw.tile[name]
	local transitions = tile.transitions
	local transitions_between = tile.transitions_between_transitions
	local water_path = mod_base .. base_path .. "water-transitions/" .. name
	local out_of_map_path = mod_base .. base_path .. "out-of-map-transition/" .. name
	local lava_path = mod_base .. base_path .. "lava-transitions/" .. name

	if not disable_water_transitions and foundation then
		local water_transition = required_transition(transitions, 1)
		water_transition.spritesheet = water_path .. ".png"
		water_transition.layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, false)
		water_transition.effect_map_layout.spritesheet = mod_base .. concrete_mask

		local water_transition_between = required_transition(transitions_between, 1)
		water_transition_between.spritesheet = water_path .. "-transitions.png"
		water_transition_between.layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, true)
		water_transition_between.effect_map_layout.spritesheet = mod_base .. concrete_mask
	end

	if not disable_out_of_map_transitions then
		if foundation then
			local out_of_map_transition = required_transition(transitions, 3)
			out_of_map_transition.spritesheet = out_of_map_path .. "-out-of-map-transition.png"
			out_of_map_transition.layout = tile_spritesheet_layout_hd.concrete_layout(false, true, false)

			local out_of_map_transition_between = required_transition(transitions_between, 2)
			out_of_map_transition_between.spritesheet = out_of_map_path .. "-out-of-map-transition-b.png"
			out_of_map_transition_between.layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)

			local shore_transition_between = required_transition(transitions_between, 3)
			shore_transition_between.spritesheet = out_of_map_path .. "-shore-out-of-map-transition.png"
			shore_transition_between.layout = tile_spritesheet_layout_hd.concrete_layout(false, true, true)
			shore_transition_between.effect_map_layout.spritesheet = mod_base .. concrete_out_of_map_mask
		end

		local lava_shore_transition_between = required_transition(transitions_between, 5)
		lava_shore_transition_between.spritesheet = out_of_map_path .. "-lava-shore-out-of-map.png"
		lava_shore_transition_between.lightmap_layout = { spritesheet = out_of_map_path .. "-lava-shore-out-of-map-lightmap.png" }
		lava_shore_transition_between.layout = tile_spritesheet_layout_hd.concrete_layout(refined, true, true)
		lava_shore_transition_between.effect_map_layout.spritesheet = mod_base .. concrete_out_of_map_mask
	end

	if not disable_lava_transitions then
		local entry_number = foundation and 2 or 3

		local lava_transition = required_transition(transitions, entry_number)
		lava_transition.spritesheet = lava_path .. "-lava.png"
		lava_transition.lightmap_layout = { spritesheet = lava_path .. "-lava-lightmap.png" }
		lava_transition.layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, false)
		lava_transition.effect_map_layout.spritesheet = mod_base .. concrete_mask

		local lava_transition_between = required_transition(transitions_between, 4)
		lava_transition_between.spritesheet = lava_path .. "-transitions-lava.png"
		lava_transition_between.lightmap_layout = { spritesheet = lava_path .. "-transitions-lightmap.png" }
		lava_transition_between.layout = tile_spritesheet_layout_hd.concrete_layout(refined, false, true)
		lava_transition_between.effect_map_layout.spritesheet = mod_base .. concrete_mask
	end
end

for _, tile_data in ipairs(transition_tiles) do
	load_transitions(tile_data.name, tile_data.refined, tile_data.foundation)
end
