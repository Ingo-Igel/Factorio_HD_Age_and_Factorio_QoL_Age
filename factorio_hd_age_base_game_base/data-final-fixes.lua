require("prototypes.rocket-silo")
require("prototypes.paving")

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

local config      = require("config")
local val_sf      = config.scalefactor
local str_rpn     = config.resource_pack_name
local tbl_en      = config.exclude_names
local str_tbl_wl  = config.white_list
local tbl_dt      = config.data

local next_ref    = next
local pairs_ref   = pairs

local floor       = math.floor
local max         = math.max

local str_byte    = string.byte
local str_find    = string.find
local str_gmatch  = string.gmatch
local str_gsub    = string.gsub
local str_sub     = string.sub

-- split string into list via seperator
local split       = function(str, sep)
	local list = {}
	local pattern = "([^" .. sep .. "]+)"
	local i = 1
	for match in str_gmatch(str .. sep, pattern) do
		list[i] = match
		i = i + 1
	end
	return list
end

local firstIndex  = function(in_table)
	return next(in_table)
end

-- separates the items in search by wild cards (*). Ensures these separated terms can be found in the specified order in the final item string, and that if there are no wild cards at the beginning/end of the serach string, the beginning / end of the search string are also the beginning / end of the item string
local isValidTerm = function(search, item)
	-- quick path: no wildcard at all
	if not str_find(search, "*", 1, true) then
		return search == item
	end

	local startsWithWildcard = str_byte(search, 1) == 42
	local endsWithWildcard   = str_byte(search, -1) == 42
	local lastIndex          = 1
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
	if not endsWithWildcard then
		if last_e ~= #item then
			return false
		end
	end

	return true
end


-- See if a path from data.raw is among those declared in the config.lua data = {} table as one to be retextured & hence if the path needs to be changed to the retextured version
local isReplace_cache = {}

local function isReplaceItem(path, step)
	step = step or 1

	local path_cache = isReplace_cache[path]
	if path_cache then
		local cached = path_cache[step]
		if cached ~= nil then return cached end
	else
		path_cache = {}
		isReplace_cache[path] = path_cache
	end

	local split_path = split(str_gsub(path, "__", ""), "/")
	local i = step
	local n = #split_path
	local cfg = tbl_dt

	while i <= n do
		local part = split_path[i]
		local found = false

		for k, v in pairs_ref(cfg) do
			if isValidTerm(k, part) then
				cfg = v
				found = true
				i = i + 1
				break
			end
		end

		if not found then
			local res = (next_ref(cfg) == nil)
			path_cache[step] = res
			return res
		end
	end

	local res = (next_ref(cfg) == nil)
	path_cache[step] = res
	return res
end


