Paddle = Class{}

function Paddle:init(skin)
    self.x = VIRTUAL_WIDTH / 2 - 32
    self.y = VIRTUAL_HEIGHT - 32

    self.dx = 0

    self.width = 64
    self.height = 16

    self.skin = skin

    self.size = 2
end

function Paddle:update(dt)
    self.x = self.x + self.dx * dt

    if love.keyboard.isDown("right") then
        self.dx = PADDLE_SPEED
    elseif love.keyboard.isDown("left") then
        self.dx = -PADDLE_SPEED
    else
        self.dx = 0
    end
end

function Paddle:render()
    love.graphics.draw(gTextures["main"], gFrames["paddles"][self.size + 4 * (self.skin - 1)], self.x, self.y)
 end
