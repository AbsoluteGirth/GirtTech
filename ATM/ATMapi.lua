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

function readCard()
    -- if card is valid save info and send to server --
    return
end

function cardLight(control)
    if control then 
        term.setCursorPos()
    return
end

function cashLight(control)
    
end