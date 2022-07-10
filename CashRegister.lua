-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/CashRegister.lua

-- Cash register --

-- price list
local item1 = "iPiss"
local item1price = 50000
local item2 = "iPiss Case"
local item2price = 2000
local item


local list = {}
local prices = {}
local total = 0
local category = 1
-- size 51, 19

while true do
    local items = {}
    local price = {}
    while true do
        -- Draw categries --
        term.setBackgroundColor(colors.white)
        term.clear()
        term.setBackgroundColor(colors.lightGray)
        term.setCursorPos(1,1)
        term.write("           ")
        term.setCursorPos(1,2)
        term.write("Categories ")
        term.setCursorPos(1,3)
        term.write("---------- ")
        term.setCursorPos(1,4)
        term.write("           ")
        term.setCursorPos(1,5)
        term.write(" iPiss     ")
        term.setCursorPos(1,6)
        term.write("           ")
        term.setCursorPos(1,7)
        term.write(" iPoo      ")
        term.setCursorPos(1,8)
        term.write("           ")
        term.setCursorPos(1,9)
        term.write(" Panels    ")
        term.setCursorPos(1,10)
        term.write("           ")
        term.setCursorPos(1,11)
        term.write(" Openers   ")
        term.setCursorPos(1,12)
        term.write("           ")
        term.setCursorPos(1,13)
        term.write(" Extras    ")
        term.setCursorPos(1,14)
        term.write("           ")
        term.setCursorPos(1,15)
        term.write("           ")
        term.setCursorPos(1,16)
        term.write("           ")
        term.setCursorPos(1,17)
        term.write("           ")
        term.setCursorPos(1,18)
        term.write("           ")
        term.setCursorPos(1,19)
        term.write("           ")

        -- Draw screen
        term.setBackgroundColor(colors.black)
        term.setCursorPos(29,2)
        term.write("                      ")
        term.setCursorPos(29,3)
        term.write("                      ")
        term.setCursorPos(29,4)
        term.write("                      ")
        term.setCursorPos(29,5)
        term.write("                      ")
        term.setCursorPos(29,6)
        term.write("                      ")
        term.setCursorPos(29,7)
        term.write("                      ")
        term.setCursorPos(29,8)
        term.write("                      ")
        term.setCursorPos(29,9)
        term.write("                      ")
        term.setCursorPos(29,10)
        term.write("                      ")
        term.setCursorPos(29,11)
        term.write("                      ")
        term.setCursorPos(29,12)
        term.write("                      ")
        term.setCursorPos(29,13)
        term.write("                      ")
        term.setCursorPos(29,14)
        term.write("                      ")
        term.setCursorPos(29,15)
        term.write("                      ")
        term.setCursorPos(29,16)
        term.write("                      ")
        term.setCursorPos(29,17)
        term.write(" ____________________ ")
        term.setCursorPos(29,18)
        term.write(" Total     | Y        ")


        -- write values on screen
        term.setTextColor(colors.red)
        local ypos = 2
        if list1 ~= nil then
            for i in#list do
                term.setCursorPos(29,i)
                term.write(list[i])
                ypos = ypos + 1
                term.setCursorPos(29,i)
                term.write(prices[i])
                ypos = ypos + 1
            end
        end
        term.setCursorPos(43,18)
        term.write(total)

        -- Button Reference

        --[[
        
        term.setBackgroundColor(colors.gray)
        term.setCursorPos(13,2)
        term.write("               ")
        term.setCursorPos(13,3)
        term.write("               ")
        term.setCursorPos(13,4)
        term.write("               ")
        term.setCursorPos(13,5)
        term.write("               ")

        term.setCursorPos(13,7)
        term.write("               ")
        term.setCursorPos(13,8)
        term.write("               ")
        term.setCursorPos(13,9)
        term.write("               ")
        term.setCursorPos(13,10)
        term.write("               ")

        term.setCursorPos(13,12)
        term.write("               ")
        term.setCursorPos(13,13)
        term.write("               ")
        term.setCursorPos(13,14)
        term.write("               ")
        term.setCursorPos(13,15)
        term.write("               ")

        ]]--

        -- Draw selected category
        if category == 1 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,5)
            term.write(" iPiss   > ")

            term.setBackgroundColor(colors.gray)
            term.setCursorPos(13,2)
            term.write("               ")
            term.setCursorPos(13,3)
            term.write("    [iPiss]    ")
            term.setCursorPos(13,4)
            term.write("    Y50,000    ")
            term.setCursorPos(13,5)
            term.write("               ")

        elseif category == 2 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,7)
            term.write(" iPoo    > ")

        elseif category == 3 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,9)
            term.write(" Panels  > ")

        elseif category == 4 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,11)
            term.write(" Openers > ")

        elseif category == 5 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,13)
            term.write(" Extras  > ")

        end

        while true do
            local evnet, button, x, y = os.pullEvent("mouse_click")
            if x <= 11 then -- Categories
                if y == 5 then
                    category = 1
                    break
                elseif y == 7 then
                    category = 2
                    break
                elseif y == 9 then
                    category = 3
                    break
                elseif y == 11 then
                    category = 4
                    break
                elseif y == 13 then
                    category = 5
                    break
                end
            
            elseif x >= 13 and x <= 28 then
                if y >= 2 and y <=5 then
                    if category == 1 then
                        table.insert(list, item1)
                        table.insert(prices, item1price)
                        total = total + item1price
                        
                        term.setCursorPos(1,17)
                        term.write(list[1])
                        if list[2] ~= nil then
                            term.write(list[2])
                        end
                        break
                    end
                end
            end
        end 
    end
end