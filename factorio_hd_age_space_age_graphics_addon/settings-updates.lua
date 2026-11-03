if mods["Better_Starmap_Background"] then
	data.raw["bool-setting"]["universe-widget-enabled"].default_value = false
	data.raw["bool-setting"]["asteroid-belt-1-enabled"].default_value = true
	data.raw["bool-setting"]["asteroid-belt-2-enabled"].default_value = true
end

if mods["dynamic_platform_lighting"] then
	data.raw["int-setting"]["dynamic_platform_solar_limit"].default_value = 180
	data.raw["int-setting"]["dynamic_platform_solar_min"].default_value = 0
end
