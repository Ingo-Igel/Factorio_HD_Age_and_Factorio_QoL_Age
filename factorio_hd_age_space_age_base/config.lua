local exclude = {
	"*shadow*",
	"*lights*",
	"*reflection*",
	"*transition*",
	"*tint*",
	"*dummy*",
	"*glow*",
	"*beam*",
	"*gas*",
	"*fluids*",
	"*visualization*",
	"*flame*",
	"*effect-map*",
	"*foundation-inner-corner-mask*",
	"*foundation-o-mask*",
	"*foundation-outer-corner-mask*",
	"*foundation-side-mask*",
	"*foundation-u-mask*",
	"*space-platform-double-side-mask*",
	"*space-platform-inner-corner-mask*",
	"*space-platform-o-mask*",
	"*space-platform-outer-corner-mask*",
	"*space-platform-side-mask*",
	"*space-platform-u-mask*",
}

local str = tostring(settings.startup["f_hd_a_sa_b_disable_string"].value)
if str then
	for word in string.gmatch(str, '[^,%s]+') do
		table.insert(exclude, "*" .. word .. "*")
	end
end

if mods["factorio_hd_age_modpack"] or mods["factorio_hd_age_modpack_optional"] or mods["factorio_hd_age_modpack_base_game_only"] or mods["factorio_hd_age_modpack_base_game_optional"] then
	local str1 = tostring(settings.startup["f_hd_a_disable_string"].value)
	if str1 then
		for word in string.gmatch(str1, '[^,%s]+') do
			table.insert(exclude, "*" .. word .. "*")
		end
	end
end

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_space_age_base",
	exclude_names = exclude,
	white_list = {
		"__space-age__/graphics/entity/",
		"__space-age__/graphics/terrain/foundation/",
		"__space-age__/graphics/terrain/space-platform/"
	},
	data = {
		["space-age"] = {
			graphics = {
				entity = {
					["calcite"] = {},
					["fluorine-vent"] = {},
					["frozen"] = {
						["assembling-machine"] = {},
						["beacon"] = {},
						["centrifuge"] = {},
						["chemical-plant"] = {},
						["combinator"] = {},
						["electric-furnace"] = {},
						["inserter"] = {},
						["lab"] = {},
						["oil-refinery"] = {},
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
						["mech-corpse.png"] = {},
						["mech-corpse-mask.png"] = {},
						["mech-descend.png"] = {},
						["mech-descend-light.png"] = {},
						["mech-descend-mask.png"] = {},
						["mech-idle.png"] = {},
						["mech-idle-mask.png"] = {},
						["mech-idle-air.png"] = {},
						["mech-idle-air-mask.png"] = {},
						["mech-idle-air-light.png"] = {},
						["mech-uplift.png"] = {},
						["mech-uplift-mask.png"] = {},
						["mech-uplift-light.png"] = {}
					},
					["plant"] = {
						["ashland-trees"] = {},
						["boompuff"] = {},
						["cuttlepop"] = {},
						["funneltrunk"] = {},
						["hairyclubnub"] = {},
						["jellystem"] = {},
						["lickmaw"] = {},
						["slipstack"] = {},
						["stingfrond"] = {},
						["sunnycomb"] = {},
						["teflilly"] = {},
						["water-cane"] = {},
						["yumako-tree"] = {}
					},
					["scrap"] = {},
					["space-platform-build-anim"] = {},
					["stromatolite"] = {
						["copper"] = {},
						["iron"] = {}
					},
					["sulfuric-acid-geyser"] = {},
					["tungsten-ore"] = {},
				},
				terrain = {
					["foundation"] = {
						["foundation*"] = {}
					},
					["space-platform"] = {
						["*"] = {},
						["tile-animations"] = {}
					}
				}
			}
		}
	}
}
