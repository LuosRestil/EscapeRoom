local colors = require "colors"
local utils = require "utils"

local item = {}

function item:draw()
  if self.img ~= nil then
    local offset_x = self.img_offset_x ~= nil and self.img_offset_x or 0
    local offset_y = self.img_offset_y ~= nil and self.img_offset_y or 0
    love.graphics.draw(self.img, self.x + offset_x, self.y + offset_y)
  end
end

function item:draw_ptr(ptr, hovering)
  love.graphics.draw(self.img, ptr.x - 4, ptr.y - 4)

  if not hovering then return end

  local x = ptr.x + 5
  if ptr.x > 120 then
    x = ptr.x - 6
  end

  utils.rectfill(x, ptr.y - 5, 1, 3, colors.yellow)
  utils.rectfill(x, ptr.y - 1, 1, 1, colors.yellow)
end

function item:activate() end

return item
