-- MIT License

-- Copyright (c) 2020 Zangeti

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local config = require("config-fast")
local sf = config.scalefactor
local rpn = config.resource_pack_name
local en = config.exclude_names
local dt = config.data

-- split string into list via seperator
local split = function(str, sep)
	local pattern = "(.-)" .. sep
	local list, i = {}, 1
	for match in (str .. sep):gmatch(pattern) do
		list[i] = match
		i = i + 1
	end
	return list
end

local firstIndex = function(in_table)
	return next(in_table)
end

-- separates the items in search by wild cards (*). Ensures these separated terms can be found in the specified order in the final item string, and that if there are no wild cards at the beginning/end of the serach string, the beginning / end of the search string are also the beginning / end of the item string
local isValidTerm = function(search, item)
	-- quick path: no wildcard at all
	if not search:find("%*") then
		return search == item
	end

	local str_find           = string.find
	local str_sub            = string.sub

	local startsWithWildcard = str_sub(search, 1, 1) == "*"
	local endsWithWildcard   = str_sub(search, -1) == "*"
	local lastIndex          = 1
	local itemLen            = #item
	local last_e

	-- iterate over non-empty segments between '*' without allocating a split table
	for term in search:gmatch("[^*]+") do
		-- skip accidental empty segments (shouldn't occur with the pattern, but safe)
		if term ~= "" then
			local s, e = str_find(item, term, lastIndex, true)
			if not s then
				return false
			end

			-- if this is the first matched term and the pattern does not start with '*',
			-- the match must begin at the start of the item
			if lastIndex == 1 and not startsWithWildcard and s ~= 1 then
				return false
			end

			lastIndex = e + 1
			last_e = e
		end
	end

	-- if the pattern does not end with '*', the last matched term must reach the end
	if not endsWithWildcard and last_e ~= itemLen then
		return false
	end

	return true
end


-- See if a path from data.raw is among those declared in the config.lua data = {} table as one to be retextured & hence if the path needs to be changed to the retextured version
local isReplace_cache = {}

local function hasNonSettingsChildren(t)
	return next(t) ~= nil
end

local function isReplaceItem(path, step)
	step = step or 1

	local cached = isReplace_cache[path .. ":" .. tostring(step)]
	if cached ~= nil then return cached end

	local split_path = split(path:gsub("__", ""), "/")
	local cfg = dt
	local i = step
	local n = #split_path
	local match = isValidTerm

	while true do
		if i > n then
			local res = not hasNonSettingsChildren(cfg)
			isReplace_cache[path .. ":" .. tostring(step)] = res
			return res
		end

		local part = split_path[i]
		local found = false

		for k, v in pairs(cfg) do
			if match(k, part) then
				cfg = v
				found = true
				i = i + 1
				break
			end
		end

		if not found then
			local res = not hasNonSettingsChildren(cfg)
			isReplace_cache[path .. ":" .. tostring(step)] = res
			return res
		end
	end
end

-- adjust metadata of importing image/sound at path in data.raw as set by the settings accumulated in lookForTreeSettings
local adjustDataDotRaw = function(path, filename_key, new_path)
	local data_raw = data.raw
	local cfg_root = data_raw
	local generic_root = data_raw
	local path_len = #path
	if path_len == 0 then return end

	-- traverse path once, cache pathed_data and generic_data as in original logic
	for i = 1, path_len do
		cfg_root = cfg_root[path[i]]
		if i < path_len - 1 then
			generic_root = generic_root[path[i]]
		end
	end

	local pathed_data = cfg_root
	local generic_data = generic_root

	if not pathed_data then return end

	local floor = math.floor
	local max = math.max

	local function scaled_floor(v) return max(floor(v * sf), 1) end

	-- do not overwrite image path if image name contains an element of exclude_names declared in settings
	if type(en) == "table" then
		local filename = pathed_data[filename_key]
		if type(filename) == "string" then
			local split_path = split(filename, "/")
			local last_name = split_path[#split_path]
			local match = isValidTerm
			for _, name in pairs(en) do
				if match(name, last_name) then
					return
				end
			end
		end
	end

	-- Secondary Checks: Ensure no values are manipulated twice
	if type(pathed_data["stripes"]) == "table" then
		return
	end

	-- General Value Manipulation: Change image scaling etc.
	local pd = pathed_data
	pd["scale"] = (pd["scale"] or 1) / sf
	if type(pd["width"]) == "number" then pd["width"] = scaled_floor(pd["width"]) end
	if type(pd["height"]) == "number" then pd["height"] = scaled_floor(pd["height"]) end
	if type(pd["x"]) == "number" then pd["x"] = floor(pd["x"] * sf) end
	if type(pd["y"]) == "number" then pd["y"] = floor(pd["y"] * sf) end

	-- used when x and y property are 0
	local pos = pd["position"]
	if type(pos) == "table" and type(pos[1]) == "number" and type(pos[2]) == "number" then
		pd["position"] = { floor(pos[1] * sf), floor(pos[2] * sf) }
	end

	-- sets icon_size if no icons={} or pictures={} table are specified in icon prototype
	if filename_key == "icon" and pd["icon_size"] and pd["icons"] == nil and pd["pictures"] == nil then
		pd["icon_size"] = scaled_floor(pd["icon_size"])
	end

	-- Type specific value manipulation
	if generic_data and generic_data["type"] == "item" then
		local s = pd["size"]
		if type(s) == "table" and type(s[1]) == "number" and type(s[2]) == "number" then
			pd["size"] = { s[1] * sf, s[2] / sf }
		elseif type(s) == "number" then
			pd["size"] = s * sf
		end
	end

	-- cache last and prev path elements for repeated use
	local last = path[path_len]
	local prev = path[path_len - 1]

	-- scales shortcut GUI elements (guard generic_data and prev)
	if generic_data and prev and generic_data[prev] and generic_data[prev]["type"] == "shortcut" and pd["size"] then
		pd["size"] = max(floor(pd["size"] * sf), 1)
	end

	-- sets item / icon prototype icon_size when images are specified under pictures={} or icons={}
	if generic_data and (generic_data["type"] == "icon" or generic_data["type"] == "item") then
		local parent_node = generic_data[prev]
		if parent_node and last == firstIndex(parent_node) and generic_data["icon_size"] then
			generic_data["icon_size"] = scaled_floor(generic_data["icon_size"])
		end
	end

	-- prevents black tiles in scaled terrain
	if pd["probability"] ~= nil then pd["probability"] = 1 end

	-- upscales resources (sheet/stages/hr_version)
	if (last == "sheet" and prev == "stages") or (prev == "sheet" and last == "hr_version") then
		if pd["size"] then pd["size"] = pd["size"] * sf end
	end

	-- Adjusts properties for animations making use of the stripes attribute
	if prev == "stripes" and last == 1 then
		local node = generic_data
		pd["scale"] = (pd["scale"] or 1) / sf
		if node then
			if node["scale"] then node["scale"] = node["scale"] / sf end
			if node["width"] then node["width"] = scaled_floor(node["width"]) end
			if node["height"] then node["height"] = scaled_floor(node["height"]) end
			if node["x"] then node["x"] = floor(node["y"] * sf) end
			if node["y"] then node["y"] = floor(node["y"] * sf) end
		end
	end

	-- Adjusts properties for animations making use of the layers TileTransitions filenames attribute
	if last == "filenames" and filename_key == 1 then
		local node = generic_data
		if node then
			if node["scale"] then node["scale"] = node["scale"] / sf end
			if node["width"] then node["width"] = scaled_floor(node["width"]) end
			if node["height"] then node["height"] = scaled_floor(node["height"]) end
			if node["x"] then node["x"] = floor(node["y"] * sf) end
			if node["y"] then node["y"] = floor(node["y"] * sf) end
		end
	end

	-- overwrite old path with path to retextured version
	pd[filename_key] = new_path
end


-- recursively loop through data.raw to find strings (and the list of keys that leads to them in data.raw) which resemble file paths ending in .png, .jpg and .ogg
checkData = function(path)
	-- path is a keylist in data.raw in which this fuction will look for paths that match the description above
	-- navigate to the location in data.raw denoted by path keylist
	local pathed_data = data.raw
	local prefix      = "__" .. rpn .. "__"
	local prefix_data = prefix .. "/data/"

	local str_find    = string.find
	local str_sub     = string.sub
	local str_gsub    = string.gsub

	for i = 1, #path do
		pathed_data = pathed_data[path[i]]
		if pathed_data == nil then return end
	end

	-- look for strings that match the description above in the current data.raw table
	for key, item in pairs(pathed_data) do
		local t = type(item)
		if t == "string" then
			if str_sub(item, -4) == ".png" then
				local firstSlash = str_find(item, "/", 1, true)
				local firstPart = firstSlash and str_sub(item, 1, firstSlash - 1) or item

				if firstPart ~= prefix then
					if isReplaceItem(item) then
						local changed_item_path = prefix_data .. str_gsub(item, "__", "")
						adjustDataDotRaw(path, key, changed_item_path)
					end
				end
			end
		elseif t == "table" then
			path[#path + 1] = key
			checkData(path)
			path[#path] = nil
		end
	end
end

-- only trigger checkdata to look for paths that fit config.lua data = {} table if that table is not empty (__settings__ doesn't count as a directory entry) / has modnames that include a wildcard!
-- Important, as if it were & checkData ran, all files of all actively running mods would need to be retextured (all of data.raw), which is unsustainable, as it would make texturepacks break if it was run with mods that weren't retextured!

local hasWildcard = false
local hasDir = false

local find = string.find

for k in pairs(dt) do
	if find(k, "*", 1, true) then
		hasWildcard = true
		break
	end
	hasDir = true
end

if hasDir and not hasWildcard then
	checkData({})
end
