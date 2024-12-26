function GenerateQuads(atlas, tileWidth, tileHeight)
    local sheetWidth = atlas:getWidth() / tileWidth
    local sheetHeight = atlas:getHeight() / tileHeight

    local sheetCounter = 1
    local spriteSheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spriteSheet[sheetCounter] = love.graphics.newQuad(x*tileWidth, y*tileHeight,
            tileWidth, tileHeight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end

    return spriteSheet
end

function table.slice(tbl, first, last)
    local sliced = {}
  
    for i = first or 1, last or #tbl do
      sliced[#sliced+1] = tbl[i]
    end
  
    return sliced
end

function GenerateQuadsBricks(atlas)
    return table.slice(GenerateQuads(atlas, 32, 16), 1, 21)
end

function GenerateQuadsPaddles(atlas)
    local initialY = 64
    local initialX = 0

    local paddleCounter = 1
    local paddleSheet = {}

    for i = 0, 3 do
        --small
        paddleSheet[paddleCounter] = love.graphics.newQuad(initialX, initialY, 32, 16,
        atlas:getDimensions())
        paddleCounter = paddleCounter + 1

        --medium
        paddleSheet[paddleCounter] = love.graphics.newQuad(initialX + 32, initialY, 64, 16,
        atlas:getDimensions())
        paddleCounter = paddleCounter + 1

        --big
        paddleSheet[paddleCounter] = love.graphics.newQuad(initialX + 96, initialY, 96, 16,
        atlas:getDimensions())
        paddleCounter = paddleCounter + 1

        --large
        paddleSheet[paddleCounter] = love.graphics.newQuad(initialX, initialY + 16, 128, 16,
        atlas:getDimensions())
        paddleCounter = paddleCounter + 1

        initialX = 0
        initialY = initialY + 32
    end

    return paddleSheet
end