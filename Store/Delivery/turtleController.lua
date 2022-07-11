-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/Store/Delivery/turtleController.lua

modem = peripheral.find("modem")
modem.open(42069)

while true do 
   
    term.clear()
    term.setCursorPos(1,1)
    print("Listening for status:")
    while true do
        local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
        print(message)
        if message == "reset" then 
            break
        end
    end
end