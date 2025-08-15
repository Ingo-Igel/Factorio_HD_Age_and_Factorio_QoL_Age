local exclude = {	"*shadow*",
					"*reflection*",
					"*visualisation*",
					"*03-rocket*",
					"red-light.png",
					"nuke-shockwave-*",
					"*jet*",
					"*oil-smoke*",
					"*rocket-smoke*",
					"*08-rocket-silo-arms-right*",
					"*footprints*",
					"*-mask*",
					"*effect_map*"
				}

local str= tostring(settings.startup["f_hd_a_bg_b_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_base_game_base",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		base = {
			graphics = {
				entity = {
					["character"]={},
					["coal"]={},
					["compilatron"]={},
					["copper-ore"]={},
					["crash-site-chests"]={},
					["crash-site-spaceship"]={},
					["crude-oil"]={},
					["iron-ore"]={},
					["remnants"]={},
					["rocket-silo"]={ ["*"]={}, ["15-remnants"]={} },
					["scorchmark"]={},
					["stone"]={},
					["tree"]={
						["01"]={},
						["02"]={},
						["03"]={},
						["04"]={},
						["05"]={},
						["06"]={},
						["07"]={},
						["08"]={},
						["09"]={},
						["dead-dry-hairy-tree"]={},
						["dead-grey-trunk"]={},
						["dead-tree-desert"]={},
						["dry-hairy-tree"]={},
						["dry-tree"]={}
					},
					["uranium-ore"]={}
				},
				terrain = {
					["concrete"]={},
					["hazard-concrete-left"]={},
					["hazard-concrete-right"]={},
					["stone-path"]={},
					["tutorial-grid"]={}
				}
			}
		},
		core = {
			graphics = {
				["copper-wire.png"]={},
				["green-wire.png"]={},
				["red-wire.png"]={},
				["wire-highlight.png"]={}
			}
		}
	}
}