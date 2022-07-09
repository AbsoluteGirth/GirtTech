local args = ...
-- Girt Tech Inc
-- v1.0


-- Door setup --

local speed = "0.5"
local block = "minecraft:nether_brick_fence"
local x1 = 21
local y1 = 80
local z1 = 498
local x2 = 21
local y2 = 81
local z2 = 505


-- in dev
local openstyle = 0



-- Don't touch anything past here --

if args == nil then
    args = 5
end

-- find center

local center = nil
local center1 = nil
local center2= nil

if x1 == x2 then
    if z1 < z2 then
        center = (z1+((z2-z1)/2))
    elseif z1 > z2 then
        center = (z2+((z1-z2)/2))
    end
elseif z1 == z2 then
    if x1 < x2 then
        center = (x1+((x2-x1)/2))
    elseif x1 > x2 then
        center = (x2+((x1-x2)/2))
    end
end

if amount ~= math.floor(center) then
    center1 = center-0.5
    center2 = center+0.5
end

print(center)
print(center1)
print(center2)

--local currentheight = 0

--while currentheight < height do
--    exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." minecraft:air")
--    sleep(tonumber(speed))
--    currentheight = (currentheight+1)
--end
--sleep(tonumber(args))
--currentheight = (currentheight-1)
--while currentheight >= 0 do
--    exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." "..block)
--    sleep(tonumber(speed))
--    currentheight = (currentheight-1)
--end