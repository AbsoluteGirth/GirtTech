local sleepTime = 2
local radius = 15

local scriptlines = {}
local linepos = 1

print("final")
script = fs.open("/script", "r")
for line in script.readLine do
    table.insert(scriptlines,line)
end

while true do 
    local event = os.pullEvent()
    linepos = 1
    while true do 
        local speaker = scriptlines[linepos]
        local line = scriptlines[linepos+1]
        local linecolor = scriptlines[linepos+2]
        local linebold = scriptlines[linepos+3]
        local lineitalic = scriptlines[linepos+4]

        linepos = linepos + 5

        if speaker == "end" then 
            break
        elseif spealer == "command" then 
            exec(line)
        else
            exec("/tellraw @a[r="..radius.."] [{\"text\":\""..speaker.." "..line.."\",\"color\":\""..linecolor.."\",\"bold\":\""..linebold.."\",\"italic\":\""..lineitalic.."\"}]</color></insert>")
            sleep(sleepTime)
        end
    end
end