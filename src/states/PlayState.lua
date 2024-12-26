PlayState = Class{_includes = BaseState}

function PlayState:enter()
    
end

function PlayState:init()
    self.player = Paddle(1)
end

function PlayState:update(dt)
    self.player:update(dt)
end

function PlayState:render()
    self.player:render()
end

function PlayState:exit()
    
end