local space_age = false
if mods["space-age"] then
	space_age = true
end

-- item-subgroup - thermal-energy
data:extend({{
	type = "item-subgroup",
	name = "thermal-energy",
	group = "production",
	order = "ba"
}})

	data.raw.item["boiler"].subgroup = "thermal-energy"
	data.raw.item["boiler"].order = "a"
	data.raw.item["steam-engine"].subgroup = "thermal-energy"
	data.raw.item["steam-engine"].order = "b"

if space_age then
	data.raw.item["heating-tower"].subgroup = "thermal-energy"
	data.raw.item["heating-tower"].order = "c"
end

	data.raw.item["nuclear-reactor"].subgroup = "thermal-energy"
	data.raw.item["nuclear-reactor"].order = "d"
	data.raw.item["heat-pipe"].subgroup = "thermal-energy"
	data.raw.item["heat-pipe"].order = "e"
	data.raw.item["heat-exchanger"].subgroup = "thermal-energy"
	data.raw.item["heat-exchanger"].order = "f"
	data.raw.item["steam-turbine"].subgroup = "thermal-energy"
	data.raw.item["steam-turbine"].order = "g"

-- item-subgroup - energy-collectors
data:extend({{
	type = "item-subgroup",
	name = "energy-collectors",
	group = "production",
	order = "bb"
}})

	data.raw.item["accumulator"].subgroup = "energy-collectors"
	data.raw.item["accumulator"].order = "a"
	data.raw.item["solar-panel"].subgroup = "energy-collectors"
	data.raw.item["solar-panel"].order = "b"

if space_age then
	data.raw.item["lightning-rod"].subgroup = "energy-collectors"
	data.raw.item["lightning-rod"].order = "c"
	data.raw.item["lightning-collector"].subgroup = "energy-collectors"
	data.raw.item["lightning-collector"].order = "d"
end

-- item-subgroup - energy-collectors
data.raw["item-subgroup"]["energy"].order="bd"

-- item-subgroup - extraction-machine
if space_age then
	data.raw.item["agricultural-tower"].subgroup = "extraction-machine"
	data.raw.item["agricultural-tower"].order = "f"
end

-- item-subgroup - processing-machine
data:extend({{
	type = "item-subgroup",
	name = "processing-machine",
	group = "production",
	order = "ea"
}})

	data.raw.item["oil-refinery"].subgroup = "processing-machine"
	data.raw.item["oil-refinery"].order = "a"
	data.raw.item["chemical-plant"].subgroup = "processing-machine"
	data.raw.item["chemical-plant"].order = "b"
	data.raw.item["centrifuge"].subgroup = "processing-machine"
	data.raw.item["centrifuge"].order = "c"

if mods["quality"] then
	data.raw.item["recycler"].subgroup = "processing-machine"
	data.raw.item["recycler"].order = "d"
end

-- item-subgroup - production-machine
if space_age then
	data.raw["item-subgroup"]["production-machine"].order="eb"
		data.raw.item["electromagnetic-plant"].order = "d"
		data.raw.item["biochamber"].subgroup = "production-machine"
		data.raw.item["biochamber"].order = "e"
		data.raw.item["cryogenic-plant"].order = "f"
		data.raw.item["captive-biter-spawner"].subgroup = "production-machine"
		data.raw.item["captive-biter-spawner"].order = "g"
end

-- item-subgroup - lab
data:extend({
	{
		type = "item-subgroup",
		name = "lab",
		group = "production",
		order = "ed"
	}
})

	data.raw.item["lab"].subgroup = "lab"

if space_age then
	data.raw.item["biolab"].subgroup = "lab"
end