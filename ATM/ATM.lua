modem = peripheral.find("modem")

local fromTurt = 65101
local fromServ = 65100
modem.open(fromTurt)
modem.open(fromServ)
local screens = {"insertCard","pleaseWait","PIN"}
term.setCursorBlink(false)

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
        term.setCursorPos(17,5)
        term.write("PLEASE WAIT")
        term.setCursorPos(16,5)
        term.write("Reading Card")

    elseif screen == "PIN" then
        term.setCursorPos(15,3)
        term.write("Please enter")
        term.setCursorPos(15,4)
        term.write("your pin and")
        term.setCursorPos(15,5)
        term.write("press enter")
        term.setCursorPos(18,8)

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
        elseif x >= 16 and x <= 18 then 
            return("num0")
        elseif x >= 24 and x <= 29 then
            return("buttonEnter")
        end
    end
end

drawATM()
while true do 
    term.setCursorPos(1,1)
    print(readButtons())
end