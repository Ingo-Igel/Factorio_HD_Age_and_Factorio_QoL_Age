if not settings.startup["f_hd_a_sa_b_disable_asteroids"].value then
	require("prototypes.asteroids")
end

require("prototypes.transitions")

if not settings.startup["f_hd_a_sa_b_disable_mech_armor"].value then
	require("prototypes.mech-armor")
end

require("prototypes.transport-belt-frozen")

require("texture-loading")
