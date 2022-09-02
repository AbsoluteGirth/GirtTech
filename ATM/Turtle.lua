-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/ATM/Turtle.lua

local modem = peripheral.find("modem")
listenPort = 65534

modem.open(listenPort)

function card(control)
    turtle.select(1)
    if control == "take" then
        turtle.select(1)
        if turtle.suck() == true then
            return("completed")
        else
            return("errored")
        end
    elseif control == "return" then
        turtle.select(1)
        if turtle.drop() == true then
            return("completed")
        else 
            return("errored")
        end
    end
end

while true do 
    local event,side,chan,rchan,control,dist = os.pullEvent("modem_message")
    print(chan.." "..rchan.." "..control.." "..dist)
    if dist < 2 then 
        card(control)
    end
end