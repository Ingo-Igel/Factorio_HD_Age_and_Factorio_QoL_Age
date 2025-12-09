local exclude = { "*shadow*",
	"*reflection*",
	"*visualisation*",
	"*worm-attack*",
	"*biter-*"
}

local str = tostring(settings.startup["f_hd_a_bg_en_disable_string"].value)
if str then
	for word in string.gmatch(str, '[^,%s]+') do
		table.insert(exclude, "*" .. word .. "*")
	end
end

if mods["factorio_hd_age_modpack"] or mods["factorio_hd_age_modpack_optional"] or mods["factorio_hd_age_modpack_base_game_only"] or mods["factorio_hd_age_modpack_base_game_optional"] then
	local str1 = tostring(settings.startup["f_hd_a_disable_string"].value)
	if str1 then
		for word in string.gmatch(str1, '[^,%s]+') do
			table.insert(exclude, "*" .. word .. "*")
		end
	end
end

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_base_game_enemies_nauvis",
	exclude_names = exclude,
	white_list = "__base__/graphics/entity/",
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
