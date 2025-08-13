local utils = require "utils"
local colors = require "colors"

local sheet_music_inv = {
  name = "sheet music",
  weight = 33,
  desc = "\"moonlight sonata\"",
  img = utils.load_img("assets/imgs/items/sheet_music_inv.png"),
}

local weight_slots = { {}, {}, {} }

local function drop_zone_activate(self, game)
  -- item already in drop zone, pick it up
  if weight_slots[self.idx].name ~= nil then
    game:pickup(weight_slots[self.idx])
    weight_slots[self.idx] = {}
  elseif game.active_item == nil then
    game.msg = "a metal plate mounted\nonto a large box with\na door on the front."
  else
    weight_slots[self.idx] = game.active_item
    game:remove_item_from_inventory(game.active_item.name)
  end
end

local function drop_zone_draw(self)
  local item = weight_slots[self.idx]
  if item.img ~= nil then
    local offset_x = item.img_offset_x ~= nil and item.img_offset_x or 0
    local offset_y = item.img_offset_y ~= nil and item.img_offset_y or 0
    love.graphics.draw(item.img, self.x + offset_x + 2, self.y + offset_y - 2)
  end
  local text_offset_x = 2
  if self.target > 99 then text_offset_x = 0 end
  utils.print(self.target, self.x + text_offset_x, self.y - 8, colors.yellow)
end

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
          game.msg = "through the binoculars, you\nsee an airplane flying\na banner advertisement\n\"101.1 krlc\""
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
    -- drop zones
    {
      x = 77,
      y = 67,
      w = 11,
      h = 5,
      idx = 1,
      target = 42, -- light bulb
      activate = drop_zone_activate,
      draw = drop_zone_draw
    },
    {
      x = 93,
      y = 67,
      w = 11,
      h = 5,
      idx = 2,
      target = 290, -- rabbit
      activate = drop_zone_activate,
      draw = drop_zone_draw
    },
    {
      x = 109,
      y = 67,
      w = 11,
      h = 5,
      idx = 3,
      target = 67,
      activate = drop_zone_activate,
      draw = drop_zone_draw
    },
    {
      name = "binoculars",
      x = 96,
      y = 83,
      w = 4,
      h = 7,
      weight = 2023,
      desc = "look through the small end",
      img = utils.load_img("assets/imgs/items/binoculars.png"),
      img_offset_x = -1,
      img_offset_y = -1,
      activate = function(self, game)
        game:pickup(self)
      end
    },
    sheet_music_inv,
  }
}

return right
