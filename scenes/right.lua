local sheet_music_inv = require "items.right.sheet_music_inv"
local utils = require "utils"

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

-- sheet music
table.insert(right.items, {
  name = "sheet music piano",
  x = 17,
  y = 66,
  w = 30,
  h = 9,
  img = utils.load_img("assets/imgs/items/sheet_music_piano.png"),
  activate = function(self, game)
    game:pickup(sheet_music_inv)
    game:remove_item_from_items(right.items, self.name)
  end
})

return right
