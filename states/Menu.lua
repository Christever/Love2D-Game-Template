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
    love.graphics.setBackgroundColor(Color.BLACK)
    love.graphics.setColor(Color.WHITE)
    love.graphics.setFont(FontMedium)

    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()

    local lineHeight = 50
    local menuHeight = #menuEntries * lineHeight
    local startY = (screenHeight - menuHeight) / 2

    local menuWidth = 0

    for _, entry in ipairs(menuEntries) do
        menuWidth = math.max(
            menuWidth,
            FontMedium:getWidth(entry.text)
        )
    end

    local startX = (screenWidth - menuWidth) / 2

    for i, entry in ipairs(menuEntries) do
        local y = startY + (i - 1) * lineHeight

        if i == menuSelection then
            love.graphics.print(">", startX - 25, y)
        end

        love.graphics.print(entry.text, startX, y)
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
