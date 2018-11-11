local class = require 'lib/middleclass'
local uuid = require 'lib/uuid'
Scene = class('Scene')


function Scene:initialize()
	self.children = {}
end
function Scene:addChild(child)
	child.__sceneKey__ = uuid()
	self.children[child.__sceneKey__] = child
	return child
end

function Scene:removeChild(child)
		self.children[child.__sceneKey__] = nil
end

function Scene:update(dt)
	for k, v in pairs(self.children) do
		self.children[k]:step(dt)
	end
end

function Scene:draw()
	for k, v in pairs(self.children) do
		local child = self.children[k]
		love.graphics.draw(
			child.animation.spriteSheet,
			child.animation.quads[child.frame],
			child.x,
			child.y,
			child.angle,
			1,
			1,
			32, --This is the offset for the center of the frame, we should figure out how to generalize it for different sized things
			32
		)
	end
end