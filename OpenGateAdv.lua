local args = ...
-- Girt Tech Inc
-- v1.0


-- Door setup --

local speed = "0.5"
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

while currentheight < height do
    exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." minecraft:air")
    sleep(tonumber(speed))
    currentheight = (currentheight+1)
end
sleep(tonumber(args))
currentheight = (currentheight-1)
while currentheight >= 0 do
    exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." "..block)
    sleep(tonumber(speed))
    currentheight = (currentheight-1)
end