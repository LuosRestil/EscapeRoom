local item_metatable = require "items.item"
local utils = require "utils"

local pencil = {
  name = "pencil",
  weight = 9,
  desc = "2b or not 2b?\nthat is the pencil.",
  img = utils.load_img("assets/imgs/items/pencil.png"),
  img_offset_y = -2,
}

setmetatable(pencil, { __index = item_metatable })

return pencil
