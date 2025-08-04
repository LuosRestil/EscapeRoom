local ptr = require "ptr"
local nav = require "nav"
local inv_btn = require "inv_btn"
local inv = require "inventory"
local dialog = require "dialog"
local scenes = require "scenes"
local utils = require "utils"
local colors = require "colors"

local NAV_AREAS = { "nav_left", "nav_right", "nav_back" }

local game = {}
game.hovered_item = nil
game.inv_open = false
game.msg = nil
game.debug_mode = false
game.mouse_mode = false

--measuring stuff with the mouse in debug mode
game.dragging = false
game.drag_start = nil
game.drag_end = nil

function game:update()
  self.hovered_item = nil
  if self.inv_open then return end

  local moved = ptr:update()
  if moved then self.msg = nil end
  self.current_scene:hover(ptr, self)
  nav:hover(ptr, self)
  inv_btn:hover(ptr, self)
end

function game:draw()
  self.current_scene:draw()

  if self.inv_open then
    inv:draw()
  else
    inv_btn:draw(self)

    -- ptrs
    if self.hovered_item ~= nil and utils.list_contains(NAV_AREAS, self.hovered_item.name) then
      -- nav ptr
      nav:draw_ptr(ptr, game)
    elseif self.active_item ~= nil then
      -- item ptr
      self.active_item:draw_ptr(ptr, self.hovered_item ~= nil and self.hovered_item ~= inv_btn)
    elseif self.hovered_item ~= inv_btn then -- normal ptr
      -- normal ptr
      if self.hovered_item == nil then
        ptr:draw_s()
      else
        ptr:draw_l()
      end
    end

    if self.msg ~= nil then
      dialog:draw(self.msg)
    end

    if self.debug_mode then
      love.graphics.setColor(255, 0, 0);
      for _, item in ipairs(self.current_scene.items) do
        love.graphics.rectangle("line", item.x, item.y, item.w, item.h)
      end
      love.graphics.setColor(0, 255, 100)
      for _, area in ipairs(nav.areas) do
        love.graphics.rectangle("line", area.x, area.y, area.w, area.h)
      end
      love.graphics.setColor(colors.yellow)
      love.graphics.print(ptr.x .. ":" .. ptr.y)
      if game.drag_start ~= nil and game.drag_end ~= nil then
        local w, h = game.drag_end.x - game.drag_start.x, game.drag_end.y - game.drag_start.y
        love.graphics.setColor(colors.pink)
        love.graphics.rectangle("line", game.drag_start.x, game.drag_start.y, w, h)
        love.graphics.setColor(colors.orange)
        love.graphics.print("x=" ..
          game.drag_start.x ..
          ",y=" .. game.drag_start.y ..
          " w=" .. game.drag_end.x - game.drag_start.x .. ",h=" .. game.drag_end.y - game.drag_start.y, 25, 0)
      end
      love.graphics.setColor(1, 1, 1, 1)
    end
  end
end

function game:keypressed(key, scancode, is_repeat)
  if scancode == "d" then
    self.debug_mode = not self.debug_mode
  end
  if scancode == "m" then
    self.mouse_mode = not self.mouse_mode
  end

  if self.inv_open then
    if scancode == "left" and inv.selected_idx > 1 then
      inv.selected_idx = inv.selected_idx - 1
    end
    if scancode == "right" and inv.selected_idx < 10 then
      inv.selected_idx = inv.selected_idx + 1
    end
    if scancode == "z" then
      self.active_item = inv.items[inv.selected_idx]
      self:close_inv()
    end
    if scancode == "x" then
      self.active_item = nil
      self:close_inv()
    end
  else
    if scancode == "x" then self.msg = nil end
    if self.hovered_item ~= nil and scancode == "z" and not is_repeat then
      self.hovered_item:activate(self)
      self.active_item = nil
    end
  end
end

function game:open_inv()
  game.inv_open = true
  -- sfx(4)
  game.hovered_item = nil
end

function game:close_inv()
  self.inv_open = false
  ptr.x = inv.x + (inv.selected_idx - 1) * 11 + 6
  ptr.y = inv.by + 6
end

function game:remove_item_from_inventory(item_name)
  for i, item in ipairs(inv.items) do
    if item.name == item_name then
      table.remove(inv.items, i)
      return
    end
  end
end

function game:navigate(scene_name)
  self.current_scene = scenes[scene_name]
  ptr.x, ptr.y = 64, 64
  self.hovered_item = nil
  self.active_item = nil
end

function game:wrong_item(action)
  --sfx(0)
  self.msg = "you can't " .. action .. "\nwith a " .. self.active_item.name
end

function game:pickup(item)
  -- sfx(1)
  table.insert(inv.items, item)
  local scene_items = self.current_scene.items
  game:remove_item_from_items(self.current_scene.items, item.name)
  self.msg = "got " .. item.name .. "!"
end

function game:remove_item_from_items(items, item_name)
  for i, item in ipairs(items) do
    if item.name == item_name then
      table.remove(items, i)
      return
    end
  end
end

function game:remove_item_from_scene(scene_name, item_name)
  for name, scene in pairs(scenes) do
    if name == scene_name then
      game:remove_item_from_items(scene.items, item_name)
    end
  end
end

function game:inv_weight()
  local weight = 0
  for _, item in ipairs(inv.items) do
    weight = weight + item.weight
  end
  return weight
end

function game:scene_toggle_item_hidden(scene_name, item_name)
  for name, scene in pairs(scenes) do
    if name == scene_name then
      for _, item in ipairs(scene.items) do
        if item.name == item_name then
          if item.hidden == nil then item.hidden = false end
          item.hidden = not item.hidden
        end
      end
    end
  end
end

function game:handle_mouse(scale)
  local game_x, game_y = math.floor(love.mouse.getX() / scale), math.floor(love.mouse.getY() / scale)
  ptr:set(game_x, game_y)
  if love.mouse.isDown(1) then
    if not game.dragging then
      game.dragging = true
      game.drag_end = nil
      game.drag_start = { x = game_x, y = game_y }
    else
      game.drag_end = { x = game_x, y = game_y }
    end
  else
    if game.dragging then
      game.dragging = false
    end
  end
end

return game
