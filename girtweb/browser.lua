function drawButton(xPos, yPos, text, bgColor, textColor, redirect)

end

function loadSite(url)

  
    local site = http.get("https://raw.githubusercontent.com/AbsoluteGirth/GirtTech/main/girtweb/")
end

function drawNavBar()
  term.setCursorPos(1,1)
  term.setBackgroundColor(colors.gray)
  term.getSize()
  term.write()

end


  -- local peripheral = require("peripheral")
  local term = peripheral.wrap("top")
  local computer = require("computer")
  

  
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
  

  
  
function splitURL(url)
  -- Initialize the output table
  local urlSplit = {}

  -- Check if the URL is empty
  if url == "" then
    error("Empty URL provided.")
  end

  -- Check if the URL starts or ends with a period
  if url:sub(1, 1) == "." or url:sub(-1) == "." then
    error("URL should not start or end with a period.")
  end

  -- Convert the URL to lowercase
  url = url:lower()

  -- Check for special case: local file
  local localFile = url:match("^local:(.+)")
  if localFile then
    table.insert(urlSplit, "local")
    table.insert(urlSplit, localFile)
    return urlSplit
  end

  -- Split the URL into parts
  for part in url:gmatch("[^%.]+") do
    table.insert(urlSplit, part)
  end

  return urlSplit
end
  
  
  
while true do 
  print(textutils.serialise(splitURL(read())))
end
  
  
  
  