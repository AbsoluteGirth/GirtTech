local cIn = ""
spk = peripheral.wrap("right")
modem = peripheral.wrap("left")

local bgcolor = colors.lightGray
local buttoncolor = colors.gray
local textcolor = colors.white

local passwordlen = 2

local prices = {
    a0 = 150, 
    a1 = 200, 
    a2 = 200, 
    c0 = 250, 
    c1 = 200, 
    c2 = 250
    }

local products = {
    a0 = "Twix", 
    a1 = "BBQ Crisps", 
    a2 = "C&O Crisps",
    c0 = "Bonster",
    c1 = "Milk",
    c2 = "Conk"
    }



while true do
  
    cIn = ""
    term.setBackgroundColor(bgcolor)
    term.clear()
    term.setBackgroundColor(buttoncolor)
    term.setTextColor(textcolor)
    
    --buttons
    
    term.setCursorPos(14,6)
    term.write("[A]")
    term.setCursorPos(18,6)
    term.write("[0]")
    term.setCursorPos(22,6)
    term.write("[3]")
    term.setCursorPos(14,8)
    term.write("[B]")
    term.setCursorPos(18,8)
    term.write("[1]")
    term.setCursorPos(22,8)
    term.write("[4]")
    term.setCursorPos(14,10)
    term.write("[C]")
    term.setCursorPos(18,10)
    term.write("[2]")
    term.setCursorPos(22,10)
    term.write("[5]")
    term.setCursorPos(14,12)
    term.write("[D]")
    
    term.setBackgroundColor(colors.red)
    term.setCursorPos(18,12)
    term.write("[x]")
    
    term.setBackgroundColor(colors.green)
    term.setCursorPos(22,12)
    term.write("[o]")
 
    --screen
    
    term.setBackgroundColor(bgcolor)
    term.setCursorPos(1,13)
    term.write("NO CHANGE GIVEN")
    
    term.setBackgroundColor(colors.black)
    term.setCursorPos(10,1)
    term.write("                   ")
    term.setCursorPos(10,2)
    term.write("                   ")
    term.setCursorPos(10,3)
    term.write("                   ")
    term.setCursorPos(10,4)
    term.write("                   ")
    
    term.setCursorPos(11,2)
    term.write("Enter Selection:")
    term.setCursorPos(11,3)
     
       
    term.setCursorBlink(true)
 
 
-- check for touches
 
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        if x >= 14 and x <= 16 then
            if y == 6 then       --1
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."a"
                    term.write("A")
                end
            elseif y == 8 then  --4
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."b"
                    term.write("B")
                end
            elseif y == 10 then  --7
                if string.len(cIn) < passwordlen then    
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."c"
                    term.write("C")
                end
            elseif y == 12 then  --x
                if string.len(cIn) < passwordlen then    
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."d"
                    term.write("D")
                end
            end
        
        elseif x >= 18 and x <= 20 then
            if y == 6 then       --2
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."0"
                    term.write("0")
                end
            elseif y == 8 then  --5
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."1"
                    term.write("1")
                end
            elseif y == 10 then  --8
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."2"
                    term.write("2")
                end
            elseif y == 12 then  --0
                spk.playSound("minecraft:ui.button.click") 
                break
            end
        
        elseif x >= 22 and x <= 24 then
            if y == 6 then       --3
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."3"
                    term.write("3")
                end
            elseif y == 8 then  --6
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."4"
                    term.write("4")
                end
            elseif y == 10 then  --9
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."5"
                    term.write("5")
                end
            elseif y == 12 then  --o
                spk.playSound("minecraft:ui.button.click")
                term.setBackgroundColor(colors.black)

                term.setCursorPos(10,1)
                term.write("                   ")
                term.setCursorPos(10,2)
                term.write("                   ")
                term.setCursorPos(10,3)
                term.write("                   ")
                term.setCursorPos(10,4)
                term.write("                   ")

                term.setCursorBlink(false)
                if not products[cIn] then
                    term.setCursorPos(11,2)
                    term.write("INVALID SELECTION")
                    sleep(2)
                    break
                    
                else
                    term.setCursorPos(11,2)
                    term.write(products[cIn])
                    term.setCursorPos(11,3)
                    term.write("Y"..prices[cIn])
                    
                    
                    -- PAYMENT CODE HERE
                    local event, button, x, y = os.pullEvent()
                    if event == "mouse_click" and x >= 18 and x <= 20 and y == 12 then 
                        break 
                    elseif event == "disk" then 
                        if not fs.exists("disk/card") then 
                            
                            term.setCursorPos(10,1)
                            term.write("                   ")
                            term.setCursorPos(10,2)
                            term.write("                   ")
                            term.setCursorPos(10,3)
                            term.write("                   ")
                            term.setCursorPos(10,4)
                            term.write("                   ")
                            
                            term.setCursorPos(11,2)
                            term.write("INVALID CARD")
                            term.setCursorPos(11,3)
                            term.write("Please try again")
                            sleep(2)
                            break
                        
                        else
                            local card = fs.open("disk/card", "r")
                            local cardLines = textutils.unserialise(card.readAll())
                            card.close()

                            if cardLines.bal >= prices[cIn] then 
                                term.setCursorPos(10,1)
                                term.write("                   ")
                                term.setCursorPos(10,2)
                                term.write("                   ")
                                term.setCursorPos(10,3)
                                term.write("                   ")
                                term.setCursorPos(10,4)
                                term.write("                   ")
                                
                                term.setCursorPos(11,2)
                                term.write("READING CARD")
                                term.setCursorPos(11,3)
                                term.write("Please wait")
                                sleep(2)
                                cardLines.bal = cardLines.bal - prices[cIn]
                                card = fs.open("disk/card", "w")
                                card.write(textutils.serialise(cardLines))
                                card.close()
                                modem.transmit(2445, 2445, cIn)
                                sleep(2)
                                break 
                            else 
                                term.setCursorPos(10,1)
                                term.write("                   ")
                                term.setCursorPos(10,2)
                                term.write("                   ")
                                term.setCursorPos(10,3)
                                term.write("                   ")
                                term.setCursorPos(10,4)
                                term.write("                   ")
                                
                                term.setCursorPos(11,2)
                                term.write("INSUFFICIENT FUNDS")
                                term.setCursorPos(11,3)
                                term.write("Please try again")
                                sleep(2)
                                break
                            end
                        end
                    end
                    break
                end
                break
            end        
        end
    end
end