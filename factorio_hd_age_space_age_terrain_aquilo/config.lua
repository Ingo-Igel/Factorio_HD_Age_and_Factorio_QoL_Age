local exclude = {}

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

add_disable_words("f_hd_a_sa_ta_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_space_age_terrain_aquilo",
	exclude_names = exclude,
	white_list = "__space-age__/graphics/terrain/aquilo/",
	data = {
		["space-age"] = {
			graphics = {
				terrain = {
					["aquilo"] = {
						["brash-ice.png"] = {},
						["frozen-concrete.png"] = {},
						["frozen-hazard-concrete-left.png"] = {},
						["frozen-hazard-concrete-right.png"] = {},
						["frozen-refined-concrete.png"] = {},
						["frozen-refined-hazard-concrete-left.png"] = {},
						["frozen-refined-hazard-concrete-right.png"] = {},
						["frozen-stone-path.png"] = {},
						["ice-platform.png"] = {},
						["ice-smooth.png"] = {},
						["snow-patchy-8x.png"] = {}
					}
				}
			}
		}
	}
}
