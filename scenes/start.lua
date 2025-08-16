local utils = require "utils"

local door_locked = true

local pencil = {
  name = "pencil",
  weight = 5,
  desc = "2b or not 2b?\nthat is the pencil.",
  img = utils.load_img("assets/imgs/items/pencil.png"),
}

local start = {
  left = "left",
  right = "right",
  img = utils.load_img("assets/imgs/scenes/start_bg.png"),
  items = {
    {
      name = "lock",
      x = 80,
      y = 60,
      w = 6,
      h = 15,
      desc = "looks like you'll\nneed a key.",
      activate = function(self, game)
        if game.active_item == nil then
          game.msg = self.desc
          game:play_sound("msg")
        elseif game.active_item.name == "key" then
          game.msg = "you unlock the door!"
          game:play_sound("unlock")
          door_locked = false
        else
          game:wrong_item("unlock the door")
        end
      end
    },
    {
      name = "door",
      x = 51,
      y = 33,
      w = 37,
      h = 64,
      desc = "a door leading\nto the outside.\nit's locked.",
      activate = function(self, game)
        if door_locked then
          game.msg = self.desc
          game:play_sound("msg")
        else
          game:navigate("win", "")
          game.win = true
          game:stop_sound("bg_music")
          game:play_sound("title")
        end
      end
    },
    {
      name = "grate",
      x = 8,
      y = 5,
      w = 23,
      h = 23,
      img = utils.load_img("assets/imgs/items/grate.png"),
      activate = function(self, game)
        game:navigate("grate")
      end
    },
    {
      name = "grate_open",
      x = 8,
      y = 5,
      w = 23,
      h = 23,
      img = utils.load_img("assets/imgs/items/grate_open.png"),
      hidden = true,
      activate = function(self, game)
        game:navigate("grate_open")
      end
    },
    {
      name = "grate_lit",
      x = 8,
      y = 5,
      w = 23,
      h = 23,
      img = utils.load_img("assets/imgs/items/grate_open.png"),
      hidden = true,
      activate = function(self, game)
        game:navigate("grate_lit")
      end
    },
    {
      name = "rug",
      x = 39,
      y = 101,
      w = 62,
      h = 9,
      img = utils.load_img("assets/imgs/items/rug.png"),
      activate = function(self, game)
        game.msg = "throwing aside the rug\nreveals a ladder\nleading to a cellar."
        game:scene_toggle_item_hidden("start", self.name)
        game:scene_toggle_item_hidden("start", "hole")
        game:play_sound("rugpull")
      end
    },
    {
      name = "hole",
      x = 47,
      y = 103,
      w = 44,
      h = 5,
      img = utils.load_img("assets/imgs/items/basement_hole.png"),
      activate = function(self, game)
        game:navigate("basement")
      end,
      hidden = true
    },
    {
      name = "color box",
      img = utils.load_img("assets/imgs/items/color_box.png"),
      x = 96,
      y = 84,
      w = 23,
      h = 14,
      img_offset_y = -6,
      activate = function(self, game)
        game:navigate("color_box")
      end
    },
    {
      name = "color box open",
      img = utils.load_img("assets/imgs/items/color_box_open.png"),
      hidden = true,
      x = 96,
      y = 78,
      w = 22,
      h = 21,
      activate = function(self, game)
        game:navigate("color_box_open")
      end
    },
    {
      name = "ears",
      img = utils.load_img("assets/imgs/items/color_box_ears_small.png"),
      x = 104,
      y = 86,
      hidden = true
    },
    pencil
  },
}

-- radio
table.insert(start.items, {
  x = 9,
  y = 57,
  w = 22,
  h = 14,
  activate = function(self, game)
    game:navigate("radio")
  end
})
-- drawer
table.insert(start.items, {
  name = "drawer",
  x = 9,
  y = 73,
  w = 25,
  h = 4,
  activate = function(self, game)
    game:pickup(pencil)
    game:remove_item_from_items(start.items, self.name)
    game.msg = "you find a pencil\nin the drawer."
  end
})

return start
