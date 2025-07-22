local utils = require "utils"
local secret_door_open = require "items/left/secret_door_open"
local secret_door_closed = require "items/left/secret_door_closed"
local scale = require "items/left/scale"
local pressure_plate = require "items/left/pressure_plate"

local left = {
  right = "start",
  img = utils.load_img("assets/imgs/scenes/bookshelf_room.png"),
  items = { scale, secret_door_closed, secret_door_open, pressure_plate }
}

return left
