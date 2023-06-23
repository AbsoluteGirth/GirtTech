url = "https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/installers/Cash%20Register/installer.lua"


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



local tempFile = http.get(url)
if not tempFile then 
    error("Invalid URL")
end
print("Installing...")
drawProgBar()
f = fs.open("startup", "w")
f.write(tempFile.readAll())
f.close()
sleep(0.5)
term.clear()
term.setCursorPos(1,1)
print("Installation complete!")
print("Restarting in")
for i=1,6 do 
    term.setCursorPos(15, 2)
    term.write(6-i)
    sleep(1)
end

os.reboot()