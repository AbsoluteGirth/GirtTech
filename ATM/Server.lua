-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/ATM/Server.lua

modem = peripheral.find("modem")

modem.open(65000)
modem.open(65001)
modem.open(65002)

while true do 
    local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
    local acctlines = {}
    local acct = fs.open("accounts/"..message[1], "r")
    for line in acct.readLine do 
        table.insert(acctlines, line)
    end
    acct.close()

    for i=1,#acctlines do 
        print(acctlines[i])
    end

    if message[3] == "bal" then
        local cardlines = {}
        local card = fs.open("disk/card", "r")
        for line in card.readLine do 
            table.insert(cardlines, line)
        end
    end
end