local utils = require "utils"
local colors = require "colors"

-- local static = load sound static
-- local song = load sound song

local solution = utils.map(utils.split_str("krlc"), string.byte)
local naughty_words = { "shit", "fuck", "dick", "cunt" }
local naughty_asciis = utils.map(
  naughty_words,
  function(word)
    return utils.map(utils.split_str(word), string.byte)
  end
)

local radio = {
  back = "start",
  img = utils.load_img("assets/imgs/scenes/radio.png"),
  on = false,
  -- sound = static,
  -- ascii, 32 (space) 97-122 (a-z)
  code = { 32, 32, 32, 32 },
  items = {
    -- buttons
    { x = 10, y = 55, idx = 1 },
    { x = 30, y = 55, idx = 2 },
    { x = 50, y = 55, idx = 3 },
    { x = 70, y = 55, idx = 4 },
    -- power
    {
      x = 97,
      y = 56,
      w = 15,
      h = 15,
      activate = function(self, game)
        if self.on then
          -- play song
        else
          -- stop song
        end
        self.on = not self.on
      end
    }
  },
  check_code = function(self, game)
    local is_solution = true
    local naughties = {}
    for _ = 1, #naughty_asciis do table.insert(naughties, true) end
    for i = 1, #solution do
      if self.code[i] ~= solution[i] then is_solution = false end
      for j, ascii in ipairs(naughty_asciis) do
        if self.code[i] ~= ascii[i] then naughties[j] = false end
      end
    end
    for _, naughty in ipairs(naughties) do
      if naughty then game.msg = "naughty..." end
    end
    if is_solution then game.msg = "sound changed to song" end
  end
}

local function activate(self, game)
  assert(radio.code ~= nil)
  radio.code[self.idx] = radio.code[self.idx] + 1
  if radio.code[self.idx] == 33 then radio.code[self.idx] = 97 end
  if radio.code[self.idx] == 123 then radio.code[self.idx] = 32 end
  radio:check_code(game)
end

local function draw(self)
  love.graphics.push()
  love.graphics.scale(3, 3)
  love.graphics.setColor(colors.lime)
  love.graphics.print(string.char(radio.code[self.idx]), self.x / 3 + 1.333, self.y / 3 + 0.333)
  love.graphics.setColor(1, 1, 1)
  love.graphics.pop()
end

for i = 1, 4 do
  local item = radio.items[i]
  item.activate, item.draw, item.w, item.h = activate, draw, 17, 17
end

return radio
