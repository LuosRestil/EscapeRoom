local utils = require "utils"
local colors = require "colors"

local title = {
  img = utils.load_img("assets/imgs/scenes/darkness.png"),
  items = {
    {
      name = "start button",
      x = 47,
      y = 93,
      w = 31,
      h = 13,
      activate = function(self, game)
        game:navigate("start", "")
        game:stop_sound("title")
        game:play_sound("bg_music")
        game.started = true
      end,
      draw = function(self)
        utils.rectfill(self.x, self.y, self.w, self.h, colors.white)
        utils.rectfill(self.x + 1, self.y + 1, self.w - 2, self.h - 2, colors.navy)
        utils.print("start", self.x + 6, self.y + 4, colors.white)
      end
    }
  },
  draw_after = function(self)
    love.graphics.push()
    love.graphics.scale(3, 3)
    love.graphics.setColor(colors.yellow)
    love.graphics.print("escape!", 9, 10)
    love.graphics.setColor(1, 1, 1)
    love.graphics.pop()

    utils.print("arrow keys to move", 30, 55, colors.orange)
    utils.print("z to interact", 38, 65, colors.orange)
    utils.print("x to cancel", 42, 75, colors.orange)
  end
}



return title
