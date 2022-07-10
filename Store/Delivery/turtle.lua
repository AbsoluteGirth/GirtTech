modem = peripheral.find("modem")
local amount = 0
local curx = 0
local cury = 0
local curz = 0
local targetx = 0
local targety = 0
local targetz = 0
local distx = 0
local disty = 0
local distz = 0
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

function TurnTo(dir)
    while facing ~= dir do
        turtle.turnRight()
        facing = facing + 1
        if facing == 5 then 
            facing = 1
        end
    end
end

sleep(1)
TurnTo(3)
sleep(1)
TurnTo(2)