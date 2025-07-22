local utils = require "utils"

local flower = {
  name = "flower",
  x = 40,
  y = 110,
  w = 8,
  h = 8,
  weight = 630,
  desc = "it's a flower.\nsmells nice.",
  img = utils.load_img("assets/imgs/items/flower.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return flower