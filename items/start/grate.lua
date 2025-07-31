local utils = require "utils"

local grate = {
  name = "grate",
  x = 8,
  y = 5,
  w = 23,
  h = 23,
  img = utils.load_img("assets/imgs/items/grate.png"),
}

function grate:activate(game)
  game:navigate("grate")
end

return grate
