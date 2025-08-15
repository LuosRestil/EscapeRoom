local utils = require "utils"
local colors = require "colors"

local win = {
  items = {},
  img = utils.load_img("assets/imgs/scenes/win.png"),
  draw_after = function(self)
    love.graphics.push()
    love.graphics.scale(3, 3)
    love.graphics.setColor(colors.yellow)
    love.graphics.print("you win!", 7, 18)
    love.graphics.setColor(1, 1, 1)
    love.graphics.pop()
  end
}

return win
