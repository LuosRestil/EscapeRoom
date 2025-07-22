local utils = require "utils"
local colors = require "colors"

local secret_door_open = {
  name = "secret_door_open",
  x = 3,
  y = 32,
  w = 39,
  h = 67,
  desc = "",
  hidden = true,
  img = utils.load_img("assets/imgs/items/secret_door_open.png"),
  activate = function(self, game)
    game.msg = "you found a secret\npassageway!"
    -- game:navigate("secret_room")
  end
}

return secret_door_open
