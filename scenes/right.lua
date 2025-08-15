local utils = require "utils"
local colors = require "colors"

local sheet_music_inv = {
  name = "sheet music",
  weight = 33,
  desc = "\"moonlight sonata\"",
  img = utils.load_img("assets/imgs/items/sheet_music_inv.png"),
}

local targets = { 42, 291, 5 } -- bulb, rabbit, pencil
local weight_slots = { {}, {}, {} }
local weight_box_open = false

local function check_weights(game)
  if weight_box_open then return end
  if
      weight_slots[1].weight == targets[1] and
      weight_slots[2].weight == targets[2] and
      weight_slots[3].weight == targets[3]
  then
    game:scene_toggle_item_hidden("right", "binoculars")
    game:scene_toggle_item_hidden("right", "weight box door")
    game:scene_toggle_item_hidden("right", "weight box door open")
    game:play_sound("open")
    weight_box_open = true
  end
end

local function drop_zone_activate(self, game)
  -- item already in drop zone, pick it up
  if weight_slots[self.idx].name ~= nil then
    game:pickup(weight_slots[self.idx])
    weight_slots[self.idx] = {}
  elseif game.active_item == nil then
    game.msg = "a metal plate mounted\nonto a large box with\na door on the front."
    game:play_sound("msg")
  else
    weight_slots[self.idx] = game.active_item
    game:remove_item_from_inventory(game.active_item.name)
    game:play_sound("weightbox_place_item")
  end
  check_weights(game)
end

local function drop_zone_draw(self)
  local item = weight_slots[self.idx]
  if item.img ~= nil then
    local offset_x = item.img_offset_x ~= nil and item.img_offset_x or 0
    local offset_y = item.img_offset_y ~= nil and item.img_offset_y or 0
    love.graphics.draw(item.img, self.x + offset_x + 2, self.y + offset_y - 2)
  end
  utils.print(targets[self.idx], self.x + self.text_offset, self.y - 8, colors.yellow)
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
          game:play_sound("msg")
        elseif game.active_item.name == "binoculars" then
          game.msg = "through the binoculars, you\nsee an airplane flying\na banner advertisement\n\"101.1 krlc\""
          game:play_sound("msg")
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
          game:play_sound("msg")
        elseif game.active_item.name == "sheet music" then
          game:scene_toggle_item_hidden("right", self.name)
          game:scene_toggle_item_hidden("right", "sheet music on stand")
          game:remove_item_from_inventory("sheet music")
          game:play_sound("paper_down")
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
      -- bulb slot
      x = 77,
      y = 67,
      w = 11,
      h = 5,
      idx = 1,
      text_offset = 2,
      activate = drop_zone_activate,
      draw = drop_zone_draw
    },
    {
      -- rabbit slot
      x = 93,
      y = 67,
      w = 11,
      h = 5,
      idx = 2,
      text_offset = 0,
      activate = drop_zone_activate,
      draw = drop_zone_draw
    },
    {
      -- pencil slot
      x = 109,
      y = 67,
      w = 11,
      h = 5,
      idx = 3,
      text_offset = 4,
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
      end,
      hidden = true
    },
    {
      name = "weight box door",
      desc = "the door doesn't budge",
      x = 91,
      y = 80,
      w = 15,
      h = 14,
      img = utils.load_img("assets/imgs/items/weight_box_door_small.png")
    },
    {
      name = "weight box door open",
      x = 83,
      y = 80,
      img = utils.load_img("assets/imgs/items/weight_box_door_open_small.png"),
      hidden = true
    },
    {
      name = "piano lid",
      x = 4,
      y = 53,
      img = utils.load_img("assets/imgs/items/piano_lid.png"),
      hidden = true
    },
    {
      name = "screwdriver",
      x = 26,
      y = 52,
      w = 8,
      h = 8,
      weight = 943,
      desc = "equally useful for\nscrewdriving and\nscrew un-driving.",
      img = utils.load_img("assets/imgs/items/screwdriver.png"),
      activate = function(self, game)
        game:pickup(self)
        game.msg = "the piano tuner must\nhave left a screwdriver\nin there. finders\nkeepers!"
      end,
      hidden = true
    },
    sheet_music_inv,
  }
}

return right
