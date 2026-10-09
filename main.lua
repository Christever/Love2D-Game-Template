io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest", "nearest")

require("core.Reg")

State = require("states.Menu")


function love.load()
    FontSmall  = love.graphics.newFont("assets/Fonts/PixelMaster.ttf", 24)
    FontMedium = love.graphics.newFont("assets/Fonts/PixelMaster.ttf", 36)
    FontLarge  = love.graphics.newFont("assets/Fonts/PixelMaster.ttf", 48)
    FontXXL    = love.graphics.newFont("assets/Fonts/PixelMaster.ttf", 64)
    State.load()
end

function love.update(dt)
    State.update(dt)
end

function love.draw()
    State.draw()
end

function love.keypressed(key, isrepeat)
    State.keypressed(key)
end

function love.mousepressed(x, y, btn)
    State.mousepressed(x, y, btn)
end
