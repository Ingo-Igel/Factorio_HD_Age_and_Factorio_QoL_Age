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

add_disable_words("f_hd_a_sa_tf_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_space_age_terrain_fulgora",
	exclude_names = exclude,
	white_list = "__space-age__/graphics/terrain/",
	data = {
		["space-age"] = {
			graphics = {
				terrain = {
					["fulgoran-conduit.png"] = {},
					["fulgoran-dunes.png"] = {},
					["fulgoran-dust.png"] = {},
					["fulgoran-machinery.png"] = {},
					["fulgoran-paving.png"] = {},
					["fulgoran-rock.png"] = {},
					["fulgoran-sand.png"] = {},
					["fulgoran-walls.png"] = {},
					["oil-ocean-deep-spec.png"] = {},
					["oil-sand-8x.png"] = {},
					["cliffs"] = {
						["fulgora"] = {
							["cliff-fulgora-entrance.png"] = {},
							["cliff-fulgora-entrance-lower.png"] = {},
							["cliff-fulgora-inner.png"] = {},
							["cliff-fulgora-inner-lower.png"] = {},
							["cliff-fulgora-outer.png"] = {},
							["cliff-fulgora-outer-lower.png"] = {},
							["cliff-fulgora-sides.png"] = {},
							["cliff-fulgora-sides-lower.png"] = {}
						}
					}
				}
			}
		}
	}
}
