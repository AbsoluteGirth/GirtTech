-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/ATM/Turtle.lua

-- 500   damage 5
-- 1000  damage 6
-- 5000  damage 7
-- 10000 damage 8 

local modem = peripheral.find("modem")
listenPort = 65534

modem.open(listenPort)

function withdraw(amountStr)
    local amount = tonumber(amountStr)
    local no10000 = 0
    local no5000 = 0
    local no1000 = 0
    local no500 = 0
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
        while turtle.drop() == false do 
            sleep(0.5)
        end
        turtle.select(12)
        turtle.digDown()
    end

    if no5000 > 0 then 
        turtle.select(11)
        turtle.placeDown()
        turtle.select(8)
        turtle.suckDown(no5000)
        while turtle.drop() == false do 
            sleep(0.5)
        end
        turtle.select(11)
        turtle.digDown()
    end

    if no1000 > 0 then 
        turtle.select(10)
        turtle.placeDown()
        turtle.select(8)
        turtle.suckDown(no1000)
        while turtle.drop() == false do 
            sleep(0.5)
        end
        turtle.select(10)
        turtle.digDown()
    end

    if no500 > 0 then 
        turtle.select(9)
        turtle.placeDown()
        turtle.select(8)
        turtle.suckDown(no500)
        while turtle.drop() == false do 
            sleep(0.5)
        end
        turtle.select(9)
        turtle.digDown()
    end

    
end

function suckMoney(control)
    turtle.suck()
end

function countMoney()
    local slot = 8

    for i=1, slot do
        turtle.select(i)
        item = turtle.getItemDetail()
        if item.name == "rtm:money" then 
            if item.damage == 5 then 
                local no500 = no500 + turtle.getItemCount() 
                turtle.select(9)
                turtle.placeDown()
                turtle.select(i)
                turtle.dropDown()
                turtle.select(9)
                turtle.digDown()
            elseif item.damage == 6 then 
                no1000 = no1000 + turtle.getItemCount() 
                turtle.select(10)
                turtle.placeDown()
                turtle.select(i)
                turtle.dropDown()
                turtle.select(10)
                turtle.digDown()
            elseif item.damage == 7 then 
                no5000 = no5000 + turtle.getItemCount()
                turtle.select(11)
                turtle.placeDown()
                turtle.select(i)
                turtle.dropDown()
                turtle.select(11)
                turtle.digDown()
            elseif item.damage == 8 then 
                no10000 = no10000 + turtle.getItemCount() 
                turtle.select(12)
                turtle.placeDown()
                turtle.select(i)
                turtle.dropDown()
                turtle.select(12)
                turtle.digDown()
            end
        end
    end
    print(no500)
    print(no1000)
    print(no5000)
    print(no10000)
    local total = (no500 * 500) + (no1000 * 1000) + (no5000 * 5000) + (no10000 * 10000)
    print(total)
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

countMoney()

--while true do 
--    local event,side,chan,rchan,control,dist = os.pullEvent("modem_message")
--    print(chan.." "..rchan.." "..control.." "..dist)
--    if dist < 2 then 
--        card(control)
--    end
--end