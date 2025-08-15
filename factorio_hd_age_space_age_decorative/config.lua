local exclude = {	"*shadow*",
					"*lights*",
					"*reflection*",
					"*transition*",
					"*tint*",
					"*mask*",
					"*glow*",
					"*beam*",
					"*gas*",
					"*fluids*",
					"*visualization*",
					"*flame*"
				}

local str= tostring(settings.startup["f_hd_a_sa_d_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_space_age_decorative",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		["space-age"]={
			graphics = {
				decorative = {
					["aquilo-ice"]={
						["aqulio-ice-decal-blue"]={},
						["aqulio-snowy-decal"]={}
					},
					["aquilo-iceberg"]={},
					["barnacles-decal"]={},
					["barney"]={},
					["big-volcanic-rock"]={},
					["black-sceptre"]={},
					["blood-grape"]={},
					["blood-grape-vibrant"]={},
					["bob-fingers"]={},
					["bramble"]={},
					["brown-cup"]={},
					["calcite-stain"]={},
					["coral"]={},
					["coral-stunted"]={},
					["coral-stunted-grey"]={},
					["coral-water"]={},
					["curly-root-grey"]={},
					["fuchsia-pita"]={},
					["fulgoran-gravewort"]={},
					["fulgoran-ruin"]={},
					["fulgora-rock"]={},
					["fulgurite"]={},
					["gleba-cliff-roots"]={},
					["gleba-cliff-roots-orange"]={},
					["gleba-pale-lettuce-lichen-cups"]={},
					["gleba-spawner-slime"]={},
					["gleba-yellow-lettuce-lichen"]={},
					["gleba-yellow-lettuce-lichen-cups"]={},
					["green-cup"]={},
					["green-lettuce-lichen"]={},
					["green-lettuce-lichen-water"]={},
					["grey-cracked-mud-decal"]={},
					["honeycomb-fungus"]={},
					["honeycomb-fungus-1x1"]={},
					["honeycomb-fungus-decayed"]={},
					["huge-volcanic-rock"]={},
					["lithium-iceberg-big"]={},
					["lithium-iceberg-huge"]={},
					["lithium-iceberg-medium"]={},
					["lithium-iceberg-small"]={},
					["lithium-iceberg-tiny"]={},
					["matches-small"]={},
					["medium-volcanic-rock"]={},
					["mycelium"]={},
					["nerve-roots"]={},
					["nerve-roots-veins"]={},
					["orange-root"]={},
					["pale-lettuce-lichen"]={},
					["pale-lettuce-lichen-water"]={},
					["pink-phalanges"]={},
					["polycephalum"]={},
					["red-lichen-decal"]={},
					["small-volcanic-rock"]={},
					["snow-drift-decal"]={},
					["space-platform-decorative"]={},
					["split-gill"]={},
					["split-gill-dying"]={},
					["split-gill-red"]={},
					["sulfuric-acid-puddle"]={},
					["sulfur-stain"]={},
					["tiny-volcanic-rock"]={},
					["tiny-volcanic-rock-cluster"]={},
					["urchin-cactus"]={},
					["veins"]={},
					["veins-small"]={},
					["vulcanus-cracks"]={},
					["vulcanus-cracks-cold"]={},
					["vulcanus-crater"]={},
					["vulcanus-dune-decal"]={},
					["vulcanus-relief-decal"]={},
					["vulcanus-rock-decal"]={},
					["vulcanus-sand-decal"]={},
					["white-carpet-grass"]={},
					["wispy-lichen"]={}
				}
			}
		}
	}
}