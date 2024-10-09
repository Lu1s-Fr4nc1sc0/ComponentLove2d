local Position = {}
Position.__index = Position
Position.name = 'position'

function Position:new(x,y)
    local pos = setmetatable({x = x or 0,y = y or 0},Position)
    return pos
end

function Position:init()
    print('Initializing Pos Component')
end

function Position:update(dt)
    --update the logic here
end

return Position