local utils = require "utils"

local solution = { 8, 7, 6 }
local numbersImg = utils.load_img("assets/imgs/scenes/color_box_nums.png")
local numberImgs = {
  love.graphics.newQuad(0, 0, 9, 13, numbersImg),
  love.graphics.newQuad(10, 0, 9, 13, numbersImg),
  love.graphics.newQuad(20, 0, 9, 13, numbersImg),
  love.graphics.newQuad(30, 0, 9, 13, numbersImg),
  love.graphics.newQuad(0, 14, 9, 13, numbersImg),
  love.graphics.newQuad(10, 14, 9, 13, numbersImg),
  love.graphics.newQuad(20, 14, 9, 13, numbersImg),
  love.graphics.newQuad(30, 14, 9, 13, numbersImg),
  love.graphics.newQuad(0, 28, 9, 13, numbersImg),
  love.graphics.newQuad(10, 28, 9, 13, numbersImg),
}

local color_box = {
  back = "right",
  img = utils.load_img("assets/imgs/scenes/color_box.png"),
  items = { -- buttons
    { x = 22, y = 99,  idx = 1, amt = 1 },
    { x = 22, y = 109, idx = 1, amt = -1 },
    { x = 58, y = 99,  idx = 2, amt = 1 },
    { x = 58, y = 109, idx = 2, amt = -1 },
    { x = 94, y = 99,  idx = 3, amt = 1 },
    { x = 94, y = 109, idx = 3, amt = -1 },
  },
  code = { 0, 0, 0 },
  validate_code = function(self, game)
    if self.code[1] == solution[1] and self.code[2] == solution[2] and self.code[3] == solution[3] then
      game:scene_toggle_item_hidden("right", "color_box")
      game:scene_toggle_item_hidden("right", "color_box_open")
      game:navigate("color_box_open")
      -- play sound
    end
  end
}

local function activate(self, game)
  color_box.code[self.idx] = color_box.code[self.idx] + self.amt
  if color_box.code[self.idx] == -1 then color_box.code[self.idx] = 9 end
  if color_box.code[self.idx] == 10 then color_box.code[self.idx] = 0 end
  color_box:validate_code(game)
end

local function draw(self)
  if self.amt == -1 then return end -- don't draw for both buttons
  love.graphics.draw(numbersImg, numberImgs[color_box.code[self.idx] + 1], self.x + 3, self.y - 18)
end

for _, item in ipairs(color_box.items) do
  item.activate = activate
  item.draw = draw
  item.w = 15
  item.h = 8
end

return color_box
