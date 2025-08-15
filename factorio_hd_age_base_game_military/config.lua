local exclude = {	"*shadow*",
					"*reflection*",
					"*visualization*",
					"smoke.png",
					"*laser-ground-light*"
				}

local str= tostring(settings.startup["f_hd_a_bg_m_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_base_game_military",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2,
		},
		base = {
			graphics = {
				entity = {
					["artillery-turret"]={ ["*"]={}, ["remnants"]={} },
					["artillery-wagon"]={ ["remnants"]={} },
					["beam"]={},
					["bigass-explosion"]={},
					["cluster-grenade"]={},
					["combat-robot-capsule"]={},
					["defender-robot"]={ ["*"]={}, ["remnants"]={} },
					["destroyer-robot"]={ ["*"]={}, ["remnants"]={} },
					["distractor-robot"]={ ["*"]={}, ["remnants"]={} },
					["explosion"]={},
					["fire-flame"]={},
					["flamethrower-fire-stream"]={},
					["flamethrower-turret"]={ ["*"]={}, ["remnants"]={ ["*"]={}, ["mask"]={} } },
					["gate"]={ ["*"]={}, ["remnants"]={} },
					["grenade"]={},
					["gun-turret"]={ ["*"]={}, ["remnants"]={ ["*"]={}, ["mask"]={} } },
					["land-mine"]={ ["*"]={}, ["remnants"]={} },
					["laser-turret"]={ ["*"]={}, ["remnants"]={ ["*"]={}, ["mask"]={} } },
					["poison-capsule"]={},
					["radar"]={ ["*"]={}, ["remnants"]={} },
					["slowdown-capsule"]={},
					["slowdown-sticker"]={},
					["small-explosion"]={},
					["smoke"]={},
					["wall"]={ ["*"]={}, ["remnants"]={} }
				}
			}
		}
	}
}