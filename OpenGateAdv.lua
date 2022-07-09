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
local center2 = nil
local oddeven = nil
local dist = nil
local axis = nil

if x1 == x2 then
    axis = "z"
    if z1 < z2 then
        dist = ((z2-z1)/2)
        center = (z1+dist)
    elseif z1 > z2 then
        dist = ((z1-z2)/2)
        center = (z2+dist)
    end
elseif z1 == z2 then
    axis = "x"
    if x1 < x2 then
        center = (x1+((x2-x1)/2))
    elseif x1 > x2 then
        center = (x2+((x1-x2)/2))
    end
end

if amount ~= math.floor(center) then
    center1 = center-0.5
    center2 = center+0.5
    dist = dist-0.5
    oddeven = even
else
    oddeven = odd
    
end



local currentpos = 0
if oddeven == even then
    if axis == "z" then
        while currentpos <= dist do
            exec("fill "..x1.." "..y1.." "..(z1+currentpos).." "..x2.." "..y2.." "..(z2-currentpos).." minecraft:air")
            sleep(tonumber(speed))
            currentpos = currentpos + 1
        end
    end
end

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