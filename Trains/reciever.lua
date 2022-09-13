local modem = peripheral.find("modem")
-- Girt Tech Inc --
-- Wireless Reciever
-- v1.0


-- Reciever Config --





local recievechannel = 

local invert = false






-- Don't touch anything past here --

modem.open(recievechannel)
term.clear()
term.setCursorPos(1,1)
term.write("listening on port "..recievechannel)
while true do
    local event,side,chan,rchan,control,dist = os.pullEvent("modem_message")
    if control == true then
        if invert == true then 
            redstone.setOutput("back", true)
        elseif invert == false then
            redstone.setOutput("back", false)
        end
    elseif control == false then
        if invert == true then 
            redstone.setOutput("back", false)
        elseif invert == false then
            redstone.setOutput("back", true)
        end
    end
end

