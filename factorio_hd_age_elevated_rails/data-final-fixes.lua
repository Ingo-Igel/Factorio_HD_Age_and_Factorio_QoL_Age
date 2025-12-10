require("prototypes.sloped-trains").apply_all_base()

if not settings.startup["f_hd_a_er_disable_elevated_rails"].value then
	require("prototypes.elevated-rail")
end

require("texture-loading")
