-- Girt Tech Inc --
-- Basic Panel
-- v1.0
 


-- Panel Config -- 
 
local password = ""
local opentime = 5
 
 
term.setTextColor(colors.white)
term.setBackgroundColor(colors.gray)
 
 
 
 
 
-- Don't touch anything past here --
 
term.clear()
while true do
    term.clear()
    term.setCursorPos(1,1)
    term.write("Please enter code:")
    term.setCursorPos(1,2)
    term.setCursorBlink(true)
    local input = read("*")
    if input == password then
        exec("playsound minecraft:block.note.bell master @a ~ ~ ~")
        shell.run("opendoor", tonumber(opentime))
    else
        term.clear()
        term.setCursorPos(1,1)
        exec("playsound minecraft:block.note.bass master @a ~ ~ ~")
        sleep(0.1)
        exec("playsound minecraft:block.note.bass master @a ~ ~ ~")
        term.write("Incorrect password!")
        sleep(2)
    end
end