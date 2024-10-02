local fs = require("@lune/fs")
local net = require("@lune/net")
local roblox = require("@lune/roblox")
local remodel = require("remodel")

local Worlds = {}
local Files = fs.readDir("../")

for _, FullName in ipairs(Files) do
	local Name, Extension = table.unpack(string.split(FullName, ".") or {})

	if Extension == "json" then
		local File = fs.readFile(`../{FullName}`)
		if File then
			local Json = net.jsonDecode(File)
			if Json then
				Worlds[Name] = Json
			end
		end
	end
end

local ModuleScript = roblox.Instance.new("ModuleScript")
ModuleScript.Source = net.jsonEncode(Worlds)
remodel.writeExistingModelAsset(ModuleScript, 16007140043)
