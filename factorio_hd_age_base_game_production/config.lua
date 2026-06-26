local exclude = {
	"*shadow*",
	"*reflection*",
	"*visualization*",
	"*wet-fluid-background*"
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

add_disable_words("f_hd_a_bg_p_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_base_game_production",
	exclude_names = exclude,
	white_list = "__base__/graphics/entity/",
	data = {
		base = {
			graphics = {
				entity = {
					["accumulator"] = { ["*"] = {}, ["remnants"] = {} },
					["assembling-machine-1"] = { ["*"] = {}, ["remnants"] = {} },
					["assembling-machine-2"] = { ["*"] = {}, ["remnants"] = {} },
					["assembling-machine-3"] = { ["*"] = {}, ["remnants"] = {} },
					["beacon"] = {
						["beacon-bottom.png"] = {},
						["beacon-light.png"] = {},
						["beacon-module*"] = {},
						["beacon-top.png"] = {},
						["remnants"] = {}
					},
					["boiler"] = { ["*"] = {}, ["remnants"] = {} },
					["burner-mining-drill"] = { ["*"] = {}, ["remnants"] = {} },
					["centrifuge"] = { ["*"] = {}, ["remnants"] = {} },
					["chemical-plant"] = { ["*"] = {}, ["remnants"] = {} },
					["electric-furnace"] = {
						["electric-furnace.png"] = {},
						["electric-furnace-heater.png"] = {},
						["electric-furnace-light.png"] = {},
						["electric-furnace-propeller-*"] = {},
						["remnants"] = {}
					},
					["electric-mining-drill"] = { ["*"] = {}, ["remnants"] = {} },
					["heat-exchanger"] = { ["*"] = {}, ["remnants"] = {} },
					["heat-pipe"] = { ["*"] = {}, ["remnants"] = {} },
					["lab"] = { ["*"] = {}, ["remnants"] = {} },
					["nuclear-reactor"] = { ["*"] = {}, ["remnants"] = {} },
					["offshore-pump"] = { ["*"] = {}, ["remnants"] = {} },
					["oil-refinery"] = {
						["*"] = {},
						["east"] = {},
						["north"] = {},
						["south"] = {},
						["west"] = {}
					},
					["pumpjack"] = { ["*"] = {}, ["remnants"] = {} },
					["solar-panel"] = { ["*"] = {}, ["remnants"] = {} },
					["steam-engine"] = { ["*"] = {}, ["remnants"] = {} },
					["steam-turbine"] = { ["*"] = {}, ["remnants"] = {} },
					["steel-furnace"] = {
						["steel-furnace.png"] = {},
						["steel-furnace-fire.png"] = {},
						["steel-furnace-working.png"] = {},
						["remnants"] = {}
					},
					["stone-furnace"] = {
						["stone-furnace.png"] = {},
						["stone-furnace-fire.png"] = {},
						["stone-furnace-working.png"] = {},
						["remnants"] = {}
					}
				}
			}
		}
	}
}
