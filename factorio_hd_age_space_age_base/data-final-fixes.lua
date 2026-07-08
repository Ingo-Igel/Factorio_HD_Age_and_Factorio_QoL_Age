if not settings.startup["f_hd_a_sa_b_disable_asteroids"].value then
	require("prototypes.asteroids")
end

if not settings.startup["f_hd_a_sa_b_disable_mech_armor"].value then
	require("prototypes.mech-armor")
end

if not settings.startup["f_hd_a_sa_b_disable_stromatolite"].value then
	require("prototypes.stromatolite")
end

require("prototypes.transitions")
require("prototypes.transport-belt-frozen")

require("texture-loading")
