local Entity = require('src.components')
local Pos = require('components.position')
local Physics = require('components.physics')
local Render = require('components.render')
local Ai = require('components.ai')
local Control = require('components.control')
-------------------

local debug = true

function love.load()
    World = love.physics.newWorld(0,0,true)

    Player = Entity:new()
    Player:addComponent(Pos:new(0,0))
    Player:addComponent(Render:new({0,255,0},16))
    Player:addComponent(Physics:new(World,Player.components['position'].x,
                        Player.components['position'].y,16,16,'circle',
                        'dynamic'))
    Player:addComponent(Control:new())

    Enemy = Entity:new()
    Enemy:addComponent(Pos:new(120,240))
    Enemy:addComponent(Render:new({255,0,0}))
    Enemy:addComponent(Ai:new())
    Enemy.target = Player
end

function love.update(dt)
    World:update(dt)
    Player:update(dt)
    Enemy:update(dt)
end

function love.draw()
    Player:draw()
    Enemy:draw()
    love.graphics.print(Player.components['position'].x..'  '..Player.components['position'].y)
    love.graphics.print(Enemy.components['position'].x..'  '..Enemy.components['position'].y,0,32)
end

function love.keypressed(k)
    if k == 'escape' then
        love.event.quit()
    end
    if (k == 'r' and debug) then
        love.event.quit('restart')
    end
end