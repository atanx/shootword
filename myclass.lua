local gObj = {}


maxW=love.window.getWidth()
maxH=love.window.getHeight()

--wordCircleClass
wordCircleClass = {}
function wordCircleClass:new(wordTable)
    assert(type(wordTable) == 'table', "wordCircleClass needs a table params to initialize.")
    return wordCircleClass:init(wordTable)
end

function wordCircleClass:init(wordTable)
    local o = setmetatable({}, self)
    o.words = wordTable
    self.__index = self
    return o
end

function wordCircleClass:next()
    local x = table.remove(self.words, 1)
    table.insert(self.words, x)
    return x
end

function wordCircleClass:nextN(n) 
    assert( n > 0 , "number n needs to be larger than 0.") 
    local w = {}
    for i = 1, n do 
        table.insert(w, self:next()) 
    end
    return w 
end

function wordCircleClass:length()
    return #(self.words)
end


-- wordClass
wordClass = {}
function wordClass:new(name, word, x, y, speed)
    return wordClass:init(name, word, x, y, speed)
end

function wordClass:init(name ,word, x, y, speed)
    local o = setmetatable({}, self)
    o.name = name
    o.word = word
    o.x = x
    o.y = y
    o.speed = speed
    self.__index = self
    return o
end

function wordClass:update(dt)
   self.y = self.y + self.speed
   if self.y > maxH then 
    self.y = 0
    end
end

function wordClass:draw()
    love.graphics.print(self.word, self.x, self.y)
end


-- textClass

textClass = {}

function textClass:new(text, x, y)
    return textClass:init(text, x, y)
end

function textClass:init(text, x, y)
    local o = setmetatable({}, self)
    o.text = text 
    o.x = x
    o.y = y
    o.cnt = 0
    self.__index = self
    return o
end 

function textClass:setText(text)
    self.text = text
end

function textClass:draw()
    love.graphics.print(self.text, self.x, self.y)
end
