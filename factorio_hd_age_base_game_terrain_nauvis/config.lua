local exclude = { "*shadow*" }

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

add_disable_words("f_hd_a_bg_tn_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_base_game_terrain_nauvis",
	exclude_names = exclude,
	white_list = "__base__/graphics/terrain/",
	data = {
		base = {
			graphics = {
				terrain = {
					["landfill.png"] = {},
					["nuclear-ground.png"] = {},
					["cliffs"] = {},
					["deepwater"] = {},
					["deepwater-green"] = {},
					["water"] = {},
					["water-green"] = {},
					["water-mud"] = {},
					["water-shallow"] = {}
				}
			}
		}
	}
}
