local exclude = {}

local str= tostring(settings.startup["f_hd_a_sa_tg_disable_string"].value)
if str then
	for word in string.gmatch(str,'[^,%s]+') do
		table.insert (exclude, "*"..word.."*")
	end
end

if mods["factorio_hd_age_modpack"] or mods["factorio_hd_age_modpack_optional"] or mods["factorio_hd_age_modpack_base_game_only"] or mods["factorio_hd_age_modpack_base_game_optional"] then
	local str1= tostring(settings.startup["f_hd_a_disable_string"].value)
	if str1 then
		for word in string.gmatch(str1,'[^,%s]+') do
			table.insert (exclude, "*"..word.."*")
		end
	end
end

return {
	resource_pack_name = "factorio_hd_age_space_age_terrain_gleba",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		["space-age"]={
			graphics = {
				terrain = {
					["cliffs"]={
						["gleba"]={
							["cliff-gleba-entrance-lower.png"]={},
							["cliff-gleba-inner-lower.png"]={},
							["cliff-gleba-outer-lower.png"]={},
							["cliff-gleba-sides-lower.png"]={}
						},
					},
					["gleba"]={
						["wetland-dead-skin-shader.png"]={},
						["wetland-green-slime-shader.png"]={},
						["wetland-pink-tentacle-shader.png"]={},
						["wetland-purple-tentacle-shader.png"]={}
					}
				}
			}
		}
	}
}