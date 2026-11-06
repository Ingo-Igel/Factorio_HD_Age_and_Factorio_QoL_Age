local worms = {
	{ size = "small",    scale = 0.65, tint = { 0.7, 1, 0.3, 0.5 } },
	{ size = "medium",   scale = 0.83, tint = { 0.9, 0.15, 0.3, 1 } },
	{ size = "big",      scale = 1.0,  tint = { 0.34, 0.68, 0.90, 0.8 } },
	{ size = "behemoth", scale = 1.2,  tint = { 0.3, 1, 0, 0.8 } }
}

local start_attack_frame_sequence = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
local end_attack_frame_sequence = { 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 }

local function load_attack_sprite(worm, frame_sequence, is_mask)
	local sprite_name = is_mask and "worm-attack-mask" or "worm-attack"

	return util.sprite_load(
		"__factorio_hd_age_base_game_enemies_nauvis__/data/base/graphics/entity/worm/" .. sprite_name,
		{
			slice = 4,
			frame_count = 10,
			direction_count = 16,
			scale = worm.scale * 0.25,
			frame_sequence = frame_sequence,
			tint = is_mask and worm.tint or nil,
			multiply_shift = worm.scale,
			allow_forced_downscale = true,
			surface = "nauvis",
			usage = "enemy"
		}
	)
end

for _, worm in ipairs(worms) do
	local turret = data.raw.turret[worm.size .. "-worm-turret"]
	local starting_layers = turret.starting_attack_animation.layers
	local ending_layers = turret.ending_attack_animation.layers

	starting_layers[1] = load_attack_sprite(worm, start_attack_frame_sequence, false)
	starting_layers[2] = load_attack_sprite(worm, start_attack_frame_sequence, true)
	ending_layers[1] = load_attack_sprite(worm, end_attack_frame_sequence, false)
	ending_layers[2] = load_attack_sprite(worm, end_attack_frame_sequence, true)
end
