local utils = require "utils"

local grate_open = {
  back = "start",
  img = utils.load_img("assets/imgs/scenes/grate_open.png"),
  items = {
    {
      x = 35,
      y = 36,
      w = 57,
      h = 56,
      activate = function(self, game)
        if game.active_item == nil then
          game.msg = "it's too dark to\nsee anything."
          game:play_sound("msg")
          return
        end
        if game.active_item.name == "matches" then
          game:navigate("grate_lit", "match")
          game:scene_toggle_item_hidden("start", "grate_open")
          game:scene_toggle_item_hidden("start", "grate_lit")
          game:remove_item_from_inventory("matches")
          return
        end
        game:wrong_item("get back there")
      end
    }
  }
}

return grate_open
