local display = {
  virtual_w = 128,
  virtual_h = 128,
  scale = 1,
}

function display:update_scale()
  local window_width, window_height = love.graphics.getDimensions()
  self.scale = math.floor(math.min(window_width / self.virtual_w, window_height / self.virtual_h))
end

return display