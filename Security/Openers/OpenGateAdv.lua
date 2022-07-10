local args = ...
-- Girt Tech Inc
-- v1.0


-- Door setup --

local speed = 0.5
local block = ""
local x1 = 
local y1 = 
local z1 = 
local x2 = 
local y2 = 
local z2 = 





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
        dist = ((x2-x1)/2)
        center = (x1+dist)
    elseif x1 > x2 then
        dist = ((x1-x2)/2)
        center = (x2+((x1-x2)/2))
    end
end

if ((center % 1) ~= 0) then
    center1 = center-0.5
    center2 = center+0.5
    dist = dist + 0.5
else
    center1 = center
    center2 = center
    dist = dist + 1
end

local currentpos = 0

if axis == "z" then
    if args ~= "close" then
        while currentpos < dist do
            exec("fill "..x1.." "..y1.." "..(center1-currentpos).." "..x2.." "..y2.." "..(center1-currentpos).." minecraft:air")
            exec("fill "..x1.." "..y1.." "..(center2+currentpos).." "..x2.." "..y2.." "..(center2+currentpos).." minecraft:air")
            sleep(tonumber(speed))
            currentpos = currentpos + 1
        end
    end

    if args ~= "open" and args ~= "close" then
        sleep(tonumber(args))
        currentpos = currentpos-1
    end

    if args == "close" then 
        currentpos = dist - 1
    end

    if args ~= "open" then 
        while currentpos >= 0 do
            exec("fill "..x1.." "..y1.." "..(center1-currentpos).." "..x2.." "..y2.." "..(center1-currentpos).." "..block)
            exec("fill "..x1.." "..y1.." "..(center2+currentpos).." "..x2.." "..y2.." "..(center2+currentpos).." "..block)
            sleep(tonumber(speed))
            currentpos = currentpos - 1
        end
    end
end


if axis == "x" then
    if args ~= "close" then
        while currentpos < dist do
            exec("fill "..(center1-currentpos).." "..y1.." "..z1.." "..(center1-currentpos).." "..y2.." "..z1.." minecraft:air")
            exec("fill "..(center2+currentpos).." "..y1.." "..z1.." "..(center2+currentpos).." "..y2.." "..z1.." minecraft:air")
            sleep(tonumber(speed))
            currentpos = currentpos + 1
        end

        if args ~= "open" and args ~= "close" then
            sleep(tonumber(args))
            currentpos = currentpos-1
        end

        if args == "close" then 
            currentpos = dist - 1
        end

        if args ~= "open" then
            while currentpos >= 0 do
                exec("fill "..(center1-currentpos).." "..y1.." "..z1.." "..(center1-currentpos).." "..y2.." "..z1.." "..block)
                exec("fill "..(center2+currentpos).." "..y1.." "..z1.." "..(center2+currentpos).." "..y2.." "..z1.." "..block)
                sleep(tonumber(speed))
                currentpos = currentpos - 1
            end
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