local sheet_music_inv = require "items.right.sheet_music_inv"
local bathroom_key = require "items.right.bathroom_key"
local utils = require "utils"
-- local secret_door_open = require "items/left/secret_door_open"
-- local secret_door_closed = require "items/left/secret_door_closed"
-- local scale = require "items/left/scale"
-- local pressure_plate = require "items/left/pressure_plate"



local left = {
  right = "start",
  img = utils.load_img("assets/imgs/scenes/bookshelf_room.png"),
  door_locked = true,
  paper_on_floor = false,
  key_pushed = false,
  items = {
    -- scale, secret_door_closed, secret_door_open, pressure_plate,
  }
}

local paper_img = utils.load_img("assets/imgs/items/sheet_music_piano.png")
local paper_on_floor = {
  name = "paper on floor",
  x = 21,
  y = 99,
  w = 30,
  h = 3,
  img = paper_img,
  activate = function(self, game)
    game:remove_item_from_scene("left", self.name)
    left.paper_on_floor = false
    if left.key_pushed then
      game:pickup(bathroom_key)
    else
      game:pickup(sheet_music_inv)
    end
  end,
}
paper_on_floor.quad = love.graphics.newQuad(
  0,
  6,
  paper_on_floor.w,
  paper_on_floor.h,
  paper_on_floor.img
)
paper_on_floor.draw = function(self)
  love.graphics.draw(self.img, self.quad, self.x, self.y)
end

-- lock (must come before door, as hitboxes overlap)
table.insert(left.items, {
  name = "bathroom lock",
  x = 44,
  y = 60,
  w = 3,
  h = 13,
  activate = function(self, game)
    -- empty handed
    if game.active_item == nil then
      if left.key_pushed then
        game.msg = "you peep through the\nkeyhole into what\nappears to be a\nbathroom."
      else
        game.msg = "you try to look\nthrough the keyhole\nbut something is\nblocking it from\nthe other side."
      end
    else -- holding an item
      if game.active_item.name == "pencil" then
        if left.paper_on_floor then
          left.key_pushed = true
          game.msg = "you push the object\nout of the keyhole\nand it falls onto\nthe sheet music below."
          game:remove_item_from_inventory("pencil")
        else
          game.msg = "if you do that now\nyou'll won't be able\nto reach it when\nit falls out."
        end
      elseif game.active_item.name == "bathroom key" then
        left.door_locked = false
        game.msg = "you unlock the door."
        game:remove_item_from_inventory("bathroom key")
        game:remove_item_from_scene("left", self.name)
      else
        game.msg = "that doesn't fit in\nthe keyhole."
      end
    end
  end
})

-- door
table.insert(left.items, {
  x = 15,
  y = 34,
  w = 36,
  h = 64,
  activate = function(self, game)
    if not left.door_locked then
      game:navigate("bathroom")
      return
    end

    if game.active_item == nil then
      game.msg = "the door is locked"
    elseif game.active_item.name == "sheet music" then
      game:remove_item_from_inventory("sheet music")
      left.paper_on_floor = true
      table.insert(left.items, paper_on_floor)
    else
      game.msg = "you rub the " .. game.active_item.name .. "\non the door.\n\"open sesame!\"\nit doesn't work."
    end
  end
})

return left
