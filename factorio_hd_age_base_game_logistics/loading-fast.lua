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

-- split string into list via seperator
local split = function(str, sep)
	local list = {};
	for match in (str .. sep):gmatch("(.-)" .. sep) do
		table.insert(list, match);
	end
	return list;
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

	local find               = string.find
	local sub                = string.sub

	local startsWithWildcard = sub(search, 1, 1) == "*"
	local endsWithWildcard   = sub(search, -1) == "*"
	local lastIndex          = 1
	local itemLen            = #item
	local last_e

	-- iterate over non-empty segments between '*' without allocating a split table
	for term in search:gmatch("[^*]+") do
		-- skip accidental empty segments (shouldn't occur with the pattern, but safe)
		if term ~= "" then
			local s, e = find(item, term, lastIndex, true)
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
-- einfacher Ergebnis-Cache (kein LRU, aber sehr effektiv bei wiederholten Pfaden)
local isReplace_cache = {}

local function hasNonSettingsChildren(t)
	for k in pairs(t) do
		if k ~= "__settings__" then return true end
	end
	return false
end

local function isReplaceItem(path, step)
	step = step or 1

	local cached = isReplace_cache[path .. ":" .. tostring(step)]
	if cached ~= nil then return cached end

	local split_path = split(path:gsub("__", ""), "/")
	local cfg = config.data
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
			if k ~= "__settings__" and match(k, part) then
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
	local pathed_data, generic_data = data.raw, data.raw

	for pathIndex = 1, #path do
		pathed_data = pathed_data[path[pathIndex]]
		if pathIndex < #path - 1 then
			generic_data = generic_data[path[pathIndex]]
		end
	end

	-- do not overwrite image path if image name contains an element of exclude_names declared in settings
	if type(config.exclude_names) == "table" then
		local split_path = split(pathed_data[filename_key], "/")

		for index, name in pairs(config.exclude_names) do
			if (isValidTerm(name, split_path[#split_path])) then
				-- return before overwriting path
				return
			end
		end
	end

	-- find width of animations
	if type(pathed_data["width"]) == "number" and type(pathed_data["line_length"]) == "number" then
		-- If pathed_data["line_length"] is > 0 do the operation normally. If is is zero then multiply pathed_data["frame_count"] and pathed_data["width"] to get correct number for with calc.
		local width = pathed_data["line_length"] > 0 and pathed_data["line_length"] * pathed_data["width"] or
			pathed_data["frame_count"] * pathed_data["width"]
		-- Separate upscaling calc to make it easier to read above calc.
		width = math.max(math.floor(width * config.scalefactor), 1)
	end

	-- find height of animations
	if type(pathed_data["height"]) == "number" and type(pathed_data["line_length"]) == "number" then
		-- If pathed_data["line_length"] is > 0 do the operation normally. If is is zero then substitute pathed_data["direction_count"] to get correct number for hight calc.
		local height = pathed_data["line_length"] > 0 and
			math.ceil((pathed_data["frame_count"] or 1) / pathed_data["line_length"]) or pathed_data["direction_count"]
		-- Separate pathed_data["height"] calc and upscaling calc to make it easier to read above calc.
		height = math.max(math.floor(height * pathed_data["height"] * config.scalefactor), 1)
	end

	-- Secondary Checks: Ensure no values are manipulated twice (and hence deviate 2x as far from the original value as they should)
	if type(pathed_data["stripes"]) == "table" then
		return
	end

	-- General Value Manipulation: Change image scaling etc. stored in same table as image
	pathed_data["scale"] = (pathed_data["scale"] or 1) / config.scalefactor

	if pathed_data["width"] then pathed_data["width"] = math.max(math.floor(pathed_data["width"] * config.scalefactor), 1) end
	if pathed_data["height"] then pathed_data["height"] = math.max(
	math.floor(pathed_data["height"] * config.scalefactor), 1) end
	if pathed_data["x"] then pathed_data["x"] = math.floor(pathed_data["x"] * config.scalefactor) end
	if pathed_data["y"] then pathed_data["y"] = math.floor(pathed_data["y"] * config.scalefactor) end

	-- used when x and y property are 0
	if pathed_data["position"] then
		pathed_data["position"] = { math.floor(pathed_data["position"][1] * config.scalefactor), math.floor(pathed_data
			["position"][2] * config.scalefactor) }
	end

	-- sets icon_size if no icons={} or pictures={} table are specified in icon prototype
	if (pathed_data["icon_size"] and filename_key == "icon" and pathed_data["icons"] == nil and pathed_data["pictures"] == nil) then
		pathed_data["icon_size"] = math.max(math.floor(pathed_data["icon_size"] * config.scalefactor), 1)
	end

	-- Type specific value manipulation: Certain types of sprite importing e.g. as part of an animation, need different values
	if (generic_data["type"]) == "item" then
		if (type(pathed_data["size"]) == "table") then
			pathed_data["size"] = { pathed_data["size"][1] * config.scalefactor, pathed_data["size"][2] /
			config.scalefactor }
		elseif (type(pathed_data["size"]) == "number") then
			pathed_data["size"] = pathed_data["size"] * config.scalefactor
		end
	end

	-- scales shortcut GUI elements
	if (generic_data[path[#path - 1]]["type"] == "shortcut") then
		pathed_data["size"] = math.max(math.floor(pathed_data["size"] * config.scalefactor))
	end

	-- sets item / icon prototype icon_size when images are specified under pictures={} or icons={} keys
	if (generic_data["type"] == "icon" or generic_data["type"] == "item") and (path[#path] == firstIndex(generic_data[path[#path - 1]])) then
		generic_data["icon_size"] = math.max(math.floor(generic_data["icon_size"] * config.scalefactor), 1)
	end

	-- prevents black tiles in scaled terrain (may cause some texture tileability issues)
	if pathed_data["probability"] then pathed_data["probability"] = 1 end

	-- upscales resources
	if (path[#path] == "sheet" and path[#path - 1] == "stages") or (path[#path - 1] == "sheet" and path[#path] == "hr_version") then
		if pathed_data["size"] then pathed_data["size"] = pathed_data["size"] * config.scalefactor end
	end

	-- Adjusts properties for animations making use of the stripes attribute
	if path[#path - 1] == "stripes" and path[#path] == 1 then
		local node = generic_data
		pathed_data["scale"] = (pathed_data["scale"] or 1) / config.scalefactor
		if node["scale"] then node["scale"] = node["scale"] / config.scalefactor end
		if node["width"] then node["width"] = math.max(math.floor(node["width"] * config.scalefactor), 1) end
		if node["height"] then node["height"] = math.max(math.floor(node["height"] * config.scalefactor), 1) end
		if node["x"] then node["x"] = math.floor(node["y"] * config.scalefactor) end
		if node["y"] then node["y"] = math.floor(node["y"] * config.scalefactor) end
	end

	-- Adjusts properties for animations making use of the layers TileTransitions filenames attribute
	if path[#path] == "filenames" and filename_key == 1 then
		local node = generic_data[path[#path - 1]]
		if node["scale"] then node["scale"] = node["scale"] / config.scalefactor end
		if node["width"] then node["width"] = math.max(math.floor(node["width"] * config.scalefactor), 1) end
		if node["height"] then node["height"] = math.max(math.floor(node["height"] * config.scalefactor), 1) end
		if node["x"] then node["x"] = math.floor(node["y"] * config.scalefactor) end
		if node["y"] then node["y"] = math.floor(node["y"] * config.scalefactor) end
	end

	-- overwrite old path with path to retextured version
	pathed_data[filename_key] = new_path
end

-- recursively loop through data.raw to find strings (and the list of keys that leads to them in data.raw) which resemble file paths ending in .png, .jpg and .ogg
checkData = function(path)
	-- path is a keylist in data.raw in which this fuction will look for paths that match the description above
	-- navigate to the location in data.raw denoted by path keylist
	local pathed_data = data.raw
	local prefix      = "__" .. config.resource_pack_name .. "__"

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
						local changed_item_path = prefix .. "/data/" .. str_gsub(item, "__", "")
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

for k in pairs(config.data) do
	if find(k, "*", 1, true) then
		hasWildcard = true
		break
	end
	hasDir = true
end

if hasDir and not hasWildcard then
	checkData({})
end
