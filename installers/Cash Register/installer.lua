files = {
    {
        url = "https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/installers/Cash%20Register/CashRegisterNew.lua",
        file = "register",
        update = true
    },
    {
        url = "https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/installers/Cash%20Register/defaultConfig.lua",
        file  = "regConfig",
        update = false
    }
}

config = {
    programFile = "/keypad"
    reqFiles = {"/keypad", "/opendoor"}
}

function install(i)
    local tempFile = http.get(files[i].url)
    f = fs.open(files[i].file, "w")
    f.write(tempFile)
    f.close()
end 

function getFiles()
    for i=1, #files do
        install(i)
    end
end

function checkUpdate()
    for i=1, #files do 
        if files[i].update then 
            local newestVer = http.get(files[i].url)
            f = fs.open(files[i].file, "r")
            local installedVer = f.readAll()
            f.close()

            if newestVer ~= installedVer then 
                install(i)
            end 
        end
    end
end

function checkInstalled()
    for i=1, #files do 
        if not fs.exists(reqFiles[i]) then 
            install(i)
        end
    end
end 

function run()
    shell.run(config.programFile)
end

term.clear()
term.setCursorPos(1,1)

print("Starting...")
checkInstalled()
print("Checking for updates...")
checkUpdate()

run()