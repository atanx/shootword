require "myclass"
require "utils"

function levelInit() 
    cnt = 60
    word = ''
    -- words = {'hello', 'world', 'to', 'you', 'name', 'good'}
    words = {}
    for line in io.lines('e:/test/wordlist.txt') do
        table.insert(words, line)
    end

    wordCircle = wordCircleClass:new(words)
    objs = {} 
    addWords(3)
    score = 0
    missed = 0
    scoreDisplayer = textClass:new("score: "..score.."  missed: "..missed, 1, maxH-20) 
end

function addWords(n)
    for i, v in pairs(wordCircle:nextN(n)) do 
        local tmp = wordClass:new(v, v,math.random(1,600), math.random(1,300)-300, 1)
        table.insert(objs, tmp)
    end 
end

 function levelUpdate(dt)
    for i,v in pairs(objs) do  
        v:update(dt) 
    end
    if cnt == 0 and #objs < wordCircle:length() then 
        addWords(3)
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
    scoreDisplayer:draw()
 end


 function levelKeypressed(k)
    local missFlag = 1
    if k == 'return' then
        for i, v in pairs(objs) do
            if v.name == word then
                objs[i] = nil
                score = score + 1
                missFlag = 0 
            end
        end
        missed = missed + missFlag
        scoreDisplayer:setText("score: "..score.."  missed: "..missed)
        word = ''
    else
        word = word..k
    end
 end