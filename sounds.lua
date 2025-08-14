local sounds = {
  bg_music = love.audio.newSource("assets/audio/bg_music.wav", "stream"),
  inv_close = love.audio.newSource("assets/audio/sfx/inv_close.wav", "static"),
  inv_move = love.audio.newSource("assets/audio/sfx/inv_move.wav", "static"),
  inv_open = love.audio.newSource("assets/audio/sfx/inv_open.wav", "static"),
  inv_select = love.audio.newSource("assets/audio/sfx/inv_select.wav", "static"),
  pickup = love.audio.newSource("assets/audio/sfx/pickup.wav", "static"),
  no = love.audio.newSource("assets/audio/sfx/no.wav", "static"),
  nav = love.audio.newSource("assets/audio/sfx/nav.wav", "static"),
  rugpull = love.audio.newSource("assets/audio/sfx/rugpull.wav", "static"),
  btn_click = love.audio.newSource("assets/audio/sfx/color_box_btn.wav", "static"),
  open = love.audio.newSource("assets/audio/sfx/open.wav", "static"),
  brickpull = love.audio.newSource("assets/audio/sfx/brickpull.wav", "static")
}

sounds.bg_music:setLooping(true)

return sounds