local args = ...
-- Girt Tech Inc --
-- Gate Opener S
--v2.0

--Gate setup

local coords1 = ""
local coords2 = ""
local block = ""

if args == nil then
    args = "5"
end

if args ~= "close" then
    exec("fill "..coords1.." "..coords2.." minecraft:air")
end

if args ~= "open" and args ~= "close" then
    sleep(tonumber(args))
end

if args ~= "open" then
    exec("fill "..coords1.." "..coords2.." "..block)
end