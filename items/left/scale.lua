local scale = {
  name = "scale",
  x = 56,
  y = 56,
  w = 22,
  h = 48,
  desc = "",
  activate = function(self, game)
    local weight = 62000 + game:inv_weight()
    if game.active_item ~= nil and game.active_item.weight ~= nil then
      weight = game.active_item.weight
    end
    game.msg = "the readout says: " .. weight .. "g."
  end
}

return scale
