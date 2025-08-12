local utils = require "utils"

local sheet_music_inv = {
  name = "sheet music",
  weight = 33,
  desc = "\"moonlight sonata\"",
  img = utils.load_img("assets/imgs/items/sheet_music_inv.png"),
}

local right = {
  left = "start",
  img = utils.load_img("assets/imgs/scenes/right.png"),
  items = {
    {
      name = "window",
      x = 9,
      y = 14,
      w = 35,
      h = 36,
      activate = function(self, game)
        if game.active_item == nil then
          game.msg = "such a lovely day\noutside. what a shame\nyou're trapped in here."
        elseif game.active_item.name == "binoculars" then
          game.msg =
          "through the binoculars, you\nsee the banner is an \nadvertisement for a radio\nstation, \"101.1 krlc\"" --TODO full text
        else
          game:wrong_item("")
          game.msg = "i'm not sure what that\nwould accomplish."
        end
      end
    },
    {
      name = "piano",
      x = 9,
      y = 76,
      w = 45,
      h = 8,
      activate = function(self, game)
        game:navigate("piano")
      end
    },
    {
      name = "piano bench",
      x = 18,
      y = 89,
      w = 27,
      h = 3,
      activate = function(self, game)
        game:pickup(sheet_music_inv)
        game.msg = "you found sheet music\nin the piano bench.\n\"moonlight sonata\""
        game:remove_item_from_scene("right", self.name)
      end
    },
    {
      name = "music stand",
      x = 17,
      y = 66,
      w = 30,
      h = 9,
      activate = function(self, game)
        if game.active_item == nil then
          game.msg = "a place to put\nsheet music."
        elseif game.active_item.name == "sheet music" then
          game:scene_toggle_item_hidden("right", self.name)
          game:scene_toggle_item_hidden("right", "sheet music on stand")
          game:remove_item_from_inventory("sheet music")
        else
          game:wrong_item("")
          game.msg = "that doesn't go there"
        end
      end
    },
    {
      name = "sheet music on stand",
      x = 17,
      y = 66,
      w = 30,
      h = 9,
      img = utils.load_img("assets/imgs/items/sheet_music_piano.png"),
      activate = function(self, game)
        game:pickup(sheet_music_inv)
        game:scene_toggle_item_hidden("right", self.name)
        game:scene_toggle_item_hidden("right", "music stand")
      end,
      hidden = true
    },
    sheet_music_inv
  }
}

return right
