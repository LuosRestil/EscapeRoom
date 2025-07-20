local utils = require "utils"

local burger = {
  name = "soy burger",
  x = 20,
  y = 100,
  w = 8,
  h = 8,
  desc = "no animals were\nharmed in the making\nof this game.",
  img = utils.load_img("assets/imgs/items/burger.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return burger