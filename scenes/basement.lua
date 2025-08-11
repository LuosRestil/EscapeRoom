local utils = require "utils"
local colors = require "colors"

local basement = {
  right = "weight_room",
  img = utils.load_img("assets/imgs/scenes/basement.png"),
  items = {
    -- ladder
    {
      x = 48, y = 0, w = 30, h = 98, activate = function(self, game) game:navigate("start") end
    },
    -- dust
    {
      x = 13,
      y = 100,
      w = 32,
      h = 8,
      activate = function(self, game)
        game.msg = "there's some brick dust\non the floor."
      end
    },
    -- loose brick
    {
      name = "loose brick",
      x = 12,
      y = 82,
      w = 34,
      h = 16,
      activate = function(self, game)
        if game.active_item == nil then
          game.msg = "this brick feels a\nlittle loose. i\ncan't move it with\nmy bare hands."
        elseif game.active_item.name == "ice block tongs" then
          game:remove_item_from_inventory("ice block tongs")
          game:scene_toggle_item_hidden("basement", self.name)
          game:scene_toggle_item_hidden("basement", "brick hole")
        else
          game:wrong_item("pull a brick")
        end
      end,
      draw = function(self)
        utils.rectfill(self.x, self.y, self.w + 1, self.h + 1, colors.navy)
      end
    },
    -- hole
    {
      name = "brick hole",
      x = 11,
      y = 82,
      w = 36,
      h = 16,
      hidden = true,
      activate = function(self, game)
        game.msg = "todo: something\nin the hole"
        -- TODO take whatever item
      end
    },
    -- light bulb
    {
      name = "light bulb",
      x = 105,
      y = 12,
      w = 8,
      h = 8,
      weight = 42,
      desc = "in case you have\na bright idea.",
      img = utils.load_img("assets/imgs/items/bulb.png"),
      activate = function(self, game)
        if not game.bulb_taken then
          game:pickup(self, false)
          game:take_bulb()
        else
          if game.active_item == nil then
            game.msg = "an empty light bulb socket"
          elseif game.active_item.name == self.name then
            game:remove_item_from_inventory(self.name)
            game:replace_bulb()
          else
            game:wrong_item("fill an empty\nlight bulb socket")
          end
        end
      end
    },
  }
}

return basement
