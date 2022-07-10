local args = ...
-- Girt Tech Inc
-- v1.0
 
 
-- Door setup --
 
local speed = "0.2"
local block = ""
local x1 = ""
local z1 = ""
local x2 = ""
local z2 = ""
local y = 
local height = 
 
 
 
 
-- Don't touch anything past here --
 
if args == nil then
    args = 5
end
 
local currentheight = 0
if args ~= "close" then
    while currentheight < height do
        exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." minecraft:air")
        sleep(tonumber(speed))
        currentheight = (currentheight+1)
    end
end

if args ~= "open" and args ~= "close" then
    sleep(tonumber(args))
    currentheight = (currentheight-1)
end

if args == "close" then 
    currentheight = height
end

if args ~= "open" then
    while currentheight >= 0 do
        exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." "..block)
        sleep(tonumber(speed))
        currentheight = (currentheight-1)
    end
end