local Entity = {}

function Entity:new()
    local entity = {components = {}}
    setmetatable(entity,{__index = self})

    return entity
end

function Entity:addComponent(component)
    assert(component.name, "The component needs a name !")
    self.components[component.name] = component
    if component.init then component:init(self) end
end

function Entity:update(dt)
    for _, component in pairs(self.components) do
        if component.update then component:update(self, dt) end
    end
end

function Entity:draw()
    for _, component in pairs(self.components) do
        if component.draw then component:draw(self) end
    end
end

return Entity