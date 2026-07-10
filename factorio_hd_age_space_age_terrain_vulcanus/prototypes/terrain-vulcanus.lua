local disable_water_transitions = settings.startup["f_hd_a_sa_tv_disable_water-transitions"].value
local disable_lava_transitions = settings.startup["f_hd_a_sa_tv_disable_lava-transitions"].value
local disable_out_of_map_transitions = settings.startup["f_hd_a_sa_tv_disable_out-of-map-transitions"].value

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
				scale = 0.25,
				count = (options and options.mask_variations) or 8,
				double_side_count = 0,
				u_transition_count = 1,
				o_transition_count = 1,
				u_transition_line_length = 1,
				o_transition_line_length = 2,
				outer_corner_x = 576 * 2,
				side_x = 1152 * 2,
				u_transition_x = 1728 * 2,
				o_transition_x = 2304 * 2,
				mask = { y_offset = 0 }
			}
		}
	end

	return result
end

local function tile_variations_template_hd_extra(high_res_picture, high_res_transition_mask, options)
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

local function tile_variations_template_with_transitions_hd(high_res_picture, options)
	local result = tile_variations_template_hd(high_res_picture, high_res_picture, options)

	if result.transition then
		result.transition.layout = {
			scale                    = 0.25,
			inner_corner_x           = 1216 * 2 * 2,
			outer_corner_x           = 1504 * 2 * 2,
			side_x                   = 1792 * 2 * 2,
			u_transition_x           = 1056 * 2 * 2,
			o_transition_x           = 544 * 2 * 2,
			inner_corner_count       = 8,
			outer_corner_count       = 8,
			side_count               = 8,
			u_transition_count       = 1,
			o_transition_count       = 1,
			u_transition_line_length = 4,
			o_transition_line_length = 4,
			overlay                  = { x_offset = 0 }
		}
	end

	return result
end

local function tile_variations_template_with_transitions_and_light_hd(spritesheet, lightmap_spritesheet, options)
	local result = tile_variations_template_with_transitions_hd(spritesheet, options)

	result.light = tile_variations_template_hd(lightmap_spritesheet, nil, { empty_transitions = true }).main
	if result.transition then
		result.transition.lightmap_layout = { spritesheet = lightmap_spritesheet }
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

