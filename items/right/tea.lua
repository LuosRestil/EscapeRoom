local utils = require "utils"

local tea = {
  name = "cup of tea",
  x = 80,
  y = 116,
  w = 8,
  h = 8,
  weight = 876,
  desc = "smells of bitter almonds.",
  img = utils.load_img("assets/imgs/items/tea.png"),
  activate = function(self, game)
    game:pickup(self)
  end
}

return tea
