-- 25 21
printer = peripheral.wrap("bottom")
local time = os.time()
local ink = printer.getInkLevel()
local paper = printer.getPaperLevel()

if ink > 5 then
    if paper > 5 then
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
        printer.setCursorPos(24-(string.len(total)),ypos+1)
        printer.write("Y"..total)
        
        printer.endPage()
    end
end