local exclude = {
	"*shadow*",
	"*reflection*",
	"*visualisation*",
	"*worm-attack*",
	"*biter-*"
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

add_disable_words("f_hd_a_bg_en_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_base_game_enemies_nauvis",
	exclude_names = exclude,
	white_list = {
		"__base__/graphics/entity/acid-splash/",
		"__base__/graphics/entity/acid-sticker/",
		"__base__/graphics/entity/biter/",
		"__base__/graphics/entity/spawner/",
		"__base__/graphics/entity/worm/",
	},
	data = {
		base = {
			graphics = {
				entity = {
					["acid-splash"] = {},
					["acid-sticker"] = {},
					["biter"] = {},
					["spawner"] = {},
					["worm"] = {}
				}
			}
		}
	}
}
