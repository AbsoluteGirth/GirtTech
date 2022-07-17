modem = peripheral.find("nmodem")

modem.open(65000)
modem.open(65001)
modem.opem(65002)

while true do 
    local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
    if message[3] == "bal" then
        message[2]
        local cardlines = {}
        local card = fs.open("disk/card", "r")
        for line in card.readLine do 
            table.insert(cardlines, line)
        end
end