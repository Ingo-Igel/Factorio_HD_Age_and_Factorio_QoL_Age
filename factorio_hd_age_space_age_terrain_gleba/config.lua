local exclude = {}

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

add_disable_words("f_hd_a_sa_tg_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_space_age_terrain_gleba",
	exclude_names = exclude,
	white_list = "__space-age__/graphics/terrain/",
	data = {
		["space-age"] = {
			graphics = {
				terrain = {
					["cliffs"] = {
						["gleba"] = {
							["cliff-gleba-entrance-lower.png"] = {},
							["cliff-gleba-inner-lower.png"] = {},
							["cliff-gleba-outer-lower.png"] = {},
							["cliff-gleba-sides-lower.png"] = {}
						},
					},
					["gleba"] = {
						["wetland-dead-skin-shader.png"] = {},
						["wetland-green-slime-shader.png"] = {},
						["wetland-pink-tentacle-shader.png"] = {},
						["wetland-purple-tentacle-shader.png"] = {}
					}
				}
			}
		}
	}
}
