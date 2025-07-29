local utils = require "utils"

local btn = love.keyboard.isDown

local ptr = {
  x = 64,
  y = 64,
  img = utils.load_img("assets/imgs/ptr.png"),
}
ptr.quad_s = love.graphics.newQuad(0, 0, 3, 3, ptr.img)
ptr.quad_l = love.graphics.newQuad(3, 0, 5, 5, ptr.img)

function ptr:update()
  local moved = false
  if btn("right") then
    self.x = utils.clamp(ptr.x + 1, 0, 127)
    moved = true
  end
  if btn("left") then
    self.x = utils.clamp(ptr.x - 1, 0, 127)
    moved = true
  end
  if btn("up") then
    self.y = utils.clamp(ptr.y - 1, 0, 127)
    moved = true
  end
  if btn("down") then
    self.y = utils.clamp(ptr.y + 1, 0, 127)
    moved = true
  end
  return moved
end

function ptr:draw_s()
  love.graphics.draw(self.img, self.quad_s, self.x - 1, self.y - 1)
end

function ptr:draw_l()
  love.graphics.draw(self.img, self.quad_l, self.x - 2, self.y - 2)
end

function ptr:reset()
  self.x, self.y = 64, 64
end

function ptr:set(x, y)
  self.x, self.y = x, y
end

return ptr
