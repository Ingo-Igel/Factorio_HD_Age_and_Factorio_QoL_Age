local space_age = false
if mods["space-age"] then
	space_age = true
end

local lignumis = false
if mods["lignumis"] then
	lignumis = true
end

local castra = false
if mods["castra"] then
	castra = true
end

local planetaris_unbounded = false
if mods["planetaris-unbounded"] then
	planetaris_unbounded = true
end

-- item-subgroup - storage
data.raw["item-subgroup"]["storage"].order="a"

-- item-subgroup - belt
data.raw["item-subgroup"]["belt"].order="ba"

if castra then
	data.raw.item["military-transport-belt"].order = "a[transport-belt]-c[express-transport-belt]-a"
end

-- item-subgroup - underground-belt
if space_age then
	data:extend({{
		type = "item-subgroup",
		name = "underground-belt",
		group = "logistics",
		order = "bb"
	}})

	if lignumis then
		data.raw.item["wood-underground-belt"].subgroup = "underground-belt"
	end

		data.raw.item["underground-belt"].subgroup = "underground-belt"
		data.raw.item["fast-underground-belt"].subgroup = "underground-belt"
		data.raw.item["express-underground-belt"].subgroup = "underground-belt"
		data.raw.item["turbo-underground-belt"].subgroup = "underground-belt"

	if castra then
		data.raw.item["military-underground-belt"].subgroup = "underground-belt"
		data.raw.item["military-underground-belt"].order = "b[underground-belt]-c[express-underground-belt]-a"
	end

	if planetaris_unbounded then
		data.raw.item["planetaris-hyper-underground-belt"].subgroup = "underground-belt"
	end
end


-- item-subgroup - splitter
if space_age then
	data:extend({{
		type = "item-subgroup",
		name = "splitter",
		group = "logistics",
		order = "bc"
	}})

	if lignumis then
		data.raw.item["wood-splitter"].subgroup = "splitter"
	end
		data.raw.item["splitter"].subgroup = "splitter"
		data.raw.item["fast-splitter"].subgroup = "splitter"
		data.raw.item["express-splitter"].subgroup = "splitter"
		data.raw.item["turbo-splitter"].subgroup = "splitter"

	if castra then
		data.raw.item["military-splitter"].subgroup = "splitter"
		data.raw.item["military-splitter"].order = "c[splitter]-c[express-splitter]-a"
	end

	if planetaris_unbounded then
		data.raw.item["planetaris-hyper-splitter"].subgroup = "splitter"
	end
end

-- item-subgroup - lane-splitters
if mods["lane-splitters"] then
	data:extend({{
		type = "item-subgroup",
		name = "lane-splitters",
		group = "logistics",
		order = "bd"
	}})

	if lignumis then
		data.raw.item["wood-lane-splitter"].subgroup = "lane-splitters"
	end

		data.raw.item["lane-splitter"].subgroup = "lane-splitters"
		data.raw.item["fast-lane-splitter"].subgroup = "lane-splitters"
		data.raw.item["express-lane-splitter"].subgroup = "lane-splitters"

	if mods["space-age"] then
		data.raw.item["turbo-lane-splitter"].subgroup = "lane-splitters"
	end
end

-- item-subgroup - inserter
data.raw["item-subgroup"]["inserter"].order="c"

-- item-subgroup - logistic-network
data.raw["item-subgroup"]["logistic-network"].order="d"
	data.raw.item["storage-chest"].order = "aa"
	data.raw.item["passive-provider-chest"].order = "ab"
	data.raw.item["requester-chest"].order = "ac"
	data.raw.item["buffer-chest"].order = "ad"
	data.raw.item["active-provider-chest"].order = "ae"
	data.raw.item["roboport"].order = "b"
	data.raw.item["logistic-robot"].order = "ca"
	data.raw.item["construction-robot"].order = "cb"

-- item-subgroup - fluid-distribution
data:extend({{
	type = "item-subgroup",
	name = "fluid-distribution",
	group = "logistics",
	order = "ea"
}})

	data.raw.item["pipe"].subgroup = "fluid-distribution"
	data.raw.item["pipe"].order = "aa"

if mods["HotPipes"] then
	data.raw.item["insulated-pipe"].subgroup = "fluid-distribution"
	data.raw.item["insulated-pipe"].order = "ac"
end

	data.raw.item["pipe-to-ground"].subgroup = "fluid-distribution"
	data.raw.item["pipe-to-ground"].order = "ba"
	data.raw.item["storage-tank"].subgroup = "fluid-distribution"
	data.raw.item["storage-tank"].order = "ca"
	data.raw.item["pump"].subgroup = "fluid-distribution"
	data.raw.item["pump"].order = "da"

if mods["zithorian-extra-storage-tanks-port"] then
	data.raw.item["fluid-tank-1x1"].subgroup = "fluid-distribution"
	data.raw.item["fluid-tank-1x1"].order = "db"
	data.raw.item["fluid-tank-2x2"].subgroup = "fluid-distribution"
	data.raw.item["fluid-tank-2x2"].order = "dc"
	data.raw.item["fluid-tank-3x4"].subgroup = "fluid-distribution"
	data.raw.item["fluid-tank-3x4"].order = "de"
	data.raw.item["fluid-tank-5x5"].subgroup = "fluid-distribution"
	data.raw.item["fluid-tank-5x5"].order = "df"
