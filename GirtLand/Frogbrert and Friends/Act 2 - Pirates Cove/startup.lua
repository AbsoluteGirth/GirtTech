local radius = 15

local scriptlines = {}
local linepos = 1

script = fs.open("/script", "r")
for line in script.readLine do
    table.insert(scriptlines,line)
end

while true do 
    term.clear()
    term.setCursorPos(1,1)
    print("Ready")
    local event = os.pullEvent("redstone")
    linepos = 1
    term.clear()
    term.setCursorPos(1,1)
    print("Scene Playing")
    while true do 
        local speaker = scriptlines[linepos]
        local line = scriptlines[linepos+1]
        local linecolor = scriptlines[linepos+2]
        local linebold = scriptlines[linepos+3]
        local lineitalic = scriptlines[linepos+4]
        local sleepTime = scriptlines[linepos+5]

        linepos = linepos + 6

        if speaker == "end" then 
            break
        end

        if speaker == "command" then 
            exec(line)
            sleep(tonumber(linecolor))
        else
            exec("/tellraw @a[r="..radius.."] [{\"text\":\""..speaker.." "..line.."\",\"color\":\""..linecolor.."\",\"bold\":\""..linebold.."\",\"italic\":\""..lineitalic.."\"}]</color></insert>")
            sleep(tonumber(sleepTime))
        end
    end
end