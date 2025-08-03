local utils = require "utils"

local solution = { 7, 10, 3, 7 }

local piano = {
  back = "right",
  img = utils.load_img("assets/imgs/scenes/piano.png"),
  code = { 0, 0, 0, 0 },
  items = {
    -- c
    { x = 2,   y = 64, w = 10, h = 35, sound = love.audio.newSource("assets/audio/piano/1.wav", "static"),  idx = 1 },
    -- c#
    { x = 15,  y = 36, w = 9,  h = 28, sound = love.audio.newSource("assets/audio/piano/2.wav", "static"),  idx = 2 },
    -- d
    { x = 20,  y = 64, w = 17, h = 35, sound = love.audio.newSource("assets/audio/piano/3.wav", "static"),  idx = 3 },
    -- d#
    { x = 33,  y = 36, w = 9,  h = 28, sound = love.audio.newSource("assets/audio/piano/4.wav", "static"),  idx = 4 },
    -- e
    { x = 38,  y = 64, w = 17, h = 35, sound = love.audio.newSource("assets/audio/piano/5.wav", "static"),  idx = 5 },
    -- f
    { x = 56,  y = 64, w = 17, h = 35, sound = love.audio.newSource("assets/audio/piano/6.wav", "static"),  idx = 6 },
    -- f#
    { x = 69,  y = 36, w = 9,  h = 28, sound = love.audio.newSource("assets/audio/piano/7.wav", "static"),  idx = 7 },
    -- g
    { x = 74,  y = 64, w = 17, h = 35, sound = love.audio.newSource("assets/audio/piano/8.wav", "static"),  idx = 8 },
    -- g#
    { x = 87,  y = 36, w = 9,  h = 28, sound = love.audio.newSource("assets/audio/piano/9.wav", "static"),  idx = 9 },
    -- a
    { x = 92,  y = 64, w = 17, h = 35, sound = love.audio.newSource("assets/audio/piano/10.wav", "static"), idx = 10 },
    -- a#
    { x = 105, y = 36, w = 9,  h = 28, sound = love.audio.newSource("assets/audio/piano/11.wav", "static"), idx = 11 },
    -- b
    { x = 110, y = 64, w = 17, h = 35, sound = love.audio.newSource("assets/audio/piano/12.wav", "static"), idx = 12 },
  },
  check_code = function(self, game)
    local is_solution = true
    for i = 1, #solution do
      if self.code[i] ~= solution[i] then is_solution = false end
    end
    if is_solution then
      game.msg = "solved piano!"
    end
  end
}

local function activate(self, game)
  for _, item in ipairs(piano.items) do
    item.sound:stop()
  end
  self.sound:play()
  table.remove(piano.code, 1)
  table.insert(piano.code, self.idx)
  piano:check_code(game)
end

for _, item in ipairs(piano.items) do
  item.activate = activate;
end


return piano
