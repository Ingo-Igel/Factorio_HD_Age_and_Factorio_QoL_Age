local disable_water_transitions = true
local disable_out_of_map_transitions = true

if not settings.startup["f_hd_a_sa_ta_disable_water-transitions"].value then
	disable_water_transitions = false
end

if not settings.startup["f_hd_a_sa_ta_disable_out-of-map-transitions"].value then
	disable_out_of_map_transitions = false
end

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

local tile_spritesheet_layout_hd = {}

tile_spritesheet_layout_hd.transition_16_16_16_4_4 = {
	scale                    = 0.25,
	inner_corner_count       = 16,
	outer_corner_count       = 16,
	side_count               = 16,
	u_transition_count       = 4,
	o_transition_count       = 4,
	inner_corner_y           = 0,
	outer_corner_y           = 576 * 2,
	side_y                   = 1152 * 2,
	u_transition_y           = 1728 * 2,
	o_transition_y           = 2304 * 2,
	inner_corner_tile_height = 2,
	outer_corner_tile_height = 2,
	side_tile_height         = 2,
	u_transition_tile_height = 2,
	overlay                  = { x_offset = 0 },
	mask                     = { x_offset = 2176 * 2 },
	background               = { x_offset = 1088 * 2 }
}

tile_spritesheet_layout_hd.transition_3_3_3_1_0 = {
	scale                    = 0.25,
	inner_corner_count       = 3,
	outer_corner_count       = 3,
	side_count               = 3,
	u_transition_count       = 1,
	o_transition_count       = 0,
	inner_corner_y           = 0,
	outer_corner_y           = 576 * 2,
	side_y                   = 1152 * 2,
	u_transition_y           = 1728 * 2,
	o_transition_y           = 2304 * 2,
	inner_corner_tile_height = 2,
	outer_corner_tile_height = 2,
	side_tile_height         = 2,
	u_transition_tile_height = 2,
	overlay                  = { x_offset = 0 },
	mask                     = { x_offset = 2176 * 2 },
	background               = { x_offset = 1088 * 2 }
}

local patch_for_inner_corner_of_transition_between_transition = {
	filename = "__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/water-transitions/ice-patch.png",
	scale = 0.25,
	width = 64 * 2,
	height = 64 * 2
}

local water_dirt_mask = "__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/effect-maps/water-dirt-mask.png"
local water_dirt_to_land_mask = "__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/effect-maps/water-dirt-to-land-mask.png"
local water_dirt_to_out_of_map_mask = "__factorio_hd_age_space_age_terrain_aquilo__/data/base/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png"

local ice_2 = "__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/water-transitions/ice-2.png"
local ice_transition = "__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/water-transitions/ice-transition.png"
local ice_out_of_map = "__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/out-of-map-transition/ice-out-of-map.png"
local ice_out_of_map_transition_b = "__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/out-of-map-transition/ice-out-of-map-transition-b.png"
local ice_shore_out_of_map = "__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/out-of-map-transition/ice-shore-out-of-map.png"

local variants = {
	{
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
	},
	{
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015 }, },
	}
}

local function load_transition(name, terrain, variation)
	if not disable_water_transitions then
		data.raw.tile[name].transitions[1].spritesheet = ice_2
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4
		data.raw.tile[name].transitions[1].effect_map_layout.spritesheet = water_dirt_mask

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = ice_transition
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[1].effect_map_layout.spritesheet = water_dirt_to_land_mask
		data.raw.tile[name].transitions_between_transitions[1].water_patch = patch_for_inner_corner_of_transition_between_transition
	end

	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[2].spritesheet = ice_out_of_map
		data.raw.tile[name].transitions[2].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4

		data.raw.tile[name].transitions_between_transitions[2].spritesheet = ice_out_of_map_transition_b
		data.raw.tile[name].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile[name].transitions_between_transitions[3].spritesheet = ice_shore_out_of_map
		data.raw.tile[name].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[3].effect_map_layout.spritesheet = water_dirt_to_out_of_map_mask
	end

	if terrain then
		data.raw.tile[name].variants = tile_variations_template_hd(
			"__factorio_hd_age_space_age_terrain_aquilo__/data/space-age/graphics/terrain/aquilo/" .. name .. ".png",
			"__base__/graphics/terrain/masks/transition-4.png",
			variants[variation]
		)
	end
end

if not settings.startup["f_hd_a_sa_ta_disable_dust"].value then
	load_transition("dust-crests", true, 1)
	load_transition("dust-flat", true, 1)
	load_transition("dust-lumpy", true, 1)
	load_transition("dust-patchy", true, 1)
end

if not settings.startup["f_hd_a_sa_ta_disable_ice"].value then
	load_transition("ice-platform", false)
	load_transition("ice-rough", true, 2)
	load_transition("ice-smooth", false)

	data.raw.tile["brash-ice"].transitions = data.raw.tile["water"].transitions
	data.raw.tile["brash-ice"].transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions
end

if not settings.startup["f_hd_a_sa_ta_disable_snow"].value then
	load_transition("snow-crests", true, 1)
	load_transition("snow-flat", true, 1)
	load_transition("snow-lumpy", true, 1)
	load_transition("snow-patchy", false)
end
