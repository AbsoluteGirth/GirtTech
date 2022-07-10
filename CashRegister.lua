-- Cash register --

-- price list
local item1 = "iPiss"
local item1price = 50000
local item2 = "iPiss Case"
local item2price = 2000

local items = {}
local price = {}
local category = 1
-- size 51, 19


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

    if category == 1 then
        term.setBackgroundColor(colors.gray)
        term.setCursorPos(1,5)
        term.write(" iPiss   > ")
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
        if x <= 11 then
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
        end
    end 
end


term.setCursorPos(1,19)