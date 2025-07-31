local utils = require "utils"

local binoculars = {
  name = "binoculars",
  x = 42,
  y = 97,
  w = 8,
  h = 8,
  weight = 2023,
  desc = "look through the small end",
  img = utils.load_img("assets/imgs/items/binoculars.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return binoculars
