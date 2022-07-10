local modem = peripheral.find("modem")
-- Girt Tech Inc --
-- Wireless Reciever
-- v1.0


-- Reciever Config --





local recievechannel = 






-- Don't touch anything past here --

modem.open(recievechannel)
term.clear()
term.setCursorPos(1,1)
term.write("listening on port "..recievechannel)
while true do
    local event,side,chan,rchan,control,dist = os.pullEvent("modem_message")
    if control == "open" then
        shell.run("Opener","open")
    elseif control == "close" then
        shell.run("Opener","close")
    else
        shell.run("Opener",control)
    end
end