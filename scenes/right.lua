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

-- color box
table.insert(right.items, {
  x=97,y=57,w=22,h=13,
  activate = function (self, game)
    if game.color_box_open then 
      game:navigate("color_box_open")
    else
      game:navigate("color_box")
    end
  end
})

return right
