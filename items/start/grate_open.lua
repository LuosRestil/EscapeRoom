local utils = require "utils"

local grate_open = {
  name = "grate_open",
  x = 8,
  y = 5,
  w = 23,
  h = 23,
  img = utils.load_img("assets/imgs/items/grate_open.png"),
  hidden = true
}

function grate_open:activate(game)
  game:navigate("grate_open")
end

return grate_open
