local utils = require "utils"
local colors = require "colors"

local secret_door_closed = {
  name = "secret_door_closed",
  x = 3,
  y = 32,
  w = 39,
  h = 67,
  desc = "",
  img = utils.load_img("assets/imgs/items/secret_door_closed.png"),
  activate = function(self, game)
    game.msg = "there's a faint outline\non the wall."
  end
}

return secret_door_closed
