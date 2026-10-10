require("texture-loading")

require("prototypes.sloped-trains").apply_all_base()

if not settings.startup["f_hd_a_er_disable_elevated_rails"].value then
	require("prototypes.elevated-rail")
	if settings.startup["f_hd_a_er_use_colored_railing"].value then
		require("prototypes.rail-ramp")
	end
end
