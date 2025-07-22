local utils = require "utils"
local secret_door_closed = {
  name = "scale",
  x = 50,
  y = 54,
  w = 22,
  h = 47,
  desc = "",
  activate = function(self, game)
    game.msg = "the readout says: " .. utils.format_num(62000 + game:inv_weight()) .. "g."
    if (false) then
      game:scene_toggle_item_hidden("secret_door_closed")
      game:scene_toggle_item_hidden("secret_door_open")
    end
  end
}

return secret_door_closed
