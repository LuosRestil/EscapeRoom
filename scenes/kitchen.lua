local utils = require "utils"
local colors = require "colors"

local ice_block_tongs = {
  name = "ice block tongs",
  desc = "used for carrying\nlarge blocks of ice.",
  img = utils.load_img("assets/imgs/items/ice_block_tongs.png"),
}

local book = {
  name = "book",
  desc = "the whining - stefan kang",
  img = utils.load_img("assets/imgs/items/book.png"),
}

local kitchen = {
  right = "left",
  img = utils.load_img("assets/imgs/scenes/kitchen.png"),
  items = {
    -- ice block tongs
    {
      name = "ice block tongs kitchen",
      x = 72,
      y = 64,
      w = 7,
      h = 14,
      img = utils.load_img("assets/imgs/items/ice_block_tongs_kitchen.png"),
      activate = function(self, game)
        game:remove_item_from_scene("kitchen", self.name)
        game:pickup(ice_block_tongs)
      end
    },
    -- nail
    {
      name = "hanger",
      desc = "a nail in the wall\nto hang things from.",
      x = 75,
      y = 65,
      w = 1,
      h = 1,
      draw = function(self)
        utils.rectfill(self.x, self.y, self.w + 1, self.h + 1, colors.light_grey)
      end
    },
    -- freezer
    {
      name = "freezer",
      x = 85,
      y = 30,
      w = 34,
      h = 20,
      activate = function(self, game)
        game:pickup(book)
        game.msg = "you found a book\nin the freezer. what's\nthat doing in there?"
        game:scene_toggle_item_hidden("kitench", self.name)
      end
    },
    ice_block_tongs
  }
}

return kitchen
