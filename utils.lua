local colors = require "colors"
local gfx = love.graphics

local utils = {}

function utils.load_img(path)
  local img = gfx.newImage(path)
  img:setFilter("nearest", "nearest")
  return img
end

function utils.clamp(val, low, high)
  if val < low then
    return low
  elseif val > high then
    return high
  else
    return val
  end
end

function utils.ptr_colliding(ptr, item)
  return ptr.x >= item.x and
      ptr.x <= item.x + item.w and
      ptr.y >= item.y and
      ptr.y <= item.y + item.h
end

function utils.list_contains(list, item)
  for _, entry in ipairs(list) do
    if entry == item then return true end
  end
  return false
end

function utils.print_table(t)
  print("{")
  for k, v in pairs(t) do
    if utils.list_contains({ "function", "userdata", "boolean" }, type(v)) then
      print("\t" .. k .. ": " .. v)
    end
  end
  print("}")
end

function utils.split_lines(text)
  local lines = {}
  for line in string.gmatch(text, "([^\n]+)") do
    table.insert(lines, line)
  end
  return lines
end

function utils.rectfill(x, y, w, h, color)
  color = color ~= nil and color or colors.white
  gfx.setColor(color)
  gfx.rectangle("fill", x, y, w, h)
  gfx.setColor(colors.white)
end

function utils.rect(x, y, w, h, color, line_width)
  color = color ~= nil and color or colors.white
  line_width = line_width ~= nil and line_width or 1
  local offset = line_width / 2
  gfx.setColor(color)
  gfx.setLineWidth(line_width)
  gfx.rectangle("line", x + offset, y + offset, w, h)
  gfx.setLineWidth(1)
  gfx.setColor(colors.white)
end

function utils.print(text, x, y, color)
  color = color ~= nil and color or colors.white
  gfx.setColor(color)
  gfx.print(text, x, y)
  gfx.setColor(colors.white)
end

return utils
