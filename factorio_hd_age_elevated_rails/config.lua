local exclude = {	"*shadow*",
					"*reflection*",
					"*lights*",
					"*ramp-segment-visualisations-middle*"
				}

local str= tostring(settings.startup["f_hd_a_er_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_elevated_rails",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		["elevated-rails"]={
			graphics = {
				entity = {
					["elevated-rail"]={
						["elevated-rail-ending.png"]={},
						["remnants"]={
							["elevated-rail-remnants.png"]={}
						}
					},
					["elevated-rail-chain-signal"]={},
					["elevated-rail-pylon"]={ ["*"]={}, ["remnants"]={} },
					["elevated-rail-ramp"]={ ["*"]={}, ["remnants"]={} },
					["elevated-rail-signal"]={}
				}
			}
		}
	}
}