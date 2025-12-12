local sounds = {
  bg_music = love.audio.newSource("assets/audio/bg_music.wav", "stream"),
  title = love.audio.newSource("assets/audio/title.ogg", "stream"),
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
  brickpull = love.audio.newSource("assets/audio/sfx/brickpull.wav", "static"),
  weightbox_place_item = love.audio.newSource("assets/audio/sfx/weightbox_place_item.wav", "static"),
  open_grate = love.audio.newSource("assets/audio/sfx/open_grate.wav", "static"),
  match = love.audio.newSource("assets/audio/sfx/match.wav", "static"),
  paper_down = love.audio.newSource("assets/audio/sfx/paper_down.wav", "static"),
  push_key = love.audio.newSource("assets/audio/sfx/push_key.wav", "static"),
  msg = love.audio.newSource("assets/audio/sfx/msg.wav", "static"),
  unlock = love.audio.newSource("assets/audio/sfx/unlock.wav", "static"),
  static = love.audio.newSource("assets/audio/radio/static.ogg", "stream"),
  piano_bg_music = love.audio.newSource("assets/audio/radio/song.ogg", "stream")
}

sounds.bg_music:setLooping(true)
sounds.title:setLooping(true)
sounds.title:setVolume(0.15)
sounds.static:setLooping(true)
sounds.static:setVolume(0.4)
sounds.piano_bg_music:setLooping(true)
sounds.piano_bg_music:setVolume(0.3)

return sounds
