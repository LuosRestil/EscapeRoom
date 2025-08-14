local game = require "game"
local display = require "display"

local font
local framerate = 1 / 60
local frametime = 0

function love.load()
  display:update_scale()
  love.graphics.setDefaultFilter("nearest", "nearest")
  font = love.graphics.newFont("assets/fonts/PICO-8/PICO-8.ttf", 5)
  font:setLineHeight(1.125)
  love.graphics.setFont(font)
  game:navigate("start", "")
  love.mouse.setVisible(false)
  game:play_sound("bg_music")
end

function love.update(dt)
  frametime = frametime + dt
  if frametime >= framerate then
    frametime = frametime - framerate
    game:update()

    if game.mouse_mode then
      game:handle_mouse(display.scale)
    end
  end
end

function love:draw()
  love.graphics.push()
  -- love.graphics.translate(display.offset_x, display.offset_y)
  love.graphics.scale(display.scale)

  game:draw()

  love.graphics.pop()
end

function love.resize()
  display:update_scale()
end

function love.keypressed(key, scancode, is_repeat)
  game:keypressed(key, scancode, is_repeat)
end
