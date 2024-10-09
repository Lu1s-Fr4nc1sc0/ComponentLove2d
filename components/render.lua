local Render = {}
Render.__index = Render
Render.name = 'render'

function Render:new(color,size)
    local render = setmetatable({color = color or {255,255,255}, size = size or 16},Render)
    return render
end

function Render:draw(entity)
    love.graphics.setColor(self.color)
    local pos = entity.components['position']
    if pos then 
        love.graphics.circle('fill',pos.x,pos.y,self.size)
    end
end

return Render