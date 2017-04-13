local menu
require("menu")

function love.load()
menu = Menu:new()
end

function love.update(dt)
menu:update(dt)
end

function love.draw()
menu:draw()
end
