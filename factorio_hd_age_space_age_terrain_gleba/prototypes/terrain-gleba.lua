local disable_water_transitions = settings.startup["f_hd_a_sa_tg_disable_water-transitions"].value
local disable_out_of_map_transitions = settings.startup["f_hd_a_sa_tg_disable_out-of-map-transitions"].value

local base = "__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/"

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

local function lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(high_res_picture, options)
	local result = tile_variations_template_with_transitions_hd(high_res_picture, options)

	if result.transition then
		result.transition.auxiliary_effect_mask_layout = {
			spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
			scale = 0.5,
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count = 8,
			u_transition_count = 1,
			o_transition_count = 1,
			u_transition_line_length = 1,
			o_transition_line_length = 2,
			inner_corner_x = 0,
			outer_corner_x = 576,
			side_x = 1152,
			u_transition_x = 1728,
			o_transition_x = 2304
		}
		result.transition.effect_map_layout =
		{
			spritesheet              =
			base .. "effect-maps/water-gleba-mask.png",
			scale                    = 0.25,
			x                        = 0,
			inner_corner_count       = 8,
			outer_corner_count       = 8,
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
		}
	end

	return result
end

function tile_variations_template_with_transitions_and_effect_map_hd(spritesheet, effect_map_spritesheet, options)
	local result = tile_variations_template_with_transitions_hd(spritesheet, options)
	if result.transition then
		result.transition.effect_map_layout = {
			spritesheet              = effect_map_spritesheet,
			scale                    = 0.25,
			x                        = 0,
			inner_corner_count       = 8,
			outer_corner_count       = 8,
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
		}
	end
	return result
end

local tile_spritesheet_layout_hd = {}

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

local function load_terrain(name, has)
	local options = {
		max_size = 4,
		[1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
	}

	if has == "mask" then
		data.raw.tile[name].variants = tile_variations_template_with_transitions_and_effect_map_hd(
			base .. "gleba/" .. name .. ".png",
			base .. "effect-maps/water-gleba-mask.png",
			options
		)
	elseif has == "puddle" then
		data.raw.tile[name].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
			base .. "gleba/" .. name .. ".png",
			options
		)
	else
		data.raw.tile[name].variants = tile_variations_template_with_transitions_hd(
			base .. "gleba/" .. name .. ".png",
			options
		)
	end

	local suffix = ""
	if (string.find(name, "red") or string.find(name, "jellynut")) then suffix = "-red" end
	if (string.find(name, "lichen") or string.find(name, "crust")) then suffix = "-yellow" end

	if not disable_out_of_map_transitions then
		data.raw.tile[name].transitions[1].spritesheet = base .. "out-of-map-transition/gleba-out-of-map-transition" .. suffix .. ".png"
		data.raw.tile[name].transitions[1].layout = tile_spritesheet_layout_hd.transition_4_4_8_1_1

		data.raw.tile[name].transitions_between_transitions[1].spritesheet = base .. "out-of-map-transition/gleba-out-of-map-transition-b" .. suffix .. ".png"
		data.raw.tile[name].transitions_between_transitions[1].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0

		data.raw.tile[name].transitions_between_transitions[2].spritesheet = base .. "out-of-map-transition/gleba-shore-out-of-map-transition" .. suffix .. ".png"
		data.raw.tile[name].transitions_between_transitions[2].layout = tile_spritesheet_layout_hd.transition_3_3_3_1_0
		data.raw.tile[name].transitions_between_transitions[2].effect_map_layout.spritesheet = "__factorio_hd_age_space_age_terrain_gleba__/data/base/graphics/terrain/effect-maps/water-grass-to-out-of-map-mask.png"
	end

	if not disable_water_transitions then
		local transitions = table.deepcopy(data.raw.tile[name].variants.transition)
		transitions.to_tiles = water_tile_type_names
		transitions.transition_group = water_transition_group_id

		data.raw.tile[name].transitions[2] = transitions
	end
end

if not settings.startup["f_hd_a_sa_tg_disable_yumako_soil"].value then
	load_terrain("artificial-yumako-soil", "mask")
	load_terrain("natural-yumako-soil", "mask")
	load_terrain("overgrowth-yumako-soil", "mask")
end

if not settings.startup["f_hd_a_sa_tg_disable_jellynut_soil"].value then
	load_terrain("artificial-jellynut-soil")
	load_terrain("natural-jellynut-soil", "mask")
	load_terrain("overgrowth-jellynut-soil")
end

if not settings.startup["f_hd_a_sa_tg_disable_blubber"].value then
	load_terrain("lowland-olive-blubber", "puddle")
	load_terrain("lowland-olive-blubber-2", "puddle")
	load_terrain("lowland-olive-blubber-3", "puddle")
	load_terrain("lowland-brown-blubber", "puddle")
end

if not settings.startup["f_hd_a_sa_tg_disable_pale_green"].value then
	load_terrain("lowland-pale-green", "puddle")
end

if not settings.startup["f_hd_a_sa_tg_disable_cream_cauliflower"].value then
	load_terrain("lowland-cream-cauliflower", "puddle")
	load_terrain("lowland-cream-cauliflower-2", "puddle")
end

if not settings.startup["f_hd_a_sa_tg_disable_dead_skin"].value then
	load_terrain("lowland-dead-skin", "puddle")
	load_terrain("lowland-dead-skin-2", "puddle")
end

if not settings.startup["f_hd_a_sa_tg_disable_cream_red"].value then
	load_terrain("lowland-cream-red", "puddle")
end

if not settings.startup["f_hd_a_sa_tg_disable_red_vein"].value then
	load_terrain("lowland-red-vein", "puddle")
	load_terrain("lowland-red-vein-2", "puddle")
	load_terrain("lowland-red-vein-3", "puddle")
	load_terrain("lowland-red-vein-4", "puddle")
	load_terrain("lowland-red-vein-dead", "puddle")
end

if not settings.startup["f_hd_a_sa_tg_disable_red_infection"].value then
	load_terrain("lowland-red-infection", "puddle")
end

if not settings.startup["f_hd_a_sa_tg_disable_cracked_lichen"].value then
	load_terrain("midland-cracked-lichen", "mask")
	load_terrain("midland-cracked-lichen-dull", "mask")
	load_terrain("midland-cracked-lichen-dark", "mask")
end

if not settings.startup["f_hd_a_sa_tg_disable_turquoise_bark"].value then
	load_terrain("midland-turquoise-bark", "mask")
	load_terrain("midland-turquoise-bark-2", "mask")
end

if not settings.startup["f_hd_a_sa_tg_disable_yellow_crust"].value then
	load_terrain("midland-yellow-crust", "mask")
	load_terrain("midland-yellow-crust-2", "mask")
	load_terrain("midland-yellow-crust-3", "mask")
	load_terrain("midland-yellow-crust-4", "mask")
end

if not settings.startup["f_hd_a_sa_tg_disable_rock"].value then
	load_terrain("highland-dark-rock", "mask")
	load_terrain("highland-dark-rock-2", "mask")
	load_terrain("highland-yellow-rock", "mask")
	load_terrain("pit-rock", "mask")
end
