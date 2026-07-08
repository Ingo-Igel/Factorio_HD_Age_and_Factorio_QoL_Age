if not settings.startup["f_hd_a_sa_d_disable_vulcanus_demolisher-corpse"].value then
	require("prototypes.demolisher-corpse")
end
if not settings.startup["f_hd_a_sa_d_disable_fulgora_sunken-ruin"].value then
	require("prototypes.sunken-ruin")
end
if not settings.startup["f_hd_a_sa_d_disable_vulcanus_chimneys"].value then
	require("prototypes.vulcanus-chimney")
end
if not settings.startup["f_hd_a_sa_d_disable_vulcanus_rocks"].value then
	require("prototypes.vulcanus-rocks")
end

require("texture-loading")
