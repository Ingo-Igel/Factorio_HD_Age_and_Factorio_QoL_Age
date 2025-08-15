local space_age = false
if mods["space-age"] then
	space_age = true
end

-- item-subgroup - defensive-structure
data.raw["item-subgroup"]["defensive-structure"].order="a"

	data.raw.item["stone-wall"].order = "a"
	data.raw.recipe["stone-wall"].order = "a"
	data.raw.item["gate"].order = "b"
	data.raw.recipe["gate"].order = "b"
	data.raw.item["land-mine"].order = "c"
	data.raw.recipe["land-mine"].order = "c"

-- item-subgroup - turret
data.raw["item-subgroup"]["turret"].order="b"

-- item-subgroup - electric-combat
data:extend({{
	type = "item-subgroup",
	name = "electric-combat",
	group = "combat",
	order = "ca"
}})

	data.raw.item["laser-turret"].subgroup = "electric-combat"
	data.raw.item["laser-turret"].order = "aa"
	data.raw.recipe["laser-turret"].subgroup = "electric-combat"
	data.raw.recipe["laser-turret"].order = "aa"

if space_age then
	data.raw.item["tesla-turret"].subgroup = "electric-combat"
	data.raw.item["tesla-turret"].order = "ab"
	data.raw.recipe["tesla-turret"].subgroup = "electric-combat"
	data.raw.recipe["tesla-turret"].order = "ab"

	data.raw.ammo["tesla-ammo"].subgroup = "electric-combat"
	data.raw.ammo["tesla-ammo"].order = "ba"
	data.raw.recipe["tesla-ammo"].subgroup = "electric-combat"
	data.raw.recipe["tesla-ammo"].order = "ba"

	data.raw.gun["teslagun"].subgroup = "electric-combat"
	data.raw.gun["teslagun"].order = "ca"
	data.raw.recipe["teslagun"].subgroup = "electric-combat"
	data.raw.recipe["teslagun"].order = "ca"
end

-- item-subgroup - bullet-combat
data:extend({{
	type = "item-subgroup",
	name = "bullet-combat",
	group = "combat",
	order = "cb"
}})

	data.raw.item["gun-turret"].subgroup = "bullet-combat"
	data.raw.item["gun-turret"].order = "aa"
	data.raw.recipe["gun-turret"].subgroup = "bullet-combat"
	data.raw.recipe["gun-turret"].order = "aa"

	data.raw.ammo["firearm-magazine"].subgroup = "bullet-combat"
	data.raw.ammo["firearm-magazine"].order = "ba"
	data.raw.recipe["firearm-magazine"].subgroup = "bullet-combat"
	data.raw.recipe["firearm-magazine"].order = "ba"
	data.raw.ammo["piercing-rounds-magazine"].subgroup = "bullet-combat"
	data.raw.ammo["piercing-rounds-magazine"].order = "bb"
	data.raw.recipe["piercing-rounds-magazine"].subgroup = "bullet-combat"
	data.raw.recipe["piercing-rounds-magazine"].order = "bb"
	data.raw.ammo["uranium-rounds-magazine"].subgroup = "bullet-combat"
	data.raw.ammo["uranium-rounds-magazine"].order = "bc"
	data.raw.recipe["uranium-rounds-magazine"].subgroup = "bullet-combat"
	data.raw.recipe["uranium-rounds-magazine"].order = "bc"

	data.raw.gun["pistol"].subgroup = "bullet-combat"
	data.raw.gun["pistol"].order = "ca"
	data.raw.gun["submachine-gun"].subgroup = "bullet-combat"
	data.raw.gun["submachine-gun"].order = "cb"
	data.raw.recipe["submachine-gun"].subgroup = "bullet-combat"
	data.raw.recipe["submachine-gun"].order = "cb"

