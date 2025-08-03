local utils = require "utils"
local colors = require "colors"

local inv_btn = {
  name = "inventory button",
  img = utils.load_img("assets/imgs/inv_btn.png"),
  x = 118,
  y = 1,
  w = 9,
  h = 9,
}

function inv_btn:hover(ptr, game)
  if utils.ptr_colliding(ptr, self) then
    game.hovered_item = self
  end
end

function inv_btn:draw(game)
  local color = game.hovered_item == self and colors.white or colors.light_blue
  utils.rectfill(self.x, self.y, self.w, self.h, color)
  love.graphics.draw(self.img, self.x, self.y)
end

function inv_btn:activate(game)
  game:open_inv()
end

return inv_btn
