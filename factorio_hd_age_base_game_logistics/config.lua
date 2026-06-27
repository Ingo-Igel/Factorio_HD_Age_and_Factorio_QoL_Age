local exclude = {
	"*shadow*",
	"*reflection*"
}

local function add_disable_words(setting_name)
    local setting = settings.startup[setting_name]
    if not setting then
        return
    end

    local value = setting.value
    if type(value) ~= "string" or value == "" then
        return
    end

    for word in string.gmatch(value, "[^,%s]+") do
        table.insert(exclude, "*" .. word .. "*")
    end
end

add_disable_words("f_hd_a_bg_l_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_base_game_logistics",
	exclude_names = exclude,
	white_list = "__base__/graphics/entity/",
	data = {
		base = {
			graphics = {
				entity = {
					["big-electric-pole"] = { ["*"] = {}, ["remnants"] = {} },
					["bulk-inserter"] = { ["*"] = {}, ["remnants"] = {} },
					["burner-inserter"] = { ["*"] = {}, ["remnants"] = {} },
					["car"] = {
						["*"] = {},
						["remnants"] = { ["*"] = {}, ["mask"] = {} }
					},
					["cargo-hubs"] = {
						["connections"] = {},
						["hatches"] = {},
						["hubs"] = {
							["planet-hub-*"] = {}
						}
					},
					["cargo-pod"] = {
						["pod-corpse.png"] = {},
						["pod-death.png"] = {},
						["pod-landing.png"] = {},
						["pod-open*"] = {},
						["pod-static-*"] = {}
					},
					["circuit-connector"] = {},
					["cliff-explosives"] = {},
					["combinator"] = {
						["*"] = {},
						["remnants"] = {
							["arithmetic"] = {},
							["constant"] = {},
							["decider"] = {},
							["selector"] = {}
						}
					},
					["construction-robot"] = { ["*"] = {}, ["remnants"] = {} },
					["display-panel"] = {},
					["express-splitter"] = { ["*"] = {}, ["remnants"] = {} },
					["express-transport-belt"] = { ["remnants"] = {} },
					["express-underground-belt"] = { ["*"] = {}, ["remnants"] = {} },
					["fast-inserter"] = { ["*"] = {}, ["remnants"] = {} },
					["fast-splitter"] = { ["*"] = {}, ["remnants"] = {} },
					["fast-transport-belt"] = { ["remnants"] = {} },
					["fast-underground-belt"] = { ["*"] = {}, ["remnants"] = {} },
					["infinity-chest"] = {},
					["inserter"] = { ["*"] = {}, ["remnants"] = {} },
					["iron-chest"] = { ["*"] = {}, ["remnants"] = {} },
					["linked-belt"] = {},
					["linked-chest"] = {},
					["logistic-chest"] = { ["*"] = {}, ["remnants"] = {} },
					["logistic-robot"] = { ["*"] = {}, ["remnants"] = {} },
					["long-handed-inserter"] = { ["*"] = {}, ["remnants"] = {} },
					["market"] = {},
					["medium-electric-pole"] = { ["*"] = {}, ["remnants"] = {} },
					["pipe"] = {
						["fluid-flow-*"] = {},
						["pipe-corner-*"] = {},
						["pipe-cross.png"] = {},
						["pipe-ending-*"] = {},
						["*-window-background.png"] = {},
						["pipe-straight-*"] = {},
						["pipe-t-*"] = {},
						["remnants"] = {}
					},
					["pipe-covers"] = {},
					["pipe-to-ground"] = {
						["pipe-to-ground-*"] = {},
						["remnants"] = {}
					},
					["power-switch"] = { ["*"] = {}, ["remnants"] = {} },
					["programmable-speaker"] = { ["*"] = {}, ["remnants"] = {} },
					["pump"] = {
						["*"] = {},
						["connector"] = {},
						["remnants"] = {}
					},
					["rail-chain-signal"] = { ["*"] = {}, ["remnants"] = {} },
					["rail-signal"] = { ["*"] = {}, ["remnants"] = {} },
					["roboport"] = { ["*"] = {}, ["remnants"] = {} },
					["small-electric-pole"] = {
						["small-electric-pole.png"] = {},
						["remnants"] = {}
					},
					["small-lamp"] = { ["*"] = {}, ["remnants"] = {} },
					["spidertron"] = {
						["legs"] = {},
						["remnants"] = { ["*"] = {}, ["mask"] = {} },
						["torso"] = {}
					},
					["splitter"] = { ["*"] = {}, ["remnants"] = {} },
					["steel-chest"] = { ["*"] = {}, ["remnants"] = {} },
					["storage-tank"] = {
						["storage-tank.png"] = {},
						["window-background.png"] = {},
						["remnants"] = {}
					},
					["substation"] = { ["*"] = {}, ["remnants"] = {} },
					["tank"] = {
						["*"] = {},
						["remnants"] = { ["*"] = {}, ["mask"] = {} }
					},
					["train-stop"] = {
						["*"] = {},
						["remnants"] = { ["*"] = {}, ["mask"] = {} }
					},
					["transport-belt"] = {
						["*reader*"] = {},
						["connector"] = {},
						["remnants"] = {}
					},
					["underground-belt"] = { ["*"] = {}, ["remnants"] = {} },
					["wooden-chest"] = { ["*"] = {}, ["remnants"] = {} }
				}
			}
		}
	}
}
