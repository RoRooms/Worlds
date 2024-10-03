local serde = require("@lune/serde")
local fs = require("@lune/fs")

local Env = {}

pcall(function()
	Env = serde.decode("toml", fs.readFile("./.env"))
	print(serde.decode("toml", fs.readFile("./.env")))
end)

return Env
