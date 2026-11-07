local base = "__factorio_hd_age_space_age_decorative__/data/space-age/graphics/decorative/vulcanus-chimney/"

local chimneys = {
	{
		entity = "vulcanus-chimney",
		upper = "sulfuric-chimney-upper",
		lower = "sulfuric-chimney-lower",
		variation_count = 3,
		shift = { 5, 0 },
	},
	{
		entity = "vulcanus-chimney-faded",
		upper = "sulfuric-chimney-faded-upper",
		lower = "sulfuric-chimney-faded-lower",
		variation_count = 5,
		shift = { 5, 0 },
	},
	{
		entity = "vulcanus-chimney-cold",
		upper = "cold-chimney-upper",
		lower = "cold-chimney-lower",
		variation_count = 3,
		shift = { 5, 0 },
	},
	{
		entity = "vulcanus-chimney-short",
		upper = "sulfuric-chimney-short-upper",
		lower = "sulfuric-chimney-short-lower",
		variation_count = 7,
	},
	{
		entity = "vulcanus-chimney-truncated",
		upper = "sulfuric-chimney-truncated-upper",
		lower = "sulfuric-chimney-truncated-lower",
		variation_count = 6,
	},
}

local function load_chimney_sprite(name, variation_count, shift)
	local options = {
		scale = 0.25,
		variation_count = variation_count,
		multiply_shift = 0.5,
	}

	if shift then
		options.shift = shift
	end

	return util.sprite_load(base .. name, options)
end

for _, chimney in ipairs(chimneys) do
	local entity = data.raw["simple-entity"][chimney.entity]
	entity.pictures.layers[1] = load_chimney_sprite(chimney.upper, chimney.variation_count, chimney.shift)
	entity.lower_pictures = load_chimney_sprite(chimney.lower, chimney.variation_count, chimney.shift)
end
