local colors = {
  light_blue = { 41, 173, 255 },
  white = { 255, 255, 255 },
  black = { 0, 0, 0 },
  orange = { 255, 163, 0 },
  yellow = { 255, 236, 39 },
  red = { 255, 0, 77 },
  navy = { 29, 43, 83 },
  purple = { 126, 37, 83 }
}

-- normalize for love graphics
for _, color in pairs(colors) do
  for i, val in ipairs(color) do
    color[i] = val / 255
  end
end

return colors
