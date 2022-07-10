local ready = 0

while true do 
    term.setCursorPos(1,1)
    term.clear()
    print("Please insert remote...")
    while true do
        local event, key = os.pullEvent()
        
        if event == "disk" then 
            --disk inserted
            ready = 1
            term.clear()
            term.setCursorPos(1,1)
            print("Ready to write")
            print("Press enter to write")
        elseif event == "disk_eject" then 
            --disk removed
            ready = 0
            break
        elseif key == keys.enter then
            --enter pressed
            if ready == 1 then
                term.clear()
                term.setCursorPos(1,1)
                print("Creating Remote")
                sleep(0.1)
                print("Do not remove!")
                fs.copy("/transmitter","/disk/startup")
                sleep(0.8)
                print("Copy finished!!")
                sleep(1)
                term.clear()
                term.setCursorPos(1,1)
                term.print("Please remove remote...")
            end
        end
    end
end