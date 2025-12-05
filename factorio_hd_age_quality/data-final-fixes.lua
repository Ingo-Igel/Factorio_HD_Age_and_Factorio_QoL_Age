if settings.startup["f_hd_a_q_loading_methode"].value == "fast" then
	require("loading-fast")
else
	require("loading-fallback")
end