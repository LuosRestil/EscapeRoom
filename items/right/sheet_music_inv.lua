local item_metatable = require "items.item"
local utils = require "utils"

local sheet_music_inv = {
  name = "sheet music",
  weight = 33,
  desc = "a tune called\n\"under the bridge\"",
  img = utils.load_img("assets/imgs/items/sheet_music_inv.png"),
}

setmetatable(sheet_music_inv, { __index = item_metatable })

return sheet_music_inv
