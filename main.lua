 require "level" 

function love.load()   
    levelInit()  
end

function love.update(dt) 
    levelUpdate(dt)
end

function love.draw()  
    love.graphics.clear()
    levelDraw()
end

function love.keypressed(k)
    levelKeypressed(k)
end