local modem = peripheral.wrap("right")

modem.open(2445)

while true do 
    local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
    if dist < 2 then 
        if message = "a0" then 
            turtle.select(5)
        elseif message = "a1"
            turtle.select(6)
        elseif message = "a2"
            turtle.select(7)
        elseif message = "c0"
            turtle.select(13)
        elseif message = "c1"
            turtle.select(14)
        elseif message = "c2"
            turtle.select(15)
    end

    turtle.placeDown()
    turtle.suckDown(1)
    turtle.digDown()
    turtle.select(1)
    turtle.dropUp()
end