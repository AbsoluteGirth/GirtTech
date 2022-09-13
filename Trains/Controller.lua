local modem = peripheral.find("modem")
-- Girt Tech Inc --
-- Remote Transmitter
-- v1.0

-- Remote Config --


local transmitchannel1 =  -- Max = 65535

local transmitchannel2 = 


local dest1 == {" [Villeport]  ", 
                "  [Girtland]  "}

local dest1Color == {colors.brown, 
                     colors.lime}

local dest2 == {"     [OUT]    ",
                "     [IN]     "}

local dest2Color == {colors.red, 
                     colors.green}


local bgcolor = colors.lightGray
local buttoncolor = colors.gray
local textcolor = colors.white


modem.transmit(transmitchannel1, 1, false)
modem.transmit(transmitchannel2, 1, false)

local dest1Option == 1
local dest2Option == 1

-- Don't touch anything past here --

term.setBackgroundColor(bgcolor)
term.setTextColor(textcolor)
term.clear()

while true do


    term.setCursorPos(2,2)
    term.setBackgroundColor(bgcolor)
    term.write("Door Remote")
        
    term.setCursorPos(7,7)
    term.setBackgroundColor(dest1Color[dest1Option])
    term.write("              ")
    term.setCursorPos(7,8)
    term.write(dest1[dest1Option])
    term.setCursorPos(7,9)
    term.write("              ")

    term.setCursorPos(7,13)
    term.setBackgroundColor(dest2Color[dest2Option])
    term.write("              ")
    term.setCursorPos(7,14)
    term.write(dest2[dest2Option])
    term.setCursorPos(7,15)
    term.write("              ")
    


    local evnet, button, x, y = os.pullEvent("mouse_click")
    if x >= 7 and x <= 20 then
        if y >= 7 and y <= 9 then
                
                
            if dest1Option == 1 then
                modem.transmit(transmitchannel1,1,true)
                dest1Option = 2

            elseif dest1Option == 2 then
                modem.transmit(transmitchannel1,1,false)
                dest1Option = 1
            end

        elseif y >= 13 and y <= 15 then
                
            if dest2Option == 1 then
                modem.transmit(transmitchannel2,1,true)
                dest2Option = 2

            elseif dest2Option == 2 then
                modem.transmit(transmitchannel2,1,false)
                dest2Option = 1
            end
        end
    end
end