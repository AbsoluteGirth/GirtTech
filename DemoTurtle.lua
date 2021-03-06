modem = peripheral.find("modem")

local amount = 0
modem.open(1234)
function enterStage()
    amount = 6
    for i = 1, amount do 
        turtle.up()
    end
    amount = 9
    for i = 1, amount do 
        turtle.forward()
    end
    amount = 4
    for i = 1, amount do 
        turtle.down()
    end
    amount = 6
    for i = 1, amount do 
        turtle.forward()
    end
    amount = 6
    for i = 1, amount do 
        turtle.turnRight()
    end
    turtle.up()
    turtle.down()
end

function jump()
    turtle.up()
    turtle.down()
end

function exit()
    turtle.turnLeft()
    amount = 5
    for i = 1, amount do 
        turtle.forward()
    end
end

while true do
    local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
    print(message)
    if message == "enter" then 
        enterStage()
    elseif message == "jump" then 
        jump()
    elseif message == "exit" then 
        exit()
    end
end