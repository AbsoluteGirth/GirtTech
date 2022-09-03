-- wget run https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/ATM/Server.lua

modem = peripheral.find("modem")

modem.open(65000)
modem.open(65001)
modem.open(65002)

function request(cardNo, amount, request)

    local acctlines = {}
    local acct = fs.open("accounts/"..cardNo, "r")
    for line in acct.readLine do 
        table.insert(acctlines, line)
    end
    acct.close()

    name = acctlines [1]
    acctNo = acctlines[2]
    pin = acctlines[3]
    bal = acctlines[4]

    if request == "pin" then
        if amount == pin then 
            return true 
        else 
            return false
        end

    elseif request == "checkBal" then 
        return bal

    elseif request == "deposit" then
        bal = bal + tonumber(amount)
        appendFile()
        return true

    elseif request == "withdraw" then
        newBal = bal - tonumber(amount)
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

function appendFile()
    local acct = fs.open("accounts/"..acctNo, "w")
    acct.writeLine(name)
    acct.writeLine(acctNo)
    acct.writeLine(pin)
    acct.writeLine(bal)
    acct.close()
end


while true do 
    local event,side,chan,rchan,message,dist = os.pullEvent("modem_message")
    modem.transmit(rchan, 65000, request(message[1], message[2], message[3]))
end
