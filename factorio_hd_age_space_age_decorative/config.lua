local exclude = { "*shadow*" }

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

add_disable_words("f_hd_a_sa_d_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_space_age_decorative",
	exclude_names = exclude,
	white_list = "__space-age__/graphics/decorative/",
	data = {
		["space-age"] = {
			graphics = {
				decorative = {
					["aquilo-ice"] = {
						["aqulio-ice-decal-blue"] = {},
						["aqulio-snowy-decal"] = {}
					},
					["aquilo-iceberg"] = {},
					["barnacles-decal"] = {},
					["barney"] = {},
					["black-sceptre"] = {},
					["blood-grape"] = {},
					["blood-grape-vibrant"] = {},
					["bob-fingers"] = {},
					["bramble"] = {},
					["brown-cup"] = {},
					["calcite-stain"] = {},
					["coral"] = {},
					["coral-stunted"] = {},
					["coral-stunted-grey"] = {},
					["coral-water"] = {},
					["curly-root-grey"] = {},
					["demolisher-corpse"] = {},
					["fuchsia-pita"] = {},
					["fulgoran-gravewort"] = {},
					["fulgoran-ruin"] = {},
					["fulgora-rock"] = {},
					["fulgora-ruin-flooded"] = {
						["*"] = {},
						["big"] = {},
						["medium"] = {},
						["small"] = {}
					},
					["fulgurite"] = {},
					["gleba-cliff-roots"] = {},
					["gleba-cliff-roots-orange"] = {},
					["gleba-pale-lettuce-lichen-cups"] = {},
					["gleba-spawner-slime"] = {},
					["gleba-yellow-lettuce-lichen"] = {},
					["gleba-yellow-lettuce-lichen-cups"] = {},
					["green-cup"] = {},
					["green-lettuce-lichen"] = {},
					["green-lettuce-lichen-water"] = {},
					["grey-cracked-mud-decal"] = {},
					["honeycomb-fungus"] = {},
					["honeycomb-fungus-1x1"] = {},
					["honeycomb-fungus-decayed"] = {},
					["lithium-iceberg-big"] = {},
					["lithium-iceberg-huge"] = {},
					["lithium-iceberg-medium"] = {},
					["lithium-iceberg-small"] = {},
					["lithium-iceberg-tiny"] = {},
					["matches-small"] = {},
					["mycelium"] = {},
					["nerve-roots"] = {},
					["nerve-roots-veins"] = {},
					["orange-root"] = {},
					["pale-lettuce-lichen"] = {},
					["pale-lettuce-lichen-water"] = {},
					["pink-phalanges"] = {},
					["polycephalum"] = {},
					["red-lichen-decal"] = {},
					["small-volcanic-rock"] = {},
					["snow-drift-decal"] = {},
					["space-platform-decorative"] = {},
					["split-gill"] = {},
					["split-gill-dying"] = {},
					["split-gill-red"] = {},
					["sulfuric-acid-puddle"] = {},
					["sulfur-stain"] = {},
					["tiny-volcanic-rock"] = {},
					["tiny-volcanic-rock-cluster"] = {},
					["urchin-cactus"] = {},
					["veins"] = {},
					["veins-small"] = {},
					["vulcanus-cracks"] = {},
					["vulcanus-cracks-cold"] = {},
					["vulcanus-crater"] = {},
					["vulcanus-dune-decal"] = {},
					["vulcanus-relief-decal"] = {},
					["vulcanus-rocks"] = {},
					["vulcanus-rock-decal"] = {},
					["vulcanus-sand-decal"] = {},
					["white-carpet-grass"] = {},
					["wispy-lichen"] = {}
				}
			}
		}
	}
}
