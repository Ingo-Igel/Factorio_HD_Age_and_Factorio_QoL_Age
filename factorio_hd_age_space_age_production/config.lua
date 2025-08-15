local exclude = {	"*shadow*",
					"*reflection*",
					"*visualization*",
					"*particles*",
					"*dust*"
}

local str= tostring(settings.startup["f_hd_a_sa_p_disable_string"].value)
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
	resource_pack_name = "factorio_hd_age_space_age_production",
	data = {
		__settings__ = {
			exclude_names = exclude,
			upscale = 2
		},
		["space-age"]={
			graphics = {
				entity = {
					["agricultural-tower"]={
						["agricultural-tower-base.png"]={},
						["agricultural-tower-base-light.png"]={},
						["agricultural-tower-base-plant-mask.png"]={},
						["agricultural-tower-crane-3.png"]={},
						["agricultural-tower-crane-4.png"]={},
						["agricultural-tower-crane-6.png"]={},
						["agricultural-tower-crane-8.png"]={},
						["agricultural-tower-crane-9.png"]={},
						["agricultural-tower-crane-10.png"]={},
						["agricultural-tower-remnants.png"]={}
					},
					["asteroid-collector"]={},
					["big-mining-drill"]={ ["*"]={},
						["East"]={},
						["North"]={},
						["remnants"]={},
						["South"]={},
						["West"]={}
					},
					["biochamber"]={},
					["biolab"]={},
					["captive-spawner"]={},
					["capture-robot-rocket"]={},
					["crusher"]={ ["*"]={},["remnants"]={} },
					["cryogenic-plant"]={ ["*"]={},["remnants"]={} },
					["electromagnetic-plant"]={
					 	["electromagnetic-plant-base.png"]={},
						["electromagnetic-plant-lights-cool-down.png"]={},
						["electromagnetic-plant-lights-rotate-continue.png"]={},
						["electromagnetic-plant-lights-warm-up.png"]={},
						["electromagnetic-plant-frozen.png"]={},
						["electromagnetic-plant-main-cool-down.png"]={},
						["electromagnetic-plant-main-rotate-continue.png"]={},
						["electromagnetic-plant-main-warm-up.png"]={},
					 	["pipe-connections"]={},
					 	["remnants"]={}
					},
					["foundry"]={
						["foundry-frozen.png"]={},
						["foundry-pipe-connections-east.png"]={},
						["foundry-pipe-connections-east-frozen.png"]={},
						["foundry-pipe-connections-north.png"]={},
						["foundry-pipe-connections-north-frozen.png"]={},
						["foundry-pipe-connections-south.png"]={},
						["foundry-pipe-connections-south-frozen.png"]={},
						["foundry-pipe-connections-west.png"]={},
						["foundry-pipe-connections-west-frozen.png"]={},
						["foundry-remnants.png"]={},
						["foundry-status-lamp.png"]={}
					},
					["fusion-generator"]={ ["*"]={},
						["east"]={},
						["north"]={},
						["south"]={},
						["west"]={}
					},
					["fusion-reactor"]={},
					["heating-tower"]={},
					["lightning-collector"]={},
					["lightning-rod"]={}
				}
			}
		}
	}
}