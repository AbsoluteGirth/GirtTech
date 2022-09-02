-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/ATM/Turtle.lua

-- 500   9  / 13
-- 1000  10 / 14
-- 5000  11 / 15
-- 10000 12 / 16

local modem = peripheral.find("modem")
listenPort = 65534

modem.open(listenPort)

function withdraw(amountStr)
    local amount = tonumber(amountStr)
    no10000 = 0
    no5000 = 0
    no1000 = 0
    no500 = 0
    while amount >= 0 do 
        amount = amount - 10000
        no10000 = no10000 + 1
    end
    amount = amount + 10000
    no10000 = no10000 - 1

    while amount >= 0 do 
        amount = amount - 5000
        no5000 = no5000 + 1
    end
    amount = amount + 5000
    no5000 = no5000 - 1

    while amount >= 0 do 
        amount = amount - 1000
        no1000 = no1000 + 1
    end
    amount = amount + 1000
    no1000 = no1000 - 1

    while amount > 0 do 
        amount = amount - 500
        no500 = no500 + 1
    end

    if no10000 > 0 then 
        turtle.select(12)
        turtle.placeDown()
        turtle.select(8)
        turtle.suckDown(no10000)
        turtle.select(12)
        turtle.digDown()
    end

    if no5000 > 0 then 
        turtle.select(11)
        turtle.placeDown()
        turtle.select(7)
        turtle.suckDown(no5000)
        turtle.select(11)
        turtle.digDown()
    end

    if no1000 > 0 then 
        turtle.select(10)
        turtle.placeDown()
        turtle.select(6)
        turtle.suckDown(no1000)
        turtle.select(10)
        turtle.digDown()
    end

    if no500 > 0 then 
        turtle.select(9)
        turtle.placeDown()
        turtle.select(5)
        turtle.suckDown(no500)
        turtle.select(9)
        turtle.digDown()
    end
end


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

test = read()
withdraw(test)

--while true do 
--    local event,side,chan,rchan,control,dist = os.pullEvent("modem_message")
--    print(chan.." "..rchan.." "..control.." "..dist)
--    if dist < 2 then 
--        card(control)
--    end
--end