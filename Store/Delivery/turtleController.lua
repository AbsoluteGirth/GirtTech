modem = peripheral.find("modem")

while true do 
    term.clear()
    term.setCursorPos(1,1)
    print("Please enter target x:")
    term.setCursorPos(2,1)
    local message = read()
    modem.transmit(42069,1,message)
    term.setCursorPos(1,1)
    print("Please enter target z:")
    term.setCursorPos(2,1)
    local message = read()
    modem.transmit(42069,1,message)
    term.setCursorPos(1,1)
    print("Please load delivery bot and press enter to deliver")
    term.setCursorPos(2,1)
    local message = read()
    modem.transmit(42069,1,"go")

    modem.open(42069)
    term.clear()
    term.setCursorPos(1,1)
    while true do
        local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
        print(message)
        if message == "reset" then 
            modem.close(42069)
            break
        end
    end
end