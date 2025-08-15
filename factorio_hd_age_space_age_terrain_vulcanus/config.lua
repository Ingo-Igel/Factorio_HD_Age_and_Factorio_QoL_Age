local exclude = {}

local str= tostring(settings.startup["f_hd_a_sa_tv_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_space_age_terrain_vulcanus",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		["space-age"]={
			graphics = {
				terrain = {
					["cliffs"]={
						["vulcanus"]={
							["cliff-vulcanus-entrance.png"]={},
							["cliff-vulcanus-entrance-lower.png"]={},
							["cliff-vulcanus-inner.png"]={},
							["cliff-vulcanus-inner-lower.png"]={},
							["cliff-vulcanus-outer.png"]={},
							["cliff-vulcanus-outer-lower.png"]={},
							["cliff-vulcanus-sides.png"]={},
							["cliff-vulcanus-sides-lower.png"]={}
						}
					},
					["craters"]={
						["vulcanus"]={
							["vulcanus-crater-section-lower-E.png"]={},
							["vulcanus-crater-section-lower-N.png"]={},
							["vulcanus-crater-section-lower-NE.png"]={},
							["vulcanus-crater-section-lower-NW.png"]={},
							["vulcanus-crater-section-lower-S.png"]={},
							["vulcanus-crater-section-lower-SE.png"]={},
							["vulcanus-crater-section-lower-SW.png"]={},
							["vulcanus-crater-section-lower-W.png"]={},
							["vulcanus-crater-section-upper-E.png"]={},
							["vulcanus-crater-section-upper-N.png"]={},
							["vulcanus-crater-section-upper-NE.png"]={},
							["vulcanus-crater-section-upper-NW.png"]={},
							["vulcanus-crater-section-upper-S.png"]={},
							["vulcanus-crater-section-upper-SE.png"]={},
							["vulcanus-crater-section-upper-SW.png"]={},
							["vulcanus-crater-section-upper-W.png"]={}
						}
					},
					["vulcanus"]={
						["lava-textures"]={
							["coastal-lava.png"]={},
							["lava.png"]={}
						}
					}
				}
			}
		}
	}
}