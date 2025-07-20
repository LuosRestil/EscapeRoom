local utils = require "utils"

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
  if game.hovered_item == self then
    love.graphics.rectangle("fill", self.x + 1, self.y + 1, self.w - 1, self.h - 1)
  end
  love.graphics.draw(self.img, self.x, self.y)
end

function inv_btn:activate(game)
  game:open_inv()
end

return inv_btn
