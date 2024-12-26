TitleScreenState = Class{_includes = BaseState}

local highligtedText = 1
local options = 2

function TitleScreenState:enter()
    
end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed("down") then
        if highligtedText + 1 <= options then
            highligtedText = highligtedText + 1
        else
            highligtedText = 1
        end
        love.audio.play(gSounds["menuSelect"])
    end

    if love.keyboard.wasPressed("up") then
        if highligtedText - 1 > 0 then
            highligtedText = highligtedText - 1
        else
            highligtedText = options
        end
    love.audio.play(gSounds["menuSelect"])
    end
    
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        if highligtedText == 1 then
            gStateMachine:change("play")
            love.audio.play(gSounds["menuSelect"])
        end
    end
    
end

function TitleScreenState:render()

    love.graphics.setFont(gFonts["large"])

    love.graphics.printf("BREAKOUT", 0, VIRTUAL_HEIGHT / 3,
        VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts["medium"])

    if highligtedText == 1 then
        love.graphics.setColor(138/255, 1, 1, 1)
    end
    love.graphics.printf("PLAY", 0, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT/4 , VIRTUAL_WIDTH, "center")
    
    love.graphics.setColor(1, 1, 1, 1)

    if highligtedText == 2 then
        love.graphics.setColor(138/255, 1, 1, 1)
    end

    love.graphics.printf("HIGH SCORES", 0, (VIRTUAL_HEIGHT - VIRTUAL_HEIGHT/4) + 16 , VIRTUAL_WIDTH, "center")
    
    function TitleScreenState:exit()
        
    end
end