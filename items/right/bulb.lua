local utils = require "utils"

local bulb = {
  name = "light bulb",
  x = 10,
  y = 104,
  w = 8,
  h = 8,
  desc = "in case you have\na bright idea.",
  img = utils.load_img("assets/imgs/items/bulb.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return bulb