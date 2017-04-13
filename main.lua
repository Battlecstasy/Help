local minu
require("menu")

function love.load()
minu = Menu:new()
end

function love.update(dt)
minu:update(dt)
end

function love.draw()
minu:draw()
end