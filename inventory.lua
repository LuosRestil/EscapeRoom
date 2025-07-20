local colors = require "colors"
local utils = require "utils"

local inventory = {
  w = 110,
  h = 19,
  x = 7,
  y = 1,
  by = 9, --y of boxes
  selected_idx = 1,
  items = {}
}

function inventory:draw()
  --bg
  utils.rectfill(self.x, self.y, self.w, self.h, colors.black)
  --border
  utils.rect(self.x, self.y, self.w, self.h)
  --boxes
  for i = 0, 9 do
    local bx = self.x + i * 11
    utils.rect(bx, self.by, 11, 11)
  end
  --header
  utils.print("inventory", self.x + 2, self.y + 2)
  --items
  for i, item in ipairs(self.items) do
    local ix = self.x + (i - 1) * 11 + 2
    love.graphics.draw(item.img, ix, self.by + 2)
  end
  --highlight
  local hx = self.x + (self.selected_idx - 1) * 11
  utils.rect(hx, self.by, 11, 11, colors.orange)
  --item detail window
  local item = self.items[self.selected_idx]
  if item == nil then return end
  local desc_lines = #utils.split_lines(item.desc)
  local item_detail_height = (desc_lines + 1) * 5 + desc_lines + 5
  local item_detail_y = self.by + 11
  --bg
  utils.rectfill(self.x, item_detail_y, self.w, item_detail_height, colors.black)
  --border
  utils.rect(self.x, item_detail_y, self.w, item_detail_height, colors.white)
  --name
  utils.print(item.name, self.x + 2, item_detail_y + 2)
  --desc
  utils.print(item.desc, self.x + 2, item_detail_y + 10)
  --highlight again...
  utils.rect(hx, self.by, 11, 11, colors.orange)
end



return inventory
