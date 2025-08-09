local utils = require "utils"

local grate_lit = {
  back = "start",
  img = utils.load_img("assets/imgs/scenes/grate_lit.png"),
  items = {
    -- key
    {
      name = "key",
      x = 60,
      y = 100,
      w = 8,
      h = 6,
      weight = 25,
      desc = "the key!!!\nlet's get out of here.",
      img = utils.load_img("assets/imgs/items/key.png"),
      img_offset_y = -2,
      activate = function(self, game)
        game:pickup(self)
      end
    }
  }
}

return grate_lit
