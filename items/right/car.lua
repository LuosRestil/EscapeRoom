local utils = require "utils"

local car = {
  name = "toy car",
  x = 30,
  y = 108,
  w = 8,
  h = 8,
  weight = 149,
  desc = "vroom, vroom.",
  img = utils.load_img("assets/imgs/items/car.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return car