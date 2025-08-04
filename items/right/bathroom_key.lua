local item_metatable = require "items.item"
local utils = require "utils"

local key = {
  name = "bathroom key",
  weight = 25,
  desc = "opens the bathroom door.",
  img = utils.load_img("assets/imgs/items/bathroom_key.png"),
}

setmetatable(key, { __index = item_metatable })

return key
