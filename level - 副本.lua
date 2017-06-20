 require "world"

function levelInit()
    cnt = 60
    word = ''
    words = {'hello', 'world', 'to', 'you', 'name', 'good'}
    objs = {}
    for i, v in pairs(words) do 
        local tmp = wordClass:new(v, v,math.random(1,600), math.random(1,300)-300, math.random(1,2))
        table.insert(objs, tmp)
    end
    score = scoreClass:new(0, 20, maxH-20)
end


 function levelUpdate(dt)
    for i,v in pairs(objs) do  
        v:update(dt) 
    end
    if cnt == 0 and #objs < 20 then 
        for i, v in pairs(words) do 
            local tmp = wordClass:new(v, v,math.random(1,600), math.random(1,300)-300, math.random(1,2))
            table.insert(objs, tmp)
        end
        cnt = 60
    else
        cnt = cnt - 1
        if cnt < 0 then 
            cnt = 0
        end
    end 
 end

 function levelDraw()
    for i,v in pairs(objs) do
        v:draw()
    end
    score:draw()
 end

 function levelKeypressed()
    if k == 'return' then
        for i, v in pairs(objs) do
            if v.name == word then
                objs[i] = nil
                score:addScore(10)
            end
        end
        word = ''
    else
        word = word..k
    end
 end