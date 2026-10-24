for name, info in pairs{
	["discharge-defense-remote"] = {type = "capsule", image = "discharge-defense-remote", order = "e[remotes]-a[discharge-defense-remote]", small_size = 30}, -- order was e[spidertron-remote]
	["artillery-targeting-remote"] = {type = "capsule", image = "artillery-targeting-remote", order = "e[remotes]-b[artillery-targeting-remote]"}, -- order was e[spidertron-remote]
	["spidertron-remote"] = {type = "spidertron-remote", image = "new-rts-tool", order = "e[remotes]-c[spidertron-remote]", unpadded_size = 48}} do -- order was e[spidertron-remote]

	function icon(size)
		return "__factorio_hd_age_base_game_graphics_addon__/coloured-tool-icons/" .. info.image .. "-x" .. tostring(size) .. ".png" end

	local shortcut = data.raw["shortcut"]["give-" .. name]
	shortcut.unavailable_until_unlocked = true -- so you don't get copper, red, and gree wires initially
	shortcut.order = info.order

	shortcut.icon_size = mods["smaller-shortcut-icons"] and info.unpadded_size or 56
	shortcut.icon = icon(shortcut.icon_size)

	shortcut.small_icon_size = info.small_size or 24
	shortcut.small_icon = icon(shortcut.small_icon_size)

	local item = data.raw[info.type][name]
	item.order = info.order -- give same ordering in factoriopedia
	item.icon_size = 56 -- Never use the unpadded version
	item.icon = icon(item.icon_size) end