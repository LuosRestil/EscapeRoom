local utils = require "utils"

local start = {
  back = "start",
  img = utils.load_img("assets/imgs/scenes/grate.png"),
  items = {}
}

local screw_locs = { { x = 2, y = 2 }, { x = 2, y = 121 }, { x = 121, y = 121 } }
for _, screw_loc in ipairs(screw_locs) do
  table.insert(start.items, {
    x = screw_loc.x,
    y = screw_loc.y,
    w = 5,
    h = 5,
    activate = function(self, game)
      if game.active_item ~= nil then
        if game.active_item.name == "screwdriver" then
          game:navigate("grate_open")
        else
          game:wrong_item("turn a screw")
        end
      else
        game.msg = [[the grate is held closed with
screws. you hear something
rattling around inside.]]
      end
    end
  })
end

return start
