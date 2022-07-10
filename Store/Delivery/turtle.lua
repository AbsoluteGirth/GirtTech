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

--Leave base

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