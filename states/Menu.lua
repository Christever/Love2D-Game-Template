local Menu = {}
local menuSelection

local function play()
    State = require("states.Game")
    State.load()
end


local function instructions()

end

local function credits()

end

local menuEntries = {
    { ['text'] = 'Play',         ['action'] = play },
    { ['text'] = 'Instructions', ['action'] = instructions },
    { ['text'] = 'Credits',      ['action'] = credits },
    { ['text'] = 'Quit',         ['action'] = love.event.quit }
}

function Menu.load()
    menuSelection = 1
    ScreenWidth   = love.graphics.getWidth()
    ScreenHeight  = love.graphics.getHeight()
end

function Menu.update(dt)
    -- return state
end

function Menu.draw()
    love.graphics.setFont(FontMedium)
    love.graphics.setBackgroundColor(Color.BLACK)
    love.graphics.setColor(Color.WHITE)
    for i = 1, #menuEntries do
        if i == menuSelection then
            love.graphics.print(">", 250, 250 + i * 50)
        end
        love.graphics.print(menuEntries[i].text, 300, 250 + i * 50)
        -- love.graphics.printf(menuEntries[i].text, 0,ScreenWidth/5, ScreenWidth, "left" )
    end
end

function Menu.keypressed(key)
    if key == "up" or key == "z" then
        menuSelection = (menuSelection - 2) % (#menuEntries) + 1
    elseif key == "down" or key == "s" then
        menuSelection = (menuSelection) % (#menuEntries) + 1
    elseif key == "return" or key == "space" then
        menuEntries[menuSelection].action()
    elseif key == "escape" then
        love.event.quit()
    end
end

function Menu.mousepressed(x, y, btn)

end

return Menu
