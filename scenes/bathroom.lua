local utils = require "utils"

local left = {
  back = "left",
  img = utils.load_img("assets/imgs/scenes/bathroom.png"),
  items = {
    {
      x = 89,
      y = 13,
      w = 22,
      h = 25,
      activate = function(self, game) game.msg = "we aim to please.\nplease aim." end
    },
    -- scale
    {
      name = "scale",
      x = 56,
      y = 56,
      w = 22,
      h = 48,
      desc = "",
      activate = function(self, game)
        local weight = 62000 + game:inv_weight()
        if game.active_item ~= nil and game.active_item.weight ~= nil then
          weight = game.active_item.weight
        end
        game.msg = "the readout says: " .. weight .. "g."
      end
    },
    -- matches
    {
      name = "matches",
      desc = "matches from the bathroom.",
      x = 38,
      y = 53,
      w = 10,
      h = 3,
      weight = 8,
      img = utils.load_img("assets/imgs/items/matches.png"),
      img_offset_y = -2,
      activate = function(self, game)
        game:pickup(self)
      end
    }
  }
}

return left
