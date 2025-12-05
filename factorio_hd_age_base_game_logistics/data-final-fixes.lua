require("prototypes.transport-belts")

if settings.startup["f_hd_a_bg_l_loading_methode"].value == "fast" then
	require("loading-fast")
else
	require("loading-fallback")
end