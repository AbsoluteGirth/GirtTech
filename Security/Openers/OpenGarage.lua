local args = ...
-- Girt Tech Inc
-- Garage Opener 
-- v2.0
 
 
-- Door Config --
 
local speed = 0.5
local block = ""
local x1 = 
local z1 = 
local x2 = 
local z2 = 
local y = 
local height = 
 


-- Don't touch anything past here --

if fs.exists("openerPrefs") == false then 
    --setup goes here

    while true do
        term.setTextColor(colors.white)
        term.setBackgroundColor(colors.gray)

        term.clear()
        term.setCursorPos(1,1)
        print("Thank you for your purchase of your new GirtTech garage opener!")
        print("First we need to get you set up")
        print("Press enter to continue...")
        read()
        term.clear()
        term.setCursorPos(1,1)
        

        print("First things first you need to enter the coordinates of your door")
        print("Make sure you enter everything correctly as recovery will require GirtTech support and is NOT covered by your warranty")
        print("Press enter to continue...")
        term.clear()
        term.setCursorPos(1,1)

        print("First enter the x coordinate for the bottom left of your door")
        while true do 
            local input = read()
            if tonumber(input) == nil then 
                term.clear()
                term.setCursorPos(1,1)
                print("That wasn't a valid number!")
                print("Please enter a valid number")
            else 
                local x1 = input
                break
            end
        end
        
        term.clear()
        term.setCursorPos(1,1)
        print("Next enter the z coordinate for the bottom left of your door")
        while true do 
            local input = read()
            if tonumber(input) == nil then 
                term.clear()
                term.setCursorPos(1,1)
                print("That wasn't a valid number!")
                print("Please enter a valid number")
            else 
                local z1 = input
                break
            end
        end

        term.clear()
        term.setCursorPos(1,1)
        print("Next enter the x coordinate for the bottom right of your door")
        while true do 
            local input = read()
            if tonumber(input) == nil then 
                term.clear()
                term.setCursorPos(1,1)
                print("That wasn't a valid number!")
                print("Please enter a valid number")
            else 
                local x2 = input
                break
            end
        end

        term.clear()
        term.setCursorPos(1,1)
        print("Next enter the z coordinate for the bottom right of your door")
        while true do 
            local input = read()
            if tonumber(input) == nil then 
                term.clear()
                term.setCursorPos(1,1)
                print("That wasn't a valid number!")
                print("Please enter a valid number")
            else 
                local z2 = input
                break
            end
        end

        term.clear()
        term.setCursorPos(1,1)
        print("Next enter the y coordinate for the bottom of your door")
        while true do 
            local input = read()
            if tonumber(input) == nil then 
                term.clear()
                term.setCursorPos(1,1)
                print("That wasn't a valid number!")
                print("Please enter a valid number")
            else 
                local y = input
                break
            end
        end

        term.clear()
        term.setCursorPos(1,1)
        print("Next enter the height of your door")
        while true do 
            local input = read()
            if tonumber(input) == nil then 
    
                term.clear()
                term.setCursorPos(1,1)
                print("That wasn't a valid number!")
                print("Please enter a valid number")
            else 
                local height = tonumber(input)
                break
            end
        end

        term.clear()
        term.setCursorPos(1,1)
        print("Finally enter the material your door is made of")
        print("eg. minecraft:stone")
        print("If you have a problem with orientation of the block you may need to check the orientation with the info stick (number in square brackets) and add that after the block name")
        print("eg. minecraft:stone 2")
        local block = read()

        term.clear()
        term.setCursorPos(1,1)
        print("Great!")
        print("Now all that's left to do it test it out!")
        print("Press enter to test the door")
        read()


        term.clear()
        term.setCursorPos(1,1)
        print("Door opening")

        local args = 5
        local currentheight = 0
            if args ~= "close" then
                while currentheight < height do
                    exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." minecraft:air")
                    sleep(tonumber(speed))
                    currentheight = (currentheight+1)
                end
            end

            if args ~= "open" and args ~= "close" then
                sleep(tonumber(args))
                currentheight = (currentheight-1)
            end

            if args == "close" then 
                currentheight = height - 1
            end

            if args ~= "open" then
                while currentheight >= 0 do
                    exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." "..block)
                    sleep(tonumber(speed))
                    currentheight = (currentheight-1)
                end
            end

        print("If everything worked fine type y")
        print("Or press n to restart the setup")
        local input = read()
        if input == y then 
            break 
        end 
    end
   



    local prefs = fs.open("openerPrefs", "w")
    prefs.writeLine(x1)
    prefs.writeLine(z1)
    prefs.writeLine(x2)
    prefs.writeLine(z2)
    prefs.writeLine(y)
    prefs.writeLine(height)
    prefs.writeLine(block)
    prefs.close()

    term.clear()
    term.setCursorPos(1,1)
    print("Great!")
    print("Press enter to continue")
    read()

    
else 
    local prefs = fs.open("openerPrefs", "r")
    -- add the reading bit here
    for line in prefs.readLine do 
        table.insert(preferences, line)
    end
    prefs.close()

    local x1 = preferences[1]
    local z1 = preferences[2]
    local x2 = preferences[3]
    local z2 = preferences[4]
    local y = preferences[5]
    local height = tonumber(preferences[6])
    local block = preferences[7]
end

if args == nil then
    args = 5
end
 
local currentheight = 0
if args ~= "close" then
    while currentheight < height do
        exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." minecraft:air")
        sleep(tonumber(speed))
        currentheight = (currentheight+1)
    end
end

if args ~= "open" and args ~= "close" then
    sleep(tonumber(args))
    currentheight = (currentheight-1)
end

if args == "close" then 
    currentheight = height - 1
end

if args ~= "open" then
    while currentheight >= 0 do
        exec("fill "..x1.." "..(y+currentheight).." "..z1.." "..x2.." "..(y+currentheight).." "..z2.." "..block)
        sleep(tonumber(speed))
        currentheight = (currentheight-1)
    end
end