tile_spritesheet_layout_hd.transition_4_4_8_1_1 = {
	scale                    = 0.25,
	inner_corner_count       = 4,
	outer_corner_count       = 4,
	side_count               = 8,
	u_transition_count       = 1,
	o_transition_count       = 1,
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

local base = {
	"__factorio_hd_age_space_age_terrain_vulcanus__/data/space-age/graphics/terrain/",
	"__factorio_hd_age_space_age_terrain_vulcanus__/data/base/graphics/terrain/effect-maps"
}

local lava_patch = {
	filename = base[1] .. "lava-transitions/lava-patch.png",
	scale = 0.25,
	width = 64 * 2,
	height = 64 * 2
}

local terrain_options = {
	{
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
	},
	{
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
		[4] = { probability = 1.00, weights = { 0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
	}
}

local function load_lava_transition(name)
	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[1].spritesheet = base[1] .. "out-of-map-transition/lava-out-of-map-transition.png"
		data.raw.tile[name].transitions[1].lightmap_layout = { spritesheet = base[1] .. "out-of-map-transition/lava-out-of-map-transition.png" }
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1
	end
end

if not settings.startup["f_hd_a_sa_tv_disable_lava"].value then
	load_lava_transition("lava")
	data.raw.tile["lava"].variants = tile_variations_template_hd_extra(
		base[1] .. "vulcanus/lava.png",
		"__base__/graphics/terrain/masks/transition-1.png",
		terrain_options[1]
	)

	load_lava_transition("lava-hot")
	data.raw.tile["lava-hot"].variants = {
		main = { {
			picture = base[1] .. "vulcanus/lava-hot.png",
			count = 1,
			scale = 0.25,
			size = 1
		} },
		empty_transitions = true,
	}
end

local function load_lava_stone_transiton(name, lightmap, variation)
	if not disable_water_transitions then
		data.raw.tile[name].transitions[1].spritesheet = base[1] .. "water-transitions/lava-stone-cold.png"
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4
		data.raw.tile[name].transitions[1].effect_map_layout.spritesheet = base[2] .. "/water-dirt-mask.png"

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = base[1] .. "water-transitions/lava-stone-cold-transition.png"
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[1].effect_map_layout.spritesheet = base[2] .. "/water-dirt-to-land-mask.png"
		data.raw.tile[name].transitions_between_transitions[1].water_patch = lava_patch
	end

	if not disable_lava_transitions then
		data.raw.tile[name].transitions[2].spritesheet = base[1] .. "lava-transitions/lava-stone.png"
		data.raw.tile[name].transitions[2].lightmap_layout = { spritesheet = base[1] .. "lava-transitions/lava-stone-lightmap.png" }
		data.raw.tile[name].transitions[2].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4
		data.raw.tile[name].transitions[2].effect_map_layout.spritesheet = base[1] .. "effect-maps/lava-dirt-mask.png"

		data.raw.tile[name].transitions_between_transitions[3].spritesheet = base[1] .. "lava-transitions/lava-stone-transition.png"
		data.raw.tile[name].transitions_between_transitions[3].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[3].effect_map_layout.spritesheet = base[2] .. "/water-dirt-to-land-mask.png"
		data.raw.tile[name].transitions_between_transitions[3].water_patch = lava_patch
	end

	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[3].spritesheet = base[1] .. "out-of-map-transition/volcanic-out-of-map-transition.png"
		data.raw.tile[name].transitions[3].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile[name].transitions_between_transitions[2].spritesheet = base[1] .. "out-of-map-transition/lava-stone-cold-shore-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[2].effect_map_layout.spritesheet = base[2] .. "/water-dirt-to-out-of-map-mask.png"

		data.raw.tile[name].transitions_between_transitions[4].spritesheet = base[1] .. "out-of-map-transition/lava-stone-shore-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[4].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[4].effect_map_layout.spritesheet = base[2] .. "/water-dirt-to-out-of-map-mask.png"

		data.raw.tile[name].transitions_between_transitions[5].spritesheet = base[1] .. "out-of-map-transition/volcanic-out-of-map-transition-transition.png"
		data.raw.tile[name].transitions_between_transitions[5].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
	end

	if lightmap then
		data.raw.tile[name].variants = tile_variations_template_with_transitions_and_light_hd(
			base[1] .. "vulcanus/" .. name .. ".png",
			base[1] .. "vulcanus/" .. name .. "-lightmap.png",
			terrain_options[variation]
		)
	else
		data.raw.tile[name].variants = tile_variations_template_with_transitions_hd(
			base[1] .. "vulcanus/" .. name .. ".png",
			terrain_options[variation]
		)
	end
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_ash"].value then
	load_lava_stone_transiton("volcanic-ash-cracks", false, 1)
	load_lava_stone_transiton("volcanic-ash-dark", false, 1)
	load_lava_stone_transiton("volcanic-ash-flats", false, 1)
	load_lava_stone_transiton("volcanic-ash-light", false, 1)
	load_lava_stone_transiton("volcanic-ash-soil", false, 2)
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_cracks"].value then
	load_lava_stone_transiton("volcanic-cracks", false, 1)
	load_lava_stone_transiton("volcanic-cracks-hot", true, 1)
	load_lava_stone_transiton("volcanic-cracks-warm", true, 1)
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_folds"].value then
	load_lava_stone_transiton("volcanic-folds", false, 1)
	load_lava_stone_transiton("volcanic-folds-flat", false, 1)
	load_lava_stone_transiton("volcanic-folds-warm", true, 1)
	load_lava_stone_transiton("volcanic-jagged-ground", false, 1)
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_stone"].value then
	load_lava_stone_transiton("volcanic-pumice-stones", false, 1)
	load_lava_stone_transiton("volcanic-smooth-stone", false, 1)
	load_lava_stone_transiton("volcanic-smooth-stone-warm", true, 1)
end

if not settings.startup["f_hd_a_sa_tv_disable_volcanic_soil"].value then
	load_lava_stone_transiton("volcanic-soil-dark", false, 2)
	load_lava_stone_transiton("volcanic-soil-light", false, 2)
end

local function load_other_lava_transtion(name, number)
	if not disable_lava_transitions then
		data.raw.tile[name].transitions[3].spritesheet = base[1] .. "lava-transitions/lava-stone.png"
		data.raw.tile[name].transitions[3].layout = tile_spritesheet_layout_hd.transition_16_16_16_4_4
		data.raw.tile[name].transitions[3].lightmap_layout = { spritesheet = base[1] .. "lava-transitions/lava-stone-lightmap.png" }
		data.raw.tile[name].transitions[3].effect_map_layout.spritesheet = base[1] .. "effect-maps/lava-dirt-mask.png"

		data.raw.tile[name].transitions_between_transitions[number + 1].spritesheet = base[1] .. "lava-transitions/lava-stone-transition.png"
		data.raw.tile[name].transitions_between_transitions[number + 1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[number + 1].effect_map_layout.spritesheet = base[1] .. "effect-maps/lava-dirt-to-land-mask.png"
		data.raw.tile[name].transitions_between_transitions[number + 1].water_patch = lava_patch
	end
	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions_between_transitions[number + 2].spritesheet = base[1] .. "out-of-map-transition/lava-stone-shore-out-of-map-transition.png"
		data.raw.tile[name].transitions_between_transitions[number + 2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[number + 2].effect_map_layout.spritesheet = base[1] .. "effect-maps/lava-dirt-to-out-of-map-mask.png"
	end
end

if not settings.startup["f_hd_a_sa_tv_disable_not-vulcanus-lava-transitions"].value then
	for _, name in ipairs({
		"grass-1", "grass-2", "grass-3", "grass-4",
		"dry-dirt",
		"dirt-1", "dirt-2", "dirt-3", "dirt-4", "dirt-5", "dirt-6", "dirt-7",
		"sand-1", "sand-2", "sand-3",
		"red-desert-0", "red-desert-1", "red-desert-2", "red-desert-3",
		"landfill", "nuclear-ground",
		"dust-crests", "dust-flat", "dust-lumpy", "dust-patchy",
		"ice-platform", "ice-rough", "ice-smooth",
		"snow-crests", "snow-flat", "snow-lumpy", "snow-patchy",
		"oil-ocean-shallow", "oil-ocean-shallow-2",
		"fulgoran-dust", "fulgoran-dunes", "fulgoran-sand", "fulgoran-rock", "fulgoran-paving", "fulgoran-walls", "fulgoran-conduit", "fulgoran-machinery",
	}) do
		load_other_lava_transtion(name, 3)
	end

	for _, name in ipairs({
		"pit-rock",
		"artificial-yumako-soil", "overgrowth-yumako-soil", "natural-yumako-soil",
		"artificial-jellynut-soil", "overgrowth-jellynut-soil", "natural-jellynut-soil",
		"lowland-olive-blubber", "lowland-olive-blubber-2", "lowland-olive-blubber-3", "lowland-brown-blubber",
		"lowland-pale-green", "lowland-cream-cauliflower", "lowland-cream-cauliflower-2",
		"lowland-dead-skin", "lowland-dead-skin-2",
		"lowland-cream-red",
		"lowland-red-vein", "lowland-red-vein-2", "lowland-red-vein-3", "lowland-red-vein-4", "lowland-red-vein-dead",
		"lowland-red-infection",
		"midland-cracked-lichen", "midland-cracked-lichen-dull", "midland-cracked-lichen-dark",
		"midland-turquoise-bark", "midland-turquoise-bark-2",
		"midland-yellow-crust", "midland-yellow-crust-2", "midland-yellow-crust-3", "midland-yellow-crust-4",
		"highland-dark-rock", "highland-dark-rock-2", "highland-yellow-rock",
	}) do
		load_other_lava_transtion(name, 2)
	end
end
