local exclude = {}

local str= tostring(settings.startup["f_hd_a_sa_tf_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_space_age_terrain_fulgora",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		["space-age"]={
			graphics = {
				terrain = {
					["fulgoran-conduit.png"]={},
					["fulgoran-dunes.png"]={},
					["fulgoran-dust.png"]={},
					["fulgoran-machinery.png"]={},
					["fulgoran-paving.png"]={},
					["fulgoran-rock.png"]={},
					["fulgoran-sand.png"]={},
					["fulgoran-walls.png"]={},
					["oil-ocean-deep-spec.png"]={},
					["oil-sand-8x.png"]={},
					["cliffs"]={
						["fulgora"]={
							["cliff-fulgora-entrance.png"]={},
							["cliff-fulgora-entrance-lower.png"]={},
							["cliff-fulgora-inner.png"]={},
							["cliff-fulgora-inner-lower.png"]={},
							["cliff-fulgora-outer.png"]={},
							["cliff-fulgora-outer-lower.png"]={},
							["cliff-fulgora-sides.png"]={},
							["cliff-fulgora-sides-lower.png"]={}
						}
					}
				}
			}
		}
	}
}