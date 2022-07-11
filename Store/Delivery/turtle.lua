-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/Store/Delivery/turtle.lua

-- 1 = +x
-- 2 = +z
-- 3 = -x
-- 4 = -z


local launchPos = {388,63}

modem = peripheral.find("modem")
local amount = 0
local location = {388,63}
local target = {}
local facing = 1

--Leave base
function LeaveBase()
    amount = 5
    for i = 1, amount do 
        turtle.forward()
    end
    turtle.turnRight()
    modem.transmit(30030,1,"open")
    sleep(2)
    amount = 7
    for i = 1, amount do 
        turtle.forward()
    end
    modem.transmit(30030,1,"close")
    turtle.turnLeft()
    amount = 22
    for i = 1, amount do 
        turtle.forward()
    end
    amount = 4
    for i = 1, amount do 
        turtle.turnLeft()
    end
end

function ReturnHome()
    TurnTo(3)
    amount = 22
    for i = 1, amount do 
        turtle.forward()
    end
    turtle.turnRight()
    modem.transmit(30030,1,"open")
    sleep(2)
    amount = 7
    for i = 1, amount do 
        turtle.forward()
    end
    modem.transmit(30030,1,"close")
    turtle.turnLeft()
    amount = 5
    for i = 1, amount do 
        turtle.forward()
    end
    amount = 2
    for i = 1, amount do 
        turtle.turnRight()
    end
end

function Launch(height)
    for i=1,height do
        turtle.up()
        i = i + 1
    end
end
function TurnTo(dir)
    while facing ~= dir do
        turtle.turnRight()
        facing = facing + 1
        if facing == 5 then 
            facing = 1
        end
    end
end

function GoTo(x, z)
    if location[1] < tonumber(x) then
        TurnTo(1)
        while location[1] < tonumber(x) do
            turtle.forward()
            location[1] = location[1] + 1
        end
    elseif location[1] > tonumber(x) then
        TurnTo(3)
        while location[1] > tonumber(x) do
            turtle.forward()
            location[1] = location[1] - 1
        end
    end
    if location[2] < tonumber(z) then
        TurnTo(2)
        while location[2] < tonumber(z) do
            turtle.forward()
            location[2] = location[3] + 1
        end
    elseif location[3] > tonumber(z) then
        TurnTo(4)
        while location[2] > tonumber(z) do
            turtle.forward()
            location[2] = location[3] - 1
        end
    end
end

function DropOff()
    while turtle.detectDown() == false do
        turtle.down()
    end
    turtle.up()
    turtle.select(1)
    turtle.placeDown()
    turtle.select(2)
    slot = 2
    while turtle.dropDown(all) do 
        slot = slot + 1
        turtle.dropDown(all)
        turtle.select(slot)
    end
end





while true do

    --set target here

    Launch(150)

    GoTo(target[1], target[2])

    DropOff()

    Launch(150)

    GoTo(launchPos[1], launchPos[2])

    ReturnHome()

end