local exclude = {
	"*shadow*",
	"*reflection*",
	"*visualisation*",
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

add_disable_words("f_hd_a_bg_d_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_base_game_decorative",
	exclude_names = exclude,
	white_list = "__base__/graphics/decorative/",
	data = {
		base = {
			graphics = {
				decorative = {
					["big-rock"] = {},
					["brown-asterisk"] = {},
					["brown-asterisk-mini"] = {},
					["brown-carpet-grass"] = {},
					["brown-fluff"] = {},
					["brown-fluff-dry"] = {},
					["brown-hairy-grass"] = {},
					["cracked-mud-decal"] = {},
					["dark-mud-decal"] = {},
					["enemy-decal"] = {},
					["garballo"] = {},
					["garballo-mini-dry"] = {},
					["green-asterisk"] = {},
					["green-asterisk-mini"] = {},
					["green-bush-mini"] = {},
					["green-carpet-grass"] = {},
					["green-croton"] = {},
					["green-desert-bush"] = {},
					["green-hairy-grass"] = {},
					["green-pita"] = {},
					["green-pita-mini"] = {},
					["green-small-grass"] = {},
					["huge-rock"] = {},
					["lichen-decal"] = {},
					["light-mud-decal"] = {},
					["medium-rock"] = {},
					["muddy-stump"] = {},
					["nuclear-ground-patch"] = {},
					["red-asterisk"] = {},
					["red-croton"] = {},
					["red-desert-bush"] = {},
					["red-desert-decal"] = {},
					["red-pita"] = {},
					["sand-decal"] = {},
					["sand-dune-decal"] = {},
					["sand-rock"] = {},
					["shroom-decal"] = {},
					["small-rock"] = {},
					["tiny-rock"] = {},
					["white-desert-bush"] = {},
					["worms-decal"] = {}
				}
			}
		}
	}
}
