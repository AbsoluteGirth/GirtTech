-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/ATM/Server.lua

modem = peripheral.find("modem")

modem.open(65000)
modem.open(65001)
modem.open(65002)

function request(cardNo, request, amount)

    local acctlines = {}
    local acct = fs.open("accounts/"..cardNo, "r")
    for line in acct.readLine do 
        table.insert(acctlines, line)
    end
    acct.close()

    local name = acctlines [1]
    local acctNo = acctlines[2]
    local pin = acctlines[3]
    local bal = acctlines[4]

    if request == "pin" then
        if amount == pin then 
            return true 
        else 
            return false
        end

    elseif request == "checkBal" then 
        return bal

    elseif request == "deposit" then
        bal = bal + amount
        appendFile()
        return true

    elseif request == "withdraw" then
        newBal = bal - amount
        if newBal < 0 then 
            return false
        else
            bal = newBal
            appendFile()
            return true
        end
    elseif request == "query" then 
        return acctlines

    else 
        return("Invalid option selected")

    end
end

function appenedFile()
    local acct = fs.open("accounts/"..cardNo, "w")
    acct.writeLine(name)
    acct.writeLine(acctNo)
    acct.writeLine(pin)
    acct.writeLine(bal)
    acct.close()
    return true
end


while true do 
    local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
    modem.transmit(rchan, 65000, request(message[1], message[2], message[3]))
end
