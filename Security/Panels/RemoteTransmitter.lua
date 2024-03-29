local modem = peripheral.find("modem")
-- Girt Tech Inc --
-- Remote Transmitter
-- v1.0

-- Remote Config --

local password = ""
local passwordlen = 6
local requirepassword = true
local transmitchannel =  -- Max = 65535
local openmode = "m" -- M = manual T = timed
local opentime = 5

local bgcolor = colors.lightGray
local buttoncolor = colors.gray
local textcolor = colors.white


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
            local transmitchannel = input
            break
        end
    end
    
    local prefs = fs.open("panelPrefs", "w")
    prefs.writeLine(transmitchannel)
    prefs.close()


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

    local transmitchannel = preferences[1]

end


term.setBackgroundColor(bgcolor)
term.setTextColor(textcolor)
term.clear()

while true do
    if requirepassword == true then

        local cIn = ""
        while true do
            cIn = ""
            term.setBackgroundColor(bgcolor)
            term.clear()
            term.setBackgroundColor(buttoncolor)
            term.setTextColor(textcolor)
            
            --buttons
            
            term.setCursorPos(8,8)
            term.write("[1]")
            term.setCursorPos(12,8)
            term.write("[2]")
            term.setCursorPos(16,8)
            term.write("[3]")
            term.setCursorPos(8,10)
            term.write("[4]")
            term.setCursorPos(12,10)
            term.write("[5]")
            term.setCursorPos(16,10)
            term.write("[6]")
            term.setCursorPos(8,12)
            term.write("[7]")
            term.setCursorPos(12,12)
            term.write("[8]")
            term.setCursorPos(16,12)
            term.write("[9]")
            term.setCursorPos(12,14)
            term.write("[0]")
            
            term.setBackgroundColor(colors.red)
            term.setCursorPos(8,14)
            term.write("[x]")
            
            term.setBackgroundColor(colors.green)
            term.setCursorPos(16,14)
            term.write("[o]")
         
            --screen
            
            term.setBackgroundColor(bgcolor)
            term.setCursorPos(7,3)
            term.write("Enter code:")
            
            term.setBackgroundColor(colors.black)
            term.setCursorPos(7,6)
            term.write("             ")
            term.setCursorPos(7,5)
            term.write("             ")
            term.setCursorPos(7,4)
            term.write("             ")
            
            term.setCursorPos((14-passwordlen),5)
            
             
               
            term.setCursorBlink(true)
         
         
        -- check for touches
         
            while true do
                local event, button, x, y = os.pullEvent("mouse_click")
                if x >= 8 and x <= 10 then
                    if y == 8 then       --1
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."1"
                            term.write("* ")
                        end
                    elseif y == 10 then  --4
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."4"
                            term.write("* ")
                        end
                    elseif y == 12 then  --7
                        if string.len(cIn) < passwordlen then    
                            cIn = cIn.."7"
                            term.write("* ")
                        end
                    elseif y == 14 then  --x
                        break
                    end
                
                elseif x >= 12 and x <= 14 then
                    if y == 8 then       --2
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."2"
                            term.write("* ")
                        end
                    elseif y == 10 then  --5
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."5"
                            term.write("* ")
                        end
                    elseif y == 12 then  --8
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."8"
                            term.write("* ")
                        end
                    elseif y == 14 then  --0
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."0"
                            term.write("* ")
                        end
                    end
                
                elseif x >= 16 and x <= 18 then
                    if y == 8 then       --3
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."3"
                            term.write("* ")
                        end
                    elseif y == 10 then  --6
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."6"
                            term.write("* ")
                        end
                    elseif y == 12 then  --9
                        if string.len(cIn) < passwordlen then
                            cIn = cIn.."9"
                            term.write("* ")
                        end
                    elseif y == 14 then  --o
                        term.setCursorBlink(false)
                        if cIn ~= password then
                            term.setBackgroundColor(colors.red)
                            term.setCursorPos(9,5)
                            term.write("Incorrect")
                            sleep(2)
                            break  
                            
                        else   
                            term.setBackgroundColor(colors.green)
                            term.setCursorPos(10,5)
                            term.write("Correct")
                            sleep(1)

                            term.setBackgroundColor(bgcolor)
                            term.clear()

                            term.setBackgroundColor(colors.red)
                            term.setCursorPos(8,17)
                            term.write("            ")
                            term.setCursorPos(8,18)
                            term.write("   [Lock]   ")
                            term.setCursorPos(8,19)
                            term.write("            ")

                            if openmode == "m" then
                                term.setCursorPos(2,2)
                                term.setBackgroundColor(bgcolor)
                                term.write("Door Remote")
                                
                                term.setCursorPos(7,7)
                                term.setBackgroundColor(buttoncolor)
                                term.write("              ")
                                term.setCursorPos(7,8)
                                term.write("    [OPEN]    ")
                                term.setCursorPos(7,9)
                                term.write("              ")
                        
                                term.setCursorPos(7,13)
                                term.setBackgroundColor(buttoncolor)
                                term.write("              ")
                                term.setCursorPos(7,14)
                                term.write("    [SHUT]    ")
                                term.setCursorPos(7,15)
                                term.write("              ")
                            
                            elseif openmode == "t" then
                                term.setCursorPos(2,2)
                                term.setBackgroundColor(bgcolor)
                                term.write("Door Remote")
                                
                                term.setCursorPos(7,10)
                                term.setBackgroundColor(buttoncolor)
                                term.write("              ")
                                term.setCursorPos(7,11)
                                term.write("    [OPEN]    ")
                                term.setCursorPos(7,12)
                                term.write("              ")
                            end
                        
                            while true do
                                local evnet, button, x, y = os.pullEvent("mouse_click")
                                if x >= 7 and x <= 20 then
                                    if y >= 7 and y <= 9 then
                                        if openmode == "m" then
                                            modem.transmit(transmitchannel,1,"open")
                                            
                                        end
                                    elseif y >= 10 and y <= 12 then
                                        if openmode == "t" then
                                            modem.transmit(transmitchannel,1,opentime)
                                            sleep(opentime)
                                            
                                        end
                                    elseif y >= 13 and y <= 15 then
                                        if openmode == "m" then
                                            modem.transmit(transmitchannel,1,"close")
                                            
                                        end
                                    
                                    elseif y >= 17 and y <= 19 then
                                        os.reboot()
                                        
                                    end
                                end
                            end
                        end
                    end        
                end
            end
        end
    end

    if openmode == "m" then
        term.setCursorPos(2,2)
        term.setBackgroundColor(bgcolor)
        term.write("Door Remote")
        
        term.setCursorPos(7,7)
        term.setBackgroundColor(buttoncolor)
        term.write("              ")
        term.setCursorPos(7,8)
        term.write("    [OPEN]    ")
        term.setCursorPos(7,9)
        term.write("              ")

        term.setCursorPos(7,13)
        term.setBackgroundColor(buttoncolor)
        term.write("              ")
        term.setCursorPos(7,14)
        term.write("    [SHUT]    ")
        term.setCursorPos(7,15)
        term.write("              ")
    
    elseif openmode == "t" then
        term.setCursorPos(2,2)
        term.setBackgroundColor(bgcolor)
        term.write("Door Remote")
        
        term.setCursorPos(7,10)
        term.setBackgroundColor(buttoncolor)
        term.write("              ")
        term.setCursorPos(7,11)
        term.write("    [OPEN]    ")
        term.setCursorPos(7,12)
        term.write("              ")
    end

    while true do
        local evnet, button, x, y = os.pullEvent("mouse_click")
        if x >= 7 and x <= 20 then
            if y >= 7 and y <= 9 then
                if openmode == "m" then
                    modem.transmit(transmitchannel,1,"open")
                    break
                end
            elseif y >= 10 and y <= 12 then
                if openmode == "t" then
                    modem.transmit(transmitchannel,1,opentime)
                    sleep(opentime)
                    break
                end
            elseif y >= 13 and y <= 15 then
                if openmode == "m" then
                    modem.transmit(transmitchannel,1,"close")
                    break
                end
            end
        end
    end
end