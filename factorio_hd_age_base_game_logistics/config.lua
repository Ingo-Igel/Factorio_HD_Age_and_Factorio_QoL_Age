local exclude = {	"*shadow*",
					"*reflection*",
					"*visualization.png",
					"fluid-background.png",
					"*combinator-LED*",
					"*pod-thruster*"
				}

local str= tostring(settings.startup["f_hd_a_bg_l_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_base_game_logistics",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		base = {
			graphics = {
				entity = {
					["big-electric-pole"]={ ["*"]={}, ["remnants"]={} },
					["bulk-inserter"]={ ["*"]={}, ["remnants"]={} },
					["burner-inserter"]={ ["*"]={}, ["remnants"]={} },
					["car"]={
						["*"]={},
						["remnants"]={ ["*"]={}, ["mask"]={} }
					},
					["cargo-hubs"]={
						["connections"]={},
						["hatches"]={},
						["hubs"]={}
					},
					["cargo-pod"]={},
					["circuit-connector"]={},
					["cliff-explosives"]={},
					["combinator"]={
						["*"]={},
						["remnants"]={
							["arithmetic"]={},
							["constant"]={},
							["decider"]={},
							["selector"]={}
						}
					},
					["compilatron-chest"]={},
					["construction-robot"]={ ["*"]={}, ["remnants"]={} },
					["display-panel"]={},
					["express-splitter"]={ ["*"]={}, ["remnants"]={} },
					["express-transport-belt"]={ ["remnants"]={} },
					["express-underground-belt"]={ ["*"]={}, ["remnants"]={} },
					["fast-inserter"]={ ["*"]={}, ["remnants"]={} },
					["fast-splitter"]={ ["*"]={}, ["remnants"]={} },
					["fast-transport-belt"]={ ["remnants"]={} },
					["fast-underground-belt"]={ ["*"]={}, ["remnants"]={} },
					["infinity-chest"]={},
					["inserter"]={ ["*"]={}, ["remnants"]={} },
					["iron-chest"]={ ["*"]={}, ["remnants"]={} },
					["linked-belt"]={},
					["linked-chest"]={},
					["logistic-chest"]={ ["*"]={}, ["remnants"]={} },
					["logistic-robot"]={ ["*"]={}, ["remnants"]={} },
					["long-handed-inserter"]={ ["*"]={}, ["remnants"]={} },
					["market"]={},
					["medium-electric-pole"]={ ["*"]={}, ["remnants"]={} },
					["pipe"]={ ["*"]={}, ["remnants"]={} },
					["pipe-covers"]={},
					["pipe-to-ground"]={ ["*"]={}, ["remnants"]={} },
					["power-switch"]={ ["*"]={}, ["remnants"]={} },
					["programmable-speaker"]={ ["*"]={}, ["remnants"]={} },
					["pump"]={ ["*"]={},
						["connector"]={},
						["remnants"]={}
					},
					["rail-chain-signal"]={ ["*"]={}, ["remnants"]={} },
					["rail-signal"]={ ["*"]={}, ["remnants"]={} },
					["roboport"]={ ["*"]={}, ["remnants"]={} },
					["small-electric-pole"]={ ["*"]={}, ["remnants"]={} },
					["small-lamp"]={ ["*"]={}, ["remnants"]={} },
					["spidertron"]={
						["legs"]={},
						["remnants"]={ ["*"]={}, ["mask"]={} },
						["torso"]={}
					},
					["splitter"]={ ["*"]={}, ["remnants"]={} },
					["steel-chest"]={ ["*"]={}, ["remnants"]={} },
					["storage-tank"]={ ["*"]={}, ["remnants"]={} },
					["substation"]={ ["*"]={}, ["remnants"]={} },
					["tank"]={ ["*"]={},
						["remnants"]={ ["*"]={}, ["mask"]={} }
					},
					["train-stop"]={ ["*"]={},
						["remnants"]={ ["*"]={}, ["mask"]={} }
					},
					["transport-belt"]={
						["*reader*"]={},
						["connector"]={},
						["remnants"]={}
					},
					["underground-belt"]={ ["*"]={}, ["remnants"]={} },
					["wooden-chest"]={ ["*"]={}, ["remnants"]={} }
				}
			}
		}
	}
}