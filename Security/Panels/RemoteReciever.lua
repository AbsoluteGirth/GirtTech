local modem = peripheral.find("modem")

local recievechannel = 6969

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