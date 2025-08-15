local exclude = {	"*shadow*",
					"*reflections*"
				}

local str= tostring(settings.startup["f_hd_a_sa_l_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_space_age_logistics",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		["space-age"]={
			graphics = {
				entity = {
					["cargo-hubs"]={
						["bays"]={},
						["connections"]={},
						["hatches"]={},
						["hubs"]={}
					},
					["cargo-pod"]={},
					["stack-inserter"]={ ["*"]={}, ["remnants"]={} },
					["thruster"]={
						["thruster-bckg*"]={},
						["thruster-pipe-connection*"]={},
						["thruster-remnants*"]={},
						["thruster-smoke*"]={}
					},
					["turbo-splitter"]={ ["*"]={}, ["remnants"]={} },
					["turbo-transport-belt"]={ ["remnants"]={} },
					["turbo-underground-belt"]={ ["*"]={}, ["remnants"]={} }
				}
			}
		}
	}
}