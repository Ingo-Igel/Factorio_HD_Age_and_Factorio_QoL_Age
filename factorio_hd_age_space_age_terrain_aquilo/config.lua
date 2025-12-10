local exclude = {}

local str = tostring(settings.startup["f_hd_a_sa_ta_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_space_age_terrain_aquilo",
	exclude_names = exclude,
	white_list = "__space-age__/graphics/terrain/aquilo/",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
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
