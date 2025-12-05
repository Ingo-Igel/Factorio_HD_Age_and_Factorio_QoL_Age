data:extend {
	{
		type = "bool-setting",
		setting_type = "startup",
		name = "f_hd_a_bg_l_disable_transport_belt",
		default_value = false,
		forced_value = true,
		order = "a"
	},
	{
		type = "bool-setting",
		setting_type = "startup",
		name = "f_hd_a_bg_l_disable_fast_transport_belt",
		default_value = false,
		forced_value = true,
		order = "b"
	},
	{
		type = "bool-setting",
		setting_type = "startup",
		name = "f_hd_a_bg_l_disable_express_transport_belt",
		default_value = false,
		forced_value = true,
		order = "c"
	},
	{
		type = "string-setting",
		setting_type = "startup",
		name = "f_hd_a_bg_l_disable_string",
		default_value = "",
		allow_blank = true,
		order = "z"
	},
	{
		type = "string-setting",
		setting_type = "startup",
		name = "f_hd_a_bg_l_loading_methode",
		default_value = "fallback",
		allowed_values = { "fast", "fallback" }
	}
}
