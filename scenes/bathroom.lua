local utils = require "utils"
local scale = require "items/left/scale"

local left = {
  back = "left",
  img = utils.load_img("assets/imgs/scenes/bathroom.png"),
  items = {
    scale,
    {
      x = 89,
      y = 13,
      w = 22,
      h = 25,
      activate = function(self, game) game.msg = "we aim to please.\nplease aim." end
    }
  }
}

return left
