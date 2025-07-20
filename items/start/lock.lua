local lock = {
  name = "lock",
  x = 80,
  y = 60,
  w = 6,
  h = 15,
  desc = [[the door is locked]],
}

function lock:activate(game)
  if game.active_item ~= nil then
    ---@diagnostic disable-next-line: undefined-field
    if game.active_item.name == "key" then
      game.msg = "you unlock the door!"
    else
      game:wrong_item("unlock a door")
    end
  else
    game.msg = "the door is locked!"
  end
end

return lock
