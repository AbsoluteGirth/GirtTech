modem = peripheral.find("modem")

while true do
    term.setBackgroundColor(colors.lightGray)
    term.clear()
    term.setCursorPos(7,3)
    term.setBackgroundColor(colors.gray)
    term.write("              ")
    term.setCursorPos(7,4)
    term.write("    [enter]   ")
    term.setCursorPos(7,5)
    term.write("              ")

    term.setCursorPos(7,7)
    term.setBackgroundColor(colors.gray)
    term.write("              ")
    term.setCursorPos(7,8)
    term.write("    [jump]    ")
    term.setCursorPos(7,9)
    term.write("              ")

    term.setCursorPos(7,13)
    term.setBackgroundColor(colors.gray)
    term.write("              ")
    term.setCursorPos(7,14)
    term.write("    [exit]    ")
    term.setCursorPos(7,15)
    term.write("              ")


    while true do
        local evnet, button, x, y = os.pullEvent("mouse_click")
        if x >= 7 and x <= 20 then
            if y >= 3 and y <= 5 then
                modem.transmit(1234,1,"enter")
                break
              
            elseif y >= 7 and y <= 9 then
                modem.transmit(1234,1,"jump")
                break

            elseif y >= 13 and y <= 15 then
                modem.transmit(1234,1,"exit")
                break
                
            end
        end
    end
end