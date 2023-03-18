-- Girt Tech Inc --
-- Basic Panel
-- v1.0
 


-- Panel Config -- 
 
 
 
term.setTextColor(colors.white)
term.setBackgroundColor(colors.gray)
 
 
if fs.exists("panelPrefs") == false then 
    --setup goes here

    term.clear()
    term.setCursorPos(1,1)
    print("Thank you for your purchase of your new GirtTech basic security panel!")
    print("First we need to get you set up")
    print("Press enter to continue...")
    read()
    term.clear()
    term.setCursorPos(1,1)
    

    print("First things first you need to make a password")
    print("Make sure you write it down as recovery will require GirtTech support and is NOT covered by your warranty")
    local password = read("*")

    term.clear()
    term.setCursorPos(1,1)
    print("Great!")
    print("Now all that's left is to choose how long you want the door to stay open for when you enter the password")
    print("We reccomend 5 for gates and 30 for garages")

    while true do 
        local input = read()
        if tonumber(input) == nil then 
            term.clear()
            term.setCursorPos(1,1)
            print("That wasn't a valid number!")
            print("Please enter a valid number")
        else 
            local opentime = input
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
    prefs.writeLine(password)
    prefs.writeLine(opentime)
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

    local password = preferences[1]
    local opentime = preferences[2]
end
 
 
-- Don't touch anything past here --
 
term.clear()
while true do
    term.clear()
    term.setCursorPos(1,1)
    term.write("Please enter code:")
    term.setCursorPos(1,2)
    term.setCursorBlink(true)
    local input = read("*")
    if input == password then
        exec("playsound minecraft:block.note.bell master @a ~ ~ ~")
        shell.run("opendoor", tonumber(opentime))
    else
        term.clear()
        term.setCursorPos(1,1)
        exec("playsound minecraft:block.note.bass master @a ~ ~ ~")
        sleep(0.1)
        exec("playsound minecraft:block.note.bass master @a ~ ~ ~")
        term.write("Incorrect password!")
        sleep(2)
    end
end