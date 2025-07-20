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

return right
