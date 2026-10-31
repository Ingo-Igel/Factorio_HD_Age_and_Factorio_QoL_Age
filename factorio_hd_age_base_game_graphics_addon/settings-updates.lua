if mods["tree-healing"] then
	data.raw["int-setting"]["tree-healing-operation-interval"].default_value = 20
	data.raw["int-setting"]["tree-healing-chunk-subdivisions"].default_value = 4
end

if mods["nuclear-scorch-decay"] then
	data.raw["int-setting"]["nuclear-scorch-decay-operation-interval"].default_value = 20
end

if mods["disco-science-lite"] then
	data.raw["int-setting"]["mks-dsl-color-brightness"].default_value = 30
end

if mods["Automatic_Train_Painter"] then
	data.raw["bool-setting"]["paint-cargo-wagon"].default_value = true
	if mods["FluidWagonColorMask"] then
		data.raw["bool-setting"]["paint-fluid-wagon"].default_value = true
	end
end
