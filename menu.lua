Menu = {}

function Menu:new()
  menu = {sx = 1, increase = true, r = 100, countr = 100, g = 0, countg = 0, b = 255, countb = 0}
  setmetatable(menu, {__index = Menu})
  return menu
end

function Menu:update(dt)
  if menu.sx >= 2 and menu.increase == true then
      menu.increase = false
    elseif menu.sx <= 1 and menu.increase == false then
      menu.increase = true
    end
  
  if (menu.sx < 2 and menu.increase==true) then
    menu.sx = menu.sx+1.1*dt
  elseif (menu.sx <= 3 and menu.increase==false) then
    menu.sx = menu.sx-1.1*dt
  end
  
  --[[if menu.r < 255 and menu.countr == 0 then
    menu.r = menu.r+50*dt
  elseif menu.r >= 255  and menu.countr == 0 then
    menu.count = 1
    menu.r = menu.r-50*dt
  elseif menu.r > 100 and menu.r < 255 and menu.countr == 1 then
    menu.r = menu.r-50*dt
  elseif menu.r <= 0 then
    menu.count = 0
    menu.r = menu.r+50*dt
  end]]
  
  if menu.g < 255 and menu.countg == 0 then
    menu.g = menu.g+50*dt
  elseif menu.g >= 255  and menu.countg == 0 then
    menu.countg = 1
    menu.g = menu.g-50*dt
  elseif menu.g > 0 and menu.g < 256 and menu.countg == 1 then
    menu.g = menu.g-50*dt
  elseif menu.g <= 0 then
    menu.countg = 0
    menu.g = menu.g+50*dt
  end
  
  if menu.b < 255 and menu.countb == 0 then
    menu.b = menu.b+50*dt
  elseif menu.b >= 255  and menu.countb == 0 then
    menu.countb = 1
    menu.b = menu.b-50*dt
  elseif menu.b > 0 and menu.b < 256 and menu.countb == 1 then
    menu.b = menu.b-50*dt
  elseif menu.b <= 0 then
    menu.countb = 0
    menu.b = menu.b+50*dt
  end
  
end

function Menu:draw()
  love.graphics.setBackgroundColor(255,255,255)
  love.graphics.setColor(menu.r,menu.g,menu.b)
  love.graphics.setNewFont("swissek.ttf",32)
  love.graphics.print("Battlecstasy", 200, 100, 0, menu.sx, menu.sx, 0, 30)
end