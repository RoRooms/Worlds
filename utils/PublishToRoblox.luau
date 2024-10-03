local fs = require("@lune/fs")
local net = require("@lune/net")
local roblox = require("@lune/roblox")
local remodel = require("remodel")
local serpent = require("Serpent")

local Worlds = {}
local Files = fs.readDir("./")

for _, FullName in ipairs(Files) do
	local Name, Extension = table.unpack(string.split(FullName, ".") or {})
	if Extension == "json" then
		local File = fs.readFile(`./{FullName}`)
		if File then
			local Json = net.jsonDecode(File)
			if Json then
				Worlds[Name] = Json
			end
		end
	end
end

local ModuleScript = roblox.Instance.new("ModuleScript")
ModuleScript.Name = "MainModule"
ModuleScript.Source = "return " .. serpent.line(Worlds, {
	comment = false,
	safe = true,
})
remodel.writeExistingModelAsset(ModuleScript, 16007140043)
