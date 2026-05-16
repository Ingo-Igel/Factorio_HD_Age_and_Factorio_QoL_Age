local exclude = {
	"*shadow*",
	"*smoke*"
}

local function add_disable_words(setting_name)
    local setting = settings.startup[setting_name]
    if not setting then
        return
    end

    local value = setting.value
    if value == "" then
        return
    end

    for word in string.gmatch(value, "[^,%s]+") do
        table.insert(exclude, "*" .. word .. "*")
    end
end

add_disable_words("f_hd_a_q_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_quality",
	exclude_names = exclude,
	white_list = "__quality__/graphics/entity/",
	data = {
		quality = {
			graphics = {
				entity = {
					["recycler"] = {}
				}
			}
		}
	}
}
