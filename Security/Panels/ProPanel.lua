-- Girt Tech Inc --
-- Pro Panel
-- V2.0
 
-- Panel Config --



local password = ""
local passwordlen = 6
local opentime = 5
 
local bgcolor = colors.lightGray
local buttoncolor = colors.gray
local textcolor = colors.white


 
 
-- Don't touch anything past here --
 
 
if fs.exists("panelPrefs") == false then 
    --setup goes here
    term.clear()
    print("Thank you for your purchase of your new GirtTech pro panel!")
    print("First we need to get you set up")
    print("Press enter to continue...")
    read()
    term.clear()
    

    print("First things first you need to make a password")
    print("Make sure you write it down as recovery will require GirtTech support and is NOT covered by your warranty")
    local password = read("*")
    local passwordlen = string.len(password)

    term.clear()
    print("Great!")
    print("Now all that's left is to choose how long you want the door to stay open for when you enter the password")
    print("We reccomend 5 for gates and 30 for garages")

    while true do 
        local input = read()
        if (tostring(input)) == nil then 
            term.clear()
            print("That wasn't a valid number!")
            print("Please enter a valid number")
        else 
            local opentime = input
            break
        end
    end

    term.clear()
    print("Great!")
    print("All that's left now is to set up your opener")
    print("After this your new security panel will be ready to go!")
    print("Press enter to continue to opener setup")
    read()

    local prefs = fs.open("panelPrefs", "w")
    prefs.writeLine(password)
    prefs.writeLine(passwordlen)
    prefs.writeLine(opentime)
    prefs.close()

    term.clear()
    shell.run("opendoor", tonumber(opentime))

    term.clear()
    print("Great!")
    print("You're all good to go!")
    print("If you encounter any issues make sure to contact GirtTech support as soon as possible")
    print("Press enter to secure your home with GirtTech")
    read()
    os.reboot()   
    
else 
    local prefs = fs.open("panelPrefs", "w")
    -- add the reading bit here
    for line in prefs.readLine do 
        table.insert(preferences, line)
    end
    prefs.close()

    password = preferences[1]
    passwordlen = preferences[2]
    opentime = preferences[3]
end

    
 
local cIn = ""
while true do
    cIn = ""
    term.setBackgroundColor(bgcolor)
    term.clear()
    term.setBackgroundColor(buttoncolor)
    term.setTextColor(textcolor)
    
    --buttons
    
    term.setCursorPos(21,8)
    term.write("[1]")
    term.setCursorPos(25,8)
    term.write("[2]")
    term.setCursorPos(29,8)
    term.write("[3]")
    term.setCursorPos(21,10)
    term.write("[4]")
    term.setCursorPos(25,10)
    term.write("[5]")
    term.setCursorPos(29,10)
    term.write("[6]")
    term.setCursorPos(21,12)
    term.write("[7]")
    term.setCursorPos(25,12)
    term.write("[8]")
    term.setCursorPos(29,12)
    term.write("[9]")
    term.setCursorPos(25,14)
    term.write("[0]")
    
    term.setBackgroundColor(colors.red)
    term.setCursorPos(21,14)
    term.write("[x]")
    
    term.setBackgroundColor(colors.green)
    term.setCursorPos(29,14)
    term.write("[o]")
 
    --screen
    
    term.setBackgroundColor(bgcolor)
    term.setCursorPos(20,3)
    term.write("Enter code:")
    
    term.setBackgroundColor(colors.black)
    term.setCursorPos(20,6)
    term.write("             ")
    term.setCursorPos(20,5)
    term.write("             ")
    term.setCursorPos(20,4)
    term.write("             ")
    
    term.setCursorPos((27-passwordlen),5)
    
     
       
    term.setCursorBlink(true)
 
 
-- check for touches
 
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        if x >= 21 and x <= 23 then
            if y == 8 then       --1
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."1"
                    term.write("* ")
                end
            elseif y == 10 then  --4
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."4"
                    term.write("* ")
                end
            elseif y == 12 then  --7
                if string.len(cIn) < passwordlen then    
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."7"
                    term.write("* ")
                end
            elseif y == 14 then  --x
                exec("playsound minecraft:ui.button.click master @a ~ ~ ~") 
                break
            end
        
        elseif x >= 25 and x <= 27 then
            if y == 8 then       --2
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."2"
                    term.write("* ")
                end
            elseif y == 10 then  --5
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."5"
                    term.write("* ")
                end
            elseif y == 12 then  --8
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."8"
                    term.write("* ")
                end
            elseif y == 14 then  --0
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."0"
                    term.write("* ")
                end
            end
        
        elseif x >= 29 and x <= 31 then
            if y == 8 then       --3
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."3"
                    term.write("* ")
                end
            elseif y == 10 then  --6
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."6"
                    term.write("* ")
                end
            elseif y == 12 then  --9
                if string.len(cIn) < passwordlen then
                    exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                    cIn = cIn.."9"
                    term.write("* ")
                end
            elseif y == 14 then  --o
                exec("playsound minecraft:ui.button.click master @a ~ ~ ~")
                term.setCursorBlink(false)
                if cIn == password then
                    term.setBackgroundColor(colors.green)
                    term.setCursorPos(22,5)
                    exec("playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~")
                    term.write("Door open")
                    shell.run("opendoor", tonumber(opentime))
                else
                    term.setBackgroundColor(colors.red)
                    term.setCursorPos(22,5)
                    exec("playsound minecraft:block.note.bass master @a ~ ~ ~")
                    sleep(0.1)
                    exec("playsound minecraft:block.note.bass master @a ~ ~ ~")
                    term.write("Incorrect")
                    sleep(2)
                end
                break
            end        
        end
    end
end