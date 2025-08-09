local utils = require "utils"

local pencil = {
  name = "pencil",
  weight = 9,
  desc = "2b or not 2b?\nthat is the pencil.",
  img = utils.load_img("assets/imgs/items/pencil.png"),
  img_offset_y = -2,
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
      desc = [[the door is locked]],
      activate = function(self, game)
        if game.active_item ~= nil then
          ---@diagnostic disable-next-line: undefined-field
          if game.active_item.name == "key" then
            game.msg = "you unlock the door!"
          else
            game:wrong_item("unlock a door")
          end
        else
          game.msg = "the door is locked!"
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
