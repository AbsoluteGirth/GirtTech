function drawButton(xPos, yPos, text, bgColor, textColor, redirect)

end

function drawNavBar()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.gray)
    term.getSize()
    term.write()

end






function split(str, delimiter)
    local result = {}
    local start = 1
    local stop = string.find(str, delimiter, start)
    if stop then
      table.insert(result, string.sub(str, start, stop - 1))
    else
      table.insert(result, str)
      return result
    end
    start = stop + 1
    stop = string.find(str, delimiter, start)
    while stop do
      table.insert(result, string.sub(str, start, stop - 1))
      start = stop + 1
      stop = string.find(str, delimiter, start)
    end
    table.insert(result, string.sub(str, start))
    return result
  end



  local peripheral = require("peripheral")
  local term = peripheral.wrap("top")
  local computer = require("computer")
  
  function split(str, delimiter)
    -- Code for the split function goes here
  end
  
  function readWebPage(url)
    local handle = peripheral.call("top", "http.get", url)
    local result = handle.readAll()
    handle.close()
    return result
  end
  
  function runWebPage(url)
    local content = readWebPage(url)
    local func, err = load(content)
    if not func then
      term.write(err)
    else
      pcall(func)
    end
  end
  
  function main()
    term.write("Enter the string to split: ")
    local input = term.read()
    local parts = split(input, ".")
    local url = "https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/girtweb/site/" .. parts[2] .. "/" .. parts[1]
    runWebPage(url)
  end
  
  main()
  
  
  
  