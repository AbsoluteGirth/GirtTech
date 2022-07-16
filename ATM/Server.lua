modem = peripheral.find("nmodem")

modem.open(65000)
modem.open(65001)
modem.opem(65002)

while true do 
    local event,side,chan,rchan,control,dist = os.pullEvent("modem_message")
    
end