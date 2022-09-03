
-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/ATM/ATM.lua

modem = peripheral.find("modem")

local atmPort = 65101
local turtlePort = 65534
modem.open(atmPort)

local screens = {"insertCard","pleaseWait","PIN"}

term.setCursorBlink(false)

function sendServ(msg1, msg2, msg3)
    modem.transmit(65000, atmPort, {msg1, msg2, msg3})
    local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
    return message
end

function turtle(action, control)
    if action == "card" then
        if control == "take" then 
            -- take card 
            modem.transmit(65534,atmPort,{"card", "take"})
            return os.pullEvent("modem_message")
        elseif control == "return" then 
            --return card
            modem.transmit(65534,atmPort,{"card", "return"})
            return os.pullEvent("modem_message")
        end

    
    elseif action == deposit then 
        -- deposit shit
    
    
    end
end

function drawATM()
    term.setBackgroundColor(colors.white)
    term.clear()
    paintutils.drawFilledBox(8,1,44,21,colors.gray)
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)
    
    term.setCursorPos(10,3)
    term.write("  >")
    term.setCursorPos(10,5)
    term.write("  >")
    term.setCursorPos(10,7)
    term.write("  >")
    term.setCursorPos(10,9)
    term.write("  >")

    term.setCursorPos(30,3)
    term.write("<  ")
    term.setCursorPos(30,5)
    term.write("<  ")
    term.setCursorPos(30,7)
    term.write("<  ")
    term.setCursorPos(30,9)
    term.write("<  ")

    term.setCursorPos(12,12)
    term.write("  1")
    term.setCursorPos(12,14)
    term.write("  4")
    term.setCursorPos(12,16)
    term.write("  7")

    term.setCursorPos(16,12)
    term.write("  2")
    term.setCursorPos(16,14)
    term.write("  5")
    term.setCursorPos(16,16)
    term.write("  8")
    term.setCursorPos(16,18)
    term.write("  0")

    term.setCursorPos(20,12)
    term.write("  3")
    term.setCursorPos(20,14)
    term.write("  6")
    term.setCursorPos(20,16)
    term.write("  9")

    term.setBackgroundColor(colors.red)
    term.setCursorPos(24,12)
    term.write("CANCEL")
    term.setBackgroundColor(colors.yellow)
    term.setCursorPos(24,14)
    term.write("CLEAR ")
    term.setBackgroundColor(colors.green)
    term.setCursorPos(24,18)
    term.write("SELECT")

    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.setCursorPos(36,4)
    term.write(" CARD ")
    term.setCursorPos(36,13)
    term.write(" CASH ")

    term.setTextColor(colors.green)
    term.setCursorPos(36,5)
    term.write(" ---- ")
    term.setCursorPos(36,14)
    term.write(" ---- ")

    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)
    term.setCursorPos(39,7)
    term.write("    ")
    term.setCursorPos(39,9)
    term.write("    ")
    
    term.setCursorPos(35,8)
    term.write("--------")
    

    term.setCursorPos(34,15)
    term.write("__________")
    term.setCursorPos(34,16)
    term.write("          ")

end

function drawScreen(screen)
    paintutils.drawFilledBox(14,2,28,9,colors.white)
    term.setBackgroundColor (colors.white)
    term.setTextColor(colors.black)
    
    if screen == "insertCard" then 
        term.setCursorPos(16,6)
        term.write("INSERT CARD")
    
    elseif screen == "pleaseWait" then 
        term.setCursorPos(17,6)
        term.write("PLEASE WAIT")
        term.setCursorPos(16,5)
        term.write("Reading Card")

    elseif screen == "PIN" then
        term.setCursorPos(15,3)
        term.write("Please input")
        term.setCursorPos(15,4)
        term.write("your pin and")
        term.setCursorPos(15,5)
        term.write("press enter")

    elseif screen == "test" then
        local x = 14
        local y = 2
        while y < 10 do 
            term.setCursorPos(x,y)
            term.setBackgroundColor(colors.white)
            term.write(" ")
            x = x + 1
            if x == 29 then 
                y = y + 1
                x = 14
            end
            term.setCursorPos(x,y)
            term.setBackgroundColor(colors.black)
            term.write(" ")
            x = x + 1
            if x == 29 then 
                y = y + 1
                x = 14
            end
        end

    elseif screen == "bal" then 
        term.setCursorPos(15,3)
        term.write("Your account")
        term.setCursorPos(15,4)
        term.write("balance is:")
        term.setCursorPos(16,6)
        term.write("Y"..balance)
        term.setCursorPos(14,9)
        term.write("Withdraw")
        term.setCursorPos(24,9)
        term.write("Other")
    
    elseif screen == "menu" then 
        term.setCursorPos(14,2)
        term.write("Hey "..name.."!")
        term.setCursorPos(15,5)
        term.write("Balance")
        term.setCursorPos(15,7)
        term.write("Deposit")
        term.setCursorPos(15,9)
        term.write("Withdraw")
        term.setCursorBlink(false)

    elseif screen == "deposit" then 
        --draw deposit screen
        term.setCursorPos(15, 3)
        term.write("Please insert")
        term.setCursorPos(15, 4)
        term.write("cash and")
        term.setCursorPos(15, 5)
        term.write("press select.")

    elseif screen == "withdraw" then
        --draw withdraw screen
        term.setCursorPos(15, 3)
        term.write("Please select")
        term.setCursorPos(15, 4)
        term.write("amount to")
        term.setCursorPos(15, 5)
        term.write("withdraw.")

        term.setCursorPos(15,7)
        term.write("Y1000")
        term.setCursorPos(15,9)
        term.write("Y2000")
        term.setCursorPos(22,7)
        term.write("Y5000")
        term.setCursorPos(22,9)
        term.write("Other")

    elseif screen == "cancel" then 
        --draw cancel screen
        term.setCursorPos(15, 3)
        term.write("Teansaction")
        term.setCursorPos(15, 4)
        term.write("cancelled")
        term.setCursorPos(15, 6)
        term.write("Please take")
        term.setCursorPos(15,7)
        term.write("your card.")
    end
