files = {
    {
        url = "github url gere",
        file = "/keypad",
        update = true
    },
    {
        url = "another url here",
        file  = "/opendoor",
        update = false
    }
}

config = {
    programFile = "/keypad",
    reqFiles = {"/keypad", "/opendoor"}
}

function install(i)
    local tempFile = http.get(files[i].url)
    if not tempFile then 
        error("Invalid URL for file: "..files[i].file)
    end
    print("Installing "..files[i].file)
    drawProgBar()
    f = fs.open(files[i].file, "w")
    f.write(tempFile.readAll())
    f.close()
end 

function checkUpdate()
    for i=1, #files do 
        if files[i].update == true then 
            local newestVer = http.get(files[i].url)
            f = fs.open(files[i].file, "r")
            local installedVer = f.readAll()
            f.close()

            if newestVer.readAll() ~= installedVer then 
                print("Installing update for "..files[i].file)
                install(i)
            end 
        end
    end
end

function drawProgBar()
    print("<------------>")
    local x, y = term.getCursorPos()
    term.setCursorPos(2, y-1)
    for i=1,12 do 
        term.write("*")
        sleep(math.random(1, 8)/10)
    end
    term.setCursorPos(x, y)
    
end

function checkInstalled()
    for i=1, #files do 
        if not fs.exists(files[i].file) then 
            install(i)
        end
    end
end 

function checkFileIntegrity()
    for i=1, #config.reqFiles do 
        if not fs.exists(config.reqFiles[i]) then 
            error("File "..config.reqFiles[i].." is missing, try reinstalling the program.")
        end
    end
end

function run()
    if not fs.exists(config.programFile) then 
        error("Program file not found")
    end
    shell.run(config.programFile)
end

term.clear()
term.setCursorPos(1,1)

print("Starting...")
checkInstalled()
sleep(0.5)
print("Checking for updates...")
checkUpdate()
sleep(0.5)
print("Checking file integrity...")
checkFileIntegrity()

sleep(0.5)

run()