-- item-subgroup - shotgun-combat
data:extend({{
	type = "item-subgroup",
	name = "shotgun-combat",
	group = "combat",
	order = "cc"
}})

	data.raw.ammo["shotgun-shell"].subgroup = "shotgun-combat"
	data.raw.ammo["shotgun-shell"].order = "ba"
	data.raw.recipe["shotgun-shell"].subgroup = "shotgun-combat"
	data.raw.recipe["shotgun-shell"].order = "ba"
	data.raw.ammo["piercing-shotgun-shell"].subgroup = "shotgun-combat"
	data.raw.ammo["piercing-shotgun-shell"].order = "bb"
	data.raw.recipe["piercing-shotgun-shell"].subgroup = "shotgun-combat"
	data.raw.recipe["piercing-shotgun-shell"].order = "bb"

	data.raw.gun["shotgun"].subgroup = "shotgun-combat"
	data.raw.gun["shotgun"].order = "ca"
	data.raw.recipe["shotgun"].subgroup = "shotgun-combat"
	data.raw.recipe["shotgun"].order = "ca"
	data.raw.gun["combat-shotgun"].subgroup = "shotgun-combat"
	data.raw.gun["combat-shotgun"].order = "cb"
	data.raw.recipe["combat-shotgun"].subgroup = "shotgun-combat"
	data.raw.recipe["combat-shotgun"].order = "cb"

-- item-subgroup - cannon-combat
data:extend({{
	type = "item-subgroup",
	name = "cannon-combat",
	group = "combat",
	order = "cd"
}})

	data.raw.ammo["cannon-shell"].subgroup = "cannon-combat"
	data.raw.ammo["cannon-shell"].order = "ba"
	data.raw.recipe["cannon-shell"].subgroup = "cannon-combat"
	data.raw.recipe["cannon-shell"].order = "ba"
	data.raw.ammo["explosive-cannon-shell"].subgroup = "cannon-combat"
	data.raw.ammo["explosive-cannon-shell"].order = "bb"
	data.raw.recipe["explosive-cannon-shell"].subgroup = "cannon-combat"
	data.raw.recipe["explosive-cannon-shell"].order = "bb"
	data.raw.ammo["uranium-cannon-shell"].subgroup = "cannon-combat"
	data.raw.ammo["uranium-cannon-shell"].order = "bc"
	data.raw.recipe["uranium-cannon-shell"].subgroup = "cannon-combat"
	data.raw.recipe["uranium-cannon-shell"].order = "bc"
	data.raw.ammo["explosive-uranium-cannon-shell"].subgroup = "cannon-combat"
	data.raw.ammo["explosive-uranium-cannon-shell"].order = "bd"
	data.raw.recipe["explosive-uranium-cannon-shell"].subgroup = "cannon-combat"
	data.raw.recipe["explosive-uranium-cannon-shell"].order = "bd"

-- item-subgroup - artillery-combat
data:extend({{
	type = "item-subgroup",
	name = "artillery-combat",
	group = "combat",
	order = "ce"
}})

	data.raw.item["artillery-turret"].subgroup = "artillery-combat"
	data.raw.item["artillery-turret"].order = "aa"
	data.raw.recipe["artillery-turret"].subgroup = "artillery-combat"
	data.raw.recipe["artillery-turret"].order = "aa"

	data.raw.ammo["artillery-shell"].subgroup = "artillery-combat"
	data.raw.ammo["artillery-shell"].order = "ba"
	data.raw.recipe["artillery-shell"].subgroup = "artillery-combat"
	data.raw.recipe["artillery-shell"].order = "ba"

	data.raw.capsule["artillery-targeting-remote"].subgroup = "artillery-combat"
	data.raw.capsule["artillery-targeting-remote"].order = "ca"

-- item-subgroup - rocket-combat
data:extend({{
	type = "item-subgroup",
	name = "rocket-combat",
	group = "combat",
	order = "cf"
}})

if space_age then
	data.raw.item["rocket-turret"].subgroup = "rocket-combat"
	data.raw.item["rocket-turret"].order = "aa"
	data.raw.recipe["rocket-turret"].subgroup = "rocket-combat"
	data.raw.recipe["rocket-turret"].order = "aa"

	data.raw.ammo["capture-robot-rocket"].subgroup = "rocket-combat"
	data.raw.ammo["capture-robot-rocket"].order = "ba"
	data.raw.recipe["capture-robot-rocket"].subgroup = "rocket-combat"
	data.raw.recipe["capture-robot-rocket"].order = "ba"
