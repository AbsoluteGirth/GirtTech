-- init shit 
sel = 1
termX, termY = term.getSize()
checkoutOpenness = 0
list = {items = {}, prices = {}}
modem_side = "front"
cardReader = 3
dofile("regConfig.lua")

local itemScroll = -1
local catScroll = 0
local checkoutScroll = 0

function cardPayment()
    local cardPopup = {
        title = "Checkout",
        content = {
            "Transaction in progress",
            "",
            "Continue on reader"
        }
    }
    
    rednet.open(modem_side)
    while not response do 
        rednet.send(cardReader, subtotal)
        id, response = rednet.receive(5)
    end

    popup(32, 10, cardPopup)
    
    id, response = rednet.receive()
    if response == true then 
        paymentResponse = {
            title = "Checkout",
            content = {
                "Transaction Complete",
                "",
                "Press OK when continue"
            },
            buttons = {
                {
                text = "OK",
                color = colors.green
                }
            }
        }
    else 
        paymentResponse = {
            title = "Checkout",
            content = {
                "Transaction Failed",
                "",
                response
            },
            buttons = {
                {
                text = "OK",
                color = colors.green
                }
            }
        }
    end
    
    popup(32, 10, paymentResponse)
    return(response)
end

function checkout()
    
    local checkoutPopup = {
        title = "Checkout",
        content = {
            "Pay cash or card?",
            "",
            "Total: Y"..subtotal
        },
        buttons = {
            {
                text = "Cash",
                color = colors.green
            },

            --{
            --    text = "Card",
            --    color = colors.green
            --}, 
            {
                text = "Cancel",
                color = colors.black
            }
        }
    }

    local response = popup(32, 10, checkoutPopup)
    if response == 1 then 
        -- pay cash popup
    --elseif response == 2 then 
    --    pay card here
    --    if cardPayment() ~= true then 
    --        return
    --    end
    else
        return
    end
    
    
    if fs.exists("transactions") then 
        local f = fs.open("transactions", "r")
        transFile = textutils.unserialise(f.readAll())
        f.close()
        lastTrans = transFile[#transFile]
    else 
        lastTrans = {ID = 0}
        transFile = {}
    end
        
    trans = {
        list = list,
        day = os.date("%d %B %y"),
        time = os.time(),
        ID = lastTrans.ID + 1
    }

    table.insert(transFile, trans)

    f = fs.open("transactions", "w")
    f.write(textutils.serialise(transFile))
    f.close()

    printReciept()
end



function printReciept()
    -- 25 21
    while true do

        if peripheral.find("printer") then 
            printer = peripheral.find("printer")
        else
            checkPrinter()
            break
        end
        local time = textutils.formatTime(os.time(), false)
        local ink = printer.getInkLevel()
        local paper = printer.getPaperLevel()
        if #list.items == 0 then 
            return
        end

        if ink > 5 and paper > 5 then
            -- Print header
            printer.newPage()
            printer.setPageTitle("Reciept: "..recieptConfig.name)
            printer.setCursorPos((26/2) - (string.len(recieptConfig.name)/2)-1,2)
            for i=1, (string.len(recieptConfig.name)) + 2 do 
                printer.write("*")
            end
            printer.setCursorPos((26/2) - (string.len(recieptConfig.name)/2)-1,4)
            for i=1, (string.len(recieptConfig.name)) + 2 do 
                printer.write("*")
            end
            printer.setCursorPos((26/2) - (string.len(recieptConfig.name)/2),3)
            printer.write(recieptConfig.name)
            printer.setCursorPos(2,6)
            printer.write(time)
            printer.setCursorPos(17,6)
            local transIDLong = (string.sub("00000000", 1, 8 - string.len(tostring(trans.ID)))..tostring(trans.ID))
            printer.write(transIDLong)

            for i=1,#list.items do
                --printer.setCursorPos(2,i+6)
                --printer.write("...................")
                printer.setCursorPos(2,i+7)
                printer.write(list.items[i])
                printer.setCursorPos(25-(string.len(list.prices[i])),i+7)
                printer.write(list.prices[i])
                printer.setCursorPos(25,i+7)
                printer.write(" ")
                ypos = i + 8
            end

            printer.setCursorPos(2,ypos)
            printer.write("_______________________")
            printer.setCursorPos(2,ypos+1)
            printer.write("Total:")
            printer.setCursorPos(24-(string.len(subtotal)),ypos+1)
            printer.write("Y"..subtotal)
            
            for i=1, #recieptConfig.msgLines do 
                local xTemp = centerStr(recieptConfig.msgLines[i], 25)
                printer.setCursorPos(xTemp, ypos + 2 + i)
                printer.write(recieptConfig.msgLines[i])
            end

            printer.endPage()
            break
        else 
            if checkPrinter() == false then 
                break 
            end
        end
    end
end

function centerStr(str, width)
    local xStart = (width/2) - ((string.len(str))/2) + 1
    return xStart
end

function popup(width, height, message)
    local xStart = (termX / 2) - (width / 2) - 1
    local yStart = (termY / 2) - (height / 2) - 1

    for i=1,height do 
        
        term.setCursorPos(xStart, i + yStart)

        if i == 1 then 
            term.setBackgroundColor(theme.catSel)
        else
            term.setBackgroundColor(theme.catBG)
        end

        for i=1,width do 
            term.write(" ")
        end
    end
    
    term.setCursorPos(xStart,yStart + 1)
    term.setBackgroundColor(theme.catSel)
    term.write(message.title)
    
    term.setBackgroundColor(theme.catBG)
    for i=1, #message.content do 
        term.setCursorPos(xStart + 1,yStart + 2 + i)
        term.write(message.content[i])
    end
    
    if message.buttons then 
        local buttStart = xStart + width - 1 - string.len(message.buttons[1].text)
        
        for i=1, #message.buttons do 
            if i == 1 then 
                term.setCursorPos(buttStart, yStart + height - 1)
            else
                buttStart = buttStart - 1 - string.len(message.buttons[i].text)
                term.setCursorPos(buttStart, yStart + height - 1)
            end
            
            term.setBackgroundColor(message.buttons[i].color)
            term.write(message.buttons[i].text)
        end

        while true do 
            local event, mod, x, y = os.pullEvent("mouse_click")     
            if y == math.floor(yStart + height - 1) then 
                
                local buttStart = xStart + width - 1 - string.len(message.buttons[1].text)
                for i=1, #message.buttons do 
                    
                    if i ~= 1 then 
                        buttStart = buttStart - 1 - string.len(message.buttons[i].text)
                    end
                    buttx1 = (buttStart)
                    buttx2 = (buttStart + string.len(message.buttons[i].text) - 1)
                    
                    if x >= buttx1 and x <= buttx2 then 
                        return(i)
                    end
                end
            end
        end
    else
        return 
    end
end

function checkPrinter()
    local errorMSG = {
        title = "Alert",
        content = {"Please check printer and retry"},
        buttons = {
            {
                text = "Abort",
                color = colors.red
            },

            {
                text = "Retry",
                color = colors.green
            }
        }
    }
    
    local response = popup(32, 6, errorMSG)
    if response == 1 then
        return(false)
    else
        return
    end
end


function drawLogo()
    paintutils.drawFilledBox(1,1, 13, 4, theme.logo)
    term.setCursorPos(2,1)
    term.write(theme.businessName.line1)
    term.setCursorPos(2,2)
    term.write(theme.businessName.line2)
    term.setCursorPos(2,3)
    term.write(theme.businessName.line3)
    term.setCursorPos(2,4)
    term.write(theme.businessName.line4)
    term.setTextColor(1)
end

function drawBG()
    term.setBackgroundColor(theme.itemBG)
    term.clear()
    term.setBackgroundColor(theme.catBG)
    for i=1, termY do 
        term.setCursorPos(1,i)
        term.write("             ")
    end 

end

function drawCat()
    for i=1,#items do 
        if i == sel then
            term.setBackgroundColor(theme.catSel)
        else
            term.setBackgroundColor(theme.catBG)
        end
        if ((i*2) + 4) + catScroll > 4 then
            term.setCursorPos(2, ((i*2) + 4) + catScroll)
            term.write("            ")
            term.setCursorPos(2, ((i*2) + 4) + catScroll)
            term.write(items[i].title)
            catScrollStop = 0 - ((i*2) + 4) + 8
            drawLogo()
        end
    end
end 

function drawItems()
    term.setBackgroundColor(theme.itemButt)
    for i=1,#items[sel].items do 
        if math.mod(i,2) ~= 0 then 
            term.setCursorPos(15, (i*3) + itemScroll)
            term.write("                ")
            term.setCursorPos(15, (i*3) + itemScroll + 1)
            term.write("                ")
            term.setCursorPos(23 - (string.len(items[sel].items[i])/2), (i*3) + itemScroll + 1)
            term.write(items[sel].items[i])
            term.setCursorPos(15, (i*3) + itemScroll + 2)
            term.write("                ")
            term.setCursorPos(23 - (string.len("[Y"..items[sel].prices[i].."]")/2), (i*3) + itemScroll + 2)
            term.write("[Y"..items[sel].prices[i].."]")
            term.setCursorPos(15, (i*3) + itemScroll + 3)
            term.write("                ")
            itemScrollStop = 0 - (i*4) + 14
        else
            term.setCursorPos(32, (i*3) -3 + itemScroll)
            term.write("                ")
            term.setCursorPos(32, (i*3) -3 + itemScroll + 1)
            term.write("                ")
            term.setCursorPos(40 - (string.len(items[sel].items[i])/2), (i*3) -3 + itemScroll + 1)
            term.write(items[sel].items[i])
            term.setCursorPos(32, (i*3) -3 + itemScroll + 2)
            term.write("                ")
            term.setCursorPos(40 - (string.len("[Y"..items[sel].prices[i].."]")/2), (i*3) -3 + itemScroll + 2)
            term.write("[Y"..items[sel].prices[i].."]")
            term.setCursorPos(32, (i*3) -3 + itemScroll + 3)
            term.write("                ")
            itemScrollStop = 0 - ((i*4) - 2) + 14
        end
    end
end

function showCheckout()
    checkoutScroll = 0
    for i=1, 25 do  
        checkoutOpenness = math.pow(i/5, 2)
        drawBG()
        drawCat()
        drawItems()
        drawCheckout()
        sleep(0.001)
    end
end

function hideCheckout()
    openTemp = 25
    for i=1, 25 do  
        openTemp = 25
        checkoutOpenness = openTemp - math.pow(i/5, 2)
        drawBG()
        drawCat()
        drawItems()
        drawCheckout()
        sleep(0.001)
        openTemp = openTemp-1
    end
end


function drawCheckout()
    local checkout = {"  ", " C", " H", " E", " C", " K", " O", " U", " T", "  "}
    term.setBackgroundColor(theme.checkout)
    for i=1, #checkout do 
        term.setCursorPos(termX-1 - checkoutOpenness, i+1)
        term.write(checkout[i])
    end

    term.setBackgroundColor(theme.catBG)
    
    for i=1, termY do 
        term.setCursorPos(termX+1 - checkoutOpenness,i)
        term.write("                         ")
    end 

    term.setBackgroundColor(32)
    term.setCursorPos(termX+2 - checkoutOpenness, termY-1)
    term.write("Checkout")
    term.setBackgroundColor(16384)
    term.setCursorPos(termX+11 - checkoutOpenness, termY-1)
    term.write("Cancel")

    term.setTextColor(32768)
    term.setBackgroundColor(1)
    term.setCursorPos(termX+18 - checkoutOpenness, termY-1)
    term.write("Y      ")

        for i=1, termY - 4 do 
        term.setCursorPos(termX+2 - checkoutOpenness,i+1)
        if i == 1 then 
            term.write("Product         |Price ")
        elseif i == 2 then 
            term.write("-----------------------")
        else
            term.write("                |      ")
        end
    end 
    
    for i=1,#list.items do 
        if i+3 + checkoutScroll <= 16 and i+3 + checkoutScroll >= 4 then
            term.setCursorPos(termX+2 - checkoutOpenness, i+3 + checkoutScroll) 
            term.write(list.items[i])
            term.setCursorPos(termX+24-string.len(list.prices[i]) - checkoutOpenness, i+3 + checkoutScroll) 
            term.write(list.prices[i])       
        end
    end
    subtotal = 0
    for i=1,#list.prices do 
        subtotal = subtotal + list.prices[i]
    end

    term.setCursorPos(termX+25 - string.len(subtotal) - checkoutOpenness, termY-1)
    term.write(subtotal)
    
    term.setTextColor(1)
end

function voidTransaction()
    list = {items = {}, prices = {}}
    drawBG()
    drawCat()
    drawItems()
    drawCheckout()
end

drawBG()
drawCat()
drawItems()
drawCheckout()

while true do 
    local event, mod, x, y = os.pullEvent()
    if event == "mouse_click" then 
        if x <= 26 and checkoutOpenness > 0 then 
            hideCheckout()    
    
        elseif x <= 14 and checkoutOpenness == 0 then 
            selTemp = ((y-4 - catScroll) /2) 
            if selTemp == math.floor(selTemp) and selTemp <= #items and selTemp > 0 then 
                sel = selTemp 
                itemScroll = -1
            end

        elseif x >= termX-1 and y <= 12 and checkoutOpenness == 0 then 
            showCheckout()
        
        elseif x >=15 and x <=30 and checkoutOpenness == 0 then 
            if ((y - itemScroll) /3 == math.floor((y - itemScroll) /3) and (math.mod((y - itemScroll) /3, 2) ~= 0 or math.mod(((y - itemScroll) /3) - 1, 2) ~= 0)) or (math.mod(math.floor((y - itemScroll) /3), 2) ~= 0) then
                if math.mod(((y - itemScroll) /3), 2) == 0 then 
                    tempItemSel = ((y - itemScroll) /3) - 1
                else 
                    tempItemSel = math.floor(((y - itemScroll) /3))
                end
                if tempItemSel <= #items[sel].items then
                    table.insert(list.items, items[sel].items[tempItemSel]) 
                    table.insert(list.prices, items[sel].prices[tempItemSel])  
                end
            end
 
        elseif x >=32 and x <=47 and checkoutOpenness == 0 then 
            if ((y - itemScroll) /3 == math.floor((y - itemScroll) /3) and (math.mod((y - itemScroll) /3, 2) ~= 0 or math.mod(((y - itemScroll) /3) - 1, 2) ~= 0)) or (math.mod(math.floor((y - itemScroll) /3), 2) ~= 0) then
            
                if math.mod(((y - itemScroll) /3), 2) == 0 then 
                    tempItemSel = ((y - itemScroll) /3)
                else 
                    tempItemSel = math.floor(((y - itemScroll) /3)) + 1
                end
                if tempItemSel <= #items[sel].items then
                    table.insert(list.items, items[sel].items[tempItemSel]) 
                    table.insert(list.prices, items[sel].prices[tempItemSel]) 
                end
            end
        
        elseif x >= 28 and x <= 50 and checkoutOpenness > 0 then

            if y >= 4 and y <= 16 then 
                delSel = y - 3 - checkoutScroll
                if list.items[delSel] ~= nil then 
                    table.remove(list.items, delSel)
                    table.remove(list.prices, delSel)
                    drawCheckout()
                end
            elseif y == termY-1 and x <= 35 then
                checkout()

            elseif y == termY-1 and x >= 36 and x <= 41 then
                voidTransaction()
                

            end
        end

    elseif event == "mouse_scroll" then 
        if x >= 14 then 
            if checkoutOpenness > 0 and x > termX - 26 then
                checkoutScroll = checkoutScroll - mod
                if checkoutScroll > 0 then 
                    checkoutScroll = 0
                end
            else
                itemScroll = itemScroll - mod
                if itemScroll > -1 then 
                    itemScroll = -1
                elseif itemScroll < itemScrollStop then 
                    itemScroll = itemScrollStop
                end
            end
        else
            catScroll = catScroll - mod 
            if catScroll > 0 then 
                catScroll = 0
            elseif catScroll < catScrollStop then 
                catScroll = catScrollStop
            end
        end
    end

    drawBG()
    drawCat()
    drawItems()
    drawCheckout()
end


-- rats
-- mice 
-- rabbit
-- cats 
-- dogs
-- snail
-- goldfish
