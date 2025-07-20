local colors = require "colors"
local utils = require "utils"

local dialog = {}

local gfx = love.graphics

function dialog:draw(text)
  local lines = utils.split_lines(text)
  local longest = 0
  for _, line in ipairs(lines) do
    if #line > longest then
      longest = #line
    end
  end

  local w = (longest) * 4
  local h = #lines * 6
  local padx = math.floor((128 - w) / 2)
  local pady = math.floor((128 - h) / 2)
  --border
  gfx.setColor(colors.white)
  gfx.rectangle("fill", padx-3, pady-3, w + 5, h + 5)
  --background
  gfx.setColor(colors.light_blue)
  gfx.rectangle("fill", padx-2, pady-2, w+3, h+3)

  --text
  utils.print(text, padx, pady, colors.black)
end

return dialog
