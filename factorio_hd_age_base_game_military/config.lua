local exclude = {
	"*shadow*",
	"*reflection*",
	"*visualization*",
	"smoke.png",
	"*laser-ground-light*"
}

local function add_disable_words(setting_name)
    local setting = settings.startup[setting_name]
    if not setting then
        return
    end

    local value = setting.value
    if value == "" then
        return
    end

    for word in string.gmatch(value, "[^,%s]+") do
        table.insert(exclude, "*" .. word .. "*")
    end
end

add_disable_words("f_hd_a_bg_m_disable_string")
add_disable_words("f_hd_a_disable_string")

return {
	scalefactor = 2,
	resource_pack_name = "factorio_hd_age_base_game_military",
	exclude_names = exclude,
	white_list = "__base__/graphics/entity/",
	data = {
		base = {
			graphics = {
				entity = {
					["artillery-turret"] = { ["*"] = {}, ["remnants"] = {} },
					["artillery-wagon"] = { ["remnants"] = {} },
					["beam"] = {},
					["bigass-explosion"] = {},
					["cluster-grenade"] = {},
					["combat-robot-capsule"] = {},
					["defender-robot"] = { ["*"] = {}, ["remnants"] = {} },
					["destroyer-robot"] = { ["*"] = {}, ["remnants"] = {} },
					["distractor-robot"] = { ["*"] = {}, ["remnants"] = {} },
					["explosion"] = {},
					["fire-flame"] = {},
					["flamethrower-fire-stream"] = {},
					["flamethrower-turret"] = { ["*"] = {}, ["remnants"] = { ["*"] = {}, ["mask"] = {} } },
					["gate"] = { ["*"] = {}, ["remnants"] = {} },
					["grenade"] = {},
					["gun-turret"] = { ["*"] = {}, ["remnants"] = { ["*"] = {}, ["mask"] = {} } },
					["land-mine"] = { ["*"] = {}, ["remnants"] = {} },
					["laser-turret"] = { ["*"] = {}, ["remnants"] = { ["*"] = {}, ["mask"] = {} } },
					["poison-capsule"] = {},
					["radar"] = { ["*"] = {}, ["remnants"] = {} },
					["slowdown-capsule"] = {},
					["slowdown-sticker"] = {},
					["small-explosion"] = {},
					["smoke"] = {},
					["wall"] = { ["*"] = {}, ["remnants"] = {} }
				}
			}
		}
	}
}
