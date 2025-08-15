local function lerp_color(a, b, amount)
	return {
		a[1] + amount * (b[1] - a[1]),
		a[2] + amount * (b[2] - a[2]),
		a[3] + amount * (b[3] - a[3]),
		a[4] + amount * (b[4] - a[4])
	}
end

local function fade(tint, amount)
	return lerp_color(tint, {1, 1, 1, 2}, amount)
end

local function grey_overlay(tint, amount)
	return lerp_color(tint, {127, 127, 127, 255}, amount)
end

local gleba_small_mask_tint = {103, 151, 11, 255}
local gleba_small_mask2_tint = {173, 211, 11, 255}
local gleba_small_body_tint = {125, 124, 111, 255}
local small_wriggler_mask_tint = fade(lerp_color(gleba_small_mask_tint, {255, 200, 0, 255}, 0.1), 0.2)
local small_wriggler_body_tint = grey_overlay(lerp_color(gleba_small_body_tint, {255, 0, 0, 255}, 0.1), 0.2)

local gleba_medium_mask_tint = {250,118,0,255}
local gleba_medium_mask2_tint = {250,250,0,255}
local gleba_medium_body_tint = {115,122,114,255}
local medium_wriggler_mask_tint = fade(gleba_medium_mask_tint, 0.3)
local medium_wriggler_body_tint = gleba_medium_body_tint

local gleba_big_mask_tint  = {216,0,35,255}
local gleba_big_mask2_tint  = {216,100,35,255}
local gleba_big_body_tint = {117,116,104,255}
local big_wriggler_mask_tint = fade(gleba_big_mask_tint, 0.4)
local big_wriggler_body_tint = gleba_big_body_tint

-- strafer
if not settings.startup["f_hd_a_sa_eg_disable_strafer"].value then
	function make_strafer_hd(size, scale, tints)
		local tint_mask = tints.mask
		local tint_mask_thigh = tints.mask_thigh or tint_mask
		local tint_body = tints.body
		local tint_body_thigh = tints.body_thigh or tint_body
		local tint_projectile = tints.projectile
		local tint_projectile_mask = tints.projectile_mask

		local strafer_scale = 1 * scale
		local strafer_head_size = 0.6
		local strafer_leg_thickness = 0.8

		data.raw["spider-unit"][size .. "strafer-pentapod"].graphics_set.base_animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/torso/torso-main", {
			scale=0.25 * strafer_head_size * strafer_scale,
			direction_count = 64,
			multiply_shift = 0.0,
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-unit"][size .. "strafer-pentapod"].graphics_set.base_animation.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/torso/torso-main", {
			scale=0.25*strafer_head_size*strafer_scale*0.5,
			direction_count=64,
			multiply_shift=0.0,
			tint_as_overlay = true,
			tint = tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-unit"][size .. "strafer-pentapod"].graphics_set.animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/torso/head-main", {
			scale=0.25*strafer_head_size*strafer_scale,
			direction_count=64,
			shift = util.by_pixel( 0, -22.0),
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-unit"][size .. "strafer-pentapod"].graphics_set.animation.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/torso/head-main-mask", {
			scale=0.25*strafer_head_size*strafer_scale,
			direction_count=64,
			shift = util.by_pixel( 0, -22.0),
			tint_as_overlay = true,
			tint = tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "strafer-pentapod-leg"].graphics_set.lower_part.middle.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/legs/leg-shin", {
			scale=0.25 * strafer_scale * strafer_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-leg"][size .. "strafer-pentapod-leg"].graphics_set.lower_part.middle.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/legs/leg-shin-mask", {
			scale=0.25 * strafer_scale * strafer_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint=tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "strafer-pentapod-leg"].graphics_set.upper_part.middle.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/legs/leg-thigh", {
			scale=0.25 * strafer_scale * strafer_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body_thigh,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-leg"][size .. "strafer-pentapod-leg"].graphics_set.upper_part.middle.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/legs/leg-thigh-mask", {
			scale=0.25 * strafer_scale * strafer_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint=tint_mask_thigh,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "strafer-pentapod-leg"].graphics_set.joint.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/legs/leg-knee", {
			scale=0.25 * strafer_scale * strafer_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-leg"][size .. "strafer-pentapod-leg"].graphics_set.joint.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/legs/leg-knee-mask", {
			scale=0.25 * strafer_scale * strafer_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["corpse"][size .. "strafer-corpse"].animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/strafer-corpse", {
			frame_count = 1,
			scale = 0.25 * strafer_scale,
			direction_count = 1,
			flags = {"corpse-decay"},
			tint = tint_body,
			tint_as_overlay = true,
			surface = "gleba",
			usage = "corpse-decay"
		})
		data.raw["corpse"][size .. "strafer-corpse"].animation.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/strafer/strafer-corpse-mask", {
			frame_count = 1,
			scale = 0.25 * strafer_scale,
			direction_count = 1,
			flags = {"corpse-decay"},
			tint = tint_mask,
			tint_as_overlay = true,
			surface = "gleba",
			usage = "corpse-decay"
		})

		data.raw["projectile"][size .. "strafer-projectile"].animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/wriggler/wriggler-projectile", {
			frame_count = 4,
			scale = 0.18 * scale,
			tint_as_overlay = true,
			rotate_shift = true,
			tint = tint_projectile
		})
		data.raw["projectile"][size .. "strafer-projectile"].animation.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/wriggler/wriggler-projectile-tint", {
			frame_count = 4,
			scale = 0.18 * scale,
			tint_as_overlay = true,
			rotate_shift = true,
			tint = tint_projectile_mask
		})
	end

	make_strafer_hd("small-", 0.9, {
		mask = fade(gleba_small_mask_tint, 0.2),
		mask_thigh = fade(gleba_small_mask2_tint, 0.4),
		body = gleba_small_body_tint,
		projectile_mask = small_wriggler_mask_tint,
		projectile = small_wriggler_body_tint,
	})
	make_strafer_hd("medium-", 1.2, {
		mask = fade(lerp_color(gleba_medium_mask_tint, gleba_medium_mask2_tint, 0.5), 0.3),
		mask_thigh = fade(lerp_color(gleba_medium_mask_tint, gleba_medium_mask2_tint, 0.7), 0.2),
		body = gleba_medium_body_tint,
		projectile_mask = medium_wriggler_mask_tint,
		projectile = medium_wriggler_body_tint
	})
	make_strafer_hd("big-", 1.6, {
		mask = fade(gleba_big_mask_tint, 0.4),
		mask_thigh = fade(gleba_big_mask2_tint, 0.2),
		body = grey_overlay(gleba_big_body_tint, 0.1),
		projectile_mask = big_wriggler_mask_tint,
		projectile = big_wriggler_body_tint
	})
