local utils = require "utils"

local function draw(self)
    love.graphics.push()
    love.graphics.scale(3, 3)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(self.num, self.x/3 + 1, 26.66)
    love.graphics.setColor(1, 1, 1)
    love.graphics.pop()
end

local color_box_open = {
  back = "right",
  img = utils.load_img("assets/imgs/scenes/color_box_open.png"),
  items = {
    { x = 22, y = 81, w = 0, h = 0, num = 8, draw = draw },
    { x = 58, y = 81, w = 0, h = 0, num = 7, draw = draw },
    { x = 94, y = 81, w = 0, h = 0, num = 6, draw = draw },
  }
}

return color_box_open
