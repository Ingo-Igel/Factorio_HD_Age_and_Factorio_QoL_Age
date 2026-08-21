data.raw.item["landing-pad-unloading-bay"].subgroup = "space-interactors"

data:extend(
	{
		{
			type = "item-subgroup",
			name = "cargo-bay",
			group = "space",
			order = "b"
		}
	}
)

data.raw.item["cargo-bay"].subgroup = "cargo-bay"

data.raw["item-subgroup"]["space-rocket"].order = "c"

data.raw["item-subgroup"]["space-platform"].order = "d"