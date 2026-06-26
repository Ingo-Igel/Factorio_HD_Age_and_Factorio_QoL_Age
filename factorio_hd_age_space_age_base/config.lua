local exclude = {
	"*shadow*",
	"*effect-map*"
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

add_disable_words("f_hd_a_sa_b_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_space_age_base",
	exclude_names = exclude,
	white_list = {
		"__base__/graphics/entity/oil-refinery/frozen",
		"__space-age__/graphics/entity/",
		"__space-age__/graphics/terrain/foundation/",
		"__space-age__/graphics/terrain/space-platform/"
	},
	data = {
		base = {
			graphics = {
				entity = {
					["oil-refinery"] = {
						["frozen"] = {}
					}
				}
			}
		},
		["space-age"] = {
			graphics = {
				entity = {
					["calcite"] = {},
					["fluorine-vent"] = {
						["fluorine-vent.png"] = {},
					},
					["frozen"] = {
						["assembling-machine"] = {},
						["beacon"] = {},
						["centrifuge"] = {},
						["chemical-plant"] = {},
						["combinator"] = {},
						["electric-furnace"] = {},
						["inserter"] = {},
						["lab"] = {},
						["pipe"] = {},
						["pipe-covers"] = {},
						["pipe-to-ground"] = {},
						["power-switch"] = {},
						["pump"] = {},
						["pumpjack"] = {},
						["radar"] = {},
						["roboport"] = {},
						["rocket-silo"] = {},
						["splitter"] = {},
						["steam-turbine"] = {},
						["storage-tank"] = {},
						["underground-belt"] = {}
					},
					["lightning"] = {},
					["lithium-brine"] = {},
					["mech-armor"] = {
						["mech-corpse*"] = {},
						["mech-descend*"] = {},
						["mech-idle*"] = {},
						["mech-uplift*"] = {}
					},
					["plant"] = {
						["ashland-trees"] = {},
						["boompuff"] = {},
						["cuttlepop"] = {},
						["funneltrunk"] = {},
						["hairyclubnub"] = {},
						["jellystem"] = {},
						["lickmaw"] = {},
						["planted-tree"] = {},
						["slipstack"] = {},
						["stingfrond"] = {
							["stingfrond-harvest*"] = {},
							["stingfrond-normal.png"] = {},
							["stingfrond-trunk.png"] = {}
						},
						["sunnycomb"] = {},
						["teflilly"] = {},
						["tree-plant"] = {},
						["water-cane"] = {},
						["yumako-tree"] = {}
					},
					["scrap"] = {},
					["space-platform-build-anim"] = {},
					["stromatolite"] = {
						["copper"] = {},
						["iron"] = {}
					},
					["sulfuric-acid-geyser"] = {
						["sulfuric-acid-geyser.png"] = {}
					},
					["tungsten-ore"] = {},
				},
				terrain = {
					["foundation"] = {
						["foundation*"] = {
							["foundation.png"] = {}
						}
					},
					["space-platform"] = {
						["space-platform-1x1.png"] = {},
						["space-platform-2x2.png"] = {},
						["space-platform-double-side.png"] = {},
						["space-platform-double-side-background.png"] = {},
						["space-platform-inner-corner.png"] = {},
						["space-platform-inner-corner-background.png"] = {},
						["space-platform-o.png"] = {},
						["space-platform-outer-corner.png"] = {},
						["space-platform-outer-corner-background.png"] = {},
						["space-platform-side.png"] = {},
						["space-platform-side-background.png"] = {},
						["space-platform-u.png"] = {},
						["space-platform-u-background.png"] = {},
						["tile-animations"] = {}
					}
				}
			}
		}
	}
}
