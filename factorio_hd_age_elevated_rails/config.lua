local exclude = {
	"*shadow*",
	"*reflection*",
	"*lights*",
	"*ramp-segment-visualisations-middle*"
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

add_disable_words("f_hd_a_er_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_elevated_rails",
	exclude_names = exclude,
	white_list = "__elevated-rails__/graphics/entity/",
	data = {
		["elevated-rails"] = {
			graphics = {
				entity = {
					["elevated-rail"] = {
						["elevated-rail-ending.png"] = {},
						["remnants"] = {
							["elevated-rail-remnants.png"] = {}
						}
					},
					["elevated-rail-chain-signal"] = {},
					["elevated-rail-pylon"] = { ["*"] = {}, ["remnants"] = {} },
					["elevated-rail-ramp"] = { ["*"] = {}, ["remnants"] = {} },
					["elevated-rail-signal"] = {}
				}
			}
		}
	}
}
