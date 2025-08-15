local utils = require "utils"
local colors = require "colors"

local basement = {
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
        game:play_sound("msg")
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
          game:play_sound("msg")
        elseif game.active_item.name == "ice block tongs" then
          game:remove_item_from_inventory("ice block tongs")
          game:scene_toggle_item_hidden("basement", self.name)
          game:scene_toggle_item_hidden("basement", "hat")
          game:scene_toggle_item_hidden("basement", "hatpin")
          game.msg = "you remove the brick to\nreveal a lady's hat\nand a hatpin."
          game:play_sound("brickpull")
        else
          game:wrong_item("pull a brick")
        end
      end,
      draw = function(self)
        utils.rectfill(self.x, self.y, self.w + 1, self.h + 1, colors.navy)
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
            game:play_sound("msg")
          elseif game.active_item.name == self.name then
            game:remove_item_from_inventory(self.name)
            game:replace_bulb()
          else
            game:wrong_item("fill an empty\nlight bulb socket")
          end
        end
      end
    },
    {
      name = "hat",
      x = 16,
      y = 95,
      w = 8,
      h = 4,
      weight = 308,
      desc = "keeps the sun out of\nyour eyes, and ever\nso fabulously.",
      img = utils.load_img("assets/imgs/items/hat.png"),
      img_offset_y = -2,
      activate = function(self, game)
        game:pickup(self)
      end,
      hidden = true
    },
    {
      name = "hatpin",
      x = 30,
      y = 93,
      w = 6,
      h = 6,
      weight = 12,
      desc = "long, then, and sharp.",
      img = utils.load_img("assets/imgs/items/hatpin.png"),
      img_offset_y = -1,
      img_offset_x = -1,
      activate = function(self, game)
        game:pickup(self)
      end,
      hidden = true
    }
  }
}

return basement
