local Ai = {}
Ai.__index = Ai
Ai.name = 'ai'
function Ai:new(speed)
    local ai = setmetatable({speed = speed or 100}, Ai)
    return ai
end

function Ai:update(entity,dt)
    local pos = entity.components['position']
    local player = entity.target
    if pos and player then
        local playerPos = Player.components['position']
        if playerPos then
            local dx = playerPos.x - pos.x
            local dy = playerPos.y - pos.y
            local dist = math.sqrt(dx * dx + dy * dy)
            if dist > 0 then
                pos.x = pos.x + (dx/dist) * self.speed * dt
                pos.y = pos.y + (dy/dist) * self.speed * dt
            end
        end
    end
end

return Ai