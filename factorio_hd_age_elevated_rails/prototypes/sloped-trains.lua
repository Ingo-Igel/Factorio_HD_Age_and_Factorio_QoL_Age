local meld = require("__core__.lualib.meld")

local updates = {}

updates.wheels = {
	sloped = util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/train-wheel/train-wheel-sloped", {
		priority = "very-low",
		direction_count = 160,
		scale = 0.25,
		shift = util.by_pixel(0, 8),
		usage = "train"
	}),
	slope_angle_between_frames = 1.25
}

if not settings.startup["f_hd_a_er_disable_locomotive_sloped"].value then
	if settings.startup["f_hd_a_er_disable_locomotive_sloped_tint"].value then
		updates.locomotive = {
			wheels = updates.wheels,
			pictures = {
				slope_angle_between_frames = 1.25,
				sloped = {
					layers = {
						util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/locomotive/locomotive-sloped", {
							dice = 4,
							priority = "very-low",
							direction_count = 160,
							scale = 0.25,
							usage = "train"
						})
					}
				}
			}
		}
	else
		updates.locomotive = {
			wheels = updates.wheels,
			pictures = {
				slope_angle_between_frames = 1.25,
				sloped = {
					layers = {
						util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/locomotive/locomotive-sloped", {
							dice = 4,
							priority = "very-low",
							direction_count = 160,
							scale = 0.25,
							usage = "train"
						}),
						util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/locomotive/locomotive-sloped-mask", {
							dice = 4,
							priority = "very-low",
							flags = { "mask" },
							apply_runtime_tint = true,
							tint_as_overlay = true,
							direction_count = 160,
							scale = 0.25,
							usage = "train"
						})
					}
				}
			}
		}
	end
end

if not settings.startup["f_hd_a_er_disable_cargo_wagon_sloped"].value then
	if settings.startup["f_hd_a_er_disable_cargo_wagon_sloped_tint"].value then
		updates.cargo_wagon = {
			wheels = updates.wheels,
			pictures = {
				slope_angle_between_frames = 1.25,
				slope_back_equals_front = true,
				sloped = {
					layers = {
						util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/cargo-wagon/cargo-wagon-sloped", {
							dice = 4,
							priority = "very-low",
							back_equals_front = true,
							direction_count = 80,
							scale = 0.25,
							usage = "train"
						})
					}
				}
			}
		}
	else
		updates.cargo_wagon = {
			wheels = updates.wheels,
			pictures = {
				slope_angle_between_frames = 1.25,
				slope_back_equals_front = true,
				sloped = {
					layers = {
						util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/cargo-wagon/cargo-wagon-sloped", {
							dice = 4,
							priority = "very-low",
							back_equals_front = true,
							direction_count = 80,
							scale = 0.25,
							usage = "train"
						}),
						util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/cargo-wagon/cargo-wagon-sloped-mask", {
							dice = 4,
							priority = "very-low",
							flags = { "mask" },
							apply_runtime_tint = true,
							tint_as_overlay = true,
							direction_count = 80,
							scale = 0.25,
							usage = "train"
						})
					}
				}
			}
		}
	end
end

if not settings.startup["f_hd_a_er_disable_fluid_wagon_sloped"].value then
	updates.fluid_wagon = {
		wheels = updates.wheels,
		pictures = {
			slope_angle_between_frames = 1.25,
			slope_back_equals_front = true,
			sloped = {
				layers = {
					util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/fluid-wagon/fluid-wagon-sloped", {
						dice = 4,
						priority = "very-low",
						direction_count = 80,
						scale = 0.25,
						usage = "train"
					})
				}
			}
		}
	}
end

if not settings.startup["f_hd_a_er_disable_artillery_wagon_sloped"].value then
	updates.artillery_wagon = {
		wheels = updates.wheels,
		pictures = {
			slope_angle_between_frames = 1.25,
			sloped = {
				layers = {
					util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/artillery-wagon/artillery-wagon-sloped-base", {
						dice = 4,
						priority = "very-low",
						direction_count = 160,
						scale = 0.25,
						usage = "train"
					})
				}
			}
		},
		cannon_base_pictures = {
			slope_angle_between_frames = 1.25,
			sloped = {
				layers = {
					util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-base", {
						priority = "very-low",
						direction_count = 160,
						scale = 0.25,
						usage = "train"
					})
				}
			}
		},
		cannon_barrel_pictures = {
			slope_angle_between_frames = 1.25,
			sloped = {
				layers = {
					util.sprite_load("__factorio_hd_age_elevated_rails__/data/elevated-rails/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-barrel", {
						priority = "very-low",
						direction_count = 160,
						scale = 0.25,
						usage = "train"
					})
				}
			}
		}
	}
end

updates.apply_all_base = function()
	if not settings.startup["f_hd_a_er_disable_locomotive_sloped"].value then
		meld(data.raw["locomotive"]["locomotive"], updates.locomotive)
	end
	if not settings.startup["f_hd_a_er_disable_cargo_wagon_sloped"].value then
		meld(data.raw["cargo-wagon"]["cargo-wagon"], updates.cargo_wagon)
	end
	if not settings.startup["f_hd_a_er_disable_cargo_wagon_sloped"].value then
		meld(data.raw["fluid-wagon"]["fluid-wagon"], updates.fluid_wagon)
	end
	if not settings.startup["f_hd_a_er_disable_artillery_wagon_sloped"].value then
		meld(data.raw["artillery-wagon"]["artillery-wagon"], updates.artillery_wagon)
	end
end
return updates