end

-- stomper
if not settings.startup["f_hd_a_sa_eg_disable_stomper"].value then
	local function make_stomper_hd(size, scale, tints)
		local tint_mask = tints.mask
		local tint_mask_thigh = tints.mask_thigh or tint_mask
		local tint_body = tints.body
		local tint_body_thigh = tints.body_thigh or tint_body

		local stomper_scale = 1.1 * scale
		local stomper_head_size = 0.75
		local stomper_leg_thickness = 2

		data.raw["spider-unit"][size .. "stomper-pentapod"].graphics_set.animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/torso/head-main", {
			scale=0.25*stomper_head_size*stomper_scale,
			direction_count=64,
			shift = util.by_pixel( 0, -32.0),
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-unit"][size .. "stomper-pentapod"].graphics_set.animation.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/torso/head-mask", {
			scale=0.25*stomper_head_size*stomper_scale,
			direction_count=64,
			shift = util.by_pixel( 0, -32.0),
			tint_as_overlay = true,
			tint = tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.lower_part.middle.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-shin", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.lower_part.middle.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-shin-mask", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay=true,
			tint = tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.lower_part.bottom_end.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-shin-foot", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.lower_part.bottom_end.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-shin-foot-mask", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.upper_part.top_end.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-thigh-body", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body_thigh,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.upper_part.middle.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-thigh", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body_thigh,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.upper_part.middle.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-thigh-mask", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_mask_thigh,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.joint.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-knee", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.joint.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-knee-mask", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.foot.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-foot", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_body,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["spider-leg"][size .. "stomper-pentapod-leg"].graphics_set.foot.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/legs/leg-foot-mask", {
			scale=0.125 * stomper_scale * stomper_leg_thickness,
			direction_count=32,
			multiply_shift=0,
			tint_as_overlay = true,
			tint = tint_mask,
			surface = "gleba",
			usage = "enemy"
		})

		-- data.raw["corpse"][size .. "stomper-corpse"].animation[1].layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-2", {
		-- 	frame_count = 1,
		-- 	scale = 0.2 * stomper_scale,
		-- 	direction_count = 1,
		-- 	surface = "gleba",
		-- 	usage = "enemy"
		-- })
		-- data.raw["corpse"][size .. "stomper-corpse"].animation[1].layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-2-mask", {
		-- 	frame_count = 1,
		-- 	scale = 0.2 * stomper_scale,
		-- 	direction_count = 1,
		-- 	tint = tint_mask,
		-- 	tint_as_overlay = true,
		-- 	surface = "gleba",
		-- 	usage = "enemy"
		-- })
		data.raw["corpse"][size .. "stomper-corpse"].animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-3", {
			frame_count = 1,
			scale = 0.2 * stomper_scale,
			direction_count = 1,
			surface = "gleba",
			usage = "enemy"
		})
		data.raw["corpse"][size .. "stomper-corpse"].animation.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-3-mask", {
			frame_count = 1,
			scale = 0.2 * stomper_scale,
			direction_count = 1,
			tint = tint_mask,
			tint_as_overlay = true,
			surface = "gleba",
			usage = "enemy"
		})

		-- data.raw["corpse"][size .. "stomper-corpse"].decay_animation[1].layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-2", {
		-- 	frame_count = 16,
		-- 	scale = 0.2 * stomper_scale,
		-- 	direction_count = 1,
		-- 	flags = {"corpse-decay"},
		-- 	surface = "gleba",
		-- 	usage = "corpse-decay"
		-- })
		-- data.raw["corpse"][size .. "stomper-corpse"].decay_animation[1].layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-2-mask", {
		-- 	frame_count = 16,
		-- 	scale = 0.2 * stomper_scale,
		-- 	direction_count = 1,
		-- 	tint = tint_mask,
		-- 	tint_as_overlay = true,
		-- 	flags = {"corpse-decay"},
		-- 	surface = "gleba",
		-- 	usage = "corpse-decay"
		-- })
		data.raw["corpse"][size .. "stomper-corpse"].decay_animation.layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-3", {
			frame_count = 16,
			scale = 0.2 * stomper_scale,
			direction_count = 1,
			flags = {"corpse-decay"},
			surface = "gleba",
			usage = "corpse-decay"
		})
		data.raw["corpse"][size .. "stomper-corpse"].decay_animation.layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-3-mask", {
			frame_count = 16,
			scale = 0.2 * stomper_scale,
			direction_count = 1,
			tint = tint_mask,
			tint_as_overlay = true,
			flags = {"corpse-decay"},
			surface = "gleba",
			usage = "corpse-decay"
		})

		for n = 1, 4 do
			data.raw["simple-entity"][size .. "stomper-shell"].pictures[n].layers[1] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-head", {
				scale = 0.25 * stomper_scale,
				y = 332 * 2 * (n-1),
				surface = "gleba",
				usage = "enemy"
			})
			data.raw["simple-entity"][size .. "stomper-shell"].pictures[n].layers[2] = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/stomper-corpse-head-mask", {
				scale = 0.25 * stomper_scale,
				tint = tint_mask,
				tint_as_overlay = true,
				y = 330 * 2 * (n-1),
				surface = "gleba",
				usage = "enemy"
			})
		end
	end

	make_stomper_hd("small-", 0.9, {
		mask = fade(gleba_small_mask_tint, 0.2),
		mask_thigh = fade(gleba_small_mask2_tint, 0.3),
		mask_head = fade(lerp_color(gleba_small_mask_tint, {0,255,127,255}, 0.15), 0.1),
		body = gleba_small_body_tint,
		body_thigh = lerp_color(gleba_small_body_tint, grey_overlay({0,255,127,255}, 0.7), 0.3)
	})
	make_stomper_hd("medium-", 1.2, {
		mask = fade(gleba_medium_mask_tint, 0.3),
		mask_thigh = fade(gleba_medium_mask2_tint, 0.4),
		body = lerp_color(gleba_medium_body_tint, grey_overlay({127,255,0,255}, 0.5), 0.05)
	})
	make_stomper_hd("big-", 1.6, {
		mask = fade(gleba_big_mask_tint, 0.4),
		mask_thigh = fade(gleba_big_mask2_tint, 0.3),
		body = grey_overlay(gleba_big_body_tint, 0.1),
		body_thigh = lerp_color(gleba_big_body_tint, grey_overlay({250,108,0,255}, 0.7), 0.1)
	})


	data.raw["trivial-smoke"]["stomper-stomp"].animation = {
		filename = "__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/stomper/smash-effect.png",
		frame_sequence = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
		16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,
		16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,
		16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,
		16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16, --17*4 hang frames
		17,18,19,21}, -- 21+ hang frames
		line_length = 7,
		width = 256*2,
		height = 224*2,
		frame_count = 21,
		shift = {-0.0, -0.8},
		priority = "low",
		animation_speed = 1
	}
