local bulb = require "items.right.bulb"
local burger = require "items.right.burger"
local car = require "items.right.car"
local flower = require "items.right.flower"
local hat = require "items.right.hat"
local rabbit = require "items.right.rabbit"
local screwdriver = require "items.right.screwdriver"
local tea = require "items.right.tea"
local utils = require "utils"

local right = {
  left = "start",
  img = utils.load_img("assets/imgs/scenes/right.png"),
  items = { bulb, burger, car, flower, hat, rabbit, screwdriver, tea }
}

table.insert(right.items, {
  name = "color_box",
  img = utils.load_img("assets/imgs/items/color_box.png"),
  x = 97,
  y = 56,
  w = 23,
  h = 14,
  img_offset_y = -6,
  activate = function(self, game)
    game:navigate("color_box")
  end
})

table.insert(right.items, {
  name = "color_box_open",
  img = utils.load_img("assets/imgs/items/color_box_open.png"),
  hidden = true,
  x = 97,
  y = 50,
  w = 22,
  h = 21,
  activate = function(self, game)
    game:navigate("color_box_open")
  end
})

return right
