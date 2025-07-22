local utils = require "utils"

local screwdriver = {
  name = "screwdriver",
  x = 70,
  y = 105,
  w = 8,
  h = 8,
  weight = 943,
  desc = "equally useful for\nscrewdriving and\nscrew un-driving.",
  img = utils.load_img("assets/imgs/items/screwdriver.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return screwdriver