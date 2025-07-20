local key = require "items.start.key"
local lock = require "items.start.lock"
local grate = require "items.start.grate"
local utils = require "utils"

local start = {
  left = "left",
  right = "right",
  back = "not a real room name...",
  img = utils.load_img("assets/imgs/scenes/start_bg.png"),
  items = { key, lock, grate }
}

return start
