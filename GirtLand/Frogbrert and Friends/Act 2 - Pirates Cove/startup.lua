local sleepTime = 2
local radius = 15

local scriptlines = {}
local linepos = 1

script = fs.open("script", "r")
for lines in script.readLine do
    table.insert(scriptlines,line)
end

while true do 
    local event = os.pullEvent()
    linepos = 0
    while true do 
        local speaker = scriptlines[linepos]
        local line = scriptlines[linepos+1]
        linepos = linepos + 2

        if speaker == "<Captain Froggo>" then 
            local textcolor = "red"
            local bold = "false"
            local italic = "false"
            
        elseif speaker == "<Pirate Squidette>" then 
            local textcolor = "blue"
            local bold = "false"
            local italic = "false"

        elseif speaker == "<@>" then 
            local textcolor = "white"
            local bold = "false"
            local italic = "true"
        
        elseif speaker == "<Frogbert>" then 
            local textcolor = "lime"
            local bold = "true"
            local italic = "true"

        elseif speaker == "end" then 
            break
        end

        exec("/tellraw @a[r="..radius.."] [{\"text\":\""..speaker.." "..line.."\",\"color\":\""..textcolor.."\"}]</color></insert>")
        sleep(sleepTime)

    end
end