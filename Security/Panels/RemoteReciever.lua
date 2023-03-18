local modem = peripheral.find("modem")
-- Girt Tech Inc --
-- Wireless Reciever
-- v1.0


-- Reciever Config --








-- Don't touch anything past here --


if fs.exists("panelPrefs") == false then 
    --setup goes here

    term.setTextColor(colors.white)
    term.setBackgroundColor(colors.gray)

    term.clear()
    term.setCursorPos(1,1)
    print("Thank you for your purchase of your new GirtTech remote security panel!")
    print("First we need to get you set up")
    print("Press enter to continue...")
    read()
    term.clear()
    term.setCursorPos(1,1)
    

    print("First things first you need to choose a 4 digit encryption key")
    print("Make sure you write it down as recovery will require GirtTech support and is NOT covered by your warranty")
    
    while true do 
        local input = read("*")
        if tonumber(input) == nil then 
            term.clear()
            term.setCursorPos(1,1)
            print("That wasn't a valid number!")
            print("Please enter a valid number")
        else 
            local recievechannel = input
            break
        end
    end
    

    term.clear()
    term.setCursorPos(1,1)
    print("Great!")
    print("All that's left now is to set up your opener")
    print("After this your new security panel will be ready to go!")
    print("Press enter to continue to opener setup")
    read()

    local prefs = fs.open("panelPrefs", "w")
    prefs.writeLine(recievechannel)
    prefs.close()

    term.clear()
    shell.run("opendoor")

    term.clear()
    term.setCursorPos(1,1)
    print("Great!")
    print("You're all good to go!")
    print("If you encounter any issues make sure to contact GirtTech support as soon as possible")
    print("Press enter to secure your home with GirtTech")
    read()
    os.reboot()
    
else 
    local prefs = fs.open("panelPrefs", "r")
    -- add the reading bit here
    for line in prefs.readLine do 
        table.insert(preferences, line)
    end
    prefs.close()

    local recievechannel = preferences[1]

end


modem.open(recievechannel)
term.clear()
term.setCursorPos(1,1)
term.write("listening on port "..recievechannel)
while true do
    local event,side,chan,rchan,control,dist = os.pullEvent("modem_message")
    if dist < 25 then
        if control == "open" then
            shell.run("opendoor","open")
        elseif control == "close" then
            shell.run("opendoor","close")
        else
            shell.run("opendoor",control)
        end
    end
end