end

if mods["est-tiny-storage-tank"] then
	data.raw.item["tiny-inline-storage-tank"].subgroup = "fluid-distribution"
	data.raw.item["tiny-inline-storage-tank"].order = "dg"
	data.raw.item["tiny-4way-storage-tank"].subgroup = "fluid-distribution"
	data.raw.item["tiny-4way-storage-tank"].order = "dh"
end

if mods["est-steel-storage-tank"] then
	data.raw.item["steel-storage-tank"].subgroup = "fluid-distribution"
	data.raw.item["steel-storage-tank"].order = "di"
end

if mods["underground-storage-tank"] then
	data.raw.item["underground-storage-tank"].subgroup = "fluid-distribution"
	data.raw.item["underground-storage-tank"].order = "dj"
end

if space_age then
	data.raw.recipe["casting-pipe"].subgroup = "fluid-distribution"
	data.raw.recipe["casting-pipe"].order = "e"
	data.raw.recipe["casting-pipe-to-ground"].subgroup = "fluid-distribution"
	data.raw.recipe["casting-pipe-to-ground"].order = "f"
end

if mods["lignumis"] then
	data:extend({{
		type = "item-subgroup",
		name = "gold-fluid-distribution",
		group = "logistics",
		order = "eb"
	}})

	data.raw.item["gold-pipe"].subgroup = "gold-fluid-distribution"
	data.raw.item["gold-pipe-to-ground"].subgroup = "gold-fluid-distribution"
	data.raw.item["gold-storage-tank"].subgroup = "gold-fluid-distribution"
end

-- item-subgroup - energy-pipe-distribution
data.raw["item-subgroup"]["energy-pipe-distribution"].order="ec"

if mods["k2-steel-pipes"] then
	data.raw.item["kr-steel-pipe"].order = "a"
	data.raw.item["kr-steel-pipe-to-ground"].order = "b"
	data.raw.item["kr-steel-pump"].order = "c"
	data.raw.recipe["kr-casting-steel-pipe"].order = "d"
	data.raw.recipe["kr-casting-steel-pipe-to-ground"].order = "e"
end

-- item-subgroup - energy-distribution
data:extend({{
	type = "item-subgroup",
	name = "energy-distribution",
	group = "logistics",
	order = "ed"
}})

	data.raw.item["small-electric-pole"].subgroup = "energy-distribution"
	data.raw.item["small-electric-pole"].order = "a"
	data.raw.item["medium-electric-pole"].subgroup = "energy-distribution"
	data.raw.item["medium-electric-pole"].order = "b"
	data.raw.item["big-electric-pole"].subgroup = "energy-distribution"
	data.raw.item["big-electric-pole"].order = "c"
	data.raw.item["substation"].subgroup = "energy-distribution"
	data.raw.item["substation"].order = "d"

if mods["snouz_better_substation"] then
	data.raw.item["snouz_better_substation"].subgroup = "energy-distribution"
	data.raw.item["snouz_better_substation"].order = "dd"
end

-- item-subgroup - circuit-network
data.raw["item-subgroup"]["circuit-network"].order="f"

	data.raw.item["radar"].subgroup = "circuit-network"
	data.raw.recipe["radar"].subgroup = "circuit-network"
	data.raw.item["small-lamp"].order = "A"
	data.raw.recipe["small-lamp"].order = "A"

-- item-subgroup - train-transport
data.raw["item-subgroup"]["train-transport"].order="g"

-- item-subgroup - transport
data.raw["item-subgroup"]["transport"].order="h"

-- item-subgroup - terrain
data.raw["item-subgroup"]["terrain"].order="ib"

-- item-subgroup - terrain
if space_age then
	data:extend({{
		type = "item-subgroup",
		name = "paving",
		group = "logistics",
		order = "ia"
	}})

		data.raw.item["stone-brick"].subgroup = "paving"
		data.raw.item["concrete"].subgroup = "paving"
		data.raw.item["hazard-concrete"].subgroup = "paving"
		data.raw.item["refined-concrete"].subgroup = "paving"
		data.raw.item["refined-hazard-concrete"].subgroup = "paving"
end

-- item-subgroup - terraforming
if space_age then
	data:extend({{
		type = "item-subgroup",
		name = "terraforming",
		group = "logistics",
		order = "ic"
	}})

		data.raw.recipe["cliff-explosives"].subgroup = "terraforming"
		data.raw.recipe["cliff-explosives"].order = "a"
		data.raw.capsule["cliff-explosives"].subgroup = "terraforming"
		data.raw.capsule["cliff-explosives"].order = "a"
		
	if mods["Explosive Excavation"]then
		data.raw.item["blasting-charge"].subgroup = "terraforming"
		data.raw.item["blasting-charge"].order = "b"
	end
end


if mods["wide-steel-chests"] then
	if mods["corrundum"] then
		data.raw.item["ice-box"].subgroup = "wide-aai-wood-containers"
		data.raw.item["ice-box"].order = "ae"
	end
	if planetaris_unbounded then
		data.raw.item["planetaris-big-chest"].subgroup = "wide-aai-wood-containers"
		data.raw.item["planetaris-big-chest"].order = "af"
	end
end