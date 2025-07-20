local grate = {
  name = "grate",
  x = 5,
  y = 5,
  w = 23,
  h = 23,
  desc = "something's rattling\naround in there...",
}

function grate:activate(game)
  game:navigate("grate")
end

return grate
