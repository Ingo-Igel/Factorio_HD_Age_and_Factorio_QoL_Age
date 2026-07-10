data:extend {
	{
		type = "bool-setting",
		setting_type = "startup",
		name = "f_hd_a_sa_tf_disable_oil_ocean_deep",
		default_value = false,
		forced_value = true,
		order = "a"
	},
	{
		type = "bool-setting",
		setting_type = "startup",
		name = "f_hd_a_sa_tf_disable_water-transitions",
		default_value = false,
		forced_value = true,
		order = "b"
	},
	{
		type = "bool-setting",
		setting_type = "startup",
		name = "f_hd_a_sa_tf_disable_out-of-map-transitions",
		default_value = true,
		forced_value = true,
		order = "c"
	},
	{
		type = "string-setting",
		setting_type = "startup",
		name = "f_hd_a_sa_tf_disable_string",
		default_value = "",
		allow_blank = true,
		order = "z"
	}
}
