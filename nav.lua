local utils = require "utils"

local function navigate(dir, game)
  local next = game.current_scene[dir]
  if next ~= nil then
    game:navigate(next)
  end
end

local nav = {
  areas = {
    {
      name = "nav_left",
      dir = "left",
      x = 0,
      y = 16,
      w = 8,
      h = 128 - 32,
      ptr_img = utils.load_img("assets/imgs/nav/nav_left.png"),
      ptr_img_offset_y = -3,
      activate = function(self, game)
        navigate("left", game)
      end
    },
    {
      name = "nav_right",
      dir = "right",
      x = 120,
      y = 16,
      w = 8,
      h = 128 - 32,
      ptr_img = utils.load_img("assets/imgs/nav/nav_right.png"),
      ptr_img_offset_x = -7,
      ptr_img_offset_y = -3,
      activate = function(self, game)
        navigate("right", game)
      end
    },
    {
      name = "nav_back",
      dir = "back",
      x = 16,
      y = 120,
      w = 128 - 32,
      h = 8,
      ptr_img = utils.load_img("assets/imgs/nav/nav_back.png"),
      ptr_img_offset_x = -4,
      ptr_img_offset_y = -7,
      activate = function(self, game)
        navigate("back", game)
      end
    }
  }
}

function nav:hover(ptr, game)
  for _, area in ipairs(self.areas) do
    if game.current_scene[area.dir] and utils.ptr_colliding(ptr, area) then
      game.hovered_item = area
    end
  end
end

function nav:draw_ptr(ptr, game)
  local area = game.hovered_item
  local offset_x = area.ptr_img_offset_x ~= nil and area.ptr_img_offset_x or 0
  local offset_y = area.ptr_img_offset_y ~= nil and area.ptr_img_offset_y or 0
  love.graphics.draw(area.ptr_img, ptr.x + offset_x, ptr.y + offset_y)
end

return nav
