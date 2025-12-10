if not mods["factorio_hd_age_modpack_optional"] then
	data:extend {
		{
			type = "string-setting",
			setting_type = "startup",
			name = "f_hd_a_disable_string",
			default_value = "",
			allow_blank = true
		}
	}
end
