local utils = require "utils"

local rabbit = {
  name = "rabbit",
  x = 60,
  y = 100,
  w = 8,
  h = 8,
  weight = 3141,
  desc = "fresh from a magician's hat.",
  img = utils.load_img("assets/imgs/items/rabbit.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return rabbit