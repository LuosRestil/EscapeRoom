local scene_metatable = require "scenes.scene"
local item_metatable = require "items.item"
local start = require "scenes.start"
local left = require "scenes.left"
local right = require "scenes.right"
local grate = require "scenes.grate"
local grate_open = require "scenes.grate_open"

local scenes = {
  start = start,
  left = left,
  right = right,
  grate = grate,
  grate_open = grate_open
}

for _, scene in pairs(scenes) do
  setmetatable(scene, { __index = scene_metatable })
  for _, item in ipairs(scene.items) do
    setmetatable(item, { __index = item_metatable })
  end
end

return scenes
