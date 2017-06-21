local Hitbox = {}
local bump, world, item, playerFilter
local chao = false
local pos_chao = 300

function Hitbox:new()
  item = {}
  item[1] = {x=0, y=100, w=64, h=64, forca = 0, vely = 300}
  item[2] = {x=700, y=301, w=64, h=63, isItem2 = true}
  item[3] = {x=700, y=300, w=64, h=1, isItem3 = true}
  
  playerFilter = function(item, other)
    if     other.isItem2 then return 'slide'
    elseif other.isItem3 then return 'slide'
    end
  -- else return nil
  end
  
  bump = require("bumplib/bump")
  world = bump.newWorld()
  for i=1,3 do
    world:add(item[i], item[i].x, item[i].y, item[i].w, item[i].h)
  end
end

function Hitbox:update()
-- MOVIMENTO DO ITEM 1 --
  if love.keyboard.isDown("d") then
    item[1].x = item[1].x+200*dt
    local newX, newY, cols, len = world:move(item[1], item[1].x, item[1].y, playerFilter)
    item[1].x, item[1].y = newX, newY
  elseif love.keyboard.isDown("a") then
    item[1].x = item[1].x-200*dt
    local newX, newY, cols, len = world:move(item[1], item[1].x, item[1].y, playerFilter)
    item[1].x, item[1].y = newX, newY
  end
  
  -- SISTEMA DE GRAVIDADE --
  if not chao then
    item[1].vely = item[1].vely + 981*dt
    item[1].y = item[1].y+item[1].vely*dt+(981/2)*math.pow(dt,2)
  end
    
  if item[1].y+item[1].h>pos_chao then
    item[1].y = pos_chao-item[1].h
    chao = true
  end
    
  -- COLISÃO DO ITEM 1 --
  local newX, newY, cols, len = world:move(item[1], item[1].x, item[1].y, playerFilter)
  if item[1].y ~= newY then
    if item[1].x > item[2].x+((item[2].w)/2) then
      newX = item[2].x-item[1].w
    elseif item[1].x <= item[2].x+((item[2].w)/2) then
      newX = item[2].x+item[1].w
    end
  end  
    
  item[1].x, item[1].y = newX, newY
  
  -- MOVIMENTO DO ITEM 2 --
  if love.keyboard.isDown("left") then
    for i=2,3 do
      item[i].x = item[i].x-100*dt
      local newX, newY, cols, len = world:move(item[i], item[i].x, item[i].y)
      item[i].x, item[i].y = newX, newY
    end
  end
end

function Hitbox:keypressed()
  if key == "w" and chao then
    chao = false
    item[1].vely = -650
  end
end

function Hitbox:draw()
  for i=1,2 do
    love.graphics.rectangle("fill", item[i].x, item[i].y, item[i].w, item[i].h)
  end
  love.graphics.setColor(255,0,0)
  love.graphics.rectangle("fill", item[3].x, item[3].y, item[3].w, 1)
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(love.graphics.newFont(18))
  love.graphics.print(tostring(chao))
end

return Hitbox
