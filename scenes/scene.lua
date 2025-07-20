local utils = require "utils"

local scene = {}

function scene:draw()
  love.graphics.draw(self.img, 0, 0)
  for _, item in ipairs(self.items) do
    item:draw()
  end
end

function scene:hover(ptr, game)
  -- items
  for _, item in ipairs(self.items) do
    if utils.ptr_colliding(ptr, item) then
      game.hovered_item = item
      return
    end
  end
end

return scene
