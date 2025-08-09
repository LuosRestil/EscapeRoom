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
    },
    -- matches
    {
      name = "matches",
      desc = "matches from the bathroom.",
      x = 38,
      y = 53,
      w = 10,
      h = 3,
      weight = 8,
      img = utils.load_img("assets/imgs/items/matches.png"),
      img_offset_y = -2,
      activate = function(self, game)
        game:pickup(self)
      end
    }
  }
}

return left
