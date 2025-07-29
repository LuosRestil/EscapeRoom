local utils = require "utils"

local pressure_plate = {
  name = "pressure_plate",
  x = 10,
  y = 99,
  w = 27,
  h = 3,
  trigger_weight = 62000,
  desc = "",
  img = utils.load_img("assets/imgs/items/pressure_plate.png"),
  activate = function(self, game)
    if game:inv_weight() + 62000 == self.trigger_weight then
      game:scene_toggle_item_hidden("left", "secret_door_closed")
      game:scene_toggle_item_hidden("left", "secret_door_open")
    else
      -- click sound
    end
  end
}

return pressure_plate
