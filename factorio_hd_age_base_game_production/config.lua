local exclude = {	"*shadow*",
					"*reflection*",
					"*visualization*",
					"*wet-fluid-background*",
					"*beacon-module-lights*",
					"*furnace-ground-light*",
					"*furnace-glow*"
				}

local str= tostring(settings.startup["f_hd_a_bg_p_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_base_game_production",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2,
		},
		base = {
			graphics = {
				entity = {
					["accumulator"]={ ["*"]={}, ["remnants"]={} },
					["assembling-machine-1"]={ ["*"]={}, ["remnants"]={} },
					["assembling-machine-2"]={ ["*"]={}, ["remnants"]={} },
					["assembling-machine-3"]={ ["*"]={}, ["remnants"]={} },
					["beacon"]={ ["*"]={}, ["remnants"]={} },
					["boiler"]={ ["*"]={}, ["remnants"]={} },
					["burner-mining-drill"]={ ["*"]={}, ["remnants"]={} },
					["centrifuge"]={ ["*"]={}, ["remnants"]={} },
					["chemical-plant"]={ ["*"]={}, ["remnants"]={} },
					["electric-furnace"]={ ["*"]={}, ["remnants"]={} },
					["electric-mining-drill"]={ ["*"]={}, ["remnants"]={} },
					["heat-exchanger"]={ ["*"]={}, ["remnants"]={} },
					["heat-pipe"]={ ["*"]={}, ["remnants"]={} },
					["lab"]={ ["*"]={}, ["remnants"]={} },
					["nuclear-reactor"]={ ["*"]={}, ["remnants"]={} },
					["offshore-pump"]={ ["*"]={}, ["remnants"]={} },
					["oil-refinery"]={ ["*"]={}, ["remnants"]={} },
					["pumpjack"]={ ["*"]={}, ["remnants"]={} },
					["solar-panel"]={ ["*"]={}, ["remnants"]={} },
					["steam-engine"]={ ["*"]={}, ["remnants"]={} },
					["steam-turbine"]={ ["*"]={}, ["remnants"]={} },
					["steel-furnace"]={ ["*"]={}, ["remnants"]={} },
					["stone-furnace"]={ ["*"]={}, ["remnants"]={} }
				}
			}
		}
	}
}