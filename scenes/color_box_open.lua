local utils = require "utils"

local numbersImg = utils.load_img("assets/imgs/scenes/color_box_nums.png")
local numberImgs = {
  love.graphics.newQuad(20, 14, 9, 13, numbersImg), -- 6
  love.graphics.newQuad(30, 14, 9, 13, numbersImg), -- 7
  love.graphics.newQuad(0, 28, 9, 13, numbersImg),  -- 8
}

local function draw(self)
  love.graphics.draw(numbersImg, numberImgs[self.img_idx], self.x, self.y)
end

local color_box_open = {
  back = "right",
  img = utils.load_img("assets/imgs/scenes/color_box_open.png"),
  items = {
    { x = 25, y = 81, w = 0, h = 0, img_idx = 3, draw = draw },
    { x = 61, y = 81, w = 0, h = 0, img_idx = 2, draw = draw },
    { x = 97, y = 81, w = 0, h = 0, img_idx = 1, draw = draw },
  }
}

return color_box_open
