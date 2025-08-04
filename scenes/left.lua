local utils = require "utils"
-- local secret_door_open = require "items/left/secret_door_open"
-- local secret_door_closed = require "items/left/secret_door_closed"
-- local scale = require "items/left/scale"
-- local pressure_plate = require "items/left/pressure_plate"

local left = {
  right = "start",
  img = utils.load_img("assets/imgs/scenes/bookshelf_room.png"),
  items = {
    -- lock (must come before door, as hitboxes overlap)
    {
      x = 44,
      y = 60,
      w = 3,
      h = 13,
      activate = function(self, game)
        game.msg = "clicked lock"
      end
    },
    -- door
    { x = 15, y = 34, w = 36, h = 64, activate = function(self, game) game:navigate("bathroom") end },

    -- scale, secret_door_closed, secret_door_open, pressure_plate,
  }
}

return left
