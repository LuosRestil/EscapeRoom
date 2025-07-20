local utils = require "utils"

local hat = {
  name = "hat",
  x = 50,
  y = 101,
  w = 8,
  h = 8,
  desc = "keeps the sun\nout of your eyes.",
  img = utils.load_img("assets/imgs/items/hat.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return hat