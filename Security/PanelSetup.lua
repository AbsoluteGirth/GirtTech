local selection = 1
local menu = 1
local panel = nil
local opener = nil

while true do
    
    if selection == 0 then 
        selection = 3
    end

    if selection == 4 then
        selection = 1
    end

    term.clear()

    if menu == 1 then
        term.setCursorPos(1,1)
        term.write("Select panel type")

        term.setCursorPos(1, 3)
        if selection == 1 then
            term.write("[Basic]")
        else
            term.write(" Basic")
        end
        
        term.setCursorPos(1,4)
        if selection == 2 then
            term.write("[Pro]")
        else
            term.write(" Pro")
        end

        term.setCursorPos(1,5)
        if selection == 3 then
            term.write("[Wireless]")
        else
            term.write(" Wireless")
        end
    else
        term.setCursorPos(1,1)
        term.write("Select opener type")

        term.setCursorPos(1, 3)
        if selection == 1 then
            term.write("[Simple gate]")
        else
            term.write(" Simple gate")
        end
        
        term.setCursorPos(1,4)
        if selection == 2 then
            term.write("[Adv gate]")
        else
            term.write(" Adv gate")
        end

        term.setCursorPos(1,5)
        if selection == 3 then
            term.write("[Garage]")
        else
            term.write(" Garage")
        end
    end

    while true do
        local event, key = os.pullEvent("key")
        if key == keys.up then
            selection = selection - 1
            break
        
        elseif key == keys.down then
            selection = selection + 1
            break

        elseif key == keys.enter then
            
            if menu == 1 then 
                menu = 2
                panel = selection   
                selection = 1
                break
            else
                opener = selection   
                term.clear()
                term.setCursorPos(1,1)
                print("Installing")
                sleep(0.5)
                
                if panel == 1 then
                    fs.copy("disk/panels/BasicPanel", "/startup")
                    os.setComputerLabel("Girt Tech Basic Security Panel")
                elseif panel == 2 then
                    fs.copy("disk/panels/ProPanel", "/startup")
                    os.setComputerLabel("Girt Tech Pro Security Panel")
                elseif panel == 3 then
                    fs.copy("disk/panels/wireless/reciever", "/startup")
                    os.setComputerLabel("Girt Tech Wireless Security Panel")
                end

                if opener == 1 then
                    fs.copy("disk/openers/OpenGateS", "/opendoor")
                elseif opener == 2 then
                    fs.copy("disk/openers/OpenGateL", "/opendoor")
                elseif opener == 3 then
                    fs.copy("disk/openers/OpenGarage", "/opendoor")
                end

                print("Install complete")
                local i = 5
                while i >=0 do 
                    term.setCursorPos(1,3)
                    term.write("Rebooting in "..i)
                    sleep(1)
                    i = i - 1
                end
                os.reboot()
            end 
        end
    end
end