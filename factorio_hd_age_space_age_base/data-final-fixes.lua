if not settings.startup["f_hd_a_sa_b_disable_asteroids"].value then
	require("prototypes.asteroids")
end

if not settings.startup["f_hd_a_sa_b_disable_foundation_transitions"].value then
	require("prototypes.transitions")
end

if not settings.startup["f_hd_a_sa_b_disable_mech_armor"].value then
	require("prototypes.mech-armor")
end

require("prototypes.transport-belt-frozen")

require("texture-loading")
