local utils = require "utils"

local scale = {
  name = "scale",
  x = 50,
  y = 54,
  w = 22,
  h = 47,
  desc = "",
  activate = function(self, game)
    game.msg = "the readout says: " .. utils.format_num(62000 + game:inv_weight()) .. "g."
  end
}

return scale
