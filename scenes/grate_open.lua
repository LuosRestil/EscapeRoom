local utils = require "utils"

local grate_open = {
  back = "start",
  img = utils.load_img("assets/imgs/scenes/grate_open.png"),
  items = {}
}

return grate_open

-- TODO
-- one big item covering the whole background
-- use a light on it to open grate_open_lit,
-- which contains an item, or shows a message
