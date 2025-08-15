local utils = require "utils"

local rabbit = {
  name = "toy rabbit",
  weight = 291,
  desc = "a stuffed rabbit. the\ntag reads \"shrodinger\".",
  img = utils.load_img("assets/imgs/items/rabbit.png"),
}

local function draw(self)
  love.graphics.push()
  love.graphics.scale(3, 3)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(self.num, self.x / 3 + 1, 26.66)
  love.graphics.setColor(1, 1, 1)
  love.graphics.pop()
end

local color_box_open = {
  back = "start",
  img = utils.load_img("assets/imgs/scenes/color_box_open.png"),
  items = {
    rabbit,
    { x = 22, y = 81, num = 9, draw = draw },
    { x = 58, y = 81, num = 7, draw = draw },
    { x = 94, y = 81, num = 6, draw = draw },
    {
      name = "rabbit ears",
      x = 50,
      y = 44,
      w = 35,
      h = 19,
      img = utils.load_img("assets/imgs/items/color_box_ears.png"),
      activate = function(self, game)
        game:pickup(rabbit)
        game:remove_item_from_scene("color_box_open", self.name)
        game:remove_item_from_scene("start", "ears")
      end
    }
  }
}

return color_box_open
