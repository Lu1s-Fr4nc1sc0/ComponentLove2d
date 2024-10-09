local Physics = {}
Physics.__index = Physics
Physics.name = 'physics'

function Physics:new(world,x,y,w,h,method,type)
    local physics = setmetatable({},Physics)
        if method == 'circle' then
            physics.body = love.physics.newBody(world,x,y,type)
            physics.shape = love.physics.newCircleShape(w)
            physics.fixture = love.physics.newFixture(physics.body,physics.shape)
        end
    return physics
end

function Physics:update(entity,dt)
    local pos = entity.components['position']

    if pos then
        pos.x,pos.y = self.body:getPosition()
    end
end

return Physics