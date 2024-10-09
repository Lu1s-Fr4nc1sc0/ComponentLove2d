local Control = {}
Control.__index = Control
Control.name = 'control'

function Control:new(speed)
    local control = setmetatable({speed = speed or 200}, Control)
    return control
end

function Control:update(entity,dt)
    local physics = entity.components['physics']

    if physics and physics.body then
        local vx,vy = 0,0
        if love.keyboard.isDown('w') then vy = vy - self.speed end
        if love.keyboard.isDown('a') then vx = vx - self.speed end
        if love.keyboard.isDown('s') then vy = vy + self.speed end
        if love.keyboard.isDown('d') then vx = vx + self.speed end
        physics.body:setLinearVelocity(vx,vy)
    end
end

return Control