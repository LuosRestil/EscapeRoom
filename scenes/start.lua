local key = require "items.start.key"
local lock = require "items.start.lock"
local grate = require "items.start.grate"
local grate_open = require "items.start.grate_open"
local utils = require "utils"

local start = {
  left = "left",
  right = "right",
  img = utils.load_img("assets/imgs/scenes/start_bg.png"),
  items = { key, lock, grate, grate_open }
}

-- radio
table.insert(start.items, {
  x=9, y=57, w=22, h=14, activate = function(self, game)
    game:navigate("radio")
  end
})

return start