end

	data.raw.ammo["rocket"].subgroup = "rocket-combat"
	data.raw.ammo["rocket"].order = "bb"
	data.raw.recipe["rocket"].subgroup = "rocket-combat"
	data.raw.recipe["rocket"].order = "bb"
	data.raw.ammo["explosive-rocket"].subgroup = "rocket-combat"
	data.raw.ammo["explosive-rocket"].order = "bc"
	data.raw.recipe["explosive-rocket"].subgroup = "rocket-combat"
	data.raw.recipe["explosive-rocket"].order = "bc"
	data.raw.ammo["atomic-bomb"].subgroup = "rocket-combat"
	data.raw.ammo["atomic-bomb"].order = "bd"
	data.raw.recipe["atomic-bomb"].subgroup = "rocket-combat"
	data.raw.recipe["atomic-bomb"].order = "bd"

	data.raw.gun["rocket-launcher"].subgroup = "rocket-combat"
	data.raw.gun["rocket-launcher"].order = "ca"
	data.raw.recipe["rocket-launcher"].subgroup = "rocket-combat"
	data.raw.recipe["rocket-launcher"].order = "ca"

-- item-subgroup - fire-combat
data:extend({{
	type = "item-subgroup",
	name = "fire-combat",
	group = "combat",
	order = "cg"
}})

	data.raw.item["flamethrower-turret"].subgroup = "fire-combat"
	data.raw.item["flamethrower-turret"].order = "aa"
	data.raw.recipe["flamethrower-turret"].subgroup = "fire-combat"
	data.raw.recipe["flamethrower-turret"].order = "aa"

	data.raw.ammo["flamethrower-ammo"].subgroup = "fire-combat"
	data.raw.ammo["flamethrower-ammo"].order = "ba"
	data.raw.recipe["flamethrower-ammo"].subgroup = "fire-combat"
	data.raw.recipe["flamethrower-ammo"].order = "ba"

	data.raw.gun["flamethrower"].subgroup = "fire-combat"
	data.raw.gun["flamethrower"].order = "ca"
	data.raw.recipe["flamethrower"].subgroup = "fire-combat"
	data.raw.recipe["flamethrower"].order = "ca"


-- item-subgroup - railgun-combat
if space_age then
	data:extend({{
		type = "item-subgroup",
		name = "railgun-combat",
		group = "combat",
		order = "ch"
	}})

		data.raw.item["railgun-turret"].subgroup = "railgun-combat"
		data.raw.item["railgun-turret"].order = "aa"
		data.raw.recipe["railgun-turret"].subgroup = "railgun-combat"
		data.raw.recipe["railgun-turret"].order = "aa"

		data.raw.ammo["railgun-ammo"].subgroup = "railgun-combat"
		data.raw.ammo["railgun-ammo"].order = "ba"
		data.raw.recipe["railgun-ammo"].subgroup = "railgun-combat"
		data.raw.recipe["railgun-ammo"].order = "ba"

		data.raw.gun["railgun"].subgroup = "railgun-combat"
		data.raw.gun["railgun"].order = "ca"
		data.raw.recipe["railgun"].subgroup = "railgun-combat"
		data.raw.recipe["railgun"].order = "ca"
end

-- item-subgroup - gun
data.raw["item-subgroup"]["gun"].order="d"

-- item-subgroup - ammo
data.raw["item-subgroup"]["ammo"].order="e"

-- item-subgroup - capsule
data.raw["item-subgroup"]["capsule"].order="f"

-- item-subgroup - armor
data.raw["item-subgroup"]["armor"].order="g"

-- item-subgroup - equipment
data.raw["item-subgroup"]["equipment"].order="ha"

-- item-subgroup - utility-equipment
data.raw["item-subgroup"]["utility-equipment"].order="hb"

-- item-subgroup - military-equipment
data.raw["item-subgroup"]["military-equipment"].order="hc"