end

-- wriggler
if not settings.startup["f_hd_a_sa_eg_disable_wriggler"].value then
	local function wriggler_spritesheet_hd(definition, frames, scale, speed, tint, flag)
		return util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/wriggler/wriggler-"..definition,{
			frame_count = frames,
			direction_count = 16,
			scale = 0.25 * 1.2 * scale,
			animation_speed = speed,
			flags = { flag } or nil,
			tint_as_overlay = true,
			tint = tint,
			surface = "gleba"
		})
	end

	local function make_wriggler_hd(size, scale, tints)
		local tint_body = tints.body
		local tint_mask = tints.mask

		data.raw["unit"][size .. "wriggler-pentapod"].attack_parameters.animation.layers[1] = wriggler_spritesheet_hd("attack", 19, scale, 0.48, tint_body)
		data.raw["unit"][size .. "wriggler-pentapod-premature"].attack_parameters.animation.layers[1] = wriggler_spritesheet_hd("attack", 19, scale, 0.48, tint_body)

		data.raw["unit"][size .. "wriggler-pentapod"].attack_parameters.animation.layers[2] = wriggler_spritesheet_hd("attack-tint", 19, scale, 0.48, tint_mask)
		data.raw["unit"][size .. "wriggler-pentapod-premature"].attack_parameters.animation.layers[2] = wriggler_spritesheet_hd("attack-tint", 19, scale, 0.48, tint_mask)

		data.raw["unit"][size .. "wriggler-pentapod"].run_animation.layers[1] = wriggler_spritesheet_hd("run", 21, scale, 0.48, tint_body)
		data.raw["unit"][size .. "wriggler-pentapod-premature"].run_animation.layers[1] = wriggler_spritesheet_hd("run", 21, scale, 0.48, tint_body)

		data.raw["unit"][size .. "wriggler-pentapod"].run_animation.layers[2] = wriggler_spritesheet_hd("run-tint", 21, scale, 0.48, tint_mask)
		data.raw["unit"][size .. "wriggler-pentapod-premature"].run_animation.layers[2] = wriggler_spritesheet_hd("run-tint", 21, scale, 0.48, tint_mask)

		data.raw["corpse"][size .. "wriggler-pentapod-corpse"].animation.layers[1] = wriggler_spritesheet_hd("death", 17, scale, 0.48, tint_body, "corpse-decay")
		data.raw["corpse"][size .. "wriggler-pentapod-corpse"].animation.layers[2] = wriggler_spritesheet_hd("death-tint", 17, scale, 0.48, tint_mask, "corpse-decay")

		data.raw["corpse"][size .. "wriggler-pentapod-corpse"].decay_animation.layers[1] = wriggler_spritesheet_hd("decay", 9, scale, nil, tint_body, "corpse-decay")
		data.raw["corpse"][size .. "wriggler-pentapod-corpse"].decay_animation.layers[2] =  wriggler_spritesheet_hd("decay-tint", 9, scale, nil, tint_mask, "corpse-decay")

		data.raw["corpse"][size .. "wriggler-pentapod-corpse"].ground_patch.sheet = util.sprite_load("__factorio_hd_age_space_age_enemies_gleba__/data/space-age/graphics/entity/wriggler/blood-puddle-var-main", {
			flags = { "low-object" },
			variation_count = 4,
			scale = 0.2 * scale,
			multiply_shift = 0.125
		})
	end

	make_wriggler_hd("small-", 0.6, {
		body = small_wriggler_body_tint,
		mask = small_wriggler_mask_tint
	})
	make_wriggler_hd("medium-", 0.8, {
		body = medium_wriggler_body_tint,
		mask = medium_wriggler_mask_tint
	})
	make_wriggler_hd("big-", 1.0, {
		body = big_wriggler_body_tint,
		mask = big_wriggler_mask_tint
	})
end