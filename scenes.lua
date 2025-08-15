local scene_metatable = require "scenes.scene"
local item_metatable = require "items.item"
local start = require "scenes.start"
local left = require "scenes.left"
local right = require "scenes.right"
local grate = require "scenes.grate"
local grate_open = require "scenes.grate_open"
local grate_lit = require "scenes.grate_lit"
local color_box = require "scenes.color_box"
local color_box_open = require "scenes.color_box_open"
local radio = require "scenes.radio"
local piano = require "scenes.piano"
local bathroom = require "scenes.bathroom"
local basement = require "scenes.basement"
local kitchen = require "scenes.kitchen"
local win = require "scenes.win"

local scenes = {
  start = start,
  left = left,
  right = right,
  grate = grate,
  grate_open = grate_open,
  grate_lit = grate_lit,
  color_box = color_box,
  color_box_open = color_box_open,
  radio = radio,
  piano = piano,
  bathroom = bathroom,
  basement = basement,
  kitchen = kitchen,
  win = win
}

for _, scene in pairs(scenes) do
  setmetatable(scene, { __index = scene_metatable })
  for _, item in ipairs(scene.items) do
    setmetatable(item, { __index = item_metatable })
  end
end

return scenes
