function drawATM()
    term.setBackgroundColor(colors.gray)
    term.clear
    paintutils.drawFilledBox(8,1,44,21,colors.lightGray)
    term.setBackgroundColor(colors.gray)
    
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

    term.setCursorPos(8,12)
    term.write("  1")
    term.setCursorPos(8,14)
    term.write("  4")
    term.setCursorPos(8,16)
    term.write("  7")

    term.setCursorPos(12,12)
    term.write("  2")
    term.setCursorPos(12,14)
    term.write("  5")
    term.setCursorPos(12,16)
    term.write("  8")
    term.setCursorPos(12,18)
    term.write("  0")

    term.setCursorPos(16,12)
    term.write("  3")
    term.setCursorPos(16,14)
    term.write("  6")
    term.setCursorPos(16,16)
    term.write("  9")

    term.setCursorPos(20,12)
    term.write("CANCEL")
    term.setCursorPos(20,14)
    term.write(" BACK ")
    term.setCursorPos(20,18)
    term.write("ENTER")

    term.setBackgroundColor(colors.black)
    term.setCursorPos(36,4)
    term.write(" CARD ")
    term.setCursorPos(36,13)
    term.write(" CASH ")

    term.setTextColor(colors.green)
    term.setCursorPos(36,5)
    term.write(" ---- ")
    term.setCursorPos(36,14)
    term.write(" ---- ")

    term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.black)
    term.setCursorPos(39,7)
    term.write("   ")
    term.setCursorPos(39,9)
    term.write("   ")
    
    term.setCursorPos(36,8)
    term.write("------")
    

    term.setCursorPos(34,14)
    term.write("          ")
    term.setCursorPos(34,15)
    term.write("          ")

    term.setCursorPos(34,16)
    term.write("__________")

end


drawATM()
read()