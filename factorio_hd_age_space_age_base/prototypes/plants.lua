local base = "__factorio_hd_age_space_age_base__/data/space-age/graphics/entity/plant/"

local plant_variations = {
	{ name = "leaves", suffix = "-harvest", layered = true },
	{ name = "normal", suffix = "-normal" }
}

local plants = {
	{ name = "jellystem",    graphics_name = "jellystem",    variation_count = 8,  file_count = 1, prototype = "plant" },
	{ name = "tree-plant",   graphics_name = "planted-tree", variation_count = 8,  file_count = 3, prototype = "plant" },
	{ name = "yumako-tree",  graphics_name = "yumako-tree",  variation_count = 8,  file_count = 1, prototype = "plant" },
	{ name = "boompuff",     graphics_name = "boompuff",     variation_count = 14, file_count = 1, prototype = "tree" },
	{ name = "cuttlepop",    graphics_name = "cuttlepop",    variation_count = 5,  file_count = 1, prototype = "tree" },
	{ name = "funneltrunk",  graphics_name = "funneltrunk",  variation_count = 5,  file_count = 1, prototype = "tree" },
	{ name = "hairyclubnub", graphics_name = "hairyclubnub", variation_count = 10, file_count = 1, prototype = "tree" },
	{ name = "lickmaw",      graphics_name = "lickmaw",      variation_count = 5,  file_count = 1, prototype = "tree" },
	{ name = "slipstack",    graphics_name = "slipstack",    variation_count = 8,  file_count = 1, prototype = "tree" },
	{ name = "stingfrond",   graphics_name = "stingfrond",   variation_count = 10, file_count = 1, prototype = "tree", layered_leaves = true },
	{ name = "sunnycomb",    graphics_name = "sunnycomb",    variation_count = 10, file_count = 1, prototype = "tree" },
	{ name = "teflilly",     graphics_name = "teflilly",     variation_count = 10, file_count = 1, prototype = "tree" },
	{ name = "water-cane",   graphics_name = "water-cane",   variation_count = 16, file_count = 1, prototype = "tree" }
}

local function update_plant_sprite(sprite, partial_path, file_count)
	for file_index = 1, file_count do
		sprite.filenames[file_index] = (file_index == 1 and partial_path or partial_path .. "-" .. file_index) .. ".png"
	end

	sprite.scale = sprite.scale * 0.5
	sprite.width = sprite.width * 2
	sprite.height = sprite.height * 2
	sprite.x = sprite.x * 2
	sprite.y = sprite.y * 2
end

local function load_plant(plant_data)
	local plant = data.raw[plant_data.prototype][plant_data.name]
	local graphics_path = base .. plant_data.graphics_name .. "/"

	for variation_index = 1, plant_data.variation_count do
		local plant_variation = plant.variations[variation_index]

		for _, variation_data in ipairs(plant_variations) do
			local sprite = plant_variation[variation_data.name]
			if plant_data.layered_leaves and variation_data.layered then
				sprite = sprite.layers[1]
			end

			local partial_path = graphics_path .. plant_data.graphics_name .. variation_data.suffix
			update_plant_sprite(sprite, partial_path, plant_data.file_count)
		end
	end
end

for _, plant_data in ipairs(plants) do
	load_plant(plant_data)
end
