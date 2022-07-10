-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/CashRegister.lua

-- Cash register --

-- price list --

--iPiss
local item11 = "iPiss"
local item11price = 50000
local item12 = "iPiss Case"
local item12price = 2500
local item13 = ""
local item13price = 0

--iPoo
local item21 = "iPoo"
local item21price = 100000
local item22 = "iDrive"
local item22price = 7000
local item23 = "iPrint"
local item23price = 10000

--Panels
local item31 = "Basic panel"
local item31price = 10000
local item32 = "Pro panel"
local item32price = 15000
local item33 = "Remote panel"
local item33price = 30000

--Openers
local item41 = "Gate opener S"
local item41price = 20000
local item42 = "Gate opener L"
local item42price = 25000
local item43 = "Garage opener"
local item43price = 35000

--Extras
local item51 = "iPrint Ink"
local item51price = 5000
local item52 = "iPrint Paper"
local item52price = 500
local item53 = "iDrive disk"
local item53price = 1500



local list = {}
local prices = {}
local reciept = {}
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
        term.write("Checkout   ")
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
        term.setTextColor(colors.green)
        local ypos = 2
        --if list1[1] ~= nil then
        for i=1,#list do
            term.setCursorPos(29,ypos)
            term.write("......................")
            term.setCursorPos(29,ypos)
            term.write(list[i])
            term.setCursorPos(51-(string.len(prices[i])),ypos)
            term.write(prices[i])
            ypos = ypos + 1
        
        end
        term.setCursorPos(43,18)
        term.write(total)
        term.setTextColor(colors.white)
        
        -- Button Reference

        --[[
        
        term.setBackgroundColor(colors.gray)

        -- Draw add-item buttons

        --button1
        term.setCursorPos(13,2)
        term.write("               ")
        term.setCursorPos(13,3)
        term.write("               ")
        term.setCursorPos(13,4)
        term.write("               ")
        term.setCursorPos(13,5)
        term.write("               ")
        --button2
        term.setCursorPos(13,7)
        term.write("               ")
        term.setCursorPos(13,8)
        term.write("               ")
        term.setCursorPos(13,9)
        term.write("               ")
        term.setCursorPos(13,10)
        term.write("               ")
        --button3
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
            
            -- Draw add-item buttons
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(13,2)
            term.write("               ")
            term.setCursorPos(13,3)
            term.write("    [iPiss]    ")
            term.setCursorPos(13,4)
            term.write("    Y50,000    ")
            term.setCursorPos(13,5)
            term.write("               ")

            term.setCursorPos(13,7)
            term.write("               ")
            term.setCursorPos(13,8)
            term.write("    [Case]     ")
            term.setCursorPos(13,9)
            term.write("    Y2,500     ")
            term.setCursorPos(13,10)
            term.write("               ")

        elseif category == 2 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,7)
            term.write(" iPoo    > ")
            
            -- Draw add-item buttons
            term.setCursorPos(13,2)
            term.write("               ")
            term.setCursorPos(13,3)
            term.write("    [iPoo]     ")
            term.setCursorPos(13,4)
            term.write("   Y100,000    ")
            term.setCursorPos(13,5)
            term.write("               ")

            term.setCursorPos(13,7)
            term.write("               ")
            term.setCursorPos(13,8)
            term.write("   [iDrive]    ")
            term.setCursorPos(13,9)
            term.write("    Y7,000     ")
            term.setCursorPos(13,10)
            term.write("               ")

            term.setCursorPos(13,12)
            term.write("               ")
            term.setCursorPos(13,13)
            term.write("   [iPrint]    ")
            term.setCursorPos(13,14)
            term.write("   Y10,000     ")
            term.setCursorPos(13,15)
            term.write("               ")

        elseif category == 3 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,9)
            term.write(" Panels  > ")

            -- Draw add-item buttons

            --button1
            term.setCursorPos(13,2)
            term.write("               ")
            term.setCursorPos(13,3)
            term.write(" [Basic Panel] ")
            term.setCursorPos(13,4)
            term.write("    Y10,000    ")
            term.setCursorPos(13,5)
            term.write("               ")
            --button2
            term.setCursorPos(13,7)
            term.write("               ")
            term.setCursorPos(13,8)
            term.write("  [Pro Panel]  ")
            term.setCursorPos(13,9)
            term.write("    Y15,000    ")
            term.setCursorPos(13,10)
            term.write("               ")
            --button3
            term.setCursorPos(13,12)
            term.write("               ")
            term.setCursorPos(13,13)
            term.write(" [Remote Panel]")
            term.setCursorPos(13,14)
            term.write("    Y30,000    ")
            term.setCursorPos(13,15)
            term.write("               ")

        elseif category == 4 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,11)
            term.write(" Openers > ")

            -- Draw add-item buttons

            --button1
            term.setCursorPos(13,2)
            term.write("               ")
            term.setCursorPos(13,3)
            term.write("[Gate opener S]")
            term.setCursorPos(13,4)
            term.write("    Y20,000    ")
            term.setCursorPos(13,5)
            term.write("               ")
            --button2
            term.setCursorPos(13,7)
            term.write("               ")
            term.setCursorPos(13,8)
            term.write("[Gate opener L]")
            term.setCursorPos(13,9)
            term.write("    Y25,000    ")
            term.setCursorPos(13,10)
            term.write("               ")
            --button3
            term.setCursorPos(13,12)
            term.write("               ")
            term.setCursorPos(13,13)
            term.write("[Garage Opener]")
            term.setCursorPos(13,14)
            term.write("    Y35,000    ")
            term.setCursorPos(13,15)
            term.write("               ")

        elseif category == 5 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,13)
            term.write(" Extras  > ")

            -- Draw add-item buttons

            --button1
            term.setCursorPos(13,2)
            term.write("               ")
            term.setCursorPos(13,3)
            term.write(" [iPrint Ink]  ")
            term.setCursorPos(13,4)
            term.write("    Y5,000     ")
            term.setCursorPos(13,5)
            term.write("               ")
            --button2
            term.setCursorPos(13,7)
            term.write("               ")
            term.setCursorPos(13,8)
            term.write(" [iPrint Paper]")
            term.setCursorPos(13,9)
            term.write("     Y500      ")
            term.setCursorPos(13,10)
            term.write("               ")
            --button3
            term.setCursorPos(13,12)
            term.write("               ")
            term.setCursorPos(13,13)
            term.write(" [iDrive Disk] ")
            term.setCursorPos(13,14)
            term.write("    Y1,500     ")
            term.setCursorPos(13,15)
            term.write("               ")

        elseif category == 6 then
            term.setBackgroundColor(colors.gray)
            term.setCursorPos(1,17)
            term.write("Checkout  > ")
            for i=1,#list do
                table.insert(reciept, (list[i]))
                table.insert(reciept, (price[i]))
            end
            shell.run("PrintReciept",reciept)
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
                elseif y == 17 then
                    category = 6
                    break
                end
            
            elseif x >= 13 and x <= 28 then -- Add-item buttons
                if y >= 2 and y <=5 then
                    if category == 1 then
                        table.insert(list, item11)
                        table.insert(prices, item11price)
                        total = total + item11price
                        break
                    elseif category == 2 then
                        table.insert(list, item21)
                        table.insert(prices, item21price)
                        total = total + item21price
                        break
                    elseif category == 3 then
                        table.insert(list, item31)
                        table.insert(prices, item31price)
                        total = total + item31price
                        break
                    elseif category == 4 then
                        table.insert(list, item41)
                        table.insert(prices, item41price)
                        total = total + item41price
                        break     
                    elseif category == 5 then
                        table.insert(list, item51)
                        table.insert(prices, item51price)
                        total = total + item51price
                        break 
                    end
                    
                elseif y >= 7 and y <= 10 then
                    if category == 1 then
                        table.insert(list, item12)
                        table.insert(prices, item12price)
                        total = total + item12price
                        break
                    elseif category == 2 then
                        table.insert(list, item22)
                        table.insert(prices, item22price)
                        total = total + item22price
                        break
                    elseif category == 3 then
                        table.insert(list, item32)
                        table.insert(prices, item32price)
                        total = total + item32price
                        break
                    elseif category == 4 then
                        table.insert(list, item42)
                        table.insert(prices, item42price)
                        total = total + item42price
                        break     
                    elseif category == 5 then
                        table.insert(list, item52)
                        table.insert(prices, item52price)
                        total = total + item52price
                        break 
                    end
                elseif y >= 12 and y <= 15 then
                    if category == 1 then
                        table.insert(list, item13)
                        table.insert(prices, item13price)
                        total = total + item13price
                        break
                    elseif category == 2 then
                        table.insert(list, item23)
                        table.insert(prices, item23price)
                        total = total + item23price
                        break
                    elseif category == 3 then
                        table.insert(list, item33)
                        table.insert(prices, item33price)
                        total = total + item33price
                        break
                    elseif category == 4 then
                        table.insert(list, item43)
                        table.insert(prices, item43price)
                        total = total + item43price
                        break     
                    elseif category == 5 then
                        table.insert(list, item53)
                        table.insert(prices, item53price)
                        total = total + item53price
                        break 
                    end
                end
            end
        end 
    end
end