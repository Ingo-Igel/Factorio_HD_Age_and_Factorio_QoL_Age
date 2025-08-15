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
				outer_corner_x = 576*2,
				side_x = 1152*2,
				u_transition_x = 1728*2,
				o_transition_x = 2304*2,
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
			scale = 0.25,
			inner_corner_x = 1216 * 2*2,
			outer_corner_x = 1504 * 2*2,
			side_x         = 1792 * 2*2,
			u_transition_x = 1056 * 2*2,
			o_transition_x = 544 * 2*2,
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count         = 8,
			u_transition_count = 1,
			o_transition_count = 1,
			u_transition_line_length = 4,
			o_transition_line_length = 4,
			overlay = { x_offset = 0 }
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
			spritesheet =  "__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/effect-maps/water-gleba-mask.png",
			scale = 0.5,
			x = 0,
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count         = 8,
			u_transition_count = 1,
			o_transition_count = 1,
			inner_corner_y = 0,
			outer_corner_y = 576*2,
			side_y = 1152*2,
			u_transition_y = 1728*2,
			o_transition_y = 2304*2,
			inner_corner_tile_height = 2,
			outer_corner_tile_height = 2,
			side_tile_height = 2,
			u_transition_tile_height = 2,
		}
	  end

	return result
end

function tile_variations_template_with_transitions_and_effect_map_hd(spritesheet, effect_map_spritesheet, options)
	local result = tile_variations_template_with_transitions_hd(spritesheet, options)
		if result.transition then
			result.transition.effect_map_layout = {
				spritesheet = effect_map_spritesheet,
				scale = 0.5,
				x = 0,
				inner_corner_count = 8,
				outer_corner_count = 8,
				side_count         = 8,
				u_transition_count = 1,
				o_transition_count = 1,
				inner_corner_y = 0,
				outer_corner_y = 576*2,
				side_y = 1152*2,
				u_transition_y = 1728*2,
				o_transition_y = 2304*2,
				inner_corner_tile_height = 2,
				outer_corner_tile_height = 2,
				side_tile_height = 2,
				u_transition_tile_height = 2,
			}
		end
	return result
end

if not settings.startup["f_hd_a_sa_tg_disable_yumako_soil"].value then
	data.raw["tile"]["artificial-yumako-soil"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/artificial-yumako-soil.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
	)

	data.raw["tile"]["natural-yumako-soil"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/natural-yumako-soil.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["overgrowth-yumako-soil"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/overgrowth-yumako-soil.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_jellynut_soil"].value then
	data.raw["tile"]["artificial-jellynut-soil"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/artificial-jellynut-soil.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["natural-jellynut-soil"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/natural-jellynut-soil.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["overgrowth-jellynut-soil"].variants = tile_variations_template_with_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/overgrowth-jellynut-soil.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_blubber"].value then
	data.raw["tile"]["lowland-olive-blubber"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-olive-blubber.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-olive-blubber-2"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-olive-blubber-2.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-olive-blubber-3"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-olive-blubber-3.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-brown-blubber"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-brown-blubber.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_pale_green"].value then
	data.raw["tile"]["lowland-pale-green"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-pale-green.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_cream_cauliflower"].value then
	data.raw["tile"]["lowland-cream-cauliflower"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/cauliflower-mold.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-cream-cauliflower-2"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
	"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/cauliflower-mold-2.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_dead_skin"].value then
	data.raw["tile"]["lowland-dead-skin"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-dead-skin.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-dead-skin-2"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-dead-skin-2.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_cream_red"].value then
	data.raw["tile"]["lowland-cream-red"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-cream-red.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_red_vein"].value then
	data.raw["tile"]["lowland-red-vein"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-red-vein.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-red-vein-2"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-red-vein-2.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-red-vein-3"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-red-vein-3.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-red-vein-4"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-red-vein-4.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["lowland-red-vein-dead"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-red-vein-dead.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_red_infection"].value then
	data.raw["tile"]["lowland-red-infection"].variants = lowland_tile_variations_template_with_transitions_and_puddle_transitions_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/lowland-red-infection.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_cracked_lichen"].value then
	data.raw["tile"]["midland-cracked-lichen"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/cracked-lichen.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["midland-cracked-lichen-dull"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/cracked-lichen-dull.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["midland-cracked-lichen-dark"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/cracked-lichen-dark.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_turquoise_bark"].value then
	data.raw["tile"]["midland-turquoise-bark"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/midland-turquoise-bark.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["midland-turquoise-bark-2"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/midland-turquoise-bark-2.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_yellow_crust"].value then
	data.raw["tile"]["midland-yellow-crust"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/starburst-lichen.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["midland-yellow-crust-2"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/starburst-lichen-2.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["midland-yellow-crust-3"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/starburst-lichen-3.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["midland-yellow-crust-4"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/starburst-lichen-4.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end

if not settings.startup["f_hd_a_sa_tg_disable_rock"].value then
	data.raw["tile"]["highland-dark-rock"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/highland-dark-rock.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["highland-dark-rock-2"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/highland-dark-rock-2.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["highland-yellow-rock"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/highland-yellow-rock.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)

	data.raw["tile"]["pit-rock"].variants = tile_variations_template_with_transitions_and_effect_map_hd(
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics/terrain/gleba/pit-rock.png",
		"__factorio_hd_age_space_age_terrain_gleba__/data/space-age/graphics//terrain/effect-maps/water-gleba-mask.png",
		{
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		}
	)
end