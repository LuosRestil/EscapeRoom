local display = {
  virtual_w = 128,
  virtual_h = 128,
  scale = 1,
  -- offset_x = 0,
  -- offset_y = 0
}

function display:update_scale()
  local window_width, window_height = love.graphics.getDimensions()
  self.scale = math.floor(math.min(window_width / self.virtual_w, window_height / self.virtual_h))
  -- self.offset_x = math.floor((window_width - self.virtual_w * self.scale) / 2)
  -- self.offset_y = math.floor((window_height - self.virtual_h * self.scale) / 2)
end

return display