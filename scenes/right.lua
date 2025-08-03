local bulb = require "items.right.bulb"
local burger = require "items.right.burger"
local car = require "items.right.car"
local flower = require "items.right.flower"
local hat = require "items.right.hat"
local rabbit = require "items.right.rabbit"
local screwdriver = require "items.right.screwdriver"
local tea = require "items.right.tea"
local binoculars = require "items.right.binoculars"
local utils = require "utils"

local right = {
  left = "start",
  img = utils.load_img("assets/imgs/scenes/right.png"),
  items = { bulb, burger, car, flower, hat, rabbit, screwdriver, tea, binoculars,
    {
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
    },
    {
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
    },
    {
      name = "window",
      x = 9,
      y = 14,
      w = 35,
      h = 36,
      activate = function(self, game)
        if game.active_item ~= nil and game.active_item.name == "binoculars" then
          game.msg =
          "through the binoculars, you\nsee the banner is an \nadvertisement for a radio\nstation, \"101.1 krlc\"" --TODO full text
        else
          game.msg = "through the window, you see\na plane pulling a banner.\nit's too far away to read\nthe message"
        end
      end
    },
    {
      name = "piano",
      x = 9,
      y = 76,
      w = 45,
      h = 17,
      activate = function(self, game)
        game:navigate("piano")
      end
    }
  }
}

return right
