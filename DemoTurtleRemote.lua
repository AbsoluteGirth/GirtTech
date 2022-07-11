modem = peripheral.find("modem")

while true do
    term.setCursorPos(7,3)
    term.setBackgroundColor(buttoncolor)
    term.write("              ")
    term.setCursorPos(7,4)
    term.write("    [enter]   ")
    term.setCursorPos(7,5)
    term.write("              ")

    term.setCursorPos(7,7)
    term.setBackgroundColor(buttoncolor)
    term.write("              ")
    term.setCursorPos(7,8)
    term.write("    [jump]    ")
    term.setCursorPos(7,9)
    term.write("              ")

    term.setCursorPos(7,13)
    term.setBackgroundColor(buttoncolor)
    term.write("              ")
    term.setCursorPos(7,14)
    term.write("    [exit]    ")
    term.setCursorPos(7,15)
    term.write("              ")


    while true do
        local evnet, button, x, y = os.pullEvent("mouse_click")
        if x >= 7 and x <= 20 then
            if y >= 3 and y <= 5 then
                if openmode == "m" then
                    modem.transmit(1234,1,"enter")
                    break
                end
            elseif y >= 7 and y <= 9 then
                if openmode == "t" then
                    modem.transmit(1234,1,"jump")
                    break
                end
            elseif y >= 13 and y <= 15 then
                if openmode == "m" then
                    modem.transmit(1234,1,"exit")
                    break
                end
            end
        end
    end
end