end

function readButtons()
    local event, button, x, y = os.pullEvent("mouse_click")
    
    if y == 3 then 
        if x >= 10 and x <= 12 then 
            return("button1")
        elseif x >= 30 and x <= 32 then
            return("button5")
        end
    elseif y == 5 then 
        if x >= 10 and x <= 12 then 
            return("button2")
        elseif x >= 30 and x <= 32 then
            return("button6")
        end
    elseif y == 7 then 
        if x >= 10 and x <= 12 then 
            return("button3")
        elseif x >= 30 and x <= 32 then
            return("button7")
        end
    elseif y == 9 then 
        if x >= 10 and x <= 12 then 
            return("button4")
        elseif x >= 30 and x <= 32 then
            return("button8")
        end
    
    elseif y == 12 then 
        if x >= 12 and x <= 14 then 
            return("num1")
        elseif x >= 16 and x <= 18 then 
            return("num2")
        elseif x >= 20 and x <= 22 then
            return("num3")
        elseif x >= 24 and x <= 29 then
            return("buttonCancel")
        end

    elseif y == 14 then 
        if x >= 12 and x <= 14 then 
            return("num4")
        elseif x >= 16 and x <= 18 then 
            return("num5")
        elseif x >= 20 and x <= 22 then
            return("num6")
        elseif x >= 24 and x <= 29 then
            return("buttonClear")
        end

    elseif y == 16 then 
        if x >= 12 and x <= 14 then 
            return("num7")
        elseif x >= 16 and x <= 18 then 
            return("num8")
        elseif x >= 20 and x <= 22 then
            return("num9")
        end

    elseif y == 18 then 
        if x >= 16 and x <= 18 then 
            return("num0")
        elseif x >= 24 and x <= 29 then
            return("buttonEnter")
        end
    end
end

function pinInput()
    local pinInput = ""
    term.setCursorPos(18,8)
    while true do
        local buttonPress = readButtons()

        if buttonPress == "num1" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."1"
                term.write("* ")
            end
        elseif buttonPress == "num2" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."2"
                term.write("* ")
            end
        elseif buttonPress == "num3" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."3"
                term.write("* ")
            end
        elseif buttonPress == "num4" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."4"
                term.write("* ")
            end
        elseif buttonPress == "num5" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."5"
                term.write("* ")
            end
        elseif buttonPress == "num6" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."6"
                term.write("* ")
            end
        elseif buttonPress == "num7" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."7"
                term.write("* ")
            end
        elseif buttonPress == "num8" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."8"
                term.write("* ")
            end
        elseif buttonPress == "num9" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."9"
                term.write("* ")
            end
        elseif buttonPress == "num0" then 
            if string.len(pinInput) < 4 then 
                pinInput = pinInput.."0"
                term.write("* ")
            end
        elseif buttonPress == "buttonEnter" then 
            return pinInput
        elseif buttonPress == "buttonClear" then 
            term.setCursorPos(18,8)
            term.write("        ")
            pinInput = ""
            term.setCursorPos(18,8)
        elseif buttonPress == "buttonCancel" then
            return "cancel"
        end
    end
end

function readCard()
    local cardlines = {}
    local card = fs.open("disk/card", "r")
    for line in card.readLine do 
        table.insert(cardlines, line)
    end
    card.close()
    return cardlines
end

while true do 
    while true do
        drawATM()
        
        

        drawScreen("insertCard")
        os.pullEvent("disk")
        sleep(1)
        drawScreen("pleaseWait")
        cardlines = readCard()
        sleep(2)

        turtle("card", "take")
        name = cardlines[1]
        cardNo = cardlines[2]

        drawScreen("PIN")
        local pin = pinInput()

        if sendServ(cardNo, pin, "pin") == false then 
            -- incorrect pin
            turtle("card", "return")
            break
        end
        
        while true do
            drawScreen("menu")
            while true do
                local button = readButtons()
                if button == "button2" then 
                    balance = sendServ(cardNo, " ", "checkBal")
                    drawScreen("bal")
                    break
                elseif button == "button3" then
                    drawScreen("deposit")
                    break
                elseif button == "button4" then 
                    drawScreen("withdraw")
                    break
                elseif button == "buttonCancel" then
                    drawScreen("cancel")
                    sleep(5)
                    break
                end
            end
            turtle("card", "return")
            break
        end
    end
end