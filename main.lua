require "src/Dependencies"

function love.load()

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    love.window.setTitle("BREAKOUT")

    gFonts = {
        ["small"] = love.graphics.newFont("fonts/font.ttf", 8),
        ["medium"] = love.graphics.newFont("fonts/font.ttf", 16),
        ["large"] = love.graphics.newFont("fonts/font.ttf", 32)
    }

    gTextures = {
        ["background"] = love.graphics.newImage("textures/background.png"),
        ["main"] = love.graphics.newImage("textures/breakout.png")
    }

    gFrames = {
        ["paddles"] = GenerateQuadsPaddles(gTextures["main"])
    }

    gSounds = {
        ["menuSelect"] = love.audio.newSource("sounds/menuSelect.wav", "static")
    }

    gStateMachine = StateMachine{
        ["title"] = function() return TitleScreenState()end,
        ["play"] = function() return PlayState()end,
    }

    gStateMachine:change("title")

    love.keyboard.keyPressed = {}

end

function love.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keyPressed = {}
end

function love.keypressed(key)
    love.keyboard.keyPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keyPressed[key] then

        return true
    else 
        return false
    end
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    push:apply("start")
    
    love.graphics.draw(gTextures["background"], 0, 0)

    gStateMachine:render()
        
    push:apply("end")
end