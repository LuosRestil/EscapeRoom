local utils = require "utils"

local scene = {}

function scene:draw()
  love.graphics.draw(self.img, 0, 0)
  if self.draw2 ~= nil then self:draw2() end
  for _, item in ipairs(self.items) do
    if not item.hidden then item:draw() end
  end
end

function scene:hover(ptr, game)
  for _, item in ipairs(self.items) do
    if not item.hidden and item.w ~= nil and utils.ptr_colliding(ptr, item) then
      game.hovered_item = item
      return
    end
  end
end

return scene
