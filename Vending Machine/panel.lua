local cIn = ""
spk = peripheral.wrap("left")

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
    
    term.setCursorPos(14,7)
    term.write("[1]")
    term.setCursorPos(18,7)
    term.write("[2]")
    term.setCursorPos(22,7)
    term.write("[3]")
    term.setCursorPos(14,9)
    term.write("[4]")
    term.setCursorPos(18,9)
    term.write("[5]")
    term.setCursorPos(14,9)
    term.write("[6]")
    term.setCursorPos(14,11)
    term.write("[7]")
    term.setCursorPos(118,11)
    term.write("[8]")
    term.setCursorPos(22,11)
    term.write("[9]")
    term.setCursorPos(18,13)
    term.write("[0]")
    
    term.setBackgroundColor(colors.red)
    term.setCursorPos(14,13)
    term.write("[x]")
    
    term.setBackgroundColor(colors.green)
    term.setCursorPos(22,13)
    term.write("[o]")
 
    --screen
    
    term.setBackgroundColor(bgcolor)
    term.setCursorPos(2,1)
    term.write("NO CHANGE GIVEN")
    
    term.setBackgroundColor(colors.black)
    term.setCursorPos(18,2)
    term.write("                   ")
    term.setCursorPos(18,3)
    term.write("                   ")
    term.setCursorPos(18,4)
    term.write("                   ")
    term.setCursorPos(2,5)
    term.write("                   ")
    
    term.setCursorPos((27-passwordlen),5)
    
     
       
    term.setCursorBlink(true)
 
 
-- check for touches
 
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        if x >= 21 and x <= 23 then
            if y == 8 then       --1
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."1"
                    term.write("* ")
                end
            elseif y == 10 then  --4
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."4"
                    term.write("* ")
                end
            elseif y == 12 then  --7
                if string.len(cIn) < passwordlen then    
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."7"
                    term.write("* ")
                end
            elseif y == 14 then  --x
                spk.playSound("minecraft:ui.button.click") 
                break
            end
        
        elseif x >= 25 and x <= 27 then
            if y == 8 then       --2
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."2"
                    term.write("* ")
                end
            elseif y == 10 then  --5
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."5"
                    term.write("* ")
                end
            elseif y == 12 then  --8
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."8"
                    term.write("* ")
                end
            elseif y == 14 then  --0
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."0"
                    term.write("* ")
                end
            end
        
        elseif x >= 29 and x <= 31 then
            if y == 8 then       --3
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."3"
                    term.write("* ")
                end
            elseif y == 10 then  --6
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."6"
                    term.write("* ")
                end
            elseif y == 12 then  --9
                if string.len(cIn) < passwordlen then
                    spk.playSound("minecraft:ui.button.click")
                    cIn = cIn.."9"
                    term.write("* ")
                end
            elseif y == 14 then  --o
                spk.playSound("minecraft:ui.button.click")
                term.setCursorBlink(false)
                if not products[input] then
                    term.setCursorPos(3,3)
                    term.write("INVALID SELECTION")

                    -- PAYMENT CODE HERE
                else
                    term.setCursorPos(3,3)
                    term.write(products[input])
                    term.setCursorPos(3,4)
                    term.write(prices[input])
                    sleep(2)
                end
                break
            end        
        end
    end
end