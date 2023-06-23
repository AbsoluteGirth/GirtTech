if peripheral.isPresent("printer") then
    local printer = peripheral.find("printer")
end

sel = 1
termX, termY = term.getSize()
checkoutOpenness = 0

local colors = {
    itemBG = colors.white,
    itemButt = colors.gray,
    catBG = colors.lightGray,
    catSel = colors.gray
}

local items = {
    {
        title = "Food",
        items = {"Cat biscuits", "Dog biscuits", "Rat mix", "Fish Food", "Rabbit food", "Parrot food"},
        prices = {500, 500, 1000, 10000, 5000, 69}
    },

    {
        title = "Accessories",
        items = {"Hammok", "Litter Tray", "Cat bed"},
        prices = {1500, 2000, 2500}
    },

    {
        title = "Pets",
        items = {},
        prices = {}
    }
}

local itemScroll = 0
local catScroll = 0

function printReciept()
    -- 25 21
    local time = textutils.formatTime(os.time())
    local ink = printer.getInkLevel()
    local paper = printer.getPaperLevel()

    if ink > 5 and paper > 5 then
        -- Print header
        printer.newPage()
        printer.setPageTitle("Reciept"..time)
        printer.setCursorPos(8,2)
        printer.write("***********")
        printer.setCursorPos(9,3)
        printer.write("GIRT TECH")
        printer.setCursorPos(8,4)
        printer.write("***********")
        
        local ypos = 6

        for i=1,#list do
            printer.setCursorPos(2,ypos)
            printer.write("...................")
            printer.setCursorPos(2,ypos)
            printer.write(list[i])
            printer.setCursorPos(25-(string.len(prices[i])),ypos)
            printer.write(prices[i])
            printer.setCursorPos(25,ypos)
            printer.write(" ")
            ypos = ypos + 1
        end

        printer.setCursorPos(2,ypos)
        printer.write("_______________________")
        printer.setCursorPos(2,ypos+1)
        printer.write("Total:")
        printer.setCursorPos(24-(string.len(subtotal)),ypos+1)
        printer.write("Y"..subtotal)
        printer.endPage()
    end
end

function drawBG()
    term.setBackgroundColor(1)
    term.clear()
    term.setBackgroundColor(256)
    for i=1, termY do 
        term.setCursorPos(1,i)
        term.write("             ")
    end 

end

function drawCat()
    for i=1,#items do 
        if i == sel then
            term.setBackgroundColor(128)
        else
            term.setBackgroundColor(256)
        end
        term.setCursorPos(2, ((i*2) + 4) + catScroll)
        term.write("            ")
        term.setCursorPos(2, ((i*2) + 4) + catScroll)
        print(items[i].title)
    end
end 

function drawItems()
    -- 16-1-16
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
        end
    end
end

function showCheckout()
    while checkoutOpenness < 25 do 
        checkoutOpenness = checkoutOpenness + 1
        drawBG()
        drawCat()
        drawItems()
        drawCheckout()
        sleep(0.005)
    end
end

function hideCheckout()
    while checkoutOpenness > 0 do 
        checkoutOpenness = checkoutOpenness - 1
        drawBG()
        drawCat()
        drawItems()
        drawCheckout()
        sleep(0.005)
    end
end



function drawCheckout()
    local checkout = {"  ", " C", " H", " E", " C", " K", " O", " U", " T", "  "}
    term.setBackgroundColor(128)
    for i=1, #checkout do 
        term.setCursorPos(termX-1 - checkoutOpenness, i+1)
        term.write(checkout[i])
    end

    term.setBackgroundColor(256)
    
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
            term.write("Product       |Price   ")
        elseif i == 2 then 
            term.write("-----------------------")
        else
            term.write("              |        ")
        end
    end 
    term.setTextColor(1)
end
 -- 25

drawBG()
drawCat()
drawItems()
drawCheckout()

while true do 
    local event, mod, x, y = os.pullEvent()
    if event == "mouse_click" then 
        if x <= 14 then 
            selTemp = ((y-4 - catScroll) /2) 
            if selTemp == math.floor(selTemp) and selTemp <= #items and selTemp > 0 then 
                sel = selTemp 
                itemScroll = 0
            end

        elseif x >= termX-1 and y <= 12 then 
            showCheckout()

        elseif x <= 26 and checkoutOpenness > 0 then 
            hideCheckout()
        
        end

        -- button sensing shit here
    elseif event == "mouse_scroll" then 
        if x >= 14 then 
            itemScroll = itemScroll - mod
            if itemScroll > 0 then 
                itemScroll = 0
            end
        else
            catScroll = catScroll - mod 
            if catScroll > 0 then 
                catScroll = 0
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
