local suffix = {
	"-harvest",
	"-normal"
}

local variation = {
	"leaves",
	"normal"
}

local function load_plant(name1, name2, variation_count, files, prototype)
	local normal = 1
	if name1 == "stingfrond" then
		normal = 2
		for k = 1, variation_count do
			local partial_path = "__factorio_hd_age_space_age_base__/data/space-age/graphics/entity/plant/" .. name2 .. "/" .. name2 .. suffix[1]
			for i = 1, files do
				data.raw[prototype][name1].variations[k][variation[1]].layers[1].filenames[i] = (i == 1 and partial_path or partial_path .. "-" .. i) .. ".png"
			end
			data.raw[prototype][name1].variations[k][variation[1]].layers[1].scale = data.raw[prototype][name1].variations[k][variation[1]].layers[1].scale * 0.5
			data.raw[prototype][name1].variations[k][variation[1]].layers[1].width = data.raw[prototype][name1].variations[k][variation[1]].layers[1].width * 2
			data.raw[prototype][name1].variations[k][variation[1]].layers[1].height = data.raw[prototype][name1].variations[k][variation[1]].layers[1].height * 2
			data.raw[prototype][name1].variations[k][variation[1]].layers[1].x = data.raw[prototype][name1].variations[k][variation[1]].layers[1].x * 2
			data.raw[prototype][name1].variations[k][variation[1]].layers[1].y = data.raw[prototype][name1].variations[k][variation[1]].layers[1].y * 2
		end
	end

	for k = 1, variation_count do
		for j = normal, 2 do
			local partial_path = "__factorio_hd_age_space_age_base__/data/space-age/graphics/entity/plant/" .. name2 .. "/" .. name2 .. suffix[j]
			for i = 1, files do
				data.raw[prototype][name1].variations[k][variation[j]].filenames[i] = (i == 1 and partial_path or partial_path .. "-" .. i) .. ".png"
			end
			data.raw[prototype][name1].variations[k][variation[j]].scale = data.raw[prototype][name1].variations[k][variation[j]].scale * 0.5
			data.raw[prototype][name1].variations[k][variation[j]].width = data.raw[prototype][name1].variations[k][variation[j]].width * 2
			data.raw[prototype][name1].variations[k][variation[j]].height = data.raw[prototype][name1].variations[k][variation[j]].height * 2
			data.raw[prototype][name1].variations[k][variation[j]].x = data.raw[prototype][name1].variations[k][variation[j]].x * 2
			data.raw[prototype][name1].variations[k][variation[j]].y = data.raw[prototype][name1].variations[k][variation[j]].y * 2
		end
	end
end

load_plant("jellystem", "jellystem", 8, 1, "plant")
load_plant("tree-plant", "planted-tree", 8, 3, "plant")
load_plant("yumako-tree", "yumako-tree", 8, 1, "plant")

load_plant("boompuff", "boompuff", 14, 1, "tree")
load_plant("cuttlepop", "cuttlepop", 5, 1, "tree")
load_plant("funneltrunk", "funneltrunk", 5, 1, "tree")
load_plant("hairyclubnub", "hairyclubnub", 10, 1, "tree")
load_plant("lickmaw", "lickmaw", 5, 1, "tree")
load_plant("slipstack", "slipstack", 8, 1, "tree")
load_plant("stingfrond", "stingfrond", 10, 1, "tree")
load_plant("sunnycomb", "sunnycomb", 10, 1, "tree")
load_plant("teflilly", "teflilly", 10, 1, "tree")
load_plant("water-cane", "water-cane", 16, 1, "tree")
