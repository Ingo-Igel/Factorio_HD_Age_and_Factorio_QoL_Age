local exclude = {
	"*shadow*",
	"*smoke*",
	"*reflection*"
}

local function add_disable_words(setting_name)
    local setting = settings.startup[setting_name]
    if not setting then
        return
    end

    local value = setting.value
    if type(value) ~= "string" or value == "" then
        return
    end

    for word in string.gmatch(value, "[^,%s]+") do
        table.insert(exclude, "*" .. word .. "*")
    end
end

add_disable_words("f_hd_a_r_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_recycler",
	exclude_names = exclude,
	white_list = "__recycler__/graphics/entity/",
	data = {
		recycler = {
			graphics = {
				entity = {
					["recycler"] = {}
				}
			}
		}
	}
}
