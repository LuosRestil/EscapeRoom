local sheet_music_inv = require "items.right.sheet_music_inv"
local bathroom_key = require "items.right.bathroom_key"
local utils = require "utils"

local books = {
  -- top shelf
  { x = 73,  y = 22, w = 4, h = 14, desc = "the cadbury tales" },
  { x = 78,  y = 20, w = 5, h = 16, desc = "incorrect trivia vol. 2" },
  { x = 84,  y = 24, w = 2, h = 12, desc = "the end-bulbs of krause" },
  { x = 87,  y = 23, w = 3, h = 13, desc = "doby mick" },
  { x = 91,  y = 21, w = 2, h = 15, desc = "how to drain your dragon" },
  { x = 94,  y = 23, w = 1, h = 13, desc = "my life - sleve mcdichael" },
  { x = 96,  y = 27, w = 2, h = 9,  desc = "the little book of snails" },
  { x = 99,  y = 24, w = 3, h = 12, desc = "the invincible sponge" },
  { x = 103, y = 22, w = 4, h = 14, desc = "fun with lying" },
  { x = 108, y = 20, w = 4, h = 16, desc = "the big book of snails" },
  { x = 113, y = 24, w = 2, h = 12, desc = "cooking with ogg" },
  -- middle shelf
  { x = 73,  y = 44, w = 2, h = 17, desc = "how to finish anyth..." },
  { x = 76,  y = 49, w = 1, h = 12, desc = "book titles for dummies" },
  { x = 78,  y = 46, w = 3, h = 15, desc = "for whom the belt holes" },
  { x = 82,  y = 49, w = 2, h = 12, desc = "the ill lad" },
  { x = 85,  y = 51, w = 2, h = 10, desc = "the oddish sea" },
  { x = 88,  y = 47, w = 4, h = 14, desc = "the alphabet pt. 2" },
  { x = 93,  y = 43, w = 2, h = 18, desc = "the dogan" },
  { x = 96,  y = 45, w = 2, h = 16, desc = "anna karmina burana" },
  { x = 99,  y = 46, w = 3, h = 15, desc = "birds and other lies" },
  { x = 103, y = 52, w = 3, h = 9,  desc = "cream and pastryment" },
  { x = 107, y = 48, w = 3, h = 13, desc = "the bobbitt" },
  { x = 111, y = 45, w = 2, h = 16, desc = "jude the obnoxious" },
  { x = 114, y = 47, w = 1, h = 14, desc = "ethics for toddlers" },
  --lower shelf
  { x = 73,  y = 69, w = 3, h = 15, desc = "all about coffee tables" },
  { x = 77,  y = 71, w = 4, h = 13, desc = "the jelloship of the ring mold" },
  { x = 82,  y = 69, w = 4, h = 15, desc = "the cherry pies of windsor" },
  { x = 87,  y = 67, w = 3, h = 17, desc = "speling is eesy" },
  { x = 91,  y = 71, w = 4, h = 13, desc = "whales are fish too" },
  { x = 96,  y = 68, w = 2, h = 16, desc = "your microwave is listening" },
  { x = 99,  y = 70, w = 2, h = 14, desc = "gary podder" },
  { x = 102, y = 72, w = 1, h = 12, desc = "the chronicles of arby's" },
  { x = 104, y = 68, w = 4, h = 16, desc = "not a secret hiding spot" },
  { x = 109, y = 70, w = 1, h = 14, desc = "space jelly" },
  { x = 111, y = 74, w = 3, h = 10, desc = "mein harumph" },
  { x = 115, y = 68, w = 1, h = 16, desc = "the hunchback of scuzz holler" },
}

local left = {
  left = "kitchen",
  right = "start",
  img = utils.load_img("assets/imgs/scenes/bookshelf_room.png"),
  door_locked = true,
  paper_on_floor = false,
  key_pushed = false,
  items = {
    -- scale, secret_door_closed, secret_door_open, pressure_plate,
    { x = 100, y = 100, w = 15, h = 15, desc = "shitfuck" }
  }
}

for _, book in ipairs(books) do
  table.insert(left.items, book)
end

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
          game.msg = "if you do that now\nyou won't be able\nto reach what\nfalls out."
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
