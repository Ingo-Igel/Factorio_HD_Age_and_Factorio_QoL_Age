local exclude = {
	"*shadow*",
	"*reflection*",
	"*visualisation*",
	"*03-rocket*",
	"red-light.png",
	"nuke-shockwave-*",
	"*jet*",
	"*oil-smoke*",
	"*rocket-smoke*",
	"*08-rocket-silo-arms-right*",
	"*footprints*",
	"*-mask*",
	"*effect_map*"
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

add_disable_words("f_hd_a_bg_b_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_base_game_base",
	exclude_names = exclude,
	white_list = {
		"__base__/graphics/entity/",
		"__base__/graphics/terrain/",
		"__core__/graphics/"
	},
	data = {
		base = {
			graphics = {
				entity = {
					["character"] = {},
					["coal"] = {},
					["compilatron"] = {},
					["copper-ore"] = {},
					["crash-site-chests"] = {},
					["crash-site-spaceship"] = {},
					["crude-oil"] = {},
					["iron-ore"] = {},
					["remnants"] = {},
					["rocket-silo"] = { ["*"] = {}, ["15-remnants"] = {} },
					["scorchmark"] = {},
					["stone"] = {},
					["tree"] = {
						["01"] = {},
						["02"] = {},
						["03"] = {},
						["04"] = {},
						["05"] = {},
						["06"] = {},
						["07"] = {},
						["08"] = {},
						["09"] = {},
						["dead-dry-hairy-tree"] = {},
						["dead-grey-trunk"] = {},
						["dead-tree-desert"] = {},
						["dry-hairy-tree"] = {},
						["dry-tree"] = {}
					},
					["uranium-ore"] = {}
				},
				terrain = {
					["concrete"] = {},
					["hazard-concrete-left"] = {},
					["hazard-concrete-right"] = {},
					["stone-path"] = {},
					["tutorial-grid"] = {}
				}
			}
		},
		core = {
			graphics = {
				["copper-wire.png"] = {},
				["green-wire.png"] = {},
				["red-wire.png"] = {},
				["wire-highlight.png"] = {}
			}
		}
	}
}
