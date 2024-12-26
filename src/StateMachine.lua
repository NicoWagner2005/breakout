StateMachine = Class{}

function StateMachine:init(states)
    
    self.states = states or {} 
    
    self.empty = {
        enter = function()end,
        update = function()end,
        render = function()end,
        exit = function()end
    }

    self.current = self.empty
end

function StateMachine:change(stateName, context)
    assert(self.states[stateName])
    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter()
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end