-- adjust metadata of importing image at path in data.raw as set by the settings accumulated in lookForTreeSettings
local adjustDataDotRaw = function(path, filename_key, new_path)
	local cfg_root = data.raw
	local generic_root = data.raw
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

	local function scaled_floor(v) return max(floor(v * val_sf), 1) end

	-- do not overwrite image path if image name contains an element of exclude_names declared in settings
	if type(tbl_en) == "table" then
		local filename = pathed_data[filename_key]
		if type(filename) == "string" then
			local split_path = split(filename, "/")
			local last_name = split_path[#split_path]
			for _, name in pairs(tbl_en) do
				if isValidTerm(name, last_name) then
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
	pathed_data["scale"] = (pathed_data["scale"] or 1) / val_sf
	if type(pathed_data["width"]) == "number" then pathed_data["width"] = scaled_floor(pathed_data["width"]) end
	if type(pathed_data["height"]) == "number" then pathed_data["height"] = scaled_floor(pathed_data["height"]) end
	if type(pathed_data["x"]) == "number" then pathed_data["x"] = floor(pathed_data["x"] * val_sf) end
	if type(pathed_data["y"]) == "number" then pathed_data["y"] = floor(pathed_data["y"] * val_sf) end

	-- used when x and y property are 0
	local pos = pathed_data["position"]
	if type(pos) == "table" and type(pos[1]) == "number" and type(pos[2]) == "number" then
		pathed_data["position"] = { floor(pos[1] * val_sf), floor(pos[2] * val_sf) }
	end

	-- sets icon_size if no icons={} or pictures={} table are specified in icon prototype
	if filename_key == "icon" and pathed_data["icon_size"] and pathed_data["icons"] == nil and pathed_data["pictures"] == nil then
		pathed_data["icon_size"] = scaled_floor(pathed_data["icon_size"])
	end

	-- Type specific value manipulation
	if generic_data and generic_data["type"] == "item" then
		local s = pathed_data["size"]
		if type(s) == "table" and type(s[1]) == "number" and type(s[2]) == "number" then
			pathed_data["size"] = { s[1] * val_sf, s[2] / val_sf }
		elseif type(s) == "number" then
			pathed_data["size"] = s * val_sf
		end
	end

	-- cache last and prev path elements for repeated use
	local last = path[path_len]
	local prev = path[path_len - 1]

	-- scales shortcut GUI elements (guard generic_data and prev)
	if generic_data and prev and generic_data[prev] and generic_data[prev]["type"] == "shortcut" and pathed_data["size"] then
		pathed_data["size"] = max(floor(pathed_data["size"] * val_sf), 1)
	end

	-- sets item / icon prototype icon_size when images are specified under pictures={} or icons={}
	if generic_data and (generic_data["type"] == "icon" or generic_data["type"] == "item") then
		local parent_node = generic_data[prev]
		if parent_node and last == firstIndex(parent_node) and generic_data["icon_size"] then
			generic_data["icon_size"] = scaled_floor(generic_data["icon_size"])
		end
	end

	-- prevents black tiles in scaled terrain
	if pathed_data["probability"] ~= nil then pathed_data["probability"] = 1 end

	-- upscales resources (sheet/stages/hr_version)
	if (last == "sheet" and prev == "stages") or (prev == "sheet" and last == "hr_version") then
		if pathed_data["size"] then pathed_data["size"] = pathed_data["size"] * val_sf end
	end

	-- Adjusts properties for animations making use of the stripes attribute
	if prev == "stripes" and last == 1 then
		pathed_data["scale"] = (pathed_data["scale"] or 1) / val_sf
		if generic_data then
			if generic_data["scale"] then generic_data["scale"] = generic_data["scale"] / val_sf end
			if generic_data["width"] then generic_data["width"] = scaled_floor(generic_data["width"]) end
			if generic_data["height"] then generic_data["height"] = scaled_floor(generic_data["height"]) end
			if generic_data["x"] then generic_data["x"] = floor(generic_data["y"] * val_sf) end
			if generic_data["y"] then generic_data["y"] = floor(generic_data["y"] * val_sf) end
		end
	end

	-- Adjusts properties for animations making use of the layers TileTransitions filenames attribute
	if last == "filenames" and filename_key == 1 then
		if generic_data then
			if generic_data["scale"] then generic_data["scale"] = generic_data["scale"] / val_sf end
			if generic_data["width"] then generic_data["width"] = scaled_floor(generic_data["width"]) end
			if generic_data["height"] then generic_data["height"] = scaled_floor(generic_data["height"]) end
			if generic_data["x"] then generic_data["x"] = floor(generic_data["y"] * val_sf) end
			if generic_data["y"] then generic_data["y"] = floor(generic_data["y"] * val_sf) end
		end
	end

	-- overwrite old path with path to retextured version
	pathed_data[filename_key] = new_path
end

local starts_with_any
if type(str_tbl_wl) == "string" then
	local p = str_tbl_wl
	starts_with_any = function(s)
		return str_sub(s, 1, #p) == p
	end
else
	starts_with_any = function(s)
		for i = 1, #str_tbl_wl do
			local p = str_tbl_wl[i]
			if str_sub(s, 1, #p) == p then
				return true
			end
		end
		return false
	end
end

-- recursively loop through data.raw to find strings (and the list of keys that leads to them in data.raw) which resemble file paths ending in .png, .jpg and .ogg
checkData = function(path)
	-- path is a keylist in data.raw in which this fuction will look for paths that match the description above
	-- navigate to the location in data.raw denoted by path keylist
	local pathed_data = data.raw
	local prefix_data = "__" .. str_rpn .. "__" .. "/data/"

	for i = 1, #path do
		pathed_data = pathed_data[path[i]]
		if pathed_data == nil then return end
	end

	-- look for strings that match the description above in the current data.raw table
	for key, item in pairs(pathed_data) do
		local t = type(item)
		if t == "string" then
			if str_sub(item, -4) == ".png" and starts_with_any(item) then
				if isReplaceItem(item) then
					local changed_item_path = prefix_data .. str_gsub(item, "__", "")
					adjustDataDotRaw(path, key, changed_item_path)
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

for k in pairs(tbl_dt) do
	if str_find(k, "*", 1, true) then
		hasWildcard = true
		break
	end
	hasDir = true
end

if hasDir and not hasWildcard then
	checkData({})
end
