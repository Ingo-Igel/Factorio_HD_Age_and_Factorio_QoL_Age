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

add_disable_words("f_hd_a_sa_tv_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_space_age_terrain_vulcanus",
	exclude_names = exclude,
	white_list = "__space-age__/graphics/terrain/",
	data = {
		["space-age"] = {
			graphics = {
				terrain = {
					["cliffs"] = {
						["vulcanus"] = {
							["cliff-vulcanus-entrance.png"] = {},
							["cliff-vulcanus-entrance-lower.png"] = {},
							["cliff-vulcanus-inner.png"] = {},
							["cliff-vulcanus-inner-lower.png"] = {},
							["cliff-vulcanus-outer.png"] = {},
							["cliff-vulcanus-outer-lower.png"] = {},
							["cliff-vulcanus-sides.png"] = {},
							["cliff-vulcanus-sides-lower.png"] = {}
						}
					},
					["craters"] = {
						["vulcanus"] = {
							["vulcanus-crater-section-lower-E.png"] = {},
							["vulcanus-crater-section-lower-N.png"] = {},
							["vulcanus-crater-section-lower-NE.png"] = {},
							["vulcanus-crater-section-lower-NW.png"] = {},
							["vulcanus-crater-section-lower-S.png"] = {},
							["vulcanus-crater-section-lower-SE.png"] = {},
							["vulcanus-crater-section-lower-SW.png"] = {},
							["vulcanus-crater-section-lower-W.png"] = {},
							["vulcanus-crater-section-upper-E.png"] = {},
							["vulcanus-crater-section-upper-N.png"] = {},
							["vulcanus-crater-section-upper-NE.png"] = {},
							["vulcanus-crater-section-upper-NW.png"] = {},
							["vulcanus-crater-section-upper-S.png"] = {},
							["vulcanus-crater-section-upper-SE.png"] = {},
							["vulcanus-crater-section-upper-SW.png"] = {},
							["vulcanus-crater-section-upper-W.png"] = {}
						}
					},
					["vulcanus"] = {
						["lava-textures"] = {
							["coastal-lava.png"] = {},
							["lava.png"] = {}
						}
					}
				}
			}
		}
	}
}
